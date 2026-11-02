# 🧩 Machu Morphe Patches

Unofficial [Morphe](https://morphe.software) patches for apps I use.

## ❓ About

This repository contains patches that restore functionality I need on my own
devices. The patches are built and released automatically from the `dev`
branch as Morphe pre-releases.

### Version 2.0

The 2.0 line targets only the official Filament build
(`ALPHA-2.6.575-09041449-ogl-64`). The old 2.6.561 Unity port and its legacy
patch paths were removed.

### How to use these patches

Add this repository as a patch source in Morphe Manager:

<https://github.com/MatthewRiley05/Machu-Morphe-Patches>

<a href="https://morphe.software/add-source?github=MatthewRiley05/Machu-Morphe-Patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v2.0.0](https://github.com/MatthewRiley05/Machu-Morphe-Patches/releases/tag/v2.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;2 patches total
<details open>
<summary>📦 Earth Super Wallpaper&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**Package name:** `com.miui.miwallpaper.earth`

**🎯 Supported versions:**

| ALPHA-2.6.575-09041449-ogl-64 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Delay screen-off zoom-out](#delay-screen-off-zoom-out) | Delays the AOD zoom-out on screen-off so the device's closing animation can finish first. The delay is configurable (default 500 ms). | • Zoom-out delay (ms) |
| [Earth Super Wallpaper (AOSP)](#earth-super-wallpaper-aosp) | Makes the official Earth Super Wallpaper work on non-MIUI Android: removes MIUI framework crashes, fixes ambient-mode and weather settings, adds the five desk positions, restores the unlock animation, and keeps picker applies stable. |  |

</details>

<!-- PATCHES_END -->

## 🌎 Earth Super Wallpaper – AOSP unlock + idle animation

Unofficial patches for `com.miui.miwallpaper.earth` that restore the
lock → home transition and keep the wallpaper animating on AOSP-based ROMs
(Pixel, Android 14–17). The official Filament build also needs an AOSP
compatibility patch to remove its MIUI-only framework calls.

**Tested on:** Pixel 10 Pro XL, Android 17, with the base APK below.

> **Not affiliated with Xiaomi or Google.** This repository contains only patch
> code and documentation. It does **not** contain the APK, decompiled sources,
> assets, native libraries or signing keys. You must supply your own copy of
> the APK.

### Base APK

The base is the **official Xiaomi release**
`ALPHA-2.6.575-09041449-ogl-64` (`versionCode 206000575`, package
`com.miui.miwallpaper.earth`).

Future official releases may work, but the smali context must match. If Morphe
reports a failed fingerprint, the smali has changed and the patch needs
updating.


### Symptom

1. The wallpaper renders (including the AOD/lock frame), but unlocking never
   animates from the lock-screen framing to the home-screen framing.
2. After a few seconds without touching the screen, the wallpaper stutters and
   freezes; touching or swiping starts it again for a few seconds.

### Root cause

Two separate problems:

1. The app schedules a `MSG_Filament_PAUSE` 4–5 seconds after unlock and after
   every wallpaper offset change. `EarthMrePlayer.pause()` then freezes the
   scene until the launcher sends another offset change.
2. After unlock the receiver only forwards the `"Desk"` event when
   `DisplayUtils.getDisplayState() == DESK` (4). During the AOSP unlock
   transition the display state can still be something else, so the event is
   discarded and the lock → home animation never runs.

### What the patch changes

There is one main patch, **Earth Super Wallpaper (AOSP)**, plus an optional
**Delay screen-off zoom-out** patch. The main patch applies all of the changes
below. The manifest and XML additions are handled by a hidden resource
dependency, so they do not appear as separate patches.

#### AOSP compatibility

The official 2.6.575 build still calls MIUI framework classes that do not exist
on AOSP. Without these changes the wallpaper service crashes while loading
`MiuiWallpaperManager` or `UIDarkModeHelper`.

| #   | Target                                                | Change                                                                                                              |
| --- | ----------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| 1   | `MiuiWallpaperManager.<clinit>`                       | `miui.os.UserHandle.myUserId()` → `android.os.UserHandle.myUserId()`.                                               |
| 2   | `WallpaperAuthorityUtils.<clinit>`                    | Replace the `miui.os.Build.IS_INTERNATIONAL_BUILD` read with `false`.                                               |
| 3   | `CommonUtils.getScreenSize()`                         | Replace the `miui.os.Build.IS_TABLET` read with `false`.                                                            |
| 4   | `MiuiWallpaperManager.getFitScreenWallpaperPreview()` | Replace its `miui.os.Build.IS_TABLET` read with `false`.                                                            |
| 5   | `WallpaperAuthorityUtils.isThemeLockLiveWallpaper()`  | Return `true` instead of reaching `miui.os.Build.DEVICE` through `isVideo24Wallpaper()`.                            |
| 6   | `AodUtils.isAodOpened()`                              | Return `true` instead of reading MIUI's AOD setting.                                                                |
| 7   | `AodUtils.isAodUsingSuperWallpaperStyle()`            | Return `true` instead of reading MIUI's `aod_using_super_wallpaper` setting.                                        |
| 8   | `WallpaperAuthorityUtils.supportVideo24Wallpaper()`   | Replace its `miui.os.Build.DEVICE` reads with empty strings so no MIUI type remains.                                |
| 9   | `UIDarkModeHelper$1.onChange()`                       | Return `false` instead of calling `android.provider.MiuiSettings$System.getBoolean()`.                              |

#### AOSP ambient-mode metadata

The official `res/xml/super_wallpaper.xml` hard-codes
`android:supportsAmbientMode="true"`. AOSP's `WallpaperManagerService` then
requires the selected wallpaper service to hold
`android.permission.AMBIENT_WALLPAPER`, a signature/privileged permission a
sideloaded APK can never get, so the system picker throws `SecurityException`.

The patch sets `android:supportsAmbientMode="false"`, which avoids that
permission check.

#### Weather settings

`WeatherUtils$1.onPostExecute()` writes sunrise, sunset and `sunrise_update` to
`Settings.Global` without a permission check. On AOSP that throws
`SecurityException` because `WRITE_SECURE_SETTINGS` is signature/privileged.
The patch removes those writes; the fetched values are still passed directly to
the renderer for the current session.

#### Desk positions

The official APK exposes one Earth entry plus a preview entry. The patch adds
four position services so the AOSP picker shows all five Earth positions:

| #   | Change                                                                                                                    |
| --- | ------------------------------------------------------------------------------------------------------------------------- |
| 1   | Adds `EarthSuperWallpaper1..4` service classes through the extension DEX.                                                  |
| 2   | Adds four `res/xml/super_wallpaper1..4.xml` metadata files using the position strings and thumbnails already in the APK.    |
| 3   | Adds four `<service>` entries to `AndroidManifest.xml`, each in its own process (`:earthSuperWallpaper1`–`:earthSuperWallpaper4`). |
| 4   | Patches `SuperWallpaperUtils.getSuperWallpaperHomePosition()` to derive the position from the service class name, avoiding MIUI `Settings.Secure`. |

#### Picker apply / preview handoff

Applying a live wallpaper from the picker first creates a preview engine and
then the applied engine in the same wallpaper service. The preview and applied
engines share one `EarthMrePlayer` field, and creating a preview player would
replace the applied player (or vice versa) while Filament is still rendering.

The patch makes preview engines skip Filament entirely, so the applied engine
is the only one using the shared service state. The picker's live preview can
be black, but applying the wallpaper is reliable.

#### Unlock + pause

| #   | Target                                                    | Change                                                                                                  |
| --- | --------------------------------------------------------- | ------------------------------------------------------------------------------------------------------- |
| 1   | `BaseEarthSuperWallpaper.smali`                           | Raise `getDeskPauseDelay()` / `getWallPaperAod2LockPauseDelay()` from 5000 ms and `getWallPaperOffsetDelay()` from 4000 ms to `0x7fffffff`, so the renderer is not paused while visible. |
| 2   | `BaseEarthSuperWallpaper$8$1.smali`                       | Drop the `DisplayUtils.getDisplayState() == DESK` check that could discard the unlock during animation. |
| 3   | `BaseEarthSuperWallpaper$8.smali`                         | Post `"Desk"` with 0 ms instead of 100 ms.                                                              |

The hard-coded 2 s pause on screen-off and the visibility path are untouched, so
the scene still stops when the display is off or the wallpaper is hidden.

#### Optional: Delay screen-off zoom-out

Some devices, including Pixel phones, play a closing animation when the screen
turns off. This optional patch delays the AOD zoom-out so that animation can
finish before the wallpaper starts transitioning. The delay defaults to **500
ms** and is configurable from **100–1000 ms** in steps of 50 ms. It is **off by
default** and can be enabled separately in Morphe.

A pending transition is cancelled when the display wakes or the wallpaper engine
is destroyed, so a delayed AOD frame cannot appear after the device is back on.

### Notes / limitations

- The unlock transition starts when SystemUI sends `ACTION_USER_PRESENT`, which
  is after the unlock animation finishes. The earlier `keyguardgoingaway`
  signal is permission-gated on Android 16+, so a normal app cannot start the
  wallpaper transition sooner.
- Raising the pause delays means the scene keeps rendering while the wallpaper
  is visible. Screen-off and hidden-wallpaper paths still pause.
- The optional zoom-out delay postpones `goToAodState()` on screen-off and
  cancels it if the display wakes first.
- No version bump is included in the patch.
- This patch was generated using AI as I don't specialize in this type of
  programming. It is tested on a Pixel 10 Pro XL running Android 17.

## 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches `.mpp` file is found in `patches/build/libs/patches-*.mpp`
- Patch the `.mpp` file using [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation)
for more information.

## 🧑‍💻 Development

- Make changes on the `dev` branch.
- Use [semantic commit](https://www.conventionalcommits.org/) messages:
  `feat:` for new features, `fix:` for fixes, and `chore:` for changes that
  should not appear in the changelog.
- `fix:` and `feat:` commits automatically create a new pre-release from `dev`.
  `chore:` commits do not create a release.
- When `dev` is ready for a stable release, merge it into `main` without
  squashing.
- Do not manually edit generated files such as `patches-list.json`,
  `patches-bundle.json` or `CHANGELOG.md`; `release.yml` updates them.

## 📜 License

Machu Morphe Patches are licensed under the
[GNU General Public License v3.0](LICENSE).
