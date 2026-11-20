# NHL Patch Specification

## Overview

This document describes the Morphe bytecode patches available for **NHL** (`com.nhl.gc1112.free`).

| Patch                                        | Type            | Default | Description                                                                                                                                                                                                                                                                                                                                                                                                                       |
| -------------------------------------------- | --------------- | ------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Enable Notifications and Live Activities** | `bytecodePatch` | `true`  | Enables Firebase Cloud Messaging (FCM) push notifications and Live Activities (live game score lockscreen and notification drawer updates) by spoofing the release certificate SHA-1, bypassing Play Services signature checks for MicroG, and activating the live score tracker gate.                                                                                                                                            |
| **Remove Ads**                               | `bytecodePatch` | `true`  | Removes Google Ad Manager banner and native advertisements, disables Blaze story/moment sponsored placements, blocks Google Interactive Media Ads (IMA) video ad requests, and neutralizes Brightcove IMA mid-roll and pre-roll ad playback.                                                                                                                                                                                      |
| **Remove Tracking**                          | `bytecodePatch` | `true`  | Removes the OneTrust CMP tracking consent popup, zeros Google Play Advertising ID (AAID), blocks host application analytics, disables Firebase Analytics, AppMeasurement, Firebase Performance Monitoring, Crashlytics, and Sessions telemetry, neutralizes UrbanAirship and Blaze tracking, user activity, and logging, suppresses Brightcove video metrics reporting and backlog processing, and blocks Ticketmaster telemetry. |
| **Unlock Hidden Features**                   | `bytecodePatch` | `false` | Unlocks the internal Developer Settings menu, Draft Mini Tracker, and NHL GameZone on the Home surface, with independent options for each feature.                                                                                                                                                                                                                                                                                |

---

## Patch: Enable Notifications and Live Activities

- **Name:** Enable Notifications and Live Activities
- **Target Package:** `com.nhl.gc1112.free`
- **Supported Versions:** `17.0.0`
- **Default State:** `true` (Enabled by default)
- **Type:** Dalvik Bytecode Patch (`bytecodePatch`)
- **Category:** `Notifications`

### 1. Motivation & Purpose

In unmodified and standard patched builds, push notifications and Live Activities (real-time game score updates in the notification drawer and lockscreen) fail completely due to four compounding root causes:

1. **Firebase Installations (FIS) Certificate SHA-1 Mismatch:** Google Cloud API keys configured for Firebase Installations enforce Android package name and signing certificate SHA-1 digest restrictions. When the APK is modified and re-signed with a non-NHL keystore, `FirebaseMessaging.getToken()` queries `AndroidUtilsLight.getPackageCertificateHashBytes(Context, String)` to send the package SHA-1 in the `X-Android-Cert` HTTP header. Google's API gateway rejects non-NHL signatures with HTTP 403 `PERMISSION_DENIED` (`FIS_AUTH_ERROR`), completely preventing FCM token generation.
2. **OneTrust CMP Over-Suppression in Privacy Patches:** Consent Management Platform (CMP) tracking suppression previously stubbed all consent queries to `Denied` (`0`). However, the `Lqoj;` enum gates both ad tracking and essential push infrastructure (`UrbanAirshipCore`, `UrbanAirshipFcm`, `BlazePushSdk`). When consent is denied, `Lgce;->d()` invokes `tjf.a([Lqjf.j])` to clear all UrbanAirship feature permissions, disabling `Feature.PUSH` (`qjf.d`). Without `Feature.PUSH`, UrbanAirship refuses to register an FCM token, and `LiveActivityNotificationManager.start()` (`cla.smali`) aborts immediately.
3. **MicroG & Play Services Verification Failures:** On de-Googled devices running MicroG without OS-level signature spoofing, `GoogleSignatureVerifier` detects non-Google signatures on `com.google.android.gms` and rejects Play Services with `SERVICE_INVALID` (code 9).
4. **Live Activities Remote Gate Override:** The shipped game actions response model conditionally gates the live activity toggle (`showLiveActivityToggle` in `GameCenterViewModel` / `ip7.smali`) through `ActionsResponse.liveActivityEnabled` (`rd.j: Boolean`), preventing users from enabling live lockscreen scores unless enabled by the NHL backend.

The **Enable Notifications and Live Activities** patch resolves these issues natively within Dalvik bytecode and the Java extension bridge.

### 2. Options

| Key                          | Title                                     | Default | Description                                                                                                                     |
| ---------------------------- | ----------------------------------------- | ------- | ------------------------------------------------------------------------------------------------------------------------------- |
| `spoofCertificateHash`       | Spoof Certificate SHA-1                   | `true`  | Spoofs the release signing certificate SHA-1 in Firebase Installations requests so FCM registration succeeds on re-signed APKs. |
| `supportMicroG`              | Support MicroG & Unverified Play Services | `true`  | Bypasses GoogleSignatureVerifier checks to allow push registration with MicroG and unverified Play Services.                    |
| `forceLiveActivitiesEnabled` | Force Live Activities Enabled             | `true`  | Forces the Live Activity game score tracker toggle to be available on all live and upcoming games.                              |

### 3. Technical Implementation & Bytecode Hooks

1. **Release Certificate SHA-1 Spoofing (`spoofCertificateHash`):**
   - Targets `Lcom/google/android/gms/common/util/AndroidUtilsLight;->getPackageCertificateHashBytes(Landroid/content/Context;Ljava/lang/String;)[B`.
   - Injects at offset 0:

     ```smali
     invoke-static {}, Lapp/aidan/extension/nhl/PushBridge;->getCertificateHashBytes()[B
     move-result-object v0
     return-object v0
     ```

   - `PushBridge.getCertificateHashBytes()` returns the exact 20-byte SHA-1 digest of the official NHL release certificate (`9D:1B:1A:C8:28:E0:47:72:A7:34:91:D8:39:D9:85:2B:80:C4:66:92`), satisfying Firebase Installations HTTP API requirements.
2. **MicroG Signature Verifier Bypass (`supportMicroG`):**
   - Targets `Lcom/google/android/gms/common/GoogleSignatureVerifier;`:
     - `zza(Landroid/content/pm/PackageInfo;Z)Z`: injects `const/4 v0, 0x1` / `return v0`.
     - `isGooglePublicSignedPackage(Landroid/content/pm/PackageInfo;)Z`: injects `const/4 v0, 0x1` / `return v0`.
     - `isPackageGoogleSigned(Ljava/lang/String;)Z`: injects `const/4 v0, 0x1` / `return v0`.
     - `isUidGoogleSigned(I)Z`: injects `const/4 v0, 0x1` / `return v0`.
   - Targets `GooglePlayServicesUtilLight` and `GoogleApiAvailabilityLight`:
     - `isGooglePlayServicesAvailable(Landroid/content/Context;I)I`: injects `const/4 v0, 0x0` / `return v0` (`ConnectionResult.SUCCESS`).
     - `isGooglePlayServicesAvailable(Landroid/content/Context;)I`: injects `const/4 v0, 0x0` / `return v0` (`ConnectionResult.SUCCESS`).
3. **Smart Consent Routing (in `RemoveTrackingPatch`):**
   - Replaces blanket OneTrust denial with `PushBridge.isPushConsented(Object qojEnum)` in:
     - `Lgce;->c(Lqoj;)Z`: returns `true` for `UrbanAirshipCore`, `UrbanAirshipFcm`, and `BlazePushSdk`; `false` for `GoogleAds` and telemetry.
     - `Lqc8;->M(Lqoj;Lcom/onetrust/otpublishers/headless/Public/OTPublishersHeadlessSDK;)Lvu3;`: returns `Granted` for push SDKs, `Denied` for ad/tracking SDKs.
   - Ensures `gce.d()` preserves `Feature.PUSH` in `UrbanAirship.PrivacyManager`.
4. **Live Activities Gate Activation (`forceLiveActivitiesEnabled`):**
   - Targets `Lrd;-><init>(ILjava/lang/String;Ljava/lang/String;Lfva;Lfva;Lfva;Ljava/lang/String;Lfva;Lfva;Lfva;Ljava/lang/Boolean;)V` (`ActionsResponse` constructor):
     - Injects before `return-void`:

       ```smali
       sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
       iput-object v0, p0, Lrd;->j:Ljava/lang/Boolean;
       ```

   - Targets `Lrb;-><init>(Ljava/lang/String;Ljava/lang/String;Lafe;Lafe;Lafe;Leva;Lafe;Lafe;Z)V` (`Action` constructor):
     - Injects before `return-void`:

       ```smali
       const/4 p9, 0x1
       iput-boolean p9, p0, Lrb;->i:Z
       ```

   - Guarantees `GameCenterViewModel` (`ip7.smali`) computes `showLiveActivityToggle = true` for live and upcoming games.

---

## Patch: Remove Ads

- **Name:** Remove Ads
- **Target Package:** `com.nhl.gc1112.free`
- **Supported Versions:** `17.0.0`
- **Default State:** `true` (Enabled by default)
- **Type:** Dalvik Bytecode Patch (`bytecodePatch`)
- **Category:** `Ads`

### 1. Motivation & Purpose

The official NHL application integrates multiple advertising networks and formats:

- **Google Ad Manager (GAM) Banners:** Displayed across game feeds, team hubs, and story views.
- **Blaze Sponsored Stories:** Native sponsored story cards and interstitial ad pages in vertical video feeds.
- **Brightcove Google IMA Video Ads:** Pre-roll and mid-roll video ad pods inserted before and during game highlights and video on demand.

The **Remove Ads** patch eliminates advertising across all formats without disrupting content playback or navigation.

### 2. Options

| Key                        | Title                      | Default | Description                                           |
| -------------------------- | -------------------------- | ------- | ----------------------------------------------------- |
| `removePromotionsCarousel` | Remove Promotions Carousel | `true`  | Removes the promotions carousel from the Home screen. |

### 3. Technical Implementation & Bytecode Hooks

1. **Google Mobile Ads SDK Initialization:**
   - Neutralizes `com.google.android.gms.ads.MobileAds.a(Context)` and `MobileAdsInitProvider.attachInfo`.
2. **Google Ad Manager View Neutralization:**
   - Neutralizes `loadAd` on `BaseAdView` (`kh1.b(Lsg;)V`).
3. **Blaze GAM Handlers:**
   - Neutralizes `enableBannerAds`, `enableCustomNativeAds`, `initializeMobileAdsSdk`, and `setBlazeAdBannerHandler` in `com.blaze.gam.BlazeGAM`.
   - Replaces banner view creation in `DefaultBlazeGAMBannerAdsHandler.createAndLoadAdBannerView` with a collapsed `View.GONE` placeholder.
   - Stubs native ad provider in `DefaultBlazeGoogleCustomNativeAdsHandler.provideAd` to return null.
   - Neutralizes `BlazeCustomNativeAdsManager.requestAd`.
4. **Blaze IMA Video Ads:**
   - Neutralizes `com.blaze.ima.BlazeIMA.enableAds`.
5. **Brightcove Video IMA Ad Engine:**
   - Stubs `GoogleIMAComponent` ad request preparation (`internalInitializeAdsRequests`, `reloadAdsRequest`, `initializeAdsRequests`).
   - Neutralizes `GoogleIMAComponent$OnPlayListener.processEvent` and `GoogleIMAComponent$OnCuePointListener.processEvent`, preventing the player from halting content playback to insert pre-roll or mid-roll ad pods.
   - Forces `BaseIMAComponent.shouldSkipAdBreak` to return `true` and `BaseIMAComponent.isPlayingAd` to return `false`.

6. **Promotions Carousel Removal (`removePromotionsCarousel`):**
   - Targets content component mapper methods `Lawi;->b(Ldf3;Z)Lpj4;` and `Lawi;->e(Ldf3;Z)Ltj4;`.
   - Inspects deserialized `ComponentsResponse` fields (title in `df3.b->fva.a`, `id` in `df3.a`, `analyticSlug` in `df3.f`, and `analyticsSectionTitle` in `df3.e`).
   - If any identifier contains `"promotion"` (case-insensitive via `Locale.ROOT`), the mapper returns `null`, causing the parent flow parser `Lawi;->d(Lzvi;)Lmui;` to omit the component from the active UI hierarchy and completely suppress the Home screen carousel card.

---

## Patch: Remove Tracking

- **Name:** Remove Tracking
- **Target Package:** `com.nhl.gc1112.free`
- **Supported Versions:** `17.0.0`
- **Default State:** `true` (Enabled by default)
- **Type:** Dalvik Bytecode Patch (`bytecodePatch`)
- **Category:** `Privacy`

### 1. Motivation & Purpose

The application captures pervasive behavioral, privacy, and device telemetry:

- **OneTrust CMP Consent Popup & Telemetry:** Modal tracking and cookie disclosure banner requesting user consent to track; remote geolocation and consent logging calls.
- **Google Play Advertising ID (AAID):** Unique hardware identifiers tracked for ad targeting and user attribution.
- **Host Application Analytics:** Internal NHL screen-view and interaction analytics logging.
- **Firebase Analytics & AppMeasurement:** Screen views, team favoriting, video consumption, and engagement events.
- **Firebase Performance Monitoring:** Automatic startup trace collection, activity lifecycle timing, and network performance reporting.
- **UrbanAirship Telemetry:** Install referrer metadata, event queueing, screen tracking, and metered usage reporting.
- **Blaze SDK Tracking & Logging:** Bulk tracking events and diagnostic logs recorded during story and vertical video viewing.
- **Brightcove Analytics:** Metrics tracking video stream bitrate, buffer health, playback duration, and interactivity.
- **Ticketmaster Analytics:** Event ticketing and authentication telemetry queues.
- **Firebase Crashlytics, Sessions & Datatransport:** Diagnostic exception recording, session lifecycle services, and Firelog batch upload telemetry.

The **Remove Tracking** patch neutralizes these tracking systems while preserving normal application and video playback functionality.

### 2. Options

| Key                             | Title                                   | Default | Description                                                                                                            |
| ------------------------------- | --------------------------------------- | ------- | ---------------------------------------------------------------------------------------------------------------------- |
| `disableOneTrustCmp`            | Disable OneTrust CMP                    | `true`  | Neutralizes OneTrust CMP tracking consent popups, network calls, and forces consent queries to Denied.                 |
| `removeBrokenPrivacySettings`   | Remove Broken Privacy Settings          | `true`  | Removes the broken Privacy Settings entry from the Settings screen.                                                    |
| `zeroAdvertisingId`             | Zero Advertising ID                     | `true`  | Spoofs the Google Play Advertising ID (AAID) to return an all-zero identifier and limit ad tracking.                   |
| `disableHostAnalytics`          | Disable Host App Analytics              | `true`  | Blocks host application screen tracking and interaction event logging.                                                 |
| `disableFirebaseAnalytics`      | Disable Firebase Analytics              | `true`  | Blocks Firebase Analytics, AppMeasurement, and the WebView JavaScript analytics bridge.                                |
| `disableFirebasePerformance`    | Disable Firebase Performance Monitoring | `true`  | Neutralizes Firebase Performance Monitoring traces, metrics, and gauge collection.                                     |
| `disableUrbanAirshipTelemetry`  | Disable UrbanAirship Telemetry          | `true`  | Neutralizes UrbanAirship install referrer capture, event queueing, session tracking, and metered usage telemetry.      |
| `disableBlazeTracking`          | Disable Blaze Tracking & Logging        | `true`  | Blocks Blaze SDK bulk event analytics, user viewing activity history, and remote diagnostic logging.                   |
| `disableBrightcoveAnalytics`    | Disable Brightcove Video Analytics      | `true`  | Suppresses Brightcove video playback metrics, interactivity tracking, and backlog processing.                          |
| `disableTicketmasterTelemetry`  | Disable Ticketmaster Telemetry          | `true`  | Neutralizes Ticketmaster authentication analytics, event reporting queues, and presence analytics.                     |
| `disableCrashlyticsAndSessions` | Disable Crashlytics & Sessions          | `true`  | Neutralizes Firebase Crashlytics logging, exception capture, Sessions lifecycle monitoring, and DataTransport uploads. |

### 3. Technical Implementation & Bytecode Hooks

1. **Broken Privacy Settings Removal (`removeBrokenPrivacySettings`):**
   - Targets Preferences section builder `Lbg8;->d(ZLjava/lang/String;Lkotlin/jvm/functions/Function1;Lpn3;I)V`.
   - Locates the `invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z` call following the Privacy Settings composable key (`-0x3635e702`) and removes it from bytecode, preventing the defunct setting row from being added to the Preferences list.
2. **OneTrust CMP Neutralization & Banner Suppression (`disableOneTrustCmp`):**
   - Neutralizes UI display methods in `Lcom/onetrust/otpublishers/headless/Public/OTPublishersHeadlessSDK;` (`setupUI`, `showBannerUI`, `callSetupUI`, `callShowConsentPreferencesUI`, `callShowPreferenceCenterUI`, `showPreferenceCenterUI`, `showConsentPurposesUI`, `showConsentUI`), preventing the consent banner dialog from appearing.
   - Forces `shouldShowBanner` to return `false` and `isBannerShown` to return `0`.
   - Neutralizes OneTrust network calls (`startOtSdkNetworkCall`, `startSDK`, `saveConsent`, `saveAllowAll`, `saveRejectAll`).
   - Forces consent query methods (`getConsentStatusForGroupId`, `getConsentStatusForSDKId`, `getPurposeConsentLocal`, `getPurposeLegitInterestLocal`, `getUCPurposeConsent`) to return `0` (`Denied`).
   - Routes host application consent checks through `PushBridge.isPushConsented` (`Lgce;->c(Lqoj;)Z` and `Lqc8;->M(...)Lvu3;`), preserving consent for `UrbanAirshipCore`, `UrbanAirshipFcm`, and `BlazePushSdk` while treating advertising and telemetry SDKs as unconsented.
3. **Advertising ID Zeroing (`zeroAdvertisingId`):**
   - Spoofs minified `AdvertisingIdClient` (`Ljj;->a` and `Ljj;->f`) to return an Info object (`Lij;`) with a zeroed UUID (`00000000-0000-0000-0000-000000000000`) and `limitAdTrackingEnabled = true`.
   - Stubs unminified `AdvertisingIdClient$Info` (`getId` and `isLimitAdTrackingEnabled`) if present.
4. **Host Application Analytics (`disableHostAnalytics`):**
   - Neutralizes screen tracking (`a(Ljava/lang/String;)V`) and event logging (`b(Lbv;)V`) in `Lnv;` (internal analytics implementation).
5. **Firebase Analytics & AppMeasurement (`disableFirebaseAnalytics`):**
   - Neutralizes `AppMeasurement.logEventInternal`, `AppMeasurementSdk.logEvent`, and `FirebaseAnalytics` methods (`b`, `c`, `setCurrentScreen`).
   - Neutralizes Google Play Services AppMeasurement background task queue execution in `Lg3q;->c(Loxp;)V`.
   - Neutralizes WebView JavaScript analytics bridge in `Lhhd;` (`logEvent`, `setUserProperty`).
   - Neutralizes component registration in `Lcom/google/firebase/analytics/connector/internal/AnalyticsConnectorRegistrar;` (`getComponents` returns empty list).
6. **Firebase Performance Monitoring (`disableFirebasePerformance`):**
   - Stubs component registrars `FirebasePerfRegistrar` and `FirebasePerfKtxRegistrar` (`getComponents` returns empty list).
   - Neutralizes metric dispatch in `Lmak;` (`b`, `c`, `d`).
   - Neutralizes `AppStartTrace` lifecycle tracking (`onActivityCreated`, `onActivityResumed`, `onActivityStarted`) and `SessionManager` gauge collection.
7. **UrbanAirship Telemetry & Analytics (`disableUrbanAirshipTelemetry`):**
   - Neutralizes `com.urbanairship.analytics.InstallReceiver.onReceive`.
   - Neutralizes event recording queue in `Lpo;->a(Loo;)V`.
   - Neutralizes analytics event dispatch, session start, and screen tracking in `Lrt;` (`e`, `g`, `h`).
   - Forces `Lrt;->f()Z` (analytics enabled check) to return `false`.
   - Neutralizes metered usage telemetry scheduling in `Lqp;` (`g`, `h`).
8. **Blaze SDK Event Dispatcher, User Activity & Logging (`disableBlazeTracking`):**
   - Forces `BlazeSDK` configuration gates `getDisableAnalytics` and `getDisableUserActivity` to return `true`, and `getDoNotTrack` to return `true`.
   - Stubs `com.blaze.blazesdk.analytics.AnalyticsApi` methods `sendTrackEvents` and `sendDoNotTrackEvents` to return null.
   - Stubs `com.blaze.blazesdk.logger.apis.BlazeLoggerApi.sendLogs` to return null.
9. **Brightcove Video Analytics & Interactivity (`disableBrightcoveAnalytics`):**
   - Neutralizes event publishing in `com.brightcove.player.analytics.AnalyticsClient.publish` (returns `this`).
   - Bypasses metric network requests in `com.brightcove.player.analytics.Analytics.sendAnalyticsRequest` (returns unmodified properties map).
   - Neutralizes `com.brightcove.player.analytics.DefaultAnalyticsHandler` methods (`onAnalyticsEvent`, `processBacklog`, `trySubmit`, `trySubmitInteractivity`), blocking active event submission, interactivity metric reporting, and offline SQLite backlog flushes.
10. **Ticketmaster Telemetry (`disableTicketmasterTelemetry`):**
    - Forces `com.ticketmaster.authenticationsdk.Analytics.getEnabled` to return `false`.
    - Neutralizes event queueing and network dispatch in `com.ticketmaster.tickets.eventanalytic.AnalyticsQueue` (`putEvent`, `send`) and `TmxAnalyticsSender.send`.
    - Neutralizes presence analytics broadcasting in `com.ticketmaster.presence.AnalyticsHelper.sendAnalyticEvent`.

11. **Firebase Crashlytics, Sessions & Datatransport (`disableCrashlyticsAndSessions`):**
    - Neutralizes Crashlytics logging and exception capture in `Lbn6;` (`b`, `c`).
    - Stubs `FirebaseSessionsRegistrar.getComponents` to return an empty list.
    - Neutralizes `SessionLifecycleService` lifecycle methods (`onCreate`, `onBind` returning null, `onStartCommand` returning `START_NOT_STICKY`).
    - Neutralizes Google DataTransport Firelog uploader in `Lomk;->a`.

---

## Patch: Unlock Hidden Features

- **Name:** Unlock Hidden Features
- **Target Package:** `com.nhl.gc1112.free`
- **Supported Versions:** `17.0.0`
- **Default State:** `false` (Disabled by default)
- **Type:** Dalvik Bytecode Patch (`bytecodePatch`)
- **Category:** `Features`

### 1. Motivation & Purpose

The NHL 17.0.0 release bundle contains several dormant and remotely gated host-app capabilities:

- An internal **Developer Settings** suite with network environment switching (Prod, Staging, Mock), country overrides, String Key Overlay, Analytics Debugger, cache invalidation, and developer deep links.
- A **Draft Mini Tracker** UI component gated by remote configuration.
- An **NHL GameZone** web portal entry on the Home surface gated by remote configuration.

The **Unlock Hidden Features** patch unlocks these surfaces with independent options for each feature. The patch is disabled by default to prevent accidental environment switching or diagnostic exposure for standard users.

### 2. Options

| Key                       | Title                             | Default | Description                                                                                                                                                                                                                       |
| ------------------------- | --------------------------------- | ------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `enableDeveloperSettings` | Enable Developer Tools & Settings | `false` | Unlocks the internal Developer Settings screen inside Settings (Environment switcher, Analytics Debugger, String Key Overlay, Mock Localization, Invalidate Cache, and Ad Inspector), and activates the `nhl://setAPI` deep link. |
| `enableDraftMiniTracker`  | Enable Draft Mini Tracker         | `true`  | Forces the shipped Draft Mini Tracker visibility gate on; tracker content still depends on NHL draft data.                                                                                                                        |
| `showGameZoneOnHome`      | Show GameZone on Home             | `true`  | Forces the shipped NHL GameZone Home visibility gate on; web content and authentication remain server-controlled.                                                                                                                 |

### 3. Technical Implementation & Bytecode Hooks

1. **Developer Mode Master Gate (`enableDeveloperSettings`):**
   - Targets static method `Llpk;->a()Z`.
   - Injects `const/4 v0, 0x0` / `return v0` at offset 0, forcing the production/release gate `isProd` off so developer mode activates across Compose UI hierarchy, NavHost route registration, and diagnostic actions.
2. **Draft Mini Tracker Visibility Gate (`enableDraftMiniTracker`):**
   - Targets deserialization constructor `Loi5;-><init>(IZLfva;Lfva;Lfva;)V` (`DraftConfigResponse`).
   - Injects `const/4 v0, 0x1` / `iput-boolean v0, p0, Loi5;->a:Z` immediately before `return-void`, overriding the deserialized `isMiniTrackerActive` field.
3. **GameZone Home Surface Visibility Gate (`showGameZoneOnHome`):**
   - Targets deserialization constructor `Lhv7;-><init>(ILjava/lang/Boolean;Ljava/lang/String;)V` (`GameZoneConfigResponse`).
   - Injects `sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;` / `iput-object v0, p0, Lhv7;->a:Ljava/lang/Boolean;` immediately before `return-void`, overriding the deserialized `showOnHome` field while leaving field `b` (URL) intact.

### 4. Observable UI Behavior

- **Developer Settings:** Navigating to Settings (`nhl://settings`) displays the internal Developer Settings section at the top of the screen. Features include:
  - Switching API environment (`PROD`, `STAGING`, `STAGING_PLAYOFFS`, `TEST`, `MOCK`, `DYNAMIC_MOCK`).
  - Toggling String Key Overlay immediately renders raw localization keys over Compose UI labels.
  - Tapping Invalidate Cache flushes caches and displays a confirmation Toast.
  - Deep link `nhl://setAPI?testingURL={testingURL}&name={name}` routes directly to the API endpoint configuration screen.
- **GameZone on Home:** The NHL GameZone card is rendered on the Home screen and opens the configured web hub.
- **Draft Mini Tracker:** The tracker composable visibility gate is forced open.

### 5. Limitations

- **Server Feed Availability:** The Draft Mini Tracker visibility gate is unlocked locally, but displayed draft content requires live data feeds from the NHL API.
- **Web Authentication:** GameZone is a hosted web application (`https://s3.foreverflow.click/...`); session management and external server connectivity remain governed by remote endpoints.
