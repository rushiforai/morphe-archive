# Adobe Acrobat Reader Architecture & Reverse Engineering Specification

## Overview

| Attribute                   | Specification                                                                                                                                                                                                                                                                                                                                               |
| --------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Application Name**        | Adobe Acrobat Reader: Edit PDF                                                                                                                                                                                                                                                                                                                              |
| **Package Name**            | `com.adobe.reader`                                                                                                                                                                                                                                                                                                                                          |
| **Supported Version**       | `26.9.2.50367` (Morphe Compatibility: `26.9.2.50367`, `minSdk` 28)                                                                                                                                                                                                                                                                                          |
| **Analyzed Version Code**   | `1932150367`                                                                                                                                                                                                                                                                                                                                                |
| **Target SDK**              | `36` (Android 16)                                                                                                                                                                                                                                                                                                                                           |
| **Minimum SDK**             | `28` (Android 9.0)                                                                                                                                                                                                                                                                                                                                          |
| **APK Format**              | APKM (`base.apk`, `config.arm64_v8a.apk`, `config.en.apk`, `config.xhdpi.apk`)                                                                                                                                                                                                                                                                              |
| **Package Signing SHA-256** | `b6dd0562256487fcd6c98cde137858ef50d9adb9f9cd2f1ca58c5357efdf0faf`                                                                                                                                                                                                                                                                                          |
| **Architecture**            | Native Android/Java/Kotlin; C++ PDF rendering engine, Adobe Experience Platform MobileCore, Document Cloud Analytics (DCMAnalytics & ARDCMAnalytics), Adobe Growth Platform (DGP/MAU), Adobe Journey Optimizer (AJO), Creative SDK, Branch Metrics, Google Mobile Ads (AdMob), Firebase Performance & Sessions, Google Play Core Review, Play Services AAID |

Adobe Acrobat Reader is Adobe's flagship PDF viewing and editing client for Android. In addition to local PDF document manipulation and signing, the stock application bundles comprehensive tracking suites (Adobe MobileCore, DCMAnalytics, ARDCMAnalytics, Adobe Growth Platform MAU, Adobe Journey Optimizer, Creative SDK analytics, Branch deep-link attribution, Firebase Performance, Firebase Sessions, Firebase Analytics, Crashlytics, and AAID harvesting) as well as an in-app ad engine (Google Mobile Ads AdMob), promotional paywalls, in-app ratings, and Next Best Action (NBA) tools profiling.

---

## Technology Stack & Components

- **Core UI & PDF Engine**: Custom Adobe PDF renderer, Android Fragments, Jetpack Compose, Room SQLite.
- **Entry Points**: `com.adobe.reader.AdobeReader`, `com.adobe.reader.viewer.ARViewerActivity`.
- **Adobe MobileCore & Target**: `com.adobe.marketing.mobile.S` (MobileCore facade), `com.adobe.marketing.mobile.MobileCoreInitializer`, and `com.adobe.marketing.mobile.internal.eventhub.EventHub`.
- **Document Cloud Analytics & App Analytics**: `com.adobe.dcmanalytics.DCMAnalytics`, `com.adobe.reader.analytics.ARDCMAnalytics`, `com.adobe.reader.analytics.ARInAppAnalytics`, and `com.adobe.reader.analytics.ARAppLaunchAnalytics`.
- **Adobe Growth Platform (DGP)**: `com.adobe.dgp.GrowthSDKInitializer`, `com.adobe.dgp.DGPMau` (MAU analytics), `com.adobe.dgp.e`, and `com.adobe.dgp.DGPAEPBridge`.
- **Adobe Journey Optimizer (AJO)**: `com.adobe.reader.ajo.ARAJOManager`, `com.adobe.reader.ajo.ARAJOEventIngestionDS`, and `com.adobe.dcmanalytics.ajo.AJOHelper`.
- **In-App Advertising**: Google Mobile Ads (AdMob) integration (`com.google.android.libraries.ads.mobile.sdk`), `com.adobe.reader.ads.ARAdType`, `com.adobe.reader.ads.analytics.ARAdAnalytics`, `com.adobe.reader.ads.utils.ARAdUtils`, and `com.adobe.reader.ads.ARBannerAdsPool`.
- **Next Best Action (NBA) Profiling**: `com.adobe.libs.nba.database.ARNbaToolsUsageDatabase` and `com.adobe.libs.nba.repos.ARNbaRepo`.
- **Performance & Diagnostics**: `com.google.firebase.perf`, `com.google.firebase.sessions`, `com.adobe.libs.janks.PFJankEventSender`, `com.adobe.reader.performance.ARActivityFrameMetrics`, and `com.adobe.reader.utils.v`.
- **Branch Deep-Link Attribution**: `com.adobe.reader.utils.ARBranchEventTracker` and `io.branch.referral.Branch`.
- **Creative SDK Analytics**: `com.adobe.creativesdk.foundation.internal.analytics.b`, `c`, `n`, `g`, `e`, and `AdobeAnalyticsETSJob`.
- **Promotions & Paywalls**: `com.adobe.reader.marketingPages.dynamicPaywall.ARDynamicPaywallManager` controlling in-app upsells and promotional screens.
- **In-App Review**: Google Play Core in-app review manager `com.google.android.play.core.review.d`.
- **Preferences Runtime Extension**: `app.aidan.extension.adobereader.SettingsBridge` for safe reflection-based telemetry preference neutralization.
