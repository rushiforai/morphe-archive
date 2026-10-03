# SidelineSwap Patch Specifications

## Overview

This document details the binary bytecode and resource patches available for **SidelineSwap** (`com.sidelineswap.android`).

| Patch Name | Type | Default | Description |
|---|---|---|---|
| [Block Tracking and Telemetry](#block-tracking-and-telemetry) | `bytecodePatch` | `true` | Neutralizes first-party analytics, third-party behavioral trackers, diagnostic logging, payment telemetry, and AAID. |
| [Change Brand Color](#change-brand-color) | `resourcePatch` | `false` | Customizes primary brand accent colors across buttons, navigation highlights, badges, and status bars. |

---

## Block Tracking and Telemetry

### Motivation
SidelineSwap tracks comprehensive user behavior—from items viewed, search terms entered, and checkout steps initiated to device identifiers, crash logs, and payment telemetry. This patch neutralizes all 9 layers of analytics and telemetry at the Dalvik bytecode level while preserving all core marketplace features (searching, buying, selling, messaging, and payments).

### Technical Strategy

#### 1. Central Dispatcher Neutralization
`com.sidelineswap.android.analytics.AnalyticsLogger` aggregates all interaction events and iterates its registered `clients` list.
- In `delegateToClients(l)V`: prepends `return-void`, dropping all events before any client receives them.
- In `addClient(AnalyticsClient)AnalyticsLogger`: prepends `return-object p0`, preventing clients from being registered in the dispatcher.

#### 2. First-Party Telemetry
- In `com.sidelineswap.android.analytics.SidelineSwapClient`: injects `return-void` into `logEvent` and `access$logEvent`.
- In `com.sidelineswap.android.repo.LogRepo`: injects `const/4 v0, 0x0 \n return-object v0` into `trackEvent`, eliminating HTTP `POST` requests to `platform-tools/analytics/v1/track/event`.

#### 3. Amplitude Analytics
- In `com.sidelineswap.android.analytics.AmplitudeClient`: injects `return-void` into `logEvent` and `access$logEvent`.
- In minified Amplitude SDK `Lp073j1/d;`: injects `return-void` into event logging method `d`.

#### 4. Firebase Analytics & Performance
- In `com.sidelineswap.android.analytics.FirebaseClient`: injects `return-void` into `logEvent` and `access$logEvent`.
- In `com.google.firebase.analytics.FirebaseAnalytics`: injects `return-void` into `logEvent`, `setAnalyticsCollectionEnabled`, `setUserProperty`, and `setDefaultEventParameters`.
- In `com.google.firebase.perf.FirebasePerformance`: injects `return-void` into `setPerformanceCollectionEnabled`.

#### 5. Firebase Crashlytics & Timber Logging Tree
- In `com.sidelineswap.android.log.CrashlyticsTree`: injects `return-void` into `log`, preventing Timber from forwarding exceptions to Crashlytics.
- In `com.google.firebase.crashlytics.FirebaseCrashlytics`: injects `return-void` into `log`, `recordException`, and `setCrashlyticsCollectionEnabled`.

#### 6. Facebook Core SDK & App Events
- In `Lp173v2/y;`: injects `return-void` into validation and event logging methods `e`, `f`, `g`, `h`, `i`, `j`, `k`, and `l`.
- In `com.sidelineswap.android.analytics.FacebookClient`: injects `return-void` into all seven checkout and interaction methods: `completedCheckout`, `initiatedCheckout`, `joined`, `newMadeOffer`, `newMadePurchase`, `visitedItem`, and `visitedResults`.
- In `Lp057h2/h;`: injects `return-void` into `a`.

#### 7. Iterable In-App Telemetry
- In `com.sidelineswap.android.analytics.IterableClient`: injects `return-void` into `visitedLocker`.
- In `p159t5/C1123h` (`IterableApi`): injects `return-void` into `d` (`trackInAppClick`), `e` (`trackInAppClose`), `f` (`trackInAppOpen`), and `g` (`trackInAppDelivery`).

#### 8. Braintree / PayPal FPTI Telemetry
- In `AnalyticsUploadWorker` and `AnalyticsWriteToDbWorker`: injects an early return of `new-instance v0, Landroidx/work/ListenableWorker$a$c; \n invoke-direct {v0}, Landroidx/work/ListenableWorker$a$c;-><init>()V \n return-object v0` into every implemented method named `g`. This constructs WorkManager `Result.success()` directly to halt background network transmissions to `b.stats.paypal.com` without causing retry loops.
- In `BraintreeClient` (`com.braintreepayments.api.L`): injects `return-void` into analytics dispatch methods `b` and `c`.

#### 9. Google Play Advertising ID (AAID) Zeroing & Opt-Out
- In minified `AdvertisingIdClient` (`LY2/a;`): patches method `a` to instantiate and return a dummy `LY2/a$a` with GUID `"00000000-0000-0000-0000-000000000000"` and limit ad tracking set to `true`.
- In `com.google.android.gms.ads.identifier.AdvertisingIdClient$Info`: injects `const-string v0, "00000000-0000-0000-0000-000000000000" \n return-object v0` into `getId()`, and injects `const/4 v0, 0x1 \n return v0` into `isLimitAdTrackingEnabled()`.
---

## Change Brand Color

### Motivation
Allows users to personalize the SidelineSwap interface by replacing the default sports-turf green (`#02c874`) with custom color schemes (e.g. Material Blue, Purple, Orange, or Dark/Monochrome).

### Options

| Option Key | Title | Type | Default | Description |
|---|---|---|---|---|
| `primaryColor` | Primary Brand Color | `String` | `#1E88E5` | Hex color code for main accents, buttons, and badges. |
| `primaryDarkColor` | Primary Dark Color | `String` | `#1565C0` | Hex color code for status bars and dark headers. |

### Technical Strategy
- Utilizes Morphe `resourcePatch` to parse and rewrite `res/values/colors.xml` and `res/values-night/colors.xml`.
- Modifies the following resource entries:
  - `colorPrimary`: Updated to `primaryColor`
  - `colorPrimaryDark`: Updated to `primaryDarkColor`
  - `badge_color`: Updated to `primaryColor`
  - `green_badge`: Updated to `primaryColor`
  - `ic_launcher_background`: Updated to `primaryColor`
- Because SidelineSwap uses Android Material Components and Jetpack ViewBinding with standard theme attributes (`@color/colorPrimary`), altering `colors.xml` automatically transforms the entire UI without needing Dalvik bytecode modifications.
