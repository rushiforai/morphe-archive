# Wordfeud Word Finder — ontwerp

Datum: 1 november 2026
Status: goedgekeurd
Projectnaam: "Wordfeud Word Finder"

## 1. Doel

Een patch voor de Android-app Wordfeud (gratis versie), verspreid als eigen patchbron voor Morphe Manager. De patch voegt aan het spelscherm een knopje toe dat een overlay opent met alle mogelijke zetten voor het plankje van de speler, een voorbeeldbord met het gekozen woord, en een knop die de zet direct naar de server stuurt.

## 2. Afspraken

Deze afspraken zijn één voor één met de opdrachtgever vastgesteld.

| Onderwerp | Afspraak |
|---|---|
| Doelgroep | Publieke patchrepository voor Morphe Manager |
| App | Alleen `com.hbwares.wordfeud.free` |
| Versies | 5.7.1 aanbevolen; elke andere versie mogelijk als experimenteel doel |
| Beschikbaarheid | In alle potjes, geen schakelaar |
| Talen | Alle spelregelsets die Wordfeud aanbiedt |
| Gegevens | Bord, plankje en regels uit app-code of API; de gebruiker doet niets |
| Woordenlijsten | Wordfeud biedt er geen aan (gecontroleerd), dus per regelset een vaste download-URL van internet |
| Download | Op de achtergrond zodra een potje in die regelset gezien wordt (zie §6) |
| Knopje | Rond en zwevend, rechtsonder boven het plankje, alleen op het spelscherm |
| Overlay | Bijna schermvullend; volgt het app-thema (licht/donker); teksten in de interfacetaal van de app |
| Inhoud overlay | Plankje, voorbeeldbord, informatieregel met Play-knop, sorteerknoppen, lijst met alle zetten |
| Lijst | Alle mogelijke zetten, elke plek een aparte regel; sorteren op hoogste score (standaard), langste woord, A–Z |
| Voorbeeldbord | Bovenaan; tik op een woord werkt het direct bij; bij openen is het best scorende woord gekozen |
| Spelen | Play-knop stuurt de zet via de API; niets wordt over het echte bord gesleept |
| Na spelen | Geen bevestiging; overlay sluit, het bord moet direct het woord tonen (zie §8.4) |
| Niet aan zet | Lijst zichtbaar, melding in plaats van Play-knop |
| Afgelopen potje | Knopje verborgen |
| Blanco tegels | Doen mee, de patch kiest de letter; verstuurd als `"*X"` (V2 bevestigd) |
| Geweigerd woord | Melding, overlay blijft open, woord per regelset permanent verborgen, ook na een nieuwe woordenlijst |
| Instellingen | Geen in de app; de beheerder dwingt nieuwe woordenlijsten af via een nieuwe patchversie |
| Foutcodes | Vaste codes met een "Kopieer details"-knop (zie §10) |

## 3. Bevindingen uit de proeven

Deze feiten zijn vastgesteld met vier wegwerpversies van 5.7.1 op het toestel van de opdrachtgever en vormen de basis van het ontwerp.

1. Wordfeud 5.7.1 is een Flutter-app. De Java-kant bevat alleen `App` en `MainActivity`; spel en interface zitten in `libapp.so`.
2. API-verkeer naar `https://api.wordfeud.com/wf/` loopt via de plugin `cronet_http`. Elke respons passeert de Java-klasse `io.flutter.plugins.cronet_http.UrlRequestCallbackProxy` (gemarkeerd met `@Keep`, niet versleuteld). Als Cronet ontbreekt, valt de app terug op de Dart-client (`IOClient`); dat verkeer is voor de patch onzichtbaar.
3. `GET user/games/detail/?known_tile_points&known_boards&game_format=log` levert alle potjes met:
   - `board` (id), `ruleset`, `current_player`, `end_game`, `players[]` met `position` en `is_local`;
   - `game_log[]` met gebeurtenissen; gezien zijn `start` (`tiles: [rek speler 0, rek speler 1]`, waarbij het rek van de tegenstander `null` is) en `packed_move` (`player`, `x`, `y`, `horizontal`, `tiles`, en voor de lokale speler `new_tiles`);
   - `rulesets[]` met `language_code`, `tile_points`, `tile_counts`, en `boards[]` met een 15×15-raster (0 leeg, 1 DL, 2 TL, 3 DW, 4 TW).
4. In `packed_move` staan alleen de nieuw gelegde letters, op volgorde vanaf (x, y), waarbij bezette vakken worden overgeslagen (gecontroleerd met HOORT over een bestaande O).
5. Het rek reconstrueren door het spelverloop na te spelen levert exact het rek op dat de app toont (V W T J H O R na NEIGEN).
6. Een zet: `POST game/<id>/move/?game_format=log`, body `{"move":[[x,y,"L"],…],"words":["MANDJE"],"ruleset":2}`. Het antwoord bevat `content.game` in hetzelfde formaat als onder punt 3.
7. Welk potje open staat, meldt Flutter via kanaal `flutter/navigation`, methode `routeInformationUpdated`, met `uri` `/game/<id>` of `/`. Dit passeert `FlutterJNI.handlePlatformMessage`.
8. De sessie is cookie `sessionid` (geldig 2 dagen), door de Dart-code bewaard in `files/.cookies/<map>/.domains` als JSON: `{"wordfeud.com":{"/":{"sessionid":"sessionid=…; Expires=…"}}}`.
9. Wordfeuds Cronet-engine komt uit Play Services (`org.chromium.net.impl.CronetUrlRequestContext` zit niet in de app). Verzoekheaders van API-verzoeken zijn daardoor niet waarneembaar. De app stelt een eigen User-Agent in via `CronetEngine.Builder.setUserAgent`.
10. De app pollt `user/status/` elke ~15 s en haalde na een zet binnen ~20 s opnieuw `games/detail` op.
11. De toegankelijkheidsboom bevat geen knooppunten voor bord of plankje; schermposities van tegels zijn niet uitleesbaar. Dat is de reden dat zetten via de API gaan.

Externe hints, nog niet bevestigd (een MIT-gelicentieerde Go-client, `github.com/kayex/wordfeud`): regelsets 0 Amerikaans Engels, 1 Noors, 2 Nederlands (bevestigd), 3 Deens, 4 Zweeds, 5 Engels internationaal, 6 Spaans, 7 Frans; tegels als `[kolom, rij, letter, blanco]`; foutcodes zoals `illegal_word`, `illegal_move` en `not_your_turn`.

## 4. Architectuur

De repository volgt `MorpheApp/morphe-patches-template`: Kotlin-patches in `patches/`, Java-extensie in `extensions/`.

### 4.1 Haakjes (bytecodepatches)

Elk haakje roept alleen een statische methode van de extensie aan en verandert verder niets aan het gedrag van de app.

| Haak | Plek | Doel |
|---|---|---|
| H1 Netwerk | `UrlRequestCallbackProxy.onResponseStarted`, `onReadCompleted`, `onSucceeded`, `onFailed`, `onCanceled` | Respons verzamelen per verzoek; bij `onSucceeded` doorgeven |
| H2 Navigatie | `FlutterJNI.handlePlatformMessage` | Berichten op `flutter/navigation` en `flutter/platform` (thema) doorgeven |
| H3 Scherm | `MainActivity.onCreate` | Overlaylaag aan de activiteit hangen |
| H4 User-Agent | `CronetEngine$Builder.setUserAgent` | User-Agent van de app vastleggen |

Vingerafdrukken gebruiken klasse- en methodenamen, die bij alle vier niet versleuteld zijn (`@Keep`, JNI of publieke API).

### 4.2 Extensieonderdelen

| Onderdeel | Taak |
|---|---|
| `NetworkTap` | Verzamelt responsbytes per verzoek-object; leest alleen; filtert op `api.wordfeud.com` en de twee relevante paden |
| `RouteTap` | Houdt het open potje en het thema bij uit platformberichten |
| `GameStore` | Reconstrueert potjes (§5); thread-safe; cachet regelsets en bordindelingen op schijf |
| `WordListManager` | Downloads, controle, opslag, versiebeheer (§6) |
| `RejectedWords` | Geweigerde woorden per regelset, op schijf |
| `MoveGenerator` | Alle zetten met scores (§7) |
| `MoveSubmitter` | Zet versturen en antwoord vertalen (§8) |
| `OverlayUI` | Knopje, overlay, voorbeeldbord, lijst (§9) |
| `ErrorReporter` | Foutcodes en kopieerbare details (§10) |

Alle bestanden van de patch staan in `files/wfwf/` van de app (gewijzigd: wfwf, zie plan). De patch maakt alleen verbinding met de vaste woordenlijst-URL's en met `api.wordfeud.com`, en verzamelt of verstuurt geen andere gegevens.

## 5. GameStore

**Invoer:** complete JSON van `games/detail` en `game/<id>/move/`, ingelezen met `org.json`.

**Reconstructie per potje:**

1. Lokale positie = `position` van de speler met `is_local: true`.
2. Leeg 15×15-bord; leeg rek.
3. Per gebeurtenis in `game_log`:
   - `start`: rek = `tiles[lokale positie]`.
   - `packed_move`: leg `tiles` vanaf (x, y) in de richting `horizontal`, sla bezette vakken over. Bij de lokale speler: haal de gelegde letters van het rek en voeg `new_tiles` toe.
   - Elk ander type: het potje wordt "niet leesbaar" met code `GS-EVENT-<type>`.
4. Een onbekend veld of type in een gebeurtenis, of een rek dat niet sluitend is (een gelegde letter die niet op het rek stond), maakt het potje "niet leesbaar" (`GS-DATA`).
5. Aan zet: `current_player` = lokale positie en `end_game` = 0.

**Regels en bord:** `ruleset` → regelset uit de respons of de schijfcache; `board` → indeling uit de respons of de schijfcache. Ontbreekt een van beide: `GS-DATA`.

**Na een eigen zet:** het potje uit het antwoord vervangt meteen de bestaande versie.

## 6. Woordenlijsten

### 6.1 Bronnentabel

Herzien 2026-11-03: de lijsten staan in deze repository (`wordlists/<taal>/words.txt.gz`), gebouwd door
`tools/wordlists/build.py` uit openbare bronnen (`wordlists/sources.json`: vaste commit-URL, SHA-256, licentie en
bronvermelding per taal). Per taal kunnen `remove.txt` en `add.txt` woorden weghalen of toevoegen. Het script schrijft
`wordlists/manifest.json` (SHA-256, aantal woorden en versie per lijst; de versie gaat omhoog bij elke inhoudelijke
wijziging). Gradle genereert daaruit `WordListManifest`; `WordListSources` levert per regelset de URL
`https://raw.githubusercontent.com/<repository>/<commit van de build>/wordlists/<taal>/words.txt.gz`, de SHA-256 en
de versie. De download wordt op de SHA-256 gecontroleerd en daarna uitgepakt (gzip).

Bronkeuze: alleen openbare licenties (besluit opdrachtgever 2026-11-03). Regelset-id's (bevestigd uit
`kimsb/WordfeudBot`, `kimsb/wftiles-android` en `ardavey/wordfeud-api-perl`): 0 Engels (VS), 1 Noors bokmål,
2 Nederlands, 3 Deens, 4 Zweeds, 5 Engels internationaal, 6 Spaans, 7 Frans, 8 Zweeds strikt, 9 Duits,
10 Noors nynorsk, 11 Fins, 12 Portugees. Lijsten (2026-11-03): 0/5 ENABLE, 1 en 10 Norsk ordbank, 2 OpenTaal, 3 COR₁ 1.5.1.0 (N+K), 4 DSSO, 7 Grammalecte v7.7, 9 enz/german-wordlist. Aangevuld 2026-11-05: 6 lorenbrichter/Words es.txt (= FISE-2), 8 hising/svenska-ord.txt (SAOL-grondvormen; aanname dat 'strikt' geen verbuigingen toestaat, onbevestigd), 11 fginter/hunspell-fi (uitgevouwen), 12 jfoclpf/words-pt. Alle regelsets hebben nu een lijst; maximaal 15 tegels.

Dubbelletter-tegels (Spaans CH, LL, RR; `core/Tiles`): intern één teken (Griekse hoofdletter Χ, Λ, Ρ; kleine letter = blanco), zodat bord, rek, woordgraaf en zettenberekening ongewijzigd blijven. Het spelverloop (`"CH"`, `"*CH"`), de woordenlijst (CH altijd als CH-tegel, zoals in Spaanse woordspellen) en de verstuurde zet (`[x,y,"CH"]`, woorden voluit gespeld) worden aan de rand vertaald. Onbevestigd: dat de Wordfeud-API deze tegels als `"CH"` schrijft (geen Spaans potje gezien).

Woordgraaf (2026-11-05): minimale DAWG, woord voor woord gebouwd uit de gesorteerde lijst (formaat versie 2; versie 1 blijft leesbaar). Fins 7,8 MB in plaats van 37 MB als trie, Nederlands 2,3 MB in plaats van 10 MB. Regelsets zonder openbare lijst krijgen geen lijst; de overlay toont dan
`WL-NONE` (zie §10).

### 6.1a Woordmeldingen

Besluit opdrachtgever 2026-11-03: woorden die de server weigert worden automatisch gemeld en via een branch per
taal ter beoordeling aangeboden; niets gaat zonder merge van de opdrachtgever naar gebruikers.

- De patch (`WordReporter`) stuurt na een `illegal_word`-weigering de door de server genoemde woorden
  (`illegal_words`) die op dit toestel nog niet geweigerd waren, eenmalig op de achtergrond naar het meldadres
  (`wordReportUrl` in `gradle.properties`, leeg = uit). Inhoud: `{"ruleset":n,"words":[...],"patch":"x.y.z"}`.
- De Cloudflare Worker (`tools/report-worker`) valideert (regelset 0-12, 1-8 woorden van 2-15 letters, optionele
  limiet per IP) en stuurt een `repository_dispatch` (`wordlist-report`) met een fine-grained token met alleen
  Contents-schrijfrecht op deze repository.
- De workflow `wordlist-report.yml` zet geldige woorden die in de lijst staan in `wordlists/<taal>/remove.txt` op
  de branch `wordlist/<taal>`, bouwt de lijst opnieuw (commit type `fix`) en houdt per taal één PR naar `main`
  open. Na de merge maakt de release-workflow een nieuwe versie met de bijgewerkte lijst.
- Toevoegen (2026-11-05): `GameReplay` verzamelt per zet het hoofdwoord en de dwarswoorden (`GameState.playedWords`).
  Bij het berekenen van zetten in de overlay meldt `MissingWords` gespeelde woorden die niet in de lijst staan
  (type `add`, eenmalig per toestel en regelset, max. 24 per keer); de workflow zet ze in `add.txt` op dezelfde
  branch (alleen als ze niet in de lijst, `add.txt` of `remove.txt` staan). De Worker begrenst meldingen op 20 per IP
  per uur (KV-binding `REPORT_KV`).

### 6.2 Downloadflow

1. Na elke verwerkte `games/detail` bepaalt de patch welke regelsets in de potjes voorkomen. Voor elke regelset zonder geldige lokale lijst (ontbrekend, of met een lagere lijstversie dan in de tabel) start hij een achtergronddownload. Per regelset loopt maximaal één download tegelijk.
2. De download wordt gecontroleerd op de SHA-256. Bij een mismatch: `WL-HASH`, het bestand wordt verwijderd.
3. Bij succes: normaliseren naar hoofdletters (gebruikmakend van `tile_points` als alfabet), omzetten naar een compacte zoekboom en opslaan.
4. Mislukt de download, dan volgt er geen nieuwe automatische poging in dezelfde sessie.
5. Opent de gebruiker de overlay terwijl de lijst ontbreekt, dan probeert de patch het direct opnieuw, met een voortgangsbalk. Mislukt het, dan toont de overlay een melding met foutcode, "Opnieuw proberen" en "Kopieer details".
6. Na een herstart van de app begint de cyclus opnieuw bij stap 1.

### 6.3 Geweigerde woorden

Per regelset bewaard op schijf, nooit automatisch gewist, ook niet bij een nieuwe lijstversie. Ze worden bij het tonen van de lijst gefilterd.

## 7. Zettenberekening

- **Algoritme:** Appel-Jacobson met ankervakken en dwarscontroles; verticaal via het gekantelde bord.
- **Score:** de som van de letterwaarden. DL/TL gelden alleen op nieuw gelegde tegels; DW/TW vermenigvuldigen het woord voor elke nieuwe tegel op zo'n vak. Dwarswoorden worden op dezelfde manier gescoord. Bij zeven gelegde tegels komt er 40 bij (V5 bevestigd). Blanco tegels tellen 0 punten.
- **Eerste zet:** moet over het middenvak (7, 7) gaan (V5).
- **Blanco tegels:** ondersteund; in de zet als `[x,y,"*X"]` (V2 bevestigd 2026-11-02).
- **Uitvoer per zet:** woord, posities, richting, nieuw gelegde tegels, gebruikte bordletters, score, alle gevormde woorden, en bonusvakken onder nieuwe tegels.
- **Sorteren:**
  - Hoogste score: score aflopend, dan A–Z.
  - Langste woord: lengte aflopend, dan score aflopend, dan A–Z.
  - A–Z: woord oplopend, dan score aflopend.
- **Uitvoering:** op een achtergrondthread; een nieuwe berekening annuleert de vorige.

## 8. Zet versturen

### 8.1 Verzoek

`POST https://api.wordfeud.com/wf/game/<id>/move/?game_format=log` met body `{"move":[[x,y,"L"],…],"words":[…],"ruleset":n}`. `words` bevat alle gevormde woorden, met het hoofdwoord eerst (V3). Transport: `HttpURLConnection`, User-Agent van H4, header `Cookie: sessionid=…`, `Content-Type: application/json` (V1).

### 8.2 Sessie

Bij elke verzending zoekt de patch `files/.cookies/*/.domains` en daarin het item `wordfeud.com` → `/` → `sessionid`. Is het niet gevonden of verlopen, dan volgt `MV-SESSION` met de tip om Wordfeud te heropenen. De patch logt nooit zelf in.

### 8.3 Afhandeling

- De Play-knop is uitgeschakeld zolang er een verzoek loopt.
- Bij een netwerkfout of time-out: `MV-NET`, geen automatische nieuwe poging. De Play-knop blijft uit tot de volgende `games/detail` verwerkt is.
- `status: success`: het potje uit het antwoord gaat naar de `GameStore`, de overlay sluit, en daarna volgt het verversen (§8.4).
- Woord geweigerd (formaat V6): noemt de server woorden (`content.words` of `content.word`), dan gaan precies die naar `RejectedWords`. Noemt hij er geen en vormde de zet één woord, dan gaat dat woord daarheen. Noemt hij er geen en vormde de zet meerdere woorden (hoofd- plus dwarswoorden), dan wordt geen enkel woord blijvend geweigerd: alleen deze exacte zet (plaatsing en woorden) wordt voor de rest van de sessie in dit potje verborgen. De overlay toont de melding in het foutvak ("Zet afgewezen: A" of "Zet afgewezen: een van A, B, C", met code en "Kopieer details") en een bijgewerkte lijst; de melding blijft staan tot de gebruiker een andere zet kiest of speelt. "Kopieer details" bevat een regel `server=` met de vorm van het antwoord: `content.type`, de namen van de sleutels onder `content` en alleen de waarde van een `words`/`word`-veld.
- Andere serverfout: `MV-SERVER-<type>`; de overlay blijft open.

### 8.4 Verversen van Wordfeud

Kandidaten, in deze volgorde getest (V4):

1. Het eigen signaal `dev.flutter.pigeon.wordfeud.FlutterProcessLifecycleApi.onForegroundStateChanged`.
2. Het potje via `flutter/navigation` naar `/` en terug naar `/game/<id>`.
3. Zelf `games/detail` ophalen en aan de app aanbieden.
4. Het kanaal van Firebase Messaging.

De eerste die betrouwbaar werkt zonder zichtbaar geflikker, wordt gebruikt. Werkt er geen, dan sluit de overlay en ververst Wordfeud zelf (~20 s).

## 9. Interface

- **Bouw:** standaard Android-views in een `FrameLayout` boven de `FlutterView`; geen extra bibliotheken. De lettertypen Inter en Droid Sans Mono worden geladen uit `flutter_assets/fonts/` van de app.
- **Knopje:** 40 dp, zoals in de goedgekeurde mockup, rechtsonder met 10 dp marge rechts. Het knopje zit 10 dp boven de bovenrand van het plankje; gemeten ligt die ongeveer 165 dp boven de onderrand van het Flutter-scherm, plus de systeeminset. Bij `AdApi.setBannerVisible(true)` schuift het mee (V7). Zichtbaar alleen bij route `/game/<id>` en een potje dat niet is afgelopen.
- **Overlay:** zoals de goedgekeurde mockup `woordenboek_voorbeeldbord.jpg`:
  - koptekst met sluitknop;
  - plankje, waarbij letters die het gekozen woord gebruikt worden gedimd;
  - voorbeeldbord (niet zoombaar), met nieuwe tegels in wit met een blauwe rand en een scorebolletje;
  - informatieregel met woord, score, richting, bonuslabel en de Play-knop (of de melding "niet aan zet");
  - sorteerknoppen;
  - een virtuele lijst.
- **Sluiten:** met het kruisje, door omlaag te vegen, of met de terugknop van Android (onderschept zolang de overlay open is).
- **Knopje onder menu's:** Flutter tekent bord en menu's in één oppervlak, dus het knopje kan er niet tussen liggen. Het wordt nagebootst (`ScreenSampler`, `ScreenShade`): de scrim wordt gemeten op de app-balk (daar komt geen menu) tegen de helderste waarde op dit scherm; wat Wordfeud onder het knopje tekent (het knopje zit niet in Wordfeuds oppervlak) wordt per pixelkolom vergeleken met de paginakleur (#D0D5DB licht, #343B45 donker) maal die scrim. Waar dat niet klopt (het menu; in donker #2C3137, bijna gelijk aan de pagina op 82%) wordt het knopje per kolom afgesneden, zodat de ronde hoek van het menu gevolgd wordt. Zonder scrim wordt nooit gesneden; dan moet een pixelregel door het rek, 40 dp onder het knopje, rektegels tonen (warme crèmekleur #F1EEE9/#FFF8F0, minstens 8% van de regel). Zo niet, dan ligt er een andere pagina over het spel (chat, zetgeschiedenis, ook bij zet 0) en is het knopje verborgen. Het bord mag onder het knopje liggen (ingezoomd). (Met een advertentiebanner, V7, kan deze controle anders uitvallen; niet geverifieerd.)
- **Spelroute:** alleen `/game/<id>` (eventueel met `/`, query of fragment) is het spelscherm; een extra padsegment (`/game/<id>/chat`) niet. Het knopje wordt zo donker als de scrim. Na een tik, en zolang het knopje bedekt is, wordt elk beeldje gemeten; anders elke 300 ms. Bedekt of onder een scrim gaan tikken door naar Wordfeud.
- **Thema:** afgeleid uit `SystemChrome.setSystemUIOverlayStyle` (`statusBarIconBrightness`). Donkere en lichte kleuren zijn overgenomen uit de screenshots (V8).
- **Taal:** interfacetaal van de app (bron V12); teksten voor alle talen die de app ondersteunt; terugval naar Engels.

## 10. Foutcodes

Elke melding toont een korte tekst en een code. "Kopieer details" kopieert de code, de Wordfeud-versie, de patchversie, de regelset en het tijdstip.

| Code | Betekenis |
|---|---|
| `WL-NET` | Woordenlijst: geen verbinding of time-out |
| `WL-HTTP-<status>` | Woordenlijst: HTTP-fout |
| `WL-HASH` | Woordenlijst: vingerafdruk klopt niet |
| `WL-DISK` | Woordenlijst: opslaan mislukt |
| `WL-NONE` | Geen woordenlijst beschikbaar voor deze regelset |
| `GS-EVENT-<type>` | Onbekend type gebeurtenis in het potje |
| `GS-DATA` | Gegevens van het potje ontbreken of zijn onleesbaar |
| `MV-SESSION` | Geen geldige sessie gevonden |
| `MV-NET` | Zet: verbinding mislukt, uitkomst onbekend |
| `MV-SERVER-<type>` | Zet: de server meldt een fout |

## 11. Compatibiliteit en publicatie

- `Compatibility(packageName = "com.hbwares.wordfeud.free", targets = [AppTarget("5.7.1"), AppTarget(version = null, isExperimental = true)])`. `apkFileType = XAPK`: de beheerder haalt de app van APKPure (V11).
- **Licentie:** GPLv3 met de `NOTICE` van de template. De projectnaam mag geen "Morphe" bevatten; "compatible with Morphe" mag wel als beschrijving. Naam: "Wordfeud Word Finder". De README vermeldt dat Wordfeud een handelsmerk is van Bertheussen IT en dat het project daar niet aan gelieerd is.
- **README:** installatie via de patchbron, de bronnentabel met licenties, de foutcodes, en de risico's (strijd met de gebruiksvoorwaarden van Wordfeud, mogelijke gevolgen voor het account, en zetten die buiten de app om verstuurd worden).
- **Releases:** volgens de templateworkflow (de `dev`-branch geeft pre-releases, `main` stabiele releases).

## 12. Testen en controlestappen

### 12.1 Automatisch (CI)

- **GameStore:** fixtures uit de proeflogs, met geanonimiseerde gebruikersnamen; rek na NEIGEN = VWTJHOR; HOORT slaat de bestaande O over; MANDJE in het tweede potje.
- **MoveGenerator:** NEIGEN = 18 punten (score door de app gemeld); extra testgevallen per bevestigde score.
- **Patch:** toegepast op het 5.7.1-APK; alle vier de haken vinden hun doel.

### 12.2 Controlestappen op een toestel

Tot een stap bevestigd is, geldt het gedrag dat erbij staat.

| ID | Vraag | Gedrag tot bevestiging |
|---|---|---|
| V1 | Wordt een zet geaccepteerd met alleen cookie, User-Agent en Content-Type? | De Play-knop wordt direct volledig gebouwd; de eerste publieke release volgt pas na één geslaagde zet via de knop op het toestel van de beheerder |
| V2 | Formaat van blanco tegels in de zet en in `game_log` | bevestigd 2026-11-02 (Wordfeud 5.7.1): game_log en zet gebruiken "*X" (`[x,y,"*E"]`); `[x,y,"X",true]` gaf MV-SERVER-protocol |
| V3 | Moeten dwarswoorden in `words`? | Bevestigd 2026-11-02 (Wordfeud 5.7.1): alle woorden (hoofdwoord en dwarswoorden) meesturen; zetten met dwarswoorden worden geaccepteerd |
| V4 | Welke verversmethode werkt? | LifecycleBounce (flutter/lifecycle paused→resumed via FlutterJNI) bevestigd 2026-11-02 (Wordfeud 5.7.1, meermaals getest) |
| V5 | Bonus voor zeven tegels en de middenvakregel | Bonus bevestigd 2026-11-02 (Wordfeud 5.7.1): 40 punten voor een zet met zeven gelegde tegels (36 → 76 in de app); geldt niet bij een leeg rek met minder tegels aan het eind. Middenvakregel bevestigd 2026-11-02: de eerste zet moet het middenvak (7,7) raken, zoals `MoveGenerator` al doet |
| V6 | Formaat van een woordweigering (hint: `illegal_word`) | Bevestigd 2026-11-03 (Wordfeud 5.7.1): `content.type = illegal_word` met de sleutels `illegal_words`, `legal_words`, `message`. De woorden uit `illegal_words` gaan naar `RejectedWords`; `words`/`word` blijven als terugval. Noemt de server niets, dan geldt de terugval uit §8.3 |
| V7 | Positie van het knopje, ook met een banner | Zonder banner bevestigd 2026-11-02. Met banner: vervallen (2026-11-06, besluit opdrachtgever: nooit een banner gezien). Het knopje schuift alleen op als de app `AdApi.setBannerVisible(true)` meldt |
| V8 | Kleuren van het lichte thema (twee screenshots) | Gemeten 2026-11-02 op screenshots van het lichte thema, ook met Wordfeuds optie "donker bord" in licht thema. Overlay volgt het app-thema; het voorbeeldbord volgt de bordkleuren die op het scherm gemeten worden (`ScreenSampler`) |
| V9 | Regelset-id's 8–12 en bevestiging van 0–7 | Bevestigd 2026-11-03 uit drie externe Wordfeud-clients (zie §6.1); alfabetten per taal uit `kimsb/wftiles-android` |
| V10 | Formaat van `swap`-, `pass`-, `resign`- en `timeout`-gebeurtenissen | `GS-EVENT-<type>` |
| V11 | Bestandstype van de bron | Beheerder gebruikt APKPure (2026-11-02): `ApkFileType.XAPK`, net als de andere patches van de beheerder. Bestandstype voor 5.7.1 nog niet op de site gecontroleerd |
| V12 | Bron van de interfacetaal van de app | Bevestigd 2026-11-02: de app volgt de systeemtaal (Engels en Nederlands getest); de overlay doet hetzelfde, met terugval naar Engels |

Uitkomst V10 (uit proeflogs): `swap` en `resign` zijn bevestigd en geïmplementeerd in `GameReplay`.
`swap` heeft de velden `type`, `player`, `tile_count`, `tiles`, `new_tiles`, `timestamp`; een eigen ruil verwijdert de
geruilde tegels van het rek en voegt `new_tiles` toe (ontbreken die, dan `GS-DATA`); een ruil van de tegenstander
wijzigt het rek niet. `resign` heeft `type`, `player`, `timestamp` en wijzigt niets (`end_game` is dan 2).
`pass` en `timeout` zijn geïmplementeerd op 2026-11-02 (exacte JSON-vorm niet waargenomen): geen bord- of rekwijziging; alleen `player` (indien aanwezig) moet een geheel getal zijn, andere velden worden niet gecontroleerd. Andere onbekende typen blijven `GS-EVENT-<type>`.

## 13. Buiten scope

- De betaalde versie.
- Een instellingenscherm.
- Suggesties om te ruilen of te passen.
- Automatisch spelen zonder tik.
- Inloggen door de patch.
- Ondersteuning voor de `IOClient`-terugval (toestellen zonder enige Cronet-variant).
- iOS.

## 14. Risico's

- **Versie-updates van Wordfeud:** de haken zitten in stabiele, niet-versleutelde onderdelen, maar het API- of logformaat kan veranderen. CI vangt kapotte haken af; formaatwijzigingen leiden tot `GS-*`-codes in plaats van verkeerde zetten.
- **Afwijkende woordenlijsten:** suggesties kunnen geweigerd worden. Dit wordt opgevangen door `RejectedWords`.
- **Accountrisico voor gebruikers:** benoemd in de README.
- **Externe bronnen kunnen verdwijnen:** dat geeft `WL-HTTP-404`, waarna een nieuwe patchversie nodig is met een andere bron.
