# Adobe Acrobat Reader Patch Specifications

## Overview

This document specifies patches for **Adobe Acrobat Reader** (`com.adobe.reader`).

---

## Patch: Remove Ads and Tracking

- **Name:** Remove Ads and Tracking
- **Target Package:** `com.adobe.reader`
- **Supported Versions:** `26.9.2.50367`
- **Default State:** `true` (Enabled by default)
- **Type:** Dalvik Bytecode Patch (`bytecodePatch`)
- **Category:** `Ads`
- **Dependencies:** None
- **Compatibility:** `COMPATIBILITY_ADOBE_READER` (`ApkFileType.APKM`, target `26.9.2.50367`, `minSdk` 28)
- **Options:**
- `Disable Telemetry & Tracking` (`removeTracking`, default `true`): Disables Adobe MobileCore, EventHub, Document Cloud Analytics (DCMAnalytics and ARDCMAnalytics), Adobe Growth Platform (DGP/MAU), Adobe Journey Optimizer (AJO), Branch attribution, Creative SDK, Next Best Action (NBA) tools profiling, Facebook App Events, Firebase Performance, Firebase Sessions, Crashlytics, and zeroes the Google Play Advertising ID.
- `Disable In-App Ads & Paywalls` (`removeAds`, default `true`): Disables in-app ads (AdMob banners, native ads, document-close interstitials, rewarded edit interstitials, and prefetching), ad performance metrics, ad analytics, dynamic paywalls, and in-app review prompts.
- `Remove Settings` (`removeSettings`, default `true`): Removes the Send usage info and Send crash reports preferences from the Preferences menu, and suppresses crash reporting dialogs.

### 1. Motivation & Purpose

Adobe Acrobat Reader incorporates extensive telemetry tracking, promotional campaigns, ad networks, and rating popups:

1. Master telemetry gate `com.adobe.reader.F.a0()Z` controls document and user action dispatch.
2. Adobe MobileCore and EventHub dispatch telemetry events to Adobe Experience Platform.
3. DCMAnalytics and ARDCMAnalytics collect document lifecycle events and user actions.
4. Adobe Growth Platform (DGP) initializes via `GrowthSDKInitializer` and reports MAU pings via `DGPMau`.
5. Adobe Journey Optimizer (AJO) ingests user interaction events for automated campaigns.
6. Next Best Action (NBA) tools profiling records user document interactions to SQLite.
7. Branch Metrics tracks installs, logins, deep links, and user activity.
8. Creative SDK logs analytics to Adobe backends via `AdobeAnalyticsETSJob` and `cc-api-data`.
9. Google Mobile Ads (AdMob) serves interstitials, rewarded ads, and banners.
10. Firebase Performance, Firebase Sessions, and UI jank metrics harvest runtime telemetry.
11. Google Play Advertising ID queries harvest unique ad identifiers.
12. Play Core Review prompts in-app rating dialogs during active sessions.
13. Dynamic paywall managers present promotional upgrade screens.

The **Remove Ads and Tracking** patch disables these ad, tracking, and telemetry layers while ensuring full offline and online document viewing, annotation, form filling, and PDF management functionality.

---

### 2. Technical Implementation

#### Layer 1: Master Telemetry Switch & MobileCore / EventHub Neutralization

- **Target Class:** `Lcom/adobe/reader/F;`
  - Method `a0()Z` returns `false` to disable root telemetry action dispatch.
- **Target Class:** `Lcom/adobe/marketing/mobile/internal/eventhub/EventHub;`
  - Neutralizes event dispatch methods `F`, `H`, `h0`.
- **Target Class:** `Lcom/adobe/marketing/mobile/S;` (MobileCore facade)
  - Neutralizes dispatch and tracking methods: `a` (collectData), `b`, `c`, `d` (dispatchEvent), `e`, `i` (lifecyclePause), `j` (lifecycleResume), `m`, `p` (setPrivacyStatus), `q`, `r` (trackAction), `s`.
- **Target Class:** `Lcom/adobe/marketing/mobile/MobileCoreInitializer;`
  - Neutralizes extension registration (`c`) and application init (`d`).

#### Layer 2: DCMAnalytics, ARDCMAnalytics & In-App Analytics Neutralization

- **Target Class:** `Lcom/adobe/reader/analytics/ARDCMAnalytics;`
  - Neutralizes `trackAction` (all overloads), `K2`, `i3`.
- **Target Class:** `Lcom/adobe/dcmanalytics/DCMAnalytics;`
  - Neutralizes event dispatching methods: `A1`, `B1`, `C1`, `M0`, `N0`, `z1`, `q1`, `s1`, `w1`, `y1`.
  - Methods `e1()Z`, `g1()Z`, `S0()Z` return `false`.
- **Target Class:** `Lcom/adobe/reader/analytics/ARInAppAnalytics;`
  - Neutralizes `d` (in-app SQLite storage) and tracking entry points `e`, `f`, `g`.
- **Target Class:** `Lcom/adobe/reader/analytics/ARAppLaunchAnalytics;`
  - Neutralizes launch analytics dispatcher `e`.

#### Layer 3: Adobe Growth Platform (DGP / MAU) & AJO Neutralization

- **Target Class:** `Lcom/adobe/dgp/e;`
  - Neutralizes `b`, `onStart`, `onStop`, `onDestroy` to prevent lifecycle registration.
- **Target Class:** `Lcom/adobe/dgp/DGPMau;`
  - Neutralizes `dispatchMau`, `dispatchMauInternal`, `onBackground`, `onForeground`, `onEmbeddedMau`.
- **Target Class:** `Lcom/adobe/dgp/DGPAEPBridge;`
  - Methods `readyForEvent` and `isExtensionRegistered` return `false`.
- **Target Class:** `Lcom/adobe/reader/ajo/ARAJOManager;`
  - Neutralizes event ingestion methods `F`, `A`, `E`, `y`, `z`.
- **Target Class:** `Lcom/adobe/dcmanalytics/ajo/AJOHelper;`
  - Neutralizes `b`, `onRegistered`; method `readyForEvent` returns `false`.

#### Layer 4: Next Best Action (NBA) Profiling Neutralization

- **Target Class:** `Lcom/adobe/libs/nba/repos/ARNbaRepo;`
  - Method `b(ARAangTools, String, ToolEventType, Continuation)` injects `sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit; return-object v0` to suppress logging tool usage to SQLite.

#### Layer 5: Branch Deep-Link Attribution Neutralization

- **Target Class:** `Lcom/adobe/reader/utils/ARBranchEventTracker;`
  - Neutralizes user identity binding `c` (`Branch.N().x0(member_guid)`), and tracking methods `d`, `e`, `g`, `h`, `i`.
  - Methods `b()Z` and `f()Z` return `false`.
- **Target Class:** `Lio/branch/referral/Branch;`
  - Method `C0(Z)V` forces `p0 = true` (tracking disabled).

#### Layer 6: Creative SDK & Facebook App Events Neutralization

- **Target Class:** `Lcom/adobe/creativesdk/foundation/internal/analytics/b;`, `c;`, `n;`, `g;`
  - Void tracking methods neutralized.
- **Target Class:** `Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsETSJob;`
  - Method `onRun` neutralized.
- **Target Class:** `Lcom/adobe/creativesdk/foundation/internal/analytics/e;`
  - Method `g(String, boolean)` returns `null`.
- **Target Class:** `Lcom/facebook/internal/FacebookInitProvider;`
  - Method `onCreate` returns `false` to block auto-initialization.
- **Target Class:** `Lcom/facebook/appevents/AppEventsLoggerImpl;` and `AppEventsLogger;`
  - Neutralizes void logging methods.
- **Target Class:** `Lcom/facebook/appevents/gps/ara/GpsAraTriggersManager;` and `GpsTopicsManager;`
  - Neutralizes Privacy Sandbox attribution trigger and topics harvesting.

#### Layer 7: Firebase Performance, Sessions & Diagnostics Neutralization

- **Target Class:** `Lcom/google/firebase/perf/provider/FirebasePerfProvider;`
  - Method `onCreate` returns `false`.
- **Target Class:** `Lcom/google/firebase/perf/metrics/AppStartTrace;`
  - Neutralizes lifecycle hooks `onActivityCreated`, `onActivityStarted`, `onActivityResumed`.
- **Target Class:** `Lcom/google/firebase/sessions/SessionFirelogPublisherImpl;`
  - Method `h()` (`shouldLogSession`) returns `false`; methods `a` and `g` neutralized.
- **Target Class:** `Lcom/google/android/gms/internal/measurement/zzee;` and `AppMeasurement;`
  - Neutralizes `E` (logEvent), `D` (setUserId), `e` (setMeasurementEnabled), `f` (setUserProperty).
- **Target Class:** `Lcom/google/firebase/crashlytics/FirebaseCrashlytics;`
  - Neutralizes reporting methods and returns `false` from `didCrashOnPreviousExecution`.
- **Target Class:** `Lcom/adobe/reader/performance/ARActivityFrameMetrics;`
  - Neutralizes frame metric callbacks `onActivityStarted`, `onActivityStopped`, `onActivityResumed`, `onActivityPaused`.

#### Layer 8: AAID Client Spoofing & Referrer Neutralization

- **Target Class:** `Lcom/google/android/gms/ads/identifier/AdvertisingIdClient;`
  - Returns synthetic `Info("00000000-0000-0000-0000-000000000000", true)`.
- **Target Class:** `Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;`
  - Method `getId()` returns `"00000000-0000-0000-0000-000000000000"`.
  - Method `isLimitAdTrackingEnabled()` returns `true`.
- **Target Class:** `Lcom/android/installreferrer/api/InstallReferrerClientImpl;`
  - Neutralizes `startConnection`.
- **Target Class:** `Lcom/adobe/reader/misc/ARInstallReferrerBroadcastReceiver;`
  - Neutralizes Intune MAM broadcast handler `onMAMReceive(Context, Intent)`.

#### Layer 9: In-App Ads Engine & Paywalls Suppression (`removeAds`)

- **Target Class:** `Lcom/adobe/reader/ads/utils/ARAdUtils;`
  - Methods `r0()Z` (areAdsEnabled), `l0()Z`, `O()Z`, `W()Z`, `N()Z`, `C0()Z` return `false`.
- **Target Class:** `Lcom/adobe/reader/ads/g;` (ARAdConfig)
  - Neutralizes SDK initialization methods `g` and `e`.
- **Target Class:** `Lcom/adobe/reader/ads/ARBannerAdsPool;`
  - Neutralizes `g` (fetchAd) and `n` (prefetchBannerAds).
- **Target Class:** `Lcom/adobe/reader/ads/l;` (ARAdDisplayPolicy)
  - Methods `c()Z` and `d()Z` return `false`.
- **Target Class:** `Lcom/adobe/reader/ads/analytics/ARAdAnalytics;`
  - Neutralizes tracking methods `l`, `f`, `g`, `h`, `i`, `j`, `k`.
- **Target Class:** `Lcom/adobe/reader/ads/performance/a;`
  - Neutralizes latency measurement methods `f`, `g`, `h`, `i`, `j`, `k`, `l`.
- **Target Class:** `Lcom/google/android/play/core/review/d;`
  - Method `b(Activity, ReviewInfo)` injects `const/4 p1, 0x0; invoke-static {p1}, Tasks->f; return-object p1` to return immediately without presenting dialogs.
- **Target Class:** `Lcom/adobe/reader/marketingPages/dynamicPaywall/ARDynamicPaywallManager;`
  - Methods `P()Z`, `S()Z`, `T()Z` return `false`.

#### Layer 10: Preferences & Settings Removal (`removeSettings`)

- **Target Class:** `Lcom/adobe/reader/settings/D0;`
  - Preference change handlers `M7(SharedPreferences)` ("Send usage info") and `b5(SharedPreferences)` ("Send crash reports") neutralized to return immediately without applying state.
  - In `onViewCreated(View, Bundle)`, injects `SettingsBridge.hideTelemetryPreferences(p0)` (`invoke-static/range`), resolving the "Usage info" preference category containing "Send usage info" (`0x7f1524a6`), its summary link (`0x7f1524a7`), and "Send crash reports" (`0x7f152433`), invoking `setVisible(false)` on the parent category and individual items to hide them safely from the Preferences screen without corrupting Dalvik branch offsets.
- **Target Class:** `Lcom/adobe/reader/utils/v;` and `Lcom/adobe/reader/misc/l;`
  - Neutralizes `v->E0(FragmentActivity)` and suppresses the `com.adobe.reader.misc.l` crash report dialog on start, ensuring no prompt appears on app launch.
