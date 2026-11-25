# TIDAL

Gebruik de auto-mediabrowser van TIDAL met DriveDeck, Gearslip of een andere geschikte Android Auto-host.

**Appversie:** 2.216.0 · **Build:** 10020 · **Origineel bestand:** APKM

[Gebruik je originele APKM](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Selecteer het volledige originele archief voor deze versie in Morphe Manager, inclusief de architectuur-, taal- en scherm-splits.

## Patches

| Patch | Standaard | Wat verandert er? |
| --- | --- | --- |
| **Allow custom Android Auto hosts** | Aan | Laat de auto-mediabrowser van TIDAL een externe Android Auto-host accepteren in plaats van hem via TIDAL's certificaatlijst van bekende hosts te weigeren. |

## Waarom de auto leeg bleef

TIDAL's `MediaBrowserService` krijgt de pakketnaam en UID van de host, zoekt de caller op en vergelijkt het ondertekeningscertificaat met TIDAL's lijst van bekende auto-hosts. Een externe host heeft een ander certificaat, waardoor TIDAL geen browserroot teruggaf en de auto leeg bleef. De patch behoudt de callerlookup en de rootopbouw en slaat alleen de afwijzingsbranch over. `QUERY_ALL_PACKAGES` wordt toegevoegd zodat Android 11 en nieuwer het willekeurige hostpakket kan vinden.

Account, abonnement, catalogus en weergave van TIDAL blijven ongewijzigd.

## Voor gebruik

Meld je eerst op de telefoon aan bij TIDAL. De host moet het media-browserprotocol en de gebruikte mediasjablonen ondersteunen. Een gepatchte APK heeft een nieuw certificaat en kan niet in-place via de Play Store worden bijgewerkt.

[Installatie](../guides/install.md) · [Patches kiezen](../guides/choose-patches.md) · [Compatibiliteit en standaardkeuzes](../reference/catalogue.md)
