# Google Maps

**Appversie:** 26.43.05.1002020710 · **Build:** 1068844719 · **Origineel bestand:** APK

[Gebruik je originele APK](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Selecteer de volledige originele APK voor deze exacte versie in Morphe Manager. Android 10 of nieuwer is vereist.

Deze 30 Maps-patches komen uit [bearinmind patches](https://github.com/bearinmindcat/morphe-patches) van bearinmindcat en zijn hier aangepast voor deze Maps-versie. Dit project breidt **Waze alerts** uit met Flitsmeister en de navigatiegegevens die Vela Maps al ondersteunt.

## Patches

| Patch | Standaard | Wat verandert er? |
| --- | --- | --- |
| **120 refresh rate** | Aan | Laat Maps de ondersteunde verversingssnelheid van het scherm gebruiken. Zet dit aan in Customization; het kan meer batterij verbruiken. |
| **Account sheet cleanup** | Aan | Verwijdert de extra kop in het accountmenu en houdt het menu open bij terugkeer uit Settings of Customization. |
| **Add microG-RE support** | Uit | Maakt een aparte microG Maps-app met Google-aanmelding via microG-RE of ReVanced GmsCore. |
| **Add original microG support** | Uit | Gebruikt originele microG voor Google-aanmelding op een ROM met signature spoofing; behoudt de oorspronkelijke pakketnaam. |
| **Any media app** | Aan | Voegt geschikte muziek- en podcastapps voor Android Auto toe aan de keuze Default media app in Navigation. |
| **Avoid Flock cameras** | Aan | Biedt autoroutes om bekende Flock-camera’s heen via BRouter. Begint uit; routes met tussenstops blijven gelijk. |
| **Better offline maps** | Aan | Voegt een aanpasbaar selectievak voor offlinegebieden toe, verdeelt grote gebieden over downloads en toont gedownloade dekking. |
| **Black theme** | Aan | Gebruikt zwarte vlakken in donkere modus, ook tijdens navigatie. |
| **Blue pin** | Aan | Gebruikt een platte blauwe speld voor Maps-logo’s en het zoekpictogram. |
| **Bypass Play Services checks** | Aan | Laat de gepatchte app werken met ontbrekende of uitgeschakelde Play services en behoudt toegang tot kaarten, zoeken en routes. |
| **Change app name** | Aan | Stelt de naam in de launcher en appkiezer in; standaard is dit Ungoogled Maps. |
| **Change package name** | Aan | Installeert naast de oorspronkelijke Maps-app onder een andere pakketnaam. |
| **Customization screen** | Aan | Voegt Customization toe aan het accountmenu voor de beschikbare patchschakelaars. |
| **Flock cameras** | Aan | Toont bekende kentekencamera’s met een melding en geluid bij nadering. Begint uit; gebruikt OpenStreetMap-gegevens. |
| **Follow playing media** | Uit | Toont media van apps die niet rechtstreeks met Maps verbinden. Vereist meldingstoegang. |
| **Hide ads and clutter** | Aan | Verbergt gesponsorde spelden en zoekresultaten, AI-samenvattingen, bedrijfsrijen, de Explore-feed en onderste tabbladen. |
| **Legacy icon** | Aan | Herstelt de platte meerkleurige Maps-speld van vóór het verloopicoon. |
| **Location provider toggle** | Aan | Voegt een keuze toe tussen locatie via Android, Google Play services of microG-RE, met terugval op netwerklocatie. |
| **Offline saved places** | Aan | Bewaart plaatsen en lijsten lokaal, importeert en exporteert back-ups en voegt een optionele lokale Timeline-opname toe. |
| **Power saving mode** | Aan | Voegt een zwart navigatiescherm toe en instellingen voor de knop, automatisch openen, snelheidsmeter en beeldsnelheid. |
| **Proxy** | Aan | Voegt een HTTP-proxyinstelling voor Maps-verkeer toe; kaarten laden niet door als de ingestelde proxy onbereikbaar is. |
| **Rectangle shapes** | Aan | Maakt afgeronde hoeken en navigatieknoppen rechthoekig. |
| **Remove permissions** | Aan | Verwijdert geselecteerde account-, advertentie- en sensorrechten, waaronder microfoon en camera. Spraakzoeken, Lens en Live View werken daardoor niet. |
| **Remove sign-in prompts** | Aan | Verbergt aanmeldverzoeken bij de eerste start, bij zoeken en in het accountmenu. |
| **Remove telemetry** | Aan | Vermindert advertentiemeldingen, gebruiksmetingen, prestatiemetingen, enquêtes en leerdiensten op de achtergrond. |
| **Speed cameras** | Aan | Toont flitsers en roodlichtcamera’s uit OpenStreetMap met een melding en geluid bij nadering. Begint uit. |
| **Speeding chime** | Aan | Voegt een geluid toe wanneer de snelheid de bekende limiet overschrijdt; stel de drempel in bij de externe gegevens. |
| **Trim account menu** | Aan | Verwijdert Timeline, Location sharing, Your data in Maps en Help & feedback uit het accountmenu. |
| **Waze alerts** | Aan | Voegt Waze en Flitsmeister toe als lokale bronnen voor wegmeldingen, voorwaarschuwingen, snelheid, limieten en waargenomen trajectcontroles. Begint uit. |
| **Zoom controls in navigation** | Aan | Voegt knoppen voor inzoomen, uitzoomen en herstellen toe terwijl de navigatiecamera blijft volgen. |

## Advertentie- en trackingdiensten

**Remove telemetry** en **Hide ads and clutter** verminderen de genoemde advertentie- en meetfuncties. Maps blijft Google-diensten gebruiken voor kaarten, zoeken, routes en ingeschakelde accountfuncties. De gekozen Waze- of Flitsmeister-bron blijft zijn eigen diensten gebruiken.

Externe navigatiegegevens worden lokaal ontvangen van de gekozen app op dezelfde telefoon. Cameralagen van OpenStreetMap downloaden cameraposities in de buurt. **Avoid Flock cameras** stuurt het begin en einde van de route naar `brouter.de` wanneer dit aanstaat. Deze functies beginnen uit in de instellingen voor externe gegevens.

## Voor gebruik

Laat **Change package name** geselecteerd om naast de oorspronkelijke Maps-app te installeren; de standaardpakketnaam is `org.ungoogled.android.apps.maps`. **Change app name** gebruikt standaard **Ungoogled Maps**. Met **Add microG-RE support** worden de standaardwaarden `org.ungoogled.android.apps.maps.microg` en **microG Maps**. De twee microG-patches zijn alternatieven: kies alleen de variant die bij je omgeving past. Originele microG vereist een ROM met signature spoofing en behoudt de oorspronkelijke Maps-pakketnaam.

Open **Customization** en **Waze & external data source** in het accountmenu om de gekozen patches in te stellen. **Aan** in de tabel betekent dat de patch standaard geselecteerd is tijdens het patchen; cameralagen en externe bronnen moeten daarnaast in de app worden aangezet. **120 refresh rate** begint ook uit in Customization.

Patch voor uitgebreide gegevens [Waze 5.26.90.901](waze.md) of [Flitsmeister 14.17](flitsmeister.md) met **Broadcast navigation data**, open de bron eenmaal en laat de rij- of locatiedienst op de achtergrond draaien. De overlay mag uit blijven. Open **Navigation data source** in de instellingen voor externe gegevens van Maps en kies **De-Waze · navigation data** of **Flitsmeister · navigation data**. **Off · Google Maps** herstelt de eigen gegevens van Maps. Gebruik je de optionele **Receiver package** van de bronpatch, vul dan de pakketnaam van je gepatchte Maps-installatie in. Vanaf Android 14 kan Android de afzender controleren; oudere versies bieden die afzendercontrole niet.

Kies **Waze · Share alerts with Maps** voor de oorspronkelijke meldingsmodus, met Waze gepatcht met **Share alerts with Maps**, aangemeld en draaiend. Uitgebreide navigatiegegevens voegen actuele snelheid, wegbeperkingen, beschikbare wegmeldingen en trajectwaarnemingen toe. De dekking hangt af van wat de bron waarneemt; een gemiddelde gaat alleen over het waargenomen deel van het traject. Het is geen officieel gemiddelde voor de hele trajectcontrole.

Zet **Compact speed and average-speed control** aan voor actuele snelheid naast een snelheidsbord en, tijdens een waargenomen traject, het gedeeltelijke gemiddelde, de voortgang en resterende afstand. **Road alert types** bepaalt welke meldingen spelden en voorwaarschuwingen kunnen geven; alleen politie staat standaard geselecteerd. Spelden en geluid bij nadering hebben aparte schakelaars. De afstand komt van de bron of wordt uit positie en rijrichting geschat en als schatting aangeduid; dit bewijst niet dat de melding op je gekozen route ligt.

Een bron kiezen vult ontbrekende weggegevens niet aan. Verlopen of ontbrekende externe waarden vallen waar mogelijk terug op verse Maps-gegevens; onbekende waarden blijven onbekend. Een bronwissel, het verlaten van een traject of verlopen waarnemingen verwijdert het gedeeltelijke gemiddelde. Zolang een moderne externe bron bruikbare verse gegevens levert, pauzeren de eigen Flock-spelden en geluiden van Maps om dubbele meldingen te voorkomen; je opgeslagen Flock-instellingen blijven behouden. Flock-routevermijding blijft zijn eigen cameragegevens gebruiken, omdat externe meldingen geen gegevensverzameling voor routeberekening leveren.

**Remove permissions** schakelt spraakzoeken, Lens en Live View uit door de wijzigingen aan microfoon- en cameratoegang. De microG-RE-accountversie behoudt de bijbehorende accountrechten en -diensten. **Proxy** heeft een ondersteunde netwerkengine nodig; volg de beschikbaarheidsmelding in de app. **Follow playing media** vereist meldingstoegang en is niet bedoeld voor root mount-installaties. De rechtstreekse media-integratie van YouTube Music en Spotify blijft afhankelijk van Google’s eigen Maps; gebruik waar mogelijk de optie via meldingen.

[Installeren](../guides/install.md) · [Patches kiezen](../guides/choose-patches.md) · [Compatibiliteit en standaardkeuzes](../reference/catalogue.md)
