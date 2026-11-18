# EasyPark

Deze patch is uitsluitend bedoeld om EasyPark te gebruiken op Android Auto-systemen van derden, zoals DriveDeck. Gebruik je zo’n systeem niet, dan heb je deze patch niet nodig.

**Appversie:** 26.40.1 · **Build:** 82640010 · **Origineel bestand:** APKM

[Gebruik je originele APKM](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Selecteer het volledige originele archief voor deze exacte versie in Morphe Manager, inclusief de onderdelen voor architectuur en schermdichtheid.

## Patches

| Patch | Standaard | Wat verandert er? |
| --- | --- | --- |
| **Allow custom Android Auto hosts** | Aan | Staat de eigen parkeerinterface van EasyPark standaard toe op iedere compatibele host. Optioneel te beperken tot opgegeven apppakketten. |

## Advertentie- en trackingdiensten

Deze patch verandert de toegang voor autohosts. De bestaande analyse-, advertentie-, account-, locatie-, betaal- en onlinediensten van EasyPark blijven actief.

## Voor gebruik

Laat **Allowed host packages** leeg voor onbeperkte hosttoegang. Vul voor beperkte toegang één of meer Android-pakketnamen in, gescheiden door komma's, bijvoorbeeld `app.johninnl.drivedeck,app.seb3thehacker.gearslip`. Iedere andere host wordt geweigerd. Voeg `com.google.android.projection.gearhead` toe als Android Auto van Google ook toegestaan moet blijven. Patch het originele archief opnieuw om deze keuze te veranderen.

De onbeperkte modus voegt toestemming toe om geïnstalleerde pakketten op te zoeken, zodat willekeurige hosts geïdentificeerd kunnen worden. De beperkte modus maakt de opgegeven pakketten zichtbaar. Een host moet eigenaar zijn van de opgegeven pakketnaam; de ondertekening hoeft niet overeen te komen met de oorspronkelijke hostlijst van EasyPark.

De host moet de parkeersjablonen van Android Auto en het vereiste auto-API-niveau ondersteunen. Deze patch kan die mogelijkheden niet aan een scherm toevoegen. De account- en dienstvereisten van EasyPark blijven gelden. Aanmelden, betalen, apparaatverificatie door de dienst en projectie op een fysieke head-unit vereisen afzonderlijke controle; het bouwen van de patch bewijst deze werking niet.

De eigen auto-interface en het aanmeldscherm zijn gecontroleerd met Android Auto 17.9 en Desktop Head Unit op een Android 14-emulator. Een beperkte lijst weigerde dezelfde niet-opgenomen Android Auto-host. Aanmelden, parkeertransacties en fysieke HUDs zijn niet uitgevoerd.

[Installatie](../guides/install.md) · [Patches kiezen](../guides/choose-patches.md) · [Compatibiliteit en standaardinstellingen](../reference/catalogue.md)
