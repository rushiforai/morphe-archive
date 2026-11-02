## [0.30.46](https://github.com/Forsigh/waze-patches/compare/v0.30.45...v0.30.46) (2026-11-01)

### Fixed

* **Change Waze icon** now follows the icon Waze actually ships: the beta renamed it, so the new artwork landed in a file the launcher never reads
* **Unlock driver moods** on Waze is anchored by the calls it makes, so it binds on both the beta and the older builds again

## [0.30.45](https://github.com/Forsigh/waze-patches/releases/compare/v0.30.44...v0.30.45) (2026-11-01)

### New

* Waze **5.26.90.901** support: all 33 rows apply to the new beta

### Fixed

* Waze moved four anchors in 5.26.90.901 - **Hide recent destinations**, **Skip sign-in**, **Unlock driver moods** and **Disable Play Store updates** were re-homed and verified again

## [0.30.44](https://github.com/Forsigh/waze-patches/compare/v0.30.43...v0.30.44) (2026-10-30)

### New

* **Launch screen background colour**: pick a preset (AMOLED black, Waze blue, green, transparent) or your own colour for the screen behind the Waze logo
* **Hide recent destinations**: keeps the places you drove to out of Waze's recent lists on the phone and in the car
* **Hide launch logo**: option on **Change Waze icon** that removes the ghost from the launch screen

### Changed

* Waze patches are now grouped into **UI Customization**, **Map & Alerts**, **Driving & Voice**, **Privacy & Updates**, **Android Auto** and **Experimental**

## [0.30.43](https://github.com/Forsigh/waze-patches/compare/v0.30.42...v0.30.43) (2026-10-29)

### New

* **Change Waze icon**: use the Forsigh Reaper, the stock ghost in any colour, or your own square image (PNG/JPG/WebP, 432x432 recommended)
* **Rename app**: changes the Waze name under the icon only; the package stays `com.waze`

## [0.30.42](https://github.com/Forsigh/waze-patches/compare/v0.30.41...v0.30.42) (2026-10-27)

### Fixes

* Removed **Car screen fits its window**: the row sized the car screen from the app window instead of the map pane, so the map centred on the whole display and got cropped at the media panel. Waze's stock sizing was already right.

## [0.30.41](https://github.com/Forsigh/waze-patches/compare/v0.30.4...v0.30.41) (2026-10-25)

### Android Auto

* **No Android Auto telemetry**: stops Waze sending Android Auto screen-switch timings to its analytics

## [0.30.4](https://github.com/Forsigh/waze-patches/compare/v0.30.3...v0.30.4) (2026-10-24)

### 🐛 Bug Fixes

* created_at without a timezone, the Manager cannot parse the Z suffix ([27e9533](https://github.com/Forsigh/waze-patches/commit/27e95337f130af0d42ccc4178a44e87fa2d810e3))

## [0.30.3](https://github.com/Forsigh/waze-patches/compare/v0.23.0...v0.30.3) (2026-10-23)

### Themes

* Waze: four brighter AMOLED themes - Lilac, Mint, Ice and Peach - so roads stay readable on a black map

### Changes

* Waze: the audio partner row is Morphe YouTube Music only again, the shape that works end to end
* Waze: the Picture-in-picture row now says its two known issues in the description - no touch on the floating window, and the UI does not scale down
* Waze: alert distance options state which value is standard, next to the number


## [0.29.1](https://github.com/Forsigh/waze-patches/compare/v0.29.0...v0.29.1) (2026-10-23)

### 📝 Documentation

* Waze: the Picture-in-picture row now states its two known issues in the description - no touch on the floating window, and the UI does not scale down

## [0.29.0](https://github.com/Forsigh/waze-patches/compare/v0.28.9...v0.29.0) (2026-10-23)

### ✨ Features

* Waze: the audio-partner row is renamed "Additional players as audio partners", since it now covers BitChord and Smart AudioBook Player as well as Morphe Music

## [0.28.9](https://github.com/Forsigh/waze-patches/compare/v0.28.8...v0.28.9) (2026-10-23)

### ✨ Features

* Waze: the audio-partner row also wires BitChord and Smart AudioBook Player, each behind its own gear, and opens Waze's availability check so installed players are not rejected

## [0.28.8](https://github.com/Forsigh/waze-patches/compare/v0.28.7...v0.28.8) (2026-10-23)

### 🐛 Fixes

* Waze: the lock-screen hooks are gone again. "Screen locked" on a floating Waze window is the phone's own lock screen, not Waze, so the toggle now only floats the map and routes its touches

## [0.28.7](https://github.com/Forsigh/waze-patches/compare/v0.28.6...v0.28.7) (2026-10-22)

### 🐛 Fixes

* Waze: the navigation lock is now switched off in all three places Waze stores it, not just one - the PiP window should stop reporting "Screen is locked"

## [0.28.6](https://github.com/Forsigh/waze-patches/compare/v0.28.5...v0.28.6) (2026-10-22)

### ⚠️ Experimental

* Waze: Picture-in-picture now switches the navigation lock screen off, so the floating map answers pan and zoom instead of sitting behind the "Screen is locked" state

## [0.28.5](https://github.com/Forsigh/waze-patches/compare/v0.28.4...v0.28.5) (2026-10-22)

### 📝 Documentation

* Waze: every alert-distance field now states the distance it leaves in place, so 0 is not a mystery number

## [0.28.4](https://github.com/Forsigh/waze-patches/compare/v0.28.3...v0.28.4) (2026-10-22)

### ⚠️ Experimental

* Waze: while floating, touch events are routed straight to the map view instead of the HUD - test build, the map should answer pan and zoom in the PiP window

## [0.28.3](https://github.com/Forsigh/waze-patches/compare/v0.28.2...v0.28.3) (2026-10-22)

### ♻️ Refactors

* Waze: Picture-in-picture always floats now and carries no options - the route-gated mode never fired on the phone

## [0.28.2](https://github.com/Forsigh/waze-patches/compare/v0.28.1...v0.28.2) (2026-10-22)

### ✨ New Features

* Waze: brought back Picture-in-picture as an Experimental row, marked with the known issue that Waze's UI does not scale down inside the floating window

## [0.28.1](https://github.com/Forsigh/waze-patches/compare/v0.28.0...v0.28.1) (2026-10-22)

### 🐛 Fixes

* Waze: Speedometer & limit sign now writes its config on its own, and both size menus open on 1.0x instead of an unlisted value

## [0.28.0](https://github.com/Forsigh/waze-patches/compare/v0.24.6...v0.28.0) (2026-10-22)

### ✨ New Features

* Waze: added Live drive sharing, extra map info (compass and toll prices), crosswalk hazards and a speed-bump switch in Alert distances

### ♻️ Refactors

* Waze: merged the speed limit, speedometer, camera and cluster rows into single rows with gear switches, 35 rows down to 28

## [0.24.6](https://github.com/Forsigh/waze-patches/compare/v0.24.5...v0.24.6) (2026-10-22)

### 🗑️ Removals

* Waze: dropped the floating window (picture-in-picture) row; Waze's UI cannot be scaled inside the PiP window

## [0.24.5](https://github.com/Forsigh/waze-patches/compare/v0.24.4...v0.24.5) (2026-10-21)

### ✨ New Features

* Waze: "Scaled down UI" rescales DisplayMetrics itself and pushes the change into the view tree, which Compose honours

## [0.24.4](https://github.com/Forsigh/waze-patches/compare/v0.24.3...v0.24.4) (2026-10-21)

### 🐛 Bug Fixes

* Waze: removed the density scaling that crashed Waze on startup (AppCompat declares attachBaseContext final)

## [0.24.3](https://github.com/Forsigh/waze-patches/compare/v0.24.2...v0.24.3) (2026-10-21)

### 🐛 Bug Fixes

* Waze: "Scaled down UI" now rebuilds the screen with a smaller density context, which actually reaches Compose

## [0.24.2](https://github.com/Forsigh/waze-patches/compare/v0.24.1...v0.24.2) (2026-10-21)

### ✨ New Features

* Waze: "Scaled down UI" halves the display density while floating, so Waze's panels fit the small window

## [0.24.1](https://github.com/Forsigh/waze-patches/compare/v0.24.0...v0.24.1) (2026-10-21)

### ✨ New Features

* Waze: "Just the map" now covers the panels with a black layer under the map instead of hiding views

## [0.24.0](https://github.com/Forsigh/waze-patches/compare/v0.23.9...v0.24.0) (2026-10-21)

### 🧹 Chores

* Waze: floating window is portrait only again, the wide option is gone

## [0.23.9](https://github.com/Forsigh/waze-patches/compare/v0.23.8...v0.23.9) (2026-10-21)

### ✨ New Features

* Waze: "Just the map" option hides everything around the map view while the window is floating

## [0.23.8](https://github.com/Forsigh/waze-patches/compare/v0.23.7...v0.23.8) (2026-10-21)

### 🐛 Bug Fixes

* Waze: removed the location read that broke GPS when entering the floating window

## [0.23.7](https://github.com/Forsigh/waze-patches/compare/v0.23.6...v0.23.7) (2026-10-21)

### ✨ New Features

* Waze: floating window shape - Wide uses Waze's landscape driving layout, which is mostly map

## [0.23.6](https://github.com/Forsigh/waze-patches/compare/v0.23.5...v0.23.6) (2026-10-21)

### 🐛 Bug Fixes

* Waze: "only while driving" now also floats when the phone is moving, so a route no longer needs Waze's native flag to read true

## [0.23.5](https://github.com/Forsigh/waze-patches/compare/v0.23.4...v0.23.5) (2026-10-21)

### 🐛 Bug Fixes

* Waze: floating window no longer blanks the app. The UI-hiding experiment is out until it can be done safely

## [0.23.4](https://github.com/Forsigh/waze-patches/compare/v0.23.3...v0.23.4) (2026-10-21)

### ✨ New Features

* Waze: custom alert distances are their own row, so the numbers only appear when you pick it

### 🐛 Bug Fixes

* Waze: picture-in-picture primes from three activities, covering phones where the map screen differs

## [0.23.3](https://github.com/Forsigh/waze-patches/compare/v0.23.2...v0.23.3) (2026-10-21)

### 🐛 Bug Fixes

* Waze: picture-in-picture now primes from the map activity, so it floats while navigating

## [0.23.2](https://github.com/Forsigh/waze-patches/compare/v0.23.1...v0.23.2) (2026-10-21)

### 🐛 Bug Fixes

* Waze: car screen row no longer produces a broken method on the car display
* Waze: new alert icons resolves its config id at runtime instead of a baked number

## [0.23.1](https://github.com/Forsigh/waze-patches/compare/v0.23.0...v0.23.1) (2026-10-21)

### ✨ New Features

* Waze: picture-in-picture while navigating, portrait window, route or always
* Waze: every camera type, including phone and lane cameras
* Waze: car trip text and large cluster view
* Waze: car screen fits its window, car map zoom, new alert icons

## [0.23.0](https://github.com/Forsigh/waze-patches/compare/v0.22.9...v0.23.0) (2026-10-20)

### ✨ New Features

* one Keep Waze alive row, Waze 5.26.0.0 support ([0d2c121](https://github.com/Forsigh/waze-patches/commit/0d2c121d2f8ea2b6036a73a1463c223dbda8005b))

## [0.23.0](https://github.com/Forsigh/waze-patches/compare/v0.22.9...v0.23.0) (2026-10-20)

### ✨ New Features

* one **Keep Waze alive** row, Waze 5.26.0.0 support

## [0.22.9](https://github.com/Forsigh/waze-patches/compare/v0.22.8...v0.22.9) (2026-10-20)

### 🐛 Bug Fixes

* speed-limit sign always, speedometer first-session gate, add size row ([1d35276](https://github.com/Forsigh/waze-patches/commit/1d352762253b34c8e474f0e93bf04b0af8d9ac6a))

## [0.22.8](https://github.com/Forsigh/waze-patches/compare/v0.22.7...v0.22.8) (2026-10-16)

### 🚀 Updated App Support

* Android Auto tuning rows - smoother car map, FPS counter, car theme ([3d00b69](https://github.com/Forsigh/waze-patches/commit/3d00b69c4de40289145a25ce593d17706a91952a))
* borrowed rows - speed-limit sign, no-AI, no-Assistant, report speed limit, stay awake, AA heads-up; ads/enforcement/alert-distance upgrades (bearinmindcat ports, our way) ([e188201](https://github.com/Forsigh/waze-patches/commit/e18820145c93941fa7943637328d66805f847417))
* car feature rows - instrument cluster, traffic meter, car alerts, keep-alive ([34e1760](https://github.com/Forsigh/waze-patches/commit/34e17609ba014f7bdddf538f10711417567bbdf7))
* group the Android Auto rows under their own Morphe category ([efac7ec](https://github.com/Forsigh/waze-patches/commit/efac7ec23dbf41e77c07d6872f811cc4134cb66e))
* move the experimental rows (FPS counter, stay awake, keep alive, instrument cluster, AA heads-up) into their own Morphe 'Experimental' category ([a259705](https://github.com/Forsigh/waze-patches/commit/a259705b1e4aa940126fda7c3a0db967f6e39a70))
* remove the Car screen follows the phone theme and Android Auto heads-up distances rows (28 patches) ([c100978](https://github.com/Forsigh/waze-patches/commit/c1009785fde5ddf01632db5bb22d06b2bfc35670))
* remove the No AI reporting and No Google Assistant rows (30 patches) ([a9c6a23](https://github.com/Forsigh/waze-patches/commit/a9c6a23c3553923867d73c1098ab4e08c4ab1d1c))
* rename 'UI AMOLED dark mode' to 'AMOLED Dark Mode For UI' ([81ef420](https://github.com/Forsigh/waze-patches/commit/81ef4204cb6ac2c2ad97756da5936ae105f2f78e))
* support Waze 5.25.90.900 beta - multi-version anchors (welcome g/v, privacy g/p, consents bi/b + ba/a, age factory b/l, mood gates t()/r()/p(), theme extractor g.h, config delegate o/aq) ([cb0c95a](https://github.com/Forsigh/waze-patches/commit/cb0c95a44026db1e92562b1a40e269b94c69f489))

## [0.22.7](https://github.com/Forsigh/waze-patches/compare/v0.22.6...v0.22.7) (2026-10-15)

### ♻️ Changed

* **UI AMOLED dark mode** now really blacks out Waze's built-in panels, and the "Where to?" search bar goes pure black with white icons and text

## [0.22.6](https://github.com/Forsigh/waze-patches/compare/v0.22.5...v0.22.6) (2026-10-14)

### ✨ New patches

* **Skip sign-in** boots Waze straight into the map as a guest
* **UI AMOLED dark mode** turns Waze's dark-mode backgrounds true black - bottom sheets, menus and dialogs; light mode stays as it is
* **Theme** picks the look of the Waze map for day and for night from one menu - the AMOLED family (AMOLED Pop has brighter roads), the Dark family and the light themes; map text follows the theme so it stays readable
* **Extended police & hazard alert distances** warns earlier in Waze, with a level picker: Stock (default), Moderate or Maximum

## [0.22.5](https://github.com/Forsigh/waze-patches/compare/v0.22.4...v0.22.5) (2026-10-13)

### 🗑️ Removed

* **AMOLED dark mode** is removed. On-device testing once more showed the app failing at startup
  with the row ticked - a loading screen, then an error, then exit - so the skin-value rewrite is
  retired for good: the night skins ship exactly as Waze builds them, and nothing overrides them at
  patch time

## [0.22.4](https://github.com/Forsigh/waze-patches/compare/v0.22.2...v0.22.4) (2026-10-13)

### 🗑️ Removed

* **Map theme** and **OLED dark mode** are removed. Both rewrote Waze's map skin inside the APK; on-device
  testing showed the app breaking with them - the OLED black swallowed the map contents and the theme
  selector broke the map - so the full skin-rewrite approach is retired with them. The skin files ship
  stock again, and the versionCode refresh now waits for the mood artwork *and* the AMOLED row below -
  a minimal, night-only rebuild of the same idea, informed by the first attempt's post-mortem

### ✨ New patch

* **Morphe YouTube Music as a Waze audio partner** replaces "Add your own media apps as Waze audio
  partners": a direct port of Loupric/morphe-waze-music-patch (GPLv3, release v1.0.2, credited in the
  README and the source). The package is declared in Waze's manifest `<queries>` - without it Android's
  package visibility hides it from Waze entirely - and inserted into `SdkConfiguration.appConfigs` when
  `updateAppList` rebuilds the roster: upstream's `containsKey`-guarded block right after the scope save,
  built with the five-argument `au` constructor and feature bits `0x200001`
* the custom machinery is retired rather than kept alongside: the `partners` / `alsoAllowPackage` /
  `mediaBrowserAction` / `allowAllPackages` options, the `au.g` availability override and the audio-SDK
  config forcing are all gone. On-device testing under the previous build did not produce a working
  partner, and upstream's exact pair is what its own users run
* the row is on by default, exactly as upstream lists it
* **AMOLED dark mode** (opt-in, off by default) - the second, informed attempt at the AMOLED night map:
  night skin files only, the canvas becomes true black (`#000000`) and the nine road families are lifted
  15% toward white (the first attempt used 10%) so they keep their contrast against it. Day mode, labels,
  traffic and route colours stay stock, and the day files are asserted byte-identical. Two measured facts
  from the first attempt's post-mortem shape it: `map_background` is also the render tree's "eraser"
  colour (referenced ~20 times as feature strokes), so the black cascades by design to match the canvas,
  and the higher lift compensates the dark-on-dark night palette. Applied at patch time; nothing injected
* **Disable Play Store updates** (opt-in, off by default) - a port of Morphe's universal patch of the same
  name (`MorpheApp/morphe-patches`, GPLv3, credited): the manifest version code is locked above Play's
  2,100,000,000 ceiling, so the store always sees the installed copy as newer and never offers or applies
  an update. Two deliberate Waze adaptations: the locked value is `2,100,000,000 + minutes since 2026`
  rather than a frozen maximum, because Waze re-extracts its skins only when the versionCode *changes* -
  frozen, it would silently freeze every future skin edit; and instead of upstream's rewrite-everything
  preserve, only Waze's own package-version accessor (`com.waze.utils.n.a`, the push module's source) is
  made to report the pre-lock code, while the two extraction gates keep seeing the change. The manifest
  write runs in the resource half's `finalize`, so the lock is the last word on the number regardless of
  selection order
* the descriptions Morphe and the README show for every patch got a plain-language pass, and the credits
  section now lists only sources whose work actually ships in the bundle

## [0.27.0](https://github.com/Forsigh/waze-patches/compare/v0.26.0...v0.27.0) (2026-10-13)

### ✨ New Features

* support Waze 5.25.4.900 alongside 5.25.0.1 ([05d3b68](https://github.com/Forsigh/waze-patches/commit/05d3b68ab5fb7423aa98426b43e52029d8a8e257))

## [0.26.0](https://github.com/Forsigh/waze-patches/compare/v0.25.0...v0.26.0) (2026-10-13)

### ✨ New patch

* **OLED dark mode** (opt-in): the night map's background becomes true black (#000000) for OLED screens and
  the road palette is lifted one Waze lighten step (+10% toward white per channel, matching the
  `color.lighten(0.1, ...)` calls Waze itself uses inside the same file), so the roads stay readable
  against it. Day mode, labels, traffic and route colours are untouched
* measured on 5.25.0.1: the night map is described by `assets/res/skins/default/skin_values.night.lua` (with
  `editor.` and `experiment/` siblings). The canvas colour is `Palette.map_background`, and each road type
  is a `Palette` entry the renderer reads back through `color.lighten`/`color.darken`
* applied at patch time with no injected code and no runtime switch. `SkinRefreshPatch` (the versionCode
  refresh) is pulled in as a dependency, because an already-run Waze would otherwise keep drawing its
  extracted skins
* if **Map theme** is also selected, this patch steps aside for it: the theme rewrites the same entries, so
  the OLED patch detects the theme's marker and leaves those files alone
* verified by applying the patch alone to the stock base and reading the skin Lua back: all four night files
  carry `map_background = rgb(0x000000)` and the nine road entries are lifted (e.g. `street`
  `0x3F5871 -> 0x52697F`); every day file stays byte-for-byte stock. The versionCode rises 1030736 -> 1030756

## [0.25.0](https://github.com/Forsigh/waze-patches/compare/v0.24.0...v0.25.0) (2026-10-12)

### ✨ Media partners without the Waze SDK

* **Add your own media apps as Waze audio partners** now opens Waze's availability check, which was the
  gate keeping ordinary players out. Measured on 5.25.0.1: `com/waze/sdk/au;->g(Context)` accepts two kinds
  of partner - Spotify (an install check) and everyone else (a broadcast receiver for
  `com.waze.sdk.audio.ACTION_INIT` must resolve). An ordinary player like Smart Audiobook Player has no such
  receiver, so it was listed but never available. One instruction now sends every partner down the
  install-check path; the branch itself is untouched, and an uninstalled package still reads as unavailable
* Waze already ships the door such apps need: `com/waze/sdk/a/j` resolves a package's
  `android.media.browse.MediaBrowserService` and builds `com/waze/sdk/a/i`, the generic media-browser client
  (`MediaMetadataCompat`, playback state, queue, session tokens) that the Spotify client `a/k` itself
  extends. Nothing else had to be invented
* verified by applying the media row alone to the stock base and reading `au.g` back from the emitted
  smali: the Spotify comparison is followed by `const/4 v1, 0x1` instead of `move-result v1`, the `if-eqz`
  branch and the instruction count are unchanged
* runtime is unverified until a patched build runs on a device: this patch removes Waze's refusal, it cannot
  make a player answer the media-browser handshake

## [0.24.0](https://github.com/Forsigh/waze-patches/compare/v0.23.0...v0.24.0) (2026-10-11)

### ✨ New patch

* **Unlock driver moods** opens the three gates Waze puts in front of its mood picker, all measured on
  5.25.0.1 in `com/waze/MoodManager`: `canSetMood(Context, String)` - which accepts a single mood name and
  reads `CONFIG_VALUE_MOODS_BETA_ENABLED` *inside itself* - now returns true, `isBaby()` returns false so the
  mood screen stops hiding moods from new-driver accounts, and both native catalogue calls in
  `refreshMoodsList()` now ask for the unfiltered list (`v1 = 1`), matching upstream's reading that the first
  flag includes special/hidden entries and the second controls sorting
* it unlocks what is already in the app and nothing more: no editor permissions, no campaign downloads, and no
  invented artwork - a mood whose images Waze has never fetched renders blank. Depends on the versionCode
  refresh (`SkinRefreshPatch`), because mood images ship with the skin assets and an already-run Waze would
  otherwise keep drawing its extracted copies
* ported from aaayd/waze-custom-patches (GPLv3, `DriverIconsPatch.kt`), re-anchored: their finder keyed on
  three mood-name strings that this build does not carry in that method
* verified by applying it alone to the stock base and reading the emitted smali: `canSetMood` begins
  `const/4 v0, 0x1 / return v0`, `isBaby` begins `const/4 p0, 0x0 / return p0`, and both `…MoodListNTV(ZZ)`
  calls are preceded by `const/4 v1, 0x1`

## [0.23.0](https://github.com/Forsigh/waze-patches/compare/v0.22.2...v0.23.0) (2026-10-11)

### ✨ New patch

* **Map theme** (off by default) recolours Waze's own map skin with palettes sampled from Google Maps, or an
  OLED-black palette applied to both modes. It rewrites the compiled skin descriptions shipped in the APK and
  raises the app's versionCode, because Waze draws skins it has already extracted and only re-extracts them
  when versionCode increases - without that bump the theme is invisible on any device that has run Waze.
  Applied at patch time: no injected code, nothing rendered at runtime, and changing the theme is a re-patch
* reverse-engineered from `aaayd/waze-custom-patches` (GPLv3, credited in the README and in the source): a
  theme is a substitution over the skin's `Palette` table plus explicit `Colors.<Group>.<key>` overrides read
  by the renderer afterwards. Their versionCode refresh is kept as-is - fixed target `1030752`, advanced in
  steps of 20, never lowering the build's own number - so re-patching *without* the patch also lands above the
  previous build and Waze restores the stock skin
* verified on the stock 5.25.0.1 base: all 8 skin descriptions rewritten (day, night, both editor schemas and
  each `experiment/` copy), palette entries replaced (`map_background` `rgb(0xFAFCFA)` to `rgb(0x1C2A40)`,
  `sea` `rgb(0x9EE4FF)` to `rgb(0x00102E)`), 194 renderer overrides appended, versionCode `1030736` to
  `1030756`, bundle still dex + assets with no extension module
* unknown entries in a future Waze skin are reported and skipped rather than silently half-themed; the four
  palette entries a map cannot do without (`map_background`, `labels`, `sea`, `parks`) and the versionCode
  itself fail the patch run instead

## [0.22.2](https://github.com/Forsigh/waze-patches/compare/v0.22.1...v0.22.2) (2026-10-11)

### ♻️ Changed

* the media feature is **one patch** instead of three. *Make Waze see all media apps* and *Config overrides* no longer appear in the list: they have no name, are pulled in as dependencies of *Add your own media apps as Waze audio partners*, and its three manifest options moved onto that row, keys unchanged. A patch cannot do both a manifest edit and bytecode injection - the patcher's `bytecodePatch`, `resourcePatch` and `rawResourcePatch` builders each carry one context - so they stay separate patches behind one visible row
* the config writer keeps working for every patch that records a key: verified that all thirteen recorders declare it as a dependency, and a single ticked feature patch still forces its keys

## [0.22.1](https://github.com/Forsigh/waze-patches/compare/v0.22.0...v0.22.1) (2026-10-11)

### 🐛 Bug Fixes

* **Add your own media apps as Waze audio partners** now injects into `SdkConfiguration.updateAppList`, immediately *before* the scope save, instead of at `getPartnerAudioApps`. `updateAppList` replaces `appConfigs` wholesale from the native-supplied roster, so an entry added anywhere else was wiped on the next refresh, and a package absent from the map when the scope is persisted had no scope for the SDK service to accept
* verified against the stock 5.25.0.1 smali rather than assumed: `updateAppList` rebuilds the map from `PackageNames`/`AppNames`/`Scopes`/`InstallationUrls`, and `savePackageScopesToSharedPref` writes `au.c` per package into `com.waze.sdk.scopes`, which `getCachedPackageScope` reads back
* the patch now fails the run if `updateAppList` no longer carries the scope-save call, instead of injecting into nothing

### 🙏 Credits

* technique informed by [Loupric/morphe-waze-music-patch](https://github.com/Loupric/morphe-waze-music-patch) (GPLv3). See `upstream-port/CREDITS.txt`

## [0.22.0](https://github.com/Forsigh/waze-patches/compare/v0.21.0...v0.22.0) (2026-10-11)

### 🐛 Bug Fixes

* **Config overrides** is now a dependency of every patch that records a config key, so a ticked patch can no longer collect a key that nothing writes. Unticking the writer used to make all of them silently do nothing
* **Add your own media apps as Waze audio partners** depends on the manifest fix and the writer, so selecting it alone produces a build where its entries are reachable
* **Allow high refresh rate** now fails the patch run when it cannot find its target, instead of logging zero sites and reporting success

### ✨ New Features

* audio-partner patch: add your own media apps as Waze audio partners (opt-in)
* manifest fix: make Waze see all media apps (opt-in)

## [0.21.0](https://github.com/Forsigh/waze-patches/compare/v0.20.2...v0.21.0) (2026-10-10)

### ✨ New Features

* replace Waze's YouTube Music entry at the source, add high refresh rate ([f5c4bda](https://github.com/Forsigh/waze-patches/commit/f5c4bda47fad5e9cdd24c0c50bb70b2f7b45be9a))

## [0.20.2](https://github.com/Forsigh/waze-patches/compare/v0.20.1...v0.20.2) (2026-10-09)

### 🐛 Bug Fixes

* call the audio partner Morphe YouTube Music, not "patched" ([f53d457](https://github.com/Forsigh/waze-patches/commit/f53d457b0de36e61e065cae8a923da335c56a270))

## [0.20.1](https://github.com/Forsigh/waze-patches/compare/v0.20.0...v0.20.1) (2026-10-09)

### 🐛 Bug Fixes

* pin the remote-source file to the 0.20.0 asset ([2af1447](https://github.com/Forsigh/waze-patches/commit/2af144717c330ac0651a3ff3d2bb757711b66562))

## [1.7.0](https://github.com/Forsigh/waze-patches/compare/v1.6.0...v1.7.0) (2026-10-09)

### ✨ New Features

* wire a patched YouTube Music into Waze's audio player ([126cc2e](https://github.com/Forsigh/waze-patches/commit/126cc2e0b82171bed7770c880ad45910df5ab3ee))

## [1.6.0](https://github.com/Forsigh/waze-patches/compare/v1.5.0...v1.6.0) (2026-10-08)

### ✨ New Features

* support Waze 5.25.0.1 alongside 5.24.90.901 ([fbb41a2](https://github.com/Forsigh/waze-patches/commit/fbb41a28e1005ec7d1ddd569981c828157060688))

## [1.5.0](https://github.com/Forsigh/waze-patches/compare/v1.4.0...v1.5.0) (2026-10-08)

### 🐛 Bug Fixes

* apply config overrides as one block per getter ([40a39f5](https://github.com/Forsigh/waze-patches/commit/40a39f536c6c0b63d3f60e4660643c1331623e64))

### ✨ New Features

* add the Forsigh Settings row to Waze's settings list ([2250284](https://github.com/Forsigh/waze-patches/commit/2250284f9403c1c14a731d33adc0e63ddfbada7d))
* restart-to-apply prompt in the extension ([d32019e](https://github.com/Forsigh/waze-patches/commit/d32019ead450149f711c468dbb030ca937fa8eee))

## [1.4.0](https://github.com/Forsigh/waze-patches/compare/v1.3.0...v1.4.0) (2026-10-07)

### ✨ New Features

* Forsigh Settings extension groundwork ([1614651](https://github.com/Forsigh/waze-patches/commit/16146515a8a2e3465ee0269413acfaa67595cd92))

## [1.3.0](https://github.com/Forsigh/waze-patches/compare/v1.2.2...v1.3.0) (2026-10-07)

### ✨ New Features

* auto zoom - pin CONFIG_VALUE_ROUTING_AUTO_ZOOM to no/yes/speed ([ca0cef6](https://github.com/Forsigh/waze-patches/commit/ca0cef62bf16198d398690f0427caa8ea7acbda1))

## [1.2.2](https://github.com/Forsigh/waze-patches/compare/v1.2.1...v1.2.2) (2026-10-07)

### 🐛 Bug Fixes

* declare the production target (5.24.90.901), not the beta MOD's versionName ([9784954](https://github.com/Forsigh/waze-patches/commit/9784954c2d3e261eb36b95314395be8c1efc9114))

## [1.2.1](https://github.com/Forsigh/waze-patches/compare/v1.2.0...v1.2.1) (2026-10-05)

### 🐛 Bug Fixes

* drop spoof install source patch (inert for Waze; AA visibility is install-time) ([a85a81e](https://github.com/Forsigh/waze-patches/commit/a85a81e03d90db9499d6a77e59ea6bfc04e9f71c))

## [1.2.0](https://github.com/Forsigh/waze-patches/compare/v1.1.1...v1.2.0) (2026-10-05)

### ✨ New Features

* add universal spoof install source patch ([c184c9e](https://github.com/Forsigh/waze-patches/commit/c184c9e13889ce4a01a322a3a4abca10b633abaa))

## [1.2.0](https://github.com/Forsigh/waze-patches/compare/v1.1.1...v1.2.0) (2026-10-05)

### ✨ New Features

* add universal spoof install source patch ([c184c9e](https://github.com/Forsigh/waze-patches/commit/c184c9e13889ce4a01a322a3a4abca10b633abaa))

## [1.1.1](https://github.com/Forsigh/waze-patches/compare/v1.1.0...v1.1.1) (2026-10-05)

### 🐛 Bug Fixes

* grant issues and pull-requests write so the semantic-release success step stops failing ([0cf3977](https://github.com/Forsigh/waze-patches/commit/0cf39777d2117a8e91478db94fa904054afe9ecf))

## [1.1.0](https://github.com/Forsigh/waze-patches/compare/v1.0.0...v1.1.0) (2026-10-05)

### ✨ New Features

* add 8 Waze config patches; fix Boolean vs Long getter typing ([6013230](https://github.com/Forsigh/waze-patches/commit/6013230bbfe1b12d509d8ca9263a84ecefaa4609))

## 1.0.0 (2026-10-05)

### 🐛 Bug Fixes

* mark gradlew executable so the Linux CI runner can invoke it ([bc0b9fe](https://github.com/Forsigh/waze-patches/commit/bc0b9fe51f49eff89f1f4fc6339af039b6fd4060))

### ✨ New Features

* initial Waze patches (remove ads, extended police/hazard alert distances) ([5027682](https://github.com/Forsigh/waze-patches/commit/5027682d2d750b1375625f41a18e6d3ddad2c9f7))
