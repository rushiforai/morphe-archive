# Morphe Google Photos (MGP)

Morphe patches for **Google Photos**, derived from [RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced), adding Pixel feature spoofing, GmsCore/MicroG support, in-app flag controls, and offline neural model delivery.

---

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.12.2](https://github.com/Akash-Sriram/morphe-google-photos/releases/tag/v1.12.2)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;12 patches total
<details open>
<summary>📦 Google Photos&nbsp;&nbsp;•&nbsp;&nbsp;12 patches</summary>
<br>

**🎯 Supported versions:**

| 7.94.0.984908898 |
| :---: |

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
| [Google One Bento Badge](#google-one-bento-badge) | Restores the genuine Google One subscription badge in the Google Photos Bento account menu. |
| [Model Readiness Gates](#model-readiness-gates) | Bypasses the 0MB Mobile Data Download check for AI models and reports them as loaded. |
| [Spoof features](#spoof-features) | Spoofs the device to enable Google Pixel exclusive features, including unlimited storage. |

</details>

<!-- PATCHES_END -->

Ready-to-install builds patched with this bundle are available at **[Akash-Sriram/GooglePhotos-Patched](https://github.com/Akash-Sriram/GooglePhotos-Patched/releases)**.
