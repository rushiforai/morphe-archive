# Apple Music

Gebruik de auto-mediabrowser van Apple Music met DriveDeck, Gearslip of een andere geschikte Android Auto-host.

**Appversie:** 7.0.0 · **Build:** 1614 · **Origineel bestand:** APKM

[Gebruik je originele APKM](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Selecteer het volledige originele archief voor deze versie in Morphe Manager, inclusief de architectuur- en scherm-splits.

## Patches

| Patch | Standaard | Wat verandert er? |
| --- | --- | --- |
| **Allow custom Android Auto hosts** | Aan | Laat de auto-mediabrowser van Apple Music een externe Android Auto-host accepteren en de Android Auto-root en browsehints gebruiken. |

## Waarom de auto leeg bleef

De media3-libraryroot-callback van Apple Music controleert pakket, UID en ondertekeningscertificaat van de caller en antwoordt een geweigerde caller met "niet ondersteund". De `__AUTO_ROOT__` en de autobrowsehints worden alleen voor Google's `gearhead`-pakket gebouwd. De patch behoudt de callerlookup en accepteert de caller; daarna gebruikt elke geaccepteerde host de Android Auto-root. `QUERY_ALL_PACKAGES` wordt toegevoegd zodat Android 11 en nieuwer een willekeurig hostpakket kan vinden.

Account, catalogus en weergave van Apple Music blijven ongewijzigd.

## Voor gebruik

Meld je eerst op de telefoon aan bij Apple Music. Een gepatchte APK heeft een nieuw certificaat en kan niet in-place via de Play Store worden bijgewerkt.

[Installatie](../guides/install.md) · [Patches kiezen](../guides/choose-patches.md) · [Compatibiliteit en standaardkeuzes](../reference/catalogue.md)
