# Draw a Stickman: EPIC 3

Speel het spel op het Android Auto-autoscherm en op carhosts zoals DriveDeck en Gearslip.

**Appversie:** 1.13.19873 · **Build:** 19873 · **Origineel bestand:** APKS

[Gebruik je originele APKS](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Selecteer het volledige originele APKS-archief in Morphe Manager, inclusief de basis- en architectuur-APK's.

## Patches

| Patch | Standaard | Wat verandert er? |
| --- | --- | --- |
| **Hide ads** | Aan | Rondt Unity Ads-initialisatie lokaal af en meldt no-fill/not-ready voor advertenties, ook zonder listener. Geeft via beide token-API’s geen biedtoken terug. |
| **Disable tracking** | Aan | Verwijdert advertentie- en referrerrechten, schakelt advertentieproviders en Facebook-eventwachtrijen uit, geeft geen biedtoken terug en onderdrukt de analytics-verzameling en events van het spel en Unity. |

## Voor gebruik

Dit spel declareert zichzelf al als geparkte app: de launcher-activity draagt `android.intent.category.CAR_LAUNCHER` en de app declareert de gamecategorie, dus carhosts die Googles gedocumenteerde detectie volgen tonen het spel zonder manifestpatch. Alleen de advertentie- en trackingpatches worden hier aangeboden.

Beloningen die een advertentie vereisen worden niet meer aangeboden, omdat er nooit een gevulde advertentie is. Tekenfuncties, eerdere aankopen en voortgang blijven werken.

Gecontroleerd met build-, patchsessie- en manifestcontroles tegen de originele APKS. Er is geen playsessie op het autoscherm uitgevoerd.

[Installatie](../guides/install.md) · [Patches kiezen](../guides/choose-patches.md) · [Compatibiliteit en standaardinstellingen](../reference/catalogue.md)
