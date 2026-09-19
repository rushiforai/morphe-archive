# Morphe Google Photos (MGP)

Morphe patches for **Google Photos**, derived from [RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced), adding Pixel feature spoofing, GmsCore/MicroG support, in-app flag controls, and offline neural model delivery.

---

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.4.1](https://github.com/Akash-Sriram/morphe-google-photos/releases/tag/v1.4.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;7 patches total
<details open>
<summary>📦 Google Photos&nbsp;&nbsp;•&nbsp;&nbsp;7 patches</summary>
<br>

**🎯 Supported versions:**

| 7.92.0.977185651 | 🧪&nbsp;7.93.0.982110057 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Account avatar](#account-avatar) | Loads and displays account profile avatars across the top toolbar, Bento menu, and account switcher. |  |
| [Bake memory style flags](#bake-memory-style-flags) | Hard-codes the Styles in Memories feature flags into the DEX. |  |
| [Enable DCIM folders backup control](#enable-dcim-folders-backup-control) | Disables always on backup for the Camera and other DCIM folders, allowing you to control backup for each folder individually. This will make the app default to having no folders backed up. |  |
| [Enable Phenotype flag manager](#enable-phenotype-flag-manager) | Enables an in-app flag manager in Photos Settings to customize experimental UI redesigns and feature flags. |  |
| [GmsCore support](#gmscore-support) | Allows the app to work without root by using a different package name when patched using a GmsCore instead of Google Play Services. |  |
| [Model Readiness Gates](#model-readiness-gates) | Bypasses the 0MB Mobile Data Download check for AI models and reports them as loaded. |  |
| [Spoof features](#spoof-features) | Spoofs the device to enable Google Pixel exclusive features, including unlimited storage. |  |

</details>

<!-- PATCHES_END -->

---

## 📲 Pre-built APKs

Ready-to-install builds patched with this bundle are available at:
👉 **[Akash-Sriram/GooglePhotos-Patched](https://github.com/Akash-Sriram/GooglePhotos-Patched/releases)**

Download original untouched APKs from:
👉 **[Google Photos on APKMirror](https://www.apkmirror.com/apk/google-inc/photos/)**

---

For developer CLI recipes (building, releases, ADB, permissions, and models), see **[COMMANDS.md](COMMANDS.md)**.
