# Morphe Google Photos (MGP)

Morphe patches for **Google Photos**, derived from [RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced), adding Pixel feature spoofing, GmsCore/MicroG support, in-app flag controls, and offline neural model delivery.

---

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.5.0](https://github.com/Akash-Sriram/morphe-google-photos/releases/tag/v1.5.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;9 patches total
<details open>
<summary>📦 Google Photos&nbsp;&nbsp;•&nbsp;&nbsp;9 patches</summary>
<br>

**🎯 Supported versions:**

| 7.92.0.977185651 | 🧪&nbsp;7.93.0.982110057 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Account avatar](#account-avatar) | Loads and displays account profile avatars across the top toolbar, Bento menu, and account switcher. |  |
| [Change package name](#change-package-name) | Renames the package to app.morphe.android.apps.photos to allow non-root installation alongside pre-installed Google Photos. Deselect this if Google Photos is not installed as a system app on your device to keep the original package name. | • Package name |
| [Disable Play Store updates](#disable-play-store-updates) | [Experimental] Disables Play Store updates by setting the version code to the maximum allowed. This patch may cause unexpected issues with some apps and does not work if the app is installed by root mounting |  |
| [Enable DCIM folders backup control](#enable-dcim-folders-backup-control) | Disables always on backup for the Camera and other DCIM folders, allowing you to control backup for each folder individually. This will make the app default to having no folders backed up. |  |
| [Enable Phenotype flag manager](#enable-phenotype-flag-manager) | Enables an in-app flag manager in Photos Settings to toggle curated experimental UI redesigns, video editor tools, and feature flags. |  |
| [Fix memory style font loading](#fix-memory-style-font-loading) | Redirects Skottie animation font loading to system fonts for mod package compatibility, fixing blank text and cutout crashes in Memories. |  |
| [GmsCore support](#gmscore-support) | Allows the app to work without root by using a different package name when patched using a GmsCore instead of Google Play Services. |  |
| [Model Readiness Gates](#model-readiness-gates) | Bypasses the 0MB Mobile Data Download check for AI models and reports them as loaded. |  |
| [Spoof features](#spoof-features) | Spoofs the device to enable Google Pixel exclusive features, including unlimited storage. |  |

</details>

<!-- PATCHES_END -->

---

## 🚩 Curated Phenotype Flags

Built-in curated flags available directly inside **Photos Settings &rarr; Phenotype Flags** ([`PhotoFlagsRegistry`](file:///mnt/WindowsDrive/Users/akash/Downloads/Project/Morphe/test/extensions/shared/library/src/main/java/app/morphe/extension/shared/patches/flags/PhotoFlagsRegistry.java)):

<details>
<summary>📦 <b>Curated Flags Reference Table (25 Flags)</b></summary>
<br>

### 🎨 Photo & Video Editor (4 Flags)

| Flag Key | Feature / Title | Type | Default | Verified Function & Description |
|:---:|:---|:---:|:---:|:---|
| `45705305` | **Tap/Circle Select** | `BOOLEAN` | `true` | Tap, circle, or brush selection gestures in Magic Editor |
| `45683689` | **AI Enhance V2** | `BOOLEAN` | `true` | Multi-option AI photo enhancement presets |
| `45797840` | **Moods Edit Presets** | `BOOLEAN` | `true` | Adaptive creative edit presets with hold-to-compare |
| `45709528` | **New Video Editor & AI** | `BOOLEAN` | `true` | Redesigned video editor layout with AI-powered video presets |

### 🧭 Navigation & Tabs (4 Flags)

| Flag Key | Feature / Title | Type | Default | Verified Function & Description |
|:---:|:---|:---:|:---:|:---|
| `45762698` | **Collections V2 Layout** | `LONG` | `2L` | Collections Shelves V2 redesigned grouped layout (`0`=Off, `2`=On) |
| `45802110` | **Collections V2 Content** | `LONG` | `2L` | Modern content card views inside Collections shelves |
| `45752831` | **Reels Videos Tab (V1)** | `BOOLEAN` | `true` | Full-screen vertical scrollable Reels-style Videos feed tab |
| `45754546` | **Reels Videos Tab (V2)** | `BOOLEAN` | `true` | Explore tab transition and gesture navigation into video feed |

### 🤖 AI Assistant & Search (2 Flags)

| Flag Key | Feature / Title | Type | Default | Verified Function & Description |
|:---:|:---|:---:|:---:|:---|
| `45753590` | **"On this device" Filter** | `BOOLEAN` | `true` | Quick top-bar filter button to show local on-device media |
| `45724258` | **Ask Photos AI** | `BOOLEAN` | `true` | Conversational Gemini AI search (requires server-side account eligibility) |

### 🎞️ Media, Grid & Memories (15 Flags)

| Flag Key | Feature / Title | Type | Default | Verified Function & Description |
|:---:|:---|:---:|:---:|:---|
| `45743215` | **Date Capsule Pill** | `BOOLEAN` | `true` | Floating `[ Today ]` date capsule pill when scrolling photo grid |
| `45732792` | **Floating Navigation Bar** | `BOOLEAN` | `true` | Floating bottom navigation bar pill |
| `45683026` | **Video Seek Scrubbing** | `BOOLEAN` | `true` | High-speed video thumbnail scrubbing preview bar |
| `45353606` | **Document Scanner Crop** | `BOOLEAN` | `true` | Perspective document scanner cropping controls (`3606`) |
| `45694311` | **Motion Stabilizer** | `BOOLEAN` | `true` | Motion photo stabilizer and floating playback pill (`4311`) |
| `45659276` | **Story Cutouts (Pop-Out)** | `BOOLEAN` | `true` | Master 3D subject pop-out cutout scrapbook animations in Memories |
| `45477626` | **MemoryCard Styles** | `BOOLEAN` | `true` | Master MemoryCard graphic styling, borders, and scrapbook frames |
| `45785531` | **Pop-Out Templates** | `BOOLEAN` | `true` | 3D foreground motion and animation templates for cutouts |
| `45662994` | **MemoryCard Templates** | `BOOLEAN` | `true` | Dynamic scrapbook layout templates, textures, and themes |
| `45741031` | **N Years Ago Generator** | `BOOLEAN` | `true` | On-device "N Years Ago" retrospective graphic card generator |
| `45737826` | **Over the Years Theme** | `BOOLEAN` | `true` | "Over the Years" delightful scrapbook memory story theme |
| `45764779` | **Collage Engine** | `BOOLEAN` | `true` | Multi-up collage layout and scrapbook generation engine |
| `45659278` | **Collage Layout Support** | `BOOLEAN` | `true` | Multi-up collage layout animations and transitions |
| `45742883` | **Multi-up Capability** | `BOOLEAN` | `true` | Story multi-photo collage cards and cutout capability |
| `3999` | **Skottie CDN Bundle** | `LONG` | `118109605L` | Skottie Lottie animation CDN asset version for cutout animations |

</details>

---

## 📲 Pre-built APKs

Ready-to-install builds patched with this bundle are available at:
👉 **[Akash-Sriram/GooglePhotos-Patched](https://github.com/Akash-Sriram/GooglePhotos-Patched/releases)**

Download original untouched APKs from:
👉 **[Google Photos on APKMirror](https://www.apkmirror.com/apk/google-inc/photos/)**

---

For developer CLI recipes (building, releases, ADB, permissions, and models), see **[COMMANDS.md](COMMANDS.md)**.
