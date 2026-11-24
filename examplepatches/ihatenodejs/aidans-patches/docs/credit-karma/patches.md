# Credit Karma Patch Specifications

## Overview

This document specifies patches for **Credit Karma** (`com.creditkarma.mobile`).

---

## Patch: Remove Tracking

- **Name:** Remove Tracking
- **Target Package:** `com.creditkarma.mobile`
- **Supported Versions:** `26.47`
- **Default State:** `true` (Enabled by default)
- **Type:** Dalvik Bytecode Patch (`bytecodePatch`)
- **Category:** `Privacy`
- **Dependencies:** None
- **Compatibility:** `COMPATIBILITY_CREDIT_KARMA` (`ApkFileType.APKM`, target `26.47`, `minSdk` 32)
- **Options:**
  - `Zero Advertising ID` (`zeroAdvertisingId`, default `true`): Spoofs the Google Play Advertising ID and Kochava client to return an all-zero identifier (`00000000-0000-0000-0000-000000000000`) and force limit-ad-tracking.
  - `Disable Firebase Analytics` (`disableFirebaseAnalytics`, default `true`): Blocks Firebase Analytics and Google Play AppMeasurement event logging.
  - `Disable Crashlytics` (`disableCrashlytics`, default `true`): Forces Firebase Crashlytics collection off and neutralizes report assembly and upload.
  - `Disable Datadog Telemetry` (`disableDatadog`, default `true`): Blocks Datadog initialization, ScribeUp logging, and background upload workers.
  - `Disable Kochava Tracker` (`disableKochava`, default `true`): Neutralizes Kochava attribution, event tracking, and background jobs.
  - `Disable Scribe & Diagnostic Uploads` (`disableScribe`, default `true`): Neutralizes Intuit Scribe telemetry and diagnostic log upload tasks.
  - `Disable New Relic Telemetry` (`disableNewRelic`, default `true`): Blocks Credit Karma New Relic event collection and background upload scheduling.
  - `Disable Segment Analytics` (`disableSegmentAnalytics`, default `true`): Blocks Segment event, screen, identity, and lifecycle collection used by the Intuit UXFabric clickstream.
  - `Disable Qualtrics Feedback Tracking` (`disableQualtrics`, default `true`): Blocks Qualtrics project initialization, intercept evaluation, and view-visit tracking.
  - `Neutralize Root & Emulator Detection` (`neutralizeRootDetection`, default `true`): Forces local root, su binary, build tags, and emulator detection checks to report clean across Crashlytics, MiSnap IAD, and ThreatMetrix.
  - `Neutralize Integrity & Attestation Checks` (`neutralizeIntegrityAttestation`, default `true`): Bypasses NokNok Play Integrity and JailBreak signals, Firebase App Check Play Integrity provider, and ThreatMetrix APK self-hash, tamper code, and malicious app profiling.

### 1. Motivation & Purpose

Credit Karma bundles several analytics, performance monitoring, attribution, and logging backends:

1. Google Play Advertising ID queries and Kochava attribution tracking collect device IDs.
2. Datadog captures session RUM data and schedules background uploads via WorkManager `UploadWorker`.
3. Firebase Analytics logs user interactions; Crashlytics uploads crash diagnostics, root/emulator state, and device metadata.
4. Intuit Scribe and the ScribeUp SDK log diagnostics and user telemetry.
5. New Relic event dispatcher and WorkManager `NewRelicWorker` collect and upload UI and background events.
6. The Intuit UXFabric Segment integration and the Segment SDK collect clickstream, screen, identity, and lifecycle events.
7. Qualtrics initializes feedback projects, evaluates intercepts, and records view visits and impressions.
8. Local root, emulator, tamper, and integrity attestation checks (Crashlytics, MiSnap IAD KYC, ThreatMetrix, NokNok FIDO, and Firebase App Check) flag modified, rooted, or re-signed environments.

Luciq APM and bug reporting were removed upstream in 26.47, so the patch no longer carries Luciq hooks.

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
  - Method `getId()Ljava/lang/String;` returns `"00000000-0000-0000-0000-000000000000"` when the class is present.

#### Layer 2: Firebase Analytics & Crashlytics Neutralization

- **Target Class:** `Lcom/google/android/gms/measurement/api/AppMeasurementSdk;`
  - Neutralizes `logEvent(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V`.
- **Target Class:** `Lcom/google/android/gms/measurement/AppMeasurement;`
  - Neutralizes `logEventInternal(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V`.
- **Target Class:** `Lcom/google/firebase/crashlytics/FirebaseCrashlytics;` and `Lvld;` (optional, for unminified/older layouts)
  - Neutralizes logging, report dispatch, and exception recording.
- **Target Class:** `Lxhf;` (minified Crashlytics API in 26.47)
  - Method `b(Z)V` receives a forced `false` argument, disabling collection even when the app opts in.
- **Target Class:** `Ltt8;` (minified Crashlytics report core)
  - Neutralizes report assembly, session, and upload entry points `b`, `c`, `d`, `g`, `h`.

#### Layer 3: Datadog Telemetry Neutralization

- **Target Class:** `Lio/scribeup/scribeupsdk/util/DatadogBootstrap;`
  - Neutralizes `initialize`, returns null for `logger`.
- **Target Class:** `Lio/scribeup/scribeupsdk/util/ScribeUpLog;`
  - Neutralizes `log` and `logException`.
- **Target Class:** `Lcom/datadog/android/core/UploadWorker;`
  - `doWork()Landroidx/work/c$a;` (26.40 layout) and `a()Landroidx/work/c$a$c;` (26.47 layout) return `new Landroidx/work/c$a$c;` (`Result.success()`) immediately without performing network uploads.

#### Layer 4: Kochava & Scribe Neutralization

- **Target Class:** `Lcom/kochava/tracker/Tracker;`
  - Neutralizes `d()`, `e(Context)`, `f(Context, String)`, and `g(String, xru)`.
- **Target Class:** `Lcom/intuit/mobile/scribe/ScribeClient;` (when present) and `Lio/scribeup/scribeupsdk/data/repository/LoggingRepository;`
  - Neutralizes `sendEvent`, `track`, and `uploadHtmlFile`.

#### Layer 5: New Relic, Segment & Qualtrics Neutralization

- **Target Class:** `Lcom/creditkarma/mobile/tracking/newrelic/b$a;`
  - Neutralizes `b(...)V`, preventing event queuing into `LinkedBlockingQueue`. `NewRelicWorker` drains an empty queue and finishes without invoking `NewRelicService.trackEvents`.
- **Target Class:** `Lcom/segment/analytics/Analytics;`
  - Neutralizes `track`, `screen`, `identify`, `group`, `alias`, `flush`, `run`, `runOnMainThread`, `performRun`, `fillAndEnqueue`, `recordScreenViews`, `trackApplicationLifecycleEvents`, `reset`, and `performInitializeIntegrations`.
- **Target Class:** `Lxpa;` (Intuit UXFabric Segment facade)
  - Neutralizes `track`, `trackEvent`, `flush`, and `reset`.
- **Target Class:** `Lcom/qualtrics/digital/Qualtrics;`
  - Neutralizes `initialize`, `initializeProject`, and `registerViewVisit`; `display`, `displayIntercept`, and `displayTarget` return `false`.

#### Layer 6: Root & Emulator Detection Neutralization

- **Target Class:** `Lcom/miteksystems/misnap/controller/iad/checker/b;`
  - Methods `c()Z` (compromise/root checker), `a(Ljava/lang/String;)Z` (file existence), and `b(Ljava/util/ArrayList;)Z` (path scan) return constant `false`.
- **Target Class:** `Lvu10;`
  - Method `a()Z` (emulator fingerprint detector) returns constant `false`, preventing `ws30.rootedDevice_` from being set in document capture payloads.
- **Target Class:** `Lop7;` (minified Crashlytics device metadata)
  - Methods `f()Z` (emulator check) and `g()Z` (root check) return constant `false`.
- **Target Class:** `Lcom/lexisnexisrisk/threatmetrix/tmxprofiling/bbbbwbw;`
  - Neutralizes `xx0078x0078x0078`, suppressing `ROOT_DETECTION_PATH_COUNT` and `ROOT_DETECTION_PATH_STR`.
- **Target Class:** `Lcom/lexisnexisrisk/threatmetrix/tmxprofiling/bbwbbbb;`
  - In method `uuu007500750075u`, returns an empty `ArrayList` immediately to abort root binary path scans.

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
