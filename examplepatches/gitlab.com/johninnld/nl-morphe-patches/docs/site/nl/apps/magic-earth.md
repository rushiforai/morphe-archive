# Magic Earth

Gebruik de eigen navigatie-interface van Magic Earth met geschikte Android Auto-hosts, waaronder DriveDeck en andere eigen HUD-backends.

**Appversie:** 7.1.26.38.B4684D03.6207A61BA · **Build:** 2026141716 · **Origineel bestand:** APKM

[Gebruik je originele APKM](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

De functie- en GEM-patches ondersteunen alleen ARM64. Gebruik de originele ARM64-set met de basis-, taal- en scherm-APK's; deze patches ondersteunen geen ARMv7-bibliotheek.

## Patches

| Patch | Standaard | Wat verandert er? |
| --- | --- | --- |
| **Allow custom Android Auto hosts** | Aan | Laat geschikte eigen HUD-hosts verbinding maken met de navigatieservice, zonder toegang te beperken tot de Google-host. |
| **Enable TV launcher** | Aan | Toont de bestaande app in TV-launchers en maakt aanraakinvoer optioneel. |
| **Enable local feature controls** | Uit | Opent lokale verkeers-, opname-, offlinekaart- en hoogtestijlopties, schakelt lokale geschiktheid voor autonavigatie in en verbergt enkele premiumaanbiedingen. |
| **Disable Google telemetry transport** | Uit | Laat Google-telemetrie vervallen en voorkomt Google-uploads die nog in de wachtrij staan. |
| **Disable GEM telemetry dispatch** | Uit | Voorkomt dat de onderzochte GEM-gebruiks- en crashrapporttaken worden ingepland. Lokale statistiekopslag kan blijven bestaan. |

## Advertentie- en trackingdiensten

De optionele privacypatches richten zich op Google's telemetrievervoer en het inplannen van GEM-gebruiks- en crashrapporten. Kaart- en verkeersverbindingen blijven behouden. De patches claimen niet dat ieder mogelijk trackingpad wordt verwijderd.

## Voor gebruik

Schakel **Enable local feature controls** in voor de functie- en auto-opties. Kies de twee privacypatches voor de aanvullende onderdrukking. Online verkeer en kaartdownloads hebben nog steeds werkende diensten en een verbinding nodig.

Open Magic Earth op de telefoon en rond de normale installatie en toestemmingsvragen af voordat je de app in een host kiest. De host moet de navigatiesjablonen en het oppervlakteprotocol ondersteunen. De TV-launcherpatch maakt de app vindbaar en voegt geen nieuwe afstandsbedieningsinterface toe.

[Installatie](../guides/install.md) · [Patches kiezen](../guides/choose-patches.md) · [Compatibiliteit en standaardkeuzes](../reference/catalogue.md)
