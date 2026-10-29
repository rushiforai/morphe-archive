# Instagram Patches Guide

Technical documentation and patch catalog for Instagram on Android.

---

## 1. Target & Compatibility

| Property | Value |
| :--- | :--- |
| **Target App** | Instagram |
| **Package Name** | `com.instagram.android` |
| **Target Version** | `Single pinned version (see README Patch Catalog)` |
| **Target Package Format** | APKM |
| **Primary Architecture** | `arm64-v8a` |
| **Authoritative Source** | APKMirror |
| **Download Target** | [Instagram (arm64-v8a, 120-480dpi)](https://www.apkmirror.com/apk/instagram/instagram-instagram/) |

---

## 2. Applied Patches Catalog

The authoritative patch catalog with descriptions and options is generated in README.md from the built .mpp; see also patches-list.json.

---

## 3. Deep Technical Breakdown

### A. Manifest Purge & Diagnostics Layer (`resourcePatch`)

1. **Instagram Telemetry Manifest Purge**:
   - **Objective**: Prevent tracking permissions and analytics component initialization.
   - **How**: Strips advertising identifiers and install referrer permissions, and disables Facebook analytics services and device identifier providers.

2. **Instagram Crash & Diagnostics Manifest Purge**:
   - **Objective**: Disable diagnostic reporters and background crash loggers.
   - **How**: Disables crash upload services, detector broadcast receivers, and carrier preload tracking services.

### B. Bytecode Dispatcher Neutralization Layer (`bytecodePatch`)

1. **Block Telemetry & Trackers**:
   - **Objective**: Stop runtime telemetry data transmission.
   - **How**: Injects immediate void returns into analytics upload methods and privacy-controlled dispatchers.

2. **Block Crash & Diagnostics**:
   - **Objective**: Stop runtime crash and diagnostic dump dispatching.
   - **How**: Suppresses diagnostic hooks and pairs with manifest purging to neutralize reporting pipelines.

### C. Resource and Binary Debloat Axes (`rawResourcePatch`)

1. **AR Effects Slimmer**:
   - **Objective**: Save storage space by removing augmented reality assets and libraries.
   - **How**: Verifies ELF headers and zeroes companion ARCore native libraries in-situ while removing face tracking models.

---

## 4. Behavioral Hazards Warning

1. **AR Effects Slimmer**:
   Stripping ARCore binaries and facial geometry models disables camera AR filters, 3D face effects, and body/face tracking.

---

## 5. Known Limitations

None evidenced by patch sources.

---

## 6. Canonical Universal Patches

The MLKit slimming removed from this guide is covered by the `Block Trackers` universal patch in the canonical collection [kveld-morphe-patches](https://github.com/kveld9/kveld-morphe-patches): enable its `disableMlKit` option to disable `MlKitInitProvider`, the component discovery service and the vision registrars (same warning applies: in-app QR and barcode scanning breaks). That collection also provides further generic maintenance (`Remove Unused Screen Sizes`, `Remove Extra Languages`, `Clean App Packaging`, `Stop Background Sync`, `Remove Tracking Libraries`). Add that source in Morphe Manager alongside this one to use them; universal patches apply to any APK, including Instagram.
