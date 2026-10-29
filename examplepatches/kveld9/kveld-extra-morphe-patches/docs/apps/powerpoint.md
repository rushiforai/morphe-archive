# PowerPoint Patches Guide

Technical documentation and patch catalog for Microsoft PowerPoint on Android.

---

## 1. Target & Compatibility

| Property | Value |
| :--- | :--- |
| **Target App** | PowerPoint |
| **Package Name** | `com.microsoft.office.powerpoint` |
| **Target Version** | `Single pinned version (see README Patch Catalog)` |
| **Target Package Format** | APKM |
| **Primary Architecture** | `arm64-v8a` |
| **Authoritative Source** | APKMirror |
| **Download Target** | [PowerPoint (arm64-v8a, 120-480dpi)](https://www.apkmirror.com/apk/microsoft-corporation/powerpoint/) |

---

## 2. Applied Patches Catalog

The authoritative patch catalog with descriptions and options is generated in README.md from the built .mpp; see also patches-list.json.

---

## 3. Deep Technical Breakdown

### A. Manifest & Licensing Layer (`resourcePatch`)

1. **Remove Shared User ID**:
   - **Objective**: Prevent installation conflicts on devices with other Microsoft apps installed.
   - **How**: Strips shared user identifier attributes from the root manifest element.

2. **PowerPoint Telemetry Manifest Purge**:
   - **Objective**: Stop tracker initialization and background telemetry services.
   - **How**: Strips advertising identifiers and install referrer permissions, disables telemetry and HockeyApp activities, and injects opt-out flags.

### B. Bytecode Bypass & Feature Unlocking Layer (`bytecodePatch`)

1. **Block Telemetry & Trackers**:
   - **Objective**: Neutralize runtime telemetry and failure logging dispatchers.
   - **How**: Hooks Microsoft OneDS entrypoints to return immediately and nullifies advertising identifiers.

2. **Bypass Code Transparency**:
   - **Objective**: Allow sideloaded packages to launch without code transparency validation errors.
   - **How**: Short-circuits verification checks to report immediate success to the caller.

3. **Disable Login Requirement**:
   - **Objective**: Allow creating and editing presentations without compulsory Microsoft account sign-in.
   - **How**: Bypasses first-run experience task callbacks and short-circuits single sign-on checks.

4. **Unlock 365 Family**:
   - **Objective**: Unlock premium subscription features and editing capabilities locally.
   - **How**: Forces subscription status checks to return true and bypasses enterprise license validation.

### C. Resource & Binary Trimming Axes

1. **PowerPoint Companion Native Slimmer (`rawResourcePatch`)**:
   - **Objective**: Reduce application disk footprint by discarding companion native libraries.
   - **How**: Empties React Native and Hermes runtime libraries in-situ across target architectures.

---

## 4. Behavioral Hazards Warning

1. **PowerPoint Companion Native Slimmer**:
   Stripped libraries are load-bearing for React Native initialization. Enabling this will crash the app with `UnsatisfiedLinkError` when Copilot or other React Native surfaces start.

---

## 6. Canonical Universal Patches

The generic maintenance patches removed from this guide (screen densities, languages) are covered by the universal patches in the canonical collection [kveld-morphe-patches](https://github.com/kveld9/kveld-morphe-patches): `Remove Unused Screen Sizes` and `Remove Extra Languages`. For further generic maintenance (packaging leftovers, background sync, native trackers, telemetry) that collection also provides `Clean App Packaging`, `Stop Background Sync`, `Remove Tracking Libraries` and `Block Trackers`. Add that source in Morphe Manager alongside this one to use them; universal patches apply to any APK, including PowerPoint.

---

## 5. Known Limitations

None evidenced by patch sources.
