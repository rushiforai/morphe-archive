# NokoPrint Patches Guide

Technical documentation and patch catalog for NokoPrint on Android.

---

## 1. Target & Compatibility

| Property | Value |
| :--- | :--- |
| **Target App** | NokoPrint - WiFi, Bluetooth, USB |
| **Package Name** | `com.nokoprint` |
| **Target Version** | `Single pinned version (see README Patch Catalog)` |
| **Target Package Format** | XAPK bundle |
| **Primary Architecture** | universal (`arm64-v8a` / `armeabi-v7a` / `x86` / `x86_64`) |
| **Download Target** | [APKPure](https://d.apkpure.com/b/XAPK/com.nokoprint) |
| **Authoritative Source** | APKPure |

---

## 2. Applied Patches Catalog

The authoritative patch catalog with descriptions and options is generated in README.md from the built .mpp; see also patches-list.json.

---

## 3. Technical Breakdown

### A. Ad Removal & Premium Unlock
- **Block Ads**:
  - *Objective*: Remove all banner, interstitial, and rewarded advertisements and bypass Google Play anti-tamper exit checks.
  - *How*: Disables ad components and startup initializers in the manifest, forces ad-free status flags to true, short-circuits banner and interstitial dispatchers, and stubs license validation.
- **Remove Extra Files**:
  - *Objective*: Reduce package size and remove leftover tracker assets.
  - *How*: Purges ad SDK HTML assets, web tracking templates, and mediation configuration files from application resources.

### B. Telemetry & Background Sync
- **Block Trackers**:
  - *Objective*: Prevent analytics tracking and advertising identifier data collection.
  - *How*: Strips advertising identifier permissions and stubs Firebase, Google Analytics, and ad attribution tracking methods.
- **Stop Background Sync**:
  - *Objective*: Stop background tasks and wake locks from consuming system resources and battery.
  - *How*: Disables periodic worker jobs, alarm schedulers, and update check services in the manifest and runtime schedulers.

### C. Network Hardening & UX Cleanups
- **Remove Extra Stores**:
  - *Objective*: Remove unneeded payment libraries for alternative app stores.
  - *How*: Strips billing frameworks for Huawei AppGallery, Samsung Galaxy Store, and Amazon Appstore from the manifest.
- **Printer-Compatible Connections**:
  - *Objective*: Keep LAN printer discovery and driver downloads working while trusting user-installed certificates.
  - *How*: Updates the network security configuration to permit cleartext traffic (required by some printers) and adds user certificate trust. Less strict than stock; disable the patch for strict TLS-only.
- **Skip Welcome Screen**:
  - *Objective*: Open directly to the main printer workspace without displaying first-launch welcome dialogs.
  - *How*: Suppresses the initial welcome popup dialog while keeping the About screen accessible through settings.

---

## 4. Known Limitations

- **XAPK Container Format**: Target package is distributed as an XAPK container containing split architecture binaries.
- **Driver Download Connectivity**: Hardening network security preserves HTTP endpoints required by legacy network printers and remote driver repositories.
