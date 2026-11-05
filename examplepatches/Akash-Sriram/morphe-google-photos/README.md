# Morphe Google Photos (MGP)

Morphe patches for **Google Photos**, derived from [RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced), adding Pixel feature spoofing, GmsCore/MicroG support, in-app flag controls (referencing [polodarb/GMS-Flags-Reborn](https://github.com/polodarb/GMS-Flags-Reborn)), DCIM folder backup control (referencing [RevealedSoulEven/XposedPhotosFIX](https://github.com/RevealedSoulEven/XposedPhotosFIX)), and built-in Toolkit utilities (referencing [xob0t/Google-Photos-Toolkit](https://github.com/xob0t/Google-Photos-Toolkit)).

---

## 🚀 Key Features & Enhancements

### 1. 🔄 Dynamic In-App Backup Profiles & Video Boost Passthrough
Easily switch backup and identity profiles directly from **Morphe Settings $\rightarrow$ Backup Storage Profile** without recompiling or patching:
* **Auto-Sync Mode (Recommended)**: Dynamically maps Original Quality $\rightarrow$ **Pixel XL** (unmetered Original Quality) and Storage Saver $\rightarrow$ **Pixel 5** (unmetered Storage Saver). Automatically synchronizes device profiles when changing backup quality in Photos settings.
* **Google Pixel XL**: Forced unmetered Original Quality backup. Quality selector in Google Photos is locked to Original Quality to prevent accidental quota leakage.
* **Google Pixel 5**: Forced unmetered Storage Saver backup.
* **Original Device (Disabled)**: Temporarily disables device spoofing and restores the physical hardware's authentic identity (`Build.MODEL`, `Build.DEVICE`, etc.).
  * **Video Boost Eligible**: Allows users on real Pixel devices (Pixel 8 Pro, 9 Pro) to trigger server-side **Video Boost** and **Night Sight Video** processing in Google Cloud without needing two separate app installations.
  * **Full Backup Control**: Re-enables all 3 authentic Google Photos backup quality tiers (**Original Quality**, **Storage Saver**, **Express**).
* **Patch-Level Profile Selection (Minimal Builds)**: The `Spoof features` patch provides a patch-level option (`profile`: `auto`, `pixel-xl`, `pixel-5`). Users patching a minimal build without the Toolkit / Flag Manager can select their desired spoof profile right from initial installation.

---

### 2. ⚡ Bytecode-Level Device Spoofing (Android 12 – 16)
* **Direct Smali SGET Replacement**: Injects `invoke-static` calls directly at the smali bytecode level for identity fields (`Build.MODEL`, `Build.DEVICE`, `Build.PRODUCT`, `Build.FINGERPRINT`, `Build.MANUFACTURER`, `Build.BRAND`). Bypasses Android 12+ reflection blocks that throw `IllegalAccessException` on `static final` fields, eliminating account quota leakage.
* **Codec & Hardware Isolation**: Excludes media playback, ExoPlayer, and video decoder classes (`Landroidx/media`, `Lcom/google/android/exoplayer2`, `/videoplayer/`, `/codec/`) from spoofing to preserve hardware-accelerated 4K/60fps/HDR video decoding and prevent playback stuttering.

---

### 3. 🎨 Dedicated Material 3 Morphe Settings Screen
Replaced legacy floating overlays with a native, full-screen Material 3 settings interface accessible via the profile menu or app settings:
* **Dynamic Material You Theming**: Follows system and AMOLED dark mode palette (`Theme.get(activity)`).
* **Organized Modules**: Clean categorization for Backup Profiles, Phenotype Flags, Toolkit, AI Models, Creations Registry, and System Diagnostics.

---

### 4. 🧪 In-App Phenotype Flag Manager & Curated Presets
* **Live Search & Filtering**: Inspect, search, and toggle hundreds of experimental Google Photos redesigns and feature flags directly inside the app without root or PC.
* **One-Tap Curated Presets**: Quickly apply vetted flag bundles including **Ultra Pixel Experience**, **Modern UI & Bento Layout**, **Floating Navigation Bar**, and **Cinematic Wallpapers**.
* **Backup & Reset**: Export/import flag configurations or reset all overrides to stock defaults with one tap.

---

### 5. 🛠️ Native Toolkit & Media Utilities
* **Google Photos Toolkit Integration**: Built-in batch creation downloader, local deduplication, and media filtering tools.
* **Storage & Cache Cleaner**: Purges thumbnail memory cache and transient download artifacts to reclaim device storage.
* **Creations Save Registry Manager**: Reset download and save tracking for Made-For-You (MFY) cards and Story highlights so previously saved creations can be re-downloaded and restored.

---

### 6. 🤖 On-Device AI & Machine Learning Model Manager
* **AI Model Inspector & Seeder**: Verify, download, and seed on-device AI assets for **Gemini Nano**, **Magic Eraser**, **Segmentation Filters**, and **Portrait Light**.
* **0MB MDD Bypass**: Bypasses the 0MB Mobile Data Download check, preventing AI asset downloads from stalling on unmetered or non-Pixel devices.

---

### 7. 📁 DCIM & Selective Folder Backup Control
* **Camera Folder Independence**: Removes the forced always-on backup constraint on `DCIM/Camera`, granting individual toggle switches for every device folder under **Collections $\rightarrow$ On this device**.
* **Local Creation Interceptor**: Automatically saves Made-For-You creation cards and Story highlights directly to `DCIM/Google Photos` with original EXIF capture timestamps, allowing Google Photos to back them up locally under the unmetered Pixel quota (**0 bytes quota used**).

---

### 8. 🌐 Universal GmsCore / MicroG Account & Avatar Bridge
* **Full Non-Root MicroG Support**: Works seamlessly without proprietary Google Play Services.
* **Synchronized Avatar Bridge**: Renders high-resolution Google Account profile pictures across all UI components:
  * Main Toolbar Account Particle Disc (`og_apd_internal_image_view`)
  * Bento Center Large Avatar (`og_bento_selected_account_avatar`)
  * Collapsed & Expanded Account Switcher Rows (`og_bento_header_account_avatar`)

---

### 9. 📊 Built-In Diagnostics & Real-Time Logging
* **Live Logcat Stream**: Read real-time Google Photos and Morphe logcat output directly inside the app.
* **Diagnostic Bundle Export**: Generate and share complete debug reports with Phenotype flag dumps, active storage policies, and device parameters for seamless troubleshooting.

---

## 🩹 Patches List

<!-- PATCHES_START EXPANDED -->
> **[v1.17.10](https://github.com/Akash-Sriram/morphe-google-photos/releases/tag/v1.17.10)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;8 patches total
<details open>
<summary>📦 Google Photos&nbsp;&nbsp;•&nbsp;&nbsp;8 patches</summary>
<br>

**🎯 Supported versions:**

| 7.99.0.1007655401 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description |
|----------|----------------|
| [AMOLED dark theme](#amoled-dark-theme) | Makes Google Photos dark surfaces true black while keeping light mode untouched. |
| [Custom branding](#custom-branding) | Replaces the Google Photos app name, launcher icon, and in-app logos with custom branding (violet / teal / indigo / slate pinwheel, hand-drawn style). |
| [DCIM & backup control](#dcim-backup-control) | Disables always on backup for the Camera and other DCIM folders, allowing individual folder control, and exports memory collages and creations to DCIM/Google Photos for quota-free backup. |
| [Flag manager & Toolkit](#flag-manager-toolkit) | Enables an in-app flag manager and Morphe toolkit in Photos Settings to toggle experimental UI redesigns, video editor tools, and feature flags. |
| [GmsCore support](#gmscore-support) | Enables GmsCore / MicroG support and renames package for non-root installs. Leave enabled for standard non-root installs; disable only for rooted system installs using genuine Google Play Services. |
| [Media engine & AI fixes](#media-engine-ai-fixes) | Bypasses the 0MB Mobile Data Download check for AI models and fixes font loading across Stories and UI to prevent blank text and fallback fonts. |
| [Official package name](#official-package-name) | Retains the official package name (com.google.android.apps.photos) instead of renaming to app.morphe.android.apps.photos and disables Play Store updates by setting the version code to maximum to prevent automatic overwriting. This is strictly for non-root users whose devices do not have Google Photos preinstalled by the OEM. |
| [Spoof features](#spoof-features) | Spoofs the device to enable Google Pixel exclusive features, including unlimited storage. |

</details>

<!-- PATCHES_END -->

---

## ⚠️ Limitations & Server-Side Nuances

1. **Memories / Story Creations & Made-For-You (MFY)**:
   * Saving creations directly through cloud rendering triggers server-side processing on Google's backend, which bypasses on-device spoofing and debits Google Drive storage quota.
   * **Solution**: The `DCIM & backup control` patch intercepts creation saves and downloads them locally to `DCIM/Google Photos` with embedded EXIF timestamps. Google Photos then backs them up locally through the unmetered Pixel pipeline at **0 bytes quota**.

2. **Video Boost & Night Sight Video (Pixel 8 Pro / 9 Pro)**:
   * Google's data-center GPU clusters process Video Boost uploads only for verified eligible devices. Spoofing Pixel XL disables Video Boost cloud processing.
   * **Solution**: Switch to the **Original Device (Disabled)** profile in Morphe Settings to upload Video Boost raw files with your physical hardware identity. Once processed, switch back to **Pixel XL** to back up the resulting video permanently for free.

3. **"Free Up Space" Calculation**:
   * The percentage on the "Free up space" screen (*"Device storage: X% used"*) displays **total internal storage across the entire phone (`/data`)** (System + Apps + Caches + Photos), measured directly via Android's `StatFs`. It is not calculated against a spoofed Pixel device capacity.

---

## 📦 Ready-to-Install Builds

Pre-built and signed APKs are compiled automatically and available at **[Akash-Sriram/GooglePhotos-Patched](https://github.com/Akash-Sriram/GooglePhotos-Patched/releases)**.
