# NHL Android Application Architecture

## 1. Overview

- **Application Name:** NHL
- **Package Name:** `com.nhl.gc1112.free`
- **Target Version:** `17.0.0` (Morphe Compatibility: `17.0.0`, `minSdk` 29)
- **Analyzed Version Code:** `17000026`
- **Target SDK:** 37
- **Minimum SDK:** 29 (Android 10)
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

- **OneTrust Headless SDK:** `com.onetrust.otpublishers.headless.Public.OTPublishersHeadlessSDK` integrated through `Lgce;` to manage IAB TCF 2.2 consent strings and purpose grants (`IAB2V2_1`, `sm2.Functional`, `sm2.Performance`).
- **Consented SDKs (`Lqoj;`):** Enum categorizing third-party modules subject to user consent (`GoogleAds`, `Brightcove`, `UrbanAirshipCore`, `UrbanAirshipFcm`, `BlazePushSdk`, `TicketmasterTickets`, `TicketmasterAuthentication`, `OneTrust`).

### Push Notifications & Live Activities Infrastructure

- **UrbanAirship (Airship) Core & FCM Push:** Manages push registration and token lifecycle (`com.urbanairship.push.fcm.AirshipFirebaseMessagingService`, `AirshipChannel`).
- **Live Activities (Real-Time Game Scores):** Driven by `LiveActivityNotificationManager` (`cla.smali`), scheduling dynamic lockscreen and notification drawer score widgets via UrbanAirship Live Activities subsystem (`Lroa;->a(...)`).
- **Firebase Installations (FIS):** Used by `FirebaseMessaging` to mint app-instance tokens. Restricted on Google Cloud by package name and signing certificate SHA-1 digest (`9D:1B:1A:C8:28:E0:47:72:A7:34:91:D8:39:D9:85:2B:80:C4:66:92`).

### Analytics, Advertising & Telemetry Systems

- **Google Mobile Ads (GMS Ads):** `AdManagerAdView`, `AdService`, `MobileAdsInitProvider`, and `MobileAds`.
- **Google Play Advertising ID (AAID):** Minified `AdvertisingIdClient` (`Ljj;` returning `Lij;`) collecting hardware advertising identifiers.
- **Firebase Analytics / AppMeasurement:** Global analytics dispatcher via `Ljxd;->x()Lcom/google/firebase/analytics/FirebaseAnalytics;` backed by Google Play Services `Lg3q;` task execution.
- **UrbanAirship Telemetry:** Install referrer capture (`InstallReceiver`), AAID collection (`AdIdModuleFactory`), and analytics database syncing.
- **Blaze SDK Telemetry:** Event bulk dispatcher (`com.blaze.blazesdk.analytics.AnalyticsApi`).
- **Brightcove Video Analytics:** Video playback metric events dispatched via `com.brightcove.player.analytics.AnalyticsClient`.
- **Firebase Crashlytics & Sessions:** Real-time crash diagnostics (`Lbn6;`) and session lifecycle monitoring (`SessionLifecycleService`).

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

- **Draft Configuration:** Deserialized via `Lmi5;` into `Loi5;` where field `a:Z` represents `isMiniTrackerActive`.
- **GameZone Configuration:** Deserialized via `Lhv7$a;` into `Lhv7;` where field `a:Ljava/lang/Boolean;` represents `showOnHome` and field `b:Ljava/lang/String;` contains the target URL (`https://s3.foreverflow.click/api/gameZone/index.html?...`).
- **Central Consumer:** `Lcdr;->U(Ljg0;)Lg24;` is the sole consumer mapping both deserialized config responses into active UI state.
- **Dependencies & Constraints:** While client-side bytecode renders the `DraftMiniTracker` and GameZone WebView host surfaces, active tracker content depends on live NHL draft feeds, and GameZone relies on server authentication and host web availability.

### Developer Settings & Diagnostic Subsystem

The application includes an internal diagnostic and developer configuration suite gated by the static boolean method `Llpk;->a()Z`. In standard release builds, `Llpk;->a()Z` delegates to `!Lftd;->a`, which resolves to `true` (production mode). When forced to return `false` (developer/non-prod mode), the following subsystems activate:

1. **Settings Screen Developer Section:**
   - Rendered by composable `Ldq8;k(...)` / `Lmrd;` and driven by `DeveloperSettingsViewModel` (`Lbnh;`).
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

Analysis of `com.nhl.gc1112.free` version 17.0.0 (version code `17000026`) established exact smali descriptors, signatures, semantic anchors, registers, and match counts for native ad presentation collapse, settings injection, and article WebView interception.

### 4.1 Native Ad Presentation & Container Targets

| Target Class & Method | Signature                                                                          | Semantic Anchor / String                                                                                                | Expected Matches | Register Constraints                    | Owning Surface                                     |
| --------------------- | ---------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------- | ---------------- | --------------------------------------- | -------------------------------------------------- |
| `Lcdr;->h`            | `(Ltyk;Leyk;Lm5j;Ljava/lang/String;Lpn3;I)V`                                       | `playlist-ad-unit-item`, `sget-object Lccb;->c`, `La6i;->Vertical`                                                      | 1                | Neutralized via `Lnu3;->a` backstop     | News / Video playlist ad item                      |
| `Lxy;->p`             | `(Lff0;Lbvi;Lgce;Lpn3;I)V`                                                         | `-medium-rectangle-ad-unit-item-`, `sget-object Lccb;->c`, `La6i;->Vertical`                                            | 1                | `v11` (composer), `v3..v13` (nu3 args)  | Content feed medium rectangle / banner             |
| `Lwai;->c`            | `(Ln0j;ILpn3;I)V`                                                                  | `-inline-banner-ad-unit-item-`, `standings-`, `sget-object Lccb;->c`                                                    | 1                | `v8` (composer), `v0..v10` (nu3 args)   | Standings inline banner (WildCard/Division/League) |
| `Lg68;->invoke`       | `(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;`       | `playbyplay-medium-rectangle-ad-unit-item` (`:pswitch_4e7`), `playbyplay-banner-ad-unit-item` (`:pswitch_588`)          | 2                | `v2` (composer), `v13..v23` (nu3 args)  | Game Center Play-by-Play feed                      |
| `Lq9a;->a`            | `(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;`       | `summary-...-ad-unit-item`, `instance-of Lxri`                                                                          | 1                | `v11` (composer), `v14..v24` (nu3 args) | Game Summary feed                                  |
| `Lse8;->invoke`       | `(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;`       | `pregame-...-ad-unit-item` (`:pswitch_1a0`, model `Llef;`), `boxscore-...-ad-unit-item` (`:pswitch_6f0`, model `Luy1;`) | 2                | `v3` (composer), `v15..v25` (nu3 args)  | Pregame & Boxscore feeds                           |
| `Lnu3;->a`            | `(Ljava/lang/String;Lqtb;Ljava/lang/String;ILwg;Ljava/lang/String;ZLftd;Lpn3;II)V` | `-holder`, `-label`, `AdPos:`, `Luat;->a`                                                                               | 1                | `v14` (composer), common ad composable  | Shared Ad Renderer Composable Backstop             |
| `Lccb;->c`            | `Lccb;`                                                                            | `nhl.advertisementTitle`                                                                                                | 8 call sites     | Static singleton instance of `Lccb;`    | Localized "Advertisement" title key                |

### 4.2 Settings Section Injection Targets

| Target Class & Method | Signature                                                      | Semantic Anchor / Call Pattern                 | Expected Matches | Register Constraints                             | Owning Surface                  |
| --------------------- | -------------------------------------------------------------- | ---------------------------------------------- | ---------------- | ------------------------------------------------ | ------------------------------- |
| `Ldq8;->k`            | `(Llmh;Lkotlin/jvm/functions/Function1;Lpn3;I)V`               | Immediately before `Lbg8;->d(...)V` invocation | 1                | `v3` (composer), `v1` (nav callback `Function1`) | Main Settings Screen Scaffold   |
| `Lbg8;->d`            | `(ZLjava/lang/String;Lkotlin/jvm/functions/Function1;Lpn3;I)V` | Calls `Lmq8;->g(Lqtb;[Function2;Composer;I)`   | 1                | `p3` (composer), Preferences card builder        | Preferences Section Composable  |
| `Lbg8;->b`            | `(Ljava/lang/String;Lpn3;I)V`                                  | Section title composable (`d0(-0x211db726)`)   | 1                | `p1` (composer), literal string header           | Settings Section Header Text    |
| `Lmq8;->h`            | `(Lsf3;[Lkotlin/jvm/functions/Function2;Lpn3;I)V`              | Section container with header lambda `sf3`     | 1                | `p2` (composer), `p1` (row array)                | Composable Section Card Builder |
| `Ldq8;->b`            | `(Lkotlin/jvm/functions/Function0;Lpn3;I)V`                    | `Lae8;->P(pn3, id)` string lookup + row click  | 1                | `v7` (composer), `p0` (`Function0` onClick)      | Settings Row Pattern Reference  |

### 4.3 WebView Factories & Interception Targets

| Target Class & Method | Signature                                | Semantic Anchor / Behavior                                                                 | Expected Matches | Interception Role                                | Owning Surface                    |
| --------------------- | ---------------------------------------- | ------------------------------------------------------------------------------------------ | ---------------- | ------------------------------------------------ | --------------------------------- |
| `Li9l;->invoke`       | `(Ljava/lang/Object;)Ljava/lang/Object;` | `NHLNativeAnalytics`, `MobileAds.b(WebView)`                                               | 1                | Factory creating Article WebView                 | Article / Story Detail Composable |
| `Ltv7;->invoke`       | `(Ljava/lang/Object;)Ljava/lang/Object;` | `nhlApp`, `MobileAds.b(WebView)`, `loadUrl`                                                | 1                | Factory creating GameZone WebView                | Embedded Web Hub Composable       |
| `Lkhd;`               | `Landroid/webkit/WebViewClient;`         | Overrides `onPageStarted`, `onPageFinished`, `onReceivedError`, `shouldOverrideUrlLoading` | 1 class          | Injected with `shouldInterceptRequest` overrides | Common NHL WebViewClient Subclass |
| `Lowk;->invoke`       | `(Ljava/lang/Object;)Ljava/lang/Object;` | `pswitch_583`, calls `loadUrl(String,Map)`                                                 | 1                | Article AndroidView update lambda                | Article Navigation Dispatch       |
