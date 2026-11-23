# 🎨 Google Phone AMOLED Patches for Morphe

True pitch-black (`#000000`) AMOLED dark theme, high-contrast dialpad text, silhouette contact avatar outline fixes, and standalone package cloning for Google Phone (Google Dialer).

---

## ❓ About

This repository provides native Morphe patches to transform official Google Phone APKs into pure pitch black with zero layout or bytecode disruption:
- **AMOLED Dark Theme**: Replaces dark grey backgrounds with pure `#000000` pitch black across all dialer views, keypad, dialogs, and settings.
- **High-Contrast Readability**: Pure white keypad digits and clear labels.
- **Silhouette Avatar Fix**: Restores `@android:color/system_outline_dark` so unsaved contact avatars remain clearly visible.
- **Clone Dialer Package**: Allows non-rooted devices to install the patched APK side-by-side (`com.google.android.dialer.amoled`) without signature or permission conflicts.

---

### How to use in Morphe Manager

Click the button below, or manually add this repository in **Morphe Manager** under **Settings ⚙️ → Sources**:
```text
Gagan-Pratap-S/GT-morphe-patches
```

<a href="https://morphe.software/add-source?github=Gagan-Pratap-S/GT-morphe-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

---

## ⚠️ Important Installation Notes

### 1. Use Universal / Non-Pixel APK Only
- Only download and patch the **universal** Google Phone APK (often marked **non-nexus** or standard general releases on APKMirror, or extracted directly from your non-Pixel device).
- **Do NOT patch Pixel-exclusive builds** (marked with `-pixel` or `pixel2026` in their filename/version). Those builds contain hard dependencies on proprietary Google Pixel system frameworks and will crash on launch on Motorola, Samsung, Xiaomi, OnePlus, or other non-Pixel devices.

### 2. Setting Default Phone App (Allow Restricted Settings)
On Android 13 and Android 14+, Android's security sandbox may restrict sideloaded apps from claiming the Default Phone App role. If the option is greyed out:
1. Open your phone's **Settings → Apps → All Apps → Phone (AMOLED)** (or long-press the app icon and tap **App info**).
2. Tap the **three dots (⋮)** in the top-right corner.
3. Tap **"Allow restricted settings"** and authenticate with your fingerprint or PIN.
4. Go back to **Settings → Apps → Default apps → Phone app** and select **Phone (AMOLED)**.
5. In **App info → Permissions**, make sure **Phone, Contacts, and Call logs** are allowed.

*(Note: If your phone is rooted with Magisk/KernelSU, you can disable the Clone patch in Morphe Manager and choose Mount / Install as Root to replace the system dialer directly without cloning!)*

---

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.3.1](https://github.com/Gagan-Pratap-S/GT-morphe-patches/releases/tag/v1.3.1)**&nbsp;&nbsp;&middot;&nbsp;&nbsp;`main`&nbsp;&nbsp;&middot;&nbsp;&nbsp;**3 patches** across **1 apps**&nbsp;&nbsp;&middot;&nbsp;&nbsp;[Full details](PATCHES.md)

| # | App | Patches | Version | Package |
|---|---|---|---|---|
| 1 | [**Phone**](PATCHES.md#phone-comgoogleandroiddialer) | 3 | `241.0.996790549` | [`com.google.android.dialer`](https://play.google.com/store/apps/details?id=com.google.android.dialer) |
<!-- PATCHES_END -->

---

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches `.mpp` file is found in `patches/build/libs/patches-*.mpp`
- Patch the `.mpp` file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop) like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

---

## 📜 License

This project is licensed under the [GNU General Public License v3.0](LICENSE).
