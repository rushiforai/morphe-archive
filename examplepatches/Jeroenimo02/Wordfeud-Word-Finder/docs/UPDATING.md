# Een nieuwe Wordfeud-versie ondersteunen

Wordfeud is een Flutter-app. De patch leunt op twee soorten dingen in de app:

1. **Java-methodes waarin de patches code injecteren.** Bestaat zo'n methode niet meer (andere naam of andere
   parameters), dan **faalt het patchen** in Morphe.
2. **Afspraken aan de Dart-kant**: routes, platformberichten, de API en het uiterlijk van het spelscherm. Verandert
   daar iets, dan **lukt het patchen wel**, maar werkt een onderdeel niet meer. De foutcode en "Kopieer details" in de
   overlay wijzen dan meestal de plek aan.

## Stap 1: controleren (2 minuten)

1. Download de nieuwe versie als XAPK van APKPure (dezelfde bron als gebruikers).
2. Draai het controlescript (alleen Python 3 nodig):

   ```sh
   python3 tools/check-apk/check_apk.py Wordfeud_5.9.0_APKPure.xapk
   ```

   Het script toont de versie en per afhankelijkheid `OK` of `MISSING`, met erachter welk deel van de patch het
   gebruikt.

3. **Alles OK?** Ga naar stap 2. **Iets MISSING?** Zie stap 3.

## Stap 2: versie toevoegen en testen

1. Voeg de versie toe in `patches/src/main/kotlin/app/wordfeudwordfinder/patches/shared/Constants.kt`
   (`AppTarget(version = "5.9.0")`). Zonder deze regel kunnen gebruikers de versie alleen als "experimenteel" patchen.
2. Pas de tabel "Compatibiliteit" in deze handleiding aan (onderaan).
3. Maak een branch, PR naar `dev`, wacht op de groene CI en installeer de dev-release via Morphe Manager.
4. Test op een toestel (lijst hieronder). Werkt alles: PR van `dev` naar `main`.

**Testlijst op het toestel**

| Test | Wat je ziet als het misgaat | Waar zoeken |
|---|---|---|
| Boekje-knopje verschijnt op het spelscherm, niet in chat of zetgeschiedenis | Knopje ontbreekt of staat overal | Route (`hooks/PlatformMessages`), kleuren (`ui/ScreenShade`) |
| Knopje wordt afgesneden onder het "⋮"-menu, licht en donker thema | Knopje zweeft over menu's | `ui/ScreenShade` (scrim, paginakleuren) |
| Overlay opent met zetten en een voorbeeldbord in de juiste kleuren | GS-DATA of GS-EVENT-… | `game/GameReplay`, `game/ResponseParser` |
| Spelen met de Play-knop, bord ververst daarna | MV-…-fout, bord ververst niet | `play/MoveRequest`, `play/Refresher` |
| Een woord dat de server weigert: melding in de overlay, PR "Woordenlijst …" op GitHub | Geen melding | `play/MoveSubmitter`, Worker |
| Een potje in een andere taal opent zonder fout | WL-…-fout | `words/WordListManager` |

## Stap 3: als het controlescript iets mist

### Een Java-haakpunt ontbreekt (patchen faalt)

| Haakpunt | Waar het vandaan komt | Waar aanpassen |
|---|---|---|
| `MainActivity.onCreate` | De eigen activity van Wordfeud (staat in `AndroidManifest.xml`) | `patches/.../ui/OverlayPatch.kt` |
| `FlutterJNI.handlePlatformMessage` en `dispatchPlatformMessage` | De Flutter-engine (verandert alleen bij een grote Flutter-update) | `patches/.../platform/PlatformTapPatch.kt`, `extension/.../play/JniDispatch.java` |
| `CronetEngine$Builder.setUserAgent`, `UrlResponseInfo.getUrl` | Chromium Cronet (stabiele, openbare API) | `patches/.../platform/UserAgentPatch.kt`, `extension/.../hooks/NetworkTap.java` |
| `UrlRequestCallbackProxy.on…` | Het Flutter-plugin `cronet_http` (open source) | `patches/.../network/Fingerprints.kt` |

Zo vind je de nieuwe naam:

1. Open de basis-APK (in de XAPK: `com.hbwares.wordfeud.free.apk`) in [jadx](https://github.com/skylot/jadx) (gratis,
   grafisch) en zoek op de oude klasse- of methodenaam.
2. Is de klasse hernoemd of versleuteld (obfuscatie), zoek dan op iets wat niet verandert: een tekst die erin staat,
   de parameters, of de plek waar de methode aangeroepen wordt. Het `cronet_http`-plugin en de Flutter-engine zijn
   open source, dus vergelijken met de broncode helpt.
3. Pas de `Fingerprint` in het Kotlin-bestand aan, en de lijst `HOOKS` in `tools/check-apk/check_apk.py`.
4. Let bij een gewijzigde parameterlijst op de registers in de geïnjecteerde instructie (`p0` = `this`, `p1` = eerste
   parameter, …). Het commentaar boven elke injectie legt uit welke registers gebruikt worden.

### Een Dart-tekst ontbreekt (patchen lukt, een functie niet)

Elke regel in het script noemt de klasse in de extensie die de tekst gebruikt. Zoek in de app naar de nieuwe vorm:

```sh
unzip -p Wordfeud.xapk config.arm64_v8a.apk > /tmp/split.apk
unzip -p /tmp/split.apk lib/arm64-v8a/libapp.so | strings | grep -i "game/"
```

Gebruik daarna "Kopieer details" in de overlay op het toestel. De regels `route=`, `store=` en `server=` tonen wat de
app werkelijk stuurt, en de foutcode noemt het veld of het soort gebeurtenis dat onbekend was.

## Dingen die het script niet kan controleren

| Aanname | Wat er gebeurt als het verandert | Oplossen |
|---|---|---|
| Kleuren van het spelscherm: pagina `#D0D5DB` / `#343B45`, rektegels crème | Knopje verdwijnt op het spelscherm, of verschijnt op andere pagina's | Meet de nieuwe kleuren op screenshots en pas `ui/ScreenShade.java` en `ui/Theme.java` aan |
| Positie van het rek: 10 dp onder het knopje, tegels 40 dp onder het knopje | Idem | `ui/FabPlacement.java`, `ui/ScreenSampler.java` (`RACK_BELOW_DP`) |
| Velden van `game_log`-gebeurtenissen (strikte controle) | Foutcode GS-DATA met het onbekende veld | Voeg het veld toe aan de veldsets in `game/GameReplay.java` |
| Soorten gebeurtenissen (start, packed_move, swap, pass, resign, timeout) | GS-EVENT-&lt;soort&gt; | Nieuwe soort afhandelen in `game/GameReplay.java` |
| Thema via `statusBarIconBrightness` | Verkeerde kleuren in de overlay | `hooks/PlatformMessages.java` |
| Verversen na een zet via `flutter/lifecycle` (LifecycleBounce) | Bord ververst pas na ±20 s | `play/Refresher.java` (andere strategieën staan klaar) |
| Formaat van de zet `[x,y,"L"]`, blanco `"*L"`, dubbelletter `"CH"` | MV-SERVER-protocol | `play/MoveRequest.java` |

## Compatibiliteit

| Wordfeud | Controlescript | Op toestel getest | Opmerkingen |
|---|---|---|---|
| 5.7.1 | – | 2026-11-02 | Eerste versie |
| 5.8.0 | Alles OK (2026-11-06) | 2026-11-06 | Geen aanpassingen nodig |
