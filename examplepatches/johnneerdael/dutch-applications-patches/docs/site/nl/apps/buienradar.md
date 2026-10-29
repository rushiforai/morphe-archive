# Buienradar

**Ondersteunde app:** 7.4.8 · **Build:** 7897 · **Invoer:** APKM

`com.supportware.Buienradar`

[Download de originele APKM](https://buzzheavier.com/v4m79608e677){ .md-button .md-button--primary }

Selecteer dit bestand in Morphe Manager om de patches toe te passen.

Buienradar gebruikt afzonderlijke diensten om onder meer radaropvragen, afgespeelde video’s en terugkeer naar een scherm te meten. Weerwaarschuwingen delen infrastructuur met de Swrve-software voor gebruikerscontact. Als je ook Swrve en locatie-uploads uitschakelt, verlies je de weerpushmeldingen.

## Wat vonden we in de app? {#welke-activiteit-registreren-de-onderzochte-paden}

| Activiteit / dienst | Wat ons bewijs laat zien | Wat verandert |
| --- | --- | --- |
| [Snowplow](../trackers/snowplow.md) | Scherm-, element-, aankoop-, radarlocatie- en inloggebeurtenissen; installatieherkomst en app-levenscyclus. Er zijn verzamelpunten voor RTL en DPG ingesteld. | Disable tracking voorkomt het maken van beide trackers en stopt de verzending vanuit de app. |
| [Kantar/NMO](../trackers/kantar-nmo.md) | De plug-in voor publieksmeting vult `cs_fpid` met de Snowplow-gebruikerscode in een ping naar `nmortlendpoint.2cnt.net`. | Dit stopt samen met Snowplow. Het codeonderzoek toont deze koppeling, maar geeft geen volledig overzicht van de werkelijk verstuurde pings. |
| [Bitmovin](../trackers/bitmovin.md) en [Smartocto](../trackers/additional-services.md#editorial-analytics) | De speler gebruikt videoanalyse; een aparte [Smartocto](../trackers/additional-services.md#editorial-analytics)-luisteraar verstuurt video-startpings. | De onderdelen die videometingen verzamelen en startmeldingen versturen, stoppen. Video’s afspelen en de Bitmovin-licentiecontrole blijven werken. |
| [Usabilla](../trackers/usabilla.md) | Usabilla verzamelt meetgegevens en start campagnes op basis van gebeurtenissen. Je kunt daarnaast zelf een feedbackformulier openen. | Automatische registratie en gebeurtenissen stoppen; zelf feedback versturen blijft mogelijk. |
| [Swrve](../trackers/swrve.md) en locatie | In de code zijn apparaat- en sessiekenmerken gevolgd, en uploads met breedtegraad, lengtegraad en de Swrve-gebruikerscode. | Dit blijft standaard bestaan. Een afzonderlijke optie, die standaard uit staat, stopt deze gegevensuitwisseling en alle weerpushmeldingen. |
| [OneTrust](../trackers/onetrust.md) en [Firebase](../trackers/firebase.md) | Toestemmingsinstellingen, geolocatie en noodzakelijke verzoeken voor installatie, push en configuratie blijven. | Automatische toestemmingsschermen zijn over te slaan; privacyinstellingen die je zelf opent en de infrastructuur voor waarschuwingen blijven. |

## Wat blijft bestaan en wat weten we nog niet?

Disable tracking behoudt Swrve en locatie-uploads op de achtergrond. De afzonderlijke optie Disable Swrve and location upload staat standaard uit. Als je die inschakelt, stoppen ook de pushmeldingen voor regen, luchtkwaliteit, barbecue en dagelijkse voorspellingen.

Weer, radar, video’s, inloggen en echte betalingen blijven werken. De originele Android 9+-APKM bevat basis-, processor- en schermsplits. Het onderzoek toont niet aan dat al het netwerkverkeer is verdwenen.

## Beschikbare opties

Disable Swrve and location upload, Disable tracking, Hide Premium banner, Hide ads, Skip consent screens.

[Bekijk wat elke patch aanpast](../reference/catalogue.md). Lees [installeren](../guides/install.md) voor uitleg over originele bestanden en ondertekening, en [patches kiezen](../guides/choose-patches.md) om te zien welke patches elkaar nodig hebben.

## Bewijs

Beoordeeld op 28 oktober 2026 tegen main `6102fa9`: [technisch onderzoek](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/BUIENRADAR_TRACKING_AUDIT.md) en [broncatalogus](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/README.md). Codeonderzoek laat zien hoe de onderzochte code gebeurtenissen en gegevens verwerkt. Apparaattests bevestigen de werking die op die apparaten is gecontroleerd. Deze gids bevat geen aanvullende netwerkopnamen. [Zo lees je het bewijs](../reference/methodology.md).
