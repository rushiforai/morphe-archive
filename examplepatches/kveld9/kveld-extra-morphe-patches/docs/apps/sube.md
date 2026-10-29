# SUBE Patches Guide

Technical documentation and patch catalog for SUBE (Sistema Único de Boleto Electrónico) on Android.

---

## 1. Target & Compatibility

| Property | Value |
| :--- | :--- |
| **Target App** | SUBE |
| **Package Name** | `com.sube.app` |
| **Target Version** | `Single pinned version (see README Patch Catalog)` |
| **Target Package Format** | XAPK bundle |
| **Primary Architecture** | universal (`arm64-v8a` / `armeabi-v7a`) |
| **Download Target** | [APKPure](https://d.apkpure.com/b/XAPK/com.sube.app) |
| **Authoritative Source** | APKPure |

---

## 2. Applied Patches Catalog

The authoritative patch catalog with descriptions and options is generated in README.md from the built .mpp; see also patches-list.json.

---

## 3. Deep Technical Breakdown

### A. Compatibility Bypass Layer (`bytecodePatch`)

1. **Bypass SUBE NFC antenna check**:
   - **Objective**: Allow running card balance queries and accreditation on devices whose firmware does not declare `com.nxp.mifare` system feature support.
   - **How**: Hooks `com.nacionservicios.nssacommons.system.nfc.NfcCompatibility` gate evaluation method and replaces the static field reference returning `NfcCompatibility.d` (unsupported) with `NfcCompatibility.b` (supported).

### B. Manifest Purge Layer (`resourcePatch`)

1. **SUBE Telemetry Manifest Purge**:
   - **Objective**: Prevent tracker initialization, advertising identifier collection, and background telemetry scheduling.
   - **How**: Strips advertising and attribution permissions (`AD_ID`, `BIND_GET_INSTALL_REFERRER_SERVICE`, `ACCESS_ADSERVICES_ATTRIBUTION`, `ACCESS_ADSERVICES_AD_ID`), sets `android:enabled="false"` on Google AppMeasurement, Firebase Sessions, and DataTransport components (`AppMeasurementService`, `AppMeasurementJobService`, `AppMeasurementReceiver`, `AppMeasurementInstallReferrerReceiver`, `SessionLifecycleService`, `JobInfoSchedulerService`, `TransportBackendDiscovery`), and injects declarative opt-out metadata flags in `<application>`. `FirebaseInitProvider` is intentionally kept enabled because the app invokes R8-obfuscated Firebase Crashlytics synchronously at startup (`FirebaseApp.getInstance`), and disabling its provider causes an `IllegalStateException` fatal startup crash.

2. **Cut Firebase Manifest**:
   - **Objective**: Sever Firebase Cloud Messaging background entrypoints and instance ID receivers.
   - **How**: Sets `android:enabled="false"` on `com.google.firebase.messaging.FirebaseMessagingService` and `com.google.firebase.iid.FirebaseInstanceIdReceiver` in `AndroidManifest.xml`. `FirebaseInitProvider` remains enabled to prevent the fatal startup crash.

### C. Bytecode Dispatcher Neutralization Layer (`bytecodePatch`)

1. **Block Telemetry & Trackers**:
   - **Objective**: Stop runtime telemetry event dispatching across Google Analytics and Crashlytics pipelines.
   - **How**: Injects immediate `return-void` instructions at bytecode entrypoints for Firebase Analytics (`logEvent`, `setUserProperty`), Google Measurement (`logEvent`, `logEventInternal`), and Firebase Crashlytics (`recordException`, `log`, `setCustomKey`).

2. **Cut Firebase Entirely**:
   - **Objective**: Sever background Firebase Installations (FID) registration and token exchange traffic.
   - **How**: Rewrites the `firebaseinstallations.googleapis.com` const-string host literal in DEX bytecode to `0.0.0.0` using an indexed string fingerprint.

---

## 4. Behavioral Hazards Warning

1. **Bypass SUBE NFC antenna check**:
   Bypassing the `com.nxp.mifare` check allows the application to proceed past startup device compatibility gates on devices where the OEM ROM omitted the NXP Mifare system feature declaration. However, if the physical device hardware lacks an NFC controller or an antenna physically capable of communicating with Mifare Classic or Ultralight contactless card ICs, physical balance reading and accreditation will fail at the hardware RF transceive level.

2. **Cut Firebase Entirely (Opt-in Kill Switch)**:
   Explicit WARNING: Enabling this patch severs all Firebase background traffic by disabling FCM receivers and rewriting the Firebase Installations API endpoint to `0.0.0.0`. This intentionally breaks push notifications (FCM), Firebase Installations (FID) registration, and token exchange. The app will be unable to receive cloud messages or background push notifications. Crash report delivery may also be delayed or impaired. Cold boot and core app functionality (balance queries, card accreditation, recharges) remain operational.

---

## 5. Known Limitations

- **XAPK Container Format**: Target package is distributed as an XAPK bundle containing base application code and configuration splits.
- **Backend Server Dependency**: Online card accreditation (`Acreditar`), balance recharges, and payment history require live network connectivity to SUBE / Nación Servicios backend infrastructure. Remote transaction signing and server authorization cannot be mocked or bypassed client-side.

---

## 6. Canonical Universal Patches

Generic resource slimming and device optimization patches are provided by the universal patches in the canonical collection [kveld-morphe-patches](https://github.com/kveld9/kveld-morphe-patches): `Remove Unused Screen Sizes` and `Remove Extra Languages`. For further generic maintenance (packaging leftovers, background sync, image compression, screenshot protections) that collection also provides `Clean App Packaging`, `Shrink PNG Images`, `Shrink WebP Images`, `Allow Screenshots (Universal)`, and `Strip Sensitive Permissions (Universal)`. Add that source in Morphe Manager alongside this one to use them; universal patches apply to any APK, including SUBE.
