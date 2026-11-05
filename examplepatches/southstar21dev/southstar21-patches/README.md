<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset=".github/readme/southstar21-horizontal-cream.svg">
    <img alt="southstar21.dev" src=".github/readme/southstar21-horizontal-darkroast.svg" width="420">
  </picture>
</p>

<h3 align="center">Patches for Instagram, made with Morphe.</h3>

<p align="center">
  A Liquid Glass tab bar from iOS 26, Reels gone from your feed, full size profile pictures<br>
  and a settings menu inside the app to switch each one on and off.
</p>

<p align="center">
  <a href="#install">Install</a> ·
  <a href="#patches">Patches</a> ·
  <a href="#settings-menu">Settings menu</a> ·
  <a href="#development">Development</a> ·
  <a href="CHANGELOG.md">Changelog</a>
</p>

<p align="center">
  <a href="https://github.com/southstar21dev/southstar21-patches/releases/latest"><img alt="Latest release" src="https://img.shields.io/github/v/release/southstar21dev/southstar21-patches?sort=semver&label=release&style=flat-square&color=1F1A17"></a>
  <a href="https://github.com/southstar21dev/southstar21-patches/actions/workflows/release.yml"><img alt="Release" src="https://img.shields.io/github/actions/workflow/status/southstar21dev/southstar21-patches/release.yml?branch=main&label=build&style=flat-square"></a>
  <img alt="Instagram 453.0.0.57.79" src="https://img.shields.io/badge/Instagram-453.0.0.57.79-1F1A17?style=flat-square&logo=instagram&logoColor=F5ECD7">
  <a href="https://morphe.software"><img alt="Morphe" src="https://img.shields.io/badge/Morphe-patches-1F1A17?style=flat-square"></a>
  <a href="LICENSE"><img alt="License GPL-3.0" src="https://img.shields.io/badge/license-GPL--3.0-1F1A17?style=flat-square"></a>
</p>

## Install

1. Install [Morphe Manager](https://morphe.software) on your phone.
2. Add this repo as a patch source: **[add southstar21 Patches to Morphe](https://morphe.software/add-source?github=southstar21dev/southstar21-patches)**. Or download `patches-x.y.z.mpp` from [Releases](https://github.com/southstar21dev/southstar21-patches/releases) and add it as a local file.
3. Download the Instagram **APKM** bundle from APKMirror, in a version listed under [Patches](#patches).
4. Patch it in Morphe Manager, choose the patches you want and install the result.

Patched apps are signed with a different key, so uninstall the Play Store version first.

> [!WARNING]
> Instagram's terms don't allow modified clients. Use these patches at your own risk.

## Patches

<!-- PATCHES_START EXPANDED -->
> **[v1.1.0](https://github.com/southstar21dev/southstar21-patches/releases/tag/v1.1.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;7 patches total
<details open>
<summary>📦 Instagram&nbsp;&nbsp;•&nbsp;&nbsp;7 patches</summary>
<br>

**🎯 Supported versions:**

| 453.0.0.57.79 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Bypass signature check](#bypass-signature-check) | Stops Instagram rejecting apps by their signature, which a patched app no longer matches. |  |
| [Disable Reels](#disable-reels) | Removes reels from the home feed and Explore, and stops scrolling from one reel to the next. Each part is off until you switch it on in the settings. |  |
| [Hide ads](#hide-ads) | Removes sponsored posts, stories and reels, and ad units in the home feed. Each part can be switched off in the settings. |  |
| [Hide navigation buttons](#hide-navigation-buttons) | Adds settings to hide Search, Reels, Create, Messages and other tabs from the bottom bar. |  |
| [Liquid Glass navigation bar](#liquid-glass-navigation-bar) | Turns the bottom tab bar into a floating iOS 26 style Liquid Glass pill with live background blur and edge refraction. Refraction needs Android 13+, blur needs Android 12+, older versions get a tinted pill. | • Blur radius<br>• Refraction strength<br>• Extend content behind bar |
| [Remove build expired popup](#remove-build-expired-popup) | Removes the popup that appears after a while, when the app version ages. |  |
| [View profile picture](#view-profile-picture) | Adds a button on the profile picture of profile pages that shows the profile picture in full resolution and saves it to the gallery. |  |

</details>

<!-- PATCHES_END -->

### Liquid Glass navigation bar

Instagram's iOS 26 Liquid Glass design on Android, matched against screen recordings of the iOS app.

- **Floating glass tab bar.** A frosted pill with live background blur, a subtle refracting rim and a grey capsule behind the selected tab.
- **Shrinks while scrolling.** Scrolling down scales the whole bar down (every tab stays visible and tappable), scrolling up brings it back.
- **Gliding selection.** Drag along the bar to slide the selection between tabs as clear glass, with a haptic tick per tab; let go to open the tab underneath.
- **Adaptive tint.** The glass frosts more when what's behind it would make the icons hard to read, and turns dark on Reels and in dark mode.
- Taps, double taps and long presses on the tabs still go to Instagram untouched.

Android 13+ gets the full effect, Android 12 gets blur without refraction, and older versions get a translucent tinted pill.

| Option | Default | |
|---|---|---|
| Blur radius | 12 dp | How frosted the glass is (0 to 40). |
| Refraction strength | 60 | How strongly the edge bends what's behind it (0 to 100). |
| Extend content behind bar | on | Lets feeds scroll under the bar so there's something to see through the glass. |

<details>
<summary>How it works</summary>

A hook in `InstagramMainActivity.onWindowFocusChanged` (an unobfuscated method, so it should survive app updates) starts the extension, which finds the tab bar by its resource name and gives it a background drawable that re-records the views behind it into a `RenderNode` each frame, then runs that through a blur and an AGSL refraction shader.

</details>

### Disable Reels

Takes Reels out of Instagram. Each part has its own switch on the patch's page in the [settings menu](#settings-menu), and the Reels tab itself is hidden with [Hide navigation buttons](#hide-navigation-buttons).

| Setting | Default | |
|---|---|---|
| Home feed | off | Drops reel posts and "Suggested reels" style units as the feed loads. |
| Explore | off | Drops Explore grid sections that contain a reel. Whole sections go, since removing single tiles would break Instagram's grid layouts. |
| Stop scrolling | off | A reel opened from a message or a profile plays alone, with swiping to the next one locked. |
| Block Reels player | off | Reels don't open at all, including ones sent in messages. |

<details>
<summary>How it works</summary>

Instagram parses every home feed item, and every Explore section, through one method each; the patch returns nothing for reels there, which Instagram already skips. The Reels player's pager is found by its view id (`clips_viewer_view_pager`), and the player itself is closed from `ClipsViewerFragment.onViewCreated` when blocked.

</details>

### Hide ads

Takes ads out of Instagram. Each part has its own switch on the patch's page in the [settings menu](#settings-menu).

| Setting | Default | |
|---|---|---|
| Sponsored posts | on | Ads in the home feed, Stories, Reels and feeds opened from Explore. |
| Ad units in the feed | on | Ad carousels and "Why am I seeing ads" prompts that come with the home feed. |

Ads Instagram had already loaded may still show once after switching it on.

<details>
<summary>How it works</summary>

Feed, Stories, Reels and the other feeds share one sponsored content controller, which receives every batch of ads Instagram fetches and slots them between posts. The patch empties each batch on arrival, which Instagram handles as a delivery with no ads. Ad units that come inside the home feed response (`AD`, ad pivots, ads feedback prompts) are dropped where each feed item is parsed, the same method Disable Reels uses.

</details>

### View profile picture

A small round button sits on the bottom left of the profile picture on every profile page, however it's opened: search, DMs, notifications or your own profile, where the story "+" stays on the bottom right.

- **Full resolution.** The picture opens fullscreen in its original size, growing out of the avatar and shrinking back into it when closed. The small picture shows straight away and the full size one replaces it once it's downloaded, with the resolution shown at the bottom.
- **Zoom and close.** Pinch or double tap to zoom, swipe down or press Back to close, tap to hide the controls.
- **Save it.** The download button saves the picture to **Pictures/Instagram**, exactly as Instagram serves it, without re-compressing.

<details>
<summary>How it works</summary>

Profile pages (`UserDetailFragment`) are tracked from `onViewCreated`, and each page's own view tree is watched so the button is added whenever its header is laid out, in any activity. It floats in the parent shared by the avatar (`row_profile_header_imageview_frame_layout`) and its story ring (`reel_ring`), which is drawn on top of the avatar, and follows the ring's position. On tap, the user is read live from the page's `UserDetailTabController`, which carries the full size picture (`hd_profile_pic_url_info`) once the profile has loaded.

</details>

### Hide navigation buttons

Off by default; select it in Morphe Manager to include it. Adds a **Navigation buttons** page to the settings menu with a switch for each tab: Search, Reels, Create, Messages, Activity (the heart, also the one at the top of the home page) and the rotating tab some accounts get, all off at first. Home and Profile always stay, because the menu button lives on Profile. Changes apply after Instagram restarts.

Hidden tabs are removed from the list Instagram builds the bar from, so you can't swipe into them either. If the tab Instagram would open at launch is hidden, Home opens instead.

### Bypass signature check

Instagram checks its own signature, which a patched app no longer matches. This stops it from rejecting itself.

### Remove build expired popup

Removes the popup Instagram shows once the installed version has aged, asking you to update.

## Settings menu

<img align="right" alt="The southstar21 Patches settings menu" src=".github/readme/settings-menu.png" width="300">

Every patched Instagram gets a **southstar21 Patches** button in the top bar of your own profile, next to Threads and ☰. It opens a menu listing every patch you included, each with its own page where it can be switched on and off and configured.

Patches you didn't select in Morphe Manager aren't listed. **Restart Instagram** applies settings that only take effect at launch, and **Reset all settings** puts everything back to its defaults.

<br clear="right">

## Development

```sh
GITHUB_ACTOR=<you> GITHUB_TOKEN=<token> ./gradlew :patches:buildAndroid
```

The Morphe Gradle plugin needs a GitHub token with `read:packages`, see the [Morphe setup docs](https://github.com/MorpheApp/morphe-patcher/blob/main/docs/2_1_setup.md#-prepare-the-environment). The patch bundle lands in `patches/build/libs/patches-<version>.mpp`.

<details>
<summary>Repository layout</summary>

```
patches/src/main/kotlin/app/southstar21/patches/
  <app>/
    shared/              Compatibility (app versions) and fingerprints shared by the app's patches
    misc/extension/      sharedExtensionPatch: bundles extensions/<app>.mpe into the app
    layout/<patch>/      UI patches (one folder per patch: the patch and its Fingerprints.kt)
    misc/<patch>/        Everything else
extensions/<app>/        Java code injected into the app, one Gradle module per app
  src/main/java/app/southstar21/extension/<app>/<patch>/
```

</details>

<details>
<summary>Adding a patch</summary>

1. **New app?** Create `extensions/<app>/` (copy `extensions/instagram/build.gradle.kts` and change the name and namespace), plus `patches/.../<app>/shared/Constants.kt` with its `Compatibility` and `misc/extension/SharedExtensionPatch.kt`.
2. Add the patch under `patches/.../<app>/layout/<patch>/` or `misc/<patch>/`, with `compatibleWith(...)` and, if it runs extension code, `dependsOn(sharedExtensionPatch)`.
3. Put its extension code in `extensions/<app>/src/main/java/app/southstar21/extension/<app>/<patch>/`.
4. Commit with a [conventional commit](https://www.conventionalcommits.org) message. A `feat:` or `fix:` pushed to `dev` publishes a pre-release; on `main`, a release.

**Showing an Instagram patch in the settings menu:**

1. In its extension class, add `public static boolean isIncluded() { return false; }` and a `public static final PatchSettings SETTINGS = new PatchSettings("<key>", "<Title>", "<description>", <Class>::isIncluded, ...settings)`, using `BooleanSetting` / `IntSetting` from `app.southstar21.extension.instagram.settings`. Pass `SettingsGroup`s instead of plain settings to split the page into titled sections, and chain `.icon(Icons.Glyph.X, color)` to give it an icon. Read values with `.get()`; mark settings `requiresRestart` if they're only read at startup.
2. Add `<Class>.SETTINGS` to the list in `settings/Settings.java`.
3. If the patch needs the main activity, start it from `InstagramHooks.onMainActivityWindowFocusChanged` behind `if (<Class>.SETTINGS.isActive())`.
4. In the Kotlin patch, call `markPatchIncluded("L<extension class>;")` in `execute`. Patch options can feed setting defaults by having the patch overwrite a static method the setting's default calls (see `LiquidGlassNavBarPatch`).

</details>

## License

Free software under the [GNU General Public License v3.0](LICENSE), based on the [Morphe patches template](https://github.com/MorpheApp/morphe-patches-template). See [NOTICE](NOTICE) for the Morphe name restriction.
