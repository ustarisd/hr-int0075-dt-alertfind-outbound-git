<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:bc="urn:com.workday/bc"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xtt="urn:com.workday/xtt"
    xmlns:wd="urn:com.workday.report/CR_INT0075_AlertFind_Outbound"
    xmlns:etv="urn:com.workday/etv" xmlns:out="http://www.workday.com/integration/output"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    version="2.0" exclude-result-prefixes="xsd xsl bc out">


    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Jan 22, 2015</xd:p>
            <xd:p><xd:b>Author:</xd:b> Darren Ustaris</xd:p>
            <xd:p>INT0075 AlertFind Outbound Document Transform XSLT</xd:p>
        </xd:desc>
    </xd:doc>
    
    <xd:doc>
        <xd:desc>
            <xd:p> Set the output method to xml</xd:p>
        </xd:desc>
    </xd:doc>

    <xsl:output method="xml" indent="yes"/>

    <xd:doc>
        <xd:desc>
            <xd:p>AlertFind will pass a csv file with a header and detail records </xd:p>
        </xd:desc>
     </xd:doc>
    
    

    <xsl:template match="wd:Report_Data">
        
        <File >
         
            <!-- Header Record-->
            <HeaderRecord xtt:endTag="&#xA;" xtt:separator=",">
                
                <AccountID xtt:attribute="Account ID"></AccountID>
                <FirstName xtt:attribute="First Name"></FirstName>
                <LastName xtt:attribute="Last Name"></LastName>
                <WorkEmail xtt:attribute="Work Email"></WorkEmail>
                <PersonalEmail xtt:attribute="Personal Email"></PersonalEmail>
                <CellPhone xtt:attribute="Personal Cell"></CellPhone>
                <AltPhone xtt:attribute="Work Cell"></AltPhone>
                <HomePhone xtt:attribute="Home Phone"></HomePhone>
                <Country xtt:attribute="Country"></Country>
                <City xtt:attribute="City"></City>
                <Location xtt:attribute="Location"></Location>
                <HotlinePIN xtt:attribute="Hotline PIN"></HotlinePIN>
                <TimeZone xtt:attribute="Time Zone"></TimeZone>
                
               
            </HeaderRecord>
         
  
            <xsl:for-each select="wd:Report_Entry">
              
               
                <!--Detail Record-->
                
                
                    <DetailRecord xtt:endTag="&#xA;" xtt:separator=",">
                        <AccountID><xsl:value-of select="wd:primaryWorkEmail"/></AccountID>
                        <FirstName><xsl:value-of select="wd:Legal_Name_-_First_Name"/></FirstName>
                        <LastName><xsl:value-of select="wd:Legal_Name_-_Last_Name"/></LastName>
                        <WorkEmail><xsl:value-of select="wd:primaryWorkEmail"/></WorkEmail>
                        <PersonalEmail><xsl:value-of select="wd:Email_-_Primary_Home"/></PersonalEmail>
                        <MobileHome><xsl:value-of select="replace(wd:CF_INT0075_LRV_Mobile_Home_Number__Worker_,'[^a-zA-Z0-9]','')"/></MobileHome>
                        <MobileWork><xsl:value-of select="replace(wd:CF_INT0075_LRV_Mobile_Work_Number__Worker_,'[^a-zA-Z0-9]','')"/></MobileWork>
                        <HomePhone><xsl:value-of select="replace(wd:CF_INT0075_LRV_Home_Phone_Number__Worker_,'[^a-zA-Z0-9]','')"/></HomePhone>
                        <Country><xsl:value-of select="wd:Location_Address_-_Country/wd:alpha2Code"/></Country>
                        <City><xsl:value-of select="wd:Work_Address_-_City"/></City>
                        <Location><xsl:value-of select="wd:location/@wd:Descriptor"/></Location>
                        <HotlinePIN xtt:attribute="PIN Number"></HotlinePIN>
                        <TimeZone><xsl:value-of select="wd:location/wd:Time_Zone/@wd:Descriptor"/></TimeZone>
                        
                    </DetailRecord>
                
               
            </xsl:for-each>
           
            
        </File>
    </xsl:template>

    
</xsl:stylesheet>