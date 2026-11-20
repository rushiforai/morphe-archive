# Credit Karma Patch Specifications

## Overview

This document specifies patches for **Credit Karma** (`com.creditkarma.mobile`).

---

## Patch: Remove Tracking

- **Name:** Remove Tracking
- **Target Package:** `com.creditkarma.mobile`
- **Supported Versions:** `26.40`
- **Default State:** `true` (Enabled by default)
- **Type:** Dalvik Bytecode Patch (`bytecodePatch`)
- **Category:** `Privacy`
- **Dependencies:** None
- **Compatibility:** `COMPATIBILITY_CREDIT_KARMA` (`ApkFileType.APKM`, target `26.40`, `minSdk` 32)
- **Options:**
  - `Zero Advertising ID` (`zeroAdvertisingId`, default `true`): Spoofs the Google Play Advertising ID and Kochava client to return an all-zero identifier (`00000000-0000-0000-0000-000000000000`) and force limit-ad-tracking.
  - `Disable Firebase Analytics` (`disableFirebaseAnalytics`, default `true`): Blocks Firebase Analytics and Google Play AppMeasurement event and property logging.
  - `Disable Crashlytics` (`disableCrashlytics`, default `true`): Neutralizes Firebase Crashlytics crash reporting and diagnostic logging.
  - `Disable Datadog Telemetry` (`disableDatadog`, default `true`): Blocks Datadog initialization, SDK logger, and background upload workers.
  - `Disable Kochava Tracker` (`disableKochava`, default `true`): Neutralizes Kochava attribution, event tracking, and background jobs.
  - `Disable Scribe & Diagnostic Uploads` (`disableScribe`, default `true`): Neutralizes Intuit Scribe telemetry and diagnostic log upload tasks.
  - `Disable New Relic Telemetry` (`disableNewRelic`, default `true`): Blocks Credit Karma New Relic event collection and background upload scheduling.
  - `Disable Luciq Telemetry & Session Recording` (`disableLuciqTelemetry`, default `true`): Neutralizes Luciq APM session updates, auto screen recording, and diagnostic screenshot collection.
  - `Neutralize Root & Emulator Detection` (`neutralizeRootDetection`, default `true`): Forces local root, su binary, build tags, and emulator detection checks to report clean across Luciq, MiSnap IAD, ThreatMetrix, and diagnostic loggers.
  - `Neutralize Integrity & Attestation Checks` (`neutralizeIntegrityAttestation`, default `true`): Bypasses NokNok Play Integrity and JailBreak signals, Firebase App Check Play Integrity provider, and ThreatMetrix APK self-hash, tamper code, and malicious app profiling.

### 1. Motivation & Purpose

Credit Karma bundles several analytics, performance monitoring, attribution, and logging backends:

1. Google Play Advertising ID queries and Kochava attribution tracking collect device IDs.
2. Datadog captures session RUM data and schedules background uploads via WorkManager `UploadWorker`.
3. Firebase Analytics logs user interactions and property states.
4. Crashlytics uploads crash diagnostics and device state.
5. Intuit Scribe and ScribeUp SDK log diagnostics and user telemetry.
6. New Relic event dispatcher and WorkManager `NewRelicWorker` collect and upload UI and background events.
7. Luciq APM and bug reporting capture session replay, screen recordings, and diagnostic logs.
8. Local root, emulator, tamper, and integrity attestation checks (Luciq, MiSnap IAD KYC, ThreatMetrix, NokNok FIDO, and Firebase App Check) flag modified, rooted, or re-signed environments.

The **Remove Tracking** patch neutralizes these trackers, telemetry collectors, and integrity/root checks while preserving financial account sync, credit score viewing, marketplace browsing, and user interactions.

---

### 2. Technical Implementation

#### Layer 1: Google Play Advertising ID Spoofing

- **Target Class:** `Lcom/google/android/gms/ads/identifier/AdvertisingIdClient;`
  - Method `getAdvertisingIdInfo(Landroid/content/Context;)Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;` returns synthetic `Info("00000000-0000-0000-0000-000000000000", true)`.
- **Target Class:** `Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;`
  - Method `getId()Ljava/lang/String;` returns `"00000000-0000-0000-0000-000000000000"`.
  - Method `isLimitAdTrackingEnabled()Z` returns constant `true`.
- **Target Class:** `Lcom/kochava/core/util/AdvertisingIdClient;`
  - Method `getId()Ljava/lang/String;` returns `"00000000-0000-0000-0000-000000000000"`.

#### Layer 2: Firebase Analytics & Crashlytics Neutralization

- **Target Class:** `Lcom/google/firebase/analytics/FirebaseAnalytics;`
  - Neutralizes `logEvent`, `setAnalyticsCollectionEnabled`, `setUserId`, `setUserProperty`, `resetAnalyticsData`, `setDefaultEventParameters`, `setConsent`.
- **Target Class:** `Lcom/google/android/gms/measurement/AppMeasurement;`
  - Neutralizes `logEventInternal`, `setUserPropertyInternal`.
- **Target Class:** `Lcom/google/firebase/crashlytics/FirebaseCrashlytics;` and minified `Lvld;`
  - Neutralizes logging, report dispatch, and exception recording.

#### Layer 3: Datadog Telemetry Neutralization

- **Target Class:** `Lcom/datadog/android/Datadog;`
  - Neutralizes `initialize`, `setTrackingConsent`, `setUserInfo`, `addUserProperties`, `clearAllData`.
- **Target Class:** `Lio/scribeup/scribeupsdk/util/DatadogBootstrap;`
  - Neutralizes `initialize`, returns null for `logger`.
- **Target Class:** `Lcom/datadog/android/core/UploadWorker;`
  - Method `doWork()Landroidx/work/c$a;` returns `new Landroidx/work/c$a$c;` (`Result.success()`) immediately without performing network uploads.

#### Layer 4: Kochava & Scribe Neutralization

- **Target Class:** `Lcom/kochava/tracker/Tracker;`
  - Neutralizes `e`, `f`, `d`, `g`, `start`, `sendEvent`, `setAppLimitAdTracking`.
- **Target Class:** `Lcom/intuit/mobile/scribe/ScribeClient;` and `Lio/scribeup/scribeupsdk/data/repository/LoggingRepository;`
  - Neutralizes `sendEvent`, `track`, `uploadHtmlFile`.

#### Layer 5: New Relic & Luciq Telemetry Neutralization

- **Target Class:** `Lcom/creditkarma/mobile/tracking/newrelic/b$a;`
  - Neutralizes `b(Lwxm;Ljava/lang/String;Ljava/util/Map;)V`, preventing event queuing into `LinkedBlockingQueue`. `NewRelicWorker` drains an empty queue and finishes without invoking `NewRelicService.trackEvents`.
- **Target Class:** `Lai/luciq/apm/APMPlugin;`
  - Neutralizes `endSession`, `updateCurrentSession`.
- **Target Class:** `Lai/luciq/bug/BugReporting;`
  - Neutralizes `setAutoScreenRecordingEnabled`, `setScreenshotByMediaProjectionEnabled`.

#### Layer 6: Root & Emulator Detection Neutralization

- **Target Class:** `Lcmy;`, `Lfv9;`, and `Lai/luciq/library/model/State;`
  - Methods `cmy.h()Z`, `fv9.t()Z`, and `State.isDeviceRooted()Z` return constant `false`.
- **Target Class:** `Lcom/miteksystems/misnap/controller/iad/checker/b;`
  - Methods `c()Z` (compromise/root checker), `a(Ljava/lang/String;)Z` (file existence), and `b(Ljava/util/ArrayList;)Z` (path scan) return constant `false`.
- **Target Class:** `Lyfz;`
  - Method `a()Z` (emulator detector) returns constant `false`, preventing `fuz.rootedDevice_` from being set in document capture payloads.
- **Target Class:** `Lcom/lexisnexisrisk/threatmetrix/tmxprofiling/bbbbwbw;`
  - Neutralizes `xx0078x0078x0078`, suppressing `ROOT_DETECTION_PATH_COUNT` and `ROOT_DETECTION_PATH_STR`.
- **Target Class:** `Lcom/lexisnexisrisk/threatmetrix/tmxprofiling/bbwbbbb;`
  - In method `uuu007500750075u`, returns an empty `ArrayList` immediately to abort root binary path scans.
- **Target Class:** `Lru6;`
  - Methods `g()Z` (root check) and `f()Z` (emulator check) return constant `false`.
- **Target Class:** `Lks8;`
  - Method `d()Lpxg;` returns `pxg.b(true)` immediately to report a clean hardware environment without scanning for su binaries.

#### Layer 7: Integrity Attestation & FIDO Anti-Tamper Neutralization

- **Target Class:** `Lcom/noknok/android/client/extension/PlayIntegrity;`
  - In `start`, resets state flag `a` to `false`. In `finishAsync`, bypasses Play Integrity token requests and immediately calls `ICompletionCallback.onComplete(Boolean.TRUE, null)`.
- **Target Class:** `Lcom/noknok/android/client/extension/JailBreakRiskSignal;`
  - Neutralizes `start` and in `finishAsync` immediately invokes `ICompletionCallback.onComplete(Boolean.TRUE, null)`.
- **Target Class:** `Lcom/google/firebase/appcheck/playintegrity/FirebaseAppCheckPlayIntegrityRegistrar;`
  - Method `getComponents()Ljava/util/List;` returns an empty `ArrayList`, neutralizing Play Integrity App Check provider registration.

#### Layer 8: ThreatMetrix Profiling & Tamper Neutralization

- **Target Class:** `Lcom/lexisnexisrisk/threatmetrix/tmxprofiling/bbwbwbw;`
  - Neutralizes `xx0078x0078x0078`, suppressing `APP_SELF_HASH_MD5` and `APP_SELF_HASH_SHA256` reporting.
- **Target Class:** `Lcom/lexisnexisrisk/threatmetrix/tmxprofiling/gnnnggg;`
  - Neutralizes `xx0078x0078x0078`, suppressing `TAMPER_CODE_BASE_MODULE` and `TAMPER_CODE_AUTH_MODULE`.
- **Target Class:** `Lcom/lexisnexisrisk/threatmetrix/tmxprofiling/bbbbbwb;`
  - Neutralizes `xx0078x0078x0078`, suppressing `MALICIOUS_APP_STATUS`.
- **Target Class:** `Lcom/lexisnexisrisk/threatmetrix/tmxprofiling/bbwbbbb;`
  - Method `n006En006Ennn()` returns constant `bbbwwbw.ENFORCING`.
