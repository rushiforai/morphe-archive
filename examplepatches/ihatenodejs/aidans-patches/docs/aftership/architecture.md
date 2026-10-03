# AfterShip Android Application Architecture

## 1. Overview

- **Application Name:** AfterShip: Package Tracker
- **Package Name:** `com.aftership.AfterShip`
- **Target Version:** `5.25.8` (Morphe Compatibility: `5.25.8`, `minSdk` 23)
- **Analyzed Version Code:** `52580` (Derived from APK analysis; Constants specifies version string)
- **Target SDK:** 35 (Android 15)
- **Minimum SDK:** 23 (Android 6.0)
- **Distribution Format:** Standalone APK (`ApkFileType.APK`) / Split APK
- **Supported Native ABIs:** `arm64-v8a`, `armeabi-v7a`
- **Technology Stack:** Native Android (Kotlin & Java), Material Components / Material 3, ViewBinding, Architecture Components (LiveData, ViewModel, Lifecycle), RxJava, Kotlin Coroutines, Retrofit 2, OkHttp 3, OpenID AppAuth, C++ native libraries (`libandroidsig-lib.so`, `liblogan.so`, `libsqlcipher.so`), and Morphe Java extensions (`CopyTrackingBridge`, `OsmMapBridge`, `OsmMapView`).

AfterShip is built primarily as a native Android application compiled to Dalvik Executable (DEX) bytecode across multiple DEX files (`classes.dex` through `classes4.dex`) with auxiliary native C++ runtime libraries. Patched builds integrate lightweight Morphe Java extensions to provide custom UI and an embedded OpenStreetMap WebView layer.
---

## 2. Technology Stack & Key Libraries

### UI & Architecture
- **Framework:** Android Jetpack (AndroidX) with ViewBinding and custom UI widgets (`com.aftership.ui.widget.*`).
- **UI Architecture:** Model-View-Presenter (MVP) layered on top of Android Architecture Components (`AbsMvpActivity`, `MvpBasePresenter`, `ViewModel`, `LiveData`).
- **Asynchronous View Inflation:** `AsyncLayoutInflater` (`p.a`) used in `LoginRegisterStateActivity` to render complex onboarding carousels off the main UI thread.
- **Event Bus:** GreenRobot `EventBus` for cross-component signaling (`onFishEvent`, `onUserLoginEvent`, `onBundleEvent`).

### Networking & Authentication
- **HTTP Engine:** OkHttp 3 with custom interceptors (`ASSignatureInterceptor`, `TokenInterceptor`, `HeaderInterceptor`).
- **REST Client:** Retrofit 2 with custom converters and RxJava call adapters (`d4.c`, `L3.b`).
- **OAuth & SSO:** OpenID Connect AppAuth (`net.openid.appauth`) with Keycloak-backed backend services (`HostConfig.getSSOHost() + "/auth/realms/consumer/protocol/openid-connect/*"`).
- **Supported Identity Providers:** Google SSO, Microsoft Outlook OAuth, Native Email/Password, and Anonymous Guest tokens.

### Native Runtime & Security (`lib/arm64-v8a`, `lib/armeabi-v7a`)
- **`libandroidsig-lib.so`:** Proprietary security library (`com.automizely.sig.*`).
  - Performs HMAC-SHA256 request signature generation (`SigEntity.nativeGenerateSignature`) and payload digest creation (`nativeGenerateBodyDigest`).
  - Enforces APK signature integrity: calls `_Z11checkApkShaP7_JNIEnvP8_jobjectS2_h` to verify that the app's signing certificate matches AfterShip's official production keystore (`SHA-256: 425c56b57ac5ff3e1e7f7b49e246dfa350db1a8d7403e2638e9d4f85c134449f`).
  - Derives internal encryption keys for Logan logging (`KeyProvider.getLoganKey`, `KeyProvider.getLoganIVKey`), AuthState storage (`KeyProvider.getTokenKey`, `KeyProvider.getTokenIVKey`), and rule decryption (`KeyProvider.getRuleKey`).
- **`liblogan.so`:** Tencent Logan mobile logging engine for encrypted local and remote diagnostic recording.
- **`libsqlcipher.so`:** SQLCipher native engine for encrypted database storage.

### Analytics, Advertising & Telemetry Systems
- **Disco Network SDK:** Ad network providing inline sponsored products and cashback deals (`com.disconetwork.discosdk.Disco`, `DiscoInlinePlacement`, `DiscoAdAdapter`).
- **Google Play Advertising ID (AAID):** Tracks device advertising identifier via `com.google.android.gms.ads.identifier.AdvertisingIdClient`.
- **First-Party Analytics & Event Dispatchers:**
  - `FirebaseStatisticsManage` (`Lx3/d;`): Centralized Firebase statistics forwarder.
  - `StatisticsCenter` (`Lx3/i;`): Internal business event telemetry, tracking parcel states, clicks, and navigation flows.
  - `UploadStatisticsHelper` (`Lx3/k;`) & `AbsUploadStrategy` (`Lo4/a;`, `Lo4/b;`, `Lo4/d;`): Background and immediate HTTP upload mechanisms.
  - `AbsListImpEventHelper`: RecyclerView item exposure and impression analytics.
- **Diagnostics & Crash Reporting:**
  - **Tencent Logan:** `liblogan.so` and `com.dianping.logan.a` encrypted mobile logging.
  - **Firebase Crashlytics & Analytics:** Diagnostic crash reporting and screen-view telemetry (`FirebaseCrashlytics`, `FirebaseAnalytics.setCurrentScreen`).
- **In-App Review Rating Prompts:** Multiple strategies (`HomePresenter`, `TrackingListTabPresenter`, `HomeActivity`) driving automated 5-star Google Play Store review dialogs.

### Injected Morphe Extension Architecture
- **`CopyTrackingBridge` (`app.aidan.extension.aftership.CopyTrackingBridge`):** Java reflection bridge injected into `HomeActivity.S2`. Dynamically inflates a "Copy" button into the multi-selection bottom action bar, extracts tracking numbers from selected `ShipmentItemEntity` instances, copies deduplicated newline-separated numbers to `ClipboardManager`, and displays confirmation toasts.
- **`OsmMapBridge` & `OsmMapView` (`app.aidan.extension.aftership`):** FrameLayout container wrapping a hardware-accelerated `WebView`. Loads Leaflet 1.9.4 and OpenStreetMap raster tiles, automatically styled with day/night CSS filters to match AfterShip's theme. Reflectively reads parcel coordinates from ViewModel (`G6.i` via `a3()`), computes geodesic polyline curves, and renders pulsing origin/destination markers without requiring Google Play Services or API keys.
---

## 3. Application Lifecycle & Navigation Architecture

                  [ SplashActivity ]
                          |
       +------------------+------------------+
       |                  |                 |
       v                  v                 v
 [ h.Y() == true ]  [ h.Y() == false,   [ h.Y() == false,
                     deactivate_account   deactivate_account
                     _locked == false ]   _locked == true ]
       |                  |                 |
       v                  v                 v
 [ LoginRegister   [ HomeActivity ]   [ LoginRegister
   StateActivity ] - Tracking List Tab   StateActivity ]
 - Carousels       - Account / Settings  - Locked-account
 - Google Login      Tab                  login/register flow
 - Outlook Login
 - Email Login
 - "Continue as guest"
   (login_register_skip)

### 1. Launch Entry Point (`SplashActivity`)
- Declared in `AndroidManifest.xml` with intent filter `android.intent.action.MAIN` and `android.intent.category.LAUNCHER`.
- In `SplashActivity.onCreate`:
  - Validates initial setup conditions via `p286t4.a.a()`.
  - Evaluates authentication state via `B4.h.Y()` and the `deactivate_account_locked` preference:
    ```java
    boolean zY = h.Y();
    boolean zF = l.f("AFTERSHIP_INFO", "deactivate_account_locked", false);
    if (zY || zF) {
        LoginRegisterStateActivity.T2(this, null);
    } else {
        HomeActivity.V2(this, null, false);
    }
    ```
  - If `h.Y()` is `true` (user has neither an account token nor a guest token), `LoginRegisterStateActivity` is launched.
  - If `h.Y()` is `false` and `deactivate_account_locked` is `true`, `LoginRegisterStateActivity` is launched for the locked-account flow.
  - If `h.Y()` is `false` and `deactivate_account_locked` is `false`, `HomeActivity` is launched immediately.

### 2. Login & Registration Gate (`LoginRegisterStateActivity`)
- Displays onboarding carousels and authentication entry points:
  - `login_register_google_login`: `com.aftership.ui.widget.GoogleLoginButton`
  - `login_register_outlook_iv`: Outlook OAuth trigger
  - `login_register_email_iv`: Native email/password entry activity (`NativeEnterEmailActivity`)
  - `login_register_skip_tv`: "Continue as guest" button (`login_register_skip`)
- When "Continue as guest" is tapped (`A6.M` case 7):
  - Sets account state to `d8.b.a.ANONYMOUS`.
  - Checks `B4.h.W()` (has anonymous token).
  - If not yet generated, invokes `LoginRegisterPresenter.generateAnonymousToken()`.
  - On token retrieval success, dispatches `r2()` (`RouterActivity.V2(this, getIntent(), false)`), launching `HomeActivity` and finishing `LoginRegisterStateActivity`.

### 3. Main Interface (`HomeActivity`)
- Hosts the primary bottom navigation bar (`layout_home_navigation_view`):
  - **Shipments Tab (`tracking_rl`):** Displays tracked packages, courier status checkpoints, delivery updates, and manual tracking addition (`TrackingAddActivity`).
  - **Account Tab (`account_rl`):** Loads `AccountFragment` (`N5.k`).

---

## 4. Authentication & Guest Session Model

The application uses a unified account manager `AutomizelyAccount` (`p054d8.b` / `p054d8.i` / `p054d8.j`).

### Account Types (`p054d8.b$a`)
- `GOOGLE`: Google Identity SSO
- `OUTLOOK`: Microsoft Outlook OAuth
- `LOGIN`: Existing AfterShip account login
- `REGISTER`: New AfterShip account registration
- `ANONYMOUS`: Guest session without user credentials
- `NATIVE`: Direct native authentication

### Token Storage & State Predicates
- **Account Access Token:** Managed via `AccountsStateManager.getInstance().getCurrentAuthState().getAccessToken()`. Accessed via `p054d8.i.d()`.
- **Anonymous Guest Token:** Generated by the backend endpoint `@o("guest/generate-token")` via `AnonymousTokenLoader` (`Q4.b`). Stored in `SharedPreferences` under table `"account_config"` with key `"anonymous_account_token"`. Accessed via `Pa.b.d()`.
- **`B4.h.W()` (Has Guest Token):**
  ```java
  public final boolean k() {
      return TextUtils.isEmpty(d()) && !TextUtils.isEmpty(Pa.b.d());
  }
  ```
  Returns `true` if user has an anonymous token but no full account token.
- **`B4.h.Y()` (Unauthenticated State):**
  ```java
  public final synchronized boolean m() {
      return TextUtils.isEmpty(d()) && TextUtils.isEmpty(Pa.b.d());
  }
  ```
  Returns `true` when the app is freshly installed and has neither an account token nor a guest token.

---

## 5. Security & Tamper Detection Mechanisms

### 1. APK Certificate Verification (`_Z11checkApkSha`)
Inside `libandroidsig-lib.so`, the native C++ function `checkApkSha(_JNIEnv*, _jobject*, _jobject*, unsigned char)` queries the Android `PackageManager` for package signatures:
```c++
context.getPackageManager().getPackageInfo(context.getPackageName(), GET_SIGNATURES)
```
It computes the SHA-256 digest of the certificate and compares it against the hardcoded AfterShip production key:
- Certificate SHA-256: `42:5C:56:B5:7A:C5:FF:3E:1E:7F:7B:49:E2:46:DF:A3:50:DB:1A:8D:74:03:E2:63:8E:9D:4F:85:C1:34:44:9F`
- If verification fails, it emits: `E AutomizelySig: the apk hash is invalid, Do you use the aftership keystore to sign the apk?` and aborts request signature generation.
- Because AfterShip's backend rejects unsigned requests, any custom-signed APK fails network requests (including `/guest/generate-token`) unless `checkApkSha` is neutralized.

### 2. Google Play Split Architecture (Packaging Note)
- Google Play App Bundles emit `com.android.vending.splits.required=true` and `android:requiredSplitTypes="base__abi,base__density"`.
- When installing multi-split APKs on Android 12+, `PackageManager` requires installation via split-install sessions (`adb install-multiple`) or repackaging into a unified standalone APK. No patch modifications are made directly to split manifest attributes.
