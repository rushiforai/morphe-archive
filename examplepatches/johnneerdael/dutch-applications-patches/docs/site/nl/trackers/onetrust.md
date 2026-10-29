# OneTrust: wat gebeurt er achter een privacyscherm?

## Waarom staat een toestemmingsdienst op een trackersite?

OneTrust levert een **consent management platform**, vaak afgekort tot CMP. De mobiele SDK levert een banner, een scherm voor privacyvoorkeuren en lijsten met leveranciers. Daarmee kan een app je vragen hoe je gegevens gebruikt mogen worden en die keuzes beheren. Zo'n scherm kan netwerkverzoeken nodig hebben om te werken. De aanwezigheid ervan bewijst niet dat elk verzoek je gedrag meet. [OneTrust SDK-documentatie](https://developer.onetrust.com/onetrust/docs/onetrust-sdk-reference).

Andere onderdelen van de app kunnen opgeslagen toestemmingskeuzes uitlezen. Een callback is code die wordt uitgevoerd wanneer iets verandert, bijvoorbeeld een privacykeuze. Of de meetcode zich werkelijk aan die keuze houdt, hangt af van de koppeling tussen die onderdelen. Alleen de banner bekijken vertelt dat niet.

## Kan het beheren van keuzes zelf gegevens uitwisselen?

De gedocumenteerde save/log-API van OneTrust ondersteunt app- en SDK-informatie, een toestemmingsstring en optionele velden voor identiteit of synchronisatie tussen apparaten. Een **toestemmingsstring** is een gecodeerde weergave van keuzes; coderen maakt die informatie niet geheim. Deze mogelijkheden bewijzen niet dat Buienradar precies die route gebruikt of identiteitssynchronisatie inschakelt. [API voor toestemming opslaan en loggen](https://developer.onetrust.com/onetrust/docs/save-and-log-consent).

**Denkbeeldig voorbeeld:** een privacyscherm haalt een leverancierslijst op, bewaart een keuze en geeft die door aan een analyticsbibliotheek. Dat zijn drie verschillende handelingen. Alleen het scherm verbergen hoeft de bibliotheek niet te stoppen. De hele toestemmingsdienst blokkeren kan juist verhinderen dat je later een keuze wijzigt.

## Wat vonden we in Buienradar?

In [Buienradar 7.4.8](../apps/buienradar.md) blijft OneTrust bij het opstarten instellingen ophalen. `mobile-data.onetrust.io` en `geolocation.1trust.app` zijn aangetroffen als behouden dienstbestemmingen. Het onderzoek volgt ook een toestemmingscallback die Firebase-analyticsopslag toestaat. De trackingpatch stopt daarom zowel het verzamelen als het opnieuw inschakelen daarvan. Alleen de banner verbergen zou die code niet stoppen. Een domeinnaam met “geolocation” bewijst op zichzelf geen overdracht van GPS-coördinaten. [Buienradar-onderzoeksrapport](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/BUIENRADAR_TRACKING_AUDIT.md).

## Wat betekent het overslaan van het scherm hier?

**Skip consent screens** slaat de automatische Pay-or-OK- en OneTrust-schermen over. De optie omvat de tracking- en advertentiecontroles, schrijft geen toestemming of weigering en houdt handmatige Privacy-instellingen beschikbaar. Volgens het onderzoek leest de appcache onbeantwoorde OneTrust-groepen als niet toegestaan.

De bevindingen laten niet zien wat iedere aangesloten verzender doet en geven geen juridisch oordeel over toestemming. De app blijft functionele instellingen en gewone netwerkgegevens uitwisselen. Voor deze documentatie is geen ontsleutelde verkeersopname gemaakt.

Bewijs beoordeeld op **28 oktober 2026**. Lees verder over [toestemming](../learn/consent.md), [Firebase](firebase.md) en [de methode](../reference/methodology.md).
