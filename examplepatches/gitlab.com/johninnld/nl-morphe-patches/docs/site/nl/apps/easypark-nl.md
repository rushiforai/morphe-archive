# EasyPark NL

**Appversie:** 26.42.4 · **Build:** 82642040 · **Origineel bestand:** APKS

[Gebruik je originele splitarchief](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Deze patch is uitsluitend bedoeld om EasyPark te gebruiken op Android Auto-systemen van derden, zoals DriveDeck. Gebruik je zo’n systeem niet, dan heb je deze patch niet nodig.

Dit is de Nederlandse app, pakket `com.parkmobile`. Dit is een ander doel dan de internationale app `net.easypark.android`. Selecteer het volledige originele archief in Morphe Manager, inclusief de onderdelen voor architectuur, taal en schermdichtheid.

## Patches

| Patch | Standaard | Wat verandert er? |
| --- | --- | --- |
| **Add microG-RE support** | Aan | Maakt aanmelden met Google via geïnstalleerde MicroG-RE mogelijk. Nodig om aan te melden in de gepatchte Nederlandse app. |
| **Allow custom Android Auto hosts** | Aan | Staat de eigen parkeerinterface van EasyPark NL standaard toe op iedere compatibele host, waaronder DriveDeck. Optioneel te beperken tot opgegeven apppakketten. |

## Advertentie- en trackingdiensten

Deze patch verandert de toegang voor autohosts. De bestaande analyse-, advertentie-, account-, locatie-, betaal- en onlinediensten van de app blijven actief.

## Voor gebruik

Laat **Allowed host packages** leeg voor onbeperkte toegang. Vul `app.johninnl.drivedeck` in om alleen DriveDeck toe te staan. Voeg andere pakketnamen toe, gescheiden door komma's, als dat nodig is. Iedere niet-opgenomen host wordt geweigerd; voeg `com.google.android.projection.gearhead` toe als Android Auto van Google toegestaan moet blijven. Patch het originele archief opnieuw om deze keuze te veranderen.

De onbeperkte modus voegt toestemming toe om geïnstalleerde pakketten op te zoeken, zodat willekeurige hosts geïdentificeerd kunnen worden. De beperkte modus maakt de opgegeven pakketten zichtbaar. Iedere host moet eigenaar zijn van de opgegeven pakketnaam, ongeacht de ondertekening.

De host moet de parkeersjablonen van Android Auto en het auto-API-niveau van de app ondersteunen. Meld je op de telefoon aan bij de gepatchte app voordat je accountafhankelijke parkeerfuncties in DriveDeck verwacht. Deze patch activeert geen account en omzeilt geen verificatie door de dienst of betaalvereisten.

**Aanmelden vereist MicroG-RE.** Installeer een compatibele `app.revanced.android.gms`-provider en meld je aan met Google. Getest is MicroG-RE 7.3.0. Aanmelden met telefoonnummer of e-mail werkt niet in de gepatchte app. Accounts die daarna nog afzonderlijke e-mail- of telefoonverificatie vereisen, kunnen daardoor geblokkeerd blijven.

De aangemelde Nederlandse app opende het eigen parkeerscherm in DriveDeck op een fysieke telefoon. Parkeer- en betaaltransacties zijn niet getest.

[Installatie](../guides/install.md) · [Patches kiezen](../guides/choose-patches.md) · [Compatibiliteit en standaardinstellingen](../reference/catalogue.md)
