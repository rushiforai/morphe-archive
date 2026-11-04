# Ontwikkelen

De extensie vereist **Android 7.0 (API 24) of nieuwer** (o.a. `java.util.function`, `Comparator.comparing`,
`List.sort`, `URLConnection.getContentLengthLong`, `Math.addExact`). Gebruik geen API's boven 24 zonder versiecheck.

## Reguliere commando's (CI en machines met Android SDK)

```sh
./gradlew :extensions:extension:testDebugUnitTest   # JVM-unittests van de extensie
./gradlew buildAndroid                              # bouwt patches/build/libs/patches-*.mpp
```

De Morphe Gradle-plugin (`app.morphe.patches` 2.1.0) komt van GitHub Packages
(`maven.pkg.github.com/MorpheApp/registry`) en vereist een token (`gpr.user`/`gpr.key` in
`~/.gradle/gradle.properties`, of `GITHUB_ACTOR`/`GITHUB_TOKEN`).

## Tests zonder Android SDK

Voor omgevingen zonder Android SDK en zonder toegang tot GitHub Packages staat in
`tools/jvm-tests/` een zelfstandige Gradle-build (gewone `java`-plugin, Java 17,
Maven Central). Die compileert `extensions/extension/src/main/java` en draait
`extensions/extension/src/test/java` (+ `src/test/resources`) met JUnit 4.13.2 en `org.json`.

```sh
gradle -p tools/jvm-tests test
```

- Klassen die `android.*` gebruiken kunnen niet op de gewone JVM compileren. Het pakket `**/ui/**`
  wordt daarom uitgesloten; extra bestanden zet je expliciet in de lijst `androidOnly` in
  `tools/jvm-tests/build.gradle.kts`.
- Compilatiecontrole van alle extensiebronnen (inclusief `ui/`) tegen `android.jar` (platform 34):

  ```sh
  tools/jvm-tests/android-compile-check.sh
  ```

  Het script downloadt `android.jar` eenmalig naar `tools/jvm-tests/.cache/` (genegeerd door git) en
  draait `javac` over alle bronnen. Dit controleert alleen of het compileert, niet of het draait.

## Patchversie (BuildInfo)

`core/BuildInfo.java` staat niet in `src/main`: de taak `generateBuildInfo` in
`extensions/extension/build.gradle.kts` schrijft hem naar `build/generated/source/buildinfo/` met
`PATCH_VERSION = project.version` (uit `gradle.properties`; semantic-release zet daar de releaseversie in
voordat hij bouwt). De map is een Android-bronmap van `main` en `preBuild` hangt van de taak af. "Kopieer
details" (spec §10) toont deze versie. De JVM-testbuild en `android-compile-check.sh` gebruiken in plaats
daarvan `tools/jvm-tests/src/buildinfo/java/.../BuildInfo.java` met `"dev"`.

## Lokaal patchen

**Nog niet geverifieerd op een toestel.** Volgens de README en documentatie van Morphe Desktop
(`MorpheApp/morphe-cli`, vereist Java 21+):

```sh
java -jar morphe-desktop-*-all.jar patch -p patches/build/libs/patches-*.mpp \
  -o wordfeud-patched.apk wordfeud-5.7.1.apkm
# Optioneel direct installeren via ADB: voeg -i toe. Alleen versiecontrole overslaan: -f
```

De GUI kan dezelfde `.mpp` laden (lokale bron) en accepteert `.apk`, `.apkm`, `.xapk` en `.apks`.
Het resultaat is `*-patched.apk`, getekend met de gedeelde `morphe.keystore`.

## V4 — verversen

Na een geslaagde zet via de Play-knop roept de overlay `Refresher.refresh(gameId)` aan (spec §8.4). De
strategieën staan in `extensions/.../play/`:

| Naam | Kanaal | Bericht |
|---|---|---|
| `LifecycleBounce` | `flutter/lifecycle` | StringCodec (platte UTF-8) `AppLifecycleState.inactive`, `.hidden`, `.paused`, na 300 ms `.hidden`, `.inactive`, `.resumed` (30 ms ertussen; één reeks: is `inactive` verstuurd, dan volgt `resumed` altijd, ook als een tussenstap mislukt) |
| `ForegroundSignal` | `dev.flutter.pigeon.wordfeud.FlutterProcessLifecycleApi.onForegroundStateChanged` | StandardMessageCodec `[false]`, na 100 ms `[true]` (één reeks: is `[false]` verstuurd, dan volgt `[true]` altijd) |
| `RouteBounce` | `flutter/navigation` | JSON `pushRouteInformation` naar `/`, na 80 ms naar `/game/<id>` (één reeks; sleutels `location` én `uri`, `state: null`) |
| `FcmNudge` | `plugins.flutter.io/firebase_messaging` | StandardMethodCodec `Messaging#onMessage` met `{messageId, sentTime, data: {type: "move", game_id}}` (de `data`-sleutels zijn een gok) |

Kandidaat 3 (zelf `games/detail` ophalen en aanbieden) is niet gebouwd: pas na akkoord, en alleen als 1, 2 en 4
alle drie falen.

Het huidige testbuild (testbuild 5) gebruikt standaard `LifecycleBounce`: `Refresher.ORDER` bevat alleen die strategie. Een lege
volgorde (via het debugbestand) betekent: er gebeurt niets en Wordfeud ververst zelf (~20 s).

| Strategie | Status |
|---|---|
| ForegroundSignal | testbuild 2026-11-02, uitkomst: werkt niet (bord ververst niet) |
| RouteBounce | testbuild 2 2026-11-02, uitkomst: geen effect, ook geen navigatie zichtbaar → vermoedelijk komt het bericht niet aan |
| RouteBounce | testbuild 3 2026-11-02 (diagnose-toast + FlutterJNI-pad), uitkomst: berichten komen aan via FlutterJNI (engine-pad: `NoSuchMethodException getFlutterEngine`), maar geen verversing; extra /game-pagina op de stapel (twee keer terug nodig) → ongeschikt |
| ForegroundSignal | testbuild 4 2026-11-02 (FlutterJNI-pad als hoofdpad, korte toast), uitkomst: komt aan (jni 2/2 OK), geen verversing; Wordfeud ververst zelf na 20–30 s |
| LifecycleBounce | testbuild 5 2026-11-02 (app-levenscyclus via `flutter/lifecycle`, toast `WFWF LifecycleBounce: jni 6/6 OK`), uitkomst: werkt (meermaals getest 2026-11-02), definitief |

`Refresher.ORDER` blijft `[LifecycleBounce]`. De diagnose-toast is verwijderd.

### Diagnose en verzendpaden

De volledige stappenregel staat als `refresh=` onder "Details kopiëren", bijvoorbeeld
`LifecycleBounce: jni=captured, dispatchPlatformMessage via getMethod | dispatch(flutter/lifecycle,26B) OK | …`.
De tekst bevat alleen klasse-/methodenamen, uitkomsten, kanaalnamen en aantallen bytes; geen potje-id's of
berichtinhoud.

Verzendpaden (`FlutterBridge`), sinds testbuild 4: eerst het **FlutterJNI-pad**: `platformTapPatch` geeft de
FlutterJNI-instantie door (`RouteTap.onPlatformMessage(Object, String, ByteBuffer)`, zwak vastgehouden) en
`JniDispatch` roept daarop `dispatchPlatformMessage(String, ByteBuffer, int position, int responseId = 0)` aan (op
de main thread, direct buffer). Die namen blijven behouden omdat FlutterJNI aan native code gebonden is.
Testbuild 3 liet zien dat berichten zo aankomen. Het engine-pad (`getFlutterEngine()` → `getDartExecutor()` →
`send(String, ByteBuffer)`) werkt op Wordfeud 5.7.1 niet (`NoSuchMethodException getFlutterEngine` op
MainActivity), maar blijft als goedkoop terugvalpad: alleen als er geen FlutterJNI gevangen is of een `dispatch`
een fout gooit.

### Debugbestand

Het bestand `debug_refresh_order.txt` in `wfwf/` is de opt-in (er is geen BuildConfig van de app om te lezen).
Bestaat het, dan vervangt de inhoud `ORDER` en logt de patch onder tag `WFWF-Refresh` (alleen namen van
strategieën en kanalen, nooit inhoud van berichten). Bestaat het niet, dan wordt er niets gelogd. Inhoud:
strategienamen gescheiden door komma's of regels, hoofdletterongevoelig, `#` begint commentaar.

Gezocht wordt (eerste die bestaat):

1. `/data/data/com.hbwares.wordfeud.free/files/wfwf/debug_refresh_order.txt` (intern; met adb alleen via root of
   `run-as` bij een debuggable build);
2. `/sdcard/Android/data/com.hbwares.wordfeud.free/files/wfwf/debug_refresh_order.txt` (extern, zonder root),
   **alleen vanaf Android 11 (API 30)**. Tot en met Android 10 kan elke app met `WRITE_EXTERNAL_STORAGE` in die map
   schrijven en zo zonder toestemming van de gebruiker het debuggedrag aanzetten; daar telt alleen het interne
   bestand. Op Android 10 of ouder heeft de test dus root nodig (of een debuggable build met `run-as`).

```sh
# Zonder root (externe map van de app; alleen Android 11+):
adb shell mkdir -p /sdcard/Android/data/com.hbwares.wordfeud.free/files/wfwf
adb shell "echo RouteBounce > /sdcard/Android/data/com.hbwares.wordfeud.free/files/wfwf/debug_refresh_order.txt"
# Met root (interne map; nodig op Android 10 en ouder):
adb shell su -c "'echo RouteBounce > /data/data/com.hbwares.wordfeud.free/files/wfwf/debug_refresh_order.txt && chmod 644 /data/data/com.hbwares.wordfeud.free/files/wfwf/debug_refresh_order.txt'"

adb shell am force-stop com.hbwares.wordfeud.free   # het bestand wordt gelezen bij het starten van het scherm
adb logcat -s WFWF-Refresh

# Na de test: bestand weer weghalen (dan stopt ook het loggen)
adb shell rm /sdcard/Android/data/com.hbwares.wordfeud.free/files/wfwf/debug_refresh_order.txt
```

De volgorde zelf wordt bij elke zet opnieuw gelezen; alleen het loggen van kanaalnamen (`channel seen: …`) wordt
bij het starten van het scherm aan- of uitgezet.

### Testprocedure (per strategie)

1. Zet precies één naam in het debugbestand en start Wordfeud opnieuw.
2. Controleer in logcat de regels `channel seen: …`: komt `dev.flutter.pigeon.wordfeud.…` voor (het voorvoegsel van
   de pigeon-kanalen) en `plugins.flutter.io/firebase_messaging`? Wijkt een naam af van de tabel hierboven, noteer
   dan de echte naam.
3. Open een potje waarin je aan de beurt bent, open de overlay en speel een zet via de Play-knop.
4. Logcat toont `strategy <naam>: start`, `schedule …`, `sent …`. Kijk op het bord van Wordfeud:
   - toont het bord **binnen 2 s** het gelegde woord (en het nieuwe plankje en de score)?
   - is er **geen zichtbaar geflikker** (geen kort ander scherm, geen leeg bord, geen melding of banner)?
   - bij `FcmNudge` in het bijzonder: verschijnt er een melding of in-app banner ("nieuwe zet", "… heeft gespeeld")?
     Dat telt als zichtbaar geflikker.
5. Noteer het resultaat hieronder. Herhaal voor de volgende strategie.

De eerste strategie die beide haalt gaat in `Refresher.ORDER` (taak 15, stap 3). Haalt geen enkele het, dan blijft
`ORDER` leeg.

| Strategie | Kanaalnaam bevestigd (logcat) | Bord binnen 2 s | Geen geflikker | Opmerkingen | Datum / toestel |
|---|---|---|---|---|---|
| `LifecycleBounce` | | | | | |
| `ForegroundSignal` | | | | | |
| `RouteBounce` | | | | | |
| `FcmNudge` | | | | | |

Stand 2026-11-01: nog niet op een toestel getest; `ORDER` is daarom leeg (terugval uit spec §8.4).

## Woordenlijsten

De lijsten staan in `wordlists/` en worden gebouwd met `python3 tools/wordlists/build.py` (alleen de
standaardbibliotheek van Python). Zie `wordlists/README.md`. Na een wijziging in `sources.json`, `remove.txt` of
`add.txt` het script draaien en `wordlists/` committen; de workflow `Word lists` controleert dat met `--check`.

Gradle genereert `WordListManifest.java` uit `wordlists/manifest.json` (`gradle/wordlist-manifest.gradle.kts`),
met als repository `GITHUB_REPOSITORY` (CI) of `wordlistRepository` uit `gradle.properties`, en als commit
`GITHUB_SHA` (CI) of `git rev-parse HEAD`. Een lokaal gebouwde patch downloadt dus alleen als die commit gepusht is.
