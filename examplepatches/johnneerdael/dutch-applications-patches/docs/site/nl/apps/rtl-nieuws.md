# RTL Nieuws

**Ondersteunde app:** 12.7.1 · **Build:** 1558 · **Invoer:** APKS

`nl.rtl.rtlnieuws`

[Download de originele APKS](https://buzzheavier.com/lvklis48sf8r){ .md-button .md-button--primary }

Selecteer dit bestand in Morphe Manager om de patches toe te passen.

De standaardopties verwijderen de onderzochte ingebouwde advertenties en blokkeren de verzoeken waarmee de onderzochte videospeler advertenties ophaalt. Ook de eigen promotiecampagnes en Swrve-campagnes verschijnen niet meer. De trackingpatch stopt de vastgestelde lees- en kijkmetingen, optionele herkenningscodes en bekende opgeslagen meetgegevens. Je behoudt push en de privacy- en meldingsinstellingen die je zelf opent.

## Wat vonden we in de app?

| Activiteit / dienst | Wat ons bewijs laat zien | Wat verandert |
| --- | --- | --- |
| Advertenties en promotiecampagnes | De code bevat ingebouwde advertentieplaatsen, afzonderlijke videoadvertentiepaden en eigen en Swrve-campagnes. Campagnes kunnen via opstarten, opgeslagen berichten of campagnelinks worden geselecteerd. | Hide ads stopt de onderzochte advertentieplaatsen en videoadvertentie-invoer en blokkeert campagnes vóór weergave. Inhoud, normale afronding van het afspelen en DRM blijven behouden. |
| Lees- en kijkmetingen | [Snowplow](../trackers/snowplow.md)/DPG, een afzonderlijke [NMO/FocalMeter](../trackers/kantar-nmo.md)-verzender, SmartOcto, [Bitmovin](../trackers/bitmovin.md), [Firebase](../trackers/firebase.md) en automatische [Usabilla](../trackers/usabilla.md)-gebeurtenissen zijn onderzocht. App-, artikel- en spelergebeurtenissen kunnen aan sessies of gebruikers worden gekoppeld. | Disable tracking stopt de onderzochte verzameling, het opnieuw inschakelen en de afzonderlijke verzending. Optionele diagnose- en meldingsmetingen stoppen ook. |
| Herkenningscodes en identiteit | De onderzochte code gebruikt optionele advertentie-, App Set- en apparaatcodes en koppelingen met externe identiteiten. | De optionele codes en identiteitskoppelingen stoppen. Echte authenticatie en de accountgegevens die daarvoor nodig zijn blijven werken. |
| Opgeslagen meetgegevens | Firebase-transport en de Swrve-wachtrij kunnen eerder opgeslagen meetgegevens later versturen. | Bekende Firebase-meetrecords en Swrve-records van de typen `event` en `session_start` worden gefilterd. De patch meldt ze daarbij niet als geslaagd bezorgd. Onbekende transportnamen en onbekende of onleesbare Swrve-records blijven behouden. |

## Wat blijft bestaan en wat weten we nog niet?

Accounts, echte aankopen, handmatige feedback, media-autorisatie, DRM en configuratiediensten blijven werken. Met de standaardopties blijven ook functionele Swrve- en pushdiensten actief. Deze diensten kunnen nog herkenningscodes en IP-gegevens uitwisselen. Cast- en Billing-diagnostiek, onbekende transportnamen en externe scripts vallen buiten een volledige onderdrukking.

Advertenties die op de server in media worden ingevoegd of via externe webinhoud verschijnen zijn niet aantoonbaar verwijderd. De meegeleverde oudere TFK-speler verwijst naar een ontbrekende Source-overload: een variant van een spelerfunctie die niet is meegeleverd. Of dat oudere pad wordt gebruikt, is niet vastgesteld, en de patch geeft daarvoor geen afspeelgarantie. De app bevat een Adobe-hostnaam in de configuratie, maar dat bewijst geen actieve verzender.

De patches maken geen abonnement aan en garanderen geen anonimiteit of afwezigheid van netwerkverkeer. Gebruik de volledige originele Android 12L+-Play-splitset.

## Beschikbare opties

Disable Swrve (expert), Disable tracking, Hide ads, Skip consent screens.

Hide ads, Disable tracking en Skip consent screens staan standaard aan. Hide ads verwijdert de onderzochte ingebouwde advertenties, videoadvertentie-invoer en promotiecampagnes. Handmatige meldingsinstellingen en push blijven beschikbaar. Disable tracking omvat Hide ads en stopt de onderzochte metingen, optionele herkenningscodes en bekende opgeslagen meetgegevens.

Skip consent screens omvat beide opties. De patch slaat het automatische cookie-/privacyscherm en de meldingeninstellingen en -herinneringen bij het opstarten over, zonder toestemming of weigering vast te leggen. Bij een nieuwe installatie blijven meldingsgroepen uit tot je ze zelf aanzet. Handmatige instellingen en bestaande eigen keuzes blijven behouden.

Disable Swrve (expert) staat standaard uit en omvat alle drie de standaardopties. Deze optie stopt ook de resterende uitwisseling van gebruikers-, apparaat- en configuratiegegevens via Swrve, de achtergrondtaken en de bezorging van pushmeldingen. De app gebruikt dan de ingebouwde inactieve implementatie van Swrve. Zo wisselt de SDK minder gegevens uit dan met de standaardopties, die de onderzochte campagnes en optionele gebeurtenissen al blokkeren. Met deze optie werken pushmeldingen en Swrve-kanaalsynchronisatie niet meer. Laat de optie dus uit als je pushmeldingen wilt ontvangen. Je lokale voorkeuren blijven bewaard en gedeelde Firebase-diensten voor authenticatie, installatie en configuratie blijven beschikbaar.

[Bekijk wat elke patch aanpast](../reference/catalogue.md). Lees [installeren](../guides/install.md) voor uitleg over originele bestanden en ondertekening, en [patches kiezen](../guides/choose-patches.md) om te zien welke patches elkaar nodig hebben.

## Bewijs

Beoordeeld op 28 oktober 2026: [geteste implementatie](https://github.com/johnneerdael/dutch-applications-patches/tree/a55b09a6f8e8acaf1ea0a2944c3b13993831b18f/patches/src/main/kotlin/patches/rtl) op `a55b09a`, en de [definitieve implementatieaudit](https://github.com/johnneerdael/dutch-applications-patches/blob/ec63c97f0b3cf6e4b9fbd17de4dd2d2bc16ed3bb/docs/rtl-nieuws-audit.md) en [bestemmingen en resterende gegevens](https://github.com/johnneerdael/dutch-applications-patches/blob/ec63c97f0b3cf6e4b9fbd17de4dd2d2bc16ed3bb/docs/privacy/rtl-nieuws/README.md) op `ec63c97`. De gebruiker heeft stabiele publicatie goedgekeurd. De audit onderscheidt de eerdere bevestiging van hoofdfuncties op het toestel van latere bron- en bytecodecontroles. Deze goedkeuring levert geen nieuwe volledige toesteltest of ontsleutelde verkeersopname op en dekt niet ieder scherm-, speler- of aankoopscenario. [Zo lees je het bewijs](../reference/methodology.md).
