# tv-app — Apple Music TV client

Standalone Android TV app that drives the patched Apple Music engine installed on the
box through the framework `MediaBrowser` / `MediaController` API (no protobuf, no
private APIs). It browses the Android Auto tree exposed under `__AUTO_ROOT__`
(`Início` / `Rádio` / `Biblioteca` + shelves) and plays items with
`playFromMediaId`. The current track is shown as a compact chip on the navigation row;
`enter` on it opens a full-screen Now Playing screen with D-pad controls.

The app declares `android:sharedUserId="com.apple.android"` and must be signed with
the Morphe certificate, otherwise the media service refuses the connection.

## Build

```powershell
$env:JAVA_HOME="C:\Users\anderson\.jdks\jdk-21.0.11+10"
$env:GRADLE_USER_HOME="$PWD\.gradle-user"
$env:GITHUB_ACTOR="andersonlucasg3"; $env:GITHUB_TOKEN=$(gh auth token)
.\gradlew.bat :tv-app:assembleDebug :patches:buildAndroid --no-daemon `
  "-Pkotlin.compiler.execution.strategy=in-process"
```

The module does not use the default debug key (`signingConfig = null`); the APK that
AGP writes is `tv-app/build/outputs/apk/debug/tv-app-debug-unsigned.apk`.

## Sign with the Morphe certificate

```powershell
java -cp ".companion\tools;<bcprov-jdk18on.jar>" BksToP12 `
  tools\morphe-data\morphe.keystore Morphe tools\tv-app-signing.p12 Morphe

$bt="$env:LOCALAPPDATA\Android\Sdk\build-tools\36.0.0"
& "$bt\zipalign.exe" -p -f 4 tv-app\build\outputs\apk\debug\tv-app-debug-unsigned.apk .pipeline\tv-app\tv-app-aligned.apk
& "$bt\apksigner.bat" sign --ks tools\tv-app-signing.p12 --ks-key-alias Morphe `
  --ks-pass pass:Morphe --key-pass pass:Morphe `
  --out .pipeline\tv-app\tv-app-debug.apk .pipeline\tv-app\tv-app-aligned.apk
& "$bt\apksigner.bat" verify --print-certs .pipeline\tv-app\tv-app-debug.apk
# SHA-256 must be 1e058623722ed37eb59bb55411d01d6b7b212c6a8353aacecd60d515cee60463
adb install -r .pipeline\tv-app\tv-app-debug.apk
```

## Now Playing (full screen)

The player chip sits at the top right, after the tabs and the search icon. It shows
the session artwork plus title/artist, is focusable only while the engine has a loaded
track, and `enter` opens the full-screen `NowPlayingScreen`. `back` closes it and
returns the D-pad focus to the chip. The old bottom bar was removed so the content
area never competes with it for focus.

The full screen shows large artwork, title, artist, album, elapsed/total time and a
progress bar. Values come from `MediaController.getPlaybackState()` /
`getMetadata()` through `TvUiState.playback` (`StateFlow` collected with
`collectAsStateWithLifecycle`). `MediaController.Callback`
(`onPlaybackStateChanged` / `onMetadataChanged`) re-emits state immediately; a 500 ms
`viewModelScope` loop only advances the position while playing, so no Android timers
leak.

D-pad order: initial focus is play/pause, `LEFT` = previous, `RIGHT` = next, `DOWN` =
seek bar. On the seek bar `LEFT`/`RIGHT` call `TransportControls.seekTo` for −10 s /
+10 s and show "▶ +10s • 1:56" feedback for 1.5 s. `back` returns to the previous
screen (tab root or drill-down grid) with focus on the chip.

## Artwork

`MediaDescription.iconUri` is populated for the Home shelves, playlists, albums,
recently played and radio stations (`https://is1-ssl.mzstatic.com/...`), so card
artwork is loaded with Coil 3 (`coil-compose` + `coil-network-okhttp`, hence the
`INTERNET` permission). Coil is pinned to **3.5.0**: 3.6.x requires `compileSdk 37`,
which AGP 9.1.0 does not support here; 3.5.0 requires only 36.

Three node families return no icon URI: `library/artists` (93 items),
`radio/radio_by_genres` (21 items) and the `library` category list. Those cards keep
the gradient + ♪ placeholder, which is also shown while an image is loading/fails.
Player artwork comes from the session's `METADATA_KEY_ALBUM_ART` bitmap.

## Search

The magnifier opens a "Busca indisponível via engine" screen. The legacy MediaBrowser
tree only exposes the Android Auto sections and has no search surface. Implementing it
later needs either the Apple Music media API directly or an extension inside the
shared-UID engine (like the existing Morphe patches). Not attempted in this phase.

## Notes

- AGP 9.1.0 has built-in Kotlin support; applying `org.jetbrains.kotlin.android`
  fails with "no longer required since AGP 9.0", so only the Compose compiler plugin
  is declared. The Kotlin compiler itself comes from the build classpath that the
  Morphe settings plugin already sets up.
- Compose BOM is pinned to `2026.06.01` (Compose 1.11.4): the current BOM
  (`2026.09.00`, Compose 1.12.1) requires `compileSdk 37`, while AGP 9.1.0 caps the
  recommended compile SDK at 36 and the project builds with `compileSdk 36`.
- Compose for TV 1.1.0 no longer ships `TvLazyRow` / `TvLazyColumn` (they were
  removed in favour of the regular Compose lazy layouts), so the shelves and the
  grid use `LazyRow` / `LazyColumn` from `androidx.compose.foundation` with
  tv-material `Card` / `Text` / `IconButton`.
- Focus is shown with a 1.06 scale + elevation + lighter card surface; `enter` on a
  browsable card (or on a shelf header) pushes a level, `enter` on a playable card
  calls `playFromMediaId`, and `back` pops the level stack.
- The 5th card peeking at the right edge of a shelf is intentional (lazy row with a
  hint of the next item), not a clipping bug.

## Performance / próximos passos

Owner feedback after Fase 2: the app feels heavy and focus movement between cards is
slow. Not optimized in this iteration. Hypotheses to investigate:

- The 1.06 scale + elevation animation runs on every focus change, and the focused
  card also triggers `animateScrollToItem`, so each D-pad press queues layout and
  animation work.
- `LazyRow`/`LazyColumn` items declare no `contentType`, so Compose cannot reuse
  compositions between SeeAll and playable cards while scrolling.
- Coil decodes new 256 px images while the focused row scrolls; no prefetch or
  crossfade tuning.
- The box is arm32 with ~2 GB RAM and this is a non-minified debug build.
- `TvUiState` carries `playback`, which changes every 500 ms; that recomposes the
  whole `TvApp` tree (shelves included) even when only the chip needs the new value.
  Splitting playback into its own `StateFlow` is the first thing to try.

Measure with `adb shell dumpsys gfxinfo com.anderson.applemusic.tv framestats` and
`adb shell dumpsys gfxinfo com.anderson.applemusic.tv reset` around a scripted D-pad
walk; add JankStats or a Macrobenchmark for a repeatable baseline later.

## UNVERIFIED

- Play/pause/seek were validated only after the account's other device stopped
  streaming (Apple Music showed "Mais de um dispositivo…" and the session stayed
  `NONE` until then). Concurrent-device behaviour is outside the app's control.
- The chip placeholder when the engine has no loaded track was not exercised on the
  box: the session always had metadata during validation.
- Artwork loading with a cold Coil cache / slow network; only the warm path was seen.
