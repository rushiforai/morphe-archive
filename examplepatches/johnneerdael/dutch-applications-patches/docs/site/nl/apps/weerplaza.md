# Weerplaza

**Ondersteunde app:** 3.13.1 · **Build:** 734 · **Invoer:** APKS

`nl.weerplaza.app`

[Download de originele APKS](https://buzzheavier.com/cr9f6qs8tfsh){ .md-button .md-button--primary }

Selecteer dit bestand in Morphe Manager om de patches toe te passen.

Weerplaza bevat Android-onderdelen en webinhoud in een ingebouwde browser. Die browser kan een nieuw analysescript laden zonder dat de geïnstalleerde APK verandert. Het onderzoek behandelt daarom de verzameling in de app en de bekende webverzoeken die de patch afdekt afzonderlijk.

## Wat vonden we in de app? {#welke-activiteit-registreren-de-onderzochte-paden}

| Activiteit / dienst | Wat ons bewijs laat zien | Wat verandert |
| --- | --- | --- |
| Google-tags en fotometing | De opgehaalde webinhoud bevat een GTM/GA-tag en een script voor fotometing in Plausible-stijl via `analytics.infraloods.nl`. | De blokkaderegels dekken bekende verzoeken voor gegevensverzameling en scripts. Dat bewijst niet dat er in elke sessie een upload is voltooid. |
| Video-, publieks- en foutdiensten | De onderzochte blokkaderegels dekken bestemmingen voor [Blue Billywig](../trackers/additional-services.md#media-telemetry), ScorecardResearch, Sentry/foutrapportage en PushAlert. | Bekende verzoeken uit de ingebouwde browser (WebView) en de onderzochte verzending vanuit de app stoppen. De exacte gegevens voor externe diensten zijn nog niet bevestigd. |
| [Didomi](../trackers/didomi.md) en inlogdiagnose | Specifieke paden voor `/v1/events`, `/v1/sync` en inloglogboeken hebben een meetfunctie. | De patch blokkeert deze specifieke paden; andere inlog- en privacyfuncties blijven werken. |
| Advertenties en herkenningscodes | Het onderzoek bracht advertentieladers in de app, videoadvertenties, PPID en advertentiecodes, en bekende advertentieladers op webpagina’s in kaart. | De gekozen opties stoppen deze advertentiefuncties en verwijderen de bijbehorende lege advertentieruimte. |

## Wat blijft bestaan en wat weten we nog niet?

Weer, radar, kaarten, echte aankopen en functionele push blijven werken. De compatibiliteitspatch levert de toegestane community-Maps-sleutel. Kaartverzoeken blijven de app verlaten. De gebruiker heeft bevestigd dat de radar werkt; dit is geen volledig onderzoek van ontsleuteld netwerkverkeer. Gebruik de originele Android 8+-Play-splitset.

## Beschikbare opties

Disable tracking, Fix Google Maps, Hide Premium banner, Hide ads, Skip consent screens.

[Bekijk wat elke patch aanpast](../reference/catalogue.md). Lees [installeren](../guides/install.md) voor uitleg over originele bestanden en ondertekening, en [patches kiezen](../guides/choose-patches.md) om te zien welke patches elkaar nodig hebben.

## Bewijs

Beoordeeld op 28 oktober 2026 tegen main `6102fa9`: [technisch onderzoek](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/WEERPLAZA_TRACKING_AUDIT.md) en [broncatalogus](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/README.md). Codeonderzoek laat zien hoe de onderzochte code gebeurtenissen en gegevens verwerkt. Apparaattests bevestigen de werking die op die apparaten is gecontroleerd. Deze gids bevat geen aanvullende netwerkopnamen. [Zo lees je het bewijs](../reference/methodology.md).
