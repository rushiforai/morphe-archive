# Credit Karma Architecture & Reverse Engineering Specification

## Overview

| Attribute                   | Specification                                                                                                                                                                                                                               |
| --------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Application Name**        | Credit Karma                                                                                                                                                                                                                                |
| **Package Name**            | `com.creditkarma.mobile`                                                                                                                                                                                                                    |
| **Supported Version**       | `26.40` (Morphe Compatibility: `26.40`, `minSdk` 32)                                                                                                                                                                                        |
| **Analyzed Version Code**   | `17902817`                                                                                                                                                                                                                                  |
| **Target SDK**              | `36` (Android 16)                                                                                                                                                                                                                           |
| **Minimum SDK**             | `32` (Android 12L)                                                                                                                                                                                                                          |
| **APK Format**              | APKM (`base.apk`, `split_config.arm64_v8a.apk`, `split_config.en.apk`)                                                                                                                                                                      |
| **Package Signing SHA-256** | `f5ae9364524d92be9eb436eb7436d7c9efa9e1b4e823b0db6bc3989a4d84d0bf`                                                                                                                                                                          |
| **Architecture**            | Native Android/Kotlin; Jetpack Compose, Coroutines, WorkManager, Datadog RUM, Firebase Analytics, Crashlytics, Kochava Tracker, Intuit Scribe/UXFabric, New Relic Telemetry, Luciq APM, MiSnap IAD KYC, ThreatMetrix Profiling, NokNok FIDO |

Credit Karma is a personal finance, credit monitoring, and financial marketplace app. It does not employ third-party banner or display ad SDKs, but integrates extensive analytics, attribution, diagnostic reporting, performance tracking, device profiling, and integrity verification frameworks: Datadog RUM and logging, Firebase Analytics, Firebase Crashlytics, Kochava attribution tracker, Google Play Advertising ID harvesting, Intuit internal telemetry (Scribe / UXFabric), first-party New Relic event streaming, Luciq APM and session recording, MiSnap IAD KYC compromise checkers, ThreatMetrix fraud profiling, and NokNok FIDO Play Integrity attestation.

---

## Technology Stack & Components

- **UI Framework**: Android Jetpack Compose, Fragments, Material Design 3.
- **Entry Points**: `com.creditkarma.mobile.SplashActivity`, `com.creditkarma.mobile.MainActivity`.
- **Datadog RUM & Logging**: `com.datadog.android.core.UploadWorker` and `io.scribeup.scribeupsdk.util.DatadogBootstrap` for capturing UI sessions, performance metrics, and network payloads.
- **Attribution & Device Identification**: `com.kochava.tracker.Tracker` and `com.google.android.gms.ads.identifier.AdvertisingIdClient` harvesting AAID and install referrer data.
- **Diagnostic & Crash Reporting**: Minified Firebase Crashlytics (`Lvld;`) and Firebase Analytics.
- **Internal Intuit Telemetry**: `io.scribeup.scribeupsdk` and Intuit Scribe logging repositories.
- **New Relic Event Telemetry**: `com.creditkarma.mobile.tracking.newrelic.b$a` enqueues app and background events into `LinkedBlockingQueue`; serialized and uploaded via WorkManager `NewRelicWorker` calling `NewRelicService.trackEvents`.
- **Luciq APM & Bug Reporting**: `ai.luciq.apm` and `ai.luciq.bug` capture user sessions, automated screen recordings, and media projection screenshots; probes root status via `cmy.h()` and `fv9.t()`.
- **MiSnap IAD Document KYC**: `com.miteksystems.misnap.controller.iad.checker.b` scans for root binaries, test-keys, Magisk, and writable partitions during document capture; `yfz` detects emulator environments.
- **ThreatMetrix Fraud Profiling**: `com.lexisnexisrisk.threatmetrix.tmxprofiling` collects device characteristics, SELinux mode, root binaries, APK self-hashes (MD5/SHA256), and tamper indicators, assisted by native library `libTMXProfiling-7.7-71-jni.so`.
- **FIDO / Play Integrity Attestation**: `com.noknok.android.client.extension.PlayIntegrity` queries Google Play Integrity tokens for FIDO authentication flows; `JailBreakRiskSignal` serializes device compromise state.
