# Weeronline

**Ondersteunde app:** 3.61.0 · **Build:** 2030006811 · **Invoer:** APKS

`com.xs2theworld.weeronline`

[Download de originele APKS](https://buzzheavier.com/mj9n1s9e3ihs){ .md-button .md-button--primary }

Selecteer dit bestand in Morphe Manager om de patches toe te passen.

De onderzochte Weeronline-versie levert weergegevens en gebruikt diensten voor advertenties, videostatistieken, toestemming en abonnementen. Eén hostnaam kan meerdere doelen hebben. De patches blokkeren daarom specifieke verzoeken en behouden andere functies op dezelfde host.

## Wat vonden we in de app? {#welke-activiteit-registreren-de-onderzochte-paden}

| Activiteit / dienst | Wat ons bewijs laat zien | Wat verandert |
| --- | --- | --- |
| [Firebase](../trackers/firebase.md) en [Meta](../trackers/meta.md) | In de code zijn app-, scherm- en aankoopgebeurtenissen, kenmerken en gekoppelde herkenningscodes gevolgd. Facebook Graph levert ook Instagram-inhoud voor de app. | De optionele verzameling stopt, ook als de app die opnieuw probeert in te schakelen. De Graph-host wordt niet volledig geblokkeerd. |
| Advertentiecodes en PubMatic | De app levert PPID en advertentie-ID aan advertentiefuncties. De SDK’s bevatten bestemmingen voor veilingen en profielen. Welke gegevens naar elke host gaan, is niet onderschept. | De patch onderdrukt het opstarten van advertenties en het aanleveren van de onderzochte herkenningscodes. |
| Videostatistieken van [Blue Billywig](../trackers/additional-services.md#media-telemetry) | De app verstuurt afzonderlijk videostatistieken naar `stats.bluebillywig.com`. | Statistieken stoppen terwijl afspelen blijft werken. |
| [RevenueCat](../trackers/revenuecat.md) en [Didomi](../trackers/didomi.md) | Deze diensten bevatten optionele koppeling met een Firebase-installatie, diagnose en toestemmingsmetingen, naast aankopen en privacyinstellingen die je zelf opent. | De optionele metingen stoppen; echte aankoop-, klant- en toestemmingsdiensten blijven. |

## Wat blijft bestaan en wat weten we nog niet?

Weer, kaarten, meldingen, instellingen en betalingen blijven werken. Een eigen advies-API ontvangt een Firebase-installatiecode en meldingsdiensten blijven registratiegegevens uitwisselen.

Unlock Plus verandert de onderzochte beslissingen in de app over welke functies beschikbaar zijn. Het verandert geen Play-aankoopregistratie en garandeert niet dat de server de bijbehorende inhoud levert. Gebruik de originele Android 8+-Play-splitset.

## Beschikbare opties

Disable tracking, Hide Premium banner, Hide ads, Skip consent screens, Unlock Plus.

[Bekijk wat elke patch aanpast](../reference/catalogue.md). Lees [installeren](../guides/install.md) voor uitleg over originele bestanden en ondertekening, en [patches kiezen](../guides/choose-patches.md) om te zien welke patches elkaar nodig hebben.

## Bewijs

Beoordeeld op 28 oktober 2026 tegen main `6102fa9`: [technisch onderzoek](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/WEERONLINE_TRACKING_AUDIT.md) en [broncatalogus](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/README.md). Codeonderzoek laat zien hoe de onderzochte code gebeurtenissen en gegevens verwerkt. Apparaattests bevestigen de werking die op die apparaten is gecontroleerd. Deze gids bevat geen aanvullende netwerkopnamen. [Zo lees je het bewijs](../reference/methodology.md).
