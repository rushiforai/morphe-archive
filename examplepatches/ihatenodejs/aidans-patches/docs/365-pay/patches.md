# 365 Pay Patch Specifications

## Overview

This document specifies patches for **365 Pay** (`com.avinside`).

---

## Patch: Remove Ads

- **Name:** Remove Ads
- **Target Package:** `com.avinside`
- **Supported Versions:** `10.2605.0`
- **Default State:** `true` (Enabled by default)
- **Type:** Dalvik Bytecode Patch (`bytecodePatch`)
- **Dependencies:** None
- **Compatibility:** `COMPATIBILITY_365_PAY` (`ApkFileType.APKM`, target `10.2605.0`, `minSdk` 27)
- **Options:**
  - `Remove In-App Messages` (`removeInAppMessages`, default `true`): Suppresses OneSignal promotional campaigns and marketing message displays.
  - `Remove Review Prompts` (`removeReviewPrompts`, default `true`): Neutralizes Google Play in-app review and rating prompts.
  - `Zero Advertising ID` (`zeroAdvertisingId`, default `true`): Spoofs Google Play and Huawei Advertising ID (AAID) with zeroes and forces limit ad tracking enabled.

### Technical Implementation & Injection Points

1. **In-App Review Silencing:**
   - **Target Class:** `Lcom/ibits/react_native_in_app_review/AppReviewModule;`
   - **Target Methods:** `show(Lcom/facebook/react/bridge/Promise;)V`, `showInAppCommentHMS(Lcom/facebook/react/bridge/Promise;)V`
   - **Effect:** Immediately resolves the pending JS Promise with `Boolean.FALSE` and returns, preventing display of the Google Play rating dialog.

2. **OneSignal In-App Message Suppression:**
   - **Target Class:** `Lcom/onesignal/inAppMessages/internal/display/impl/InAppDisplayer;`
   - **Target Methods:** `displayMessage(Lcom/onesignal/inAppMessages/internal/InAppMessage;LFl/e;)Ljava/lang/Object;`, `displayPreviewMessage(Ljava/lang/String;LFl/e;)Ljava/lang/Object;`
   - **Effect:** Returns `Boolean.FALSE`, blocking the display of modal/popup promotional message cards.
   - **Target Class:** `Lcom/onesignal/inAppMessages/internal/InAppMessagesManager;`
   - **Target Methods:** `getPaused()Z` (returns `true`), `start()V` (returns immediately).

3. **Advertising ID Spoofing:**
   - **Target Class:** Minified `Lb6/a;` (`a(Landroid/content/Context;)Lb6/a$a;`) and `Lb6/a$a;` (`a()Ljava/lang/String;`, `b()Z`), unminified `Lcom/google/android/gms/ads/identifier/AdvertisingIdClient;`, and `Lcom/huawei/hms/ads/identifier/AdvertisingIdClient;`
   - **Effect:** Returns zeroed UUID `00000000-0000-0000-0000-000000000000` and `limitAdTracking = true`.

---

## Patch: Remove Tracking

- **Name:** Remove Tracking
- **Target Package:** `com.avinside`
- **Supported Versions:** `10.2605.0`
- **Default State:** `true` (Enabled by default)
- **Type:** Dalvik Bytecode Patch (`bytecodePatch`)
- **Dependencies:** None
- **Compatibility:** `COMPATIBILITY_365_PAY` (`ApkFileType.APKM`, target `10.2605.0`, `minSdk` 27)
- **Options:**
  - `Disable Firebase Analytics` (`disableFirebaseAnalytics`, default `true`): Blocks React Native Firebase Analytics and Google Play AppMeasurement event tracking.
  - `Disable Firebase Crashlytics` (`disableCrashlytics`, default `true`): Neutralizes Firebase Crashlytics crash reporting and diagnostic logging.
  - `Disable Instana APM` (`disableInstana`, default `true`): Neutralizes Instana End-User Monitoring (EUM) and background telemetry workers.
  - `Disable Branch Metrics` (`disableBranch`, default `true`): Neutralizes Branch Metrics attribution and event tracking.
  - `Disable OneSignal Telemetry` (`disableOneSignalTracking`, default `true`): Blocks OneSignal custom events, session outcomes, tags, and location tracking.

### Technical Implementation & Injection Points

1. **Firebase Analytics & AppMeasurement:**
   - **Target Class:** `Lio/invertase/firebase/analytics/ReactNativeFirebaseAnalyticsModule;`
   - **Methods:** `logEvent`, `setAnalyticsCollectionEnabled`, `setUserProperties`, `setUserId`, `setUserProperty`, `setDefaultEventParameters`, `resetAnalyticsData`, `setConsent`
   - **Target Class:** `Lcom/google/android/gms/measurement/AppMeasurement;` (`logEventInternal`), `Lcom/google/firebase/analytics/FirebaseAnalytics;`

2. **Firebase Crashlytics:**
   - **Target Class:** `Lio/invertase/firebase/crashlytics/ReactNativeFirebaseCrashlyticsModule;`
   - **Methods:** `log`, `logPromise`, `recordError`, `recordErrorPromise`, `sendUnsentReports`, `deleteUnsentReports`, `setCrashlyticsCollectionEnabled`, `setUserId`, `setAttribute`, `setAttributes`
   - **Target Class:** `Lcom/google/firebase/crashlytics/FirebaseCrashlytics;` (`log`, `recordException`, `sendUnsentReports`, `deleteUnsentReports`, `setCustomKey`, `setUserId`, `isCrashlyticsCollectionEnabled` returning `false`, `setCrashlyticsCollectionEnabled` forced to `false`)
   - **Target Class:** `Lio/invertase/firebase/crashlytics/ReactNativeFirebaseCrashlyticsInitProvider;` (`a` returning `false`)
3. **Instana APM / EUM:**
   - **Target Class:** `Lcom/instana/rn/InstanaEumModule;` (`setup`, `reportEvent`, `setUserID`, `setUserEmail`, `setUserName`, `setMeta`, `setView`, `setCollectionEnabled`)
   - **Target Workers:** `Lcom/instana/android/core/event/worker/EventWorker;` and `Lcom/instana/android/performance/network/NetworkUsageWorker;` stubbed to return `ListenableWorker.Result.success()` without transmitting telemetry payloads.

4. **Branch Metrics:**
   - **Target Class:** `Lio/branch/rnbranch/RNBranchModule;` (`initSession`, `reInitSession`, `onNewIntent`, `getAutoInstance`, `disableTracking`, `notifyNativeToInit`, `logout`, `setPreinstallCampaign`, `setPreinstallPartner`, `logEvent`, `setIdentity`, `setIdentityAsync`, `registerView`, `createUniversalObject`, `generateShortUrl`, `getBranchQRCode`, `getFirstReferringParams`, `getLatestReferringParams`, `isTrackingDisabled`, `lastAttributedTouchData`, `redeemInitSessionResult`, `showShareSheet`, `addFacebookPartnerParameter`, `setRequestMetadataKey`, `clearPartnerParameters`)
   - **Target Class:** `LSj/d;` (`o0`)
5. **OneSignal Session, Outcomes & Location:**
   - **Target Class:** `Lcom/onesignal/rnonesignalandroid/RNOneSignal;` (`trackEvent`, `addOutcome`, `addOutcomeWithValue`, `addUniqueOutcome`, `addTag`, `addTags`, `setLocationShared`)
   - **Target Class:** `Lcom/onesignal/session/internal/SessionManager;` (`addOutcome`, `addOutcomeWithValue`, `addUniqueOutcome`)
   - **Target Class:** `Lcom/onesignal/location/internal/controller/impl/GmsLocationController;` (`start` returning `Boolean.FALSE`, `setLocationAndFire`, `subscribe`, and `getLastLocation` returning `null`)

---

## Patch: Unlock Developer Tools

- **Name:** Unlock Developer Tools
- **Target Package:** `com.avinside`
- **Supported Versions:** `10.2605.0`
- **Default State:** `false` (Disabled by default)
- **Type:** Raw Resource Patch (`rawResourcePatch`)
- **Category:** Developer
- **Dependencies:** None
- **Compatibility:** `COMPATIBILITY_365_PAY` (`ApkFileType.APKM`, target `10.2605.0`, `minSdk` 27)
- **Options:**
  - `Unlock Developer Settings` (`unlockDeveloperSettings`, default `true`): Reduces the hidden Welcome Screen logo tap gesture from five taps to a single tap to open the Environment Settings menu.
  - `Start with Debug Messages` (`startWithDebugMessages`, default `false`): Initializes application state with Debug Messages enabled upon startup.
  - `Start in Demo Mode` (`startInDemoMode`, default `false`): Initializes application state with Demo Mode enabled upon startup.

### Technical Implementation & Injection Points

1. **Single-Tap Developer Screen Access (`unlockDeveloperSettings`):**
   - **Target File:** `assets/index.android.bundle` (Hermes bytecode v96)
   - **Target Function:** `_0x16a90c` (function index 53285, code offset `0xc20b07`)
   - **Context Anchor:** Offset `+0x98` matches string reference `'WelcomeScreen'` (`73 01 96 6b`).
   - **Instruction Anchor:** Relative offset `+0xa3` (absolute `0xc20baa`).
   - **Original Bytes:** `6e 01 05 b0 18 05` (`LoadConstUInt8 r1, 5` followed by `JGreaterEqual 24, r5, r1`).
   - **Replacement Bytes:** `6e 01 01 b0 18 05` (`LoadConstUInt8 r1, 1` followed by `JGreaterEqual 24, r5, r1`).

2. **Startup State Initialization (`startWithDebugMessages` and `startInDemoMode`):**
   - **Target File:** `assets/index.android.bundle` (Hermes bytecode v96)
   - **Target Function:** `_0x3844af` (function index 15766, code offset `0x85581a`)
   - **Invariant Anchor:** Relative offset `+0x6d` matches `77 09` (`LoadConstNull r9`).
   - **Debug Messages (`startWithDebugMessages`):**
     - **Instruction Anchor:** Relative offset `+0x183` preceding `PutNewOwnById r7, r10, isDebug` (`40 07 0a 5a ed`).
     - **Original Bytes:** `0b 0a 0a` (`Not r10, r10`, evaluating `!true -> false`).
     - **Replacement Bytes:** `0b 0a 09` (`Not r10, r9`, evaluating `!null -> true`).
   - **Demo Mode (`startInDemoMode`):**
     - **Instruction Anchor:** Relative offset `+0x1c0` preceding `PutNewOwnById r7, r10, demo` (`40 07 0a 4b a0`).
     - **Original Bytes:** `49 0a 0b 0a` (`GetByVal r10, r11, r10`).
     - **Replacement Bytes:** `0e 0a 09 09` (`Eq r10, r9, r9`, evaluating `null == null -> true`).

3. **Bundle Integrity:**
   - Recalculates bundle SHA-1 checksum over all bytes excluding the trailing 20-byte hash and overwrites the footer via `editor.updateFooterHash()`.

---

## Patch: Display Cutout Adaptation

- **Name:** Display Cutout Adaptation
- **Target Package:** `com.avinside`
- **Supported Versions:** `10.2605.0`
- **Default State:** `true` (Enabled by default)
- **Type:** Dalvik Bytecode Patch (`bytecodePatch`) with Extension DEX (`extendWith`)
- **Category:** General
- **Dependencies:** None
- **Compatibility:** `COMPATIBILITY_365_PAY` (`ApkFileType.APKM`, target `10.2605.0`, `minSdk` 27)
- **Extension Classes:** `app.aidan.extension.pay365.DisplayCutoutBridge`
- **Options:** None (fully automated and dynamic)

### Technical Implementation & Injection Points

1. **Problem Analysis:**
   - 365 Pay uses fixed layout metrics for its primary screens: top header height is hardcoded to 78 dp and header control rows start at 34 dp.
   - On notchless / bezel devices, the status bar is 24 dp, leaving +10 dp of clean vertical breathing room under the status bar.
   - On devices with a camera display cutout (e.g. Pixel 9 Pro XL), the status bar and cutout expand to ~62 dp (159 px). The fixed 34 dp offset causes the location selector dropdown and notification bell to overlap the camera punch-hole and notification shade swipe-down zone.

2. **Dynamic Adaptation Logic:**
   - **Target Class:** `Lcom/avinside/MainActivity;`
   - **Target Method:** `onCreate(Landroid/os/Bundle;)V`
   - **Injected Call:** `invoke-static {p0}, Lapp/aidan/extension/pay365/DisplayCutoutBridge;->init(Landroid/app/Activity;)V` right before `return-void`.
   - **Runtime Inset Measurement:** Listens to `WindowInsets` via `View.setOnApplyWindowInsetsListener`. Evaluates `cutoutTop = displayCutout.getSafeInsetTop()` and `statusBarTop = insets.getInsets(Type.statusBars()).top`.
   - **Cutout Guard & Dynamic Inset Calculation:** Evaluates `effectiveTop = Math.max(cutoutTop, statusBarTop)`. If `cutoutTop <= 0 && effectiveTop <= Math.round(36dp * density)`, the device has no significant cutout or punch hole and the bridge returns immediately without modifying layout views. Otherwise, `effectiveTop` is passed directly as `cutoutInsetTop` to drive view adaptations.
   - **Visual & Layout Alignment:**
     - Resolves tag anchors (`qa_dpd_SelectLocation`, `qa_Account.PageTitle_txt`, and `QRCode`) and traverses their parent hierarchies dynamically to locate enclosing header containers and pay screens.
     - Expands header bounds and scales the gradient background `ImageView` from pivot `y = 0` down by `cutoutInsetTop` to preserve continuous gradient coverage.
     - Disables clipping on parent containers (`setClipChildren(false)` and `setClipToPadding(false)`).
     - Shifts header views and action controls down by `cutoutInsetTop`, positioning them cleanly below the camera hole.
     - Derives body and pay-screen containers from the view hierarchy and applies top translation and bottom padding to maintain seamless vertical rhythm without clipping above the bottom navigation bar.
