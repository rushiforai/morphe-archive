# HBVL

**Ondersteunde app:** 22.0.0 · **Build:** 2012316104 · **Invoer:** APKS

`be.concentra.hbvl.MediaApp`

[Download de originele APKS](https://buzzheavier.com/7lz3azzelidy){ .md-button .md-button--primary }

Selecteer dit bestand in Morphe Manager om de patches toe te passen.

HBVL gebruikt dezelfde Mediahuis-app en ingebouwde krantenlezer als de onderzochte Nieuwsblad-versie. De vier opties zijn beschikbaar in de stabiele patchbundel.

## Wat vonden we in de app?

| Activiteit / dienst | Wat ons bewijs laat zien | Wat verandert |
| --- | --- | --- |
| Advertenties en promoties | Kaching-aanvragen en gesponsorde groepen komen overeen met de onderzochte Nieuwsblad-methoden. Het Shop-filter herkent ook de exacte HBVL-hostnaam. | Hide ads gebruikt het bestaande resultaat voor uitgeschakelde advertenties en verwijdert geïdentificeerde promotiegroepen. |
| Tracking en krantenlezer | De native verzenders en volledige ingebouwde readerbundel komen overeen met Nieuwsblad. | Disable tracking stopt de gekoppelde native verzenders en logging/Engage Readers-routes; bezorging, push en inloggen blijven behouden. |
| Toestemming en Premium-UI | Onboardingstatus en abonnementsvoorwaarden in remote config komen overeen met Nieuwsblad. | De opties slaan automatische meldingen over en verbergen promoties. |

## Wat blijft bestaan en wat weten we nog niet?

Toegang tot artikelen en kranten blijft afhankelijk van echte uitgeversrechten. De opties behouden betaling, account, push en inhoudsbezorging. Opstarten, afspelen en werkelijk netwerkverkeer zijn niet op een apparaat getest voor HBVL.

## Beschikbare opties

Disable tracking, Hide Premium banner, Hide ads, Skip consent screens.

Alle opties staan standaard aan. Disable tracking bevat Hide ads; Skip consent screens bevat beide.

[Bekijk wat elke patch aanpast](../reference/catalogue.md). Lees [installeren](../guides/install.md) voor uitleg over originele bestanden en ondertekening, en [patches kiezen](../guides/choose-patches.md) om te zien welke patches elkaar nodig hebben.

## Bewijs

Op 30 oktober 2026 vergeleken met de aangeleverde originele splitset: [technische vergelijking](https://github.com/johnneerdael/dutch-applications-patches/blob/main/docs/research/2026-10-30-hbvl.md). Controles van origineel en gepatchte uitvoer toetsen de gekoppelde instructies, behouden contracten en ondersteunde selecties. Dit zijn statische en gecontroleerde instructiecontroles, zonder nieuwe apparaattest of netwerkopname. [Zo lees je het bewijs](../reference/methodology.md).
