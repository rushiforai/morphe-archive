# X (Twitter) Patches Guide

Technical documentation and patch catalog for X (Twitter) on Android.

UI and debloating patches were removed because Piko-NewX covers them; this repository maintains only the complementary patch set focusing on background optimization, resource reduction, and telemetry blocking.

---

## 1. Target & Compatibility

| Property | Value |
| :--- | :--- |
| **Target App** | X |
| **Package Name** | `com.twitter.android` |
| **Target Version** | `12.37.2-prod.01` |
| **Target Package Format** | APKM |
| **Primary Architecture** | `arm64-v8a` |
| **Authoritative Source** | APKMirror |
| **Download Target** | [X 12.37.2-prod.01 (arm64-v8a, 120-640dpi, versionCode 312372001 / BUNDLE 35 S)](https://www.apkmirror.com/apk/x-corp/x/x-12-37-2-prod-01-release/) |

---

## 2. Applied Patches Catalog

| Patch Name | Typology | Default State | Dependencies | Description |
| :--- | :--- | :--- | :--- | :--- |
| **Background Slimmer** | `resourcePatch` | `false` (Opt-in) | None | Disables background WorkManager tasks, widgets, and Cast/NFC companion services to reduce resource usage. |
| **Block Telemetry & Trackers (Setup)** | `resourcePatch` | `false` (Opt-in) | None | Strips tracking and advertising permissions, disables analytics services and receivers, and purges Sentry initialization metadata from the manifest. |
| **Block Telemetry & Trackers** | `bytecodePatch` | `true` (Enabled) | `Block Telemetry & Trackers (Setup)` | Blocks telemetry collection, redirects Braze, Sentry, Google Ads/DoubleClick, and Firebase Crashlytics remote settings endpoints to 0.0.0.0. Includes opt-in toggle to block X Payments telemetry. |

---

## 3. Deep Technical Breakdown

### A. Manifest & Background Optimization Layer (`resourcePatch`)

1. **Background Slimmer**:
   - **Objective**: Reduce background battery and memory usage.
   - **How**: Disables background periodic jobs, home screen widgets, and Cast/NFC companion services.

### B. Bytecode Modification Layer (`bytecodePatch`)

1. **Block Telemetry & Trackers**:
   - **Objective**: Stop runtime metric and event submission, redirect tracker endpoints, and strip tracking components.
   - **How**: Injects immediate returns into measurement and performance tracking methods; redirects Braze API base URLs, Sentry ingest endpoints, Google Ads/DoubleClick, and Firebase Crashlytics remote settings endpoints to `http://0.0.0.0`; provides an opt-in toggle (`blockPaymentsTelemetry`, default `false`) to redirect Plaid, ScribeUp, and anti-fraud financial endpoints; automatically executes internal manifest purge to strip advertising permissions, disable analytics services, and purge Sentry auto-initialization metadata.

---

## 4. Behavioral Hazards Warning

1. **Block Telemetry & Trackers (`blockPaymentsTelemetry`)**:
   Enabling the opt-in `blockPaymentsTelemetry` option redirects Plaid, ScribeUp, and anti-fraud telemetry endpoints to `http://0.0.0.0`, which disables X Payments and banking verification features.

---

## 5. Known Limitations

None evidenced by patch sources.

---

## 6. Canonical Universal Patches

The MLKit slimming removed from this guide is covered by the `Block Trackers` universal patch in the canonical collection [kveld-morphe-patches](https://github.com/kveld9/kveld-morphe-patches): enable its `disableMlKit` option to disable `MlKitInitProvider`, the component discovery service and the vision registrars (same warning applies: in-app QR and barcode scanning breaks). That collection also provides further generic maintenance (`Remove Unused Screen Sizes`, `Remove Extra Languages`, `Clean App Packaging`, `Stop Background Sync`, `Remove Tracking Libraries`). Add that source in Morphe Manager alongside this one to use them; universal patches apply to any APK, including X.
