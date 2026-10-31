# KIJK Android

**Ondersteunde app:** 9.8.0 · **Build:** 2026101500 · **Invoer:** APK

`nl.sbs.kijk`

[Gebruik je eigen APK](../guides/downloads.md#local-original-inputs){ .md-button }

Selecteer dit bestand in Morphe Manager om de patches toe te passen.

De Android-app voor telefoons en tablets gebruikt de native JWPlayer-speler. De patches verwijderen de configuratie voor videoadvertenties, stoppen optionele publieksmetingen en diagnostiek, weigeren optionele cookiedoelen en slaan automatische toestemmingsverzoeken voor meldingen over. Vernieuw de patchbron in Morphe Manager, kies KIJK Android en gebruik de originele build 2026101500. De KIJK Android TV-app is een apart doel.

## Wat vonden we in de app?

| Activiteit / dienst | Wat ons bewijs laat zien | Wat verandert |
| --- | --- | --- |
| Videoadvertenties op volledig scherm en in de pagina | Twee native paden voegen een VMAP-advertentieconfiguratie of advertentietag toe. | Hide ads gebruikt de bestaande paden zonder advertentie-invoer en behoudt inhoud, spelerconfiguratie en DRM. |
| Tealium, Comscore en Conviva | Native initialisatie, ophalen van meetinstellingen, gebeurtenissen en spelermetingen kunnen verzoeken en wachtrijen aanmaken. | Disable tracking stopt de onderzochte verzamelaars, wachtrijen en verzending. Conviva behoudt de objecten die de speler nodig heeft en ontvangt lokaal zijn oorspronkelijke gereedmelding. |
| Adjust-attributie en advertentiecodes | De app initialiseert Adjust, geeft een pushtoken door en maakt attributiegebeurtenissen aan; aparte wachtrijen versturen opgeslagen pakketten. | Disable tracking stopt deze initialisatie, herkenningscodes, gebeurtenissen en wachtrijpaden en meldt dat advertentietracking beperkt is. |
| Firebase- en Salesforce-analyse | Opgeslagen instellingen en SDK-API's kunnen verzameling opnieuw inschakelen. Oude uploads hebben aparte paden. Salesforce verzorgt ook functionele pushregistratie. | Disable tracking houdt de onderzochte metingen uitgeschakeld en rondt uploadpaden lokaal af, terwijl de functionele push-SDK en accountregistratie behouden blijven. |
| OneTrust-toestemming | De oorspronkelijke SDK-gereedmelding kan automatisch een cookiebanner op volledig scherm openen. | Skip consent screens gebruikt de echte Reject All-opslagactie van OneTrust, behoudt noodzakelijke doelen en rondt het oorspronkelijke opstartpad af. Latere handmatige privacykeuzes blijven mogelijk. |
| Meldingsverzoeken en standaardinstellingen | MainActivity vraagt automatisch toestemming voor meldingen; de eigen meldingsinstelling van de app staat standaard aan. | Skip consent screens slaat het automatische verzoek over en zet de app-instelling eenmalig uit. Handmatig aan- en uitzetten blijft mogelijk. |

## Wat blijft bestaan en wat weten we nog niet?

Diensten voor inhoud, configuratie, inloggen, accounts en DRM blijven werken. Pushregistratie blijft beschikbaar voor wie meldingen later zelf aanzet. Op Android 13 of nieuwer blijft de systeemtoestemming bij een verse installatie geweigerd tot een handmatige keuze; een bestaande systeemtoestemming wordt niet ingetrokken. De eigen standaard-uitinstelling van de app geldt ook op oudere Android-versies.

De patches geven geen abonnement, accountrecht of DRM-licentie. Uitzendreclame, reclame die al in de mediastream zit en reclame op externe Cast-ontvangers vallen buiten deze acceptatie. Casten, liveprogramma's, bezorging van meldingen, lange sessies en alle apparaten of architecturen vragen bredere tests. De beperkte netwerkcontrole bewijst niet dat alle trackingverzoeken verdwenen zijn.

Gebruik de originele APK op Android 8.0 (API 26) of nieuwer. Gebruik bij updates dezelfde ondertekeningssleutel om appgegevens te behouden. De eerste gepatchte SDK-gereedmelding weigert ook optionele doelen op eerder geaccepteerde installaties; latere handmatige privacy- en meldingskeuzes blijven behouden, tenzij OneTrust nieuwe toestemming vereist.

## Beschikbare opties

Disable tracking, Hide ads, Skip consent screens.

Alle drie staan standaard aan, ook in Simple mode. Skip consent screens neemt Disable tracking mee; Hide ads blijft apart te kiezen. Handmatige privacy- en meldingsinstellingen blijven beschikbaar.

[Bekijk wat elke patch aanpast](../reference/catalogue.md). Lees [installeren](../guides/install.md) voor uitleg over originele bestanden en ondertekening, en [patches kiezen](../guides/choose-patches.md) om te zien welke patches elkaar nodig hebben.

## Bewijs

Gevalideerd op 31 oktober 2026: [native telefoononderzoek en exacte contracten](https://github.com/johnneerdael/dutch-applications-patches/blob/main/docs/research/2026-10-30-kijk-mobile.md). Volledige vergelijkingen van de gegenereerde bytecode controleren alle 55 geselecteerde wijzigingen, de oorspronkelijke methodestaarten en ongewijzigde functionele methoden; de aparte toestemmingsselectie controleert 53 wijzigingen inclusief tracking. Zeventien ART-fixturegroepen met de echte APK slaagden op Android 16. Frida liet afspelen van een programma zonder account en de onderzochte advertentie- en trackingpaden zien; echte OneTrust-weigeringswaarden voor doelen en leveranciers zijn gecontroleerd. De gebruiker testte de uiteindelijke APK met alle drie de opties na een schone telefooninstallatie, bevestigde dat deze werkt en gaf toestemming voor publicatie. Er zit geen diagnostische Gadget in de APK. Dit bewijst de hierboven genoemde ongeteste gevallen niet. [Zo lees je het bewijs](../reference/methodology.md).
