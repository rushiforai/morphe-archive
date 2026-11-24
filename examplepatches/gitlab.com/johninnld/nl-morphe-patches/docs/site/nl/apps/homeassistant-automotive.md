# Home Assistant (Automotive)

Gebruik de eigen auto-interface van Home Assistant met DriveDeck of een andere geschikte projectiehost.

**Appversie:** 2026.11.2-full · **Build:** 25803 · **Origineel bestand:** APK

[Gebruik je originele APK](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Selecteer de volledige originele Automotive-APK in Morphe Manager. De patch **Android Auto** maakt deze build geschikt voor een telefoon en compatibele autohosts met sjablonen.

## Patches

| Patch | Standaard | Wat verandert er? |
| --- | --- | --- |
| **Allow any Android Auto host** | Aan | Opent de eigen auto-interface van Home Assistant voor elke geschikte projectiehost, zonder controle van het hostpakket of certificaat. |
| **Android Auto** | Aan | Maakt de Automotive-APK geschikt voor de standaard Android Auto-interface met sjablonen, met installatie op de telefoon en ondersteuning voor voertuiggegevens en de microfoon via de host. Op Automotive-hardware blijft de oorspronkelijke werking beschikbaar. |

## Advertentie- en trackingdiensten

Deze patch verandert de toegang tot de auto-interface. De bestaande serververbindingen, Webhooks, meldingen en online diensten van Home Assistant blijven actief.

## Voor gebruik

Meld je op de telefoon eerst aan bij een Home Assistant-server. De autoschermen gebruiken dat account en die serverkeuze. De host moet de autosjablonen van de app ondersteunen; Google's Android Auto blijft werken.

De Android Auto-port is alleen voor de Automotive-APK. Open de gepatchte app op de telefoon om de installatie te voltooien en open Home Assistant daarna in je autohost. Voertuiggegevens vereisen echte ondersteuning door de host en toestemming van de gebruiker; ontbrekende waarden worden niet verzonnen. Voor een zelf geïnstalleerde app kan Unknown sources in de ontwikkelaarsinstellingen van Android Auto nodig zijn.

Met deze patch is hosttoegang onbeperkt: elke geschikte Android Auto-host, waaronder DriveDeck, Gearslip, MyCar, Flywheel, BetterAuto, AndroidAuto en AARE, mag verbinden, ongeacht zijn pakketnaam of ondertekeningssleutel. Installeer een gepatchte kopie alleen als je dit gedrag wilt.

[Installatie](../guides/install.md) · [Patches kiezen](../guides/choose-patches.md) · [Compatibiliteit en standaardkeuzes](../reference/catalogue.md)
