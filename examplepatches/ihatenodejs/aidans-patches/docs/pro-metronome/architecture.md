# Pro Metronome Architecture & Reverse Engineering Specification

## Overview

| Attribute                   | Specification                                                                                                                                                                 |
| --------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Application Name**        | Pro Metronome                                                                                                                                                                 |
| **Package Name**            | `com.eumlab.android.prometronome`                                                                                                                                             |
| **Supported Version**       | `1.0.12` (Morphe Compatibility: `1.0.12`, `minSdk` 23)                                                                                                                        |
| **Analyzed Version Code**   | `112`                                                                                                                                                                         |
| **Target SDK**              | `35` (Android 15)                                                                                                                                                             |
| **Minimum SDK**             | `23` (Android 6.0)                                                                                                                                                            |
| **APK Format**              | APKM (`base.apk`, `config.en.apk`, `config.es.apk`, `config.xhdpi.apk`)                                                                                                       |
| **Package Signing SHA-256** | `67ba64147a05aedb766363801f77a59e04f37ab8785062a12c5678dadf8b7c35`                                                                                                            |
| **Architecture**            | Native Android/Java; AndroidX, Umeng Analytics & Common SDK, Facebook SDK AppEvents, Google Play Services Ads Identifier, Bolts Measurement, Google DataTransport, RevenueCat |

Pro Metronome is a real-time metronome application engineered by EUMLab. While the app does not contain third-party banner or interstitial display ad networks, it bundles telemetry and device identifier harvesting libraries, including Umeng Analytics SDK, Facebook App Events, Google Play Advertising ID client queries, Bolts measurement broadcast events, Google DataTransport runtime schedulers, and hardware-derived UUID synthesis in preset exports.

---

## Technology Stack & Components

- **Core Audio & UI**: Android standard audio engine with custom interactive dial and tempo controls.
- **Entry Point**: `com.eumlab.android.prometronome.MainActivity`.
- **Facebook SDK App Events**: `com.facebook.appevents.AppEventsLogger`, harvesting app activations, background timers, purchase events, and session states.
- **Attribution & Device ID Tracking**: `com.facebook.internal.AttributionIdentifiers` and `com.google.android.gms.ads.identifier.AdvertisingIdClient` harvesting the Google Play Advertising ID (AAID).
- **Measurement Events**: `bolts.MeasurementEvent` raising local broadcast telemetry via AndroidX LocalBroadcastManager.
- **Google DataTransport**: `com.google.android.datatransport.runtime.TransportImpl` and `com.google.android.datatransport.runtime.scheduling.jobscheduling.Uploader` persisting and dispatching events via `JobInfoSchedulerService`.
- **Umeng Analytics & Common SDK**: `com.umeng.analytics.MobclickAgent` and `com.umeng.commonsdk.UMConfigure`, harvesting app sessions, page durations, device hardware profiles, IMEI/IMSI/MAC/OAID identifiers, and error traces, configured via manifest `UMENG_APPKEY` (`54004871fd98c50a8800b339`) and `UMENG_CHANNEL` (`google`).
- **Hardware Fingerprint Harvesting**: `com.eumlab.prometronome.baselib.util.CommonUtil`, synthesizing deterministic UUIDs from `TelephonyManager.getDeviceId()` (IMEI), `TelephonyManager.getSimSerialNumber()` (ICCID), and `android_id` to stamp exported preset JSON files.
- **RevenueCat & In-App Purchases**: `com.revenuecat.purchases.Purchases` and `com.eumlab.prometronome.oversea.ProUpgradeHelper`, managing offerings, purchases, and `pro` entitlement validation.
