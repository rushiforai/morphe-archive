# TIDAL Android (`com.aspiro.tidal` v2.220.1) — Architecture & Material 3 Expressive Patch Catalog

> **Target APK:** `tidal.apkm` -> `base.apk` (`com.aspiro.tidal`, `versionName=2.220.1`, `versionCode=10025`, `minSdk=32`, `targetSdk=36`)  
> **Purpose:** Persistent reverse-engineering reference and patch roadmap for building **MaterialTidal** Morphe patches cleanly without re-surveying the APK each session.

---

## 1. APK Overview & Hybrid UI Stack

### 1.1 Footprint (`base.apk`)
- **DEX files:** 28 DEX files (`classes.dex` – `classes28.dex`), **84,599** total classes (`27,068` root-level R8-obfuscated classes).
- **Primary First-Party Code Packages:**
  - `com/tidal/android/*`: 7,275 classes (`feature/*`, `dynamicpages/*`, `core/*`, `featureflags/*`, `debugmenu/*`, `resources/*`, `navigation/*`, `tokens/*`)
  - `com/tidal/sdk/*`: 6,511 classes (`tidalapi/networking/*`, auth/SDK layers)
  - `com/aspiro/wamp/*`: 2,959 classes (legacy Views/Fragments, `playlist/*`, `mycollection/*`, `settings/*`, `nowplaying/*`, `player/*`, `contextmenu/*`, `dynamicpages/*`)
  - `com/tidal/wave2/*`: 390 classes (Compose Wave 2 design system & Material 3 atoms/molecules)
  - `com/tidal/wave/*`: 189 classes (Compose Wave 1 design system & Material 1 components/tokens)
- **Bundled UI Frameworks:**
  - Jetpack Compose (`androidx/compose/ui`: 2,590; `foundation`: 2,367; `material3`: 1,771; `material`: 1,283; `runtime`: 696; `animation`: 493)
  - AndroidX / Material Components (`androidx/recyclerview/widget`: 205; `androidx/appcompat/widget`: 261; `com/google/android/material` 1.13.0 incl. `res/xml/m3expressive_*.xml` & `m3_*.xml`)
  - Media3 ExoPlayer (`androidx/media3/exoplayer`: 1,114) & Android TV / Leanback (`androidx/tv/material3`: 370; `androidx/leanback/*`: 675)
- **Compiled Resources (`resources.arsc` = 1,273,572 bytes):**
  - `res/drawable*`: 2,015 entries
  - `res/layout*`: 643 entries (412 TIDAL-specific)
  - `res/color*`: 290 entries (291 dumped color entries, 197 pure TIDAL colors)
  - `res/anim*` + `animator*`: 68 + 64 entries (43 TIDAL/custom anims)
  - `res/menu*`: 17 entries | `res/font*`: 14 entries | `res/xml*`: 21 entries (`20` XML config files)

### 1.2 Manifest Entrypoints & Global Singletons
- **Application (`AndroidManifest.xml`):**
  - `com.tidal.android.application.TidalApp`
  - `Lcom/aspiro/wamp/App;` (`App$a;.a:()Lcom/aspiro/wamp/App;`): holds global DI graph field `a: Lhba;` (`classes23.dex`), getter `App;.e()Ljl0;`.
- **Main Activities (`AndroidManifest.xml`):**
  - `com.aspiro.wamp.launcher.LauncherActivity` (`classes.dex`, style `AppTheme.Launcher` -> `Theme.SplashScreen`)
  - `com.aspiro.wamp.MainActivity` (`classes.dex`, style `AppTheme.MainActivity` -> `AppTheme`)
    - Key UI controller fields on `MainActivity`:
      - `D: Lcom/tidal/android/feature/appscaffold/ui/snackbar/a;` (Snackbar Host controller)
      - `E: Lhob;` (`MiniPlayerViewModel` interface)
      - `F: Le1i;` (`TabBarViewModel` interface)
      - `G: Lak0;` (`AppScaffoldViewModel` / `DefaultAppScaffoldManager` interface)
      - `H: Lazd;` (`PlayerViewModel` interface)
  - Built-in Debug Activities:
    - `com.tidal.android.debugmenu.DebugMenuActivity` (`classes26.dex`, renders Compose `DebugMenuScreenKt.a(...)`)
    - `com.aspiro.wamp.debugoptions.DebugOptionsActivity` (`classes26.dex`, `AppCompatActivity`)
- **Background Services (`AndroidManifest.xml`):**
  - `com.aspiro.wamp.player.MusicService` (`classes.dex`)
  - `com.aspiro.wamp.offline.DownloadService`

---

## 2. Design Systems & Theming Architecture (Wave 2, Wave 1 & XML)

TIDAL renders newer screens with **Wave 2 (`com/tidal/wave2`)** on top of Jetpack Compose Material 3, transitional Compose screens with **Wave 1 (`com/tidal/wave`)**, and legacy Fragments/RecyclerViews with **XML themes/colors (`AppTheme`)**. A full **Material 3 Expressive** redesign needs to theme all three layers coherently.

### 2.1 Wave 2 Compose Design System (`com/tidal/wave2/*`, `classes13.dex` & `classes25.dex`)
- **Theme Composable:**
  - `Lcom/tidal/wave2/theme/WaveThemeKt;->a(Landroidx/compose/ui/text/font/FontFamily;Lpn7;Landroidx/compose/runtime/Composer;II)V` (`classes13.dex`, Compose trace: `"com.tidal.wave2.theme.WaveTheme (WaveTheme.kt:50)"`)
- **Static Token Holders & CompositionLocals on `WaveThemeKt` (`classes13.dex`):**

| Static Field | Type | CompositionLocal Field | Token Category |
| :--- | :--- | :--- | :--- |
| `a` | `Lzwj;` | `g` (`LocalWaveColors`) | 112 `long` Compose `Color` tokens |
| `b` | `Lcxj;` | `h` (`LocalWaveCornerRadiuses`) | 8 `float` `Dp` corner radii |
| `c` | `Lexj;` | `i` (`LocalWavePaddings`) | 9 `float` `Dp` spacing/padding steps |
| `d` | `Ljxj;` | `j` (`LocalWaveShapes`) | 33 `RoundedCornerShape` / aspect tokens |
| `e` | `Lkxj;` | `k` (`LocalWaveSizes`) | 23 `float` `Dp` size tokens (`size0`..`sizeFull`) |
| `f` | `Lyxj;` | `l` (`LocalWaveTypography`) | 25 typography fields (`a: FontFamily`, `b..y: Ltxj;`) |
| *(dynamic)* | `Color` | `m` (`LocalWaveContentColor`) | Defaults to `Lzwj;.z0` (`#FFFFFFFF`) |
| *(dynamic)* | `TextStyle` | `n` (`LocalWaveTextStyle`) | Defaults to `Lyxj;.d->a()` |
| `o` | `RippleConfiguration` | `RippleKt.getLocalRippleConfiguration()` | Material 3 ripple configuration |

#### Complete Core `Lzwj;` (`WaveColors`) Token Table (`classes13.dex`)
Decoded directly from `WaveThemeKt.<clinit>()` and `Lzwj;.toString()`:

| Group | Field | Semantic Token Name | Default ARGB Hex | Material 3 / Expressive Role |
| :--- | :--- | :--- | :--- | :--- |
| **Base Surfaces** | `v0` | `solidBaseFill` | `#FF000000` | `background` / AMOLED `surface` |
| | `s0` | `solidBaseBright` | `#FF18181B` | `surfaceContainerLow` |
| | `t0` | `solidBaseBrighter` | `#FF242429` | `surfaceContainer` (Cards, Sheets) |
| | `u0` | `solidBaseBrightest` | `#FF303036` | `surfaceContainerHigh` / `surfaceContainerHighest` |
| | `q..v` | `opacityBaseFill{Regular,Thick,Thin,Transparent,UltraThick,UltraThin}` | `#66/99/33/00/CC/1A + 000000` | Scrims & base overlays |
| | `i..l` | `opacityBaseBright{Thick,Thin,Transparent,UltraThick}` | `#99/33/00/CC + 18181B` | Elevated translucent surfaces |
| | `m..p` | `opacityBaseBrighterUltraThick` / `opacityBaseBrightest{Regular,Thin,UltraThin}` | `#CC242429`, `#66/33/1A + 303036` | Translucent container overlays |
| **Accent** | `r0` | `solidAccentFill` | `#FF33FFEE` | `primary` |
| | `m0` | `solidAccentBright` | `#FF66FFF3` | `primary` (bright highlight) |
| | `n0` | `solidAccentBrighter` | `#FF99FFF7` | `primaryFixed` / glow |
| | `o0` | `solidAccentDark` | `#FF3D8F88` | `primary` muted / pressed |
| | `p0` | `solidAccentDarker` | `#FF244240` | `primaryContainer` |
| | `q0` | `solidAccentDarkest` | `#FF141F1E` | `secondaryContainer` / dark tint |
| | `e..h` | `opacityAccentFill{Regular,Thin,UltraThick,UltraThin}` | `#66/33/CC/1A + 21FEEC` | Tonal fills & badges |
| | `b`, `d` | `opacityAccentDarkUltraThick`, `opacityAccentDarkestUltraThick` | `#33EDEDED`, `#FF141F1E` | Tonal pressed/dark overlays |
| **Contrast (Text/Icons)** | `z0` | `solidContrastFill` | `#FFFFFFFF` | `onSurface` / `onBackground` |
| | `w0` | `solidContrastDark` | `#FFE4E4E7` | Primary icon/text soft contrast |
| | `x0` | `solidContrastDarker` | `#FFAFAFB6` | `onSurfaceVariant` (subtitles) |
| | `y0` | `solidContrastDarkest` | `#FF787887` | `outline` / disabled / metadata |
| | `w..B` | `opacityContrastFill{Regular,Thick,Thin,Transparent,UltraThick,UltraThin}` | `#66/99/33/00/CC/1A + FFFFFF` | Dividers, ripples, borders |
| **Material Blur/Tint** | `a` | `materialLight` | `#80252525` | Translucent nav/pill light backdrop |
| | `c` | `materialDark` | `#CC3D8F88` | Translucent accent backdrop |
| **Special (HiRes/Gold)** | `b1`, `W0..a1` | `solidSpecial{Fill,Bright,Brighter,Dark,Darker,Darkest}` | `#FFFFBF80`, `#FFFFD9B3`, `#FFFFF2E5`, `#FF996633`, `#FF423324`, `#FF1F1A14` | MAX / Editorial highlight |
| | `I..L` | `opacitySpecialFill{Regular,Thin,UltraThick,UltraThin}` | `#66/33/CC/1A + FFBE7D` | Special badges |
| **Warning / Destructive** | `h1`, `c1..g1` | `solidWarning{Fill,Bright,Brighter,Dark,Darker,Darkest}` | `#FFEF2F62`, `#FFF35E85`, `#FFF68DA9`, `#FFAA0D37`, `#FF4C0618`, `#FF1C0209` | `error` / `errorContainer` |
| **Rainbow Accents** | `A0..V0`, `C..H` | `solidRainbow{Blue,Green*,Orange,Purple*,Red*,Yellow*}`, `opacityRainbow*` | `#FF33A7FF`, `#FF33FFA9`, `#FFFFC45C`, `#FFB033FF`, `#FFFF4242`, `#FFFFD432` | Category tags & live indicators |

*(Fields `M` through `l0` store third-party share/partner service brand colors `servicesAppleMusic`..`servicesYoutubeMusic`.)*

#### `Lcxj;` (`WaveCornerRadiuses`, `classes13.dex`)
| Field | Name | Default Dp | IEEE-754 Hex (`<init>`) | Suggested M3 Expressive Target |
| :--- | :--- | :--- | :--- | :--- |
| `a` | `none` | `0dp` | `#0` | `0dp` |
| `b` | `xxs` | `4dp` | `#4080` (`4.0f`) | `6dp` |
| `c` | `xs` | `8dp` | `#4100` (`8.0f`) | `12dp` |
| `d` | `s` | `12dp` | `#4140` (`12.0f`) | `16dp` |
| `e` | `r` | `16dp` | `#4180` (`16.0f`) | `22dp` |
| `f` | `m` | `20dp` | `#41a0` (`20.0f`) | `26dp` |
| `g` | `l` | `24dp` | `#41c0` (`24.0f`) | `32dp` |
| `h` | `full` | `1000dp` | `#447a` (`1000.0f`) | `1000dp` (Pill/Circle) |

#### `Lexj;` (`WavePaddings`, `classes13.dex`)
- `a` (`xxs`) = `4dp` (`#4080`), `b` (`xs`) = `8dp` (`#4100`), `c` (`s`) = `12dp` (`#4140`), `d` (`r`) = `16dp` (`#4180`), `e` (`m`) = `20dp` (`#41a0`), `f` (`l`) = `24dp` (`#41c0`), `g` (`xl`) = `32dp` (`#4200`), `h` (`xxl`) = `40dp` (`#4220`), `i` (`xxxl`) = `64dp` (`#4280`).

#### `Lyxj;` (`WaveTypography`) & Font Resources (`res/font/`)
- **Default Font Family:** `Lmhc;.a: Landroidx/compose/ui/text/font/FontFamily;` (Nationale: `nationale_regular.otf`, `nationale_medium.otf`, `nationale_demi_bold.otf`, `nationale_bold.otf`, `nationale_black.otf`).
- **Alternate Fonts:** `square_sans_display_font_family.xml`, `square_sans_text_font_family.xml` (`square_sans_text_{regular,medium,semi_bold,bold}.otf`, gated by `square-sans-font`), `roboto_mono_bold.ttf`, `festive.ttf`.
- **Semantic Styles on `Lyxj;`:** `bodyLargeThin`, `bodyRegularBold`, `bodyRegularDemi`, `bodyRegularThin`, `capitalRegularDemi`, `capitalSmallBold`, `captionDemi`, `descriptionBold`, `descriptionDemi`, `descriptionThin`, `footnoteDemi`, `footnoteThin`, `headlineBold`, `headlineDemi`, `heroLargeBold`, `heroRegularBold`, `subheadlineBold`, `subheadlineDemi`, `titleLargeBold`, `titleLargeDemi`, `titleLargeThin`, `titleMediumBold`, `titleRegularBold`, `titleSmallBold`.

#### Key Wave 2 Component Classes
- **Atoms (`com/tidal/wave2/components/atoms/`, `c13`, `c22`, `c25`):** `WaveAvatarKt`, `WaveBadges`, `WaveBadgesKt`, `WaveButtons`, `WaveButtonsKt`, `WaveCheckboxes`, `WaveDividers`, `WaveProgressBars`, `WaveTextStackKt`, `WaveToggleKt`, `Size`, `DividerAxis`, `AvatarSize`.
- **Molecules (`com/tidal/wave2/components/molecules/`, `c13`, `c25`):** `WaveCoverCells`, `WaveCovers`, `CoverCellImageOption`, `CoverCellLeadingOptions`, `CoverCellTrailingOptions`, `LeadingOptions`, `TrailingOptions`, `WaveSection`, `WaveSectionKt`, `WaveNavBars`, `WaveNavBarButtons`, `WaveSnackbarKt`, `WaveSnackbarStyle`.
- **Foundation (`c13`):** `WaveScaffoldKt`, `WaveTextKt`.

### 2.2 Wave 1 Compose Design System (`com/tidal/wave/*`, `classes25.dex`)
- **Theme Composable:** `Lcom/tidal/wave/theme/WaveThemeKt;->a(Lpn7;Landroidx/compose/runtime/Composer;I)V` (`classes25.dex`, trace `"com.tidal.wave.theme.WaveTheme (WaveTheme.kt:24)"`, Local field `a: ProvidableCompositionLocal`).
- **Design Tokens (`com/tidal/wave/designtokens/*`, `classes25.dex`):**
  - `WaveRadius`: `None=0dp`, `ExtraSmall=4dp`, `Small=8dp`, `Regular=12dp`, `Large=16dp`, `Full=1000dp`.
  - `WaveOpacity`: `UltraThin=0.05f`, `Thin=0.10f`, `Regular=0.40f`, `Thick=0.60f`, `UltraThick=0.80f`.
  - `WaveSpacing`: `Minimum..Maximum` (enum `Dp` steps).
  - `WaveFontWeight`: `Medium`, `Demi`, `Bold`.
  - `WaveGradientType`: `AccentDark`, `BaseBright`, `BaseBrighter`.
  - `WaveTextColor` (`com/tidal/wave/theme/WaveTextColor`): `Default`, `Secondary`, `Tertiary`, `Inactive`, `Url` (`resolve-WaAFU9c(Composer, I)J`).
- **Components (`com/tidal/wave/components/*`, `classes25.dex`):** `WaveBadgeKt`, `WaveButtonStyle`, `WaveCheckboxKt`, `WaveIconButtonKt`, `WaveScaffoldKt`, `WaveSurfaceKt`, `WaveSwitchKt`, `WaveTextFieldKt`, `WaveTextKt`, `WaveTopAppBarKt`, `WaveSnackbarKt`.

### 2.3 Legacy XML Themes & Colors (`resources.arsc`)
- **Themes:** `style/AppTheme` (`parent=Theme.MaterialComponents.NoActionBar.Bridge`), `style/AppTheme.MainActivity`, `style/AppTheme.SquareSans`, `style/AppTheme.Launcher`.
- **Bundled Material 1.13 Expressive XMLs:** `res/xml/m3expressive_button_shape_state_list.xml`, `m3expressive_connected_buttons_inner_corner_size_state_list.xml`, `m3_button_group_child_size_change.xml`, `m3_split_button_inner_corner_size_state_list.xml`.
- **Key Semantic Colors (`color/*`):**
  - Surfaces: `baseFill` (`#ff000000`), `baseBright` (`#ff18181b`), `baseBrighter` (`#ff242429`), `baseBrightest` (`#ff303036`), `gray_darken_45` (`#ff0c0c0d`), `gray_darken_43` (`#ff101012`), `gray_darken_40` (`#ff17171a`), `gray_darken_35` (`#ff222226`), `gray_darken_25` (`#ff393940`), `gray_darken_15` (`#ff505059`), `gray` (`#ff72727f`)
  - Accents: `accentFill` (`#ff33ffee`), `accentBright` (`#ff66fff3`), `accentBrighter` (`#ff99fff7`), `accentDark` (`#ff3d8f88`), `accentDarker` (`#ff244240`), `accentDarkest` (`#ff141f1e`), `cyan` (`#ff21feec`), `cyan_16` (`#2921feec`), `cyan_50` (`#8021feec`), `cyan_darken_40` (`#ff14998e`), `cyan_darken_80` (`#ff07332f`)
  - Text: `contrastFill` (`#ffffffff`), `contrastDark` (`#ffe4e4e7`), `contrastDarker` (`#ffafafb6`), `contrastDarkest` (`#ff787887`), `textDefault` (`#ffffffff`), `textSecondary` (`#ffafafb6`), `textTertiary` (`#ff787887`), `textInactive` (`#ff303036`), `textUrl` (`#ff33ffee`)
  - Badges / Special: `specialFill` (`#ffffbf80`), `gold` (`#ffffbe7d`), `max_solid_fill` (`#ffffd432`), `badge_high_background` (`#1a33ffee`), `badge_high_text_color` (`#ff33ffee`), `badge_max_background` (`#1affd432`), `warningFill` (`#ffff3269`)

---

## 3. App Shell, Navigation Bar & Toolbars

- **App Scaffold (`com/tidal/android/feature/appscaffold/ui/*`, `classes7.dex`):**
  - `AppScaffoldViewModel` & `DefaultAppScaffoldManager` — orchestrate root scaffold state, player sheet expansion (`PlayerState`: `FULL_PLAYER`, `MINI_PLAYER`, `NONE`), mini-player visibility (`ObserveMiniPlayerVisibilityUseCase`), and snackbars (`DefaultSnackbarManager`, `StyledSnackbarKt`, `SnackbarStyle`: `NORMAL`, `WARNING`).
- **Bottom Tab Bar:**
  - `TabBarViewModel` (`classes7.dex`) & `TabBarContract$TabType` (`classes7.dex`): enum values **`HOME`**, **`SEARCH`**, **`COLLECTION`**, **`FEED`**, **`UPLOADS`**.
  - `Lcom/tidal/wave2/components/molecules/navbar/WaveNavBars;` (`classes13.dex`, methods `a` and `b`) & `WaveNavBarButtons` (`classes25.dex`, methods `a` and `b`).
- **Top App Bars & Collapsing Toolbars:**
  - Compose: `Lcom/tidal/wave/components/WaveTopAppBarKt;` (`classes25.dex`)
  - Views: `Lcom/aspiro/wamp/dynamicpages/ui/widget/FadingToolbar;` (`classes23.dex`), `Lcom/tidal/android/resources/widget/InsetsCollapsingToolbarLayout;` (`classes26.dex`), layouts `dynamic_page_fragment_transparent_toolbar.xml`, `dynamic_page_blurred_artwork.xml`.

---

## 4. Mini-Player & Full-Screen Now Playing Player

### 4.1 Compose Mini-Player (`classes14.dex` & `classes7.dex`)
- **ViewModel:** `Lcom/tidal/android/feature/appscaffold/ui/MiniPlayerViewModel;` (`classes14.dex`)
- **Composables:** `Lcom/tidal/android/feature/appscaffold/ui/composable/MiniPlayerKt;` (`classes14.dex`):
  - `a(MiniPlayerContract$ItemType, I, String, Modifier, Composer, I)V`
  - `b(Lhob;, Composer, I)V`
  - `c(Liob;, Lbn7;, Composer, I)V`
- **State Contracts (`classes7.dex`):** `MiniPlayerContract$ItemType` (`Track`, ...), `MiniPlayerContract$PlayState` (`Buffering`, ...).

### 4.2 Compose Full-Screen Player (`com/tidal/android/feature/playerscreen/*`, `classes14.dex`)
- `PlayerScreenKt` (`methods a, b, c`) & `PlayerViewModel`
- `CoverPagerKt` — album art swipe pager
- `SeekbarAndTimeKt` — progress bar, time labels, seek interactions
- `LyricsKt` — synced lyrics panel
- `BroadcastButtonKt` — DJ / live broadcast toggle
- `BouncePressKt` (`a(Modifier)->Modifier`) — press scale animation
- `composables/d` — play/pause/skip/repeat/shuffle transport controls (`d.h` takes `RepeatMode`)
- `composables/f` — player background rendering (`f.b(PlayerBackgroundStyle, J, I, String, Z, Z, Lzm7, Modifier, Composer, I)`)
- **Models (`classes14.dex` & `classes26.dex`):**
  - `AudioQualityTier`: `STANDARD`, `LOSSLESS`, `HI_RES`
  - `PlayerBackgroundStyle` / `AppearanceSettingsContract$PlayerBackgroundOption`: `DEFAULT`, `DARK_BLUR`, `FILLED_COLOR` (configured via `AppearanceSettingsFragment` & `AppearanceSettingsViewModel` in `classes26.dex`)
  - `ReactionType` (`FIRE`, etc.)

### 4.3 Legacy View NowPlaying (`com/aspiro/wamp/nowplaying/*`, `classes25.dex`)
- `NowPlayingView` (`FrameLayout`) & `NowPlayingFullScreen` (`ConstraintLayout`)
- `ItemTouchHelperCallbackImpl` (`com/aspiro/wamp/nowplaying/view/playqueue/touchmanagement/`, drag/swipe in play queue — keep excluded from Track Swipe!)
- Widgets (`com/aspiro/wamp/nowplaying/widgets/`): `PlayButton`, `NextButton`, `PreviousButton`, `RepeatButton`, `ShuffleButton`, `SeekBackButton`, `SeekForwardButton`, `SeekBarAndTimeView`, `StreamingQualityButton`, `FavoriteMediaItemButton`, `MediaItemOptionsButton`, `BroadcastButton`, `AudioOnlyView`, `SecondaryProgressView`, `FadingEdgeRecyclerView` (`classes26.dex`).
- Layouts: `now_playing_view.xml`, `now_playing_layout.xml`, `now_playing_fullscreen.xml`, `now_playing_full_screen_layout.xml`, `now_playing_controls.xml`, `now_playing_seek.xml`, `now_playing_track.xml`, `now_playing_video.xml`, `dialog_lyrics.xml`, `dialog_play_queue.xml`.

---

## 5. Screens, Track Rows, Context Menus & Core Actions

### 5.1 Track Row Binders (RecyclerView + Compose)
All 6 RecyclerView track row binders (already hooked in [TrackSwipeGesturesPatch.kt](../patches/src/main/kotlin/dev/materialtidal/patches/tidal/gestures/trackswipe/TrackSwipeGesturesPatch.kt)) plus Compose track cells:

| Surface | Class / Method | DEX | Item / Parameter Type |
| :--- | :--- | :--- | :--- |
| Favorites / Downloads / Mixes / TrackCollectionView | `Lg4b;->c(MediaItem)V` | `c24` | `MediaItem` (`Track` subtype) |
| Playlist Tracks | `Lj9e;->c(Object, ViewHolder)V` | `c25` | `TrackViewModel` (`getTrack()`) |
| Playlist Suggested Tracks | `Louh;->c(Object, ViewHolder)V` | `c25` | `SuggestedTrackViewModel` (`getTrack()`) |
| Unified Search Tracks | `Lh6j;->c(Object, ViewHolder)V` | `c26` | `Lbqi;` (`a: Track`) |
| Album Page Tracks | `Ltt;->c(Object, ViewHolder)V` | `c24` | `albumitemcollection/a$a` (mapped in `b.l`) |
| DynamicPages TrackCollection | `Lr3b;->c(Object, ViewHolder)V` | `c24` | `Lzmi;`/`Lk0c;` (mapped in `Ldni;.o`, cloned in `Logf;.invoke`) |
| Compose Dynamic Track List | `TrackListModuleRowKt;->a(...)` | `c5` | Compose vertical track list module |
| Wave2 Cover List Cell | `WaveCoverCells`, `CoverCellLeadingOptions`, `CoverCellTrailingOptions` | `c25` | Wave2 media row & swipe/action slots |

### 5.2 Verified Domain Actions & DI Singletons
- **Global DI (`classes23.dex`):** `Lhba;` (initialized inside `App`, constructs `Loi$a;`, `Lzod$a;`, `Ltqd$a;`, `Ldfj;`).
- **Play Queue:**
  - `Lii;` (`classes23.dex`) -> `Loi;` (`a: Ltqd;`, `b: Lchi;`, `c: AvailabilityInteractor`) <- provider `Loi$a;->invoke()`
  - `Ltqd;` (`classes25.dex`): `a(Source)V` (`addAsFirstInActives` = Play Next), `b(Source)Z` (`addAsLastInActives` = Add to Queue)
  - `ItemSource(String, String, ItemSource$NavigationType$None.INSTANCE, null)` + `Source->addSourceItem(MediaItem)V`
- **Favorites:**
  - `TrackFavoritesManager` (`classes.dex`, `h: Lchi;`, provider `Ldfj;.invoke()` in `classes23.dex`): `a(Track, ContextualMetadata, Source, NavigationInfo, Lbn7)V`
  - `Looi;` (`classes24.dex`): static `f(I)Z` (`isFavoriteTrack`), `c(Track)Lrx/Observable;` (`removeFavoriteTrack`)
  - `Lakf;` (`classes24.dex`): `<init>(Object, ContextualMetadata, NavigationInfo)` + `N()V` (headless favorite removal with EventBus optimistic update + toast)
- **Add to Playlist:**
  - `Lsh;` (`classes23.dex`) -> `MediaItemParent(MediaItem)` -> `Lx8l;.<init>(MediaItemParent)` -> `Lci;.<init>(Lwh, ContextualMetadata, ContentMetadata, Source)` (`classes25.dex`) -> `Lci;.b(NavigationInfo)V`
- **Toast/Snackbar Helper:** `Lchi;->f(I[Ljava/lang/Object;)V` (`classes.dex`).

### 5.3 Home, Dynamic Pages, My Collection, Search & Context Menus
- **Home (`c13`, `c7`):** `HomeScreenKt`, `HomeScreenViewModel`, `ShortcutListModuleKt` (`c7`), `ShortcutListModuleManager`.
- **Dynamic Pages (`c5`, `c13`, `c24`):**
  - `DynamicPageType`: `ALBUM`, `ARTIST`, `HOME`, `MIX`, `OTHER`, `PLAYLIST`, `PROFILE` (`c24`).
  - `ModuleType` (26 types, `c24`): `ALBUM_HEADER`, `ALBUM_ITEMS`, `ALBUM_LIST`, `ARTICLE_LIST`, `ARTIST_HEADER`, `ARTIST_LIST`, `CONTRIBUTOR_HEADER`, `FEATURED_PROMOTIONS`, `GENRE_HEADER`, `ITEM_LIST_WITH_ROLES`, `MIXED_TYPES_LIST`, `MIX_HEADER`, `MIX_LIST`, `MULTIPLE_TOP_PROMOTIONS`, `PAGE_LINKS`, `PAGE_LINKS_CLOUD`, `PAGE_LINKS_IMAGE`, `PLAYLIST_LIST`, `RADIO`, `SINGLE_TOP_PROMOTION`, `SOCIAL`, `STORE`, `TEXT_BLOCK`, `TICKETMASTER`, `TRACK_LIST`, `VIDEO_LIST`.
  - Compose Module Rows (`c5`, `c13`): `AnniversaryCardKt`, `ArtistListModuleRowKt`, `ArtistMemoriamCardKt`, `ArtistTrackCreditsModuleRowKt`, `CompactGridCardModuleRowKt`, `CoverCardCellKt`, `DiscographyTabsModuleRowKt`, `FeaturedCardModuleRowKt`, `GridCardModuleRowKt`, `GridHighlightCardModuleRowKt`, `HorizontalLazyRowKt`, `MerchModuleRowKt`, `MixCarouselListModuleRowKt`, `PromoLazyRowKt`, `PublicPlaylistListModuleRowKt`, `TextCardKt`, `VerticalListCardKt`, `TrackListModuleRowKt`.
- **My Collection & Playlists (`c25`):**
  - `MyCollectionScreenFragment`, `MyCollectionScreenKt`, `MyCollectionScreenViewModel`, `RecentActivityLazyRowKt`
  - Subpages: `FavoriteTracksFragment`, `MyPlaylistsView`, `MyAlbumsView`, `MyArtistsView`, `MyMixesAndRadioView`, `DownloadedFragment`
  - Playlists: `PlaylistFragment`, `PlaylistPresenter`, `PlaylistItemCollectionView`, `fragment_playlist.xml`, `playlist_header_layout.xml`, `edit_playlist.xml`
- **Search (`c16`, `c26`):**
  - `SearchScreenKt`, `SearchResultsModuleKt`, `SearchScreenViewModel` (`c16`)
  - `FilterItemType` (`c16`): `ALBUMS`, `ALL`, `ARTISTS`, `MERCH`, `PLAYLISTS`, `TOP_RESULTS`, `TRACKS`, `UPLOADS`, `VIDEOS`
- **Context Menus & Bottom Sheets (`c23`, `c26`):**
  - `TrackContextMenu`, `VideoContextMenu`, `SleepTimerContextMenu` (`c23`), headers `BottomSheet{Track,Album,Artist,Mix,Folder,Video,Playlist}Header`, layouts `bottom_sheet_context_menu_dialog.xml`, `context_menu_item.xml`.
- **Settings (`c21`, `c26`):**
  - `SettingsScreenKt`, `BaseSettingsComposeFragment`, `SettingsViewModel`, `AppearanceSettingsFragment` (`c26`), `SettingsItemType` (`c21`, 27 types incl. `DEBUG_OPTIONS`, `OFFLINE_MODE`, `IMMERSIVE_AUDIO`, `AUDIO_NORMALIZATION`, etc.).

---

## 6. Feature Flags Architecture & Catalog

### 6.1 Flag System (`com/tidal/android/featureflags/*`, `classes13.dex`)
- **Flag Interface:** `Lq17;` (`a()Ljava/lang/String;` = flag key, `getDefaultValue()Ljava/lang/Object;`).
- **Flag Model Classes (100 flag definitions extracted across 14 DEX files):**
  - `Lss1;` (`classes13.dex`): Boolean flag — `<init>(String ownerDescription, String key, boolean defaultValue)V` (`a: String`, `b: String`, `c: Z`)
  - `Lxt8;` (`classes13.dex`): Numeric / Int / Long flag
  - `Lj49;` (`classes23.dex`): Object / JSON flag
  - `Ldoh;` (`classes5.dex`): String flag
- **Evaluation & Override Client (`classes13.dex`):**
  - Interface `Ls17;`: `b(Lq17;)Lkotlinx/coroutines/flow/StateFlow;`, `d(Lq17;ContinuationImpl)Object`
  - `DefaultFeatureFlagsClient` & `OverridableFeatureFlagsClient` (reads `SharedPrefsOverrideStore` DataStore before falling back to `DefaultFeatureFlagsClient`).
- **Two Clean Ways to Patch Flags:**
  1. **Direct Flag Default Override:** In the flag holder class `<clinit>()`, flip `const/4 vX, 0x0` -> `0x1` (or `0x1` -> `0x0`) passed into `Lss1;-><init>(String, String, Z)V`.
  2. **Central Client Hook:** Intercept `Ls17;` / `OverridableFeatureFlagsClient` / `Lss1;->getDefaultValue()` and map `Lq17;->a()` keys to configurable Morphe patch options.

### 6.2 High-Value UI/UX & Feature Flags

| Flag Key | Holder Class | DEX | Default | Description / Patch Opportunity |
| :--- | :--- | :--- | :--- | :--- |
| `debug-menu` | `Lqs4;` | `c13` | `false` | Unlock built-in Compose Debug Menu (`DebugMenuActivity`) |
| `sleep-timer` | `Lh6h;` | `c14` | `false` | Show Sleep Timer in player menu |
| `mf-player-crossfade` | `Lmwd;` | `c26` | `false` | Enable Player Crossfade preference |
| `square-sans-font` | `Lmgh;` | `c23` | `false` | Switch typography to Square Sans font family |
| `home-page-pull-to-refresh` | `Lvze;` | `c13` | `false` | Enable pull-to-refresh gesture on Home |
| `homepage-3-0` | `Lmf8;` | `c23` | `false` | Toggle Homepage 3.0 layout |
| `jetpack-compose-dynamic-page` | `Lu29;` | `c` | `false` | Render Dynamic Pages in Jetpack Compose |
| `search_page_refactored` | `Lccg;` | `c` | `false` | Refactored Compose Search screen |
| `downloads-page-rewrite` | `Len5;` | `c` | `false` | Rewritten Downloads screen |
| `personalized-playlist-covers` | `Lz1e;` | `c` | `false` | Show custom playlist cover art |
| `playlist-covers-set-custom-image` | `Lbmg;` | `c` | `false` | Allow uploading custom playlist cover images |
| `collaborative-playlists` | `Lgx2;` | `c25` | `false` | Collaborative playlists UI |
| `playlist-collaborators-owner` | `Lhx2;` | `c25` | `false` | Collaborative playlists owner controls |
| `playlist-collaborators-show-in-collection` | `Lix2;` | `c25` | `false` | Show collaborator filter in My Collection |
| `save-for-later` | `Lrzf;` | `c23` | `false` | Save for Later collection (`SaveForLater` menu item) |
| `search-artist-radio` | `Lr8g;` | `c23` | `false` | Show mixes in search results |
| `public-profile-page-v2` | `Lpye;` | `c15` | `false` | Refreshed public profile page |
| `edit-profile-colors` | `Lt56;` | `c15` | `false` | Custom profile theme colors |
| `edit-profile-images` | `Ld66;` | `c15` | `false` | Custom profile images |
| `reactions` | `Lj6f;` | `c14` | `true` | Track emoji reactions in player (disable for cleaner player) |
| `enable-videos` | `Lme6;` | `c` | `true` | Enable Videos across app (disable for audio-only focus) |
| `ai-generated-playlist` | `Ltl;` | `c` | `false` | AI playlist generation entry |
| `ai-chatbox` | `Lgl;` | `c23` | `false` | AI chatbox UI |
| `creator-activity-feed` | `Lub4;` | `c23` | `false` | Activity Inbox & Feed v2 |
| `export-logs` | `Let6;` | `c13` | `false` | Export logs item in settings |
| `passkey-auth-enabled` | `Lxgd;` | `c23` | `false` | Passkey management in account settings |
| `immersive-audio-default` | `Ltn8;` | `c26` | `false` | Default value for immersive audio setting |
| `player-market-ui` | `Luwd;` | `c23` | `false` | Player Market UI variant |
| `android-player-float-output` | `Lle6;` | `c23` | `false` | Float audio output in player |
| `studio-home-page` | `Lmqh;` | `c7` | `false` | Studio Home page |
| `studio-home-tabs` | `Lcrh;` | `c7` | `false` | Reorder nav tabs for Studio Home |
| `mobile-use-datadog` | `Lrp4;` | `c23` | `false` | Datadog RUM/telemetry control |

---

## 7. Material 3 Expressive Patch Roadmap & Blueprints

1. **Track swipe gestures** *(Implemented in `v0.1.1`)*
   - Hooks all 6 `RecyclerView` track binders + 3 mappers (`TrackSwipeGesturesPatch`), attaching `TrackSwipeController` + `MaterialExpressiveSwipeRenderer` with dynamic Monet pill reveal and spring settle animation.
2. **Material You dynamic theme & Expressive shapes** *(Implemented & upgraded in `v0.2.0` — `MaterialYouThemePatch`)*
   - **Targets:** `ColorKt.Color(I/J)`, Square Market `Lwha;.e()/k()` (`MarketColor`) and `Lau1;.a` (`MarketStylesheet$b` border radii), Wave 2 `Lcxj;.<init>()` (`WaveCornerRadiuses`), Wave 1 `WaveRadius.<clinit>()`, and `MainActivity.onCreate` window/decor tinting.
   - **Effect:** Replaces static Wave 1/Wave 2/Market neutral surfaces and cyan/teal accents with a 38-token Android 12+ Monet tonal hierarchy (with `PaletteSnapshot` idempotency guard + algorithmic neutral/cyan classifier) and upgrades Wave 1/Wave 2/Market corners to M3 Expressive squircle/pill geometry (`monetPaletteStyle`, `expressiveShapes`, `amoledPureBlack` options).
2. **Material You dynamic theme & GPU progressive blur** *(Implemented in `v0.1.0`–`v0.2.0` — `MaterialYouThemePatch`)*
   - Provides Monet tonal palette engine ([MaterialYouColorEngine.java](../extensions/tidal/src/main/java/dev/materialtidal/extension/tidal/theme/MaterialYouColorEngine.java)), expressive shapes toggle, and the shared hardware GPU blur kit ([ExpressiveBlurKit.java](../extensions/tidal/src/main/java/dev/materialtidal/extension/tidal/theme/ExpressiveBlurKit.java), `expressiveGlassBlur`, `blurIntensity` = Subtle / Balanced / Rich, API 31+ `RenderNode` + `RenderEffect`).
3. **Material 3 Expressive navigation bar & floating mini-player** *(Implemented in `v0.2.0` — `ExpressiveNavbarPatch`)*
   - Replaces `TabBarKt.c` and `MiniPlayerKt.c` on `AppScaffold` with [ExpressiveNavbarView.java](../extensions/tidal/src/main/java/dev/materialtidal/extension/tidal/navbar/ExpressiveNavbarView.java) (split-pill dock + detached search button) and [ExpressiveMiniPlayerView.java](../extensions/tidal/src/main/java/dev/materialtidal/extension/tidal/navbar/ExpressiveMiniPlayerView.java) (floating stadium-pill card with elastic entrance, swipe-left-to-skip preview pill, and vertical pull-up-to-open gesture).
   - Unifies both bars via [ExpressiveDockGlass.java](../extensions/tidal/src/main/java/dev/materialtidal/extension/tidal/navbar/ExpressiveDockGlass.java) on an aligned `64dp` / `10dp`-grid stadium-pill geometry (normalizing Compose `MiniPlayer` horizontal padding from `9dp` to `8dp` inside `a;->b`), directional specular glass rims, off-main-thread cover-derived Mini-Player ambient glow & Play/Pause accent blend, coupled Navbar/Mini-Player spring physics (momentum kick, touch-drag tab scrubbing, velocity squash/stretch, crossfaded/animated icons, zero-flash cover crossfade, and directional track-change slide).
   - Replaces `Lqj0;.<clinit>()`'s flat vertical black gradient under `AppScaffold` with [ExpressiveProgressiveBlurOverlayView.java](../extensions/tidal/src/main/java/dev/materialtidal/extension/tidal/navbar/ExpressiveProgressiveBlurOverlayView.java) (`navbarProgressiveBlur`: 4-tier GPU progressive blur + frosted translucent glass pills with specular rim borders; auto-hides for full-screen player & AMOLED black).
4. **Material 3 Expressive full-screen player** *(Implemented in `v0.2.0` — `ExpressivePlayerPatch`)*
   - Enables `player-market-ui` and renders [ExpressivePlayerView.java](../extensions/tidal/src/main/java/dev/materialtidal/extension/tidal/player/ExpressivePlayerView.java) with heavily blurred album art backdrop, cover-derived + Monet palettes, connected M3 Expressive split pills, animated squiggly seekbar, morphing transport buttons, and synced lyrics overlay.
5. **Expressive Material 3 homepage** *(Implemented in `v0.2.0` — `ExpressiveHomePatch`)*
   - **Targets:** `Ll78;.<clinit>()` (grid carousel cover radius), `ShortcutListModuleKt.<clinit>/.a/.i` (66dp shortcut cards, 20dp outer / 14dp concentric artwork corners, elevated Monet tonal container), `Leoj;.a` (`VibeCell` filter chip pill & label tokens), `Lpi0;.b` (`AppBarWithActions` Monet surface/content tint), `Lvze;.<clinit>` + `a$d.<init>` (unlock `home-page-pull-to-refresh`), and early-hide declutter guards on `HeadlinersBanner` (`Lpb8;.a`), `PromoModuleRowKt.a`, and `MerchModuleRowKt.b`.
6. **Expressive Material 3 playlist screen** *(Implemented in `v0.2.0` — `ExpressivePlaylistPatch`)*
   - **Targets:** `PlaylistFragment` (`onViewCreated`, `onDestroyView`, `onCreateOptionsMenu`, `U`, `M`, `N`, `S`, `T`), `PlaylistPresenter` (`f`, `g`), `Lnii;.onOffsetChanged` (`PlaylistFragment$a`), `SecondaryActionButton.c`, `DownloadSecondaryActionButton` (`c`, `onDraw`, `setDownloadedPercentage`, `setDownloading`), and `Lj9e;.c` (playlist track row binder).
   - **Effect:** Replaces legacy XML playlist header layout with a full-bleed downward-fading & downward progressively blurred hero cover (`ExpressivePlaylistFadeOverlay` 3-tier artwork blur), cover-adaptive + Monet tonal palette (`playlistAccentMode`, `playlistHeroCoverFade`, `playlistTrackRowPolish`), tactile 52dp pill Play/Shuffle buttons, connected M3 Expressive secondary action tiles (removing legacy cyan radial glows), frosted-glass collapsing sticky toolbar (`ExpressiveToolbarBlurView` + specular `ToolbarScrimDrawable` rings), and clean 68dp rounded track rows with native active-track title highlighting preserved.
7. **Expressive Material 3 albums, artists & my tracks** *(Implemented in `v0.2.0` — `ExpressiveMediaPagesPatch`)*
   - **Targets:** `Ljs5;` (`DynamicPageFragment` base: `onViewCreated`, `onDestroyView`), `FadingToolbar` (`<init>`, `H(F)`), `Ltq;.c` (Album Header module delegate), `Lus0;.c` (Artist Header module delegate), `FavoriteTracksFragment` (`onViewCreated`, `onDestroyView`, `onCreateOptionsMenu`, `U`, `W`, `T`), `MyAlbumsView.onViewCreated`, and `MyArtistsView.onViewCreated`.
   - **Effect:** Extends the Material 3 Expressive design system via `ExpressiveMediaStyleKit` to Album and Artist dynamic pages (full-bleed fading + progressively blurred hero covers/portraits, cover-adaptive + Monet palettes, scroll parallax, frosted-glass `FadingToolbar` blur + scrim/reveal morphing, 52dp pill buttons, 62dp connected action tiles, contributor-role chip), My Tracks (52dp Monet pill Play/Shuffle buttons, 20dp rounded tonal Offline Download card with Monet `SwitchCompat` tinting, clean 68dp track rows with default active highlight preserved), and My Albums / My Artists list views (Monet surfaces, bold headers, safe square-only artwork rounding).
8. **Expressive Material 3 bottom sheets & menus** *(Implemented in `v0.2.0` — `ExpressiveSheetsAndMenusPatch`)*
   - **Targets:** `BottomSheetDialog.onStart`, `Ljr3;.onBindViewHolder` (`ContextMenuAdapter`), `ListPopupWindow.show`, `MenuAdapter.getView`, `AlertController.installContent`, Compose M3 `ModalBottomSheetKt.ModalBottomSheetContent-IQkwcL4`, `ModalBottomSheetDialogWrapper.<init>`, `SheetBottomTokens.<clinit>`, `MenuKt.DropdownMenuContent-Qj0Zi0g`, `MenuKt.<clinit>`, `MenuTokens.<clinit>`, `AlertDialogKt.AlertDialogContent-4hvqGtA`, and Compose UI `DialogWrapper.<init>`.
   - **Effect:** Styles all XML/Material `BottomSheetDialog`s (including `Lsr3;` Context Menus and `Lp92;` Broadcast/Connect sheets) and Compose `ModalBottomSheet`s with native SurfaceFlinger `22dp` backdrop blur + softer scrim, 28dp expressive top corners (`sheetCornerStyle`), `surfaceContainer` Monet canvas with 1dp `outlineVariant` shoulder border, pill drag handles (`40dp x 4.5dp`), elevated tonal artwork header cards, segmented grouped menu cards (`groupedContextMenuCards`) with circular icon badges and semantic selected/destructive/disabled states; upgrades AppCompat & Compose popup/overflow/dropdown menus to frosted GPU-blurred `22dp` floating `surfaceContainerHigh` shells (`FrostedPopupBackgroundDrawable`) with 14dp ripple rows (`expressivePopupMenus`); upgrades XML & Compose `AlertDialog`s with native `18dp` backdrop + `28dp` frosted window blur and 28dp Monet containers + pill buttons (`expressiveDialogs`).
9. **Expressive Material 3 search** *(Implemented in `v0.2.0` — `ExpressiveSearchPatch`)*
   - **Targets:** `TidalSearchView.<init>`, `Lis6;` (`dynamic_page_fragment_searchbar` Search/Explore Landing Page `onViewCreated` / `onDestroyView`), `UnifiedSearchView` (`unified_search` default active search `onViewCreated` / `onDestroyView`), `Lb8g;.e` (horizontal search filter adapter), `Ld6j;.c` (search suggestion/history delegate), plus refactored Compose Wave 2 Search (`Ln7g;.a`, `Ll7g;.invoke`, `Lh8g;.a`).
   - **Effect:** Transforms all three Search surfaces into cohesive Material 3 Expressive Monet UI: floating stadium-pill (`28dp`, or configurable `18dp` squircle) search bar with focus-animated `primaryAccent` ring & Monet cursor, circular `42dp` tonal back button & `30dp` clear button, frosted GPU-blurred sticky header backdrop (`SearchHeaderGlassView`, scrolling list content glides beneath the search bar & filter row while remaining 0fps `GONE` at rest), animated `38dp` full-pill filter chips, `38dp` circular suggestion/history badges with Monet-highlighted query matches, circular `76dp` empty/initial state badges, and Monet-harmonized diagonal-wash `20dp` Genre tiles, full-pill cloud tags, and `18dp` link cards (`expressiveSearchCards`, `expressiveSearchHeaderBlur`, `searchBarPillStyle`).
10. **Feature Flag Unlocker & Privacy/Telemetry Cleanup** *(Planned)*
   - **Targets:** `OverridableFeatureFlagsClient` / `Ls17;` (`c13`) + individual `Lss1;` holders.
   - **Effect:** Expose clean Morphe options for `sleep-timer`, `mf-player-crossfade`, `personalized-playlist-covers`, `save-for-later`, `square-sans-font`, `debug-menu`, and disabling `mobile-use-datadog`.

---

## 8. Engineering Rules & Verified Pitfalls (`tidal` 2.220.1)

1. **JDK Requirement:** Always set `JAVA_HOME = C:\Program Files\Android\Android Studio\jbr` (OpenJDK 25) when invoking Gradle (`gradlew.bat`); default Zulu 11 JRE lacks `javac`.
2. **Pure `.mpe` Extensions:** Keep AndroidX/Compose dependencies in [extensions/tidal/build.gradle.kts](../extensions/tidal/build.gradle.kts) as `compileOnly` and preserve [proguard-rules.pro](../extensions/proguard-rules.pro) so `tidal.mpe` contains strictly `dev.materialtidal.*` classes (zero duplicate AndroidX/Kotlin classes).
3. **RecyclerView Layout Safety:** `androidx.recyclerview.widget.RecyclerView.addItemDecoration(...)` (`classes23.dex`) asserts `!isComputingLayout()`. Never invoke it synchronously inside `onBindViewHolder` or `OnAttachStateChangeListener.onViewAttachedToWindow`; always guard with `isComputingLayout()` and defer via `recyclerView.post(...)` + touch fallback (as fixed in `v0.1.1`).
4. **Morphe `Fingerprint` Package Prefix Rule:** `StringComparisonType` in `Fingerprint(definingClass = ...)` treats a leading `:` as literal `CONTAINS`; always use `"Lcom/..."` (`STARTS_WITH`).
5. **Track vs Video Disambiguation:** Many action handlers (`Lii;` vs `Lji;`, `Lsh;` vs Video playlist action) share identical signatures; differentiate via `custom = { _, classDef -> classDef.fields.any { it.type == "Lcom/aspiro/wamp/model/Track;" } }`.
6. **Mandatory Verification Pipeline:** After any patch or extension change, run `./gradlew clean packageZip`, `./gradlew :patches:verifyLinnProtocol`, and `./gradlew :patches:verifyPatchTidal` (`validate = true` against a local `tidal.apkm`), inspect bytecode with `dexdump.exe -d`, and confirm ZIP contents before releasing.
7. **Automated GitHub Releases:** Tagging `v<version>` (or manually triggering `.github/workflows/release.yml`) automatically builds `MaterialTidal-patches-<version>.mpp`, runs `:patches:verifyLinnProtocol`, publishes the GitHub Release with `SHA256SUMS.txt` and release notes, and updates `patches-bundle.json` on `main`.
