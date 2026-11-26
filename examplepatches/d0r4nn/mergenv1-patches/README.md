<div align="center">

# MergenV1 Patches

**Real-time Liquid Glass (`Kyant0`) & Swiss-Kinetic Obsidian UI overhaul with a 120Hz physical spring engine for TikTok & TikTok You** — *built for use with Morphe.*

[![Android 13+](https://img.shields.io/badge/Android-13%2B%20(API%2033%2B)-000000?style=flat-square&logo=android&logoColor=white)](https://developer.android.com)
[![License: GPLv3](https://img.shields.io/badge/License-GPLv3-000000?style=flat-square)](LICENSE)
[![Languages: EN / TR](https://img.shields.io/badge/UI%20Language-EN%20%2F%20TR%20Auto-000000?style=flat-square)](#-localization--zero-lock-access)
[![Compatible with Morphe](https://img.shields.io/badge/Compatible%20with-Morphe-000000?style=flat-square)](https://morphe.software)

<br>

<a href="https://morphe.software/add-source?github=d0r4nn/mergenv1-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="52">
</a>

<br><br>

Add manually in **Morphe Manager** / **Morphe Desktop**: `https://github.com/d0r4nn/mergenv1-patches`

</div>

---

## 🎯 Supported Apps — Stock TikTok & TikTok You

| Target App | Package Name | Status | Notes |
| --- | --- | --- | --- |
| **Stock TikTok** | `com.zhiliaoapp.musically` | ✅ Verified (`47.4.3`) | Full UI, gestures, 120Hz springs & Danmaku overlays |
| **TikTok You** | `com.zhiliaoapp.musically` | ✅ Verified (`47.4.3`) | Auto-detects `Z.sf` and surfaces a **`TT YOU`** shortcut next to **`MERGENV1`** in Settings |
| **TikTok (Asia)** | `com.ss.android.ugc.trill` | 🧪 Experimental | Compatible host bootstrap hook (Android 13+) |

> **Stacking on top of TikTok You:** Because MergenV1 injects cleanly via a single post-`super.onCreate()` hook inside `AwemeHostApplication` and isolates all runtime classes under `com.sarp.*`, you can patch **either a clean stock TikTok APK or an already-patched TikTok You APK** without class collisions or broken settings.

---

## ✨ What Changes Inside the App?

### 1. Dual Theme Architecture (Instant Live Switch)
- **Kyant0 Liquid Glass:** Custom AGSL `RuntimeShader` refractive pill navigation bar, dynamic edge dispersion lens (toggleable), frosted glass bottom sheets, and live backdrop capture optimization at 120Hz.
- **Mergen Swiss-Kinetic Obsidian:** Zero-radius `0dp` brutalist black-and-white panels, 1px hairline dividers, high-contrast inverted CTAs, and monospace telemetry typography.

### 2. 120Hz Spring Animations 2.0 & Animation Profiles
- Driven by a centralized `Choreographer` spring solver (`MergenSpringEngine`) with live mid-flight interruption, velocity handoff, momentum projection, and boundary rubber-banding.
- **3 Selectable Profiles in Settings:** `FLUID` (Apple-style silky overshoot), `SNAPPY` (tight high-response feel), and `REDUCED` (accessible gentle fades, zero blur).

### 3. Gestures, Radial Menu & Panels
| Action | Gesture / Trigger | Result |
| --- | --- | --- |
| **Quick Controls Sheet** | Swipe **UP** from bottom bar | Volume & brightness glass sliders, Clean Screen toggle, Auto-Scroll, instant theme flip |
| **Creator Peek Drawer** | Swipe **LEFT** from creator avatar | Right-docked creator stats (`Following / Followers / Likes / Videos`), Bio, Follow, Share, Sound, `@Copy`, Not Interested |
| **Radial Action Menu** | **Long-press** center of video | 6-node rotary dial (Like, Bookmark, Share, Download, Speed, Clean Screen) with magnetic hub lean & haptic snap |
| **Kinetic Seekbar & Ring** | Above bar / Top-right corner | Elastic Kyant0 scrub slider + live player telemetry ring (auto-hides during comment sheets) |
| **Dynamic Notch Alerts** | Front camera punch-hole | Zero-footprint alerts that bloom directly from your calibrated camera position |
| **Danmaku Comments** | Top overlay lanes | Live scrolling video comments with `LOW / MID / HIGH` density & **1:1 reversible finger scrub** on vertical feed swipes |
| **MergenV1 Settings** | App Settings → `MERGENV1` pill | Animated Welcome onboarding on first tap + full live customization panel |

---

## 🌐 Localization & Zero-Lock Access
- **Immediate Full Access:** No mandatory login gate — every MergenV1 visual, gesture, and animation feature works out of the box. Optional **MergenCore** account sign-in is available inside Settings.
- **Smart Language Detection (`AUTO / EN / TR`):** Defaults to **English** globally, switches automatically to **Turkish** when the device/region/timezone is Turkey, and includes an instant in-app **`OTO / EN / TR`** override in Settings.

---

## 📱 Requirements
- **Android 13 (API 33) or higher** — required for hardware AGSL `RuntimeShader` & `RenderEffect` motion blur.
- **Morphe Manager** or **Morphe Desktop** (`v2.x+`).

---

## 🩹 Patches list

<!-- PATCHES_START -->
> **[v1.0.0](https://github.com/d0r4nn/mergenv1-patches/releases/tag/v1.0.0)**&nbsp;&nbsp;&middot;&nbsp;&nbsp;`main`&nbsp;&nbsp;&middot;&nbsp;&nbsp;**2 patches** across **2 apps**&nbsp;&nbsp;&middot;&nbsp;&nbsp;[Full details](PATCHES.md)

| # | App | Patches | Version | Package |
|---|---|---|---|---|
| 1 | <img src="https://publicmetadata.co.uk/com.zhiliaoapp.musically" width="24" height="24" alt=""> [**TikTok**](PATCHES.md#tiktok-comzhiliaoappmusically) | 1 | `47.4.3` | [`com.zhiliaoapp.musically`](https://play.google.com/store/apps/details?id=com.zhiliaoapp.musically) |
| 2 | <img src=".github/assets/blank-app-icon.svg" width="24" height="24" alt=""> [**TikTok (Asia)**](PATCHES.md#tiktok-asia-comssandroidugctrill) | 1 | — | [`com.ss.android.ugc.trill`](https://play.google.com/store/apps/details?id=com.ss.android.ugc.trill) |
<!-- PATCHES_END -->

---

## 🛠️ Building locally

```bash
./gradlew :patches:buildAndroid
```

Compiled `.mpp` bundles are generated under `patches/build/libs/patches-*.mpp` and can be applied directly via [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop) or [Morphe Manager](https://github.com/MorpheApp/morphe-manager).

## 📜 License

MergenV1 Patches are licensed under the [GNU General Public License v3.0](LICENSE).
