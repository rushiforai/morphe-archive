# 🧩 Machu Morphe Patches

Unofficial [Morphe](https://morphe.software) patches for apps I use.

## ❓ About

This repository contains patches that restore functionality I need on my own
devices. The patches are built and released automatically from the `dev`
branch as Morphe pre-releases.

### How to use these patches

Add this repository as a patch source in Morphe Manager:

<https://github.com/MatthewRiley05/Machu-Morphe-Patches>

<a href="https://morphe.software/add-source?github=MatthewRiley05/Machu-Morphe-Patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/MatthewRiley05/Machu-Morphe-Patches/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patches total
<details open>
<summary>📦 Earth Super Wallpaper&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**Package name:** `com.miui.miwallpaper.earth`

**🎯 Supported versions:**

| ALPHA-2.6.561-11211547-ogl-64-fix1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Earth Super Wallpaper](#unlock-earth-super-wallpaper) | Restores the lock-to-home unlock animation and prevents the wallpaper from pausing while it is visible on AOSP-based ROMs. |  |

</details>

<!-- PATCHES_END -->

## 🌎 Earth Super Wallpaper – AOSP unlock + idle animation

Unofficial patch for `com.miui.miwallpaper.earth` that restores the
lock → home transition and keeps the wallpaper animating on AOSP-based ROMs
(Pixel, Android 14–17).

**Tested on:** Pixel 10 Pro XL, Android 17, with the base APK below.

> **Not affiliated with Xiaomi, Google, Ouxyl or AppPorts.** This repository
> contains only patch code and documentation. It does **not** contain the APK,
> decompiled sources, assets, native libraries or signing keys. You must
> supply your own copy of the APK.

### Base APK

The latest APK this patch was built and tested against is
**SuperWallpaperEarth (Ouxyl's port)** `ALPHA-2.6.561-11211547-ogl-64-fix1`
(`versionCode 206000561`, package `com.miui.miwallpaper.earth`). The copy used
here was signed with an AppPorts certificate.

Other ports/versions may work, but the smali context must match. If Morphe
reports a failed fingerprint, the smali has changed and the patch needs
updating.

### Symptom

1. The wallpaper renders (including the AOD/lock frame), but unlocking never
   animates from the lock-screen framing to the home-screen framing.
2. After a few seconds without touching the screen, the wallpaper stutters and
   freezes; touching or swiping starts it again for a few seconds.

### Root cause

On Android 14+ the app disables its old broadcast-based screen/unlock handling:

```smali
# SuperWallpaper.smali
invoke-static {}, Lcom/miui/miwallpaper/utils/SystemBuildUtils;->isAndroidUAtLeast()Z
iput-boolean v0, ...,->USE_COMMAND_NOTIFICATION:Z
```

With `USE_COMMAND_NOTIFICATION = true` it does **not** register
`ACTION_USER_PRESENT` / `ACTION_SCREEN_ON` / `ACTION_SCREEN_OFF`, and its
`USER_PRESENT` branch returns early. Instead it waits for
`android.wallpaper.keyguardgoingaway`.

On Android 16+ (including Android 17) that command is only delivered to apps
holding:

```
android.permission.SUBSCRIBE_TO_KEYGUARD_LOCKED_STATE
```

which is `signature|module|role` — a sideloaded APK can never get it, and
`adb shell pm grant` refuses it. The unlock event is silently dropped, so the
Unity `"Desk"` message is never sent.

Separately, the app schedules `MSG_UNITY_PAUSE` five seconds after unlock and
after every wallpaper offset change. `unityPause()` calls
`UnityPlayer.pause()`, so the scene freezes until the launcher sends another
offset change (which calls `unityResume()`).

### What the patch changes

| #   | Target                                                  | Change                                                                                                  |
| --- | ------------------------------------------------------- | ------------------------------------------------------------------------------------------------------- |
| 1   | `SuperWallpaper.smali`                                  | Register `android.intent.action.USER_PRESENT` unconditionally (also in command mode).                   |
| 2   | `SuperWallpaper$8.smali`                                | Replace the `USE_COMMAND_NOTIFICATION` early-return with `nop` so the `USER_PRESENT` branch runs.       |
| 3   | `SuperWallpaper$8$1.smali`                              | Drop the `DisplayUtils.getDisplayState() == DESK` check that could discard the unlock during animation. |
| 4   | `SuperWallpaper$8.smali`                                | Post `"Desk"` with 0 ms instead of 100 ms.                                                              |
| 5   | `SuperWallpaper$SuperWallpaperEngine.smali`             | Delay the AOD zoom-out by 500 ms so it does not run during the display fade.                            |
| 6   | `SuperWallpaper.smali`                                  | Raise the three pause delays from 5000 ms to `0x7fffffff` so Unity is not paused while visible.         |

The hard-coded 2 s pause on screen-off and the visibility path are untouched, so
the scene still stops when the display is off or the wallpaper is hidden.

### Notes / limitations

- The unlock transition starts when SystemUI sends `ACTION_USER_PRESENT`, which
  is after the unlock animation finishes. The earlier `keyguardgoingaway`
  signal is permission-gated on Android 16+, so a normal app cannot start the
  wallpaper transition sooner.
- Raising the pause delays means the scene keeps rendering while the wallpaper
  is visible. Screen-off and hidden-wallpaper paths still pause.
- No version bump is included in the patch.
- This patch was generated using AI as I don't specialize in this type of
  programming. However, it is tested on my personal device.

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
