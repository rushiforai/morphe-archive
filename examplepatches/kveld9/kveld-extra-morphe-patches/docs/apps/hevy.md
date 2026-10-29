# Hevy Patches Guide

Technical documentation and patch catalog for Hevy Gym Log Workout Tracker on Android.

---

## 1. Target & Compatibility

| Property | Value |
| :--- | :--- |
| **Target App** | Hevy - Gym Log Workout Tracker |
| **Package Name** | `com.hevy` |
| **Target Version** | `Single pinned version (see README Patch Catalog)` |
| **Target Package Format** | APKM bundle |
| **Primary Architecture** | `arm64-v8a` / `armeabi-v7a` |
| **Download Target** | [APKMirror](https://www.apkmirror.com/apk/hevy-gym-workout-tracker/hevy-gym-log-workout-tracker/) |
| **Authoritative Source** | APKMirror |

---

## 2. Applied Patches Catalog

The authoritative patch catalog with descriptions and options is generated in README.md from the built .mpp; see also patches-list.json.

---

## 3. Technical Breakdown

### A. Background Sync & Battery Optimization
- **Stop Background Sync**:
  - *Objective*: Prevent background alarms and billing connections from draining the battery.
  - *How*: Disables Firebase DataTransport schedulers and alarm receivers plus billing components in the manifest, and neutralizes background billing connection startup routines; WorkManager and Firebase component discovery are kept so local and push notifications keep working.

### B. Telemetry & Tracking Elimination
- **Block Trackers**:
  - *Objective*: Prevent transmission of usage logs, crash events, and advertising attribution data.
  - *How*: Strips advertising identifier and attribution permissions from the manifest, and stubs third-party crash reporting and event tracking methods.

### C. Pro Subscription & Feature Gating
- **Unlock Pro**:
  - *Objective*: Unlock offline workout tracking features such as unlimited routines, custom folders, and workout charts.
  - *How*: Modifies the compiled JavaScript bundle in place to force client-side subscription checks to report active Pro status.

### D. Asset Debloating
- **Remove Extra Files**:
  - *Objective*: Shrink the installed application footprint by removing unneeded media assets.
  - *How*: Purges bundled onboarding tutorial videos, editor stickers, and unused asset fonts from application resources.

---

## 4. Known Limitations

- **Server-Side Pro Assets**: Client bundle modifications unlock local Pro interface features and routine limits. Cloud-validated synchronization, social leaderboards, or remote server endpoints requiring backend entitlement checks remain gated upstream.
- **APKM Bundle Requirement**: Hevy is distributed as an APKM bundle; patching requires processing the complete bundle container.
