# Humo

**Ondersteunde app:** 7.53.1 · **Build:** 23136515 · **Invoer:** APKS · **Kanaal:** Pre-release

`be.humo.tvgids`

[Gebruik je eigen APKS](../guides/downloads.md#local-original-inputs){ .md-button }

Selecteer dit bestand in Morphe Manager om de patches toe te passen.

Humo is de DPG-app voor de magazine-editie; de pakketnaam bevat nog “tvgids”. De patches verwijderen de onderzochte advertentieverzoeken, optionele metingen en automatische instelschermen. Leesverbeteringen gelden voor artikelgegevens die de server al levert; anonieme toegang tot ieder premiumartikel is voor deze app niet vastgesteld.

Deze opties zijn beschikbaar in [pre-release v1.20.0-dev.4](https://github.com/johnneerdael/dutch-applications-patches/releases/tag/v1.20.0-dev.4).

## Wat vonden we in de app? {#welke-activiteit-registreren-de-onderzochte-paden}

| Activiteit / dienst | Wat ons bewijs laat zien | Wat verandert |
| --- | --- | --- |
| Advertenties in overzichten, artikelen, video en games | Eigen advertentieladers, expliciet commerciële onderdelen en afzonderlijke verzoeken voor video- en gameadvertentie-instellingen zijn aangetroffen. De meegeleverde configuratie van De Morgen schakelt ook Prebid in. | De onderzochte verzoeken en onderdelen stoppen. De originele uitgeschakeld-/foutmeldingen laten inhoud doorgaan; beloonde advertenties geven geen beloning. |
| [Snowplow](../trackers/snowplow.md), Firebase en uitgeversgebeurtenissen | De onderzochte verzending gebruikt app-, scherm-, lees- en identificatiegegevens. | De onderzochte verzending, wachtrijen, advertentiecodes en bekende webverzamelpunten stoppen. Push en configuratie blijven werken. |
| [Contentsquare / Heap](../trackers/contentsquare-heap.md) | De app bevat scherm- en interactiemetingen, identiteitskoppeling en meetcode voor ingebedde webinhoud. | De onderzochte initialisatie, registratie, uploads en webintegratie stoppen; de melding dat initialisatie klaar is blijft behouden. |
| [Gemius](../trackers/additional-services.md#audience-measurement), Comscore, Piano/Cxense en Usabilla | Belgische merken kiezen echte Gemius-publieks- en videometingen. Andere onderzochte paden meten paginaweergaven, conversies en feedback. | De onderzochte verzamelaars stoppen. De video-integratie gebruikt de originele lege provider; vereiste afrondmeldingen blijven behouden. |
| [Catsure](../trackers/additional-services.md#media-telemetry) | Losse uploads bevatten apparaatidentiteit, de wachtrij en afspeelpositie/-status. De antwoorden sturen de onderzochte lokale speler en wachtrij niet aan. | De twee uploadmethoden stoppen. Publicatie en opslag van de lokale wachtrij blijven behouden; uitgaande synchronisatie van wachtrij/afspeelstatus stopt. |
| Audio-/videometingen en BrandMetrics | De onderzochte code/configuratie bevat afzonderlijke spelergebeurtenissen en enquêteadressen op `phx.bmtrcs.com`. Geconfigureerde adressen bewijzen geen onderschept verzoek. | De onderzochte afzonderlijke verzending stopt. De webregels dekken de `bmtrcs.com`-domeinfamilie. |

## Wat blijft bestaan en wat weten we nog niet?

[Catsure](../trackers/additional-services.md#media-telemetry)-uploads voor de wachtrij en regelmatige statusupdates stoppen. Daarmee stopt de onderzochte melding van apparaatidentiteit, wachtrij en afspeelstatus, inclusief de uitgaande synchronisatie daarvan tussen apparaten. De lokale wachtrijopslag blijft behouden; afspelen en gevolgen op de server vragen nog apparaattests. Inhoud, inloggen, push, configuratie en editie-/PDF-diensten blijven echte serverresultaten en noodzakelijke herkenningscodes gebruiken.

Read full articles laat ontvangen redactionele inhoud zonder het marketingsjabloon tonen. Het maakt geen account, aankoop of toegangsrecht op de server. Volledige premiumartikelen zonder account, editiedownloads, externe webinhoud, in audio verweven advertenties en werking na herondertekening zijn nog niet op een apparaat vastgesteld. Statische controles bewijzen niet dat ieder mogelijk meetverzoek stopt. Gebruik de exacte originele Android 12L+-splitset hierboven.

## Beschikbare opties

Disable tracking, Hide Premium banner, Hide ads, Read full articles, Skip consent screens.

Alle vijf opties staan standaard aan. Disable tracking omvat Hide ads; Skip consent screens omvat beide. Bij Skip consent screens stoppen ook de Catsure-uploads en de hierboven beschreven uitgaande synchronisatie van wachtrij/afspeelstatus.

[Volledige definities voor deze pre-release](https://github.com/johnneerdael/dutch-applications-patches/blob/v1.20.0-dev.4/docs/site/nl/reference/catalogue.md).

[Bekijk wat elke patch aanpast](../reference/catalogue.md). Lees [installeren](../guides/install.md) voor uitleg over originele bestanden en ondertekening, en [patches kiezen](../guides/choose-patches.md) om te zien welke patches elkaar nodig hebben.

## Bewijs

Beoordeeld op 30 oktober 2026: [technisch onderzoek](https://github.com/johnneerdael/dutch-applications-patches/blob/c2d8e30/docs/humo-audit.md) en [onderzoeksverslag](https://github.com/johnneerdael/dutch-applications-patches/blob/c2d8e30/docs/research/2026-10-30/humo.md). De controles op de originelen slagen; alle vijf geselecteerde aanpassingen faalden voor implementatie op het origineel. Bouw- en selectiecontroles staan in het technische onderzoek. Voor dit werk is geen app op de telefoon geïnstalleerd en geen netwerkopname gemaakt. [Zo lees je het bewijs](../reference/methodology.md).
