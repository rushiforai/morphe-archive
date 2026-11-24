# Credit Karma Architecture & Reverse Engineering Specification

## Overview

| Attribute                   | Specification                                                                                                                                                                                                                                        |
| --------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Application Name**        | Credit Karma                                                                                                                                                                                                                                         |
| **Package Name**            | `com.creditkarma.mobile`                                                                                                                                                                                                                             |
| **Supported Version**       | `26.47` (Morphe Compatibility: `26.47`, `minSdk` 32)                                                                                                                                                                                                 |
| **Analyzed Version Code**   | `17945257`                                                                                                                                                                                                                                           |
| **Target SDK**              | `36` (Android 16)                                                                                                                                                                                                                                    |
| **Minimum SDK**             | `32` (Android 12L)                                                                                                                                                                                                                                   |
| **APK Format**              | APKM (`base.apk`, `split_config.arm64_v8a.apk`, `split_config.en.apk`)                                                                                                                                                                               |
| **Package Signing SHA-256** | `f5ae9364524d92be9eb436eb7436d7c9efa9e1b4e823b0db6bc3989a4d84d0bf`                                                                                                                                                                                   |
| **Architecture**            | Native Android/Kotlin; Jetpack Compose, Coroutines, WorkManager, Datadog RUM, Firebase Analytics, Crashlytics, Kochava Tracker, Intuit Scribe/UXFabric, Segment, Qualtrics, New Relic Telemetry, MiSnap IAD KYC, ThreatMetrix Profiling, NokNok FIDO |

Credit Karma is a personal finance, credit monitoring, and financial marketplace app. It does not employ third-party banner or display ad SDKs, but integrates extensive analytics, attribution, diagnostic reporting, performance tracking, device profiling, and integrity verification frameworks: Datadog RUM and logging, Firebase Analytics, Firebase Crashlytics, Kochava attribution tracker, Google Play Advertising ID harvesting, Intuit internal telemetry (Scribe / UXFabric), Segment clickstream analytics, Qualtrics feedback tracking, first-party New Relic event streaming, MiSnap IAD KYC compromise checkers, ThreatMetrix fraud profiling, and NokNok FIDO Play Integrity attestation. The Luciq APM SDK shipped in 26.40 is no longer present in 26.47.

---

## Technology Stack & Components

- **UI Framework**: Android Jetpack Compose, Fragments, Material Design 3.
- **Entry Points**: `com.creditkarma.mobile.SplashActivity`, `com.creditkarma.mobile.MainActivity`.
- **Datadog RUM & Logging**: `com.datadog.android.core.UploadWorker` and `io.scribeup.scribeupsdk.util.DatadogBootstrap` for capturing UI sessions, performance metrics, and network payloads. R8 collapses the worker entry point to `UploadWorker.a()` returning `androidx.work.c$a$c`.
- **Attribution & Device Identification**: `com.kochava.tracker.Tracker` and `com.google.android.gms.ads.identifier.AdvertisingIdClient` harvesting AAID and install referrer data.
- **Diagnostic & Crash Reporting**: Minified Firebase Crashlytics (`Lxhf;` API, `Ltt8;` report core, `Lop7;` device/root metadata) and Firebase Analytics (`AppMeasurementSdk`, `AppMeasurement`).
- **Internal Intuit Telemetry**: `io.scribeup.scribeupsdk` and Intuit Scribe logging repositories, plus the UXFabric Segment integration (`xpa`) backed by `com.segment.analytics`.
- **Qualtrics Feedback Tracking**: `com.qualtrics.digital.Qualtrics` project initialization and intercept evaluation, configured against `creditkarma.az1.qualtrics.com`.
- **New Relic Event Telemetry**: `com.creditkarma.mobile.tracking.newrelic.b$a` enqueues app and background events into `LinkedBlockingQueue`; serialized and uploaded via WorkManager `NewRelicWorker` calling `NewRelicService.trackEvents`.
- **MiSnap IAD Document KYC**: `com.miteksystems.misnap.controller.iad.checker.b` scans for root binaries, test-keys, Magisk, and writable partitions during document capture; `vu10.a()` detects emulator build fingerprints before `ws30.rootedDevice_` is serialized into the document-capture payload.
- **ThreatMetrix Fraud Profiling**: `com.lexisnexisrisk.threatmetrix.tmxprofiling` collects device characteristics, SELinux mode, root binaries, APK self-hashes (MD5/SHA256), and tamper indicators, assisted by native library `libTMXProfiling-7.7-71-jni.so`.
- **FIDO / Play Integrity Attestation**: `com.noknok.android.client.extension.PlayIntegrity` queries Google Play Integrity tokens for FIDO authentication flows; `JailBreakRiskSignal` serializes device compromise state.
