# NU.nl

**Ondersteunde app:** 26.9.0 · **Build:** 210156 · **Invoer:** APKS

`nl.sanomamedia.android.nu`

[Download de originele APKS](https://buzzheavier.com/bdaekl17vud0){ .md-button .md-button--primary }

Selecteer dit bestand in Morphe Manager om de patches toe te passen.

De onderzochte NU.nl-app stuurt gegevens over schermen en sessies naar het trackingsysteem van de uitgever. De inhoudsserver verwerkt ook bevestigingen die nodig zijn om de eerste inrichting af te ronden. Lezen, video kijken en de introductie gebruiken dus verschillende systemen.

## Wat vonden we in de app? {#welke-activiteit-registreren-de-onderzochte-paden}

| Activiteit / dienst | Wat ons bewijs laat zien | Wat verandert |
| --- | --- | --- |
| [Snowplow/uitgeverstracking](../trackers/snowplow.md) | De koppeling met het trackingsysteem van de uitgever ontvangt gegevens over installatie, sessies, schermen, locatie en deep links. Een blijvende UDS-header maakt verdere koppeling mogelijk. | De patch onderdrukt de onderzochte verzending, opstart, herkenningscodes en trackingheader. |
| Publiek en feedback | Het codeonderzoek volgde Comscore/Nobo-publieksmeting en gebeurtenissen en meetgegevens van [Usabilla](../trackers/usabilla.md). | Initialisatie, doorgeven van gegevens en de onderzochte wachtrijverwerking en verzending stoppen. |
| Video, enquêtes en ingebouwde webpagina’s | [JWPlayer](../trackers/additional-services.md#media-telemetry)-metingen, [BrandMetrics](../trackers/additional-services.md#experiments-and-surveys), experimenten en webbestemmingen voor diagnosegegevens zijn in kaart gebracht. | Bekende webverzoeken en de onderzochte verzending van meetgegevens vanuit de app stoppen. Niet elk gegevensveld voor externe diensten is onderschept. |
| Bevestigingen bij eerste gebruik | `graph.nu.nl` levert inhoud en ontvangt drie noodzakelijke bevestigingen dat introductiekaarten zijn voltooid. | Die blijven; de patch onderdrukt andere trackinggebeurtenissen van de inhoudsserver. |

## Wat blijft bestaan en wat weten we nog niet?

Inhoud, bladeren door pagina’s, cookies die de dienst nodig heeft, inloggen en registratie voor push, installatie en DPNS blijven.

Als je de introductie overslaat, kun je nog steeds onderwerpen kiezen en zelf account-, privacy- en meldingsinstellingen openen. De optie haalt geen NU+-tekst terug die de server niet levert. Gebruik de originele Android 12L+-Play-splitset.

## Beschikbare opties

Disable tracking, Hide Premium banner, Hide ads, Skip consent screens.

[Bekijk wat elke patch aanpast](../reference/catalogue.md). Lees [installeren](../guides/install.md) voor uitleg over originele bestanden en ondertekening, en [patches kiezen](../guides/choose-patches.md) om te zien welke patches elkaar nodig hebben.

## Bewijs

Beoordeeld op 28 oktober 2026 tegen main `6102fa9`: [technisch onderzoek](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/NUNL_TRACKING_AUDIT.md) en [broncatalogus](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/README.md). Codeonderzoek laat zien hoe de onderzochte code gebeurtenissen en gegevens verwerkt. Apparaattests bevestigen de werking die op die apparaten is gecontroleerd. Deze gids bevat geen aanvullende netwerkopnamen. [Zo lees je het bewijs](../reference/methodology.md).
