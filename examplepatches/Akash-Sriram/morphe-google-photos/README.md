# Morphe Google Photos (MGP)

Morphe patches for **Google Photos**, derived from [RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced), adding Pixel feature spoofing, GmsCore/MicroG support, in-app flag controls, and offline neural model delivery.

---

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.10.1](https://github.com/Akash-Sriram/morphe-google-photos/releases/tag/v1.10.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;11 patches total
<details open>
<summary>📦 Google Photos&nbsp;&nbsp;•&nbsp;&nbsp;11 patches</summary>
<br>

**🎯 Supported versions:**

| 7.92.0.977185651 | 7.93.0.982110057 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description |
|----------|----------------|
| [AMOLED dark theme](#amoled-dark-theme) | Makes Google Photos dark surfaces true black while keeping light mode untouched. |
| [Account avatar](#account-avatar) | Loads and displays account profile avatars across the top toolbar, Bento menu, and account switcher. |
| [Change to official package name](#change-to-official-package-name) | Keeps the official package name (com.google.android.apps.photos) instead of renaming to app.morphe.android.apps.photos. Enable this only if Google Photos is uninstalled via ADB or installed as a system app with root. When selecting this, also select 'Disable Play Store updates'. |
| [Custom Morphe branding](#custom-morphe-branding) | Replaces the Google Photos icon and in-app logos with Morphe branding (violet / teal / indigo / slate pinwheel, hand-drawn style). |
| [Disable Play Store updates](#disable-play-store-updates) | [Experimental] Disables Play Store updates by setting the version code to the maximum allowed. This patch may cause unexpected issues with some apps and does not work if the app is installed by root mounting |
| [Enable DCIM folders backup control](#enable-dcim-folders-backup-control) | Disables always on backup for the Camera and other DCIM folders, allowing you to control backup for each folder individually. This will make the app default to having no folders backed up. |
| [Enable Phenotype flag manager](#enable-phenotype-flag-manager) | Enables an in-app flag manager in Photos Settings to toggle curated experimental UI redesigns, video editor tools, and feature flags. |
| [Fix memory style font loading](#fix-memory-style-font-loading) | Redirects font loading across Stories and UI to authentic Google Fonts with local caching and CDN downloading, fixing fallback fonts and blank text in Memories. |
| [GmsCore support](#gmscore-support) | Allows the app to work without root by using a different package name when patched using a GmsCore instead of Google Play Services. |
| [Model Readiness Gates](#model-readiness-gates) | Bypasses the 0MB Mobile Data Download check for AI models and reports them as loaded. |
| [Spoof features](#spoof-features) | Spoofs the device to enable Google Pixel exclusive features, including unlimited storage. |

</details>

<!-- PATCHES_END -->

---

## 🚩 Curated Phenotype Flags

Experimental features toggleable in **Photos Settings &rarr; Phenotype Flags**:

<details>
<summary>📦 <b>Curated Flags Reference (25 Flags)</b></summary>
<br>

| Category | Feature | Description |
|:---|:---|:---|
| **Photo & Video Editor** | **Tap/Circle Select** | Tap, circle, or brush selection gestures in Magic Editor |
| | **AI Enhance V2** | Multi-option AI photo enhancement presets |
| | **Moods Edit Presets** | Adaptive creative edit presets with hold-to-compare |
| | **New Video Editor & AI** | Redesigned video editor layout with AI-powered video presets |
| **Navigation & Tabs** | **Collections V2 Layout** | Collections Shelves V2 redesigned grouped layout (`0`=Off, `2`=On) |
| | **Collections V2 Content** | Modern content card views inside Collections shelves |
| | **Reels Videos Tab (V1 & V2)** | Full-screen vertical scrollable video feed tab and gesture navigation |
| **AI Assistant & Search** | **"On this device" Filter** | Quick top-bar filter button to show local on-device media |
| | **Ask Photos AI** | Conversational Gemini AI search |
| **Media, Grid & Memories** | **Floating UI** | Floating bottom navigation bar and `[ Today ]` date capsule pill |
| | **Video Seek Scrubbing** | High-speed video thumbnail scrubbing preview bar |
| | **Document Scanner Crop** | Perspective document scanner cropping controls |
| | **Motion Stabilizer** | Motion photo stabilizer and floating playback pill |
| | **Story Cutouts & Scrapbook** | 3D subject pop-out cutout scrapbook animations and templates in Memories |
| | **MemoryCard Styles & Templates** | Graphic styling, borders, textures, and scrapbook frames |
| | **Retrospective Themes** | On-device "N Years Ago" card generator and "Over the Years" scrapbook theme |
| | **Collage Engine** | Multi-up collage layout, scrapbook generation engine, and transitions |
| | **Skottie CDN Bundle** | Animation CDN asset version for cutout animations |

</details>

---

Ready-to-install builds patched with this bundle are available at **[Akash-Sriram/GooglePhotos-Patched](https://github.com/Akash-Sriram/GooglePhotos-Patched/releases)**.
