# de Volkskrant

**Ondersteunde app:** 7.53.1 · **Build:** 23136515 · **Invoer:** APKS

`be.persgroep.android.news.mobilevk`

[Download de originele APKS](https://buzzheavier.com/gsqypsmnoa36){ .md-button .md-button--primary }

Selecteer dit bestand in Morphe Manager om de patches toe te passen.

Als je een artikel opent, kan de app gebeurtenissen voor de uitgever, publieksmetingen en scherminteracties registreren. Bij audio zijn er zowel optionele metingen van je handelingen als verzoeken die de afspeelwachtrij regelen. De krantenapps gebruiken vergelijkbare code, maar verschillen in wat hun patches afdekken.

## Wat vonden we in de app? {#welke-activiteit-registreren-de-onderzochte-paden}

| Activiteit / dienst | Wat ons bewijs laat zien | Wat verandert |
| --- | --- | --- |
| [Snowplow](../trackers/snowplow.md) en uitgeversgebeurtenissen | Bij het versturen van app-, scherm- en leesgebeurtenissen gebruikt de app herkenningscodes. | De patch schakelt de onderzochte verzending en wachtrijen uit, net als bekende verzamelpunten op het web. |
| [Contentsquare / Heap](../trackers/contentsquare-heap.md) | Metingen van scherm- en onderdeelwisselingen, interacties, identiteit en kenmerken, en meetcode in webpagina’s zijn in de code gevolgd of vallen onder de blokkaderegels voor webverzoeken. | De onderzochte initialisatie, registratie, uploads en gegevensoverdracht tussen de app en webinhoud stoppen. |
| Publieks- en feedbackdiensten | [Gemius](../trackers/additional-services.md#audience-measurement), [Comscore](../trackers/additional-services.md#audience-measurement) en Piano/Cxense meten publiek, paginaweergaven en conversies. Het onderzoek van deze app vond ook automatische [Usabilla](../trackers/usabilla.md)-gebeurtenissen. | De onderzochte verzending vanuit de app en webpagina’s stopt. De app blijft de verwachte meldingen ontvangen dat de verwerking klaar is. |
| Audio en video | Afzonderlijke [Amalia](../trackers/additional-services.md#media-telemetry)-metingen registreren spelergebeurtenissen. Andere verzoeken regelen de audiowachtrij en geven regelmatig de afspeelstatus door (heartbeat). | Videometingen staan uit. De onafhankelijke audioverzender blijft buiten de patchdekking en vraagt nog onderzoek. |
| Enquêtes over advertentie-effect | De blokkaderegels voor webverzoeken noemen bekende domeinen voor analyse, experimenten en advertentiemeting. Dat bewijst niet dat ze allemaal actief waren. | Bekende verzoeken uit die regels worden geblokkeerd. De aanvullende hostdekking van Parool geldt niet automatisch voor deze app. |

## Wat blijft bestaan en wat weten we nog niet?

[Catsure](../trackers/additional-services.md#media-telemetry) blijft verzoeken versturen voor de wachtrij en regelmatige statusupdates (heartbeat). Die bevatten een apparaatcode, audio-items in afspeelvolgorde, mediacodes, positie en afspeelstatus. De gevolgen voor de serverwerking zijn nog onvoldoende bekend om deze verzoeken te verwijderen.

De diensten voor inhoud, inloggen, push, configuratie, kranten en PDF’s blijven echte serverresultaten gebruiken. Read full articles behoudt ontvangen tekst tijdens het marketingproces. Het registreert geen aankoop en geeft geen toegangsrecht op de server. Gebruik de originele Android 12L+-Play-splitset.

## Beschikbare opties

Disable tracking, Hide Premium banner, Hide ads, Read full articles, Skip consent screens.

[Bekijk wat elke patch aanpast](../reference/catalogue.md). Lees [installeren](../guides/install.md) voor uitleg over originele bestanden en ondertekening, en [patches kiezen](../guides/choose-patches.md) om te zien welke patches elkaar nodig hebben.

## Bewijs

Beoordeeld op 28 oktober 2026 tegen main `6102fa9`: [technisch onderzoek](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/VOLKSKRANT_TRACKING_AUDIT.md) en [broncatalogus](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/README.md). Codeonderzoek laat zien hoe de onderzochte code gebeurtenissen en gegevens verwerkt. Apparaattests bevestigen de werking die op die apparaten is gecontroleerd. Deze gids bevat geen aanvullende netwerkopnamen. [Zo lees je het bewijs](../reference/methodology.md).
