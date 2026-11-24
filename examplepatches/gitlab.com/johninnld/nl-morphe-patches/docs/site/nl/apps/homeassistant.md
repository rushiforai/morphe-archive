# Home Assistant

Gebruik de eigen auto-interface van Home Assistant met DriveDeck of een andere geschikte projectiehost.

**Appversie:** 2026.10.1-full · **Build:** 24906 · **Origineel bestand:** APKS

[Gebruik je originele APKS](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Selecteer het volledige originele archief in Morphe Manager, inclusief de basis-, architectuur- en scherm-APK. Dit doel is de ARM64-build.

Gebruik voor de Automotive-APK-port [Home Assistant (Automotive)](homeassistant-automotive.md).

## Patches

| Patch | Standaard | Wat verandert er? |
| --- | --- | --- |
| **Allow any Android Auto host** | Aan | Opent de eigen auto-interface van Home Assistant voor elke geschikte projectiehost, zonder controle van het hostpakket of certificaat. |

## Advertentie- en trackingdiensten

Deze patch verandert de toegang tot de auto-interface. De bestaande serververbindingen, Webhooks, meldingen en online diensten van Home Assistant blijven actief.

## Voor gebruik

Meld je op de telefoon eerst aan bij een Home Assistant-server. De autoschermen gebruiken dat account en die serverkeuze. De host moet de autosjablonen van de app ondersteunen; Google's Android Auto blijft werken.

Met deze patch is hosttoegang onbeperkt: elke geschikte Android Auto-host, waaronder DriveDeck, Gearslip, MyCar, Flywheel, BetterAuto, AndroidAuto en AARE, mag verbinden, ongeacht zijn pakketnaam of ondertekeningssleutel. Installeer een gepatchte kopie alleen als je dit gedrag wilt.

[Installatie](../guides/install.md) · [Patches kiezen](../guides/choose-patches.md) · [Compatibiliteit en standaardkeuzes](../reference/catalogue.md)
