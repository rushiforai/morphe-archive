# southstar21's Patches

[Morphe](https://morphe.software) patches by southstar21.

## How to use

Add this repo as a patch source in Morphe Manager:

https://morphe.software/add-source?github=southstar21dev/southstar21-patches

Or download `patches-x.y.z.mpp` from [Releases](https://github.com/southstar21dev/southstar21-patches/releases) and add it as a local file.

Patched apps are signed with a different key, so the store version has to be uninstalled first.

> [!WARNING]
> Some apps' terms don't allow modified clients. Use these patches at your own risk.

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.3.2](https://github.com/southstar21dev/southstar21-patches/releases/tag/v1.3.2)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;3 patches total
<details open>
<summary>📦 Instagram&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 453.0.0.57.79 | 439.0.0.37.89 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Bypass signature check](#bypass-signature-check) | Stops Instagram rejecting apps by their signature, which a patched app no longer matches. |  |
| [Liquid Glass navigation bar](#liquid-glass-navigation-bar) | Turns the bottom tab bar into a floating iOS 26 style Liquid Glass pill with live background blur and edge refraction. Refraction needs Android 13+, blur needs Android 12+, older versions get a tinted pill. | • Blur radius<br>• Refraction strength<br>• Extend content behind bar |
| [Remove build expired popup](#remove-build-expired-popup) | Removes the popup that appears after a while, when the app version ages. |  |

</details>

<!-- PATCHES_END -->

## Instagram

Patch the Instagram **APKM** bundle from APKMirror (supported versions are listed above).

### Liquid Glass navigation bar

Brings Instagram's iOS 26 Liquid Glass design to Android, matched against screen recordings of the iOS app.

- **Floating glass tab bar**: a frosted pill with live background blur, a subtle refracting rim and a grey capsule behind the selected tab.
- **Shrinks while scrolling**: scrolling down scales the whole bar down (all tabs stay visible and tappable), scrolling up restores it.
- **Gliding selection**: drag along the bar to slide the selection between tabs as clear glass, with a haptic tick per tab; release to open the tab underneath.
- **Adaptive tint**: the glass frosts more when the content behind it would make the icons hard to read, and turns dark on Reels and in dark mode.
- Taps, double taps and long presses on the tabs still go to Instagram untouched.

Android 12 gets blur without refraction, older versions get a translucent tinted pill.

| Option | Default | |
|---|---|---|
| Blur radius | 12 dp | How frosted the glass is (0 to 40). |
| Refraction strength | 60 | How strongly the edge bends what's behind it (0 to 100). |
| Extend content behind bar | on | Lets feeds scroll under the bar so there's something to see through the glass. |

How it works: a hook in `InstagramMainActivity.onWindowFocusChanged` (an unobfuscated method, so it should survive app updates) installs the extension, which finds the tab bar by resource name and draws it with a background drawable that re-records the views behind it into a `RenderNode` each frame, then runs that through a blur and an AGSL refraction shader.

## Repository layout

```
patches/src/main/kotlin/app/southstar21/patches/
  <app>/
    shared/              Compatibility (app versions) and fingerprints shared by the app's patches
    misc/extension/      sharedExtensionPatch: bundles extensions/<app>.mpe into the app
    layout/<patch>/      UI patches (one folder per patch: the patch + its Fingerprints.kt)
    misc/<patch>/        Everything else
extensions/<app>/        Java code injected into the app, one Gradle module per app
  src/main/java/app/southstar21/extension/<app>/<patch>/
```

### Adding a patch

1. **New app?** Create `extensions/<app>/` (copy `extensions/instagram/build.gradle.kts` and change the name and namespace), plus `patches/.../<app>/shared/Constants.kt` with its `Compatibility` and `misc/extension/SharedExtensionPatch.kt`.
2. Add the patch under `patches/.../<app>/layout/<patch>/` or `misc/<patch>/`, with `compatibleWith(...)` and, if it runs extension code, `dependsOn(sharedExtensionPatch)`.
3. Put its extension code in `extensions/<app>/src/main/java/app/southstar21/extension/<app>/<patch>/`.
4. Commit with a [conventional commit](https://www.conventionalcommits.org) message. Pushing `feat: ...` or `fix: ...` to `main` publishes a release automatically.

#### Instagram patches and the settings menu

Instagram gets a **southstar21 Patches** button on the profile page (next to Threads and ☰) that opens a menu where each included patch can be switched on/off and configured.

To make a new Instagram patch show up there:

1. In its extension class, add `public static boolean isIncluded() { return false; }` and a `public static final PatchSettings SETTINGS = new PatchSettings("<key>", "<Title>", "<description>", <Class>::isIncluded, ...settings)`, using `BooleanSetting` / `IntSetting` from `app.southstar21.extension.instagram.settings`. Read values with `.get()`; mark settings `requiresRestart` if they're only read at startup.
2. Add `<Class>.SETTINGS` to the list in `settings/Settings.java`.
3. If the patch needs the main activity, start it from `InstagramHooks.onMainActivityWindowFocusChanged` behind `if (<Class>.SETTINGS.isActive())`.
4. In the Kotlin patch, call `markPatchIncluded("L<extension class>;")` in `execute`. Patch options can feed setting defaults by having the patch overwrite a static method the setting's default calls (see `LiquidGlassNavBarPatch`).

## Building

```
./gradlew :patches:buildAndroid
```

Needs a GitHub token with `read:packages` (for the Morphe Gradle plugin), see the
[Morphe setup docs](https://github.com/MorpheApp/morphe-patcher/blob/main/docs/2_1_setup.md#-prepare-the-environment).

Based on the [Morphe patches template](https://github.com/MorpheApp/morphe-patches-template). Licensed under GPLv3.
