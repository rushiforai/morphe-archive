# SidelineSwap Patch Specifications

## Overview

This document details the binary bytecode and resource patches available for **SidelineSwap** (`com.sidelineswap.android`).

| Patch Name                                                    | Type                    | Default | Description                                                                                                                                                            |
| ------------------------------------------------------------- | ----------------------- | ------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [AMOLED Theme](#amoled-theme)                                 | `compositeFeaturePatch` | `false` | Forces SidelineSwap into a pure-black AMOLED theme with dark system bars, black app surfaces, readable light text and icons, and force dark mode on embedded WebViews. |
| [Block Tracking and Telemetry](#block-tracking-and-telemetry) | `compositeFeaturePatch` | `true`  | Neutralizes first-party analytics, third-party behavioral trackers, diagnostic logging, payment telemetry, install referrer, and AAID.                                 |
| [Change Brand Color](#change-brand-color)                     | `resourcePatch`         | `false` | Customizes primary brand accent colors across buttons, navigation highlights, badges, and status bars.                                                                 |
| [Remove Invite Friends](#remove-invite-friends)               | `compositeFeaturePatch` | `true`  | Removes the Invite Friends option from the Account screen and eliminates the phantom orange dot badge on the Account navbar icon.                                      |

---

## Block Tracking and Telemetry

### Motivation

SidelineSwap tracks comprehensive user behavior—from items viewed, search terms entered, and checkout steps initiated to device identifiers, crash logs, install referrers, and payment telemetry. This patch neutralizes all 9 layers of analytics, telemetry, and background collectors across Dalvik bytecode and AndroidManifest components while preserving all core marketplace features (searching, buying, selling, messaging, and payments). All layers are enabled by default and individually configurable.

### Options

| Option Key                  | Title                                    | Type      | Default | Description                                                                                                                                                  |
| --------------------------- | ---------------------------------------- | --------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `disableFirstParty`         | Disable First-Party Analytics            | `Boolean` | `true`  | Neutralizes SidelineSwap's central event dispatcher (`AnalyticsLogger`), first-party client, and `LogRepo` HTTP event uploads.                               |
| `disableAmplitude`          | Disable Amplitude Analytics              | `Boolean` | `true`  | Neutralizes the Amplitude client wrapper and core Amplitude SDK event tracking, identification, and initialization across all repositories.                  |
| `disableFirebase`           | Disable Firebase & GMS Analytics         | `Boolean` | `true`  | Neutralizes `FirebaseClient`, Google Play Services Measurement event queue, and removes background `AppMeasurement` services and sessions from the manifest. |
| `disableCrashlytics`        | Disable Crashlytics & Diagnostic Logging | `Boolean` | `true`  | Neutralizes the Timber `CrashlyticsTree` logging tree and Firebase Crashlytics exception, log, and custom key reporting.                                     |
| `disableFacebook`           | Disable Facebook SDK & App Events        | `Boolean` | `true`  | Neutralizes Facebook SDK initialization, auto-event collection, activity lifecycle tracking, and removes `FacebookInitProvider` from the manifest.           |
| `disableIterable`           | Disable Iterable Telemetry               | `Boolean` | `true`  | Neutralizes Iterable client calls, In-App message tracking, session event uploads, and lifecycle callback registration.                                      |
| `disableBraintreeTelemetry` | Disable Braintree Gateway Telemetry      | `Boolean` | `true`  | Stubs Braintree FPTI background upload and database workers with immediate success, and neutralizes `BraintreeClient` analytics dispatchers.                 |
| `zeroAdvertisingId`         | Zero Google Play Advertising ID          | `Boolean` | `true`  | Spoofs minified and standard Google Play `AdvertisingIdClient` calls to return an all-zero UUID and forces limit-ad-tracking to `true`.                      |
| `disableInstallReferrer`    | Disable Install Referrer Tracking        | `Boolean` | `true`  | Neutralizes Google Play Install Referrer querying and client connections across attribution listeners.                                                       |

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
- In Amplitude core SDK `Lj1/d;`: injects `return-void` into event dispatchers and initializers (`d`, `e`, `f`, `j`, `k`, `l`, `n`, `o`, `p`, `t`, `u`, `v`, `w`), neutralizing direct repository invocations (`AccountRepo`, `AuthRepo`).

#### 4. Firebase Analytics & Measurement

- In `com.sidelineswap.android.analytics.FirebaseClient`: injects `return-void` across `logEvent`, `access$logEvent`, `completedCheckout`, `initiatedCheckout`, `joined`, `newMadeOffer`, `newMadePurchase`, `visitedItem`, and `visitedResults`.
- In GMS internal measurement client `Lcom/google/android/gms/internal/measurement/r0;`: injects `return-void` into `b`, halting all queued background measurement tasks at the executor entry point.
- In `AndroidManifest.xml`: removes `AppMeasurementReceiver`, `AppMeasurementService`, `AppMeasurementJobService`, `SessionLifecycleService`, and `android.adservices.AD_SERVICES_CONFIG`.

#### 5. Firebase Crashlytics & Timber Logging Tree

- In `com.sidelineswap.android.log.CrashlyticsTree`: injects `return-void` into `log`, preventing Timber from forwarding exceptions to Crashlytics.
- In `com.google.firebase.crashlytics.FirebaseCrashlytics`: injects `return-void` into `log`, `recordException`, `setCrashlyticsCollectionEnabled`, `setCustomKey`, and `setCustomKeys`.

#### 6. Facebook Core SDK & App Events

- In `Lg2/n;`: injects `return-void` into `i` (`FacebookSdk.sdkInitialize`), halting Facebook SDK startup.
- In `Lv2/y;`: injects `return-void` into validation helper methods `a`, `b`, `c`, `d`, and `e`.
- In `com.sidelineswap.android.analytics.FacebookClient`: injects `return-void` into all seven checkout and interaction methods.
- In `Lh2/h;`: injects `return-void` into `a` (`AppEventsLogger.logEvent`).
- In `Lh2/i;`: injects `return-void` into `d`, `e`, `f`, `g`, and `h` (`AppEventsLoggerImpl` event dispatchers).
- In `Lp2/a;`: injects `return-void` into `c` (`ActivityLifecycleTracker.startTracking`).
- In `AndroidManifest.xml`: removes `FacebookInitProvider`, token broadcast receivers, and SDK app ID/token metadata.

#### 7. Iterable In-App Telemetry & Lifecycle

- In `com.sidelineswap.android.analytics.IterableClient`: injects `return-void` into `visitedLocker`.
- In `Lt5/h;` (`IterableApi`): injects `return-void` into `d`, `g`, `h`, `j`, `k`, `l`, and `m`.
- In `Lt5/i;` (`IterableApiClient`): injects `return-void` into network dispatcher `d`.
- In `Lt5/e;` (`IterableActivityLifecycleCallbacks`): injects `return-void` into `a`.
- In `AndroidManifest.xml`: removes `IterableFirebaseMessagingService` and `IterablePushActionReceiver`.

#### 8. Braintree / PayPal FPTI Telemetry

- In `AnalyticsUploadWorker` and `AnalyticsWriteToDbWorker`: injects an early return of `new-instance v0, Landroidx/work/ListenableWorker$a$c; \n invoke-direct {v0}, Landroidx/work/ListenableWorker$a$c;-><init>()V \n return-object v0` into every implemented method named `g`. This constructs WorkManager `Result.success()` directly to halt background network transmissions to `b.stats.paypal.com` without causing retry loops.
- In `BraintreeClient` (`com.braintreepayments.api.L`): injects `return-void` into analytics dispatch methods `b` and `c`.

#### 9. Google Play Advertising ID (AAID) Zeroing & Opt-Out

- In minified `AdvertisingIdClient` (`LY2/a;`): patches method `a` to instantiate and return a dummy `LY2/a$a` with GUID `"00000000-0000-0000-0000-000000000000"` and limit ad tracking set to `true`.
- In `com.google.android.gms.ads.identifier.AdvertisingIdClient$Info`: injects `const-string v0, "00000000-0000-0000-0000-000000000000" \n return-object v0` into `getId()`, and injects `const/4 v0, 0x1 \n return v0` into `isLimitAdTrackingEnabled()`.

#### 10. Google Play Install Referrer

- In `com.android.installreferrer.api.InstallReferrerClientImpl` (`Ll1/a;`): injects `return-void` into `b` (`startConnection`), preventing client connection to Play Store referral services.
- In Facebook SDK `Lv2/b$a;`: injects `return-void` into `a`, neutralizing referral connection initiation.

---

## Change Brand Color

### Motivation

Allows users to personalize the SidelineSwap interface by replacing the default sports-turf green (`#02c874`) with custom color schemes (e.g. Material Blue, Purple, Orange, or Dark/Monochrome).

### Options

| Option Key         | Title               | Type     | Default   | Description                                           |
| ------------------ | ------------------- | -------- | --------- | ----------------------------------------------------- |
| `primaryColor`     | Primary Brand Color | `String` | `#1E88E5` | Hex color code for main accents, buttons, and badges. |
| `primaryDarkColor` | Primary Dark Color  | `String` | `#1565C0` | Hex color code for status bars and dark headers.      |

### Technical Strategy

- Utilizes Morphe `resourcePatch` to parse and rewrite `res/values/colors.xml` and, when present, `res/values-night/colors.xml` (missing night palettes are skipped).
- Modifies the following resource entries:
  - `colorPrimary`: Updated to `primaryColor`
  - `colorPrimaryDark`: Updated to `primaryDarkColor`
  - `badge_color`: Updated to `primaryColor`
  - `green_badge`: Updated to `primaryColor`
  - `ic_launcher_background`: Updated to `primaryColor`
- Because SidelineSwap uses Android Material Components and Jetpack ViewBinding with standard theme attributes (`@color/colorPrimary`), altering `colors.xml` automatically transforms the entire UI without needing Dalvik bytecode modifications.

---

## AMOLED Theme

### Motivation

SidelineSwap defaults to an entirely light application theme (`Theme.MaterialComponents.Light.NoActionBar`) with bright white backgrounds (`#ffffff`, `#f8f8f8`), dark system-bar icons, light app-bar overlays, and hardcoded dark text/icons across layouts and vector drawables. The application has no night mode or dark theme option.

The **AMOLED Theme** patch converts all app-owned surfaces to pure black (`#000000`), sets system navigation and status bars to black with light foreground icons, adjusts app-bar/popup overlays to dark Material components, and updates text, icons, dividers, message bubbles, and cards to high-contrast readable light palettes—delivering maximum battery savings on OLED displays and comfortable low-light viewing while preserving brand accents and vendor payment flows.

### Technical Strategy

The patch combines Android XML resource mutations with Dalvik bytecode hooks and the injected `DarkWebViewBridge` runtime extension via Morphe `compositeFeaturePatch`. Because SidelineSwap combines theme-level inheritance, centralized color tokens, hardcoded layout literals, custom vector drawables, and embedded WebViews, the transformation is executed across coordinated resource and bytecode layers with strict fail-fast validation.

#### 1. Theme and Style Re-parenting (`res/values/styles.xml`)

- Re-parents `AppTheme` from `@style/Theme.MaterialComponents.Light.NoActionBar` to `@style/Theme.MaterialComponents.NoActionBar`.
- Overrides system-bar items within `AppTheme`:
  - `android:statusBarColor`: `@android:color/transparent` $\rightarrow$ `@android:color/black`
  - `android:navigationBarColor`: `@android:color/transparent` $\rightarrow$ `@android:color/black`
  - `android:windowLightStatusBar`: `true` $\rightarrow$ `false` (light icons on dark status bar)
  - `android:windowLightNavigationBar`: `true` $\rightarrow$ `false` (light icons on dark navigation bar)
- Re-parents `AppTheme.AppBarOverlay` from `@style/ThemeOverlay.MaterialComponents.ActionBar` to `@style/ThemeOverlay.MaterialComponents.Dark.ActionBar`.
- Re-parents `AppTheme.PopupOverlay` from `@style/ThemeOverlay.MaterialComponents.Light` to `@style/ThemeOverlay.MaterialComponents.Dark`.
- Replaces hardcoded dark text colors in text appearances:
  - `TextAppearance.Search`: `android:textColor` `#4a4a4a` $\rightarrow$ `#FFFFFFFF` (ensures suggested search terms achieve 21:1 contrast on pure black).
  - `TextAppearance.Facet.Subtitle`: `android:textColor` `#de000000` $\rightarrow$ `#FFFFFFFF`.
  - `TextAppearance.Messaging`: `android:textColor` `#de000000` $\rightarrow$ `#FFFFFFFF`.
- Leaves `AppTheme.AppBarOverlay.Dark` and `BlackActionButton` untouched.
- Overrides `CardView` style `cardBackgroundColor`: `?android:attr/colorBackgroundFloating` $\rightarrow$ `#000000` (ensures legacy `androidx.cardview.widget.CardView` containers such as cart seller groups render pure black).
- Re-parents Braintree Drop-in themes (`bt_drop_in_activity_theme`, `bt_add_card_activity_theme`) to `@style/Theme.AppCompat.NoActionBar` and `bt_edit_button` to `@style/Theme.AppCompat`.

#### 2. Centralized Color Palette Tokens (`res/values/colors.xml`)

Updates key surface, background, and divider color tokens:

- `appBarColor`: `#ffffff` $\rightarrow$ `#000000` (pure black top app bar)
- `itemBackground`: `#f8f8f8` $\rightarrow$ `#000000` (pure black list and card backgrounds)
- `dividerColor`: `#b7b7b7` $\rightarrow$ `#33FFFFFF` (subtle semi-transparent light divider)
- `background_floating_material_dark`: `@color/material_grey_800` $\rightarrow$ `#000000` (pure black floating dialogs/menus)
- `background_material_dark`: `@color/material_grey_850` $\rightarrow$ `#000000` (pure black base window)
- `cardview_dark_background`: `#ff424242` $\rightarrow$ `#000000` (pure black Material cards)
- `cardview_light_background`: `#ffffffff` $\rightarrow$ `#000000` (pure black default CardView backgrounds across cart seller and itemization cards)
- `design_dark_default_color_background`: `#121212` $\rightarrow$ `#000000` (pure black Design library background)
- `design_dark_default_color_surface`: `#121212` $\rightarrow$ `#000000` (pure black Design library surfaces)
- `colorBlack`: `#4a4a4a` $\rightarrow$ `#FFFFFFFF` (light foreground token for legacy color definitions)
- `follow`: `#4a4a4a` $\rightarrow$ `#FFFFFFFF` (high-contrast text token for locker follow states)
- `bt_base_background`: `#fafafa` $\rightarrow$ `#000000` (pure black Braintree bottom sheet and card screens)
- `bt_black`: `#001129` $\rightarrow$ `#FFFFFFFF` (light text for Braintree payment method types)
- `bt_black_12`: `#1e000000` $\rightarrow$ `#33FFFFFF` (subtle divider lines in Braintree lists)
- `bt_black_54`: `#8a000000` $\rightarrow$ `#B3FFFFFF` (muted text for Braintree headers and card descriptions)
- `bt_black_87`: `#de000000` $\rightarrow$ `#FFFFFFFF` (light text for vaulted card titles)
- `bt_black_contrast`: `#000000` $\rightarrow$ `#02c874` (brand green accent and animated action button background)
- `bt_color_primary` / `bt_color_primary_dark`: `#3e3c42` / `#363439` $\rightarrow$ `#000000` (pure black Card Details toolbar)

#### 3. Dynamic HTML Strings (`res/values/strings.xml`)

Updates seller feedback string resources with explicit light HTML font color tags to override hardcoded Dalvik text colors:

- `feedback_zero`: wraps "No Feedback" in `<font color=#ffffff>` and count in `<font color=#b3ffffff>`.
- `feedback`: wraps positive feedback headline in `<font color=#ffffff>` and count in `<font color=#b3ffffff>`.

#### 4. Audited Layout Literal Rewriting (`res/layout/`)

An audited allowlist of 80 layout files is processed with attribute-aware rules:

- **Surfaces (`android:background`)**: `#ffffff`, `#f8f8f8`, `#fafafa`, `@android:color/white` $\rightarrow$ `#000000` (exactly 33 replacements).
- **Dividers (`android:background`)**: `#1f000000`, `#de000000`, `#efeff4`, `#dfd3d3d3`, `#b7b7b7`, `#f4f4f5` $\rightarrow$ `#33FFFFFF` (exactly 34 replacements).
- **Primary Foreground (`android:textColor`, `android:tint`, `app:titleTextColor`)**: `#4a4a4a`, `#de000000`, `#000000`, `#253c32`, `#454545`, `#595959`, `@android:color/black`, `@color/colorBlack` $\rightarrow$ `#FFFFFFFF`, plus explicit white text color for `@id/interactWithCart` (exactly 178 replacements).
- **Muted Foreground (`android:textColor`, `android:tint`, `app:titleTextColor`)**: `#9b9b9b`, `#b7b7b7`, `#61716a`, `#828282`, `#cacaca`, `#d8d8d8`, `#cccccc`, `#99000000`, `#b3000000` $\rightarrow$ `#B3FFFFFF` (exactly 58 replacements).
- Enforces that every single file in the 80-file allowlist has at least one replacement and aggregate counts match exactly.

#### 5. Custom Drawables and Vector Icons (`res/drawable/` and `res/color/`)

- **Chat Bubbles & Feedback Surfaces**:
  - `messaging_local_background.xml`: solid `#efeff4` $\rightarrow$ `#121212` (dark gray bubble so local and remote messages remain visually distinct)
  - `messaging_remote_background.xml`: solid `#ffffff` $\rightarrow$ `#000000` (pure black bubble)
  - `message_background.xml`: solid `#f7fafb` $\rightarrow$ `#000000` (preserves blue accent stroke `#00bbee`)
  - `rating_background_checked.xml`: solid `#f8f8f8` $\rightarrow$ `#000000`, stroke `#d8d8d8` $\rightarrow$ `#33FFFFFF`
  - `toggle_background_unchecked.xml`: stroke `#4a4a4a` $\rightarrow$ `#33FFFFFF`
  - `toggle_text_color.xml`: unchecked color `#4a4a4a` $\rightarrow$ `#B3FFFFFF`
- **Vector Icons (29 audited allowlist files)**:
  - `android:tint` / `android:fillColor` primary dark values (`#ff000000`, `#000000`, `#4a4a4a`, `#000`) $\rightarrow$ `#FFFFFFFF` (exactly 28 replacements, covering navigation, toolbar, payment selection radio buttons `ic_radio_button_on`/`ic_radio_button_off`, and `ic_zip_logo`).
  - `android:tint` / `android:fillColor` muted values (`#757575`, `#b3000000`, `#b7b7b7`) $\rightarrow$ `#B3FFFFFF` (exactly 10 replacements).
  - Enforces that each icon file in the allowlist is modified at least once.

- **Payment Cards & Address Containers**:
  - `bt_vaulted_payment_method_card.xml`: `card_view:cardBackgroundColor` `@android:color/white` $\rightarrow$ `#121212` (dark elevated cards for vaulted payment methods).
  - `fragment_address_list.xml`: fixes uninitialized `guidelineStart` by injecting `app:layout_constraintGuide_begin="16.0dp"`, eliminating the layout solver offset that placed address rows at -1078px off-screen.

#### 6. Dalvik Bytecode Hooking

- **Cart Item Surface Neutralization**: Rewrites hardcoded light background color hex codes (`#ffffff`, `#f8f8f8` $\rightarrow$ `#000000`) within `CartItemAdapter$ViewHolder.bind` and `CartCheckoutItemAdapter$ViewHolder.bind` so item rows render on AMOLED black surfaces with readable light text.
- **Free Shipping Badge**: Neutralizes hardcoded dark green string literal `#253C32` in `ItemKt.getEmblemLabel` to vibrant brand green `#02c874`.
- **Dark WebViews**: Injects `DarkWebViewBridge.applyDarkMode` on embedded WebViews (`WebViewFragment`, `WebSignInFragment`).

### Coexistence and SDK Boundaries

- **Change Brand Color Coexistence**: `AMOLED Theme` does not modify `colorPrimary`, `colorPrimaryDark`, `colorAccent`, `badge_color`, `green_badge`, or `ic_launcher_background`. Users can enable both patches simultaneously without conflicts or execution-order dependencies.
- **Vendor Verification SDK Boundaries**: CardinalCommerce 3DS verification web resources are deliberately preserved with their original styles and palettes to prevent broken card verification layouts.

---

## Remove Invite Friends

### Motivation

SidelineSwap promotes its referral program with an "Invite Friends" entry positioned between "My Locker" and "Seller Dashboard" in the Account screen. In addition, the application's startup sequence invokes `MainActivity.setupAccountBadge()`, which inflates a red badge layout (`R.layout.badge_red`) onto the Account bottom navigation tab with `attachToRoot = true` and then attempts to cast the inflated `ImageView` to `TextView`. This throws a silent `ClassCastException` inside an error-swallowing try/catch block, leaving the orange dot permanently attached to the Account navbar icon even though no notification or account activity exists.

The **Remove Invite Friends** patch removes the Invite Friends option and its layout divider while completely eliminating the phantom orange dot.

### Technical Strategy

The feature is coordinated across internal companion resource and bytecode layers within a unified `compositeFeaturePatch`:

1. **Internal Resource Stage**:
   - In `res/layout/fragment_account_details.xml`: sets `android:visibility="gone"` on `@id/inviteFriends` (`FrameLayout`) and the immediately following divider `<View>`, preserving clean single-line divider spacing between "My Locker" and "Seller Dashboard".
   - In `res/layout/badge_red.xml`: sets `android:visibility="gone"` on `@id/badge` (`ImageView`) as a safeguard.
   - In `AndroidManifest.xml`: removes `requiredSplitTypes="base__density"` and Google Play split meta-data to normalize standalone APK installation.

2. **Bytecode Stage**:
   - In `Lcom/sidelineswap/android/MainActivity;->setupAccountBadge()V`: prepends `return-void` at index 0. This halts inflation of `badge_red` into the Account tab, prevents the startup `ClassCastException`, and eliminates the non-functional orange dot badge entirely.
   - In `Lcom/sidelineswap/android/MainActivity$processDeepLink$target$7;->invoke()V`: prepends `return-void` at index 0, neutralizing deep links targeting the Invite Friends screen.
   - In `Lcom/sidelineswap/android/account/AccountDetailsFragment;`: scans and injects `return-void` into any method invoking `inviteFriends`, neutralizing the referral click handler.
