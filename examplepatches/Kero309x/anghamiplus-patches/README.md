<p align="center">
  <img src="https://img.shields.io/badge/Kero309x-Universal%20Patches-8A2BE2?style=for-the-badge&logo=android&logoColor=white" alt="Kero309x Patches" height="40" />
</p>

<h1 align="center">Kero309x Patches</h1>

<p align="center">
  <strong>A modular, multi-app extension patch bundle engineered for the <a href="https://github.com/MorpheApp/morphe-manager">Morphe</a> Android ecosystem.</strong><br>
  <em>Focused controls for client-side playback, feed filtering, interface decluttering, and privacy across your favorite apps.</em>
</p>

<p align="center">
  <a href="CHANGELOG.md"><img alt="version" src="https://img.shields.io/badge/version-1.3.4-6f42c1.svg?style=flat-square" /></a>
  <a href="LICENSE"><img alt="license" src="https://img.shields.io/badge/license-GPLv3-blue.svg?style=flat-square" /></a>
  <a href="https://www.android.com/"><img alt="platform" src="https://img.shields.io/badge/platform-Android-3ddc84.svg?style=flat-square&logo=android&logoColor=white" /></a>
  <a href="https://github.com/MorpheApp/morphe-manager"><img alt="works with Morphe" src="https://img.shields.io/badge/works%20with-Morphe-00b894.svg?style=flat-square" /></a>
  <a href="https://github.com/Kero309x/Kero309x-patches/releases"><img alt="Morphe Bundle" src="https://img.shields.io/badge/bundle-MPP-orange.svg?style=flat-square" /></a>
</p>

<p align="center">
  <strong><a href="https://morphe.software/add-source?github=Kero309x%2FKero309x-patches">⚡ Add Kero309x Patches to Morphe Manager</a></strong> •
  <a href="#-supported-applications-matrix">Supported Apps</a> •
  <a href="#-core-protection-principles">Protection Rules</a> •
  <a href="#-installation--usage">How to Install</a> •
  <a href="#️-modular-architecture">Architecture</a>
</p>

---

## 🛡️ Core Protection Principles (قواعد الحماية)

> [!IMPORTANT]
> **The Golden Rule:** You provide your own unmodified, legally obtained base APK. Morphe Manager merges the chosen open-source patch definitions into the application bytecode locally on your Android device. 
> 
> * **No Binary Distribution:** This repository does **not** host, store, or distribute proprietary APKs or cracked binaries.
> * **100% Client-Side:** All patches operate purely on local UI states, gesture preferences, and client flags. Nothing communicates with, alters, or bypasses remote server-side authentication, DRM protections, or backend databases.
> * **Modular & Extensible:** Each application target is developed as an isolated module within the Morphe patch framework.

---

## 📱 Supported Applications Matrix

| Target Application | Package ID | Supported Version | Key Patch Capabilities | Status |
| :--- | :--- | :---: | :--- | :---: |
| 🎵 **Anghami** | `com.anghami` | **8.0.28** | Unrestricted navigation, synced lyrics display, audio ad filtering, anti-telemetry | ✅ **Active** |
| 🎬 **TikTok** | `com.zhiliaoapp.musically` | *Modular Target* | Feed decluttering, gesture customization, auto-scroll, privacy filters | 🚧 **Modular Framework Ready** |
| 📦 **Custom Target Modules** | *Dynamic* | *Various* | Background telemetry blocking, layout cleanup, window capture flags | ⚙️ **In Development** |

---

## ✨ Features Breakdown by Target

### 🎵 1. Audio Suite (Anghami 8.0.28)
* **On-Demand Navigation:** Disables forced shuffle; browse and select specific tracks directly from albums and playlists.
* **Queue Freedom:** Removes client-side skip limitations for a smooth listening queue.
* **Synced Lyrics:** Enables full-screen, dynamic time-synced lyrics rendering.
* **Audio Cleanliness:** Silences interstitial audio promotional breaks.
* **Interface Decluttering:** Hides upgrade upsells, banner headers, and sponsored recommendation cards.
* **Anti-Telemetry:** Neutralizes background diagnostic SDKs and tracking metrics.
* **Screen Capture:** Removes window `FLAG_SECURE` to permit screenshots and screen recording.

### 🎬 2. Video & Social Suite (Extensible Architecture)
* **Distraction-Free Feed:** Modular switches to hide sponsored ads, live shopping cards, and cluttered floating badges.
* **Smart Touch Controls:** Configurable double-tap and hold gestures to prevent accidental likes/follows.
* **Clean Player View:** Minimized floating overlays for an immersive video experience.

---

## 📲 Installation & Usage

### Option 1: Morphe Manager (Recommended for Users)
1. Install [Morphe Manager](https://github.com/MorpheApp/morphe-manager) on your Android device.
2. Open **Settings** ➔ **Sources** and add:  
   👉 **`Kero309x/Kero309x-patches`** *(or tap **[Add to Morphe](https://morphe.software/add-source?github=Kero309x%2FKero309x-patches)**)*.
3. Select your local target APK.
4. Select your preferred patches and tap **Patch**.

---

### Option 2: Building from Source (Developers)
Compile the multi-target Morphe bundle (`.mpp`) locally using Gradle:

```bash
# Clone the repository
git clone https://github.com/Kero309x/Kero309x-patches.git
cd Kero309x-patches

# Build the unified patch bundle
./gradlew build
```

Compiled package will be output to:  
`patches/build/libs/patches-1.3.4.mpp`

---

## 🏛️ Modular Architecture

The repository is structured to seamlessly support multiple target applications under isolated namespaces:

```text
├── extensions/                 # Standalone runtime Java/Kotlin helper modules
├── gradle/                     # Build tools, catalogs, and Gradle wrappers
├── patches/
│   └── src/main/kotlin/app/
│       ├── anghami/            # [Module] Audio streaming patch definitions
│       │   ├── ads/            # Audio & visual promo filters
│       │   ├── core/           # Target definitions & bytecode stubs
│       │   ├── download/       # Local cache handling
│       │   ├── entitlement/    # UI badges
│       │   ├── integrity/      # Signature verification helpers
│       │   ├── lyrics/         # Lyrics renderer hooks
│       │   ├── playback/       # Queue & shuffle controls
│       │   ├── privacy/        # Telemetry neutralizers
│       │   └── system/         # Window flags & system dialog hooks
│       └── [future_target]/    # [Module] Social/video modular patches (e.g. TikTok)
├── build.gradle.kts
└── settings.gradle.kts
```

---

## ⚖️ Legal & Educational Disclaimer

> [!NOTE]
> This repository contains open-source software customization tools and bytecode transformation definitions engineered strictly for educational research, personal interoperability analysis, and accessibility under the **GNU General Public License v3.0**.
> 
> * This project does **not** host, distribute, or pirate proprietary binaries or APK files.
> * This project does **not** bypass, alter, or communicate with remote authentication servers or DRM mechanisms.
> * Users are solely responsible for ensuring that their use of client-side patches complies with all applicable local laws, regulations, and third-party agreements.

---

## 📄 License
Licensed under the [GNU General Public License v3.0](LICENSE).
