# Fizz Patch Specifications

## Overview

This document specifies binary bytecode patches developed for **Fizz** (`com.ashtoncofer.Buzz`).

---

## Patch: Remove Tracking and Analytics

- **Name:** Remove Tracking and Analytics
- **Target Package:** `com.ashtoncofer.Buzz`
- **Supported Versions:** `1.54.0`, `1.72.0`
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
  - _Title:_ Silent Screenshots
  - _Description:_ Suppresses screenshot notification dispatches to chat counterparts in direct message conversations.
  - When enabled, allows taking screenshots of chats without triggering `/chat/notify-screenshot` alerts to the other user.
- **`disableCrashReporting` (Boolean, Default: `true`)**:
  - _Title:_ Disable Crash Reporting
  - _Description:_ Neutralizes Sentry crash reporting, performance tracing, and operational session telemetry.
  - When enabled, disables `SentryAndroid.init` and marks the Sentry reporting layer as permanently disabled.

---

### 3. Technical Implementation & Injection Points

#### Layer 1: PairIP / Google Play Integrity Protection Bypass

- **Target:** `Lcom/pairip/licensecheck/LicenseClient;`
- **Method:** `checkLicense(Landroid/content/Context;)V`
- **Injection:** Injects `return-void` at index 0.
- **Effect:** Immediately neutralizes runtime licensing and signature validation checks during startup.

#### Layer 2: First-Party Analytics Event Logger & Batch Dispatcher

- **Target 1:** `Lra/ga;` (Event queue and flush manager; `Lpa/ue;` on 1.72.0). Method names shift by
  one on 1.72.0 — see the version table above.
  - `a(Lra/q9;Z)V`: Injects `return-void` (stops event enqueuing).
  - `e()V`: Injects `return-void`.
  - `f()V`: Injects `return-void`.
  - `d(ZLql/c;)Ljava/lang/Object;`: Injects `sget-object v0, Lkl/z;->a:Lkl/z \n return-object v0` (stops periodic flush loop).
  - `g(Lfb/c;Lql/c;)Ljava/lang/Object;`: Injects `sget-object v0, Lkl/z;->a:Lkl/z \n return-object v0` (stops batch network delivery).
- **Target 2:** `Ljc/k0;` (Analytics network client)
  - `a(Ljava/util/List;Lql/c;)Ljava/lang/Object;`: Injects `const/4 v0, 0x0 \n return-object v0` (neutralizes `POST /app/track-client-events`).
- **Target 3:** `Lec/j;` (Operational reporter)
  - Method `a`: Stubbed to `return-void`.

#### Layer 3: Mixpanel Analytics SDK

- **Target 1:** `Lfk/u;` (Mixpanel API client)
  - Void methods `d` (flush) and `l` (reset): Stubbed to `return-void`.
  - `i(Ljava/lang/String;Z)V` (identify): Injects `return-void`.
  - `k(Lorg/json/JSONObject;)V` (super properties): Injects `return-void`.
  - `m(Lorg/json/JSONObject;Ljava/lang/String;Z)V` (track): Injects `return-void`.
  - `b(Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/Long;)Lfk/a;`: Injects `const/4 v0, 0x0 \n return-object v0`.
  - `h()Z` (hasOptedOutTracking): Injects `const/4 v0, 0x1 \n return v0` (signals user opted out).
- **Target 2:** `Lra/ya;` (AnalyticsIdentity manager)
  - `c()V`: Injects `return-void` (prevents device identity generation and refresh).

#### Layer 4: Airbridge Attribution & Mobile Measurement SDK

- **Target 1:** `Lsa/l0;` (App Airbridge wrapper)
  - `f(Landroid/content/Intent;Lhe/d;)Z`: Injects `const/4 v0, 0x0 \n return v0`.
  - Void methods `a`, `b`, `c`, `d`, `e`: Injects `return-void`.
- **Target 2:** `Lco/ab180/airbridge/Airbridge;`
  - Void methods: `initializeSDK`, `trackEvent`, `startTracking`, `startInAppPurchaseTracking`, `stopTracking`, `stopInAppPurchaseTracking`, `clearUser`, `clearDeviceAlias`, `clearUserAlias`, `clearUserAttributes`, `clearUserEmail`, `clearUserID`, `clearUserPhone`, `allowTrackingItem`, `blockTrackingItem`, `disableSDK`, `enableSDK`, `registerPushToken`, `removeDeviceAlias`, `removeUserAlias`, `removeUserAttribute`, `setDeviceAlias`, `setUserAlias`, `setUserAttribute`, `setUserEmail`, `setUserID`, `setUserPhone`, `setWebInterface`: Injects `return-void`.
  - Boolean methods: `isTrackingEnabled()Z`, `isInAppPurchaseTrackingEnabled()Z`, `isSDKEnabled()Z`: Injects `const/4 v0, 0x0 \n return v0`.

#### Layer 5: Adjust Attribution & Tracking SDK

- **Target 1:** `Lsa/b;` (App Adjust wrapper)
  - `g(Landroid/content/Context;)Z`: Injects `const/4 v0, 0x0 \n return v0` (signals Adjust is disabled/uninitialized).
  - `f(Landroid/content/Intent;Lhe/d;)Z`: Injects `const/4 v0, 0x0 \n return v0`.
  - Void methods `a`, `b`, `c`, `d`, `e`: Stubbed to `return-void`.
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
- **Target 3:** `Lsa/n0;` (AAID Backend Registrar)
  - `invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;`: Injects `sget-object v0, Lkl/z;->a:Lkl/z \n return-object v0`.

#### Layer 7: Sentry Telemetry (Guarded by `disableCrashReporting`)

- **Target 1:** `Lec/p1;` (App Sentry coordinator)
  - `b(Lcom/fizzsocial/fizz/FizzApplication;)V`: Injects `return-void` (suppresses Sentry initialization on startup).
  - `isEnabled()Z`: Injects `const/4 v0, 0x0 \n return v0`.
- **Target 2:** `Lio/sentry/android/core/s1;` (SentryAndroid core)
  - `b(Landroid/content/Context;Lio/sentry/android/core/y;Lio/sentry/k4;)V`: Injects `return-void`.

#### Layer 8: Silent DM Screenshots (Guarded by `silentScreenshots`)

- **Target 1:** `Lsd/a2;` (Conversation screenshot notification worker)
  - `invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;`: Injects `sget-object v0, Lkl/z;->a:Lkl/z \n return-object v0`.
- **Target 2:** `Ljc/n2;` (Chat repository)
  - `q(Ljava/lang/String;Lql/c;)Ljava/lang/Object;`: Injects synthetic successful `Result.success(Unit)`:

    ```smali
    const/4 v0, 0x0
    new-instance v1, Lcb/l;
    invoke-direct {v1, v0}, Lcb/l;-><init>(Ljava/lang/Object;)V
    return-object v1
    ```

---

#### Version-specific targets (1.54.0 → 1.72.0)

Fizz renames its own classes on every release, so each layer resolves its targets from the patch's
`TRACKING_TARGETS_1_*` table selected by `packageMetadata.versionName`. Sandboxed SDK classes
(PairIP, Adjust, Airbridge, Google AAID) keep stable descriptors on both builds.

| Role                                    | 1.54.0                                           | 1.72.0                                           |
| --------------------------------------- | ------------------------------------------------ | ------------------------------------------------ |
| Analytics batcher                       | `Lra/ga;`                                        | `Lpa/ue;`                                        |
| Log event                               | `a(Lra/q9;Z)V`                                   | `a(Lpa/pd;Z)V`                                   |
| Flush buffered events                   | `e()V`                                           | `f()V`                                           |
| Reset analytics                         | `f()V`                                           | `g()V`                                           |
| Dispatch batch                          | `d(ZLql/c;)Ljava/lang/Object;`                   | `e(ZLzm/c;)Ljava/lang/Object;`                   |
| Send batch                              | `g(Lfb/c;Lql/c;)Ljava/lang/Object;`              | `h(Leb/c;Lzm/c;)Ljava/lang/Object;`              |
| Analytics request client                | `Ljc/k0;`                                        | `Loc/s0;`                                        |
| Operational reporter                    | `Lec/j;`                                         | `Lhc/l;`                                         |
| Mixpanel client                         | `Lfk/u;` (flush `d`, `l`)                        | `Lml/u;` (flush `d`, `k`)                        |
| Mixpanel identify / track / track-timed | `i` / `k` / `m`                                  | `h` / `j` / `l`                                  |
| Mixpanel people / opted-out             | `b` / `h()Z`                                     | `b` / `g()Z`                                     |
| Analytics identity store                | `Lra/ya;`                                        | `Lpa/tf;`                                        |
| Airbridge wrapper                       | `Lsa/l0;`                                        | `Lqa/n0;`                                        |
| Adjust wrapper                          | `Lsa/b;`                                         | `Lqa/b;`                                         |
| Wrapper intent check                    | `f(Intent;Lhe/d;)Z`                              | `i(Intent;Loa/x0;)Z`                             |
| Wrapper availability check              | `g(Context)Z` (Adjust only)                      | `j(Context)Z` (Adjust only)                      |
| Wrapper no-op void set                  | `a`–`e`                                          | `a`, `d`, `e`, `f`, `g`                          |
| AAID registrar coroutine                | `Lsa/n0;`                                        | `Lqa/p0;`                                        |
| Sentry facade                           | `Lec/p1;`                                        | `Lhc/d2;`                                        |
| Sentry Android initializer              | `Lio/sentry/android/core/s1;->b(Context;y;k4;)V` | `Lio/sentry/android/core/r1;->b(Context;x;k4;)V` |
| DM screenshot worker                    | `Lsd/a2;`                                        | `Lde/b3;`                                        |
| Chat screenshot upload                  | `Ljc/n2;->q(String;Lql/c;)`                      | `Loc/m3;->s(String;Lzm/c;)`                      |
| Kotlin `Unit` singleton                 | `Lkl/z;`                                         | `Ltm/z;`                                         |
| Result success wrapper                  | `Lcb/l;`                                         | `Lbb/m;`                                         |

### 4. Preconditions & Verification

1. **Target Specification**: Compatible with Fizz `1.54.0` and `1.72.0` (`com.ashtoncofer.Buzz`), signature SHA-256 `622850867847ccb7a1371bc42c865b1137fa51bd19987dc81b53815c9a9817bf`.
2. **Build Verification**:

   ```bash
   ./gradlew :patches:buildAndroid clean --no-daemon
   ```

3. **Metadata Generation**:

   ```bash
   ./gradlew generatePatchesList
   ```

4. **Bytecode Verification**:
   - Inspect patched APK using `jadx` or `baksmali` to confirm `checkLicense`, `ra.ga`, `jc.k0`, `fk.u`, `sa.l0`, `sa.b`, `AdvertisingIdClient`, `ec.p1`, and `sd.a2` contain injected instructions.

---

## Patch: Replace Emoji Font with iOS

- **Name:** Replace Emoji Font with iOS
- **Target Package:** `com.ashtoncofer.Buzz`
- **Supported Versions:** `1.54.0`, `1.72.0`
- **Default State:** `true` (Enabled by default)
- **Type:** Composite Feature Patch (`compositeFeaturePatch`)
- **Dependencies:** None
- **Extensions:** `extensions/extension.mpe` (`app.aidan.extension.emoji.EmojiFontBridge`)

### 1. Motivation & Purpose

Fizz defaults to Android system / Google Noto emoji styling for all user content (feed posts, comments, reactions, and direct messages). This patch bundles Apple Color Emoji (iOS 18+ CBDT/CBLC bitmap font) and injects it into Android's native text fallback chain on Android 10+ (API 29+), presenting native Apple emojis across all screens without requiring root or device-level font modifications. On Android API 23–28 or if font asset loading fails, the original system font rendering is preserved.

---

### 2. Technical Implementation & Injection Points

#### Layer 1: Internal Asset Packaging

- **Target File:** `assets/fonts/AppleColorEmoji.ttf`
- **Source:** Generated at build time by `tools/asset-prep` (`font` subcommand via Gradle `prepareEmojiFont`): downloaded from the pinned upstream release, preserved at native 2048 UPM matching hmtx advance widths, injected with `cmap` Format 14, and pruned to the 96x96 strike. The exact processed bytes are packaged in patch bundle resources (`fonts/AppleColorEmoji.ttf`).
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

- **Target:** `Lhg/g;` (`AndroidFontLoader`)
- **Method:** `c(Ln4/v;)Landroid/graphics/Typeface;`
- **Injection:** Injects wrapping call after `ResourcesCompat.getFont` / `d5.n.b` result:

  ```smali
  invoke-static {v1, v0}, Lapp/aidan/extension/emoji/EmojiFontBridge;->wrapTypeface(Landroid/content/Context;Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
  move-result-object v0
  ```

- **Effect:** On Android API 29+, replaces the loaded Nunito typeface with a composite typeface created via `Typeface.CustomFallbackBuilder` with `AppleColorEmoji.ttf` as its custom fallback; below API 29, returns the original typeface.

#### Layer 4: Compose Platform Typeface Wrapping

- **Target:** `Lwj/a;`
- **Method:** `t(Ljava/lang/String;Ln4/r;I)Landroid/graphics/Typeface;`
- **Injection:** Wraps both return branches (default font and styled font) through:

  ```smali
  invoke-static {p0, p1, v0}, Lapp/aidan/extension/emoji/EmojiFontBridge;->wrapPlatformTypeface(Landroid/graphics/Typeface;IZ)Landroid/graphics/Typeface;
  move-result-object p0
  ```

- **Effect:** Ensures system and generic fallback typefaces in Compose also include Apple Color Emoji in their fallback hierarchy on Android API 29+.

#### Version-specific targets (1.54.0 → 1.72.0)

Compose ships fully obfuscated, so the font and typeface anchors come from the patch's
`FONT_TARGETS_1_*` table selected by `packageMetadata.versionName`. The emoji asset path and the
`EmojiCompatInitializer` descriptor are identical on both builds.

| Role                | 1.54.0                                                            | 1.72.0                                                            |
| ------------------- | ----------------------------------------------------------------- | ----------------------------------------------------------------- |
| Android font loader | `Lhg/g;->c(Ln4/v;)Landroid/graphics/Typeface;`                    | `Ll4/a;->b(Ll4/z;)Landroid/graphics/Typeface;`                    |
| Platform typefaces  | `Lwj/a;->t(Ljava/lang/String;Ln4/r;I)Landroid/graphics/Typeface;` | `Lal/a;->a(Ljava/lang/String;Ll4/s;I)Landroid/graphics/Typeface;` |

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
- **Supported Versions:** `1.54.0`, `1.72.0`
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
  - _Title:_ Mobile Studio
  - _Description:_ Adds a 1-tap "Launch Mobile Studio" action into the developer mod menu and permanently unlocks Mobile Studio drawer access.

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

#### Layer 2: Home TopBar Icon Composable Injection (`td.v.a`)

- **Target:** `Ltd/v;`
- **Method:** `a(...)V`
- **Insertion Anchor:** Immediately before the `sget-object v3, La3/b;->f:La3/i` instruction preceding `feed-activity-button`. The incoming branch (`goto` from single-feed title) is retargeted to the developer settings button when the expected anchor is found.
- **Layout Specifications:**
  - Container Scope: `androidx.compose.foundation.layout.b` (`BoxScope`)
  - Alignment: `a3.b.f` (`Alignment.CenterEnd`)
  - Right Margin: `56.dp` (`0x42600000`, positioned `4.dp` to the left of the `44.dp` notification bell with `8.dp` right margin)
  - Touch Target: `44.dp x 44.dp` (`0x42300000`)
  - Inner Padding: `10.dp` all around (centers the `24.dp` vector inside the `44.dp` touch target)
  - Semantics Tag: `feed-developer-button`
  - Icon Vector: `oe.u.a` (`Outlined.Settings` gear icon)
  - Dynamic Tint: `ye.c.z` (inherits campus theme color)
  - Click Listener: Calls `DeveloperMenuBridge.getClickListener()` (dynamic Kotlin `Function0<Unit>` proxy).

#### Layer 3: Mobile Studio Hardware & Flow Dispatch (`DeveloperMenuBridge`)

- **Primary Mechanism:** Reflects onto `MainActivity.m0` (`de.y0`) and emits `kl.z.a` directly into `m0.a(Unit)`.
- **Fallback Mechanism:** Dispatches alternating `KEYCODE_VOLUME_UP` and `KEYCODE_VOLUME_DOWN` key events within 1,200 ms via `activity.dispatchKeyEvent(...)`.

#### Layer 4: Mobile Studio Drawer Gating Bypass (`de.k1.invokeSuspend`)

- When `mobileStudio == true`, patches the spoof-user case of the drawer gate's `invokeSuspend`
  (`de.k1` on 1.54.0, `de.r2` on 1.72.0) to return `Boolean.TRUE`, ensuring the root Compose drawer
  mounts and animates on all user accounts.

#### Version-specific targets (1.54.0 → 1.72.0)

The top bar composable, its injectable register set, and every reflected Compose symbol differ per
build, so the whole button block is stored per version in `DEVELOPER_TARGETS_1_*`.

| Role                              | 1.54.0                                | 1.72.0                                                           |
| --------------------------------- | ------------------------------------- | ---------------------------------------------------------------- |
| Home top bar composable           | `Ltd/v;->a(...)`                      | `Lee/n1;->a(Lee/w8;Ldf/k0;Lhn/c;Lk1/i1;Ly2/q;Lhn/c;Lhn/a;Z...)V` |
| Compose `Alignment.CenterEnd`     | `La3/b;->f`                           | `Ly2/b;->f`                                                      |
| Settings icon vector              | `Loe/u;->a:Ln3/e;`                    | `Lrf/i0;->a:Ll3/e;`                                              |
| Icon renderer                     | `Lk2/t0;->b(...)`                     | `Li2/w1;->b(...)`                                                |
| `Modifier` / `Role` / `Function0` | `La3/s;` / `Lg4/g;` / `Lyl/a;`        | `Ly2/q;` / `Le4/h;` / `Lhn/a;`                                   |
| Color scheme tint                 | `Lye/c;->z:J`                         | `Lcg/d;->y:J`                                                    |
| Mobile Studio drawer gate         | `Lde/k1;->invokeSuspend`              | `Lde/r2;->invokeSuspend`                                         |
| `SpoofUser` model                 | `Lcom/fizzsocial/fizz/data/local/v6;` | `Lcom/fizzsocial/fizz/data/local/y7;`                            |
| Kotlin `Unit` singleton           | `Lkl/z;`                              | `Ltm/z;`                                                         |
| Request holder on `MainActivity`  | `m0`                                  | `o0` (`Lpe/o0;->a:Ltn/k0;`)                                      |

Live registers at the 1.72.0 injection point are `v2` (RowScope), `v4` (row modifier), `v8`
(composer) and `v42` (color scheme); the injected block builds its own modifier chain in `v11`–`v22`
and materializes each padding constant directly, because the assembler drops plain `move` copies.

---

## Patch: Remove Ads

- **Name:** Remove Ads
- **Target Package:** `com.ashtoncofer.Buzz`
- **Supported Versions:** `1.54.0`, `1.72.0`
- **Default State:** `true` (Enabled by default)
- **Type:** Dalvik Bytecode Patch (`bytecodePatch`)
- **Dependencies:** None

### 1. Motivation & Purpose

Fizz injects promotional advertisements into the user content feed:

1. **Sponsored Feed Advertisements (`advertisement`)**: Commercial ad campaigns formatted as feed announcement items.
2. **Marketplace Listing Advertisements (`listing`)**: Embedded university marketplace cards (`"<Campus> Marketplace"`, `"View Listing"`, `"DM SELLER"`) inserted between user feed posts.

This patch eliminates sponsored feed advertisements by default and provides a configurable option to remove marketplace listing ads as well.

---

### 2. Options Breakdown

- **`removeMarketplaceAds` (Boolean, Default: `true`)**:
  - _Title:_ Remove Marketplace Ads
  - When enabled, filters out embedded marketplace listing cards (`ListingFeedItem` / `sc.t1`) from the feed while preserving normal navigation and functionality of the dedicated Marketplace tab.

---

### 3. Technical Implementation & Injection Points

#### Layer 1: Display Items Filter (`HomeFeedViewModel.l0`)

- **Target:** `Lcom/fizzsocial/fizz/ui/feed/HomeFeedViewModel;`
- **Method:** `l0(Ltd/j4;)Ltd/j4;`
- **Mechanism:** Injects call to `app.aidan.extension.fizz.FeedFilterBridge` before the `td.f0.l` (`displayItems`) equality check and assignment:

  ```smali
  invoke-static {v$reg}, Lapp/aidan/extension/fizz/FeedFilterBridge->filterDisplayItems(Ljava/util/List;)Ljava/util/List;
  move-result-object v$reg
  ```

  - Commercial advertisements (`sc.k` with `d1.Advertisement`) are filtered out by default.
  - If `removeMarketplaceAds == true`, marketplace listing cards (`sc.t1`) are also filtered out via `filterDisplayItems(List)`.
  - If `removeMarketplaceAds == false`, calls `filterAdsOnly(List)` to retain marketplace listing cards while still filtering commercial ads.

- **Filtering Behavior:** The patch filters the list passed to `displayItems` before the existing comparison/assignment; the bridge source does not establish repository-state, deduplication, `endReached`, or continuous-pagination behavior.
- **Register Safety:** The injected call reuses the register that holds the freshly built display
  list (the `Object.equals` receiver) for both the argument and result, and fails fast when that
  register exceeds the 4-bit `invoke-static` operand range.

#### Version-specific targets (1.54.0 → 1.72.0)

| Role                     | 1.54.0                                 | 1.72.0                                 |
| ------------------------ | -------------------------------------- | -------------------------------------- |
| Feed state builder       | `HomeFeedViewModel.l0(Ltd/j4;)Ltd/j4;` | `HomeFeedViewModel.u0(Lee/w8;)Lee/w8;` |
| Feed page state          | `Ltd/f0;` (display items field `l`)    | `Lee/d2;` (display items field `l`)    |
| Marketplace listing card | `sc.t1`                                | `yc.z1`                                |
| Commercial ad item       | `sc.k` (type enum field `b`)           | `yc.n` (type enum field `b`)           |

The injected call reuses the register that holds the freshly built list at the `Object.equals`
comparison (the comparison's receiver), which is the same value later copied into the page state;
the patch fails when that register exceeds `v15` or when the page-state copy is not found after it.

---

### 4. Preconditions & Verification

1. **Target Specification**: Compatible with Fizz `1.54.0` and `1.72.0` (`com.ashtoncofer.Buzz`).
2. **Build Verification**:

   ```bash
   ./gradlew :patches:buildAndroid clean --no-daemon
   ```

3. **Metadata Generation**:

   ```bash
   ./gradlew generatePatchesList
   ```

---

## Patch: Block Update Prompts

- **Name:** Block Update Prompts
- **Target Package:** `com.ashtoncofer.Buzz`
- **Supported Versions:** `1.54.0`, `1.72.0`
- **Default State:** `true` (Enabled by default)
- **Type:** Dalvik Bytecode Patch (`bytecodePatch`) with Extension Bridge (`extensions/extension.mpe`)
- **Dependencies:** None

### 1. Motivation & Purpose

Fizz enforces client version freshness via backend session configuration and onboarding state. When the backend reports that the client version is lower than `minimumAppVersion` or when onboarding detects an outdated client version, the app presents a blocking full-screen modal ("New Fizz Update Available" / "To get the best Fizz experience, please update to the newest version of Fizz in the App Store" / "Open Play Store"), locking users out of the application.

This patch neutralizes forced update prompts and active backend gateway version rejections across eight evaluation, rendering, dynamic spoofing, and lifecycle synchronization layers, allowing older client versions to communicate seamlessly with Fizz backend infrastructure.

---

### 2. Technical Implementation & Injection Points

#### Layer 1: SessionState Outdated Check Bypass (`nc.j0.d`)

- **Target:** `Lnc/j0;` (`SessionState`)
- **Method:** `d()Z`
- **Mechanism:** Injects `const/4 v0, 0x0 \n return v0` via `returnRequiredBoolean("Lnc/j0;", "d", false)`.
- **Effect:** Neutralizes the session configuration check comparing `clientVersion` against `minimumAppVersion` and `minimumAppVersionMod`. Prevents `AppViewModel` (methods `x` and `L`) from setting root state to `kd.e.AppUpdateRequired`.

#### Layer 2: Semantic Version Comparator Bypass (`nc.c.b`)

- **Target:** `Lnc/c;`
- **Method:** `b(Ljava/lang/String;Ljava/lang/String;)Z`
- **Mechanism:** Injects `const/4 v0, 0x0 \n return v0` via `returnRequiredBoolean("Lnc/c;", "b", false)`.
- **Effect:** Forces semantic version comparisons to evaluate as false, guaranteeing that the running version is never evaluated as older than any minimum version threshold.

#### Layer 3: Onboarding UI State Field Neutralization (`ge.u1.<init>`)

- **Target:** `Lge/u1;` (`OnboardingUiState`)
- **Method:** `<init>` (Constructor)
- **Mechanism:** Locates the `IPUT_BOOLEAN` instruction referencing field `l0:Z` (`isAppUpdateRequired`) and inserts `const/4 v$registerA, 0x0` immediately before it.
- **Effect:** Guarantees `this.l0` is always set to `false` upon initialization and copy mutations across all `OnboardingUiState` instances.

#### Layer 4: Onboarding Screen Update Branch Neutralization (`ge.r1.h`)

- **Target:** `Lge/r1;`
- **Method:** `h(La3/s;Lge/s1;Ljava/lang/String;ZLyl/a;Lyl/a;Lcom/fizzsocial/fizz/ui/onboarding/OnboardingViewModel;Lyl/a;Lo2/p;II)V`
- **Mechanism:** Locates the `IGET_BOOLEAN` instruction reading field `l0:Z` from `Lge/u1;` and replaces it with `const/4 v$registerA, 0x0`.
- **Effect:** Ensures the subsequent `if-eqz v0, :cond_57f` branch always branches past the update prompt composable `kd.o1.a`, allowing the normal onboarding UI to render.

#### Layer 5: Update Prompt Composable Stubbing (`kd.o1.a` / `td.a2.a`)

- **Target:** `Lkd/o1;`
- **Method:** `a(La3/s;Lo2/p;I)V` on 1.54.0, `a(Ly2/q;Lm2/p;I)V` on 1.72.0
- **Mechanism:** Injects an immediate `return-void` at index 0 into the update prompt composable
  (`Lkd/o1;` on 1.54.0, `Ltd/a2;` on 1.72.0).
- **Effect:** Defense-in-depth: if the update composable layout ("New Fizz Update Available" and "Open Play Store" button) is ever invoked directly, it immediately returns without rendering anything.

#### Layer 6: OkHttp Header Interceptor Dynamic Version Spoofing

- **Target:** `Lic/g;` on 1.54.0, `Lnc/i;` on 1.72.0
- **Method:** `a(Lokhttp3/internal/http/RealInterceptorChain;)Lokhttp3/Response;`
- **Mechanism:** Locates the single `CONST_STRING` holding the build's wire client version (`"1.54.0"` / `"1.72.0"`) and build number (`"400032"` / `"465123"`), replacing each with a static invocation to `VersionBridge.getClientVersion()` / `VersionBridge.getBuildNumber()`. Literal lookup replaces the earlier header-proximity search because 1.72.0 emits the header name before its value.
- **Effect:** Ensures every outbound HTTP/HTTPS request sent by the app transmits the latest spoofed client version and build number in request headers.

#### Layer 7: Session State Request Body DTO Spoofing

- **Target:** `Lub/dc;` (`SessionStateRequestData`) on 1.54.0, `Lub/id;` on 1.72.0
- **Method:** `<init>(Ljava/lang/String;Llb/j0;Ljava/lang/String;Ljava/lang/String;)V` on 1.54.0;
  `<init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Llb/j0;Ljava/lang/String;Ljava/lang/String;)V` on 1.72.0
- **Mechanism:** Selects the constructor that holds the wire version literal (`"1.54.0"` / `"1.72.0"`) exactly once and replaces that literal with `VersionBridge.getClientVersion()`.
- **Effect:** Guarantees that the JSON request body sent to `/api/v1/app/session-state` carries the spoofed client version, preventing server-side transition to `SessionUnavailable` ("Error connecting to Fizz").

#### Layer 8: Lifecycle Bridge Initialization (`MainActivity.onCreate`)

- **Target:** `Lcom/fizzsocial/fizz/MainActivity;`
- **Method:** `onCreate(Landroid/os/Bundle;)V`
- **Mechanism:** Injects `VersionBridge.init(this)` immediately following `super.onCreate`.
- **Effect:** Initializes cached version parameters from `SharedPreferences` and launches an asynchronous daemon thread to synchronize the latest Google Play version from the Cloudflare Worker `/api/version/com.ashtoncofer.Buzz` once every 24 hours.

---

#### Version-specific targets (1.54.0 → 1.72.0)

| Role                         | 1.54.0                                 | 1.72.0                                             |
| ---------------------------- | -------------------------------------- | -------------------------------------------------- |
| Session state outdated check | `Lnc/j0;->d()Z`                        | `Ltc/s0;->m()Z`                                    |
| Semantic version comparator  | `Lnc/c;->b`                            | `Ltc/c;->d(Ljava/lang/String;Ljava/lang/String;)Z` |
| Onboarding UI state flag     | `Lge/u1;->l0:Z`                        | `Lse/h2;->K0:Z`                                    |
| Onboarding screen flag read  | single `IGET_BOOLEAN` in `Lge/r1;`     | single `IGET_BOOLEAN` in `Lse/d2;`                 |
| Update prompt composable     | `Lkd/o1;->a`                           | `Ltd/a2;->a`                                       |
| OkHttp header interceptor    | `Lic/g;->a` (wire `1.54.0` / `400032`) | `Lnc/i;->a` (wire `1.72.0` / `465123`)             |
| Session state request DTO    | `Lub/dc;-><init>` (4 args)             | `Lub/id;-><init>` (7 args)                         |

The version and build literals are located inside the interceptor rather than by header proximity,
because 1.72.0 emits the header name before its value, and both literals must occur exactly once.

### 3. Preconditions & Verification

1. **Target Specification**: Compatible with Fizz `1.54.0` and `1.72.0` (`com.ashtoncofer.Buzz`).
2. **Build Verification**:

   ```bash
   ./gradlew :patches:buildAndroid clean --no-daemon
   ```

3. **Metadata Generation**:

   ```bash
   ./gradlew generatePatchesList
   ```

4. **Runtime Smoke Test**:
   - Verify on `emulator-5554` that the app starts up without displaying the "New Fizz Update Available" modal or blocking prompt.
