# KIJK Android TV

**Ondersteunde app:** 7.2.7 · **Build:** 10003 · **Invoer:** APKS

`com.talpa.kijk`

[Download de originele APKS](https://buzzheavier.com/oh3usdc9o9xi){ .md-button .md-button--primary }

Selecteer dit bestand in Morphe Manager om de patches toe te passen.

De tv-app laadt de interface en de videospeler in een WebView vanaf de servers van KIJK. Als je een programma kijkt, kan de app videoreclame en pauzeadvertenties opvragen, en de online speler laadt meetscripts van verschillende aanbieders. Die speler kan op de server veranderen zonder APK-update. Vernieuw in Morphe Manager de patchbron, kies KIJK Android TV en kies `kijk-atv.apks` als origineel invoerbestand. De telefoonapp is een apart versiedoel.

## Wat vonden we in de app?

| Activiteit / dienst | Wat ons bewijs laat zien | Wat verandert |
| --- | --- | --- |
| FreeWheel-videoreclame en pauzeadvertenties | De online speler vraagt advertentiebeslissingen op bij FreeWheel en koppelt advertentieschema's (VAST/VMAP) in de speler. Een apart pad toont pauzeadvertenties. | Hide ads geeft een leeg schema terug voor de gevonden FreeWheel-beslissingen, verwijdert het advertentieschema in de speler en stopt pauzeadvertenties. De videobron blijft gelijk. |
| Reclame-ID en ID5 | Een koppeling in de app geeft de reclame-ID door aan de online app. De online configuratie zet ID5-identiteitskoppeling aan en bewaart een ID5-code in de cache. | Disable tracking verwijdert de reclame-ID, meldt dat reclametracking beperkt is, zet de ID5-instelling uit, wist de cache en blokkeert bijbehorende verzoeken. |
| Tealium- en TVA-metingen | De online speler laadt Tealium-tags en het TVA-meetscript van KIJK. De precieze gegevensvelden zijn niet vastgelegd. | Disable tracking vervangt het TVA-script door een leeg antwoord en beantwoordt TVA- en Tealium-aanroepen lokaal met een leeg antwoord of een antwoord zonder inhoud. |
| Conviva, Google Analytics en Sentry | De online configuratie zet spelermetingen via Conviva, gebruiksmetingen via Google Analytics en foutrapportage via Sentry aan. | Disable tracking zet deze instellingen uit en blokkeert bijbehorende verzoeken. |
| Online app en cache | De interface en spelerscripts komen van `prd.smarttv.talpavideo.nl`. De service worker `/android/sw.js` kan ongewijzigde bestanden uit de cache laden en zo de patch omzeilen. | De patch past zijn wijzigingen toe voordat de scripts starten en voorkomt dat juist die worker zich registreert. Andere inhoud blijft origineel. |

## Wat blijft bestaan en wat weten we nog niet?

Diensten voor inhoud, accounts, OneTrust-toestemming en DRM blijven functionele verzoeken ontvangen. De beheerders van die diensten zien nog steeds gewone verbindingsgegevens. De patches maken geen accountrecht of DRM-licentie aan. Reclame in de uitzending en reclame die al in de videostream zit, vallen buiten de gecontroleerde wijzigingen aan advertenties in de speler. De huidige controles bewijzen niet dat elk trackingverzoek is gestopt.

Begin met een schone installatie. Een oudere installatie kan een service worker bewaren die de ongepatchte speler uit de cache laadt. Als je app-gegevens wist, verdwijnen ook je aanmelding en toestemmingskeuzes.

Vooruitspoelen voorbij de gebufferde video, livezenders, casten en reclameonderbrekingen moeten nog breder getest worden. Verandert het afspelen, vermeld dan de app-versie, de gekozen patches en het programma of de zender. Houd inloggegevens en accounttokens uit meldingen. Gebruik de volledige originele tv-APKS op Android 8.1 (API 27) of nieuwer.

## Beschikbare opties

Disable tracking, Enable WebView debugging, Hide ads.

Hide ads en Disable tracking staan standaard aan. Enable WebView debugging staat standaard uit. Hiermee kun je de online speler lokaal onderzoeken, dus laat deze optie uit bij dagelijks gebruik.

[Bekijk wat elke patch aanpast](../reference/catalogue.md). Lees [installeren](../guides/install.md) voor uitleg over originele bestanden en ondertekening, en [patches kiezen](../guides/choose-patches.md) om te zien welke patches elkaar nodig hebben.

## Bewijs

Beoordeeld op 29 oktober 2026 tegen `2190e42`: [tv-onderzoek en testbewijs](https://github.com/johnneerdael/dutch-applications-patches/blob/2190e42b1877badaca7a8e1e520e83aa7e95d90a/docs/research/2026-10-29-atv.md), [bestemmingen en gegevens](https://github.com/johnneerdael/dutch-applications-patches/blob/e2c30be/docs/privacy/kijk-android-tv/README.md) en [patchbron](https://github.com/johnneerdael/dutch-applications-patches/tree/2190e42b1877badaca7a8e1e520e83aa7e95d90a/patches/src/main/kotlin/patches/kijkatv). Gratis afleveringen zijn afgespeeld op tv's met Android 9 en Android 14. Op de Android 9-box zijn Widevine-afspelen en pauzeren en hervatten waargenomen, en is een FreeWheel-beslissing onderschept. De gebruiker bevestigde reclamevrij afspelen op de Android 14-tv. Dit zijn beperkte afspeeltests, geen volledige opname van het netwerkverkeer. [Zo lees je het bewijs](../reference/methodology.md).
