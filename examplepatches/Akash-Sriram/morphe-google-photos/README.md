# Morphe Google Photos (MGP)

Morphe patches for **Google Photos**, derived from [RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced), adding Pixel feature spoofing, GmsCore/MicroG support, in-app flag controls (referencing [polodarb/GMS-Flags-Reborn](https://github.com/polodarb/GMS-Flags-Reborn)), DCIM folder backup control (referencing [RevealedSoulEven/XposedPhotosFIX](https://github.com/RevealedSoulEven/XposedPhotosFIX)), and built-in Toolkit utilities (referencing [xob0t/Google-Photos-Toolkit](https://github.com/xob0t/Google-Photos-Toolkit)).

---

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.17.6](https://github.com/Akash-Sriram/morphe-google-photos/releases/tag/v1.17.6)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;8 patches total
<details open>
<summary>📦 Google Photos&nbsp;&nbsp;•&nbsp;&nbsp;8 patches</summary>
<br>

**🎯 Supported versions:**

| 7.99.0.1007655401 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description |
|----------|----------------|
| [AMOLED dark theme](#amoled-dark-theme) | Makes Google Photos dark surfaces true black while keeping light mode untouched. |
| [Custom Morphe branding](#custom-morphe-branding) | Replaces the Google Photos icon and in-app logos with Morphe branding (violet / teal / indigo / slate pinwheel, hand-drawn style). |
| [DCIM & backup control](#dcim-backup-control) | Disables always on backup for the Camera and other DCIM folders, allowing individual folder control, and exports memory collages and creations to DCIM/Google Photos for quota-free backup. |
| [Flag manager & Toolkit](#flag-manager-toolkit) | Enables an in-app flag manager and Morphe toolkit in Photos Settings to toggle experimental UI redesigns, video editor tools, and feature flags. |
| [GmsCore support](#gmscore-support) | Enables GmsCore / MicroG support and renames package for non-root installs. Leave enabled for standard non-root installs; disable only for rooted system installs using genuine Google Play Services. |
| [Media engine & AI fixes](#media-engine-ai-fixes) | Bypasses the 0MB Mobile Data Download check for AI models and fixes font loading across Stories and UI to prevent blank text and fallback fonts. |
| [Official package name](#official-package-name) | Retains the official package name (com.google.android.apps.photos) instead of renaming to app.morphe.android.apps.photos and disables Play Store updates by setting the version code to maximum to prevent automatic overwriting. This is strictly for non-root users whose devices do not have Google Photos preinstalled by the OEM. |
| [Spoof features](#spoof-features) | Spoofs the device to enable Google Pixel exclusive features, including unlimited storage. |

</details>

<!-- PATCHES_END -->

---

## ⚠️ Limitations & Workarounds

Saving auto-generated creations directly from **Memories / Stories** and the **Create tab (Made-For-You)** triggers cloud-side generation on Google's servers, which bypasses on-device Pixel spoofing and debits account storage.

- **Local Creation Downloader**: The `DCIM & backup control` patch intercepts the "Save" action and downloads creations directly to `DCIM/Google Photos`. Photos then backs them up locally through the unlimited Pixel pipeline at **0 bytes quota**.
- **EXIF Timestamp Preservation**: Embedded EXIF timestamps preserve original capture dates, keeping creations sorted chronologically in your main timeline.

---

Ready-to-install builds patched with this bundle are available at **[Akash-Sriram/GooglePhotos-Patched](https://github.com/Akash-Sriram/GooglePhotos-Patched/releases)**.
