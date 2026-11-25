# Zoom Workplace

Gebruik de eigen auto-interface van Zoom met DriveDeck of een andere geschikte projectiehost.

**Appversie:** 7.2.1.43844 · **Build:** 6702010 · **Origineel bestand:** APKS

[Gebruik je originele APKS](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Selecteer het volledige originele archief in Morphe Manager, inclusief de basis-, architectuur- en scherm-APK. Dit doel is de ARM64-build.

## Patches

| Patch | Standaard | Wat verandert er? |
| --- | --- | --- |
| **Allow all Android Auto hosts** | Aan | Opent de eigen vergadering- en telefooninterface van Zoom voor elke geschikte projectiehost, zonder controle van het hostpakket of certificaat. |

## Advertentie- en trackingdiensten

Deze patch verandert de toegang tot de auto-interface. De bestaande accounts, analytics, rechten en online diensten van Zoom blijven actief.

## Voor gebruik

Meld je op de telefoon aan bij Zoom. De patch houdt de autoservice van Zoom ingeschakeld, zodat geschikte hosts deze na installatie en opstarten kunnen vinden. Beschikbare vergaderingen en Zoom Phone-functies hangen af van je account en licentie. De host moet de autosjablonen en het vereiste auto-API-niveau van Zoom ondersteunen.

De patch voorkomt ook dat Zoom zichzelf sluit doordat de gepatchte app een ander APK-ondertekeningscertificaat gebruikt. Het autoscherm kan ook opnieuw openen als een host geen autofabrikant of model doorgeeft.

Met deze patch is hosttoegang onbeperkt. Installeer een gepatchte kopie alleen als je dit gedrag wilt. De patch voegt geen videovergaderingsschermen toe aan het autoscherm.

[Installatie](../guides/install.md) · [Patches kiezen](../guides/choose-patches.md) · [Compatibiliteit en standaardkeuzes](../reference/catalogue.md)
