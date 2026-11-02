# Vela Maps

**Appversie:** 0.5.2621 · **Build:** 46210 · **Origineel bestand:** APK

[Download APK](https://buzzheavier.com/64jger382td4){ .md-button .md-button--primary }

Selecteer de volledige originele APK voor deze exacte versie in Morphe Manager.

## Patches

| Patch | Standaard | Wat verandert er? |
| --- | --- | --- |
| **External speed controls** | Aan | Voegt De-Waze en Flitsmeister toe als bronnen voor snelheid en wegwaarschuwingen in Vela en Android Auto, met compacte weergave van snelheid, limiet, gedeeltelijk gemiddelde en voorwaarschuwingen. |

## Advertentie- en trackingdiensten

Deze patch voegt geen apart account, advertentiedienst of upload van gebruiksmetingen toe. De gekozen bron blijft zijn eigen kaarten, verkeers-/locatie-uitwisseling en meldingsdiensten gebruiken. Vela behoudt zijn bestaande online- en locatiegedrag.

Wegmeldingen kunnen posities van camera's of incidenten bevatten. De integratie ontvangt die lokaal van de bron op hetzelfde toestel; de apparaatlocatie van Vela wordt niet naar de bron gestuurd.

## Voor gebruik

Patch [Waze 5.26.90.901](waze.md) of [Flitsmeister 14.17](flitsmeister.md) met **Broadcast navigation data**, open de app eenmaal en laat de achtergrondlocatie- of rijdienst draaien. De overlay mag uit blijven. De optionele **Receiver package** van de bronpatch kan op `app.vela` worden gezet. Vanaf Android 14 kan Vela via Android controleren welke bron de gegevens verstuurt; oudere versies bieden die afzendercontrole niet.

Open **Snelheid en wegwaarschuwingen** in de navigatie-instellingen van Vela en kies **Vela (eigen gegevens)**, **De-Waze** of **Flitsmeister**. De keuze wordt opgeslagen. Dezelfde keuze staat onder **Navigatieprovider** in de instellingen van Android Auto. **Gesproken wegwaarschuwingen** volgt de stem- en dempinstellingen van Vela; de autodetails hebben een eigen schakelaar.

Met een externe bron gekozen toont de compacte kaartweergave de actuele snelheid naast het snelheidsbord. Bij een actieve trajectcontrole verschijnen daaronder het waargenomen gemiddelde, een voortgangsbalk, percentage en resterende afstand. Het gemiddelde gaat alleen over het waargenomen deel, ook als de bron midden in een traject wordt geopend. Het blijft onbekend totdat genoeg afstand en tijd zijn waargenomen; geschatte voortgang krijgt **≈**. Voorwaarschuwingen gebruiken echte waarnemingen vóór het traject of verse meldingsposities. Beschikbare meldingen omvatten vaste en mobiele flitsers, politie, gevaren, ongevallen, files, afsluitingen en ingeschakelde Flock-camera's van de bron. De dekking hangt af van de bron; geschatte afstanden blijven benaderingen.

Ontbrekende of verlopen waarden vallen waar mogelijk terug op de eigen gegevens van Vela. De bronstatus vermeldt die terugval; een onbekende actuele snelheid krijgt **—**. Een bronwissel, het verlaten van een traject of het verlopen van de trajectwaarnemingen verwijdert dat gedeeltelijke gemiddelde. Gegevens van de twee bronnen blijven gescheiden.

Als een externe bron is gekozen, pauzeert Vela tijdelijk zijn eigen Flock-weergave en waarschuwingen zolang **een van beide** ondersteunde bronnen verse bruikbare gegevens levert. De pauze kan dus doorgaan als de gekozen bron wegvalt maar de andere nog gegevens aanbiedt. Opgeslagen Flock-voorkeuren blijven behouden. Zodra geen van beide verse bruikbare gegevens levert, hervat Vela zijn eigen Flock-gedrag volgens die opgeslagen keuzes. **Vela (eigen gegevens)** kiezen herstelt ook het normale gedrag.

Telefooninstellingen, ontvangst op de achtergrond, compacte telefoon- en autoweergave en gesproken voorwaarschuwingen zijn gecontroleerd op een Android 16-emulator met Gearslip als autohost. Ritten op de weg, fysieke autoschermen en de Android Auto-host van Google zijn niet gevalideerd. Een al gestarte native Flock-verversing kan tijdens de weergave- en waarschuwingspauze aflopen.

[Installeren](../guides/install.md) · [Patches kiezen](../guides/choose-patches.md) · [Compatibiliteit en standaardkeuzes](../reference/catalogue.md)
