# Cronometer

Open lokale Gold-functies en verwijder geselecteerde advertenties, aanbiedingen en telemetrie in Cronometer.

**Appversie:** 4.57.2 · **Build:** 3399 · **Origineel bestand:** APKM

[Gebruik je originele APKM](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Gebruik de originele APKM met meerdere architecturen en een ARM64-telefoon. Behoud de meegeleverde bibliotheken bij het patchen. Nieuwere versies worden niet ondersteund.

## Patches

| Patch | Standaard | Wat verandert er? |
| --- | --- | --- |
| **Disable ads, tracking and Gold upsells** | Aan | Past de gecombineerde opties toe: opent lokale Gold-functies, verwijdert geselecteerde Gold-banners, voedselsuggesties en verwijzingen en verbergt de blijvende tip voor het eerste voedingsmiddel. |
| **Disable ads** | Aan | Voorkomt het initialiseren van Google Mobile Ads en het laden van banners en schermvullende advertenties. |
| **Disable Adjust tracking** | Aan | Stopt het initialiseren van Adjust en het bijhouden van gebeurtenissen. |
| **Disable Amplitude tracking** | Aan | Compatibiliteitsoptie in de gecombineerde selectie; behoudt de antwoorden van de app-plug-in. |
| **Disable Braze tracking** | Aan | Stopt het initialiseren van de Braze-integratie en behoudt de antwoorden van de app-plug-in. |
| **Disable Datadog telemetry** | Aan | Stopt het initialiseren van Datadog en handelt uitgeschakelde RUM-verzoeken af zonder SDK-fouten te tonen. |
| **Disable Firebase Analytics** | Aan | Stopt Firebase Analytics-gebeurtenissen en het schrijven van gebruikerskenmerken. |

## Advertentie- en trackingdiensten

De opties richten zich op Google Mobile Ads, Adjust, Braze, Datadog en Firebase Analytics. Ze claimen niet dat ieder mogelijk telemetriepad wordt verwijderd.

## Voor gebruik

Kies de gecombineerde patch voor lokale Gold-functies en het verwijderen van aanbiedingen. Serverdiensten vereisen nog steeds werkende toegang; de Gold-aanduiding maakt geen betaald serverabonnement aan. Patch de originele APKM in Morphe Manager en behoud de ondertekeningssleutel van Manager voor updates met behoud van appgegevens.

[Installatie](../guides/install.md) · [Patches kiezen](../guides/choose-patches.md) · [Compatibiliteit en standaardkeuzes](../reference/catalogue.md)
