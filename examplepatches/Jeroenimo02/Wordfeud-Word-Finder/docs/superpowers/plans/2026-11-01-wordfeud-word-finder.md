# Wordfeud Word Finder – implementatieplan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Doel:** een Morphe-patchbron die aan Wordfeud 5.7.1 (gratis versie) een woordzoeker toevoegt: zwevend knopje, overlay met alle zetten, voorbeeldbord, en spelen via de API.

**Architectuur:** vier kleine bytecode-haken (Cronet-callback, FlutterJNI, MainActivity, CronetEngine.Builder) roepen een Java-extensie aan. Al het rekenwerk zit in pure Java-klassen zonder Android-afhankelijkheden, met JVM-unittests. Alleen de UI-laag gebruikt Android-views.

**Tech stack:** `MorpheApp/morphe-patches-template` (Kotlin-patches, plugin `app.morphe.patches` 2.1.0-dev.1, morphe-patcher 2.1.0), Java-extensie (Android-library), JUnit 4, `org.json:json` alleen als testafhankelijkheid (Android levert `org.json` zelf), alleen framework-widgets (geen AndroidX).

**Spec:** `docs/superpowers/specs/2026-11-01-wordfeud-word-finder-design.md`

## Algemene randvoorwaarden

- Pakket: `com.hbwares.wordfeud.free`. Doelen: `AppTarget("5.7.1")` en `AppTarget(version = null, isExperimental = true)`.
- Projectnaam: "Wordfeud Word Finder". "Morphe" mag nooit in de naam voorkomen. Licentie: GPLv3 met de `NOTICE` van de template.
- Java-pakket voor de extensie: `app.wordfeudwordfinder.extension`. Kotlin-pakket voor de patches: `app.wordfeudwordfinder.patches`.
- Alle bestanden van de patch staan in `<filesDir>/wfwf/`.
- Netwerk: alleen de URL's uit `WordListSources` en `https://api.wordfeud.com/wf/`. Geen analytics, geen logging van cookies of inhoud in releasebuilds.
- De haken mogen het gedrag van de app niet veranderen. Elke aanroep naar de extensie zit in try/catch, en uitzonderingen worden ingeslikt.
- UI-teksten komen uit `Strings`, nooit hardgecodeerd in views. Engels is de terugvaltaal.
- Constanten die op controlestappen wachten: `Rules.BINGO_BONUS = 0` (V5), `Rules.BLANKS_ENABLED = false` (V2). Ze worden alleen gewijzigd in taak 16.
- De eerste publieke release volgt pas na een geslaagde zet via de Play-knop (V1, taak 16).

## Review-aandachtspunten

1. **Rekken met dubbele letters** (bijvoorbeeld twee keer E): de reconstructie haalt per gelegde letter precies één exemplaar weg. Test in taak 3.
2. **Zetten aan de rand van het bord** (kolom 0 of 14, rij 0 of 14): geen index-fouten, en dwarswoorden worden afgekapt. Test in taak 7.
3. **Een respons in meerdere stukken, of twee verzoeken tegelijk:** de bytes van verschillende verzoeken mogen niet door elkaar raken. Test in taak 5.
4. **Een woordenlijst met kleine letters, CRLF-regeleinden, spaties of lege regels:** die worden genormaliseerd of overgeslagen. Test in taak 8.
5. **Een cookiebestand met meerdere domeinen of een verlopen `Expires`:** het juiste domein kiezen, en een verlopen sessie geeft `MV-SESSION`. Test in taak 11.

---

### Taak 1: Project opzetten vanuit de template

**Bestanden:**
- Aanmaken: de repo als kopie van `MorpheApp/morphe-patches-template` (branch `dev`)
- Wijzigen: `settings.gradle.kts`, `patches/build.gradle.kts` (blok `about`: name "Wordfeud Word Finder", license "GPLv3"), `extensions/extension/build.gradle.kts` (namespace `app.wordfeudwordfinder.extension`, `testImplementation("junit:junit:4.13.2")`, `testImplementation("org.json:json:20240303")`)
- Verwijderen: `patches/src/main/kotlin/app/template/**`, `extensions/extension/src/main/java/app/template/**`
- Aanmaken: `patches/src/main/kotlin/app/wordfeudwordfinder/patches/shared/Constants.kt`, `extensions/extension/src/test/java/app/wordfeudwordfinder/extension/SmokeTest.java`, `docs/DEV.md`

**Interfaces:**
- Levert: `Constants.COMPATIBILITY_WORDFEUD: Compatibility` (name "Wordfeud", packageName `com.hbwares.wordfeud.free`, de twee doelen uit de randvoorwaarden, `apkFileType` voorlopig `ApkFileType.APKM`, wordt bevestigd in taak 16 / V11).

- [ ] **Stap 1:** maak `SmokeTest.smoke()` aan, die `new org.json.JSONObject("{\"a\":1}").getInt("a") == 1` controleert.
- [ ] **Stap 2:** draai `./gradlew :extensions:extension:testDebugUnitTest`. Verwacht: PASS. Dat bewijst dat JUnit en `org.json` op de JVM werken.
- [ ] **Stap 3:** draai `./gradlew buildAndroid`. Verwacht: `patches/build/libs/patches-*.mpp` bestaat.
- [ ] **Stap 4:** stel vast hoe je met Morphe Desktop een `.mpp` lokaal toepast op de 5.7.1-XAPK (CLI-opdracht of GUI-stappen). Leg de exacte opdracht vast in `docs/DEV.md`, onder "Lokaal patchen". Latere taken verwijzen naar deze sectie.
- [ ] **Stap 5:** commit: `chore: project opzetten vanuit morphe-patches-template`.

### Taak 2: Foutcodes en gegevensmodel

**Bestanden:**
- Aanmaken: `extensions/extension/src/main/java/app/wordfeudwordfinder/extension/core/WfError.java`, `.../game/Ruleset.java`, `.../game/BoardLayout.java`, `.../game/RawGame.java`, `.../game/LogEvent.java`
- Test: `.../test/.../core/WfErrorTest.java`

**Interfaces:**
- Levert:
  - `final class WfError extends Exception`, met `String code()` en de fabrieksmethoden `wlNet()`, `wlHttp(int status)`, `wlHash()`, `wlDisk()`, `wlNone()`, `gsEvent(String type)`, `gsData(String detail)`, `mvSession()`, `mvNet()` en `mvServer(String type)`. De codes zijn exact die uit spec §10.
  - `record`-achtige value-klassen (final velden, constructor, getters):
    - `Ruleset(int id, String languageCode, Map<String,Integer> tilePoints, Map<String,Integer> tileCounts)`
    - `BoardLayout(int id, int[][] squares)`, met `squares[y][x]` ∈ 0..4
    - `LogEvent(String type, JSONObject raw)`
    - `RawGame(long id, int boardId, int rulesetId, int currentPlayer, int endGame, int localPosition, List<LogEvent> log)`

- [ ] **Stap 1:** test `WfErrorTest.codes()`: `wlHttp(404).code().equals("WL-HTTP-404")`, `gsEvent("swap").code().equals("GS-EVENT-swap")`, `mvServer("illegal_move").code().equals("MV-SERVER-illegal_move")`, `wlNone().code().equals("WL-NONE")`.
- [ ] **Stap 2:** draai de test. Verwacht: FAIL (de klasse bestaat niet).
- [ ] **Stap 3:** implementeer `WfError` en de value-klassen.
- [ ] **Stap 4:** draai de test. Verwacht: PASS.
- [ ] **Stap 5:** commit: `feat: foutcodes en gegevensmodel`.

### Taak 3: Responsen inlezen en het spelverloop naspelen

**Bestanden:**
- Aanmaken: `.../game/ResponseParser.java`, `.../game/GameState.java`, `.../game/GameReplay.java`
- Testfixtures: `extensions/extension/src/test/resources/fixtures/detail_neigen.json`, `move_hoort.json`, `detail_mandje.json`. Maak ze uit de proeflogs van de opdrachtgever: `logcat-output.txt` levert NEIGEN en HOORT, `probe4.txt` levert MANDJE. Vervang gebruikersnamen door `PlayerA`/`PlayerB` en avatar-velden door 0.
- Test: `.../test/.../game/GameReplayTest.java`

**Interfaces:**
- Gebruikt: de klassen uit taak 2.
- Levert:
  - `ResponseParser.parseGamesDetail(String json) → Parsed` (`List<RawGame> games`, `List<Ruleset> rulesets`, `List<BoardLayout> boards`)
  - `ResponseParser.parseMove(String json) → RawGame` (gooit `WfError` met `MV-SERVER-<type>` bij `status != "success"`, waarbij type = het foutveld van de server)
  - `GameReplay.replay(RawGame g) → GameState`
  - `GameState` bevat: `char[][] board` (`'\0'` = leeg), `List<String> rack`, `boolean myTurn`, `boolean ended`, `WfError unreadable` (null als het potje leesbaar is)

- [ ] **Stap 1:** schrijf de tests:
  - `rackAfterNeigen()`: replay van het potje met NEIGEN geeft rack `[V,W,T,J,H,O,R]` (volgorde vrij, vergelijk gesorteerd) en `board[7][7..12] == "NEIGEN"`.
  - `packedMoveSkipsOccupied()`: na TON(G) en HOORT staat `board[5][8..12] == "HOORT"`, en de bestaande O op (10,5) is niet verplaatst.
  - `mandjeGame()`: het lokale rek klopt met positie 1, en `board[8][6..11] == "MANDJE"`.
  - `duplicateLettersRemovedOnce()`: rek `[E,E,N]`, de zet legt één E, en het rek blijft `[E,N]`.
  - `unknownEventMarksUnreadable()`: een gebeurtenis `{"type":"swap"}` toegevoegd aan een fixture geeft `unreadable.code() == "GS-EVENT-swap"`.
  - `inconsistentRackMarksUnreadable()`: een zet met een letter die niet op het rek staat geeft `GS-DATA`.
  - `endedGame()`: met `end_game: 1` is `ended == true` en `myTurn == false`.
- [ ] **Stap 2:** draai de tests. Verwacht: FAIL.
- [ ] **Stap 3:** implementeer `ResponseParser` en `GameReplay` volgens spec §5. Het rek vul je voor de lokale speler aan met `new_tiles` alleen bij `player == localPosition`.
- [ ] **Stap 4:** draai de tests. Verwacht: PASS.
- [ ] **Stap 5:** commit: `feat: responsen inlezen en spelverloop naspelen`.

### Taak 4: GameStore met schijfcache

**Bestanden:**
- Aanmaken: `.../game/GameStore.java`, `.../core/Storage.java`
- Test: `.../test/.../game/GameStoreTest.java`

**Interfaces:**
- Gebruikt: `ResponseParser` en `GameReplay` uit taak 3.
- Levert:
  - `Storage(File root)`, met `File dir(String name)`, `String readText(String rel)` (geeft null als het bestand ontbreekt) en `void writeTextAtomic(String rel, String text)` (schrijft naar `.tmp` en hernoemt daarna).
  - `GameStore(Storage s)` (thread-safe; alle publieke methoden zijn `synchronized`), met:
    - `void onGamesDetail(String json)`
    - `void onMoveResponse(String json) throws WfError`
    - `GameState state(long gameId)` (geeft null als het potje onbekend is)
    - `Ruleset ruleset(int id)`
    - `BoardLayout board(int id)`
    - `Set<Integer> seenRulesets()`
    - `void addListener(Runnable r)` (aangeroepen na elke update)
- Cachebestanden: `cache/rulesets.json`, `cache/boards.json`.

- [ ] **Stap 1:** schrijf de tests:
  - `storesGamesAndCaches()`: na `onGamesDetail(fixture)` is `state(4391319402L)` niet null, en `cache/rulesets.json` bevat ruleset 2.
  - `usesCachedBoardWhenOmitted()`: een tweede GameStore op dezelfde map, met een detail zonder `boards`, reconstrueert het potje toch.
  - `moveResponseReplacesGame()`: `onMoveResponse(move_hoort)` werkt de state bij zonder dat er een `games/detail` nodig is.
  - `listenerCalled()`: de listener wordt precies één keer aangeroepen per `onGamesDetail`.
- [ ] **Stap 2:** draai de tests. Verwacht: FAIL.
- [ ] **Stap 3:** implementeer `Storage` en `GameStore`.
- [ ] **Stap 4:** draai de tests. Verwacht: PASS.
- [ ] **Stap 5:** commit: `feat: GameStore met schijfcache`.

### Taak 5: Netwerkhaak (H1)

**Bestanden:**
- Aanmaken: `.../core/WordFinder.java`, `.../hooks/ResponseAssembler.java`, `.../hooks/NetworkTap.java` (statische ingang), `patches/.../network/NetworkTapPatch.kt`, `patches/.../network/Fingerprints.kt`
- Test: `.../test/.../hooks/ResponseAssemblerTest.java`

**Interfaces:**
- Gebruikt: `GameStore` uit taak 4.
- Levert:
  - `WordFinder.get() → WordFinder`: een lui, thread-safe singleton. Hij haalt de `Context` op via `ActivityThread.currentApplication()` (reflectie) en maakt `Storage(new File(filesDir, "wfwf"))` en `GameStore`. Er is een getter `gameStore()`. Latere taken voegen hier hun onderdelen toe; dit is de enige plek waar onderdelen worden aangemaakt en gekoppeld.
  - `ResponseAssembler`, met:
    - `void started(Object request, String url)` (houdt alleen URL's bij die beginnen met `https://api.wordfeud.com/wf/` en `user/games/detail/` of `/move/` bevatten)
    - `void read(Object request, ByteBuffer buf)` (kopieert `[0, buf.position())` van een `duplicate()`, zonder de originele buffer te wijzigen)
    - `Completed succeeded(Object request)` (geeft `url` en `body` als UTF-8-tekst, of null)
    - `void dropped(Object request)`
    - Sleutel per verzoek: `IdentityHashMap`.
  - `NetworkTap.onStarted(Object req, Object info)`, `onRead(Object req, Object info, ByteBuffer b)`, `onSucceeded(Object req, Object info)`, `onDropped(Object req)`. De URL komt uit `UrlResponseInfo.getUrl()`, via de interface op het type. `onSucceeded` stuurt detail-responsen door naar `GameStore.onGamesDetail` en move-responsen naar `onMoveResponse`. Een eigen zet die de patch zelf stuurt, loopt niet via deze haak.
  - Patch `networkTapPatch`, die aan het begin van de methoden van `Lio/flutter/plugins/cronet_http/UrlRequestCallbackProxy;` de bijbehorende NetworkTap-methode aanroept:
    - `onResponseStarted(UrlRequest, UrlResponseInfo)`
    - `onReadCompleted(UrlRequest, UrlResponseInfo, ByteBuffer)`
    - `onSucceeded(UrlRequest, UrlResponseInfo)`
    - `onFailed(…, CronetException)` en `onCanceled(…)`, beide naar `onDropped`

- [ ] **Stap 1:** schrijf de tests:
  - `chunksConcatenated()`: twee `read`-aanroepen met "ab" en "cd" geven body "abcd". De `position()` van de originele buffers is daarna onveranderd.
  - `interleavedRequestsSeparated()`: verzoek A en B wisselen elkaar af, en elk krijgt alleen zijn eigen bytes.
  - `irrelevantUrlIgnored()`: `user/status/` geeft bij `succeeded` null.
  - `droppedClears()`: na `dropped` geeft `succeeded` null.
- [ ] **Stap 2:** draai de tests. Verwacht: FAIL.
- [ ] **Stap 3:** implementeer `ResponseAssembler`, `NetworkTap` en de Kotlin-patch met fingerprints op `definingClass` + `name` + `parameters`.
- [ ] **Stap 4:** draai de tests. Verwacht: PASS.
- [ ] **Stap 5:** patch lokaal volgens `docs/DEV.md`. Verwacht: `networkTapPatch` wordt zonder fout toegepast.
- [ ] **Stap 6:** commit: `feat: netwerkhaak voor spelgegevens`.

### Taak 6: Navigatie-, thema- en User-Agent-haken (H2, H4)

**Bestanden:**
- Aanmaken: `.../hooks/PlatformMessages.java` (decodering), `.../hooks/RouteTap.java`, `.../hooks/UserAgentTap.java`, `patches/.../platform/PlatformTapPatch.kt`, `patches/.../platform/UserAgentPatch.kt`
- Test: `.../test/.../hooks/PlatformMessagesTest.java`

**Interfaces:**
- Levert:
  - `PlatformMessages.gameIdFromNavigation(String json) → Long` (`/game/<id>` geeft het id; elke andere `uri` geeft null)
  - `PlatformMessages.darkFromOverlayStyle(String json) → Boolean` (`statusBarIconBrightness == "Brightness.light"` betekent donker thema; ontbreekt het veld, dan null)
  - `PlatformMessages.bannerVisible(byte[] stdCodec) → Boolean` (StandardMessageCodec: een lijst met één element, 0x01 = true, 0x02 = false; anders null)
  - `RouteTap.onPlatformMessage(String channel, ByteBuffer msg)`: verwerkt `flutter/navigation` (methode `routeInformationUpdated`), `flutter/platform` (methode `SystemChrome.setSystemUIOverlayStyle`) en elk kanaal dat eindigt op `.AdApi.setBannerVisible`.
  - `RouteTap.currentGameId() → Long`, `RouteTap.isDark() → boolean` (standaard true), `RouteTap.bannerVisible() → boolean`, `RouteTap.addListener(Runnable)`
  - `UserAgentTap.set(String ua)`, `UserAgentTap.get() → String` (null tot de app hem heeft ingesteld)
  - Patch `platformTapPatch`: begin van `Lio/flutter/embedding/engine/FlutterJNI;->handlePlatformMessage(Ljava/lang/String;Ljava/nio/ByteBuffer;IJ)V`.
  - Patch `userAgentPatch`: begin van `Lorg/chromium/net/CronetEngine$Builder;->setUserAgent(Ljava/lang/String;)`.

- [ ] **Stap 1:** schrijf de tests:
  - `navigationToGame()`: `{"method":"routeInformationUpdated","args":{"uri":"/game/4391319402","state":null,"replace":false}}` geeft `4391319402L`.
  - `navigationHome()`: `uri "/"` geeft null.
  - `overlayStyleDark()`: `{"method":"SystemChrome.setSystemUIOverlayStyle","args":{"statusBarIconBrightness":"Brightness.light"}}` geeft true.
  - `bannerTrueFalse()`: `{0x0C,0x01,0x01}` geeft true, `{0x0C,0x01,0x02}` geeft false, en een lege array geeft null.
- [ ] **Stap 2:** draai de tests. Verwacht: FAIL.
- [ ] **Stap 3:** implementeer de klassen en beide patches.
- [ ] **Stap 4:** draai de tests. Verwacht: PASS.
- [ ] **Stap 5:** patch lokaal. Verwacht: beide patches worden toegepast.
- [ ] **Stap 6:** commit: `feat: navigatie-, thema- en user-agent-haken`.

### Taak 7: Zettenberekening

**Bestanden:**
- Aanmaken: `.../words/WordGraph.java` (trie met compacte serialisatie), `.../solver/Rules.java`, `.../solver/Move.java`, `.../solver/MoveGenerator.java`
- Test: `.../test/.../solver/MoveGeneratorTest.java`

**Interfaces:**
- Levert:
  - `WordGraph.build(Collection<String> words) → WordGraph`, `boolean contains(String w)`, `void write(OutputStream)`, `static WordGraph read(InputStream)`
  - `Rules`: `BINGO_BONUS = 0`, `BLANKS_ENABLED = false`, `CENTER = 7`
  - `Move`:
    - `String word`, `int x, y`, `boolean horizontal`
    - `List<int[]> placed` (`{x, y}` per nieuwe tegel)
    - `List<String> placedLetters`, `int score`
    - `List<String> allWords` (hoofdwoord eerst)
    - `List<String> bonuses` (bijvoorbeeld `"DL:W"`)
    - `boolean usesBoardLetter`
  - `MoveGenerator.generate(char[][] board, List<String> rack, BoardLayout layout, Ruleset rs, WordGraph wg, AtomicBoolean cancel) → List<Move>`

- [ ] **Stap 1:** schrijf de tests (bord en indeling uit de NEIGEN-fixture):
  - `firstMoveNeigen18()`: leeg bord, rek `[I,N,E,E,N,G,V]`, woorden `{NEIGEN}`. De resultaten bevatten NEIGEN op (7,7) horizontaal met score 18.
  - `firstMoveMustCoverCenter()`: geen enkele zet op een leeg bord laat het vak (7,7) leeg.
  - `wroetScores()`: bord na NEIGEN, rek `VWTJHOR`, woorden `{WROET,ROTJE,HIJ,WIT,VOER,ROG,VET}`. Verwacht:
    - WROET op x=8, y=4, verticaal = 16;
    - ROTJE op x=11, y=3, verticaal = 14;
    - HIJ op x=9, y=6, verticaal = 10;
    - WIT op x=9, y=6, verticaal = 9;
    - VOER op x=8, y=5, verticaal = 8;
    - ROG op x=10, y=5, verticaal = 7;
    - VET op x=11, y=6, verticaal = 7.
  - `crossWordScored()`: een zelfgebouwde situatie waarin één tegel een hoofd- en een dwarswoord vormt. De score is de som van beide en `allWords.size() == 2`.
  - `edgesSafe()`: tegels op kolom 0 en 14 en rij 0 en 14 geven geen uitzondering, en woorden die het bord zouden verlaten worden niet gegenereerd.
  - `noBlankMovesWhileDisabled()`: een rek met `"?"` (blanco) geeft geen zetten die de blanco gebruiken.
  - `cancelStops()`: als `cancel` vooraf op true staat, komt er een lege lijst terug.
- [ ] **Stap 2:** draai de tests. Verwacht: FAIL.
- [ ] **Stap 3:** implementeer Appel-Jacobson: ankervakken, dwarscontroles per vak, linkerdeel en rechterverlenging, verticaal via transponeren. Score volgens spec §7.
- [ ] **Stap 4:** draai de tests. Verwacht: PASS.
- [ ] **Stap 5:** commit: `feat: zettenberekening met scores`.

### Taak 8: Woordenlijstbeheer

**Bestanden:**
- Aanmaken: `.../words/WordListSources.java`, `.../words/WordListNormalizer.java`, `.../words/HttpFetcher.java` (interface plus `UrlConnectionFetcher`), `.../words/WordListManager.java`
- Test: `.../test/.../words/WordListManagerTest.java`, `WordListNormalizerTest.java`

**Interfaces:**
- Gebruikt: `WordGraph` (taak 7), `Storage` (taak 4), `WfError` (taak 2).
- Levert:
  - `WordListSources.get(int rulesetId) → Source` (`url`, `sha256`, `version`, `charset`), of null. Voorlopig alleen een testbron; de echte tabel volgt in taak 9.
  - `WordListNormalizer.normalize(InputStream in, Charset cs, Set<String> alphabet) → List<String>`: maakt hoofdletters (`Locale.ROOT`), trimt, slaat lege regels en woorden met tekens buiten `alphabet` over, en verwijdert dubbele woorden.
  - `HttpFetcher.fetch(String url) → byte[]`. Bij een HTTP-status buiten 2xx gooit hij `WfError.wlHttp`, bij een IOException `WfError.wlNet`.
  - `WordListManager(Storage, HttpFetcher, Executor)`, met:
    - `void onRulesetsSeen(Set<Integer> ids, Function<Integer, Ruleset> rs)`: één achtergrondpoging per regelset per sessie
    - `WordGraph getOrNull(int id)`
    - `void ensureForOverlay(int id, Ruleset rs, Callback cb)`: één nieuwe poging; de callback krijgt `onProgress(int pct)`, `onReady(WordGraph)` of `onError(WfError)`
    - Opslag: `wordlists/<id>-v<version>.graph`
- `WordFinder` krijgt `wordLists()` en koppelt een `GameStore`-listener die `onRulesetsSeen(gameStore.seenRulesets(), gameStore::ruleset)` aanroept.
- Gedrag volgens spec §6.2. Een mismatch van de SHA-256 geeft `WL-HASH` en er blijft geen bestand achter.

- [ ] **Stap 1:** schrijf de tests:
  - `normalizesMessyInput()`: `"aap\r\n Noot \n\nmies1\nÄRM\n"` met alfabet `{A..Z}` geeft `[AAP, NOOT]`.
  - `keepsSpecialLettersWhenInAlphabet()`: `ÄRM` met een alfabet dat Ä bevat, wordt behouden.
  - `backgroundTriesOncePerSession()`: de fetcher faalt; twee keer `onRulesetsSeen` met hetzelfde id geeft precies één fetch-aanroep.
  - `overlayRetriesAndReportsCode()`: daarna geeft `ensureForOverlay` een tweede fetch, en de callback krijgt `onError` met code `WL-NET`.
  - `hashMismatch()`: verkeerde bytes geven `WL-HASH` en `wordlists/` blijft leeg.
  - `newVersionRedownloads()`: als er een bestand `v1` staat en de tabel versie 2 meldt, volgt een fetch.
  - `unknownRulesetIsNone()`: een id zonder bron geeft `WL-NONE` en geen fetch.
- [ ] **Stap 2:** draai de tests. Verwacht: FAIL.
- [ ] **Stap 3:** implementeer de klassen. De Executor wordt in de tests synchroon geïnjecteerd.
- [ ] **Stap 4:** draai de tests. Verwacht: PASS.
- [ ] **Stap 5:** commit: `feat: woordenlijstbeheer met vingerafdruk en versies`.

### Taak 9: Woordenlijstbronnen kiezen (W1) – met akkoord van de opdrachtgever

**Bestanden:**
- Wijzigen: `.../words/WordListSources.java`, `README.md` (sectie "Word lists")
- Aanmaken: `docs/wordlists.md` (onderzoek per regelset)

**Interfaces:**
- Gebruikt: `WordListNormalizer` (taak 8).
- Levert: een gevulde bronnentabel voor elke regelset-id die de opdrachtgever goedkeurt.

- [ ] **Stap 1:** zoek voor de regelset-id's 0–12 (namen volgens spec §3, met 8–12 nog onbevestigd, V9) per regelset maximaal drie kandidaten. Leg per kandidaat vast in `docs/wordlists.md`: URL van een vaste versie (commit-URL), licentie, aantal woorden, en of de bron Wordfeuds eigen bron benoemt.
- [ ] **Stap 2:** draai voor elke kandidaat `WordListNormalizer` met het alfabet uit de `tile_points` van die regelset (uit een fixture; voor regelsets zonder fixture het alfabet uit de bron). Noteer hoeveel woorden afvallen.
- [ ] **Stap 3:** ⛔ **poort:** leg `docs/wordlists.md` voor aan de opdrachtgever. Vul alleen de goedgekeurde keuzes in, met `version = 1` en de berekende SHA-256. Regelsets zonder goedkeuring blijven leeg en geven `WL-NONE`.
- [ ] **Stap 4:** test `WordListSourcesTest.allEntriesPinned()`: elke URL bevat een commit-hash of versienummer (geen `/main/` of `/master/`), en elke `sha256` is 64 hex-tekens.
- [ ] **Stap 5:** draai de test. Verwacht: PASS.
- [ ] **Stap 6:** commit: `feat: woordenlijstbronnen per regelset`.

### Taak 10: Lijst, sortering en geweigerde woorden

**Bestanden:**
- Aanmaken: `.../solver/MoveSorter.java`, `.../words/RejectedWords.java`
- Test: `.../test/.../solver/MoveSorterTest.java`, `.../words/RejectedWordsTest.java`

**Interfaces:**
- Levert:
  - `enum SortMode { SCORE, LENGTH, ALPHA }`
  - `MoveSorter.sort(List<Move> moves, SortMode mode) → List<Move>`, volgens spec §7
  - `RejectedWords(Storage)`, met `void add(int rulesetId, Collection<String> words)`, `boolean contains(int rulesetId, String word)` en `List<Move> filter(int rulesetId, List<Move> moves)`
  - Opslag: `rejected/<id>.txt`. De lijst wordt nooit automatisch gewist.
  - `WordFinder` krijgt `rejected()`.

- [ ] **Stap 1:** schrijf de tests:
  - `scoreOrder()`: scores `[7, 16, 7]` met woorden `[VET, WROET, ROG]` geven `WROET, ROG, VET` (bij gelijke score A–Z).
  - `lengthOrder()`: `[ROTJE 14, WROET 16, HIJ 10]` geeft `WROET, ROTJE, HIJ`.
  - `alphaOrder()`: tweemaal VET met score 7 en 9 geeft eerst de 9.
  - `rejectedPersistsAndFilters()`: na `add(2, ["WROET"])` filtert een nieuwe instantie op dezelfde map WROET uit de lijst.
  - `rejectedSurvivesNewWordlistVersion()`: na `WordListManager` met een nieuwe versie bestaat `rejected/2.txt` nog.
- [ ] **Stap 2:** draai de tests. Verwacht: FAIL.
- [ ] **Stap 3:** implementeer de klassen.
- [ ] **Stap 4:** draai de tests. Verwacht: PASS.
- [ ] **Stap 5:** commit: `feat: sortering en geweigerde woorden`.

### Taak 11: Zet versturen

**Bestanden:**
- Aanmaken: `.../play/SessionReader.java`, `.../play/MoveRequest.java`, `.../play/MoveSubmitter.java`
- Test: `.../test/.../play/SessionReaderTest.java`, `MoveRequestTest.java`, `MoveSubmitterTest.java`
- Fixture: `fixtures/cookies_domains.json`. Dit is de structuur uit `probe4.txt`, met de waarde vervangen door `TESTSESSION`, `Expires` in 2099, plus een tweede domein `example.com`.

**Interfaces:**
- Gebruikt: `Move` (taak 7), `GameStore.onMoveResponse` (taak 4), `RejectedWords` (taak 10), `UserAgentTap.get()` (taak 6), `HttpFetcher` (patroon uit taak 8).
- Levert:
  - `SessionReader(File filesDir, Clock clock).sessionId() → String`. Zoekt `.cookies/*/.domains`, kiest `wordfeud.com` → `/` → `sessionid`, en geeft het deel na `sessionid=` tot de eerste `;`. Gooit `WfError.mvSession()` als de cookie ontbreekt of als `Expires` voorbij is.
  - `MoveRequest.body(Move m, int rulesetId) → String`: precies `{"move":[[x,y,"L"],…],"words":[…],"ruleset":n}`, met de tegels in volgorde van `placed` en het hoofdwoord eerst.
  - `MoveRequest.url(long gameId) → String`: `https://api.wordfeud.com/wf/game/<id>/move/?game_format=log`
  - `MoveSubmitter(SessionReader, Poster, GameStore, RejectedWords)`, met `Result submit(long gameId, int rulesetId, Move m)`. Het resultaat is `SUCCESS`, `REJECTED(words)` of `ERROR(WfError)`. Er loopt maximaal één verzoek tegelijk; een tweede aanroep tijdens een lopende zet geeft direct `ERROR(mvNet)`.
  - `Poster.post(String url, String body, Map<String,String> headers) → String`. Headers: `Cookie`, `User-Agent` (indien bekend), `Content-Type: application/json`.
  - `WordFinder` krijgt `submitter()`, met `UrlConnectionPoster` en `SessionReader(filesDir, Clock.systemUTC())`.

- [ ] **Stap 1:** schrijf de tests:
  - `readsSessionFromCorrectDomain()`: de fixture geeft `TESTSESSION`.
  - `expiredSessionIsError()`: met een `Clock` na `Expires` volgt `MV-SESSION`.
  - `missingFileIsError()`: een lege map geeft `MV-SESSION`.
  - `bodyMatchesAppFormat()`: de MANDJE-zet (M op 6,8; N op 8,8; D op 9,8; J op 10,8; E op 11,8; ruleset 2) geeft exact `{"move":[[6,8,"M"],[8,8,"N"],[9,8,"D"],[10,8,"J"],[11,8,"E"]],"words":["MANDJE"],"ruleset":2}`.
  - `successUpdatesStore()`: een Poster die `move_hoort.json` teruggeeft, geeft `SUCCESS`, en de GameStore is bijgewerkt.
  - `illegalWordRejects()`: een Poster die `{"status":"error","content":{"type":"illegal_word"}}` teruggeeft, geeft `REJECTED(["MANDJE"])`, en `RejectedWords.contains(2,"MANDJE")` is waar. Dit is de terugval op het hoofdwoord tot V6.
  - `networkErrorNoRetry()`: een Poster die een IOException gooit, geeft `ERROR(MV-NET)`, en de Poster is precies één keer aangeroepen.
- [ ] **Stap 2:** draai de tests. Verwacht: FAIL.
- [ ] **Stap 3:** implementeer de klassen, met `HttpURLConnection` in `UrlConnectionPoster` en een time-out van 15 s.
- [ ] **Stap 4:** draai de tests. Verwacht: PASS.
- [ ] **Stap 5:** commit: `feat: zet versturen via de API`.

### Taak 12: Teksten en zichtbaarheid

**Bestanden:**
- Aanmaken: `.../ui/Strings.java`, `.../ui/OverlayVisibility.java`
- Test: `.../test/.../ui/StringsTest.java`, `OverlayVisibilityTest.java`

**Interfaces:**
- Levert:
  - `Strings.get(String lang, Key key) → String`. `Key` is een enum met:
    - `TITLE`, `YOUR_TILES`, `SORT_SCORE`, `SORT_LENGTH`, `SORT_ALPHA`, `PLAY`
    - `NOT_YOUR_TURN`, `DIR_DOWN`, `DIR_ACROSS`, `USES`, `ENDS_ON`
    - `REJECTED`, `RETRY`, `COPY_DETAILS`, `DOWNLOADING`, `PTS`
    - één `ERR_*` per foutcode uit spec §10
  - Talen: `en` plus elke taal waarvoor de app een interfacevertaling heeft. Stel die lijst vast uit de `config.*`-splits en de lokalisatiebestanden in `flutter_assets`. Een ontbrekende taal of sleutel valt terug op `en`.
  - `OverlayVisibility.fabVisible(Long routeGameId, GameState st) → boolean`: zichtbaar bij een niet-null route, een bekend potje dat niet is afgelopen, en een leesbaar potje. Bij een onleesbaar potje is het knopje ook zichtbaar, zodat de melding getoond kan worden.

- [ ] **Stap 1:** schrijf de tests:
  - `fallbackToEnglish()`: `get("xx", PLAY)` geeft `"Play"`.
  - `everyLanguageHasEveryKey()`: elke taal heeft een niet-lege tekst voor elke `Key`.
  - `hiddenOnHome()`, `hiddenWhenEnded()`, `visibleWhenUnreadable()`, `visibleWhenNotMyTurn()`.
- [ ] **Stap 2:** draai de tests. Verwacht: FAIL.
- [ ] **Stap 3:** implementeer de klassen. Schrijf de vertalingen per taal. In de README komt dat niet-Engelse teksten door de maker zijn vertaald en dat verbeteringen welkom zijn.
- [ ] **Stap 4:** draai de tests. Verwacht: PASS.
- [ ] **Stap 5:** commit: `feat: teksten en zichtbaarheidsregels`.

### Taak 13: Knopje en overlay (H3)

**Bestanden:**
- Aanmaken:
  - `.../ui/Theme.java` (donkere kleuren uit spec §9; lichte kleuren voorlopig gelijk aan donker, tot V8)
  - `.../ui/Fonts.java` (laadt `flutter_assets/fonts/InterVariable.ttf` en `DroidSansMono.ttf` via `AssetManager`)
  - `.../ui/TileDrawable.java`, `.../ui/BoardPreviewView.java`, `.../ui/MoveListAdapter.java` (framework `BaseAdapter` voor een `ListView`)
  - `.../ui/OverlayController.java`, `patches/.../ui/OverlayPatch.kt`
- Gebruikt: alles uit taak 4, 6, 7, 8, 10, 11 en 12.

**Interfaces:**
- Levert:
  - `OverlayController.attach(Activity a)`, aangeroepen door `overlayPatch` aan het eind van `Lcom/hbwares/wordfeud/ui/main/MainActivity;->onCreate(Landroid/os/Bundle;)V`.
  - `OverlayController` luistert naar `GameStore`, `RouteTap` en `WordListManager`, en werkt alles op de UI-thread bij.
- Gedrag volgens spec §9 en de mockup `woordenboek_voorbeeldbord.jpg`:
  - knopje van 40 dp, 10 dp boven het plankje (~165 dp boven de onderrand van het Flutter-scherm plus de systeeminset), extra verschoven bij `RouteTap.bannerVisible()`;
  - overlay bijna schermvullend, met het best scorende woord voorgeselecteerd, gedimde letters op het plankje en een informatieregel met de Play-knop;
  - sluiten met het kruisje, door omlaag te vegen, of met de terugknop. De terugknop wordt onderschept via `OnBackInvokedCallback` op API 33+ en anders via `dispatchKeyEvent(KEYCODE_BACK)` op de overlayview.
- De berekening draait op één `Executor` voor de achtergrond. Een nieuwe selectie of nieuwe gegevens annuleren de lopende berekening via `AtomicBoolean`.

- [ ] **Stap 1:** bouw de views en de controller. De eenheidstests blijven groen: draai `./gradlew :extensions:extension:testDebugUnitTest`. Verwacht: PASS.
- [ ] **Stap 2:** patch lokaal en installeer de app (zie `docs/DEV.md`).
- [ ] **Stap 3:** controleer op een toestel, in het potje met NEIGEN (of een vergelijkbaar potje). Verwacht:
  - het knopje staat rechtsonder boven het plankje en is verborgen op het overzicht;
  - na een tik opent de overlay met het rek, het voorbeeldbord en de lijst, zoals in de mockup;
  - een tik op een ander woord werkt het bord direct bij;
  - de terugknop sluit alleen de overlay;
  - wie niet aan zet is, ziet de melding in plaats van de Play-knop.
- [ ] **Stap 4:** maak een screenshot naast de mockup en leg beide voor aan de opdrachtgever. ⛔ **Poort:** pas verder na akkoord.
- [ ] **Stap 5:** commit: `feat: knopje en overlay`.

### Taak 14: Spelen, downloadmeldingen en foutweergave

**Bestanden:**
- Wijzigen: `.../ui/OverlayController.java`
- Aanmaken: `.../play/Refresher.java`, met `static void refresh(long gameId)`. In deze taak staat `ORDER` nog leeg en doet de methode niets; dat is de terugval uit spec §8.4. Verder: `.../ui/ErrorPanel.java` (tekst, code, "Opnieuw proberen" waar dat van toepassing is, en "Kopieer details")
- Test: `.../test/.../ui/ErrorDetailsTest.java`

**Interfaces:**
- Gebruikt: `MoveSubmitter.submit` (taak 11), `WordListManager.ensureForOverlay` (taak 8).
- Levert: `ErrorDetails.format(WfError e, String wfVersion, String patchVersion, int rulesetId, Instant t) → String`, in het formaat `code=…\nwordfeud=…\npatch=…\nruleset=…\ntime=…` (ISO-8601).

- [ ] **Stap 1:** test `ErrorDetailsTest.format()` met vaste waarden en de exacte verwachte tekst.
- [ ] **Stap 2:** draai de test. Verwacht: FAIL.
- [ ] **Stap 3:** implementeer `ErrorDetails` en `ErrorPanel`, en koppel ze in de controller:
  - Play-knop: uitschakelen, `submit` aanroepen, en dan per uitkomst handelen:
    - `SUCCESS`: overlay sluiten en `Refresher.refresh(gameId)` aanroepen (taak 15);
    - `REJECTED`: melding tonen, de lijst herberekenen, de overlay blijft open;
    - `ERROR(MV-NET)`: de Play-knop blijft uit tot de volgende `onGamesDetail`.
  - Ontbrekende lijst: voortgangsbalk tonen via `ensureForOverlay`.
- [ ] **Stap 4:** draai alle tests. Verwacht: PASS.
- [ ] **Stap 5:** controleer op een toestel: zet vliegtuigmodus aan en open de overlay in een regelset zonder lijst. Verwacht: melding `WL-NET`, en "Kopieer details" zet de tekst op het klembord.
- [ ] **Stap 6:** commit: `feat: spelen en foutweergave in de overlay`.

### Taak 15: Wordfeud laten verversen (V4)

**Bestanden:**
- Wijzigen: `.../play/Refresher.java` (uit taak 14)
- Aanmaken: de strategieklassen `ForegroundSignal`, `RouteBounce` en `FcmNudge`
- Wijzigen: `docs/DEV.md` (resultaten)

**Interfaces:**
- Levert:
  - `Refresher.refresh(long gameId)`: voert de eerste strategie uit die in `Refresher.ORDER` staat.
  - Debugbuilds lezen de volgorde uit `wfwf/debug_refresh_order.txt`, zodat je op het toestel kunt testen zonder opnieuw te bouwen.
- De strategieën versturen platformberichten via de `FlutterEngine` van de activiteit. `ForegroundSignal` en `FcmNudge` gebruiken de kanaalnamen uit de proeflogs. Het berichtformaat neem je over van wat `RouteTap` in een debugbuild logt. `RouteBounce` gebruikt `flutter/navigation` `pushRouteInformation` naar `/` en daarna naar `/game/<id>`.
- Kandidaat 3 uit spec §8.4 ("zelf ophalen en aanbieden"): ⛔ alleen als 1, 2 en 4 alle drie falen. Zoek dan een mechanisme, leg het als voorstel voor aan de opdrachtgever en implementeer het pas na akkoord.

- [ ] **Stap 1:** implementeer de klassen. Voeg een debuglog toe die per strategie het moment van uitvoeren registreert.
- [ ] **Stap 2:** test op een toestel per strategie: speel een zet via de Play-knop en noteer of het bord van Wordfeud binnen 2 s het woord toont zonder zichtbaar geflikker.
- [ ] **Stap 3:** zet `Refresher.ORDER` op de eerste geslaagde strategie. Is er geen geslaagd, dan wordt `ORDER` leeg (de terugval uit spec §8.4). Leg de resultaten vast in `docs/DEV.md`.
- [ ] **Stap 4:** commit: `feat: Wordfeud verversen na een zet`.

### Taak 16: Controlestappen V1–V12 afronden

**Bestanden:**
- Wijzigen, afhankelijk van de uitkomst: `Rules.java`, `GameReplay.java`, `MoveSubmitter.java`, `Theme.java`, `Strings.java`, `Constants.kt`, de spec (§12.2, kolom "uitkomst" toevoegen)
- Test: per bevestigde uitkomst een test in de bijbehorende testklasse, met de echte gegevens als fixture

Voer elke stap uit met de debugbuild op het toestel van de opdrachtgever. Leg de uitkomst vast in de spec, voeg de test toe, en commit per V-stap (`fix: V<n> <onderwerp>`).

- [ ] **V1:** speel een zet via de Play-knop. Geaccepteerd betekent dat de releasepoort open is. Bij een weigering: lees de foutcode, voeg ontbrekende headers toe en test opnieuw.
- [ ] **V2:** laat de debugbuild een `game_log` en een eigen zet met een blanco tegel loggen. Implementeer het formaat in `GameReplay` en `MoveRequest`, zet `BLANKS_ENABLED = true`, en voeg de test `blankMoveRoundTrip()` toe.
- [ ] **V3:** speel een zet die een dwarswoord vormt. Leg vast of `words` met en zonder dwarswoorden werkt, en zet het gedrag vast in `MoveRequest`.
- [ ] **V5:** speel (of zoek in een log) een zet met zeven tegels en vergelijk de punten die de server geeft. Zet `BINGO_BONUS` op de juiste waarde. Leg ook de middenvakregel vast uit een eerste zet.
- [ ] **V6:** speel bewust een woord dat Wordfeud niet kent, maar dat wel in onze lijst staat. Leg het foutformaat vast in `MoveSubmitter` en voeg een test toe met de echte respons.
- [ ] **V7:** controleer de positie van het knopje met en zonder banner, en pas de offsets aan.
- [ ] **V8:** maak op basis van de twee screenshots van de opdrachtgever de lichte kleuren in `Theme`.
- [ ] **V9:** laat de debugbuild de `rulesets` loggen uit potjes in andere talen. Werk de namen en id's bij in de spec en in `docs/wordlists.md`.
- [ ] **V10:** zodra een ruil, pas, opgave of time-out in een log verschijnt: implementeer het formaat in `GameReplay`, met een test.
- [ ] **V11:** controleer het bestandstype van 5.7.1 op APKMirror of UpToDown en zet `apkFileType` in `Constants.kt`.
- [ ] **V12:** stel vast waar de app haar interfacetaal vandaan haalt (platformbericht of instelling) en koppel `Strings` daaraan.

V4 is afgerond in taak 15.

### Taak 17: CI, README en eerste release

**Bestanden:**
- Wijzigen: `.github/workflows/release.yml` en `open_pull_request.yml` (stap `./gradlew :extensions:extension:testDebugUnitTest`), `README.md`, `CHANGELOG.md` (via de workflow)

- [ ] **Stap 1:** voeg de unittest-stap toe aan beide workflows, vóór `buildAndroid`.
- [ ] **Stap 2:** schrijf de README met:
  - de naam, en "Patches for Wordfeud, compatible with Morphe" als beschrijving;
  - de installatielink van de patchbron;
  - de bronnentabel uit taak 9;
  - de foutcodetabel uit spec §10;
  - een risicosectie: strijd met de gebruiksvoorwaarden, mogelijke gevolgen voor het account, en zetten die buiten de app om worden verstuurd;
  - de vermelding van het handelsmerk Wordfeud (Bertheussen IT) en dat het project daar niet aan gelieerd is.
- [ ] **Stap 3:** push naar `dev`. Verwacht: CI groen, met een pre-release `.mpp` en `patches-bundle.json`.
- [ ] **Stap 4:** ⛔ **Poort:** controleer dat V1 is afgerond in taak 16, en vraag de opdrachtgever om akkoord voor de stabiele release.
- [ ] **Stap 5:** merge `dev` naar `main` (merge-commit, geen squash), volgens de template.
