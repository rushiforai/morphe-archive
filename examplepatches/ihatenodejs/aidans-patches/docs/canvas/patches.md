# Canvas Student Patch Specifications

## Overview

This document specifies patches for **Canvas Student** (`com.instructure.candroid`).

## Patch: Remove Tracking and Analytics

- **Name:** Remove Tracking and Analytics
- **Target Package:** `com.instructure.candroid`
- **Supported Versions:** `8.12.0`
- **Default State:** `true` (Enabled by default)
- **Type:** Composite Feature Patch (`compositeFeaturePatch`)
- **Dependencies:** Internal companion resource layer (`Remove Tracking and Analytics (Internal Resource)`)
- **Options:** `removeCrashlyticsCollection` (default `true`)

### 1. Motivation & Purpose

Canvas Student records detailed learning activity beyond functional Canvas API requests. The application initializes Pendo with a hash of the student's UUID and account UUID, tracks app events and screen activity, logs Canvas URLs and time spent in courses/groups to a local database, and uploads those records to Instructure through a background worker. It also enables Crashlytics crash reporting and links its Help screen to a Play Store rating flow.

The patch preserves course access, login, synchronization, document viewing, submission, messaging, and notification behavior. It intercepts only telemetry/reporting paths and returns normal success results where WorkManager requires one.

### 2. Technical Implementation & Injection Points

#### Layer 1: Pendo SDK (`Lsdk/pendo/io/Pendo;`)

- **Void methods stubbed to `return-void`:** `setup`, `startSession`, `track`, `screenContentChanged`, `setAccountData`, `setVisitorData`, `dismissVisibleGuides`, `pauseGuides`, `resumeGuides`, `endSession`.
- **Boolean return stubbed to `false`:** `sendClickAnalytic`.
- **Object returns stubbed to `null`:** `getAccountId`, `getVisitorId`, `getDeviceId`.

#### Layer 2: Pendo Consent Handlers (`Lcom/instructure/pandautils/features/cookieconsent/AnalyticsConsentHandler;`)

- **Methods stubbed to `return-void`:** `onConsentGranted`, `onConsentRevoked`.

#### Layer 3: First-Party Event Dispatch & Token Reporting

- **`Lcom/instructure/canvasapi2/utils/Analytics;`:** Stubs `logEvent` and `setUserProperty` to `return-void`; stubs `isSessionActive` to return `false`.
- **`Lcom/instructure/student/util/Analytics;`:** Stubs `trackAppFlow`, `trackBookmarkCreated`, `trackBookmarkSelected`, `trackButtonPressed`, `trackUnsupportedFeature`, and `trackWidgetFlow` to `return-void`.
- **`Lcom/instructure/canvasapi2/AppManager;`:** Stubs `logTokenAnalytics` to `return-void`.

#### Layer 4: ScreenView & Pandata Pageview Surveillance

- **`Lcom/instructure/pandautils/analytics/ScreenViewAnnotationProcessor;`:** Stubs `processScreenView` to `return-void`.
- **`Lcom/instructure/canvasapi2/utils/pageview/PandataManager;`:** Stubs `uploadPageViewEvents` to `return-void`.
- **`Lcom/instructure/pandautils/analytics/pageview/PageViewUtils;`:** Stubs `saveSingleEvent` and `stopEvent` to `return-void`.
- **`Lcom/instructure/pandautils/analytics/pageview/PageViewAnnotationProcessor;`:** Stubs `startEvent` and `stopEvent` to `return-void`.
- **`Lcom/instructure/pandautils/analytics/pageview/PageViewUploadWorker;`:** Injects `new-instance v0, Landroidx/work/u$a$c; \n invoke-direct {v0}, Landroidx/work/u$a$c;-><init>()V \n return-object v0` into `doWork()`, returning `Result.success()` immediately without querying the local database or uploading queued records.

#### Layer 5: Offline Analytics, Crashlytics, Rating & Logging

- **`Lcom/instructure/pandautils/analytics/OfflineAnalyticsManager;`:** Stubs `offlineModeStarted`, `reportCourseOpenedInOfflineMode`, and `offlineModeEnded` to `return-void`.
- **`Lcom/google/firebase/crashlytics/FirebaseCrashlytics;`:** Stubs `log`, `recordException`, `setCrashlyticsCollectionEnabled`, `setCustomKey`, `setCustomKeys`, `setUserId`, `sendUnsentReports`, and `deleteUnsentReports` to `return-void`.
- **`Lcom/instructure/student/mobius/settings/help/StudentHelpDialogFragmentBehavior;`:** Stubs `rateTheApp` to `return-void`.
- **`Lcom/instructure/canvasapi2/utils/Logger;`:** Stubs `canLogUserDetails` to return `false`.

#### Manifest Layer: Crashlytics Collection (`removeCrashlyticsCollection`, default on)

The Java method stubs alone leave Crashlytics initialized and the NDK crash handler loaded. The resource layer edits `AndroidManifest.xml`:

- Sets `firebase_crashlytics_collection_enabled=false` as a direct `<meta-data>` child of `<application>`, adding it when the manifest does not declare it and updating the value when it does.
- Removes the `com.google.firebase.components:com.google.firebase.crashlytics.ndk.CrashlyticsNdkRegistrar` metadata from `com.google.firebase.components.ComponentDiscoveryService`, so `libcrashlytics*.so` is never loaded. Other registrars, including `CrashlyticsRegistrar`, stay in place.

Meta-data is matched only among direct children: a document-wide `meta-data` search also returns entries nested inside services and providers. A manifest without exactly one `<application>`, without `ComponentDiscoveryService`, or without the NDK registrar metadata fails the patch. Disabling the option leaves the pass bytecode-only.

### 3. Preconditions & Verification

1. Targets Canvas Student `8.12.0` signed with SHA-256 certificate `abfe1362d84c5234c174c2c03d405a480405e361162f7b28dad6bec825ba02b3`.
2. Every method lookup resolves through `mutableClassDefByOrNull` and verifies implementation presence before injecting instructions.
3. Verify build with `./gradlew :patches:buildAndroid clean --no-daemon`.
4. Verify metadata generation with `./gradlew generatePatchesList`.

## Patch: Fix PDF Viewer Crash

- **Name:** Fix PDF Viewer Crash
- **Target Package:** `com.instructure.candroid`
- **Supported Versions:** `8.12.0`
- **Default State:** `true` (Enabled by default)
- **Type:** Raw Resource Patch (`rawResourcePatch`)
- **Options:** `removeEvaluationWatermark` (default `true`)

### Behavior

Canvas 8.12.0 aborts whenever a document is opened. Nutrient's bundled license grants **Form Viewing and Filling** but not **Forms Editing**, yet the native SDK calls its editing-only assertion `PDFC::Forms::checkLicenseForFormsAndThrowIfMissing()` from view-path methods. `FormProviderImpl.<init>` reaches it through `registerFormObserver`, and `FormProviderImpl.prepareFieldsCache` reaches it through `getFormFields`; both paths assert `Your license does not allow Forms editing.` and kill the process.

The patch overwrites the entry point of that assertion with an immediate return in each shipped ABI (`arm64-v8a`, `armeabi-v7a`, `x86`, `x86_64`), so the licensed viewing/filling paths proceed. Java-side entitlement gates are unchanged. An unexpected library layout fails the patch instead of leaving the crash in place. The original APK and a cloned package (whose Nutrient license is rejected as a different bundle identifier) both hit the same assertion.

`removeEvaluationWatermark` additionally overwrites the native `For Evaluation Purposes Only` string with spaces in each ABI. A cloned package cannot validate the original bundle identifier's Nutrient license, so the renderer otherwise stamps that watermark across every page. The option only blanks the watermark text; license evaluation and every other SDK behavior are unchanged.

## Patch: Show Remote Config Editor

- **Name:** Show Remote Config Editor
- **Target Package:** `com.instructure.candroid`
- **Supported Versions:** `8.12.0`
- **Default State:** `false` (opt-in)
- **Type:** Dalvik Bytecode Patch (`bytecodePatch`)
- **Category:** `Developer`

### Behavior

`SettingsItem.REMOTE_CONFIG` and its `SettingsFragment` navigation exist in the app, but `StudentSettingsBehaviour.getSettingsItems()` never adds the item, so the editor is unreachable. The patch appends `REMOTE_CONFIG` to the list stored under `R.string.preferences` (`0x7f130c1a`) immediately before the method's `return-object`.

The stored list is copied into a `java.util.ArrayList` before `add`, because the value returned by the original body is not guaranteed to be mutable. The patch requires `StudentSettingsBehaviour.getSettingsItems()Ljava/util/Map;`, a reference to `0x7f130c1a` in that method, and a `return-object`; otherwise it throws.

The editor writes each edited value through `RemoteConfigPrefs.putString` and persists across screen re-entry. Values can still be overwritten by the next Firebase remote-config fetch, so the screen is an inspection/override tool, not a permanent override.

## Patch: Unlock Notebook and Offline Content

- **Name:** Unlock Notebook and Offline Content
- **Target Package:** `com.instructure.candroid`
- **Supported Versions:** `8.12.0`
- **Default State:** `false` (opt-in)
- **Type:** Dalvik Bytecode Patch (`bytecodePatch`)
- **Category:** `Features`
- **Options:** `enableNotebook` (default `true`), `enableOfflineContent` (default `true`)

### Behavior

`FeatureFlagProvider.notebookEnabled` and `FeatureFlagProvider.offlineEnabled` are suspend wrappers over the environment flags `notebook` and `mobile_offline_mode`. For each enabled option the patch makes the corresponding method return `Boolean.TRUE` at index 0. Callers only test for `COROUTINE_SUSPENDED` before unboxing, so the injected boxed return is equivalent to a completed continuation.

A missing `FeatureFlagProvider` or missing method throws. Only client gates change: the institution must still serve the Notebook and offline-content endpoints, so screens can be empty or error when the server does not support them.

## Patch: Disable AI Study Tools

- **Name:** Disable AI Study Tools
- **Target Package:** `com.instructure.candroid`
- **Supported Versions:** `8.12.0`
- **Default State:** `false` (opt-in)
- **Type:** Dalvik Bytecode Patch (`bytecodePatch`)
- **Category:** `Privacy`

### Behavior

Study Tools is a student AI feature with a client-side availability gate. The patch stubs `StudyToolsViewModel.checkStudyToolsAvailability(String)` to `return-void` — the only path that calls `GetStudyToolsUseCase` — and forces `StudyToolsUiState.getAvailable()` to `false`, which is the value `PageDetailsScreenKt` checks before showing the Study Tools button. Both targets are required; a missing class or method fails the patch.

## Patch: Change App Name

- **Name:** Change App Name
- **Target Package:** `com.instructure.candroid`
- **Supported Versions:** `8.12.0`
- **Default State:** `false` (opt-in)
- **Type:** Resource Patch (`resourcePatch`)
- **Options:** `appName` (default `Canvas`)

### Behavior

Sets `android:label` to the supplied literal on the manifest `<application>` and on the single launcher `<activity>`. The launcher label changes without touching localized string resources or in-app text. Blank names and manifests without exactly one `<application>` or a MAIN/LAUNCHER activity fail the patch.

## Patch: Clone App

- **Name:** Clone App
- **Target Package:** `com.instructure.candroid`
- **Supported Versions:** `8.12.0`
- **Default State:** `false` (opt-in)
- **Type:** Resource Patch (`resourcePatch`)
- **Options:** `packageName` (default `com.instructure.candroid.morphe`)

### Behavior

Changes the manifest package so the build installs beside the original app. The patch requires the input package to be `com.instructure.candroid`, resolves relative component names, rewrites original-package custom permissions, provider authorities, and the instrumentation target, then sets the new package in the resource finalizer. Morphe's resource encoder rewrites package-qualified resource references when the manifest package changes.

`apk-lab check` and `apk-lab deploy` reject an output whose package ID differs from the input by design. Verify this patch by invoking the pinned Morphe CLI directly, then inspect, sign, and install the output. The clone has separate app data. Re-signed or cloned App Links, push notifications, OAuth redirects, and package/certificate-bound services may not work. Nutrient/PSPDFKit licensing may depend on the application ID, so document viewing is not claimed to work until it is tested with a real account and document. Malformed package names, the original package name, missing manifest anchors, and authority collisions fail instead of producing a misleading clone.

## Patch: Change App Icon

- **Name:** Change App Icon
- **Target Package:** `com.instructure.candroid`
- **Supported Versions:** `8.12.0`
- **Default State:** `false` (opt-in)
- **Type:** Composite Feature Patch (`compositeFeaturePatch`: bytecode patch plus an internal resource companion)
- **Options:** `foregroundColor` (default `#E62429`), `backgroundColor` (default `#FFFFFF`), `customForeground` (optional PNG)

### Behavior

Recolors the `#E62429` paths in `res/drawable/ic_launcher_foreground.xml`, sets the background color on both decoded adaptive icons, `res/mipmap/ic_launcher.xml` and `res/mipmap-anydpi/ic_launcher.xml`, through a dedicated color resource, and optionally adds a square PNG as `res/drawable-nodpi/aidan_canvas_launcher_foreground.png`. The custom image replaces only the adaptive foreground; the original monochrome vector stays in place for themed icons.

`backgroundColor` styles only the launcher icon. Splash theming is independent and gated by two options that default to on: `themeSplashScreen` and `themeLandingLogo`. When `themeSplashScreen` is on and `splashBackgroundColor` differs from white, the patch writes `@color/aidan_canvas_splash_background`, points the literal white in `res/drawable/splash_background_student.xml` at it, replaces the `@color/backgroundLightest` background of `res/layout/activity_init_login.xml`, and adds `android:windowSplashScreenBackground` to `LoginFlowTheme.Splash_Student` in `res/values/styles.xml`. When it is on and `foregroundColor` differs from the default, it sets `android:tint` on the splash bitmap and prepends a constant return to `LoginActivity.themeColor()I`, which `BaseLoginInitActivity.applyTheme()` feeds into `CanvasLoadingView.setOverrideColor()`. When `themeLandingLogo` is on and `foregroundColor` differs from the default, it prepends the same constant to `LoginLandingPageActivity.themeColor()I`, which `BaseLoginLandingPageActivity.applyTheme()` feeds into `ColorUtils.colorIt()` on the `canvasLogo` ImageView; that runtime tint overrides any fill change in `res/drawable/ic_canvas_logo.xml`, so the vector is left alone. With both toggles off only the launcher icon changes; the Android 12+ system splash still draws that recolored icon because it always shows the app icon, but its background, the legacy splash window, the animated loader, and the signed-out logo stay stock. Customized colors are single-valued, not night-adaptive; `@color/login_studentAppTheme` and other login screens (including the `textInfo`-colored "Find my school" button) are left untouched.

The image is an adaptive foreground, so launchers mask it to their icon shape. Use a 432×432 PNG with artwork inside the central safe area. Colors may be `#RRGGBB` or opaque `#AARRGGBB` (the `FF` alpha is stripped); non-opaque alpha is rejected; images must be readable square PNGs no larger than 4096 pixels per side. Missing red vector paths, missing adaptive-icon anchors, conflicts with the new drawable name, and invalid images fail explicitly. Morphe CLI accepts `-O customForeground=<path>`; whether a given Manager version renders a file picker for this option is not established.
