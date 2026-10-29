# Buienalarm

**Ondersteunde app:** 4.32.0 · **Build:** 3723 · **Invoer:** APKS

`org.yoki.android.buienalarm`

[Download de originele APKS](https://buzzheavier.com/jtbt2vu0n7jp){ .md-button .md-button--primary }

Selecteer dit bestand in Morphe Manager om de patches toe te passen.

Als je regen voor een opgeslagen plaats bekijkt, vraagt de app weergegevens op. Een afzonderlijk onderzocht advertentiepad levert ook een herkenningscode die in meerdere apps bruikbaar is, plus de gekozen plaats en het land. Beide gebruiken dezelfde weerserver. Die volledig blokkeren zou dus ook de voorspellingen verwijderen.

## Wat vonden we in de app? {#welke-activiteit-registreren-de-onderzochte-paden}

| Activiteit / dienst | Wat ons bewijs laat zien | Wat verandert |
| --- | --- | --- |
| [Advertentietargeting](../learn/identifiers.md) | Een PPID, gekozen plaats/land en advertentiecontext bereiken `/v2/ads/targetting` op `api.meteoplaza.com`. Met deze code kan gedrag in verwante apps worden gekoppeld. | Disable tracking stopt dit verzoek en het aanleveren van de PPID; weerverzoeken aan dezelfde host blijven. |
| [Firebase](../trackers/firebase.md) en [Meta](../trackers/meta.md) | Het onderzoek volgde in de code koppelingen voor gebeurtenissen, kenmerken, appgebruik, aankopen, identiteit en diagnose. De exacte uploadhosts zijn in dit onderzoek niet vastgelegd. | De patch onderdrukt de onderzochte initialisatie, verzameling, herkenningscodes en verzending vanuit wachtrijen. |
| [RevenueCat](../trackers/revenuecat.md) | Optionele klantkenmerken en een koppeling met een Firebase-ID kunnen extra gegevens koppelen aan de identiteit voor het abonnement. | Optionele telemetrie en kenmerken stoppen; echte klantidentiteit, aankoopbewijzen en transactieresultaten blijven. |
| [Didomi](../trackers/didomi.md) | Didomi beheert toestemmingsinstellingen en kan ook optionele prestatie- en API-metingen doen. | Optionele metingen stoppen. Je kunt de privacyinstellingen zelf blijven openen en je opgeslagen keuzes blijven behouden. |

## Wat blijft bestaan en wat weten we nog niet?

Weer, plaatszoeken, kaarten, meldingsregistratie en betalingen gebruiken nog servers. Waarschuwingsdiensten kunnen gekozen plaatsen en een meldingsidentiteit ontvangen. De exacte NotifyHub-uploadhost is hier niet vastgelegd.

De onderzochte ARM64-Play-splitset vereist Android 12L; het oudere losse bestand heeft een andere minimale Android-versie. Deze patches verlenen geen Premium.

## Beschikbare opties

Disable tracking, Fix Google services, Hide Premium banner, Hide ads, Skip consent screens.

[Bekijk wat elke patch aanpast](../reference/catalogue.md). Lees [installeren](../guides/install.md) voor uitleg over originele bestanden en ondertekening, en [patches kiezen](../guides/choose-patches.md) om te zien welke patches elkaar nodig hebben.

## Bewijs

Beoordeeld op 28 oktober 2026 tegen main `6102fa9`: [technisch onderzoek](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/TRACKING_AUDIT.md) en [broncatalogus](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/README.md). Codeonderzoek laat zien hoe de onderzochte code gebeurtenissen en gegevens verwerkt. Apparaattests bevestigen de werking die op die apparaten is gecontroleerd. Deze gids bevat geen aanvullende netwerkopnamen. [Zo lees je het bewijs](../reference/methodology.md).
