# Pro Metronome Patch Specifications

## Overview

This document specifies patches for **Pro Metronome** (`com.eumlab.android.prometronome`).

---

## Patch: Remove Tracking

- **Name:** Remove Tracking
- **Target Package:** `com.eumlab.android.prometronome`
- **Supported Versions:** `1.0.12`
- **Default State:** `true` (Enabled by default)
- **Type:** Dalvik Bytecode Patch (`bytecodePatch`)
- **Category:** `Privacy`
- **Dependencies:** None
- **Compatibility:** `COMPATIBILITY_PRO_METRONOME` (`ApkFileType.APKM`, target `1.0.12`, `minSdk` 23)
- **Options:**
  - `Disable Facebook App Events` (`disableFacebookEvents`, default `true`): Neutralizes Facebook SDK session logging, purchase tracking, and attribution identifiers.
  - `Zero Advertising ID` (`zeroAdvertisingId`, default `true`): Spoofs the Google Play Advertising ID client to return an all-zero identifier (`00000000-0000-0000-0000-000000000000`) and force limit-ad-tracking.
  - `Disable Background Telemetry` (`disableTelemetry`, default `true`): Neutralizes Bolts measurement events and Google DataTransport runtime schedulers.
  - `Disable Umeng Analytics` (`disableUmengAnalytics`, default `true`): Neutralizes Umeng Analytics initialization, session/page lifecycle tracking, and error reporting.
  - `Neutralize Device Fingerprinting` (`neutralizeDeviceFingerprint`, default `true`): Replaces hardware-derived device and preset UUIDs with random identifiers and returns an empty device ID.

### 1. Motivation & Purpose

Pro Metronome incorporates several telemetry trackers and fingerprinting routines:

1. Umeng Analytics & Common SDK harvests device hardware profiles, IMEI/IMSI/MAC/OAID identifiers, page durations, app lifecycle events, and error reports across `*.umeng.com` and `*.umengcloud.com`.
2. Facebook App Events logs app lifecycle events, purchases, activations, and attribution tokens.
3. Google Play Advertising ID harvesting client sends unique advertising identifiers across network boundaries.
4. Bolts MeasurementEvent emits local broadcasts for applink telemetry.
5. Google DataTransport schedules diagnostic payloads through `JobInfoSchedulerService`.
6. EUMLab device fingerprinting extracts telephony parameters (IMEI, SIM serial, Android ID) and stamps hardware-derived UUIDs into shared preset JSON files.
   The **Remove Tracking** patch neutralizes each tracker in bytecode while preserving all interactive tempo, rhythm, and audio functionality.

---

### 2. Technical Implementation

#### Layer 1: Facebook App Events Neutralization

- **Target Class:** `Lcom/facebook/appevents/AppEventsLogger;`
  - Void methods neutralized: `activateApp`, `deactivateApp`, `logEvent`, `logPurchase`, `logSdkEvent`, `flush`, `setFlushBehavior`, `onContextStop`.
- **Target Class:** `Lcom/facebook/internal/Utility;` and `Lcom/facebook/internal/FetchedAppSettingsManager;`
  - Void methods neutralized: `loadAppSettingsAsync`.
- **Target Class:** `Lcom/facebook/internal/AttributionIdentifiers;`
  - Method `getAttributionIdentifiers(Landroid/content/Context;)Lcom/facebook/internal/AttributionIdentifiers;` returns `null`.

#### Layer 2: Google Play Advertising ID Client Spoofing

- **Target Class:** `Lcom/google/android/gms/ads/identifier/AdvertisingIdClient;`
  - Method `getAdvertisingIdInfo(Landroid/content/Context;)Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;` returns synthetic `Info("00000000-0000-0000-0000-000000000000", true)`.
- **Target Class:** `Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;`
  - Method `getId()Ljava/lang/String;` returns constant `"00000000-0000-0000-0000-000000000000"`.
  - Method `isLimitAdTrackingEnabled()Z` returns constant `true`.

#### Layer 3: Bolts and DataTransport Telemetry Neutralization

- **Target Class:** `Lbolts/MeasurementEvent;`
  - Method `sendBroadcastEvent` neutralized.
- **Target Class:** `Lcom/google/android/datatransport/runtime/TransportImpl;`
  - Methods `send`, `schedule` neutralized.
- **Target Class:** `Lcom/google/android/datatransport/runtime/scheduling/jobscheduling/Uploader;`
  - Method `upload(Lcom/google/android/datatransport/runtime/TransportContext;ILjava/lang/Runnable;)V` safely executes `runnable.run()` if provided to notify job schedulers and returns immediately.

#### Layer 4: Umeng Analytics Neutralization

- **Target Class:** `Lcom/umeng/commonsdk/UMConfigure;`
  - Void methods neutralized: `init`, `preInit`, `setLogEnabled`.
- **Target Class:** `Lcom/umeng/analytics/MobclickAgent;`
  - Void methods neutralized: `onResume`, `onPause`, `onEvent`, `onEventObject`, `onEventValue`, `reportError`, `clearPreProperties`, `registerPreProperties`.
- **Target Class:** `Lcom/eumlab/prometronome/baselib/ProMetronomeApplication;`
  - Method `initUM` neutralized.

#### Layer 5: Device Fingerprint Neutralization

- **Target Class:** `Lcom/eumlab/prometronome/baselib/util/CommonUtil;`
  - Method `getDeviceId()Ljava/lang/String;` returns empty string `""`.
  - Method `getUuid()Ljava/lang/String;` returns a fresh random UUID via `java.util.UUID.randomUUID().toString()`, eliminating hardware hash derivation in preset exports.

---

## Patch: Unlock Pro

- **Name:** Unlock Pro
- **Target Package:** `com.eumlab.android.prometronome`
- **Supported Versions:** `1.0.12`
- **Default State:** `true` (Enabled by default)
- **Type:** Dalvik Bytecode Patch (`bytecodePatch`)
- **Category:** `Features`
- **Dependencies:** None
- **Compatibility:** `COMPATIBILITY_PRO_METRONOME` (`ApkFileType.APKM`, target `1.0.12`, `minSdk` 23)
- **Options:** None

### 1. Motivation & Purpose

Pro Metronome gates numerous core features behind a proprietary In-App Purchase check:

- Polyrhythm engine and subdivision controls.
- Visual beat indicators: Flash LED on beat, Vibrate on beat, and Flash Screen on beat.
- Practice modes, count-in bars, and rhythm trainer.
- Preset management (creating, editing, and saving custom rhythm presets).
- UI elements display "PRO" badge flags and redirect users to `PayHelper.gotoPay(I)`.

The **Unlock Pro** patch forces the application's central entitlement gates to report active Pro status, unlocking all local premium features without network purchase validation.

---

### 2. Technical Implementation

#### Required Entitlement Gate Overrides

- **Target Class:** `Lcom/eumlab/prometronome/PayHelper;`
  - Method `hasPro()Z` returns constant `true`.
- **Target Class:** `Lcom/eumlab/prometronome/oversea/ProUpgradeHelper;`
  - Method `hasPro()Z` returns constant `true`.
- **Target Class:** `Lcom/eumlab/prometronome/oversea/OverseaServiceImpl;`
  - Method `hasPro()Z` returns constant `true`.

#### Optional Account VIP Status Overrides

- **Target Class:** `Lcom/eumlab/prometronome/baselib/util/UserCache;`
  - Method `isPro()Z` returns constant `true`.
- **Target Class:** `Lcom/eumlab/prometronome/baselib/data/db/entity/User;`
  - Method `isPro()Z` returns constant `true`.
