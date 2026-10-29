# AD

**Ondersteunde app:** 9.22.0 · **Build:** 9220000 · **Invoer:** APKS

`be.persgroep.android.news.mobilead`

[Download de originele APKS](https://buzzheavier.com/mqhxrgsf0wdu){ .md-button .md-button--primary }

Selecteer dit bestand in Morphe Manager om de patches toe te passen.

De onderzochte AD-versie koppelt lezen en afspelen aan systemen voor uitgeversstatistieken, publieksmeting en klantgegevens. Ook privacy- en inlogonderdelen bevatten meetfuncties. De patches stoppen die metingen en behouden de noodzakelijke accountfuncties.

## Wat vonden we in de app? {#welke-activiteit-registreren-de-onderzochte-paden}

| Activiteit / dienst | Wat ons bewijs laat zien | Wat verandert |
| --- | --- | --- |
| [Snowplow](../trackers/snowplow.md), [Comscore](../trackers/additional-services.md#audience-measurement) en [Firebase](../trackers/firebase.md) | Het codeonderzoek volgde uitgeversgebeurtenissen, publieksmeting en app-analyse met gekoppelde herkenningscodes. | De patches onderdrukken de onderzochte configuratie en verzending, ook vanuit wachtrijen en bij pogingen om metingen opnieuw in te schakelen. |
| Piano/Cxense en [Usabilla](../trackers/usabilla.md) | Deze diensten registreren paginaweergaven, bewaren klant- en publieksgebeurtenissen voor verzending en verzamelen automatische feedbackgebeurtenissen en extra kenmerken. | De onderzochte verzenders en geplande taken stoppen; inloggen en zelf feedback versturen blijven werken. |
| Onafhankelijke audio- en videotelemetrie | Het videopad bevat `/api/v1/events/video.analytics.v1`; de onafhankelijke audioverzender `/track` is apart. | Videotelemetrie stopt. De onafhankelijke audioverzender valt buiten de patchdekking en vraagt nog privacyonderzoek. |
| PrivacyGate en inlogdiagnose | Dezelfde diensten verzorgen metingen, toestemming en aanmelding. | De meetfuncties stoppen; toestemming, inloggen en het vernieuwen van inlogtokens blijven werken. |

## Wat blijft bestaan en wat weten we nog niet?

[Catsure](../trackers/additional-services.md#media-telemetry) blijft audio coördineren met gegevens over het apparaat, de speler en de wachtrij. Het is nog niet duidelijk wat dit betekent voor de werking van de server.

Ook redactionele `valley.*`-onderdelen blijven. Alleen hun naam is onvoldoende om ze als tracking te beoordelen. Diensten voor artikelen, accounts en meldingen blijven gegevens uitwisselen.

De artikelopties behouden tekst die al is geleverd en geven geen toegangsrecht. Gebruik de originele Android 12L+-Play-splitset.

## Beschikbare opties

Disable tracking, Hide Premium banner, Hide ads, Read full articles, Skip consent screens.

[Bekijk wat elke patch aanpast](../reference/catalogue.md). Lees [installeren](../guides/install.md) voor uitleg over originele bestanden en ondertekening, en [patches kiezen](../guides/choose-patches.md) om te zien welke patches elkaar nodig hebben.

## Bewijs

Beoordeeld op 28 oktober 2026 tegen main `6102fa9`: [technisch onderzoek](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/AD_PATCH_AUDIT.md) en [broncatalogus](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/README.md). Codeonderzoek laat zien hoe de onderzochte code gebeurtenissen en gegevens verwerkt. Apparaattests bevestigen de werking die op die apparaten is gecontroleerd. Deze gids bevat geen aanvullende netwerkopnamen. [Zo lees je het bewijs](../reference/methodology.md).
