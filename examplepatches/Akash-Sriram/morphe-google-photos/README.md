# Morphe Google Photos (MGP)

Morphe patches for **Google Photos**, derived from [RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced), adding Pixel feature spoofing, GmsCore/MicroG support, in-app flag controls, and offline neural model delivery.

---

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.13.4](https://github.com/Akash-Sriram/morphe-google-photos/releases/tag/v1.13.4)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;13 patches total
<details open>
<summary>📦 Google Photos&nbsp;&nbsp;•&nbsp;&nbsp;13 patches</summary>
<br>

**🎯 Supported versions:**

| 7.96.0.993165104 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description |
|----------|----------------|
| [AMOLED dark theme](#amoled-dark-theme) | Makes Google Photos dark surfaces true black while keeping light mode untouched. |
| [Account avatar](#account-avatar) | Loads and displays account profile avatars across the top toolbar, Bento menu, and account switcher. |
| [Change to official package name](#change-to-official-package-name) | Retains the official package name (com.google.android.apps.photos) instead of renaming to app.morphe.android.apps.photos. This is an exceptional option strictly for non-root users whose devices do not have Google Photos preinstalled by the OEM (such as custom ROMs or de-Googled devices). Root users do not need this (simply deselect GmsCore support instead). When selecting this, also enable 'Disable Play Store updates'. |
| [Custom Morphe branding](#custom-morphe-branding) | Replaces the Google Photos icon and in-app logos with Morphe branding (violet / teal / indigo / slate pinwheel, hand-drawn style). |
| [Disable Play Store updates](#disable-play-store-updates) | Disables Play Store updates by setting the version code to the maximum allowed (Int.MAX_VALUE). Prevents Google Play from automatically overwriting the patched app when using the official package name on devices without preinstalled Photos. |
| [Enable DCIM folders backup control](#enable-dcim-folders-backup-control) | Disables always on backup for the Camera and other DCIM folders, allowing you to control backup for each folder individually. This will make the app default to having no folders backed up. |
| [Enable Phenotype flag manager](#enable-phenotype-flag-manager) | Enables an in-app flag manager in Photos Settings to toggle curated experimental UI redesigns, video editor tools, and feature flags. |
| [Fix memory style font loading](#fix-memory-style-font-loading) | Redirects font loading across Stories and UI to authentic Google Fonts with local caching and CDN downloading, fixing fallback fonts and blank text in Memories. |
| [GmsCore support](#gmscore-support) | Enables GmsCore / MicroG support and renames package for non-root installs. Leave enabled for standard non-root installs; disable only for rooted system installs using genuine Google Play Services. |
| [Google One Bento Badge](#google-one-bento-badge) | Restores the genuine Google One subscription badge in the Google Photos Bento account menu. |
| [Local creation downloader](#local-creation-downloader) | Intercepts saving memory collages and creations, exporting them to the device Google Photos folder (DCIM/Google Photos) for quota-free backup instead of direct cloud library commits. |
| [Model Readiness Gates](#model-readiness-gates) | Bypasses the 0MB Mobile Data Download check for AI models and reports them as loaded. |
| [Spoof features](#spoof-features) | Spoofs the device to enable Google Pixel exclusive features, including unlimited storage. |

</details>

<!-- PATCHES_END -->

---

## ⚠️ Known Limitations

- **Local Creation Downloader**:
  - **Cross-device state**: Bypasses cloud save to enable quota-free backup. The save button is permanently hidden on the patched device once downloaded, but may still appear in Stories on other devices or the web.
  - **Web badge**: Saved collages back up as standard photos on their original capture date without the server-assigned collage badge on the web.

---

Ready-to-install builds patched with this bundle are available at **[Akash-Sriram/GooglePhotos-Patched](https://github.com/Akash-Sriram/GooglePhotos-Patched/releases)**.
