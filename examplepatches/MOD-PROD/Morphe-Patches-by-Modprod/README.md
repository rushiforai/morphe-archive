<div align="center">

# TizenTube MOD Patches

**Ad-free, renamed and re-skinned TizenTube on Android TV — patched on-device with Morphe.**

[![Release](https://img.shields.io/github/v/release/MOD-PROD/tizentube-mod-patches?style=for-the-badge&color=e60012)](https://github.com/MOD-PROD/tizentube-mod-patches/releases/latest)
[![Build](https://img.shields.io/github/actions/workflow/status/MOD-PROD/tizentube-mod-patches/release.yml?style=for-the-badge&label=build)](https://github.com/MOD-PROD/tizentube-mod-patches/actions)
[![License](https://img.shields.io/badge/license-GPLv3-blue?style=for-the-badge)](LICENSE)

<img src="branding-src/banner_master.png" alt="Android TV launcher banner" width="720">

<img src="branding-src/icon_master.png" alt="Application icon" width="240">

</div>

---

## ✨ Features

- 🚫 **No ads** — ad breaks are removed from YouTube's responses before the app ever sees them.
- 🧹 **No sponsored tiles** — promoted videos and the home masthead disappear from feeds and search.
- ⏩ **Playback speed that sticks** — the speed you pick is kept across videos and restarts.
- 🎨 **New launcher artwork** — icon *and* Android TV banner replaced (the TV home screen shows the banner).
- ✏️ **Rename TizenTube** — a custom single-line name.
- 👯 **Clone install** — keep the original TizenTube installed next to the modded one.

## 🎯 Supported apps

| App | Package | Version |
|---|---|---|
| TizenTube Cobalt | `io.gh.reisxd.tizentube.cobalt` | **2.0.3** (single APK: `cobalt-arm.apk` / `cobalt-arm64.apk`) |

## 📦 Patches

<!-- PATCHES_START EXPANDED -->
> **[v1.5.0](https://github.com/MOD-PROD/Morphe-Patches-by-Modprod/releases/tag/v1.5.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;4 patches total
<details open>
<summary>📦 TizenTube&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

**🎯 Supported versions:**

| 2.0.3 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Change app name](#change-app-name) | Changes the app name shown on the launcher and in the app list. | • App name |
| [Clone app](#clone-app) | Changes the package name so the patched app can be installed next to the original TizenTube. Default package name: mod.android.youtube.tv. | • Package name<br>• Update permissions<br>• Update providers |
| [Inject Adblocker Userscript](#inject-adblocker-userscript) | Injects a JavaScript userscript into the YouTube TV web app running in Cobalt. The script removes ad placements from InnerTube responses before the app reads them. | • Custom userscript file |
| [MOD Icon and Banner](#mod-icon-and-banner) | Replaces the app icon and the Android TV launcher banner with YouTube artwork. On Android TV the launcher shows the banner, so both are replaced. | • Replace icon<br>• Replace banner<br>• Custom icon file<br>• Custom banner file |

</details>

<!-- PATCHES_END -->

### Options at a glance

| Patch | Default | Options |
|---|:---:|---|
| **Inject Adblocker Userscript** | ✅ | `userscriptFile` — path to your own `.js` (default `/storage/emulated/0/Download/adblock.user.js`). If the file does not exist, the bundled script is used. |
| **MOD Icon and Banner** | — | `replaceIcon`, `replaceBanner`, `customIconFile` (PNG carré), `customBannerFile` (PNG 16:9) |
| **Change app name** | — | `appName` — default `YouTube Premium` |
| **Clone app** | — | `packageName` — default `mod.android.youtube.tv`; `updatePermissions`, `updateProviders` |

## 🚀 Install

1. Install **Morphe Manager** from [morphe.software](https://morphe.software).
2. Add this patch source — open on the device running Morphe Manager:
   **https://morphe.software/add-source?github=MOD-PROD/tizentube-mod-patches**
3. Download the original TizenTube Cobalt **2.0.3** APK from the [TizenTube releases](https://github.com/reisxd/TizenTubeCobalt/releases).
4. In Morphe Manager, pick the APK, select the patches, adjust the options, and patch.
5. Install the result on your Android TV.

Without *Clone app*, uninstall any previous patched build first (different signature).

## 🛠️ How it works

TizenTube Cobalt is not a WebView app: it runs the YouTube TV web app inside **Cobalt**, a Chromium-based engine. There is no native ad code to patch, so the adblock patch:

1. writes the userscript into the APK as `assets/tizentube-mod/adblock.user.js`;
2. adds a call in `CobaltActivity.onCreate()` to a small Java extension;
3. the extension waits for the page, then runs the script through Cobalt's own `evaluateJavaScript` JNI entry point — in the page's main world, so it can hook `JSON.parse`, `fetch` and `XMLHttpRequest`.

The script is re-injected for the first minutes (early documents are replaced by navigations) and guards itself, so repeats are no-ops. Check it on device with:

```
adb logcat -s TizenTubeMod
```

## 🎨 Custom artwork

Artwork lives in `patches/src/main/resources/tizentube/branding/`:

| File | Size | Replaces |
|---|---|---|
| `icon/mdpi.png` … `icon/xxxhdpi.png` | 80 → 320 px | `@mipmap/ic_app` |
| `banner/mdpi.png` … `banner/xxxhdpi.png` | 160×90 → 640×360 | `@drawable/app_banner` (320×180 = Android TV reference) |

To use custom artwork, enable **MOD Icon and Banner** and enter paths in **Custom icon file** and/or **Custom banner file** (for example `/storage/emulated/0/Download/my-icon.png` and `/storage/emulated/0/Download/my-banner.png`). The paths must be readable by the patching process. Leave a field empty to use the bundled image. Custom icon PNGs must be square; banners must be 16:9. The patch resizes each custom image for the five Android density buckets. An invalid or inaccessible custom file stops patching with an error.

The bundled PNG files are ready to use at all five Android densities. `branding-src/icon_master.png` and `branding-src/banner_master.png` are the unmodified source images. No generator or MOD badge overlay is used.

The patch reads `android:icon` / `android:banner` from the manifest, so it keeps working if a release renames the resources.

## 🧩 Custom userscript

Put your script at `/storage/emulated/0/Download/adblock.user.js` (or set another path in the option). Rules:

- plain **ES5** (no `let`, `const`, arrow functions);
- wrap it in `(function(){ ... })();` and start with a guard: `if (window.__myScript) return; window.__myScript = true;`
- it **replaces** the bundled script — start from [`adblock.user.js`](patches/src/main/resources/tizentube/userscript/adblock.user.js) to keep ad blocking.

## 🏗️ Build

Morphe artifacts are hosted on GitHub Packages; any GitHub account works with a classic token (`read:packages`):

```properties
# ~/.gradle/gradle.properties
gpr.user=YOUR_GITHUB_USERNAME
gpr.key=ghp_xxx
```

```
./gradlew buildAndroid
# → patches/build/libs/patches-<version>.mpp
```

Releases are automatic: every `feat:` / `fix:` commit on `main` builds and publishes a new `.mpp` (semantic-release).

## 📁 Project layout

```
patches/src/main/kotlin/app/gonzo/patches/
├── ads/        Inject Adblocker Userscript + fingerprints
├── branding/   MOD Icon and Banner, Change app name
├── clone/      Clone app
└── shared/     Compatibility (TizenTube 2.0.3)
patches/src/main/resources/tizentube/
├── branding/   icon + banner, one PNG per density
└── userscript/ adblock.user.js
extensions/extension/   Java code added to the APK (userscript injector)
branding-src/           original master images (no generator)
```

## ⚖️ License

GPLv3 — see [LICENSE](LICENSE) and [NOTICE](NOTICE). Built with the [Morphe](https://morphe.software) patcher; *Clone app* is adapted from the official Morphe patches.

Not affiliated with YouTube, Google or the TizenTube project. Use it with apps you are allowed to modify.
