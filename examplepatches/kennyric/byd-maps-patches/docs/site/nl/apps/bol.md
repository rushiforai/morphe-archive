# bol

**Appversie:** 2026.23.1 · **Build:** 430517 · **Origineel bestand:** APKS

[Originele app downloaden](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Kies in Morphe Manager het volledige APKS-archief met de basisapp en alle onderdelen. De gepatchte uitvoer is één installeerbare APK. Android 12L of nieuwer is vereist.

## Patches

| Patch | Standaard | Wat verandert er? |
| --- | --- | --- |
| **Disable Play license check** | Aan | Laat de gepatchte app starten zonder dat het Play Store-downloadscherm de app sluit. |
| **Disable tracking** | Aan | Stopt gebruiksstatistieken, attributie, experimentrapporten en advertentie-ID's; pushmeldingen blijven beschikbaar. |
| **Hide consent screens** | Aan | Slaat schermen voor datagebruik, gegevensdeling en het inschakelen van notificaties over met lokaal geweigerde trackingkeuzes. Handmatige notificatie-instellingen en accounttoestemming op de server blijven ongewijzigd. |
| **Hide promotional content** | Aan | Verwijdert banners, merkcampagnes, promotieproducten, seizoensdecoratie en het aanbiedingenpaneel onderaan Home, spel- en dagdealpromoties, campagnesuggesties en promotiefeeds. Prijzen en kortingen bij het afrekenen blijven staan. |
| **Hide sponsored content** | Aan | Verwijdert betaalde producten, gesponsorde merkkaarten, plaatsingen in de winkelassistent en advertenties, ook apart geladen advertenties op Home. |

## Voor gebruik

De oorspronkelijke drie patches zijn gemaakt door [Wouter075](https://github.com/wouter075/bol-patches). Deze versie verhelpt gemiste advertentieroutes en voegt promotie- en trackingblokkades en het overslaan van toestemmingsschermen toe. Alleen versie 2026.23.1 build 430517 wordt ondersteund.

Een gepatchte app heeft een andere handtekening. Om de oorspronkelijke Play Store-installatie te vervangen moet die eerst worden verwijderd; daarmee verdwijnen de lokale appgegevens. Pushregistratie en winkelfuncties blijven het netwerk gebruiken.

[Installatie](../guides/install.md) · [Patches kiezen](../guides/choose-patches.md) · [Compatibiliteit en standaardkeuzes](../reference/catalogue.md)
