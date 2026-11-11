# Sey Morphe patches

One Morphe bundle for **two Android TV apps**:

| App | Package | Supported version | Morphe tile colour |
| --- | --- | --- | --- |
| **KICK: Live Streaming** | `com.kick.mobile` | `1.9.0` (versionCode `208`) | green `#53FC18` |
| **Twitch (Android TV)** | `tv.twitch.android.app` | `13.0.0.2` (versionCode `1100000018`) | purple `#9146FF` |

The bundle is shown in Morphe Manager as **Sey Morphe Patches**. Add one source,
open either app, and Morphe Manager lists only the patches that belong to that
app. Every feature is a separate entry, and **SEYTTINGS** is the base dependency
for the feature patches of both apps.

**Source code:** <https://github.com/seythegamer/sey-morphe-patches>
**License:** GPLv3 (see [LICENSE](LICENSE))

## Patches

### KICK (Android TV)

| Patch | Type | What it does |
| --- | --- | --- |
| **SEYTTINGS** | base | Turns the licensing row in the KICK settings screen into a red **SEYTTINGS** row that opens a native patched-tweaks dialog. Required by every KICK feature. |
| **EMOTES** | feature | Shows 7TV, BTTV and FFZ emotes in the KICK chat. One shared toggle in SEYTTINGS enables all providers. |
| **CHAT SIZE** | feature | Resizes the chat in the VIDEO/CHAT view: default (100%), 125%, 90%, 85% and 80%. The video and chat panel always meet at the same edge. |
| **CHAT TEXT SIZE** | feature | Renders chat text larger, Twitch-style: 16 sp (default), 15 sp, 13 sp or stock 11 sp, and widens the gap between messages (10 dp) whenever the tweak is active. Choose the size in SEYTTINGS. |
| **EXPAND CHAT** | feature | Hides the **Join the Chat** footer in the VIDEO/CHAT view and lets the chat fill the freed space. Toggle in SEYTTINGS. |
| **HIDE PINNED** | feature | Removes the pinned message card (and the ad banner attached to it) from the top of the chat. Toggle in SEYTTINGS. |
| **SKIP 18+ WARNING** | feature | Auto-accepts the 18+ mature content warning, so a mature stream starts without the extra click. Toggle in SEYTTINGS. |

### Twitch (Android TV)

Twitch TV is a WebView app, so these patches operate on the remote Next.js UI
instead of replacing native Compose screens.

| Patch | Type | What it does |
| --- | --- | --- |
| **SEYTTINGS** | base | Turns the web Settings row into a red **SEYTTINGS** row that opens a native patched-tweaks dialog. Required by every Twitch feature. |
| **AMOLED** | feature | Turns the chat panel and the bars above and below the video pure black (`#000000`). The player, text and badges keep Twitch's colours. One toggle in SEYTTINGS, on by default. |
| **AD BLOCK** | feature | Skips Twitch ads on live streams. During a break it switches to the same broadcast from an ad-free player type, so the stream keeps playing. One toggle in SEYTTINGS. |
| **EMOTES** | feature | Shows 7TV, BTTV and FFZ emotes in the Twitch TV chat. One shared toggle in SEYTTINGS enables all providers. |
| **EXPAND CHAT** | feature | Hides the **Join the conversation** footer button and lets the chat fill the full panel height. One toggle in SEYTTINGS. |
| **HIDE PINNED** | feature | Hides the pinned message card above the chat, its **Pinned by** label, the pin badge and any pinned highlight in the message list. One toggle in SEYTTINGS, off by default. |
| **SKIP 18+ WARNING** | feature | Auto-accepts the 18+ mature content warning, so a mature stream starts without the extra click. One toggle in SEYTTINGS, on by default. |

### AMOLED theme on Twitch TV

Twitch paints its TV web UI in two dark greys: `#0e0e10` for the page and the
letterbox bars above and below the video, and `#18181b` for the chat panel and
its edge fades. On an OLED/AMOLED screen those greys still light up the panel, so
**AMOLED** replaces exactly those surfaces with `#000000`:

- the page background, the letterbox bars and the chat panel become pure black,
- the chat's top and bottom edge fades are repainted black as well (Twitch
  computes that gradient at runtime, so the script reads the live value and only
  swaps the grey stop),
- the player image, the overlay scrim, the text colours and the badges are left
  untouched, so nothing else changes.

Twitch TV renders everything in a WebView, so the feature is a small injected
style sheet plus one shared preference. It is applied before the first frame and
re-applied after client-side navigation and React re-renders. The SEYTTINGS
switch applies instantly and is remembered across restarts.

### Ad blocking on Twitch TV

Twitch TV does not play ads as separate videos. The ads are stitched into the
HLS media playlists that hls.js loads inside the WebView, so the only place to
remove them is the playlist itself. **AD BLOCK** works there:

- it hooks the playlist loaders and drops the marked ad segments
  (`stitched-ad`, `EXT-X-CUE-OUT`, `twitch-stitched`, `twitch-maf-ad` and the
  known ad segment URLs),
- while a break is running it requests the same broadcast with another
  `player_type` (embed, popout, site, ...), which usually comes without ads, and
  splices those segments in at the matching program date-time,
- without a clean backup stream the player waits on the last live frame instead
  of showing the ad, then rejoins the stream when the break ends.

Everything happens in the page, so the feature is just a JavaScript file and one
switch. The toggle is on by default and applies on the next playlist refresh;
turning it off makes Twitch play ads normally again.

The filter is adapted from
[CeladonTV](https://github.com/kenhendricks00/CeladonTV) (MIT, © 2026 Kenneth
Hendricks), which in turn credits
[TwitchAdSolutions](https://github.com/pixeltris/TwitchAdSolutions) (MIT). See
[Third-party notices](#third-party-notices).

## One bundle, two apps

A Morphe bundle can carry patches for several packages. This repository keeps:

- one `classes.dex` built from both `app.morphe.patches.kicktv` and
  `app.morphe.patches.twitch`,
- one extension DEX per feature, with app-prefixed entry names so the KICK and
  Twitch modules never collide,
- one `patches-list.json` with a `compatiblePackages` entry per app.

Morphe Manager groups the entries by package, so after selecting a KICK APK you
see the seven KICK patches, and after selecting a Twitch APK you see the seven
Twitch patches. Dependency resolution keeps **SEYTTINGS** selected whenever a
feature patch needs it.

### Icons in Morphe Manager

The repository contains:

- **`patches-bundle.png`** - the source icon shown on the Sources screen. Morphe
  Manager looks for a PNG named after `patches-bundle.json`, so this file must
  stay next to that JSON in the repository root (and in the `remote/` staging
  folder).
- **per-app tile colours** - the home-screen tile of each app uses the
  `appIconColor` declared in the bundle. KICK is green and Twitch is purple, so
  the two apps are easy to tell apart. The SEYTTINGS UI inside both apps keeps
  its red theme.

The optional images in `assets/` (`kick-icon.png`, `twitch-icon.png`) are only
illustrations for this README. Morphe Manager derives the app tiles from
`appIconColor`, not from those files.

## Add the source in Morphe Manager

Add **one** of these under **Sources** -> **+**:

- Repository: `https://github.com/seythegamer/sey-morphe-patches`
- Manifest: `https://raw.githubusercontent.com/seythegamer/sey-morphe-patches/main/patches-bundle.json`

One-click link:

<https://morphe.software/add-source?github=seythegamer/sey-morphe-patches>

Morphe Manager reads `patches-list.json` for the patch list and
`patches-bundle.json` for the bundle download URL. Do not paste a direct `.mpp`
link.

Use the **repository** URL if you want the in-app changelog: Morphe Manager
fetches `CHANGELOG.md` from the repository root. The raw
`patches-bundle.json` URL works for patching and updates, but it does not carry
release notes.

You can also import `SeyMorphe-1.2.4.mpp` manually as a local source.

## How to use

1. Put the original KICK `1.9.0` APKM or Twitch `13.0.0.2` APKM on the device.
2. Open the app in Morphe Manager and pick the APK/APKM.
3. Tick the patches you want. Feature patches pull **SEYTTINGS** in
   automatically.
4. Patch and install the result.
5. Open the app's Settings screen and press the red **SEYTTINGS** row to change
   the tweak options. The tweak list scrolls with the D-pad when it is longer
   than the screen; the **Close** button stays pinned at the bottom.

The patched APK is signed with a different key than the store build, so
uninstall the original first. That removes the app's local data.

## Changelog

`CHANGELOG.md` in the repository root is the release-notes source for Morphe
Manager. After an update the app compares the installed bundle version with the
newest version in the file and shows every entry in between.

Morphe parses the file with these rules, so keep the format:

- one version heading per release, newest first: `## 1.2.4 (2026-11-11)` (the
  date is required),
- section headings such as `### ✨ New Features`, `### 🐛 Bug Fixes`,
  `### ⚡ Performance` or `### 📝 Other`,
- one bullet per change, with the app name in the scope:
  `* **Twitch - AMOLED:** ...` or
  `* **KICK: Live Streaming - SEYTTINGS:** ...`.

The scope matters: Morphe matches it against the app names from the bundle
(`Twitch (Android TV)` / `Twitch` and `KICK: Live Streaming` / `Mobile`) to show
the "changes for your apps" badge. Keep an ASCII hyphen between the app name and
the feature, as in the examples.

Add a new section at the top before publishing a version:

```markdown
## 1.2.5 (2026-11-20)

### ✨ New Features

* **Twitch - CHAT SIZE:** Added a chat size preset.
* **KICK: Live Streaming - CHAT SIZE:** Added a chat size preset.
```

## Build from source

Requirements:

- **Morphe Desktop / CLI** - put `morphe-desktop.jar` in `tools/`. Download it
  from the [Morphe releases](https://github.com/MorpheApp/morphe-desktop/releases).
- **Java 21** - put a JDK in `tools/jdk21/` or add `java` to `PATH`.
- **Android SDK** with `build-tools` (`d8`, `apksigner`, `zipalign`) and a
  platform `android.jar`. The scripts look at `ANDROID_HOME`,
  `ANDROID_SDK_ROOT` or the default Windows SDK location.
- **Kotlin compiler** - Android Studio ships `kotlinc`; the scripts also accept
  `kotlinc` from `PATH`.

Build the extension DEX files and the combined bundle:

```powershell
powershell -ExecutionPolicy Bypass -File scripts\build-patch.ps1
```

Output: `dist\SeyMorphe-1.2.4.mpp`.

Optional APK builders use the same bundle and apply the patches to an original
APKM:

```powershell
powershell -ExecutionPolicy Bypass -File scripts\build-kick-apk.ps1
powershell -ExecutionPolicy Bypass -File scripts\build-twitch-apk.ps1
```

Prepare the files for a GitHub source:

```powershell
powershell -ExecutionPolicy Bypass -File scripts\prepare-remote.ps1 `
    -Owner seythegamer -Repo sey-morphe-patches
```

`scripts\publish-remote.ps1` can upload them through the GitHub REST API; the
token is read from `git credential fill` and is never printed.

### Release checklist

1. Add a new `## <version> (YYYY-MM-DD)` section to `CHANGELOG.md` (newest
   first) and describe the changes with app-scoped bullets.
2. Build the bundle and pass the same version everywhere:

   ```powershell
   powershell -ExecutionPolicy Bypass -File scripts\build-patch.ps1 -Version 1.2.4
   powershell -ExecutionPolicy Bypass -File scripts\prepare-remote.ps1 `
       -Owner seythegamer -Repo sey-morphe-patches -Version 1.2.4
   ```

3. Commit and push `CHANGELOG.md` together with `patches-bundle.json`,
   `patches-list.json`, the new `.mpp` and the README.
4. Create or update the GitHub release so the Patches screen shows the same
   notes next to the download:

   ```powershell
   powershell -ExecutionPolicy Bypass -File scripts\publish-release.ps1 `
       -Owner seythegamer -Repo sey-morphe-patches -Version 1.2.4
   ```

   The script reads the `## <version> (YYYY-MM-DD)` section from `CHANGELOG.md`
   as UTF-8, uses it as the release body, creates tag `v<version>` and replaces
   the `SeyMorphe-<version>.mpp` asset.
5. Verify that
   `https://raw.githubusercontent.com/<owner>/<repo>/main/CHANGELOG.md` returns
   200 and that the new version heading is visible in Morphe Manager. Use the
   repository source for this: Morphe Manager fetches `CHANGELOG.md` from
   `<repo>/main/CHANGELOG.md`, while the raw `patches-bundle.json` source has no
   changelog.

`prepare-remote.ps1` copies `CHANGELOG.md` into `remote/`,
`publish-remote.ps1` uploads it next to the manifest and the bundle, and
`publish-release.ps1` fills the GitHub release body with the version section.
The manifest stays authoritative for update checks (`fetchLatestFromManifest`
runs first); the release provides the notes and a fallback download.

`tools/`, `dist/`, `remote/`, build output, the original APKMs and signing
keystores are ignored by Git, so they are not part of the published source tree.

## Project layout

```
patches/src/main/kotlin/app/morphe/patches/
  kicktv/Target.kt                  KICK compatibility (package, version, green tile)
  kicktv/settings/                  KICK SEYTTINGS base patch
  kicktv/emotes/                    KICK EMOTES patch
  kicktv/chatsize/                  KICK CHAT SIZE patch
  kicktv/chattext/                  KICK CHAT TEXT SIZE patch
  kicktv/chatexpand/                KICK EXPAND CHAT patch
  kicktv/hidepinned/                KICK HIDE PINNED patch
  kicktv/maturewarning/             KICK SKIP 18+ WARNING patch
  twitch/Target.kt                  Twitch compatibility (package, version, purple tile)
  twitch/settings/                  Twitch SEYTTINGS base patch
  twitch/amoled/                    Twitch AMOLED patch
  twitch/adblock/                   Twitch AD BLOCK patch
  twitch/emotes/                    Twitch EMOTES patch
  twitch/expandchat/                Twitch EXPAND CHAT patch
  twitch/maturewarning/             Twitch SKIP 18+ WARNING patch
  twitch/hidepinned/                Twitch HIDE PINNED patch
extension/js/
  twitch-adblock.js                 readable source of the injected HLS ad filter
  twitch-amoled.js                  readable source of the injected black theme
  twitch-maturewarning.js           readable source of the mature warning auto-accept
  twitch-hidepinned.js              readable source of the pinned message hider
extension/src/app/morphe/extension/
  kicktv/base/                      KICK red themed dialog, bridge and injector
  kicktv/emotes/                    KICK emote renderer and provider store
  kicktv/chat/                      KICK chat size helpers
  kicktv/chattext/                  KICK chat text size helpers
  kicktv/chatexpand/                KICK footer helper
  kicktv/hidepinned/                KICK pinned card helper
  kicktv/maturewarning/             KICK mature warning helper
  twitch/base/                      Twitch red themed dialog, bridge and injector
  twitch/amoled/                    Twitch AMOLED injector, preference and section
  twitch/adblock/                   Twitch AD BLOCK injector, preference and section
  twitch/emotes/                    Twitch emote renderer and provider store
  twitch/expandchat/                Twitch footer helper
  twitch/maturewarning/             Twitch mature warning injector, preference and section
  twitch/hidepinned/                Twitch pinned message hider, preference and section
scripts/                            build and release scripts
patches-list.json                   remote patch metadata (repository root)
patches-bundle.json                 remote bundle manifest (repository root)
patches-bundle.png                  source icon shown by Morphe Manager
CHANGELOG.md                        release notes read by Morphe Manager
SeyMorphe-1.2.4.mpp                 published bundle (repository root)
assets/                             README illustrations
LICENSE                            GNU General Public License v3.0
README.md                          this documentation
```

## Notes and limitations

- The KICK patches declare compatibility with **1.9.0 / versionCode 208** only.
  The Twitch patches declare **13.0.0.2 / versionCode 1100000018** only. Newer
  app versions need fresh fingerprints before they can be patched.
- A patched app cannot be updated from the store (signature mismatch). Patch the
  newer APK and install it over the old one.
- Runtime behaviour was verified on a real Android TV box (Android 11): KICK
  chat size presets, 7TV/BTTV/FFZ global sets, channel 7TV emotes and Twitch
  footer hiding were confirmed live.
- **AD BLOCK** was verified on the same box: the loader hooks install in the
  Twitch TV WebView, read the live HLS playlists, and the SEYTTINGS toggle
  stops and starts the filter immediately and survives an app restart. The
  filtering itself was checked against a stitched-ad test playlist: ad segments
  are removed, the live segments are kept and the media sequence is renumbered
  (with the toggle off the playlist passes through unchanged). This test
  session was logged out and Twitch served no ad break in the observation
  window, so the backup-stream switch was not seen live here.
- **AMOLED** was verified on the same box: on a live stream the letterbox bars,
  the page and the chat panel report (and screenshot) `#000000`, the chat edge
  fades are repainted with the same direction, the SEYTTINGS switch reverts the
  theme immediately and the choice survives an app restart. The player scrim,
  text and badges were left as Twitch draws them.
- 7TV channel emotes are resolved through the KICK user id. BTTV and FFZ only
  provide global emote sets for KICK, so channel-specific BTTV/FFZ emotes are
  not available there.
- The Twitch helper survives client-side navigation because it is re-applied on
  every page load and React re-render.
- **AD BLOCK** removes the ads Twitch stitches into the live HLS playlists. Ad
  detection and the backup stream depend on Twitch keeping the markers and the
  `player_type` parameter, so a future server change may need a new script.
  When no ad-free player type is available the player pauses on the last live
  frame for the length of the break instead of showing the ad.
- Emote sets are public data: no Twitch or KICK login is required for the emote
  providers.

## Third-party notices

The Twitch **AD BLOCK** script (`extension/js/twitch-adblock.js`) is adapted
from:

- **CeladonTV** - `starshot-hls-adblock.js`
  <https://github.com/kenhendricks00/CeladonTV>
  MIT License, Copyright (c) 2026 Kenneth Hendricks
- **TwitchAdSolutions** (credited by CeladonTV)
  <https://github.com/pixeltris/TwitchAdSolutions>
  MIT License, Copyright (c) pixeltris

The adapted file keeps its attribution header, is distributed here under the
GNU GPL v3, and the original MIT terms continue to apply to the parts taken
from those projects.

## License

Copyright (C) 2026 sey

This project is free software: you can redistribute it and/or modify it under
the terms of the **GNU General Public License** as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This project is distributed in the hope that it will be useful, but **WITHOUT
ANY WARRANTY**; without even the implied warranty of MERCHANTABILITY or
FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
details.

You should have received a copy of the GNU General Public License along with
this project. If not, see <https://www.gnu.org/licenses/>.

The full license text is in [LICENSE](LICENSE).
