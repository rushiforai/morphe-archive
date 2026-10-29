# Xiaomi Earbuds Patches Guide

Technical documentation and patch catalog for Xiaomi Earbuds on Android.

---

## 1. Target & Compatibility

| Property | Value |
| :--- | :--- |
| **Target App** | Xiaomi Earbuds |
| **Package Name** | `com.mi.earphone` |
| **Target Version** | `Single pinned version (see README Patch Catalog)` |
| **Target Package Format** | XAPK bundle |
| **Primary Architecture** | universal (`arm64-v8a` / `armeabi-v7a`) |
| **Download Target** | [APKPure](https://d.apkpure.com/b/XAPK/com.mi.earphone) |
| **Authoritative Source** | APKPure |

---

## 2. Applied Patches Catalog

The authoritative patch catalog with descriptions and options is generated in README.md from the built .mpp; see also patches-list.json.

---

## 3. Technical Breakdown

### A. OEM & Feature Unlocks
- **Unlock for Other Phones**:
  - *Objective*: Enable complete feature settings and prevent warning dialogs on non-Xiaomi devices.
  - *How*: Bypasses brand checks by spoofing Xiaomi device attributes and removing account requirements for smart settings.
- **Unlock Sound Features**:
  - *Objective*: Enable spatial audio, dimensional sound, and low-latency audio options regardless of device restrictions.
  - *How*: Lifts device restriction checks and forces audio setting feature flags to return supported.
- **Show All Models**:
  - *Objective*: Display the full pairing catalog for all earbud models without region filtering.
  - *How*: Forces product visibility checks to always return true during device discovery.
- **Update Without Account**:
  - *Objective*: Allow checking and downloading firmware updates without requiring a Xiaomi account login.
  - *How*: Bypasses account authentication checks during OTA update requests.

### B. Security, Root & Privacy Guards
- **Run on Rooted Devices**:
  - *Objective*: Allow the app to run on rooted devices or alongside debugging tools without crashing.
  - *How*: Neutralizes root detection checks, Magisk and KernelSU heuristic scans, and debugger detection routines.
- **Device Privacy Guard**:
  - *Objective*: Prevent tracking through persistent device identifiers and remove unnecessary location permissions.
  - *How*: Spoofs hardware IDs such as IMEI and MAC addresses, strips location permissions, and allows Bluetooth scanning without fine location access.
- **Safer Connections**:
  - *Objective*: Support custom certificates and protect against unencrypted transmission.
  - *How*: Disables SSL certificate pinning and inserts network security configurations permitting user-installed certificates.
- **Skip Popups & Tutorials**:
  - *Objective*: Suppress initial privacy agreements, tutorial carousels, and promotional prompts.
  - *How*: Forces startup agreement and tutorial completion flags to true and suppresses permission nag dialogs.

### C. Background Optimization & Offline Mode
- **Stop Background Activity**:
  - *Objective*: Eliminate persistent background notifications and reduce standby battery drain.
  - *How*: Disables foreground service keep-alives and background listener components in both the manifest and bytecode.
- **Offline Only**:
  - *Objective*: Run the application completely severed from the internet.
  - *How*: Strips network permissions from the manifest and stubs HTTP clients and DNS resolvers to prevent network calls.

---

## 4. Known Limitations

- **Offline Mode Workflow**: Disconnecting the app from the internet prevents cloud device synchronization and remote firmware checks. Earbuds must be paired initially before applying offline mode.
- **Hardware-Constrained Audio**: Unlocking spatial audio and low latency profiles enables the software toggles; physical DSP support depends on earbud firmware capabilities.
