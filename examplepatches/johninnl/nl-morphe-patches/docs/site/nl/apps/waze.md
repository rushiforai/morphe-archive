# Waze

**Appversie:** 5.26.90.901 · **Build:** 1030746 · **Origineel bestand:** APKM

[Download originele app](https://buzzheavier.com/cpwy7pirf997){ .md-button .md-button--primary }

Gebruik het volledige originele APKM-archief voor deze versie in Morphe Manager.

[Waze installeren voor Android Auto: stappen met screenshots](../guides/android-auto.md){ .md-button }

## Waar deze patches vandaan komen

24 van deze 40 patches komen uit [bearinmind patches](https://github.com/bearinmindcat/morphe-patches) van bearinmindcat, waar ze als De-Waze voor Waze 5.24.5.0 worden uitgebracht. Dit project heeft ze overgezet naar 5.26.90.901 en onderhoudt die versie zelf. Vijf aanvullende patches en de uitbreidingen op bearinmind patches komen van dit project, vergeleken met bearinmind patches v2.8.3.

| Onderdeel | Toegevoegd door dit project |
| --- | --- |
| Advertenties | **Hide ads** verwijdert ook gesponsorde zoekresultaten op de telefoon en in de auto, het advertentietoken en de Adspam-cookie bij zoekopdrachten en promoties in het hoofdmenu, ook als Waze die al had opgeslagen. |
| Telemetrie | **Remove telemetry** stopt ook het ophalen van de advertentie-ID en verbergt een opgeslagen ID, gooit gebruiksgegevens weg die al klaarstonden om te versturen, blokkeert automatische diagnoselogs en zet Firebase Sessions uit. Je kunt logs nog steeds zelf versturen. |
| Toestemming | Nieuw: **Skip consent screens** beantwoordt privacy- en voorwaardenvragen zonder scherm en weigert gepersonaliseerde advertenties. |
| Muziek | Nieuw: **SoundCloud in Waze** en **YT Music Morphe in Waze** voegen beide diensten toe aan de ingebouwde audiospeler. |
| Andere apps | Nieuw: **Broadcast navigation data** deelt snelheids- en trajectgegevens met andere apps en met **Support Gearslip** kan Gearslip Waze draaien, ook een gepatchte Gearslip. |
| Waarschuwingen delen | **Share alerts with Maps** stopt nu direct als je het uitzet en wist waarschuwingen die al gedeeld waren. |

De elf optionele functies hieronder zijn voor deze Waze-versie aangepast uit [Forsigh Waze Patches](https://github.com/Forsigh/waze-patches).

## Patches

### Toegevoegd door dit project

| Patch | Standaard | Wat verandert er? |
| --- | --- | --- |
| **Broadcast navigation data** | Aan | Deelt actuele snelheid, snelheidslimieten, wegmeldingen en naderende/actieve trajectcontroles met andere apps terwijl Waze op de achtergrond draait. Geen overlay nodig. |
| **Skip consent screens** | Aan | Rondt privacy- en voorwaardenkeuzes zonder scherm af en weigert gepersonaliseerde advertenties. Lees de toelichting hieronder. |
| **SoundCloud in Waze** | Aan | Voegt SoundCloud toe aan de ingebouwde audiospeler. Show list toont de ingelogde Feed en afspeelbare mixes, niet je persoonlijke bibliotheek. |
| **Support Gearslip** | Aan | Accepteert Gearslip als autohost op pakketnaam, met welke sleutel het ook is ondertekend, zodat een gepatchte Gearslip blijft werken. Andere hosts houden de Android Auto-validatie. |
| **YT Music Morphe in Waze** | Aan | Voegt YT Music Morphe toe aan de ingebouwde audiospeler. Show list toont ondersteunde Home-aanbevelingen en mixes, niet je persoonlijke bibliotheek. |

### Uit bearinmind patches, hier uitgebreid

| Patch | Standaard | Wat verandert er? |
| --- | --- | --- |
| **Hide ads** | Aan | Verwijdert gesponsorde kaartpictogrammen, advertenties bij stilstand en bijbehorende advertentietracking, plus gesponsorde zoekresultaten en promoties in het hoofdmenu. |
| **Remove telemetry** | Aan | Stopt de ondersteunde crashrapporten, gebruiksstatistieken en prestatiegegevens, en blokkeert ook het ophalen van de advertentie-ID, wachtende gebruiksgegevens en automatische diagnoselogs. Verkeersmeldingen blijven werken. |
| **Share alerts with Maps** | Aan | Deelt Waze-waarschuwingen met Ungoogled Maps op dezelfde telefoon. Waze moet open zijn en je moet ingelogd zijn. Zet je dit uit, dan stopt het delen direct. |

### Uit bearinmind patches, overgezet naar 5.26.90.901

| Patch | Standaard | Wat verandert er? |
| --- | --- | --- |
| **Alert distances** | Aan | Stelt in hoe vroeg een waarschuwing wordt uitgesproken. |
| **All moods** | Uit | Maakt alle stemmingen beschikbaar, ook bètastemmingen. |
| **Average speed zone bar** | Aan | Toont voortgang en je gemiddelde snelheid bij trajectcontrole. Zet dit na het patchen aan in Customization. |
| **Bigger alert pins** | Uit | Vergroot waarschuwingspictogrammen op de kaart. |
| **Bigger speedometer** | Aan | Vergroot de cijfers van de snelheidsmeter en maximumsnelheid. |
| **Change app name** | Aan | Verandert de appnaam, standaard in De-Waze. Die naam zie je ook in Android Auto. |
| **Flock cameras** | Aan | Geeft een geluid bij een naderende Flock-camera uit OpenStreetMap. Voegt geen kaartpictogrammen of routes toe. Zet dit aan in Customization. |
| **Full black** | Aan | Maakt de donkere weergave zwart voor AMOLED-schermen. |
| **Map skin** | Aan | Vergroot kaartlabels en de navigatiepijl en geeft de dagkaart een warme achtergrond. |
| **Navigation distances** | Uit | Past aankondigingsafstanden in Android Auto en de drempel voor de verkeersbalk aan. |
| **No AI reporting** | Uit | Zet spraakmeldingen via Gemini uit. |
| **No Google Assistant** | Uit | Verwijdert Google Assistant uit Waze. |
| **Open without device location** | Uit | Laat Waze openen als locatie uitstaat. Navigatie heeft nog steeds locatietoegang nodig. |
| **Remove permissions** | Aan | Verwijdert toegang tot contacten, agenda, telefoon, camera en advertentie-ID. |
| **Remove sign-in prompts** | Aan | Verbergt Wazes herinnering om je account te registreren. |
| **Report speed limit** | Uit | Maakt het aanpassen van de maximumsnelheid via de snelheidsmeter beschikbaar. De werking is niet bevestigd. |
| **Speed camera alerts** | Aan | Geeft een geluid bij een naderende flitspaal uit OpenStreetMap. Voegt geen kaartpictogrammen of routes toe. Zet dit aan in Customization. |
| **Speed camera sound at any speed** | Aan | Laat het flitspaalgeluid ook horen wanneer je niet te hard rijdt. |
| **Speed cameras everywhere** | Uit | Maakt flitspaal- en politiewaarschuwingen in elk land beschikbaar. Controleer voor vertrek de plaatselijke regels. |
| **Speed limit sign** | Uit | Gebruikt in elk land dezelfde stijl voor het snelheidslimietbord. |
| **Stay awake in the background** | Uit | Houdt Waze zonder actieve route op de achtergrond open om waarschuwingen met Maps te delen. Dit gebruikt meer batterij. |

### Optionele functies aangepast uit Forsigh Waze Patches

Alle elf patches staan standaard uit. Selecteer bij het patchen alleen de gewenste functies; hun schakelaars staan daarna aan in Customization.

| Patch | Standaard | Wat verandert er? |
| --- | --- | --- |
| **Auto zoom** | Uit | Bewaart de gekozen automatische zoomstand: uit, aan of op basis van snelheid. De stand blijft instelbaar in Customization. |
| **Lane guidance** | Uit | Maakt rijstrookadvies en optionele aanwijzingen voor rechtdoor beschikbaar als er rijstrookgegevens zijn. Je eigen rijstrookinstelling in Waze blijft gelden. |
| **Extra map info** | Uit | Voegt aparte schakelaars voor het kompas en tolprijzen toe. Prijzen verschijnen alleen als Waze die bij de route levert. |
| **Speed limit controls** | Uit | Voegt aparte schakelaars toe voor een blijvend zichtbare bekende snelheidslimiet en waarschuwingen voor een lagere limiet. De waarschuwingsafstand is instelbaar, aanvankelijk 1.000 m. Rapportage en bordstijl blijven apart. |
| **Car alerts as notifications** | Uit | Gebruikt automeldingen voor ondersteunde waarschuwingen als de autohost die ondersteunt. |
| **Car traffic meter** | Uit | Maakt de verkeersmeter beschikbaar op ondersteunde navigatieschermen in de auto. |
| **Native camera and hazard controls** | Uit | Houdt geselecteerde telefoon-, busstrook-, carpool/HOV- en geluidscamera's en waarschuwingen voor verhoogde oversteekplaatsen en oversteekplaatsen op snelwegen ingeschakeld. Inclusief kaartweergave, meldingen en bijbehorende camerageluiden. Vereist Waze-gegevens. |
| **Speed bump controls** | Uit | Voegt aparte schakelaars toe om drempels op de kaart te tonen en waarschuwingen onderweg te onderdrukken. |
| **Car reconnect grace period** | Uit | Houdt Waze gereed bij korte onderbrekingen van Android Auto. Aanvankelijk 2 minuten, instelbaar van 1 tot 10; de achtergrondtijd op de telefoon blijft ongewijzigd. |
| **Hide recent destinations** | Uit | Verbergt recente bestemmingen zonder opgeslagen geschiedenis te wissen. Favorieten en toekomstige afspraken blijven beschikbaar. Open de lijst opnieuw na het omschakelen. |
| **Allow high refresh rate** | Uit | Verhoogt de limiet voor de schermmodus op de telefoon aanvankelijk naar 90 Hz, instelbaar van 60 tot 120 Hz. Gebruikt ondersteunde modi; garandeert geen hogere beeldsnelheid en verandert de verversing van het autoscherm niet. |

Stel deze functies op de telefoon in voordat je verbinding maakt. Controleer autofuncties apart in Gearslip of Android Auto; selecteren garandeert niet dat iedere host ze toont.

Zet je een camera-, oversteekplaats- of drempelschakelaar uit, dan beheert Waze die instelling weer zelf. De Waze-camerafuncties vullen onze OpenStreetMap-waarschuwingen aan; ze voegen geen ontbrekende weggegevens toe. De onderdrukking van drempelwaarschuwingen breidt Forsighs kaartinstelling uit met een aparte waarschuwingsinstelling.

Herstart Waze na het wijzigen van de schermlimiet of herverbindingsperiode en verbind de auto opnieuw. Een herverbindingsperiode kan Waze langer actief houden na het verbreken van de verbinding. Een hogere verversing op de telefoon kan meer batterij gebruiken en warmte veroorzaken; controleer beeldweergave en verbruik op je eigen telefoon.

## Advertentie- en trackingdiensten

Hide ads en Remove telemetry beperken de ondersteunde advertenties, crashrapporten en gebruiksmetingen. Waze gebruikt nog steeds online diensten voor kaarten, routes, live verkeer, accounts en meldingen. Deze patches maken navigatie niet anoniem.

## Voor gebruik

Open na het patchen **Customization** in het zijmenu onder **Shut off**. Daar stel je de toegepaste functies in. Speed camera alerts, Flock cameras en Average speed zone bar staan daar eerst uit, ook als je de patches hebt geselecteerd. Herstart Waze na wijzigingen aan de kaartstijl of waarschuwingspictogrammen.

**Broadcast navigation data** gebruikt Wazes native engine en locatietoegang op de achtergrond, zonder zichtbare telefoonactiviteit. De achtergrondoptie wordt automatisch meegenomen (standaard 180 minuten, instelbaar). Native waarnemingen vóór een traject kunnen een voorwaarschuwing geven. Beschikbare meldingen omvatten camera’s, politie, gevaren, ongevallen, files en afsluitingen, plus ingeschakelde Flock- en flitserlagen. Gemiddelden gelden voor het waargenomen deel van een trajectcontrole; geschatte voortgang en ontbrekende/verouderde waarden worden apart aangeduid. [Broadcastprotocol](https://github.com/johninnl/nl-morphe-patches/blob/main/docs/navigation-broadcasts.md).

**Skip consent screens** maakt privacy- en voorwaardenkeuzes zonder die schermen te tonen. Gepersonaliseerde advertenties worden geweigerd; verplichte voorwaarden worden geaccepteerd. Laat deze patch uit als je de keuzes zelf wilt lezen en maken. Remove telemetry en Remove permissions beperken de genoemde gegevens; noodzakelijke navigatiediensten blijven actief.

Voor Android Auto volg je de [KingInstaller-stappen met screenshots](../guides/android-auto.md). Door **Change app name** kan Waze als **De-Waze** in de applijst staan. De twee audiopatches zijn niet aan één versie gebonden, maar de overige patches op deze pagina richten zich op 5.26.90.901. Beschikbare audio-inhoud hangt af van je muziekapp en account. Routebegeleiding, waarschuwingen op de weg en elke auto-opstelling zijn hiermee niet volledig getest. Report speed limit is nog onbevestigd.

[Installeren](../guides/install.md) · [Patches kiezen](../guides/choose-patches.md) · [Compatibiliteit en standaardkeuzes](../reference/catalogue.md#waze)
