# Eclipse Music

Blader en speel Eclipse Music af in de auto: een template-Android Auto-app met Home, Discover, Library, Radio, zoeken en een bewerkbare wachtrij, plus dezelfde indeling voor hosts die alleen de klassieke mediabrowser tonen.

**Appversie:** 0.6.75 · **Build:** 155 · **Origineel bestand:** APK

[Gebruik je originele APK](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Selecteer het volledige originele bestand voor deze versie in Morphe Manager.

> **Status.** De template-app is bevestigd op niveau 9 in DriveDeck: Home met zijn secties, Umbra, gekoppelde mixen, Your Shows en zoeken via je gekozen aanbieder werken daar. Hosts op niveau 8 en de klassieke mediabrowser zijn nog niet bevestigd; zie die als experimenteel en meld wat afwijkt.

## Patches

| Patch | Standaard | Wat verandert er? |
| --- | --- | --- |
| **Android Auto templated media app** | Aan | Voegt een Eclipse Music-app toe aan hosts die template-media-apps ondersteunen. Eén pagina biedt Home zoals op de telefoon, Discover en Library; daaronder staan je afspeellijsten, albums, artiesten, radiocategorieën en live-zenders, zoeken via de aanbieder die je op de telefoon koos, verzamelpagina’s en een Up next-pagina waarin je kunt springen zonder wat je in de wachtrij zette kwijt te raken. Het eigen weergavescherm van de host speelt je muziek af. Bevestigd op niveau 9; niveau 8 is nog niet bevestigd. |
| **Android Auto browse upgrade** | Aan | Experimenteel, nog niet bevestigd op een klassieke host. Geeft de bestaande mediabrowser van Eclipse, die hosts zonder templates, automediacentra en assistenten gebruiken, dezelfde indeling: Home, Discover, Library en Radio, met Up next op dezelfde manier getoond. Lijsten worden afgekapt op de grootte die de host vraagt en Up next ververst als de wachtrij verandert. De eigen vermeldingen van Eclipse, het hervatten van weergave en de wachtrij blijven werken zoals voorheen. |

Beide patches staan standaard aan en werken afzonderlijk of samen. Deze port is uitsluitend bedoeld voor 0.6.75 (build 155).

## Wat je in de auto krijgt

| Je host | Wat je ziet |
| --- | --- |
| Template-host met niveau 9 (nieuwere Android Auto-builds, DriveDeck API 9) | Eén pagina met chips voor Home, Discover en Library. Home volgt de telefoon: je recente afspeellijsten als compacte tegels zonder titel, de Umbra-kaart als banner, Made For You, je mixen, nummerrijen als grote tegels met titel en artiest, live-zenders met de cover van wat nu draait, de uitgelichte artiest, albums, afspeellijsten en artiesten, Your Shows en daarna Radio. Niets zit achter een See all; een statusbanner en een opgemaakte speler maken het af. |
| Template-host met niveau 8 (nog niet bevestigd) | Dezelfde pagina’s met rijen en rasters in plaats van chips en uitgelichte vlakken: een lijst Browse wisselt tussen Home, Discover en Library, de recente afspeellijsten zijn kleine tegels en de Umbra-kaart is één rij. |
| Klassieke mediabrowser (hosts onder niveau 8, Gearslip, automediacentra, Bluetooth- en assistentbesturing; nog niet bevestigd) | Home, Discover, Library en Radio als doorzoekbare mappen. Rijen van Home staan gegroepeerd onder hun titel in de volgorde van de telefoon, elke vermelding van een rij staat erin (tot 30 per rij, stilzwijgend afgekapt) en er is geen See all. |

De secties van Home, in de volgorde van de telefoon, en waar elke sectie vandaan komt:

| Sectie | In de auto (niveau 9 / niveau 8) | Waar de gegevens vandaan komen |
| --- | --- | --- |
| Recente afspeellijsten (zonder titel) | Compacte tegels / kleine tegels | De feed. Gekoppelde afspeellijsten bij de recente items openen via de eigen laadfunctie van Eclipse voor gekoppelde afspeellijsten. |
| Umbra | Banner met een actie **DJ** / één rij. Een tik start de DJ en opent de speler; **Stop** staat er alleen terwijl de DJ draait. | De eigen DJ-dienst van Eclipse, gestart zoals de Umbra-kaart op de telefoon dat doet. Chatten met Umbra wordt in de auto niet aangeboden. |
| Made For You | Twee grote tegels: de Replay van deze maand (grijs met “Building your replay…” tot er nummers zijn) en All-Time Top Songs | De eigen replay-dienst van Eclipse en zijn laadfunctie voor alle-tijden-topnummers. |
| Daily Mixes, New For You, Popular Tracks, Trending on Eclipse en elke andere nummerrij | Grote tegels met titel en artiest; een tik speelt de hele rij vanaf dat nummer | De feed. |
| YouTube Music mixes en andere gekoppelde afspeellijsten | Grote tegels; een tik opent de afspeellijst | De eigen laadfunctie van Eclipse voor gekoppelde lijsten. |
| Eclipse Stations | Grote tegels met de cover van het nummer dat nu draait en “LIVE · titel – artiest” | De live-zenders van Eclipse. |
| Featured Artist | Uitgelicht vlak / één ronde tegel | De feed en de artiestenlader van Eclipse. |
| Fresh Drops, New Releases, Mood Mixes, Playlists For You, Discover, Your Playlists | Grote tegels | De feed, je bibliotheek en de album- en afspeellijstladers van Eclipse. |
| Popular Artists | Ronde tegels | De feed en de artiestenlader van Eclipse. |
| Your Shows | Grote tegels; een tik toont de afleveringen | De podcasts die je in Eclipse volgt en de eigen feedlader van Eclipse. Weggelaten zolang je er geen volgt. |
| Radio | Tegels voor genre, stemming, decennium en activiteit (altijd als laatste) | De radiocatalogus van Eclipse. |

Sectietitels zijn de namen die je op de telefoon gaf, daarna die van de server, daarna de ingebouwde namen van Eclipse. De volgorde, verborgen secties en hernoemingen die je op de telefoon instelt, gelden ook in de auto.

## Voor gebruik

- Een gepatchte app heeft een nieuw certificaat, dus de originele Eclipse Music moet eerst worden verwijderd. Lokale gegevens gaan daarbij mee: je bibliotheek en afspeellijsten komen terug via cloudsynchronisatie nadat je opnieuw bent aangemeld en Eclipse-add-ons moeten opnieuw worden geïnstalleerd.
- Android Auto toont alleen apps die niet uit de Play Store komen als **Onbekende bronnen** is ingeschakeld in de ontwikkelaarsinstellingen.
- Home en Discover hebben een Eclipse-account nodig dat op de telefoon is aangemeld. Is het account afgemeld, ben je offline of staat de dienst uit, dan valt Home terug op je bibliotheek en zegt waarom.

## Beperkingen

- Lijsten in de auto kunnen geen knoppen per nummer tonen. Voeg een heel album, een afspeellijst of een lijst vanaf zijn pagina toe aan de wachtrij in plaats van één nummer.
- Gekoppelde afspeellijsten (YouTube Music, Spotify) openen en spelen af, maar albums en artiesten van die diensten blijven buiten Home: Eclipse heeft er geen laadfunctie voor die de auto kan gebruiken. Umbra start in de auto alleen de DJ; chatten wordt niet aangeboden.
- Zoeken in de template-app werkt zoals het zoekscherm op de telefoon: het vraagt de daar gekozen aanbieder (een geïnstalleerde add-on), toont nummers, albums, artiesten en afspeellijsten onder hun eigen titels, en de chips (All, Tracks, Albums, Artists, Playlists) beperken ze zonder opnieuw te vragen; onder niveau 9 toont de lijst de soorten in die volgorde met de soort op de tweede regel en opent een verzonden zoekopdracht de resultaten per sectie. De aanbieder die je in de auto kiest, is die de telefoon daarna toont. Apple Music en Tidal als aanbieder, en add-ons die met de resultaten van Apple Music antwoorden, worden in de auto niet aangeboden; kan geen aanbieder antwoorden, dan valt het zoeken terug op je bibliotheek en staat er “From your library”. Spraakzoeken en het zoeken in de klassieke browser blijven werken zoals voorheen.
- In de klassieke browser krijgt een host die om een paginagrootte vraagt lijsten die daarop zijn afgekapt. De nieuwe niveaus Home, Discover, Library en Radio eindigen op een More-vermelding voor de rest; de eigen lange lijsten van Eclipse (bijvoorbeeld al je nummers) tonen alleen hun eerste pagina. Een host die niet om een paginagrootte vraagt, krijgt nog steeds de hele lijst.

[Installatie](../guides/install.md) · [Patches kiezen](../guides/choose-patches.md) · [Compatibiliteit en standaardkeuzes](../reference/catalogue.md)
