# MaterialTidal

**M3 redesign, Material You dynamic theming, swipe gestures, and optional Linn DSM Wi-Fi playback patches for TIDAL on Android.**

[![Build](https://github.com/ninocss/MaterialTidal/actions/workflows/build.yml/badge.svg)](https://github.com/ninocss/MaterialTidal/actions/workflows/build.yml)
[![Release](https://github.com/ninocss/MaterialTidal/actions/workflows/release.yml/badge.svg)](https://github.com/ninocss/MaterialTidal/actions/workflows/release.yml)
[![Release](https://img.shields.io/github/v/release/ninocss/MaterialTidal?label=release)](https://github.com/ninocss/MaterialTidal/releases/latest)
[![License: GPL-3.0](https://img.shields.io/badge/license-GPL--3.0-blue.svg)](LICENSE)

MaterialTidal is an unofficial, open-source collection of **Morphe** patches for the Android **TIDAL** app (`com.aspiro.tidal`). It brings Android 12+ Material You Monet color extraction, M3 floating surfaces, GPU frosted-glass blur, spring physics, gesture controls, and an optional bit-perfect Linn OpenHome Wi-Fi output directly into stock TIDAL without replacing TIDAL's core playback or library logic.

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
| [Material You dynamic theme](#1-material-you-dynamic-theme) | On | — | Wallpaper Monet colors, M3 shapes & frosted-glass blur |
| [System Light & Dark theme](#2-system-light--dark-theme) | On | Material You dynamic theme | Monet Light & Dark themes following your Android system setting |
| [In-app patch settings](#3-in-app-patch-settings) | On | — | Clean MaterialTidal settings menu inside TIDAL Settings for live toggles |
| [M3 navbar & mini-player](#4-m3-navbar--mini-player) | On | — | Floating split-pill dock, detached Search circle & floating mini-player |
| [M3 full player](#5-m3-full-player) | On | — | Blurred cover backdrop, wavy seekbar, tablet two-pane layout & queue |
| [Song waveform seekbar](#6-song-waveform-seekbar) | Off | M3 full player | Track-derived animated audio waveform seekbar with scrub zoom & pulse |
| [Syllable-synced karaoke lyrics](#7-syllable-synced-karaoke-lyrics) | On | M3 full player | Word-by-word karaoke sweep, lift physics & depth blur |
| [Seamless track transitions (Crossfade)](#8-seamless-track-transitions-crossfade) | On | — | Dual-player Crossfade (0–12 s), 4 fade curves, blend strength & gapless albums |
| [Track swipe gestures](#9-track-swipe-gestures) | On | — | Spring-back left & right swipe actions on track rows across TIDAL |
| [M3 homepage](#10-m3-homepage) | On | Material You dynamic theme | Expressive shortcuts, pull-to-refresh & optional promo banner removal |
| [M3 playlist screen](#11-m3-playlist-screen) | On | Material You dynamic theme | Fading hero cover, adaptive Monet palette, pill buttons & rows |
| [M3 albums, artists & library](#12-m3-albums-artists--library) | On | Material You, M3 playlist screen | Fading covers, pill controls & Bento collection grid across media pages |
| [M3 search](#13-m3-search) | On | Material You dynamic theme | Rounded search bars, frosted headers & Expressive browse cards |
| [M3 bottom sheets & menus](#14-m3-bottom-sheets--menus) | On | Material You dynamic theme | Tap-anchored action popups, crisp vector icons, sheets & dialogs |
| [Linn Majik DSM Wi-Fi playback](#15-linn-majik-dsm-wi-fi-playback) | Off | — | OpenHome Wi-Fi discovery & Lossless/Hi-Res FLAC streaming |

*(All patch options configured in Morphe Manager serve as your initial reset defaults and can also be tweaked live inside **Settings → MaterialTidal** when **In-app patch settings** is enabled.)*

### 1. Material You dynamic theme
Applies your Android wallpaper's Material You Monet colors, rounder M3 shapes, and smooth frosted-glass blur across TIDAL's surfaces, accents, and cards.

- `amoledPureBlack` (*AMOLED pure black background*, default: `false`) — Uses `#000000` in Dark Mode while keeping dynamic Monet accents and cards.
- `monetPaletteStyle` (*Monet palette intensity*, default: `"expressive"`) — `Expressive (Rich Tonal, recommended)` (`expressive`), `Vibrant (High Chroma)` (`vibrant`), or `Subtle (Classic Material You)` (`subtle`).
- `expressiveShapes` (*M3 rounded shapes*, default: `true`) — Upgrades buttons, cards, and containers to rounder M3 squircle and pill geometry.
- `expressiveGlassBlur` (*Expressive frosted-glass blur*, default: `true`) — Smooth hardware-accelerated blur across hero fades, toolbars, floating bars, menus, and sheets.
- `blurIntensity` (*Blur intensity*, default: `"balanced"`) — `Balanced (Recommended)` (`balanced`), `Subtle` (`subtle`), or `Strong frosted glass` (`rich`).

### 2. System Light & Dark theme
*(Depends on: **Material You dynamic theme**)*

Adds a Material You Light Mode and automatically switches TIDAL between Light and Dark themes following your Android system setting (or locks to Light or Dark), adapting surfaces, icons, text contrast, dialogs, and system bars.

- `themeMode` (*App theme mode*, default: `"system"`) — `Follow System (Recommended)` (`system`), `Light Mode` (`light`), or `Dark Mode` (`dark`).

### 3. In-app patch settings
Adds a **`MaterialTidal`** menu inside TIDAL's main Settings screen so you can toggle and customize installed MaterialTidal patches live without re-patching, with quick controls, organized sub-pages, and per-page or full reset.

### 4. M3 navbar & mini-player
Replaces TIDAL's bottom bar and mini-player with a floating M3 split-pill navigation dock, detached circular Search button, and separate floating mini-player card with swipe gestures and progressive backdrop blur.

- `navbarColorStyle` (*Navbar & mini-player style*, default: `0`) — `Dark Tonal (Recommended)` (`0`), `Pastel Monet` (`1`), or `Vibrant Contrast` (`2`).
- `hideUploadTab` (*Keep 3 core tabs in dock*, default: `true`) — Shows Home, Explore, and Library in the dock while hiding Uploads.
- `miniPlayerSwipeToSkip` (*Mini-player swipe gestures*, default: `true`) — Horizontal swipe-to-skip and vertical pull-up to expand Now Playing.
- `navbarProgressiveBlur` (*Progressive dock blur*, default: `true`) — Multi-tier GPU progressive blur behind the floating dock and mini-player.

### 5. M3 full player
Redesigns the Now Playing screen with a blurred cover-art backdrop, adaptive Monet colors, animated squiggly seekbar, expressive transport controls, responsive tablet two-pane layout (`>= 600dp`), full-screen lyrics, and a refreshed Play Queue.

- `playerColorStyle` (*Player backdrop style*, default: `0`) — `Cover Pastel & Blur (Recommended)` (`0`), `Dark Tonal Blur` (`1`), or `Heavy Cover Blur` (`2`).
- `playerCoverSwipeToSkip` (*Swipe cover art to skip tracks*, default: `true`).
- `playerSquigglySeekbar` (*Squiggly sine-wave seekbar*, default: `true`).
- `expressivePlayQueue` (*Expressive Play Queue*, default: `true`).
- `tabletDesktopLayout` (*Desktop-style tablet layout*, default: `true`).

### 6. Song waveform seekbar
*(Optional — disabled by default · Depends on: **M3 full player**)*

Replaces the player seekbar (overriding the squiggly line) with an animated audio waveform generated from the playing track, featuring smooth track transitions, scrub zoom, and optional real-time beat pulse.

- `waveformStyle` (*Waveform shape*, default: `0`) — `Mirrored Bars (Recommended)` (`0`), `Bottom Spectrum Bars` (`1`), or `Smooth Filled Wave` (`2`).
- `waveformBarDensity` (*Waveform detail*, default: `1`) — `Chunky (36 bars)` (`0`), `Balanced (56 bars, recommended)` (`1`), or `Fine (76 bars)` (`2`).
- `waveformLiveReactivity` (*Live beat pulse at playhead*, default: `true`).

### 7. Syllable-synced karaoke lyrics
*(Depends on: **M3 full player**)*

Upgrades full-screen lyrics with word-by-word karaoke sweep highlighting, gentle lift physics, depth-of-field blur on inactive lines, duet layout, and open community providers ([`lrc.red`](https://lrc.red), BetterLyrics, LyricsPlus, [LRCLIB](https://lrclib.net), KuGou KRC) with automatic fallback to TIDAL lyrics.

- `lyricsProgressiveBlur` (*Progressive blur on inactive lines*, default: `true`).
- `lyricsBlurStrength` (*Lyrics blur intensity*, default: `"balanced"`) — `Balanced (Recommended)` (`balanced`), `Subtle` (`subtle`), or `Strong` (`strong`).

### 8. Seamless track transitions (Crossfade)
Unlocks dual-player Crossfade playback with configurable overlap (`0–12 s`), 4 audio fade curves, blend intensity (`0–100%`), optional gapless-album preservation, and an interactive full-screen **Crossfade** menu in Settings and the Now Playing menu.

- `crossfadeDefaultSeconds` (*Default crossfade duration*, default: `5`) — `0` (`Off`), `2`, `3`, `4`, `5`, `6`, `8`, `10`, or `12` seconds.
- `crossfadeDefaultCurve` (*Default transition curve*, default: `0`) — `Equal Power (Recommended)` (`0`), `Smooth S-Curve` (`1`), `Soft Dip` (`2`), or `DJ Blend` (`3`).
- `crossfadeDefaultStrength` (*Default blend intensity*, default: `50`) — `Gentle (25%)` (`25`), `Balanced (50%, recommended)` (`50`), `Strong (75%)` (`75`), or `Maximum (100%)` (`100`).
- `crossfadePreserveGaplessAlbums` (*Keep albums gapless by default*, default: `false`).

### 9. Track swipe gestures
Adds spring-back left and right swipe actions to track rows across playlists, albums, search, and your library.

- `swipeRightAction` (*Swipe right action*, default: `"Add to Queue"`) — `Add to Queue`, `Play Next`, `Toggle Favorite`, `Add to Playlist`, or `Disabled`.
- `swipeLeftAction` (*Swipe left action*, default: `"Toggle Favorite"`) — `Add to Queue`, `Play Next`, `Toggle Favorite`, `Add to Playlist`, or `Disabled`.
- `hapticFeedback` (*Haptic feedback*, default: `true`).
- `swipeThresholdDp` (*Swipe threshold (dp)*, default: `72`).

### 10. M3 homepage
*(Depends on: **Material You dynamic theme**)*

Redesigns the Homepage with rounded M3 shortcut and carousel cards, Monet-styled Vibe chips and top bar, pull-to-refresh support, and optional removal of promotional banners.

- `homeCoverRadiusStyle` (*Cover & shortcut corner shape*, default: `"expressive"`) — `Squircle (20dp, recommended)` (`expressive`), `Rounded (14dp)` (`rounded`), or `Subtle (8dp)` (`subtle`).
- `enableHomePullToRefresh` (*Homepage pull-to-refresh*, default: `true`).
- `hideHomeHeadlinersBanner` (*Hide Headliners upload banner*, default: `true`).
- `hideHomePromoModules` (*Hide promo modules*, default: `true`).
- `hideHomeMerchModules` (*Hide merch store modules*, default: `true`).

### 11. M3 playlist screen
*(Depends on: **Material You dynamic theme**)*

Redesigns Playlist pages with a full-bleed fading hero cover, cover-adaptive or Monet colors, pill Play/Shuffle controls, compact expressive action buttons (or full hide), scroll-morphing toolbar, and polished track rows.

- `playlistAccentMode` (*Playlist accent palette*, default: `"adaptive"`) — `Cover + Monet (Recommended)` (`adaptive`) or `System Monet` (`monet`).
- `playlistHeroCoverFade` (*Full-bleed fading hero cover*, default: `true`).
- `playlistTrackRowPolish` (*Expressive track rows*, default: `true`).
- `hidePlaylistActionButtons` (*Hide playlist action buttons*, default: `false`).

### 12. M3 albums, artists & library
*(Depends on: **Material You dynamic theme**, **M3 playlist screen**)*

Extends M3 design (fading hero artwork, adaptive Monet colors, pill controls, and a Bento-style Collection tile grid) to Albums, Artists, My Tracks, and your Library.

- `expressiveAlbums` (*Expressive Album pages*, default: `true`).
- `expressiveArtists` (*Expressive Artist pages*, default: `true`).
- `expressiveMyTracks` (*Expressive My Tracks screen*, default: `true`).
- `expressiveCollection` (*Expressive Collection tile grid*, default: `true`).

### 13. M3 search
*(Depends on: **Material You dynamic theme**)*

Redesigns Search & Explore with rounded Monet search bars, frosted sticky headers, expressive filter pills, and Monet-harmonized genre and browse cards.

- `searchBarPillStyle` (*Search bar shape*, default: `"pill"`) — `Pill (28dp, recommended)` (`pill`) or `Squircle (18dp)` (`squircle`).
- `expressiveSearchCards` (*Expressive Genre & Explore cards*, default: `true`).
- `expressiveSearchHeaderBlur` (*Frosted glass Search header*, default: `true`).

### 14. M3 bottom sheets & menus
*(Depends on: **Material You dynamic theme**)*

Redesigns Song & Playlist action menus as clean tap-anchored M3 popups with crisp vector icons, alongside rounded bottom sheets, grouped menu cards, overflow menus, and M3 dialogs.

- `sheetCornerStyle` (*Sheet & menu corner style*, default: `"expressive"`) — `Expressive (28dp Sheets / 22dp Menus, recommended)` (`expressive`), `Extra Rounded (32dp Sheets / 24dp Menus)` (`extra`), or `Subtle (20dp Sheets / 16dp Menus)` (`rounded`).
- `groupedContextMenuCards` (*Grouped context menu cards*, default: `true`).
- `expressivePopupMenus` (*Expressive overflow & dropdown menus*, default: `true`).
- `expressiveDialogs` (*M3 dialogs*, default: `true`).

### 15. Linn Majik DSM Wi-Fi playback
*(Optional — disabled by default)*

Discovers Linn DS/DSM OpenHome speakers on your local Wi-Fi in TIDAL's Devices sheet and streams Lossless or 24-bit/192 kHz Hi-Res FLAC audio with full transport, queue, hardware volume, and lockscreen controls.

- `linnAudioQuality` (*Preferred audio quality*, default: `0`) — `Hi-Res FLAC (up to 24-bit/192 kHz, recommended)` (`0`), `Lossless FLAC (16-bit/44.1 kHz)` (`1`), or `High (320 kbps AAC)` (`2`).
- `linnStreamMode` (*Stream delivery mode*, default: `0`) — `Local HTTP Proxy (Recommended)` (`0`) or `Direct Lossless + Hi-Res Proxy` (`1`).
- `linnAutoWakeAndSwitch` (*Auto-wake standby & switch input*, default: `true`).
- `linnManualDeviceIp` (*Manual Linn DSM IP (optional fallback)*, default: `""`).

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

If you have a local `tidal.apkm` (`v2.220.1`) in the repository root, you can also run full end-to-end bytecode & DEX verification across all 15 patches:

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
   git tag -a v0.3.0 -m "Release v0.3.0"
   git push origin v0.3.0
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

Syllable-synced and fallback lyrics are fetched from open community lyrics providers — thank you to [`lrc.red`](https://lrc.red), [BetterLyrics](https://docs.betterlyrics.org), [LyricsPlus](https://github.com/ibratabian17/LyricsPlus), and [LRCLIB](https://lrclib.net).

Licensed under the [GNU General Public License v3.0](LICENSE).
