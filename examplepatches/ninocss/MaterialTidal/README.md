# MaterialTidal

**Material 3 Expressive redesign, Material You dynamic theming, swipe gestures, and optional Linn DSM Wi-Fi playback patches for TIDAL on Android.**

[![Build](https://github.com/ninocss/MaterialTidal/actions/workflows/build.yml/badge.svg)](https://github.com/ninocss/MaterialTidal/actions/workflows/build.yml)
[![Release](https://github.com/ninocss/MaterialTidal/actions/workflows/release.yml/badge.svg)](https://github.com/ninocss/MaterialTidal/actions/workflows/release.yml)
[![Release](https://img.shields.io/github/v/release/ninocss/MaterialTidal?label=release)](https://github.com/ninocss/MaterialTidal/releases/latest)
[![License: GPL-3.0](https://img.shields.io/badge/license-GPL--3.0-blue.svg)](LICENSE)

MaterialTidal is an unofficial, open-source collection of **Morphe** patches for the Android **TIDAL** app (`com.aspiro.tidal`). It brings Android 12+ Material You Monet color extraction, Material 3 Expressive floating surfaces, GPU frosted-glass blur, spring physics, gesture controls, and an optional bit-perfect Linn OpenHome Wi-Fi output directly into stock TIDAL without replacing TIDAL's core playback or library logic.

> [!IMPORTANT]
> - **Supported target app:** TIDAL **`v2.220.1`** (`com.aspiro.tidal`)
> - **Minimum Android version:** **Android 12L (API 32)** or newer
> - **Patcher toolchain:** Built with `app.morphe.patches` `2.1.1` / `morphe-patcher` `2.4.0`

---

## Installation

### Option 1: Morphe Manager (Recommended — Auto-Updates)

Add this repository as a remote patch source in **Morphe Manager** to receive automatic `.mpp` updates:

- **One-click deep link:** [`https://morphe.software/add-source?github=ninocss/MaterialTidal`](https://morphe.software/add-source?github=ninocss/MaterialTidal)
- **Manual remote source URL:**
  1. Open **Morphe Manager** → **Patch Sources** (`+`) → **Remote**.
  2. Paste `https://github.com/ninocss/MaterialTidal`.
  3. Confirm adding the source (Morphe Manager reads [`patches-bundle.json`](patches-bundle.json) on `main`).
  4. Select your stock **TIDAL `v2.220.1`** APK/APKM, review patches and options, and tap **Patch**.

### Option 2: Manual `.mpp` Bundle (Morphe Manager Local / Morphe Desktop)

1. Download `MaterialTidal-patches-<version>.mpp` from [**GitHub Releases**](https://github.com/ninocss/MaterialTidal/releases/latest) (optionally verify against `SHA256SUMS.txt`).
2. In **Morphe Manager**, go to **Patch Sources** (`+`) → **Local** and select the `.mpp` file (or load it into **Morphe Desktop**).
3. Select your stock **TIDAL `v2.220.1`** APK/APKM, customize patch options as needed, and patch.

---

## Included Patches

| Patch | Default | Depends On | Summary |
| :--- | :---: | :--- | :--- |
| [Material You dynamic theme](#1-material-you-dynamic-theme) | On | — | Wallpaper Monet colors, Expressive shapes, GPU frosted glass |
| [System Light & Dark theme](#2-system-light--dark-theme) | On | Material You dynamic theme | Monet Light (White) & Dark themes following system setting |
| [Material 3 Expressive navbar & mini-player](#3-material-3-expressive-navbar--mini-player) | On | — | Split-pill dock, detached Search button, floating mini-player card |
| [Material 3 Expressive full player](#4-material-3-expressive-full-player) | On | — | Blurred cover backdrop, wavy seekbar, animated lyrics & queue |
| [Expressive Material 3 homepage](#5-expressive-material-3-homepage) | On | Material You dynamic theme | Expressive shortcuts, pull-to-refresh unlock, promo cleanup |
| [Expressive Material 3 playlist screen](#6-expressive-material-3-playlist-screen) | On | Material You dynamic theme | Fading hero cover, adaptive Monet palette, pill buttons & rows |
| [Expressive Material 3 albums, artists & my tracks](#7-expressive-material-3-albums-artists--my-tracks) | On | Material You, Playlist screen | Expressive headers, fading covers, and tiles across media pages |
| [Expressive Material 3 search](#8-expressive-material-3-search) | On | Material You dynamic theme | Pill search bars, frosted sticky headers, Expressive genre tiles |
| [Expressive Material 3 bottom sheets & menus](#9-expressive-material-3-bottom-sheets--menus) | On | Material You dynamic theme | Grouped menu cards, tonal icon badges, frosted popups & dialogs |
| [Track swipe gestures](#10-track-swipe-gestures) | On | — | Spring-back swipe actions on track rows across TIDAL |
| [Linn Majik DSM Wi-Fi playback](#11-linn-majik-dsm-wi-fi-playback) | Off | — | Optional OpenHome SSDP discovery & Lossless/Hi-Res FLAC streaming |

### 1. Material You dynamic theme
Remaps TIDAL's hardcoded cyan accents, Market colors, dark zinc surfaces, and corner shapes across Wave 1, Wave 2, and Square Market to Android Material 3 Expressive Monet tokens, including `MainActivity` window surfaces and a shared API 31+ `RenderNode`/`RenderEffect` blur kit.

- `amoledPureBlack` (*AMOLED pure black background*, default: `false`) — Keeps `#000000` background while preserving dynamic Monet accents and cards.
- `monetPaletteStyle` (*Monet palette intensity*, default: `"expressive"`) — `Expressive Monet (Rich Tonal)` (`expressive`), `Vibrant Monet (High Chroma)` (`vibrant`), or `Subtle Tonal (Classic Material You)` (`subtle`).
- `expressiveShapes` (*Material 3 Expressive rounded shapes*, default: `true`) — Upgrades Square Market and Wave 1/Wave 2 corner radii to M3 Expressive squircle/pill geometry.
- `expressiveGlassBlur` (*Expressive GPU blur & frosted glass*, default: `true`) — Hardware-accelerated `RenderEffect` & cross-window blur across hero fades, toolbars, sheets, menus, and dialogs.
- `blurIntensity` (*Blur intensity*, default: `"balanced"`) — `Balanced (Recommended)` (`balanced`), `Subtle` (`subtle`), or `Rich frosted glass` (`rich`).

### 2. System Light & Dark theme
*(Depends on: **Material You dynamic theme**)*

Adds a Material 3 Expressive Monet Light (White) Mode and switches TIDAL automatically between Light and Dark themes based on your Android system setting (or forces Light/Dark), adapting Compose surfaces, icons, text contrast, dialogs, and system bars.

- `themeMode` (*App theme mode*, default: `"system"`) — `Follow System (Light & Dark)` (`system`), `Light Mode (White)` (`light`), or `Dark Mode` (`dark`).

### 3. Material 3 Expressive navbar & mini-player
Replaces TIDAL's fused bottom bar and mini-player with a **Material 3 Expressive** split-pill floating navbar (`64dp`), a detached circular Search button, and a separate floating stadium-pill mini-player card with spring physics, morphing Play/Pause states, and progressive backdrop blur.

- `navbarColorStyle` (*Navbar & mini-player color style*, default: `0`) — `Material You Dark Tonal` (`0`), `Material You Pastel (Screenshot)` (`1`), or `Material You Vibrant Contrast` (`2`).
- `hideUploadTab` (*Keep 3 core tabs in pill*, default: `true`) — Keeps Home, Explore, and Library in the main pill (disable to include Uploads).
- `miniPlayerSwipeToSkip` (*Swipe mini-player gestures*, default: `true`) — Horizontal swipe-to-skip with reveal preview and vertical pull-up to open Now Playing.
- `navbarProgressiveBlur` (*Progressive blur under navigation bar*, default: `true`) — 4-tier GPU progressive blur + translucent frosted dock behind the floating bars.

### 4. Material 3 Expressive full player
Replaces TIDAL's Now Playing screen with a **Material 3 Expressive** player featuring a heavily blurred album-art backdrop, cover-derived + Monet palettes, connected split pills, animated squiggly seekbar, morphing transport buttons, full-screen animated lyrics, and an expressive Play Queue.

- `playerColorStyle` (*Player blurred background style*, default: `0`) — `Cover Pastel & Blurred Art (Screenshot)` (`0`), `Dark Tonal Blurred Cover` (`1`), or `Pure Heavy Cover Blur` (`2`).
- `playerCoverSwipeToSkip` (*Swipe cover art to skip tracks*, default: `true`).
- `playerSquigglySeekbar` (*Expressive wavy seekbar*, default: `true`).
- `expressivePlayQueue` (*Expressive Material 3 Play Queue*, default: `true`).

### 5. Expressive Material 3 homepage
*(Depends on: **Material You dynamic theme**)*

Redesigns TIDAL's Homepage with Material 3 Expressive shortcut cards, rounded carousel artwork, Monet-styled Vibe chips and AppBar, unlocked pull-to-refresh, and optional promo decluttering.

- `homeCoverRadiusStyle` (*Homepage cover & shortcut shape*, default: `"expressive"`) — `Expressive Squircle (20dp)` (`expressive`), `Rounded (14dp)` (`rounded`), or `Subtle (8dp)` (`subtle`).
- `enableHomePullToRefresh` (*Unlock homepage pull-to-refresh*, default: `true`).
- `hideHomeHeadlinersBanner` (*Hide Headliners upload banner*, default: `true`).
- `hideHomePromoModules` (*Hide promo modules*, default: `true`).
- `hideHomeMerchModules` (*Hide merch store modules*, default: `true`).

### 6. Expressive Material 3 playlist screen
*(Depends on: **Material You dynamic theme**)*

Redesigns TIDAL's Playlist screen with a full-bleed downward-fading & progressively blurred hero cover, cover-adaptive + Monet colors, `52dp` pill Play/Shuffle buttons, connected secondary action tiles, scroll-morphing frosted toolbar, and clean `68dp` track rows.

- `playlistAccentMode` (*Playlist accent palette*, default: `"adaptive"`) — `Dynamic Cover + Monet (Recommended)` (`adaptive`) or `System Monet Wallpaper` (`monet`).
- `playlistHeroCoverFade` (*Full-bleed downward-fading hero cover*, default: `true`).
- `playlistTrackRowPolish` (*Material 3 Expressive track rows*, default: `true`).

### 7. Expressive Material 3 albums, artists & my tracks
*(Depends on: **Material You dynamic theme**, **Expressive Material 3 playlist screen**)*

Extends the Material 3 Expressive design system (fading hero covers, cover-adaptive & Monet palettes, `52dp` pill buttons, connected secondary tiles, scroll-morphing toolbars, and collection grid styling) to Albums, Artists, My Tracks, My Albums, and My Artists.

- `expressiveAlbums` (*Expressive Album pages*, default: `true`).
- `expressiveArtists` (*Expressive Artist pages*, default: `true`).
- `expressiveMyTracks` (*Expressive My Tracks screen*, default: `true`).
- `expressiveCollection` (*Expressive Collection tile grid*, default: `true`).

### 8. Expressive Material 3 search
*(Depends on: **Material You dynamic theme**)*

Redesigns TIDAL's Search & Explore landing page, default `UnifiedSearchView`, and Compose Wave 2 Search screen with stadium-pill Monet search bars, frosted sticky glass headers, animated filter pills, suggestion badges, and Monet-harmonized genre/explore cards.

- `searchBarPillStyle` (*Search bar corner shape*, default: `"pill"`) — `Expressive Pill (28dp)` (`pill`) or `Expressive Squircle (18dp)` (`squircle`).
- `expressiveSearchCards` (*Expressive Genre & Explore cards*, default: `true`).
- `expressiveSearchHeaderBlur` (*Frosted glass Search header blur*, default: `true`).

### 9. Expressive Material 3 bottom sheets & menus
*(Depends on: **Material You dynamic theme**)*

Redesigns bottom sheets, track/media context menus, toolbar overflow & dropdown menus, and dialogs across XML Views and Jetpack Compose Material 3 with expressive corners, segmented grouped menu cards, circular icon badges, pill drag handles, frosted backdrop blur, and Monet surfaces.

- `sheetCornerStyle` (*Bottom sheet & menu corner style*, default: `"expressive"`) — `Expressive M3 (28dp Sheets / 22dp Menus)` (`expressive`), `Extra Expressive (32dp Sheets / 24dp Menus)` (`extra`), or `Subtle Rounded (20dp Sheets / 16dp Menus)` (`rounded`).
- `groupedContextMenuCards` (*Segmented grouped context menu rows*, default: `true`).
- `expressivePopupMenus` (*Expressive overflow & dropdown menus*, default: `true`).
- `expressiveDialogs` (*Expressive Material 3 dialogs*, default: `true`).

### 10. Track swipe gestures
Adds **Material 3 Expressive** spring-back swipe gestures with Monet pill reveal to track rows across TIDAL (Playlists, Favorite Tracks, Albums, Search Results, Downloads, Mixes & Dynamic Pages).

- `swipeRightAction` (*Swipe right action*, default: `"Add to Queue"`) — `Add to Queue`, `Play Next`, `Toggle Favorite`, `Add to Playlist`, or `Disabled`.
- `swipeLeftAction` (*Swipe left action*, default: `"Toggle Favorite"`) — `Add to Queue`, `Play Next`, `Toggle Favorite`, `Add to Playlist`, or `Disabled`.
- `hapticFeedback` (*Haptic feedback*, default: `true`).
- `swipeThresholdDp` (*Swipe threshold (dp)*, default: `72`).

### 11. Linn Majik DSM Wi-Fi playback
*(Optional — disabled by default)*

Discovers Linn DS/DSM OpenHome speakers on your local Wi-Fi inside TIDAL's Devices sheet and streams Lossless or 24-bit/192 kHz Hi-Res FLAC (via lossless DASH-FLAC remuxing over a local HTTP proxy) with full transport, queue, hardware volume, and lockscreen controls.

- `linnAudioQuality` (*Preferred audio quality*, default: `0`) — `Hi-Res FLAC (up to 24-bit/192 kHz, Auto fallback)` (`0`), `Lossless FLAC (16-bit/44.1 kHz)` (`1`), or `High (320 kbps AAC)` (`2`).
- `linnStreamMode` (*Stream delivery mode*, default: `0`) — `Local HTTP Proxy (All Majik DSM models, recommended)` (`0`) or `Direct CDN for Lossless BTS + Proxy for Hi-Res` (`1`).
- `linnAutoWakeAndSwitch` (*Auto-wake standby & switch input*, default: `true`).
- `linnManualDeviceIp` (*Manual Linn DSM IP (optional fallback)*, default: `""`) — Optional LAN IP (`192.168.1.50` or `192.168.1.50:55178`) if SSDP multicast discovery is blocked on your Wi-Fi network.

---

## Building Locally

### Prerequisites

- **JDK 21** (or newer JDK with `javac`, e.g. Temurin 21 or Android Studio JBR)
- **Android SDK** (`ANDROID_HOME` or `local.properties` `sdk.dir=...`)
- **GitHub Packages authentication** for `https://maven.pkg.github.com/MorpheApp/registry` (read access to packages): set `GITHUB_ACTOR` + `GITHUB_TOKEN` environment variables or `gpr.user` + `gpr.key` in `~/.gradle/gradle.properties`.

### Build & Verify

**Linux / macOS:**

```bash
export GITHUB_ACTOR="<your-github-username>"
export GITHUB_TOKEN="<your-github-pat-with-read-packages>"
./gradlew clean packageZip :patches:verifyLinnProtocol
```

**Windows (PowerShell):**

```powershell
$env:JAVA_HOME = "C:\Program Files\Android\Android Studio\jbr"
$env:GITHUB_ACTOR = "<your-github-username>"
$env:GITHUB_TOKEN = "<your-github-pat-with-read-packages>"
.\gradlew.bat clean packageZip :patches:verifyLinnProtocol
```

If you have a local `tidal.apkm` (`v2.220.1`) in the repository root, you can also run full end-to-end bytecode & DEX verification across all 11 patches:

```powershell
.\gradlew.bat :patches:verifyPatchTidal
```

**Build outputs:**
- `.mpp` bundle: `dist/MaterialTidal-patches-<version>.mpp` (and `patches/build/libs/patches-<version>.mpp`)
- Distribution ZIP: `MaterialTidal-patches.zip`

---

## Releasing

Automated builds and GitHub Releases are driven by [`.github/workflows/release.yml`](.github/workflows/release.yml):

1. **Tag push (`v*`):**
   ```bash
   git tag -a v0.2.1 -m "Release v0.2.1"
   git push origin v0.2.1
   ```
2. **Manual run (`workflow_dispatch`):** Run **Release** from the **Actions** tab with an optional `version`, `prerelease` flag, and custom `release_notes`.

For every release, the workflow:
1. Compiles and verifies `:patches:buildAndroid` and `:patches:verifyLinnProtocol` on `ubuntu-latest`.
2. Packages `dist/MaterialTidal-patches-<version>.mpp` and generates `dist/SHA256SUMS.txt`.
3. Builds release notes from `inputs.release_notes`, the matching `## [<version>]` section in [`CHANGELOG.md`](CHANGELOG.md), or GitHub's auto-generated release notes API.
4. Publishes the GitHub Release with the `.mpp` bundle and `SHA256SUMS.txt` attached.
5. Updates [`patches-bundle.json`](patches-bundle.json) and [`patches-list.json`](patches-list.json) (plus `gradle.properties` if needed) on `main` for stable releases so Morphe Manager detects the update automatically.

---

## Architecture & Patch Catalog

- [TIDAL Architecture & Material 3 Expressive Patch Catalog](docs/TIDAL_ARCHITECTURE_AND_PATCH_CATALOG.md) — Reverse-engineered reference of TIDAL `v2.220.1` (`com.aspiro.tidal`): Wave 1 / Wave 2 / Square Market Compose tokens, shapes, UI screens, track row binders, feature flags, and engineering guidelines.

---

## Disclaimer & License

MaterialTidal is an independent, unofficial open-source project and is not affiliated with, endorsed by, or associated with TIDAL, Square/Block, or Linn Products. All trademarks belong to their respective owners.

Licensed under the [GNU General Public License v3.0](LICENSE).
