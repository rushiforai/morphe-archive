# Fizz Patch Specifications

## Overview

This document specifies binary bytecode patches developed for **Fizz** (`com.ashtoncofer.Buzz`).

---

## Patch: Remove Tracking and Analytics

- **Name:** Remove Tracking and Analytics
- **Target Package:** `com.ashtoncofer.Buzz`
- **Supported Versions:** `1.53.0`
- **Default State:** `true` (Enabled by default)
- **Type:** Dalvik Bytecode Patch (`bytecodePatch`)
- **Dependencies:** None

### 1. Motivation & Purpose

Fizz incorporates multiple concurrent telemetry pipelines:
1. **PairIP / Google Play Integrity Protection**: Prevents execution of modified APKs by verifying signatures and licensing upon process startup in `attachBaseContext`.
2. **First-Party Client Event Tracking**: Streams fine-grained feed interactions, post views, votes, comment actions, and profile visits to `/app/track-client-events`.
3. **Mixpanel Analytics**: Captures funnel events, demographic properties, and distinct device installation identifiers.
4. **Airbridge Attribution**: Collects install attribution, deep-link campaigns, and device aliases.
5. **Adjust Attribution**: Gathers campaign referrals, session telemetry, and third-party data-sharing signals.
6. **Advertising Identifier (AAID)**: Collects Google Advertising ID and uploads it to Fizz backend servers for ad targeting and user re-identification.
7. **Sentry Telemetry**: Collects diagnostic session logs, error traces, HTTP breadcrumbs, and ANR events.
8. **DM Screenshot Alerts**: Notifies chat counterparts whenever a screenshot is taken inside direct message threads.

This patch neutralizes these surveillance, attribution, and anti-tamper mechanisms while preserving feed browsing, posting, voting, commenting, and direct messaging functionality.

---

### 2. Options Breakdown

- **`silentScreenshots` (Boolean, Default: `true`)**:
  - *Title:* Silent Screenshots
  - *Description:* Suppresses screenshot notification dispatches to chat counterparts in direct message conversations.
  - When enabled, allows taking screenshots of chats without triggering `/chat/notify-screenshot` alerts to the other user.
- **`disableCrashReporting` (Boolean, Default: `true`)**:
  - *Title:* Disable Crash Reporting
  - *Description:* Neutralizes Sentry crash reporting, performance tracing, and operational session telemetry.
  - When enabled, disables `SentryAndroid.init` and marks the Sentry reporting layer as permanently disabled.

---

### 3. Technical Implementation & Injection Points

#### Layer 1: PairIP / Google Play Integrity Protection Bypass
- **Target:** `Lcom/pairip/licensecheck/LicenseClient;`
- **Method:** `checkLicense(Landroid/content/Context;)V`
- **Injection:** Injects `return-void` at index 0.
- **Effect:** Immediately neutralizes runtime licensing and signature validation checks during startup.

#### Layer 2: First-Party Analytics Event Logger & Batch Dispatcher
- **Target 1:** `Lra/da;` (Event queue and flush manager)
  - `a(Lra/n9;Z)V`: Injects `return-void` (stops event enqueuing).
  - `e()V`: Injects `return-void`.
  - `f()V`: Injects `return-void`.
  - `d(ZLol/c;)Ljava/lang/Object;`: Injects `sget-object v0, Lil/z;->a:Lil/z \n return-object v0` (stops periodic flush loop).
  - `g(Lfb/c;Lol/c;)Ljava/lang/Object;`: Injects `sget-object v0, Lil/z;->a:Lil/z \n return-object v0` (stops batch network delivery).
- **Target 2:** `Ljc/i0;` (Analytics network client)
  - `a(Ljava/util/List;Lol/c;)Ljava/lang/Object;`: Injects `const/4 v0, 0x0 \n return-object v0` (neutralizes `POST /app/track-client-events`).
- **Target 3:** `Lec/j;` (Operational reporter)
  - Methods `a`, `b`, `c`, `d`, `e`: Stubbed to `return-void`.

#### Layer 3: Mixpanel Analytics SDK
- **Target 1:** `Ldk/u;` (Mixpanel API client)
  - Void methods `d` (flush) and `l` (reset): Stubbed to `return-void`.
  - `i(Ljava/lang/String;Z)V` (identify): Injects `return-void`.
  - `k(Lorg/json/JSONObject;)V` (super properties): Injects `return-void`.
  - `m(Lorg/json/JSONObject;Ljava/lang/String;Z)V` (track): Injects `return-void`.
  - `b(Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/Long;)Ldk/a;`: Injects `const/4 v0, 0x0 \n return-object v0`.
  - `h()Z` (hasOptedOutTracking): Injects `const/4 v0, 0x1 \n return v0` (signals user opted out).
- **Target 2:** `Lra/va;` (AnalyticsIdentity manager)
  - `c()V`: Injects `return-void` (prevents device identity generation and refresh).

#### Layer 4: Airbridge Attribution & Mobile Measurement SDK
- **Target 1:** `Lsa/n;` (App Airbridge wrapper)
  - `f(Landroid/app/Application;Lqa/a0;)V`: Injects `return-void` (neutralizes SDK init in `FizzApplication.onCreate`).
  - `b(Ljava/lang/String;)V`: Injects `return-void`.
  - `c(Lsa/d0;)V`: Injects `return-void`.
  - `d()V`: Injects `return-void`.
  - `e(Ljava/lang/String;)V`: Injects `return-void`.
  - `a(Landroid/content/Intent;Lge/e;)Z`: Injects `const/4 v0, 0x0 \n return v0`.
- **Target 2:** `Lco/ab180/airbridge/Airbridge;`
  - Void methods: `initializeSDK`, `trackEvent`, `startTracking`, `startInAppPurchaseTracking`, `stopTracking`, `stopInAppPurchaseTracking`, `clearUser`, `clearDeviceAlias`, `clearUserAlias`, `clearUserAttributes`, `clearUserEmail`, `clearUserID`, `clearUserPhone`, `allowTrackingItem`, `blockTrackingItem`, `disableSDK`, `enableSDK`, `registerPushToken`, `removeDeviceAlias`, `removeUserAlias`, `removeUserAttribute`, `setDeviceAlias`, `setUserAlias`, `setUserAttribute`, `setUserEmail`, `setUserID`, `setUserPhone`, `setWebInterface`: Injects `return-void`.
  - Boolean methods: `isTrackingEnabled()Z`, `isInAppPurchaseTrackingEnabled()Z`, `isSDKEnabled()Z`: Injects `const/4 v0, 0x0 \n return v0`.

#### Layer 5: Adjust Attribution & Tracking SDK
- **Target 1:** `Lsa/b;` (App Adjust wrapper)
  - `f(Landroid/content/Context;)Z`: Injects `const/4 v0, 0x0 \n return v0` (signals Adjust is disabled/uninitialized).
  - Void methods `b`, `c`, `d`, `e`: Stubbed to `return-void`.
  - `a(Landroid/content/Intent;Lge/e;)Z`: Injects `const/4 v0, 0x0 \n return v0`.
- **Target 2:** `Lcom/adjust/sdk/Adjust;`
  - Void methods: `initSdk`, `trackEvent`, `trackAdRevenue`, `trackMeasurementConsent`, `trackPlayStoreSubscription`, `trackThirdPartySharing`, `setPushToken`, `setReferrer`, `onResume`, `onPause`, `disable`, `enable`, `gdprForgetMe`, `switchToOfflineMode`, `switchBackToOnlineMode`: Injects `return-void`.

#### Layer 6: Google Play Advertising ID (AAID) Neutralization
- **Target 1:** `Lcom/google/android/gms/ads/identifier/AdvertisingIdClient;`
  - `getAdvertisingIdInfo(Landroid/content/Context;)Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;`: Injects spoofed `Info` object with zeroes:
    ```smali
    new-instance v0, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;
    const-string v1, "00000000-0000-0000-0000-000000000000"
    const/4 v2, 0x1
    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;-><init>(Ljava/lang/String;Z)V
    return-object v0
    ```
- **Target 2:** `Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;`
  - `getId()Ljava/lang/String;`: Injects `const-string v0, "00000000-0000-0000-0000-000000000000" \n return-object v0`.
  - `isLimitAdTrackingEnabled()Z`: Injects `const/4 v0, 0x1 \n return v0`.
- **Target 3:** `Lsa/k;` (AAID Backend Registrar)
  - `a(Lol/c;)Ljava/lang/Object;`: Injects `sget-object v0, Lil/z;->a:Lil/z \n return-object v0`.

#### Layer 7: Sentry Telemetry (Guarded by `disableCrashReporting`)
- **Target 1:** `Lec/b1;` (App Sentry coordinator)
  - `b(Lcom/fizzsocial/fizz/FizzApplication;)V`: Injects `return-void` (suppresses Sentry initialization on startup).
  - `isEnabled()Z`: Injects `const/4 v0, 0x0 \n return v0`.
- **Target 2:** `Lio/sentry/android/core/q1;` (SentryAndroid core)
  - `b(Landroid/content/Context;Lio/sentry/android/core/y;Lio/sentry/k4;)V`: Injects `return-void`.

#### Layer 8: Silent DM Screenshots (Guarded by `silentScreenshots`)
- **Target 1:** `Lrd/b2;` (Conversation screenshot notification worker)
  - `invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;`: Injects `sget-object v0, Lil/z;->a:Lil/z \n return-object v0`.
- **Target 2:** `Ljc/l2;` (Chat repository)
  - `q(Ljava/lang/String;Lol/c;)Ljava/lang/Object;`: Injects synthetic successful `Result.success(Unit)`:
    ```smali
    sget-object v0, Lil/z;->a:Lil/z;
    new-instance v1, Lcb/l;
    invoke-direct {v1, v0}, Lcb/l;-><init>(Ljava/lang/Object;)V
    return-object v1
    ```

---

### 4. Preconditions & Verification

1. **Target Specification**: Compatible with Fizz `1.53.0` (`com.ashtoncofer.Buzz`), signature SHA-256 `622850867847ccb7a1371bc42c865b1137fa51bd19987dc81b53815c9a9817bf`.
2. **Build Verification**:
   ```bash
   ./gradlew :patches:buildAndroid clean --no-daemon
   ```
3. **Metadata Generation**:
   ```bash
   ./gradlew generatePatchesList
   ```
4. **Bytecode Verification**:
   - Inspect patched APK using `jadx` or `baksmali` to confirm `checkLicense`, `ra.da`, `jc.i0`, `dk.u`, `sa.n`, `sa.b`, `AdvertisingIdClient`, `ec.b1`, and `rd.b2` contain injected instructions.

---

## Patch: Replace Emoji Font with iOS

- **Name:** Replace Emoji Font with iOS
- **Target Package:** `com.ashtoncofer.Buzz`
- **Supported Versions:** `1.53.0`
- **Default State:** `true` (Enabled by default)
- **Type:** Dalvik Bytecode Patch (`bytecodePatch`) with dependent Asset Patch (`rawResourcePatch`)
- **Dependencies:** `Replace Emoji Font with iOS Asset`
- **Extensions:** `extensions/extension.mpe` (`app.aidan.extension.emoji.EmojiFontBridge`)

### 1. Motivation & Purpose

Fizz defaults to Android system / Google Noto emoji styling for all user content (feed posts, comments, reactions, and direct messages). This patch bundles Apple Color Emoji (iOS 18+ CBDT/CBLC bitmap font) and injects it into Android's native text fallback chain, presenting native Apple emojis across all screens without requiring root or device-level font modifications.

---

### 2. Technical Implementation & Injection Points

#### Layer 1: Asset Packaging (`Replace Emoji Font with iOS Asset`)
- **Target File:** `assets/fonts/AppleColorEmoji.ttf`
- **Source:** Generated at build time by `.github/scripts/prepare_emoji_font.py` (downloaded from upstream release, preserved at native 2048 UPM matching hmtx advance widths, injected with `cmap` Format 14, and pruned to 96x96 strike) and packaged in patch bundle resources (`fonts/AppleColorEmoji.ttf`).
- **Effect:** Extracts and packages the single-strike 96x96 (36.6 MB) Apple Color Emoji font file directly into the APK's assets directory.

#### Layer 2: EmojiCompat Neutralization
- **Target:** `Landroidx/emoji2/text/EmojiCompatInitializer;`
- **Method:** `b(Landroid/content/Context;)Ljava/lang/Object;`
- **Injection:** Injects at index 0:
  ```smali
  sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
  return-object v0
  ```
- **Effect:** Prevents `EmojiCompat` from configuring and registering Google Play Services downloadable fonts. Compose UI (`q4.c`) treats emojis as standard characters and renders them through `Typeface` directly.

#### Layer 3: Compose Resource Font Wrapping (`nunito_variable`)
- **Target:** `Ln4/a;` (`AndroidFontLoader`)
- **Method:** `b(Ln4/w;)Landroid/graphics/Typeface;`
- **Injection:** After `ResourcesCompat.getFont` / `d5.n.b` result:
  ```smali
  const v1, 0x7f090000
  invoke-static {v2, v0, v1}, Lapp/aidan/extension/emoji/EmojiFontBridge;->wrapTypeface(Landroid/content/Context;Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;
  move-result-object v0
  ```
- **Effect:** Replaces the loaded Nunito typeface with a composite typeface created via `Typeface.CustomFallbackBuilder` with `AppleColorEmoji.ttf` as its custom fallback.

#### Layer 4: Compose Platform Typeface Wrapping
- **Target:** `Luj/a;`
- **Method:** `v(Ljava/lang/String;Ln4/s;I)Landroid/graphics/Typeface;`
- **Injection:** Wraps both return branches (default font and styled font) through:
  ```smali
  invoke-static {v2, v3, v0}, Lapp/aidan/extension/emoji/EmojiFontBridge;->wrapPlatformTypeface(Landroid/graphics/Typeface;IZ)Landroid/graphics/Typeface;
  move-result-object v2
  ```
- **Effect:** Ensures system and generic fallback typefaces in Compose also include Apple Color Emoji in their fallback hierarchy.

---

### 3. Preconditions & Verification

1. **Build Verification**:
   ```bash
   ./gradlew :extensions:extension:assembleRelease
   ./gradlew :patches:buildAndroid clean --no-daemon
   ```
2. **Metadata Verification**:
   ```bash
   ./gradlew generatePatchesList
   ```
3. **Runtime Smoke Test**:
   - Verify in-app emojis on `emulator-5554` render using iOS Apple Color Emoji graphics across posts, comments, and direct message threads.

---

## Patch: Enable Developer Settings

- **Name:** Enable Developer Settings
- **Target Package:** `com.ashtoncofer.Buzz`
- **Supported Versions:** `1.53.0`
- **Default State:** `false` (Disabled by default)
- **Type:** Dalvik Bytecode Patch (`bytecodePatch`)
- **Extensions:** `extensions/extension.mpe` (`app.aidan.extension.fizz.DeveloperMenuBridge`, `DeveloperMenuDialog`)
- **Dependencies:** None

### 1. Motivation & Purpose

Fizz contains a hidden on-device developer suite (Mobile Studio) that is normally inaccessible in production release builds.

This patch adds a dedicated Developer Settings button into the Home Screen top navigation bar directly to the left of the notification bell, opening a native dark-themed developer mod menu (`DeveloperMenuDialog`) with controls for 1-tap Mobile Studio launching. User role property overrides (`isSuperAdmin`, `isAdmin`, `isModerator`, `isBankAdmin`, etc.) can be directly controlled with one tap inside Mobile Studio's built-in "User Property Overrides" menu.
---

### 2. Options Breakdown

- **`mobileStudio` (Boolean, Default: `true`)**:
  - *Title:* Mobile Studio
  - *Description:* Adds a 1-tap "Launch Mobile Studio" action into the developer mod menu and permanently unlocks Mobile Studio drawer access.
---

### 3. Technical Implementation & Injection Points

#### Layer 1: Bridge Lifecycle Initialization (`MainActivity.onCreate`)
- **Target:** `Lcom/fizzsocial/fizz/MainActivity;`
- **Method:** `onCreate(Landroid/os/Bundle;)V`
- **Injection:** Injects initializer call immediately after `super.onCreate`:
  ```smali
  const/4 v0, $mobileStudioVal
  invoke-static {p0, v0}, Lapp/aidan/extension/fizz/DeveloperMenuBridge;->init(Landroid/app/Activity;Z)V
  ```
- **Effect:** Binds the active activity reference and configuration flag for menu presentation and Mobile Studio dispatch before any Compose UI rendering begins.

#### Layer 2: Home TopBar Icon Composable Injection (`sd.w.a`)
- **Target:** `Lsd/w;`
- **Method:** `a(...)V`
- **Insertion Anchor:** Immediately before the `sget-object v3, La3/b;->f:La3/i` instruction preceding `feed-activity-button`. The incoming branch (`goto` from single-feed title) is dynamically retargeted to the developer settings button so it executes across both single-feed and multi-tab home top bar configurations.
- **Layout Specifications:**
  - Container Scope: `androidx.compose.foundation.layout.b` (`BoxScope`)
  - Alignment: `a3.b.f` (`Alignment.CenterEnd`)
  - Right Margin: `56.dp` (`0x42600000`, positioned `4.dp` to the left of the `44.dp` notification bell with `8.dp` right margin)
  - Touch Target: `44.dp x 44.dp` (`0x42300000`)
  - Inner Padding: `10.dp` all around (centers the `24.dp` vector inside the `44.dp` touch target)
  - Semantics Tag: `feed-developer-button`
  - Icon Vector: `ne.t.a` (`Outlined.Settings` gear icon)
  - Dynamic Tint: `cVar4.f46557z` (`we.c.z`, inherits campus theme color)
  - Click Listener: Calls `DeveloperMenuBridge.getClickListener()` (dynamic Kotlin `Function0<Unit>` proxy).

#### Layer 3: Mobile Studio Hardware & Flow Dispatch (`DeveloperMenuBridge`)
- **Primary Mechanism:** Reflects onto `MainActivity.m0` (`ce.j1`) and emits `il.z.a` directly into `m0.f4616a.r(Unit)`.
- **Fallback Mechanism:** Dispatches alternating `KEYCODE_VOLUME_UP` and `KEYCODE_VOLUME_DOWN` key events within 1,200 ms via `activity.dispatchKeyEvent(...)`.

#### Layer 4: Mobile Studio Drawer Gating Bypass (`ce.w1.invokeSuspend`)
- When `mobileStudio == true`, patches case 1 of `ce.w1.invokeSuspend` to return `Boolean.TRUE`, ensuring the root Compose drawer (`ce.i1`) mounts and animates on all user accounts.
