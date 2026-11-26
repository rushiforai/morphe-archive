# 🧩 SadMod Patches

Clean, open-source Material 3 Expressive overhaul patches compatible with [Morphe Manager](https://github.com/MorpheApp/morphe-manager) and Morphe Desktop.

---

## ✨ Features

Applying **SadMod Material 3 overhaul** to a stock HappyMod APK (`com.happymod.apk`, v3.4.5) transforms it into a fast, ad-free, privacy-first Material 3 Expressive client (**SadMod**):

- **0 Ads, 0 Trackers, 0 Logins:** Strips ad SDKs, game scripts, packer runtime, legacy torrent libraries, and unnecessary manifest permissions — leaving only `INTERNET`, `ACCESS_NETWORK_STATE`, and `REQUEST_INSTALL_PACKAGES`.
- **Material 3 Expressive UI:** Aurora-Store-inspired layout with built-in English & German in-app language switching, clean typography, and zero account requirements.
- **Anonymous Networking:** Built-in **DNS-over-HTTPS (Quad9)** plus **Tor / Orbot (`127.0.0.1:9050`)**, custom **SOCKS5**, and **HTTP** proxy routing, paired with an ephemeral in-RAM session ID featuring 1-tap rotation.
- **SadMod Shield Pre-Install Scanner:** Locally inspects downloaded APKs and XAPK bundles for high-risk permissions, tracker SDKs, code packers, and hardcoded IPv4 endpoints, and computes SHA-256 checksums before installation.
- **On-Device Manifest Permission Editor & Local Re-Signer:** Lets you uncheck and strip unwanted `<uses-permission>` entries from downloaded standalone `.apk` files directly on your device and re-signs (`v1/v2/v3` via Android `apksig` with proper 4B/16KB `zipalign`).
- **Zero-Secret Architecture:** This repository contains **zero** hardcoded third-party endpoints or signing keys — protocol bridge values are extracted dynamically at patch time from the user's own local APK.
- **Android 15 Target & Side-by-Side Package Option:** Targets `targetSdk 35` (`minSdk 26`) with a configurable `packageName` patch option (`app.sadmod.patched` by default, or `com.happymod.apk`).

---

## 📱 Installation

### Morphe Manager (Android)

1. Install **Morphe Manager** on your device.
2. Add this repository as a patch source (`https://github.com/NotRin7/sadmod-patches`), or tap the button below:

<a href="https://morphe.software/add-source?github=NotRin7/sadmod-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

3. Select your unmodified **HappyMod 3.4.5** `.apk`, enable **SadMod Material 3 overhaul**, patch, and install.

### Morphe Desktop (CLI)

```bash
java -jar morphe-desktop.jar patch \
  --patches=patches-1.0.0.mpp \
  --out=SadMod-Patched.apk \
  HappyMod-3.4.5.apk
```

---

## 🩹 Patches List

<!-- PATCHES_START -->
> **[v1.1.0](https://github.com/NotRin7/sadmod-patches/releases/tag/v1.1.0)**&nbsp;&nbsp;&middot;&nbsp;&nbsp;`main`&nbsp;&nbsp;&middot;&nbsp;&nbsp;**1 patch** across **1 app**&nbsp;&nbsp;&middot;&nbsp;&nbsp;[Full details](PATCHES.md)

| # | App | Patches | Version | Package |
|---|---|---|---|---|
| 1 | <img src=".github/assets/sadmod-app-icon.svg" width="24" height="24" alt=""> [**HappyMod**](PATCHES.md#happymod-comhappymodapk) | 1 | `3.4.5` | `com.happymod.apk` |
<!-- PATCHES_END -->

---

## 🛠️ Building Locally

- Requirements: **JDK 21** (`JAVA_HOME`) and **Android SDK** (`ANDROID_HOME`).
- When `GITHUB_TOKEN` (or `gpr.user` / `gpr.key`) is set, Gradle resolves `app.morphe:morphe-patcher` from GitHub Packages; otherwise place the extracted API classes in `.local-sdk/morphe-patcher-provided.jar` (gitignored).
- Build the `.mpp` bundle (JVM + Android DEX) and regenerate `patches-list.json`:

```bash
./gradlew buildAndroid generatePatchesList
```

---

## ⚖️ Disclaimer & Legal Notice

- **Independent Open-Source Project:** SadMod Patches is an independent project licensed under GPLv3 and is **not** affiliated with, endorsed by, or sponsored by Morphe or HappyMod.
- **No Bundled Binaries, Secrets, or External Links:** This repository contains **zero** third-party APK files, extracted keys, server endpoints, or links to external APK download portals. All parameters are read locally from the user-supplied input file during patching.
- **Local Privacy & Security Tooling:** The patch is intended solely to improve local UI accessibility, user-configured network privacy (DoH/proxy), and pre-install APK inspection on files supplied by the user. Users are solely responsible for complying with applicable laws and terms of service.

---

## 📜 License

Licensed under the [GNU General Public License v3.0](LICENSE) and subject to [NOTICE](NOTICE).
