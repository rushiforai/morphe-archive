# tv-app — Apple Music TV client

Standalone Android TV app that drives the patched Apple Music engine installed on the
box through the framework `MediaBrowser` / `MediaController` API (no protobuf, no
private APIs). It browses the Android Auto tree exposed under `__AUTO_ROOT__`
(`Início` / `Rádio` / `Biblioteca` + shelves) and plays items with
`playFromMediaId`. The current track is shown as a compact chip on the navigation row;
`enter` on it opens a full-screen Now Playing screen with D-pad controls.

The app declares `android:sharedUserId="com.apple.android"` and must be signed with
the Morphe certificate, otherwise the media service refuses the connection.

## Project layout

- `:core` — shared, UI-agnostic library (`com.anderson.applemusic.core`): the
  `MediaBrowser`/`MediaController` client, the browse/playback models and the session
  custom actions. No Compose UI, no resources; `:car-app` will reuse it — see
  [core/README.md](../core/README.md).
- `:tv-app` — this app only: Compose for TV UI (`TvApp.kt`), the screen state holder
  (`TvViewModel`), theme and resources. It depends on `project(":core")`.
- `:patches` — the Morphe patch bundle of the Apple Music engine.

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

For the box, prefer the release variant (`:tv-app:assembleRelease` →
`tv-app/build/outputs/apk/release/tv-app-release-unsigned.apk`, same signing steps): a
debuggable APK renders ~4x slower here, see Performance.

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
`getMetadata()` in a dedicated `TvViewModel.playback` `StateFlow`, collected with
`collectAsStateWithLifecycle` inside `NowPlayingScreen` / `Header` (not in `TvApp`,
so a playback update never invalidates the browse tree). `MediaController.Callback`
(`onPlaybackStateChanged` / `onMetadataChanged`) delivers track changes; the 500 ms
`viewModelScope` tick only runs while the full player is open, and it re-reads the
position only — `getMetadata()` (which marshals the album art bitmap over binder) is
called exclusively from the callbacks.

D-pad order: initial focus is play/pause, `LEFT` = previous, `RIGHT` = next, then the
`Ações` pill, `DOWN` = seek bar. On the seek bar `LEFT`/`RIGHT` call `TransportControls.seekTo` for −10 s /
+10 s and show "▶ +10s • 1:56" feedback for 1.5 s. `back` returns to the previous
screen (tab root or drill-down grid) with focus on the chip.

## Session actions

The action list is generic over `PlaybackSnapshot.customActions`: the `Ações` pill on
the full player opens a sheet that renders every action the engine announces for the
current track (icon resolved from the engine package resources, title as published).
`enter` calls `MediaBrowserClient.sendCustomAction(action.action)`, closes the sheet and
shows a transient hint ("Favorito aplicado", "Criando estação…", or
"<título> aplicado"). Focus enters the first row and `back` returns it to the pill; the
sheet keeps `UP`/`DOWN` focus inside itself.

Long-press `enter` on a playable card opens its context menu: "Criar estação" (always)
and "Adicionar à Biblioteca" (only while the engine announces that action). Both play
the item first, then wait up to 1.5 s for the engine to report `PLAYING` and to publish
the action for the now-loaded track; if it does not, the hint is
"Indisponível para este item". Focus returns to the card after the menu closes.

## Visual tokens and fonts

`TvTheme.kt` holds the palette used by every screen: black background (`#000000`),
surface `#1C1C1E`, focused surface `#2C2C2E`, primary text `#FFFFFF`, secondary
`#8E8E93`, accent `#FA243C`, card corner 14 dp, overlay corner 16 dp and 32 dp page
padding. Cards are artwork-first with a bottom scrim; focus is a slight
`graphicsLayer` scale plus a colour/brightness change, never an animated shadow.

Typography is **Inter** (SIL OFL — SF Pro cannot be redistributed), bundled as static
TTFs in `res/font` (400/500/600/700) with the licence in `res/raw/inter_license.txt`.
The theme provides it through `LocalTextStyle`, so every `Text` inherits it.

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
  tv-material `Text` / `IconButton`; cards use a local `FocusCard` (`Box` +
  `graphicsLayer` scale), not the tv-material `Card` — see Performance.
- Focus is shown with a 1.05 scale plus a lighter surface/brightness lift; the
  per-card animated elevation (`Modifier.shadow`) was removed — see Performance.
  `enter` on a browsable card (or on a shelf header) pushes a level, `enter` on a
  playable card calls `playFromMediaId`, long-press `enter` opens the card menu and
  `back` pops the level stack.
- The 5th card peeking at the right edge of a shelf is intentional (lazy row with a
  hint of the next item), not a clipping bug.
- The engine's session custom actions (Favorito, Aleatório, Repetir, Reprodução
  Automática, Adicionar à Biblioteca, Criar Estação) are rendered from
  `PlaybackSnapshot.customActions`; see Session actions above. The engine currently
  announces only Favorito and Criar Estação for the measured tracks, so
  "Adicionar à Biblioteca" is hidden until it is published.

## Performance

Measured on the Xiaomi MiTV box (`MiTV-AFMU0`, API 34, arm32, 3840x2160 overridden to
1920x1080 @ 320 dpi, ~2 GB RAM) with the Apple Music engine playing. **Every number
below is a release build** (`assembleRelease`, signed with the Morphe cert).

Two protocols, both in `.pipeline/tv-app/perf*/`:

- **Full sweep** (`perf/sweep.ps1`, unchanged since round 1): cold start + 10 s load
  wait, `dumpsys gfxinfo <pkg> reset`, 20x RIGHT, 20x LEFT, 10x DOWN, 10x UP at 120 ms
  per key, then `dumpsys gfxinfo`. Raw: `perf2/sweep-*.txt`, `perf/after2.txt`.
- **Isolated leg** (`perf2/leg.ps1`): one cold start per repeat, gfxinfo reset, 12x DOWN
  (fresh rows, the cost being chased) or 16x RIGHT (same row, reference) at 200 ms per
  key; 1 warm-up repeat is discarded and 5 are measured. Raw: `perf2/<tag>-*.txt`.

`dumpsys gfxinfo` percentiles are **not** usable for small deltas here: identical
repeated runs of the same APK swung DOWN p50 from 69 ms to 250 ms (the box hums at load
4-5 with the engine streaming, and a missed vsync doubles a frame). What is stable
(±5 %) is the per-frame *composition window* from
`dumpsys gfxinfo framestats`: `AnimationStart -> PerformTraversalsStart`, i.e. the
Choreographer frame callback. `perf2/parse.ps1` extracts it; a DOWN press onto an
uncomposed shelf produces exactly one heavy frame (>50 ms) per press, RIGHT produces
none, so `heavyFrames` and `heavyP50` are the comparable quantities.

### A/B: what round 1 bought (release, full sweep, same script)

| build | run | frames | janky | p50 | p90 | p99 |
|---|---|---|---|---|---|---|
| `642525f` parent | 1/2/3 | 148/148/151 | 72.97/75.00/72.85 % | 77/81/73 | 250/250/250 | 350/400/300 |
| `b499536` round 1 | 1/2/3 | 180/170/165 | 63.33/64.71/63.64 % | 57/57/57 | 250/200/200 | 300/300/300 |
| round 2 (this commit) | 1/2/3 | 167/140/164 | 49.10/55.71/50.61 % | 40/48/42 | 200/200/150 | 350/350/300 |

So the round-1 changes (no animated shadows, scroll only when needed, playback in its
own `StateFlow`) are a real release win, not only the idle frames: **-9.3 pp janky,
p50 77 -> 57 ms, ~15 % more frames rendered** with the same key sweep. That closes the
open question from round 1. Round 2 takes another **-13.0 pp janky and p50 57 -> 42 ms**.
(The raw debug-vs-release comparison from round 1 still holds: a debuggable APK renders
~4x slower, p50 250 ms / 96 % janky, which is why measurements moved to release.)

### Revamp round (artwork-first cards)

Same isolated leg (`leg.ps1 -Tag revamp -Repeat 3`, release): DOWN x12 = **12 heavy
frames over 3 reps** (4 per leg, equal to round 2) with `heavyP50` **149.6 ms** (round 2:
156.7 ms); RIGHT x16 = 0/0/1 heavy frames, `compP50` 8.1/8.3/8.5 ms. The full-bleed cover
(220x124 with a bottom scrim) therefore did not add a heavy frame per shelf and the heavy
frame stayed inside the round-2 range. The box was shared with other work during this
run, so the gfxinfo percentiles (DOWN p50 61/65/97 ms) are only indicative; raw dumps are
`perf2/revamp-*.txt` and `perf2/revamp.csv`.

### Where the DOWN cost actually is (framestats)

Baseline `b499536`: DOWN x12 = 51 heavy frames per 60 presses, `heavyP50` **207 ms**;
RIGHT x16 = 0 heavy frames, `compP50` 15-17 ms. So a fresh shelf costs ~200 ms of
UI-thread frame callback, and only ~20 ms of it is the focus/animation work that RIGHT
pays. `PerformTraversalsStart -> DrawStart` stays at ~0.1 ms, so it is composition
(composing the row's ~7 cards), not layout. The gfxinfo "recomposition" attribution
from round 1 was therefore right; the *shape* of the fix was wrong (the cost is not the
`Card` wrapper or the text).

| step | change (measured one at a time, 5 reps each) | heavy frames / 60 DOWN | heavyP50 |
|---|---|---|---|
| 0 | `b499536` baseline | 52 | 202.1 ms |
| 1 | Compose stability report + `@Immutable` (`Section`, `TvUiState`, `PlaybackSnapshot`) | 51 | 207.1 ms |
| 2 | `FocusCard`: own `Box` + `graphicsLayer` scale + focused `background`, no tv-material `Card` (no ripple / border / glow nodes / DPad key handler) | 41 | 187.4 ms |
| 3 | less text per card (title 1 line, subtitle or "Tocar" in a single `Text`) | 40 | 189.8 ms |
| 4 | `LazyLayoutCacheWindow(ahead = 360.dp, behind = 360.dp)` on the shelf `LazyColumn` | **20** | **156.7 ms** |

DOWN p50 of the isolated leg over the same sessions (5 reps, median): baseline **85 ms**,
final **77 ms**; RIGHT p50 48 -> 42 ms. The p50 moves less than `heavyFrames` because
half of the DOWN presses now cost nothing extra and the remaining ones still pay ~157 ms
on the press frame.

What each hypothesis showed:

- **(a) lighter card works, but only ~10 %.** tv-material `Card` is not the problem:
  removing its surface/ripple/glow/key handling still leaves a ~187 ms row. It is kept
  anyway (less machinery per focused card), look unchanged: focus scale + focused
  container colour, `enter` still plays/navigates (`clickable` handles DPAD_CENTER).
- **(b) pre-composition is the lever.** Compose 1.11.4 has **no** `beyondBoundsItemCount`
  on `LazyColumn` (checked in `foundation-android-1.11.4`); the supported equivalent is
  the experimental `LazyLayoutCacheWindow` (ahead/behind), applied to the shelf column.
  It halves the number of expensive DOWN presses: a shelf that is already composed
  within 360 dp does not have to be composed on the key press.
- **(c) text/content is not the driver.** Cutting a `Text` node and a second title line
  moved nothing (189.8 vs 187.4 ms). Fewer cards per row would scale the cost linearly,
  but that changes the UI, so it was not done.
- **(d) Coil `filterQuality` is not available at the pinned version.** Coil 3.5.0 has no
  `filterQuality` on `ImageRequest`/`AsyncImage` (it lands in 3.6.x, which needs
  `compileSdk 37`); there is also no crossfade API at 3.5.0, so cards already load
  `size(52.dp)` + `ContentScale.Crop` with no fade. Nothing to measure here.

### Compose compiler metrics / stability

Enabled with the plugin DSL, which is the supported API for AGP 9.1 + Kotlin 2.4.21
(no `-P plugin:androidx.compose.compiler.plugins.kotlin:metricsDestination` needed):

```kotlin
composeCompiler {
    metricsDestination = layout.buildDirectory.dir("compose-metrics")
    reportsDestination = layout.buildDirectory.dir("compose-reports")
}
```

Reports land in `tv-app/build/compose-reports/` (`tv-app-classes.txt`,
`tv-app-composables.txt/.csv`) and the module JSON in `tv-app/build/compose-metrics/`.
Findings: all **20/20 composables are restartable and skippable**; there is no
non-remembered-lambda or `CardDefaults.scale` instability in `TvCard` / `SeeAllCard` /
`BrowseItem`. What was unstable were the state holders: `PlaybackSnapshot` (a `Bitmap?`
field), `Section` and `TvUiState` (`List`/`Map`/`Set` fields). They are all immutable by
construction, so they now carry `@Immutable` — step 1 above shows this has **no
measurable effect on DOWN** (202 -> 207 ms, noise; a second 3-rep session put the
annotation build at 216 ms against a 215 ms baseline), which is expected: a DOWN composes
new cards, it does not recompose stable ones. `LevelGrid(items: List<BrowseItem>?)` is
still `Uncertain`; fixing it needs `kotlinx-collections-immutable`, and the grid is not
on the focus path.

### Still open

- DOWN is still ~1.8x the cost of RIGHT (p50 77 vs 42 ms) and p99 350 ms has not moved:
  ~157 ms per newly revealed shelf is still paid on the key press. Going further means
  pre-composing rows outside the key press (a `Column` with `verticalScroll` would keep
  every shelf composed at the cost of a heavier cold start) or a cheaper card.
- The cold-start cost of the 360 dp cache window was not measured (it composes ~2 extra
  shelves at launch).
- `UP`/`LEFT` legs were not re-measured in round 2 (the sweep covers them end-to-end).
- JankStats / Macrobenchmark are still the missing repeatable baseline; the box at 2 GB
  with a full swap (`633 MB of 648 MB`) makes `gfxinfo` runs vary ~20 %.

### UNVERIFIED

- Play/pause/seek were validated only after the account's other device stopped
  streaming (Apple Music showed "Mais de um dispositivo…" and the session stayed
  `NONE` until then). Concurrent-device behaviour is outside the app's control.
- The chip placeholder when the engine has no loaded track was not exercised on the box:
  the session always had metadata during validation.
- Artwork loading with a cold Coil cache / slow network; only the warm path was seen.
- `dumpsys gfxinfo` percentiles on this device report `4950ms` when zero frames were
  rendered, which is what an idle run shows.
- The `@Immutable` annotations were verified by the compiler report, not by a perf gain:
  no effect on the measured DOWN leg (as expected, and it is not claimed as a win).
- The cache window is an `@ExperimentalFoundationApi`; it was measured on this device
  and Compose 1.11.4 only.
