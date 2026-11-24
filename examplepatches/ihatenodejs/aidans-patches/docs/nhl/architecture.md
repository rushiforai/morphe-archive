# NHL Android Application Architecture

## 1. Overview

- **Application Name:** NHL
- **Package Name:** `com.nhl.gc1112.free`
- **Target Version:** `17.2.0` (Morphe Compatibility: `17.2.0`, `minSdk` 32)
- **Analyzed Version Code:** `17020008`
- **Target SDK:** 37
- **Minimum SDK:** 32 (Android 12L)
- **Distribution Format:** Android App Bundle / Split APKM (`ApkFileType.APKM`)
- **Supported Native ABIs:** `arm64-v8a`
- **Signer SHA-256:** `2309209340875f6f8a008ea25dbd98d8a03e482704d43211933d2b9a91923aff`
- **Technology Stack:** Jetpack Compose, Kotlin Coroutines, Koin, Retrofit / OkHttp, Brightcove Video SDK, Blaze SDK (Stories & Moments), Ticketmaster SDK, OneTrust Headless SDK, UrbanAirship (Airship), Google Mobile Ads / Google Ad Manager (GAM), Google Interactive Media Ads (IMA), Firebase Analytics / Crashlytics / Sessions.

The official NHL application is built using modern Android Jetpack libraries, Compose UI, and multi-DEX Dalvik bytecode heavily obfuscated and flattened with R8/ProGuard. Several prominent third-party media and ad SDKs (Blaze, Brightcove, Ticketmaster, OneTrust, Airship) are integrated to provide game video streaming, stories, ticket management, and telemetry.

---

## 2. Technology Stack & Key Subsystems

### UI & Architecture

- **Framework:** Jetpack Compose alongside AndroidX AppCompat components.
- **Entry Points:** `com.nhl.mobile.android.core.application.NhlApplication` and `com.nhl.mobile.android.main.MainActivity` with numerous team-specific activity aliases.
- **Dependency Injection:** Koin and lazy resolution providers.

### Media & Video Streaming

- **Brightcove Player SDK:** Powers game highlights, live video feeds, and radio audio services (`NHLRadioService`, `BrightcoveMediaSessionService`).
- **Interactive Media Ads (IMA):** Integrated through Brightcove Google IMA component (`com.brightcove.ima.GoogleIMAComponent`), handling pre-roll and mid-roll video ad pods.
- **SpringServe:** Video ad server integration via `com.brightcove.ima.springserve.SpringServeHelper`.

### Stories & Moments (Blaze SDK)

- **Blaze SDK (`com.blaze.blazesdk`):** Powers stories, moments, and vertical video experiences across the application.
- **Blaze Ad Integrations:**
  - Google Ad Manager (GAM) banner ads via `com.blaze.gam.banner.DefaultBlazeGAMBannerAdsHandler`.
  - Custom native story ads via `com.blaze.gam.custom_native.DefaultBlazeGoogleCustomNativeAdsHandler` and `BlazeCustomNativeAdsManager`.
  - Blaze IMA video ad module via `com.blaze.ima.BlazeIMA` and `ImaHandler`.

### Ticketing & Identity

- **Ticketmaster SDK:** Embedded authentication and ticket delivery (`com.ticketmaster.tickets.ticketssdk.TicketsSDKSingleton`).

### Consent & Privacy Control

- **OneTrust Headless SDK:** `com.onetrust.otpublishers.headless.Public.OTPublishersHeadlessSDK` integrated through `Lc2f;` (ConsentManager) and the consent enum `Lhlk;` to manage IAB TCF 2.2 consent strings and purpose grants (`IAB2V2_1`, `sm2.Functional`, `sm2.Performance`).
- **Consented SDKs (`Lqoj;`):** Enum categorizing third-party modules subject to user consent (`GoogleAds`, `Brightcove`, `UrbanAirshipCore`, `UrbanAirshipFcm`, `BlazePushSdk`, `TicketmasterTickets`, `TicketmasterAuthentication`, `OneTrust`).

### Push Notifications & Live Activities Infrastructure

- **UrbanAirship (Airship) Core & FCM Push:** Manages push registration and token lifecycle (`com.urbanairship.push.fcm.AirshipFirebaseMessagingService`, `AirshipChannel`).
- **Live Activities (Real-Time Game Scores):** Driven by `LiveActivityNotificationManager` (`cla.smali`), scheduling dynamic lockscreen and notification drawer score widgets via UrbanAirship Live Activities subsystem (`Lroa;->a(...)`).
- **Firebase Installations (FIS):** Used by `FirebaseMessaging` to mint app-instance tokens. Restricted on Google Cloud by package name and signing certificate SHA-1 digest (`9D:1B:1A:C8:28:E0:47:72:A7:34:91:D8:39:D9:85:2B:80:C4:66:92`).

### Analytics, Advertising & Telemetry Systems

- **Google Mobile Ads (GMS Ads):** `AdManagerAdView`, `AdService`, `MobileAdsInitProvider`, and `MobileAds`.
- **Google Play Advertising ID (AAID):** Minified `AdvertisingIdClient` (`Lyi;` returning `Lxi;`) collecting hardware advertising identifiers.
- **Firebase Analytics / AppMeasurement:** Global analytics dispatcher via `Ljxd;->x()Lcom/google/firebase/analytics/FirebaseAnalytics;` backed by Google Play Services `Luuq;` task execution.
- **UrbanAirship Telemetry:** Install referrer capture (`InstallReceiver`), AAID collection (`AdIdModuleFactory`), and analytics database syncing.
- **Blaze SDK Telemetry:** Event bulk dispatcher (`com.blaze.blazesdk.analytics.AnalyticsApi`).
- **Brightcove Video Analytics:** Video playback metric events dispatched via `com.brightcove.player.analytics.AnalyticsClient`.
- **Firebase Crashlytics & Sessions:** Real-time crash diagnostics (`Luy6;`) and session lifecycle monitoring (`SessionLifecycleService`).

---

## 3. Remote Configuration & Feature Gates

The NHL application relies on remote configuration payloads (bundled with an initial baseline in `assets/config.json`) to control seasonal navigation, marketing surfaces, and feature visibility.

### Shipped Configuration Keys & Serialization Mappings

Baseline snapshot in `assets/config.json`:

- `draft.isMiniTrackerActive`: Boolean flag (default `false`) gating the Draft Mini Tracker on home/scores surfaces.
- `sections.gameZone.showOnHome`: Boolean flag (default `false`) gating the GameZone web hub card on the Home surface.
- `tabBarConfiguration`: String enum (default `"seasonPreview"`; variants include `"Draft"`, `"FourNations"`, `"InternationalHockey"`, `"OffSeason"`, `"Playoffs"`, `"PreSeason"`, `"Regular"`).
- `sections.flags.isPrebidEnabled`: Boolean flag (default `false`) gating Magnite/Prebid advertising in `Llxk;->g(...)V`.

Bytecode mappings and consumers:

- **Draft Configuration:** Deserialized into `Lsq5;` where field `a:Z` represents `isMiniTrackerActive`.
- **GameZone Configuration:** Deserialized via `Lc78$a;` into `Lc78;` where field `a:Ljava/lang/Boolean;` represents `showOnHome` and field `b:Ljava/lang/String;` contains the target URL (`https://s3.foreverflow.click/api/gameZone/index.html?...`).
- **Central Consumer:** `Lcdr;->U(Ljg0;)Lg24;` is the sole consumer mapping both deserialized config responses into active UI state.
- **Dependencies & Constraints:** While client-side bytecode renders the `DraftMiniTracker` and GameZone WebView host surfaces, active tracker content depends on live NHL draft feeds, and GameZone relies on server authentication and host web availability.

### Developer Settings & Diagnostic Subsystem

The application includes an internal diagnostic and developer configuration suite gated by the static boolean method `Lpnl;->a()Z`. In standard release builds, `Lpnl;->a()Z` delegates to `!Lphe;->a`, which resolves to `true` (production mode). When forced to return `false` (developer/non-prod mode), the following subsystems activate:

1. **Settings Screen Developer Section:**
   - Rendered by composable `Ltc9;k(...)` / `Lmrd;` and driven by `DeveloperSettingsViewModel` (`Lbnh;`).
   - **API Environment Switcher (`Lw26;`):** Allows selecting between:
     - `PROD` (`https://api-mobile.nhle.com/`)
     - `STAGING` (`https://api-mobile-stage.nhle.com/`)
     - `STAGING_PLAYOFFS` (`https://api-mobile-stage2.nhle.com/`)
     - `TEST` (`https://api-mobile-test.nhle.com/`)
     - `MOCK` (`https://apinhl.foreverflow.click/`)
     - `DYNAMIC_MOCK` (`http://localhost:8080/`)
       Persisted in the `debug_settings` DataStore through `Lvs4;` and read by `Lzr4;`.
   - **Config Environment Switcher (`Lhr3;`):** Toggles between `PROD`, `STAGING`, and `TEST`.
   - **Country Code Override (`Ljb4;`):** Overrides detected geo-location with `US`, `CANADA`, `SE`, `CZ`, `FI`, `DE`, `SK`, `ES`, or `RoW`.
   - **Dynamic Mock URL Entry:** Text inputs for custom mock host URLs.
   - **Analytics Debugger Toggle:** Persisted via DataStore key `analytics_debugger_enabled`.
   - **String Key Overlay Toggle:** Persisted via DataStore key `string_key_overlay_enabled` in `Llc8;p`; displays raw string localization resource keys directly over UI text labels.
   - **Mock Localization Toggle:** Persisted via DataStore key `mock_localization_enabled`.
   - **Team Icon Tricode Override:** Sets `pending_icon_tricode` for UI styling.
   - **Developer Action Triggers:**
     - _Invalidate Cache:_ Clears OkHttp network disk caches and image caches with an immediate Android Toast confirmation.
     - _Ad Inspector:_ Launches the Google Mobile Ads SDK debug inspector (`Lvze;invoke`).
     - _OneTrust Clear SDK Data:_ Resets stored consent and privacy data.
2. **Developer Deep Link Navigation:**
   - NavHost builder (`Lxs8;invoke`) registers the deep link route `setAPI?testingURL={testingURL}&name={name}` (`nhl://setAPI?testingURL={testingURL}&name={name}` in `Lheh;invoke`), routing parameters directly to `Lzj3$a;`.
3. **Test Ad Unit Gating:**
   - `Luat;a` enables test ad unit configurations when developer mode is active.

### Rejected False Leads & Non-Features

- **Prebid Flag (`sections.flags.isPrebidEnabled`):** Maps through `Lzp6;`/`Lxp6;` into `Llxk;->g(...)V`. Gating this on forces third-party Magnite header-bidding ad requests, conflicting with the Remove Ads patch; it is not a user feature.
- **Tab Bar Seasonal Configuration (`tabBarConfiguration`):** Selecting seasonal navigation configurations (`Draft`, `Playoffs`, etc.) changes global tab hierarchies without providing required seasonal feed data, leading to empty or broken views.
- **Google Mobile Ads Internal Debug Strings:** Mentions of debug menus in `Le4p;->W1(...)` correspond to internal Google Mobile Ads SDK dialogs rather than NHL application features.
- **Airship & Ticketmaster Staging Controls:** Feature flags in UrbanAirship or staging environment switches in Ticketmaster SDK (`FastlyStaging`, `TeamStaging`) are third-party SDK internals that disrupt production authentication, ticketing, and push token registration.
- **React Native / Hermes Bundles:** Investigation confirmed the application is native Kotlin with Jetpack Compose; no React Native, Hermes bytecode, or JavaScript bundles exist in the artifact.

---

## 4. Native Ad & WebView Interception Target Inventory

Analysis of `com.nhl.gc1112.free` version 17.2.0 (version code `17020008`) established exact smali descriptors, signatures, semantic anchors, registers, and match counts for native ad presentation collapse, settings injection, and article WebView interception.

### 4.1 Native Ad Presentation & Container Targets

| Target Class & Method | Signature                                                                    | Semantic Anchor / String                                                      | Expected Matches | Register Constraints                | Owning Surface                         |
| --------------------- | ---------------------------------------------------------------------------- | ----------------------------------------------------------------------------- | ---------------- | ----------------------------------- | -------------------------------------- |
| `Lbme;->a`            | `(Ljava/lang/String;Ljava/lang/String;ILlg;Ljava/lang/String;ZLbu3;II)V`     | `-holder`, `-label`                                                           | 1                | Shared Compose ad renderer backstop | All native ad placements               |
| `Lh05;->m`            | `(Lvg0;Lyqj;Lc2f;Lbu3;I)V`                                                   | `-medium-rectangle-ad-unit-item-`, `-inline-banner-ad-unit-item-`, `300x250`  | 1                | `m` wraps `Lbme;->a`                | Content feed medium rectangle / banner |
| `Lr6j;->c`            | `(Luwj;ILbu3;I)V`                                                            | `-inline-banner-ad-unit-item-`, `standings-`                                  | 1                | `c` wraps `Lbme;->a`                | Standings inline banner                |
| `Lm38;->invoke`       | `(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;` | `playbyplay-medium-rectangle-ad-unit-item` / `playbyplay-banner-ad-unit-item` | 2                | Play-by-play merged lambda          | Game Center Play-by-Play feed          |
| `Lxwf;->invoke`       | `(Ljava/lang/Object;)Ljava/lang/Object;`                                     | Field gate `Lixf;->b:Lwi;` followed by `if-eqz`                               | 1                | `Lzwf;->e:Lwi;` banner item         | Play-by-play list builder              |
| `Ltsa;->invoke`       | `(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;` | `instance-of Lsnj`, `summary-...-ad-unit-item`                                | 1                | Game summary merged lambda          | Game Summary feed                      |
| `Lps8;->invoke`       | `(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;` | `pregame-...-ad-unit-item` (`Lv5g;`), `boxscore-...-ad-unit-item` (`Lv32;`)   | 2                | Game feeds merged lambda            | Pregame & Boxscore feeds               |
| `Lbb8` / `Laa8`       | Flow collectors                                                              | `new-instance Lv5g` / `Lv32` then `List.add`                                  | 1 each           | Insertion skipped via `nop`         | Pregame & Boxscore item insertion      |

### 4.2 Settings Section Injection Targets

| Target Class & Method | Signature                                                                     | Semantic Anchor / Call Pattern                 | Expected Matches | Register Constraints                             | Owning Surface                  |
| --------------------- | ----------------------------------------------------------------------------- | ---------------------------------------------- | ---------------- | ------------------------------------------------ | ------------------------------- |
| `Ltc9;->k`            | `(Lihi;Lkotlin/jvm/functions/Function1;Lbu3;I)V`                              | Immediately before `Lse9;->k(...)V` invocation | 1                | `v12` (Context), `v7` (composer), `v0` (changed) | Main Settings Screen Scaffold   |
| `Lse9;->k`            | `(ZLjava/lang/String;Lkotlin/jvm/functions/Function1;Lbu3;I)V`                | Privacy Settings row key `-0x3635e702`         | 1                | `p-` regs; preferences card builder              | Preferences Section Composable  |
| `Ligc;`               | Abstract localized string model                                               | Base class for section/row title models        | —                | `Lhgb;` is the hardcoded-string subclass         | Settings string model           |
| `Loo9;->d`            | `(Ligc;[Lkotlin/jvm/functions/Function2;Lbu3;I)V`                             | Section card container with header + rows      | —                | `p2` (composer), `p1` (row array)                | Composable Section Card Builder |
| `Lzg9;->h`            | `(Ligc;Lkotlin/functions/Function0;Lkotlin/jvm/functions/Function2;Lbu3;II)V` | Settings row with click + trailing composable  | —                | `p3` (composer), `p1` (`Function0` onClick)      | Composable Settings Row         |
| `Lmqp;->P`            | `(ILkotlin/Function;Lbu3;)Ldm3;`                                              | Composable lambda factory                      | —                | Returns `dm3` implementor of `Function2`         | Composable Lambda Factory       |

### 4.3 WebView Factories & Interception Targets

| Target Class & Method | Signature                                | Semantic Anchor / Behavior                                                                 | Expected Matches | Interception Role                                | Owning Surface                    |
| --------------------- | ---------------------------------------- | ------------------------------------------------------------------------------------------ | ---------------- | ------------------------------------------------ | --------------------------------- |
| `Lqam;->invoke`       | `(Ljava/lang/Object;)Ljava/lang/Object;` | `NHLNativeAnalytics`, `ALGORITHMIC_DARKENING`, `setWebViewClient(Lk5e;)`                   | 1                | Factory creating Article/GameZone WebView        | Embedded Web Hub Composable       |
| `Lk5e;`               | `Landroid/webkit/WebViewClient;`         | Overrides `onPageStarted`, `onPageFinished`, `onReceivedError`, `shouldOverrideUrlLoading` | 1 class          | Injected with `shouldInterceptRequest` overrides | Common NHL WebViewClient Subclass |
| `Lme;->invoke`        | `(Ljava/lang/Object;)Ljava/lang/Object;` | Calls `loadUrl(String,Map)` after `Loo9;->z(String,List,Context)`                          | 1                | Article navigation dispatch lambda               | Article Navigation Dispatch       |
