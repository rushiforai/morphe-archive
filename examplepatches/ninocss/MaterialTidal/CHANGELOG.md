# Changelog

All notable changes to **MaterialTidal** are documented in this file.

## [0.3.0]

### Added
- **In-app patch settings (`PatchSettingsPatch`):**
  - Clean Instagram-style full-screen **`MaterialTidal`** settings menu inside TIDAL's main Settings screen (`Settings → MaterialTidal`) with Quick Controls, organized category sub-pages for all 50 patch options, custom 24dp vector icons, flat grouped cards, spring-animated M3 switches, connected segmented buttons, thick-track sliders, per-page or full reset, and smart Reload UI / Restart prompts.
- **Seamless track transitions (`CrossfadePlaybackPatch`):**
  - Dual-player Crossfade playback with configurable duration (`0–12 s`), 4 audio fade curves (`Equal Power`, `Smooth S-Curve`, `Soft Dip`, `DJ Blend`), adjustable blend intensity (`0–100%`), optional gapless-album preservation, live curve visualizer, and clean full-screen **Crossfade** menu in Settings and Now Playing.
- **Song waveform seekbar (`WaveformSeekbarPatch`):**
  - Optional track-derived animated audio waveform seekbar with mirrored/bottom/smooth styles, configurable bar density (`36` / `56` / `76`), scrub zoom, and real-time beat pulse reactivity.
- **Unified Morphe Patcher metadata:**
  - Standardized `M3 ...` patch naming and clean user-facing option descriptions noting live customization via `Settings → MaterialTidal`.
- **Desktop-inspired Tablet & Wide-Screen Fullscreen Player (`ExpressivePlayerView`, `PlayerDesktopLayoutSolver`, `DesktopQueuePanelRenderer`, `ExpressivePlayQueueController`):**
  - **Two-Pane Desktop Landscape Mode** (`>= 600dp` wide landscape/large tablets/foldables/DeX): large 1:1 Hero Cover squircle on the left (smoothly centering in Artwork Focus mode when collapsing the side panel) paired with a frosted right-hand panel switching with spring animation between an interactive **Play Queue** (live `NOW PLAYING`, `UP NEXT`, and `NEXT FROM <SOURCE>` sections, tap-to-play, one-tap remove, and full-sheet expand) and side-by-side **Lyrics** (keeping the hero cover full-size).
  - **3-Zone Floating Desktop Playback Dock**: Left track metadata + favorite heart, Center `[Shuffle | Prev | Play/Pause | Next | Repeat]` with inline wavy seekbar and timestamps, and Right `[Lyrics | Queue | Cast]` connected pills + interactive system volume slider + live stream spec quality pill (e.g. `24-BIT · 192 kHz FLAC`).
  - **Refined Tablet Portrait Mode & Sheet Sizing**: centered editorial column widths (`<= 540dp` player controls, `<= 440dp` cover & bottom capsule, `<= 620dp` lyrics measure), header source pill, and bounded `<= 560dp` Play Queue modal sheet on tablets.
  - Added `tabletDesktopLayout` patch option (enabled by default) and `VerifyTabletPlayerLayout` unit test suite (`:patches:verifyTabletPlayerLayout`).
- **Expressive expand-and-push-back player transport buttons (`ExpressivePlayerView`):**
  - Tapping or holding **Previous**, **Play/Pause**, or **Next** in either the Now Playing screen or the full-screen Lyrics view dynamically expands the pressed button into a squircle while neighboring buttons smoothly compress and push back with bouncy spring recoil, directional icon motion, subtle vertical lift, and tonal highlight.
- **Standalone `Syllable-synced karaoke lyrics` patch** *(depends on `Material 3 Expressive full player`, enabled by default)*:
  - Multi-provider syllable- and word-synced lyrics cascade (`lrc.red` direct ISRC, `lrc.red/api/v1`, `lrc.red` search, BetterLyrics multi-host, LyricsPlus multi-mirror pool with HTTP 429 cooldown, LRCLIB word-synced YAML `lyricsfile`, and KuGou KRC) with automatic ISRC caching, HTTPS redirect following, and **LRCLIB** line-synced fallback when TIDAL itself has no lyrics.
  - Sub-millisecond playback clock synchronized to TIDAL's native `ProgressTracker` with smooth 120fps frame interpolation.
  - 3-stop luminous feathered syllable sweep gradient, progress-coupled buoyant active-word lift springs with sustained vocal swell and staggered wave settle, elastic per-line cascade parallax scroll, right-aligned duet vocals, stacked background vocals, and floating animated instrumental break dots.
  - Hardware-accelerated GPU progressive depth-of-field blur (`lyricsProgressiveBlur`, `lyricsBlurStrength`) on inactive lyric lines that clears smoothly on focus or while browsing.
  - Pure-JVM unit test suite (`:patches:verifySyllableLyrics`).
- **Compact aligned Playlist secondary action bar (`ExpressivePlaylistController`, `ExpressiveMediaStyleKit`, `ExpressivePlaylistPatch`):**
  - Removed header Search/Sort pills to restore TIDAL's toolbar controls directly, removed circular icon backgrounds, unified all standard buttons (`Favorite`, `Edit`, `Privacy`, `Share`) and `DownloadSecondaryActionButton` to a sleek `56dp` height (`20dp` outer / `8dp` inner connected corners), exact `20dp` icons and centered `11sp` labels on identical vertical baselines, z-ordered & color-filter-cleared download icon/ring alignment, WCAG-verified foreground contrast, smooth neighbor-push spring physics, and a new `hidePlaylistActionButtons` patch option to hide the entire row completely.
- **Tap-anchored Material 3 Expressive menus for Song & Playlist actions + crisp vector icons (`ExpressiveBottomSheetStyler`, `ExpressiveContextMenuIcons`, `MaterialYouColorEngine`):**
  - Converted Song-Actions (`BottomSheetTrackHeader`) and Playlist-Actions (`BottomSheetPlaylistHeader`) from full-width bottom sheets into true tap-anchored `268dp` Material 3 Expressive menus (`22dp` rounded corners, subtle `0.14` dim, upward/downward flip anchoring around the tapped button, slim `60dp` integrated header with divider, borderless `44dp` rows with subtle muted destructive styling instead of filled red highlight cards, flicker-free layout-ready single reveal animation, and instant outside-tap & back dismissal).
  - Replaced context menu icons with custom crisp `24dp`-grid Material 3 Expressive vector drawables rendered cleanly at `20dp` with high contrast (`ExpressiveContextMenuIcons`) across all Song & Playlist actions.

### Fixed
- **Lyrics not updating when skipping tracks in Lyrics View (`ExpressivePlayerBridge`, `ExpressivePlayerView`, `SyllableLyricsFetcher`):**
  - Resolved and validated track metadata (`trackId`, `albumTitle`, `trackIsrc`, `durationMs`, and queue `MediaItem.getTitle()`) atomically before evaluating lyric state so lagged queue ISRC/track metadata from the previous song can never poison or stall skipped songs, suppressed transient stale native lyric frames, and preserved Lyrics View seamlessly across skips even when a track falls back to external/LRCLIB lyrics.

## [0.2.0]

Initial public release of **MaterialTidal** targeting **TIDAL `v2.220.1`** (`com.aspiro.tidal`) on **Android 12L+ (API 32+)**.

### Highlights & Included Patches
- **Material You dynamic theme:** Remaps Wave 1, Wave 2, Square Market, and `MainActivity` surfaces/accents to Android 12+ Monet tonal tokens (`expressive`, `vibrant`, `subtle`, optional AMOLED pure black) and adds a shared API 31+ GPU frosted-glass blur kit (`ExpressiveBlurKit`).
- **System Light & Dark theme:** Adds a Material 3 Expressive Monet Light (White) Mode and switches TIDAL dynamically between Light and Dark themes based on the Android system setting (or forced mode).
- **Material 3 Expressive navbar & mini-player:** Split-pill floating dock (`64dp`) with detached circular Search button, progressive backdrop blur, spring physics, and a separate floating mini-player card with swipe-to-skip and pull-up-to-open gestures.
- **Material 3 Expressive full player:** Blurred album-art backdrop, cover-adaptive + Monet palettes, connected split pills, animated wavy seekbar, morphing transport controls, full-screen animated lyrics, and expressive Play Queue.
- **Expressive Material 3 homepage:** Expressive shortcut cards, rounded carousel artwork, Monet Vibe chips & AppBar, unlocked pull-to-refresh, and promo/merch/banner decluttering options.
- **Expressive Material 3 playlist screen:** Full-bleed downward-fading & progressively blurred hero cover, cover-adaptive + Monet palette, `52dp` pill Play/Shuffle buttons, connected action tiles, frosted collapsing toolbar, and polished `68dp` track rows.
- **Expressive Material 3 albums, artists & my tracks:** Extends the Material 3 Expressive design system to Album pages, Artist pages, My Tracks, My Albums, and My Artists.
- **Expressive Material 3 search:** Stadium-pill/squircle Monet search bars, frosted sticky glass headers, animated filter chips, suggestion/history badges, and Monet-harmonized genre/explore cards.
- **Expressive Material 3 bottom sheets & menus:** Unified XML & Compose Material 3 bottom sheets, grouped context menu cards, circular tonal icon badges, pill drag handles, frosted popup/overflow menus, and expressive dialogs.
- **Track swipe gestures:** Spring-back swipe gestures across all TIDAL track list binders (`Add to Queue`, `Play Next`, `Toggle Favorite`, `Add to Playlist`, configurable threshold and haptics).
- **Linn Majik DSM Wi-Fi playback *(optional, off by default)*:** Local Wi-Fi OpenHome SSDP discovery inside TIDAL's Devices sheet and Lossless / 24-bit/192 kHz Hi-Res FLAC playback with lossless DASH-FLAC remuxing, queue, hardware volume, and lockscreen controls.
