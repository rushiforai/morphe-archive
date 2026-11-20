# Adobe Scan Patch Specifications

## Overview

This document specifies patches for **Adobe Scan** (`com.adobe.scan.android`).

---

## Patch: Remove Login

- **Name:** Remove Login
- **Target Package:** `com.adobe.scan.android`
- **Supported Versions:** `26.09.25`
- **Default State:** `true` (Enabled by default)
- **Type:** Dalvik Bytecode Patch (`bytecodePatch`)
- **Dependencies:** None
- **Compatibility:** `COMPATIBILITY_ADOBE_SCAN` (`ApkFileType.APKM`, target `26.09.25`, `minSdk` 32)
- **Options:**
  - `Clean Up Auth Components` (`cleanUpAuthComponents`, default `true`): Removes the profile icon, sign-out, and sign-in options from the Settings menu.
  - `Remove Link Sharing` (`removeLinkSharing`, default `true`): Removes cloud link sharing options from the Share sheet, preserving local PDF sharing.
  - `Remove Edit Text` (`removeEditText`, default `true`): Removes the non-functional Edit text option from file option menus and the preview screen.
  - `Remove Move` (`removeMove`, default `true`): Removes the non-functional Move file option from file option menus.
  - `Remove Save as Word Doc` (`removeSaveAsWord`, default `true`): Removes the cloud-dependent Save as Word doc option from scan cards.

### 1. Motivation & Purpose

By default, Adobe Scan version `26.09.25` prevents any use of the application without an authenticated Adobe ID, Google, Facebook, or Apple account. Unauthenticated cold launches are redirected to `ScanTourViewActivity`, where only sign-in options are presented. Even if navigated around, the scanner intercepts the "Save PDF" button with an mandatory account prompt, and unauthenticated state triggers wipe the local database.

The **Remove Login** patch unlocks Adobe Scan as a standalone, offline, privacy-first local scanning utility. It starts directly into the scanning and file management workspace without creating, forging, or refreshing an Adobe cloud session or guest token. Adobe cloud synchronization, account profiles, cloud comments, shared links, and server-side generative AI features are disabled/unavailable as a consequence, while all local capabilities (camera capture, edge detection, perspective correction, image filters, local PDF synthesis, local document management, and external PDF export) function indefinitely offline.

---

### 2. Technical Implementation & Injection Points

#### Layer 1: Cold-Start Navigation Bypass (`SplashActivity.a0`)

- **Target Class:** `Lcom/adobe/scan/android/SplashActivity;`
- **Target Method:** `a0(Lcom/adobe/scan/android/SplashActivity;Ljava/util/ArrayList;ZLjava/lang/String;Ljava/lang/String;Lcom/adobe/scan/android/ScanApplication$LandingScreen;Lcom/adobe/dcmscan/document/Page$CaptureMode;I)V`
- **Anchor:** Immediately after `invoke-direct/range` on `Lcom/adobe/scan/android/SplashActivity$a;-><init>` (`initIndex + 1`).
- **Injected Bytecode:**

  ```smali
  move-object/from16 v5, p0
  sget-object v0, Lcom/adobe/scan/android/ScanApplication;->C:Lcom/adobe/scan/android/ScanApplication;
  const/4 v1, 0x0
  move-object v2, p1
  sget-object v3, Lcom/adobe/scan/android/ScanApplication$LoginActionType;->LOGIN:Lcom/adobe/scan/android/ScanApplication$LoginActionType;
  const/4 v4, 0x0
  invoke-virtual {v0, v1, v2, v3, v4}, Lcom/adobe/scan/android/ScanApplication;->f(ZLcom/adobe/scan/android/SplashActivity$a;Lcom/adobe/scan/android/ScanApplication$LoginActionType;Lcom/adobe/scan/android/ScanApplication$LandingScreen;)Landroid/content/Intent;
  move-result-object v0
  invoke-virtual {v5, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
  invoke-virtual {v5}, Landroid/app/Activity;->finish()V
  return-void
  ```

- **Effect:** Unconditionally delegates intent creation to `ScanApplication.f` with action `LOGIN`, starts `FileBrowserActivity`, finishes `SplashActivity`, and exits without evaluating `cr.d.p()` or instantiating `ScanTourViewActivity`.

#### Layer 2: Main Workspace Gate Bypass (`FileBrowserActivity.onCreate`)

- **Target Class:** `Lcom/adobe/scan/android/FileBrowserActivity;`
- **Target Method:** `onCreate(Landroid/os/Bundle;)V`
- **Anchor:** Immediately after `sget-object v11, Lcom/adobe/scan/android/ScanApplication$LoginActionType;->SKIP_LOGIN` (`skipLoginAnchorIndex + 1`).
- **Injected Bytecode:**

  ```smali
  move-object v11, v5
  ```

- **Effect:** Equalizes `v11` to `v5` right before the `if-eq v5, v11` check, ensuring execution unconditionally branches over the unauthenticated `finish()` and `ScanApplication.h` call directly to `:goto_d`. It preserves `v5` as `LOGIN`, allowing subsequent logic to execute normal `u1(bundle)` initialization, Room database loading, and document rendering.

#### Layer 3: Tour Redirection Fail-Safe (`ScanTourViewActivity.onCreate`)

- **Target Class:** `Lcom/adobe/scan/android/ScanTourViewActivity;`
- **Target Method:** `onCreate(Landroid/os/Bundle;)V`
- **Injected Bytecode (at index 0):**

  ```smali
  new-instance v0, Landroid/content/Intent;
  const-class v1, Lcom/adobe/scan/android/FileBrowserActivity;
  invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
  const/high16 v1, 0x10000000
  invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;
  sget-object v1, Lcom/adobe/scan/android/ScanApplication$LoginActionType;->LOGIN:Lcom/adobe/scan/android/ScanApplication$LoginActionType;
  const-string v2, "loginActionType"
  invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;
  invoke-virtual {p0, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
  invoke-virtual {p0}, Landroid/app/Activity;->finish()V
  return-void
  ```

- **Effect:** If `ScanTourViewActivity` is ever opened directly via external intent or system action, it immediately starts `FileBrowserActivity` and terminates.

#### Layer 4: Application Helpers & In-Scanner Banner Neutralization (`ScanApplication`)

- **Target Class:** `Lcom/adobe/scan/android/ScanApplication;`
- **Helper `h(ScanApplication;)V`:** Injected with `return-void` at index 0. Any code path attempting to launch `ScanTourViewActivity` becomes inert.
- **Field `Lqe/c1;->a:Lnt/a5;` in `onCreate()V`:**
  - **Anchor:** Immediately after `sput-object v3, Lqe/c1;->a:Lnt/a5;` (`c1AnchorIndex + 1`).
  - **Injected Bytecode:**

    ```smali
    const/4 v0, 0x0
    sput-object v0, Lqe/c1;->a:Lnt/a5;
    ```

  - **Effect:** Clears `ExternalUI` (`c1.a`) to `null`. This permanently eliminates the "Sign in is required to save" banner and modal triggers across all camera and review surfaces.

#### Layer 4a: Logged-In Cloud Storage Notice Suppression (`WelcomeDialogKt.WelcomeDialog`)

- **Target Class:** `Lzd/e5;`
- **Target Method:** `a(Lzd/f5;ZLjava/util/List;Lzd/s4;Lg3/o;II)V`
- **Injected Bytecode (at index 0):**

  ```smali
  sget-object v0, Lzd/f5;->LOGGED_IN_FILE_BROWSER:Lzd/f5;
  if-ne p0, v0, :skip_logged_in_welcome_dialog
  return-void
  :skip_logged_in_welcome_dialog
  ```

- **Effect:** Suppresses only the file-browser confirmation titled “You're now signed in,” which says that scans will be processed in and saved to Adobe cloud storage. The What's New, skip-login, and component-launch dialog variants remain unchanged.

#### Layer 5: In-Scanner Save Interceptor Neutralization (`CaptureActivity.X2`)

- **Target Class:** `Lcom/adobe/dcmscan/CaptureActivity;`
- **Target Method:** `X2(Lcom/adobe/dcmscan/a$a;Z)V`
- **Injected Bytecode (at index 0):**

  ```smali
  const/16 p2, 0x0
  ```

- **Effect:** Forces the second parameter (`promptSignIn` boolean `z11`) to `false`. When the user taps "Save PDF", the check `if (z11 && qe.c1.a != null)` evaluates to `false`, immediately executing `p2()` and saving the PDF to local storage.

#### Layer 6: In-App Settings & Trial Limits (`util/l.S0`)

- **Target Class:** `Lcom/adobe/scan/android/util/l;`
- **Target Method:** `S0(Lcom/adobe/scan/android/ScanApplication$c;)V`
- **Injected Bytecode (at index 0):** `return-void`
- **Effect:** Neutralizes settings clicks (e.g., "Log In" button) and trial limit triggers that would otherwise launch `ScanTourViewActivity`.

#### Layer 7: External & Social Sign-In Activity Neutralization

- **Target Class 1:** `Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthSignInActivity;`
- **Target Method:** `onCreate(Landroid/os/Bundle;)V`
- **Target Class 2:** `Lcom/adobe/libs/services/auth/SVServiceIMSLoginActivity;` (base for Google, Facebook, Apple, Kakao, and Line login)
- **Target Method:** `onCreate(Landroid/os/Bundle;)V`
- **Injected Bytecode (at index 0 in both):**

  ```smali
  invoke-virtual {p0}, Landroid/app/Activity;->finish()V
  return-void
  ```

- **Effect:** Any unexpected deep link or subcomponent attempting to present web-based or native OAuth sign-in immediately finishes.

#### Layer 8: Local Storage Persistence Protection (`ScanFileManager`)

- **Target Class 1:** `Lcom/adobe/scan/android/file/v0;`
- **Target Method:** `o()V` (database reset and cache purge)
- **Target Class 2:** `Lcom/adobe/scan/android/file/v0$d;`
- **Target Method:** `a()V` (unauthenticated / logout listener callback)
- **Injected Bytecode (at index 0 in both):** `return-void`
- **Effect:** Prevents the app from wiping `ScanFileRoomDatabase` and in-memory caches when detecting an unauthenticated account state, ensuring all saved documents persist permanently across app restarts and reboots.

#### Layer 9: Clean Up Auth Components (`SettingsFragment.E`)

- **Target Class:** `Ljt/v2;`
- **Target Method:** `E(Ljava/lang/String;)V`
- **Anchor:** Immediately after `invoke-virtual {p0, v0, p1}, Landroidx/preference/b;->F(ILjava/lang/String;)V` (`loadIndex + 1`).
- **Injected Bytecode:**

  ```smali
  const v0, 0x7f141f77
  invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;
  move-result-object v0
  invoke-virtual {p0, v0}, Landroidx/preference/b;->o(Ljava/lang/String;)Landroidx/preference/Preference;
  move-result-object v0
  const/4 p1, 0x0
  invoke-virtual {v0, p1}, Landroidx/preference/Preference;->C(Z)V
  const v0, 0x7f141f75
  invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;
  move-result-object v0
  invoke-virtual {p0, v0}, Landroidx/preference/b;->o(Ljava/lang/String;)Landroidx/preference/Preference;
  move-result-object v0
  invoke-virtual {v0, p1}, Landroidx/preference/Preference;->C(Z)V
  const v0, 0x7f141f74
  invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;
  move-result-object v0
  invoke-virtual {p0, v0}, Landroidx/preference/b;->o(Ljava/lang/String;)Landroidx/preference/Preference;
  move-result-object v0
  invoke-virtual {v0, p1}, Landroidx/preference/Preference;->C(Z)V
  ```

- **Effect:** Unconditionally sets visibility (`C(false)`) for `ScanProfilePreference` (`SETTINGS_PROFILE_KEY`), the "Sign out" preference (`SETTINGS_LOG_OUT_KEY`), and the "Sign in" preference (`SETTINGS_LOG_IN_KEY`) right after XML inflation, removing all dead auth components from the Settings menu.

#### Layer 10: Remove Link Sharing (`qt.q2.e`, `qt.q2.h`)

- **Target Class:** `Lqt/q2;`
- **Target Methods:** `h(Lqt/d3;Lqt/q1;Lg3/o;I)V`, `e(Lqt/d3;Lqt/q1;Lg3/o;I)V`
- **Injected Bytecode:**
  - In `q2.h`: `return-void` at index 0.
  - In `q2.e`: Replaces `invoke-static` calls to `q2.h` (link share section) and `q2.d` (divider line) with `nop`.
- **Effect:** Removes the non-functional cloud "Share link" heading, explainer text, and web application targets (Gmail, Messages, Copy link) from the Share bottom sheet, preserving only the working local "Share PDF" section with "Send a copy" and "Send compressed".

#### Layer 11: Remove Edit Text (`util/a.j`)

- **Target Class:** `Lcom/adobe/scan/android/util/a;`
- **Target Method:** `j()Z`
- **Injected Bytecode (at index 0):** `const/4 v0, 0x0 \n return v0`
- **Effect:** Forces the global Edit Text capability predicate to `false`. Automatically removes the broken "Edit text" item (which fails offline with "Unable to download edit") across the File Options bottom sheet (`qt.u.a`), the preview screen bottom toolbar (`vt.b2.a`), and recent scan cards on the Home screen.

#### Layer 12: Remove Move (`qt/u.a`)

- **Target Class:** `Lqt/u;`
- **Target Method:** `a(Lqt/a;, Lfu/b;, Ljava/util/List;)Lm90/b;`
- **Injected Bytecode:** Replaces the `invoke-virtual {..., ...}, Lm90/b;->add(Ljava/lang/Object;)Z` instructions for both occurrences of `0x7f142396` (`file_list_move`) with `nop`.
- **Effect:** Completely removes the cloud-only "Move" option (which requires cellular/Wi-Fi upload to Document Cloud folders) from the File Options bottom sheet across all surfaces (Files tab, Recent tab, and Search).

#### Layer 13: Remove Save as Word Doc (`FileListTools.q0.b`, `FileListTools.r0.<init>`)

- **Target Class 1:** `Lut/q0;`
- **Target Method:** `b(Lcom/adobe/scan/android/file/m0;)Z`
- **Injected Bytecode (at index 0):** `const/4 v0, 0x0 \n return v0`
- **Target Class 2:** `Lut/r0;`
- **Target Method:** `<init>(Lod/ll;Lod/ll;)V`
- **Injected Bytecode:** Trims `this.g` array instruction from `{v0, v6, v5}` to `{v0, v5}`.
- **Effect:** Removes the cloud-dependent "Save as Word doc" action (which relies on remote `DCExportPdfBody.Format.DOCX` conversion on Document Cloud servers) from the recent scan card on the Home screen, cleanly displaying local Share and Save as JPEG actions.

#### Layer 14: Suppress Waiting to Upload Status (`ScanFile.b`)

- **Target Class:** `Lcom/adobe/scan/android/file/m0;`
- **Target Method:** `b(Z)I`
- **Injected Bytecode:** Replaces `const v2, 0x7f142937` (`waiting_to_upload`) with `const/4 v2, 0x0`.
- **Effect:** Prevents local unuploaded scans from returning the `R.string.waiting_to_upload` status identifier. On both the Home and Files screens, documents cleanly render their local state ("Available Offline", date, and file size) without displaying the misleading "Waiting to upload..." status indicator.

---

#### Layer 15: Remove Compress PDF (`qt/u.a`, `qt/q2.i`)

- **Target Class 1:** `Lqt/u;`
- **Target Method:** `a(Lqt/a;Lfu/b;Ljava/util/List;)Lm90/b;`
- **Target Class 2:** `Lqt/q2;`
- **Target Method:** `i(Lqt/d3;Lqt/q1;Lg3/o;I)V`
- **Injected Bytecode:** Replaces the `invoke-virtual Ljava/util/ArrayList;->add` call for `0x7f1421b3` (`compress_pdf`) in `qt.u` with `nop`, and replaces the `invoke-static Lqt/q2;->g` render call for `0x7f1427dd` (`send_compressed`) in `qt.q2` with `nop`.
- **Effect:** Completely removes the broken cloud-dependent "Compress PDF" action (which fails offline with "File is still uploading. Please wait." because post-save compression is a Document Cloud server feature) from the File Options bottom sheet across all surfaces, and removes "Send compressed" from the local Share PDF bottom sheet. Local compression during scan save in `CaptureActivity` remains fully functional.

### 3. Preconditions & Verification

1. **Strict Target Validation:** Gates strictly on `com.adobe.scan.android` version `26.09.25` signed with SHA-256 certificate `b6dd0562256487fcd6c98cde137858ef50d9adb9f9cd2f1ca58c5357efdf0faf`.
2. **Fail-Fast Invariants:** Method lookups verify the presence of target classes, methods, and expected anchor instructions before modifying bytecode; throws `PatchException` on any mismatch.
3. **Compilation Verification:** Build patch bundle via `./gradlew :patches:buildAndroid clean --no-daemon`.
4. **Metadata Verification:** Run `./gradlew generatePatchesList`.
5. **Runtime Verification:** Apply patch to APKM via Morphe CLI, install on `emulator-5554`, clear data, disconnect network, capture a document, tap Save PDF, force-stop, relaunch, and confirm document persistence and export via "Copy to device".

---

## Patch: Remove Ads and Tracking

- **Name:** Remove Ads and Tracking
- **Target Package:** `com.adobe.scan.android`
- **Supported Versions:** `26.09.25`
- **Default State:** `true` (Enabled by default)
- **Type:** Dalvik Bytecode Patch (`bytecodePatch`)
- **Dependencies:** None
- **Compatibility:** `COMPATIBILITY_ADOBE_SCAN` (`ApkFileType.APKM`, target `26.09.25`, `minSdk` 32)
- **Options:**
  - `Disable In-App Ads` (`removeAds`, default `true`): Disables banner and interstitial ads, banner preloading, ad analytics, and InMobi SDK initialization.
  - `Disable Adobe Telemetry & Growth` (`removeAdobeTracking`, default `true`): Disables Adobe Experience Platform MobileCore, EventHub dispatch, Adobe Growth SDK (DGP/MAU pings and Dunamis logging), Adobe Journey Optimizer (AJO), Creative SDK, and AEP NetworkService.
  - `Disable Firebase Telemetry` (`removeFirebaseTracking`, default `true`): Disables Firebase Performance Monitoring (AppStartTrace and network timing), Firebase Sessions, Firebase Installations, and Crashlytics collection.
  - `Disable Facebook Tracking` (`removeFacebookTracking`, default `true`): Disables Facebook SDK auto-initialization (FacebookInitProvider), Audience Network ContentProvider, App Events logging, and remote settings fetch.
  - `Zero Device Identifiers` (`removeDeviceIdentifiers`, default `true`): Zeroes the Google Play Advertising ID, blocks Install Referrer, and neutralizes hardware `android_id` collection in AccountManager and Creative SDK.
  - `Disable Review Prompts` (`removeReviewPrompts`, default `true`): Suppresses in-app rating and review dialogs.
  - `Remove Settings` (`removeSettings`, default `true`): Removes the Send usage info and Send crash info preferences and suppresses the crash reports dialog, whose telemetry backends are disabled by this patch.

### 1. Motivation & Purpose

Adobe Scan transmits first-party Adobe Experience Platform (AEP), Document Cloud, Creative SDK, Adobe Target, Adobe Growth Platform (DGP/MAU), and Firebase (Crashlytics, Performance Monitoring, Sessions, Installations) telemetry. It also bundles Branch referral attribution, Facebook App Events and Audience Network initialization, AAID, hardware `android_id`, and install-referrer collection, Google AdMob mediation, InMobi, banner and interstitial controllers, and Google Play review prompts.

The **Remove Ads and Tracking** patch prevents these SDKs from initializing, dispatching events, loading ads, fetching Target content, sending Branch requests, reading usable device or advertising identifiers, submitting Crashlytics or Performance reports, or presenting rating prompts. It forces the crash-reporting preference to `Never`, including upgrades that retain an earlier `Always` selection. Local scanning, OCR, image processing, PDF creation, and document storage remain untouched.

### 2. Technical Implementation & Injection Points

| Layer                               | Target descriptors                                                                                                                                                    | Patched behavior                                                                                                                                                                                                |
| ----------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Adobe Experience Platform           | `MobileCoreInitializer`, `MobileCore`, `Target`, `dp.u` (`NetworkService`)                                                                                            | Neutralizes MobileCore initialization, ActivityLifecycle callbacks, event dispatch (`a` and `b`), actions/states, Target requests, and AEP network execution.                                                   |
| Adobe Growth Platform (DGP/MAU/AJO) | `GrowthSDKInitializer`, `DGPMau`, `DGPAEPBridge`, `DGPLog$Companion`, `NetworkInterface$Companion`, `AJOHelper`                                                       | Neutralizes App Startup initialization, cancels MAU dispatch, forces `readyForEvent` to `false`, blocks Dunamis logging, and intercepts native Growth SDK network calls.                                        |
| Document Cloud & Creative SDK       | `br.j`, `uc.f`, `br.d`, `br.j$g`, `br.j$h`, Creative SDK analytics `n`, `g`, and `c`                                                                                  | Stops Scan analytics, Edge consent requests, ETS upload scheduling, and event synthesis.                                                                                                                        |
| Firebase Crashlytics & Diagnostics  | `util.l.r1`, `util.l.q0`, `FirebaseCrashlytics`                                                                                                                       | Forces crash preference to `Never` (setter and getter), neutralizes previous-execution crash detection, and stubs collection toggle, report submission, exception recording, logging, user ID, and custom keys. |
| Firebase Performance & Sessions     | `AppStartTrace`, `v50.j` (`TransportManager`), `d60.x0` (`SessionFirelogPublisher`), `d60.l`, `installations.a`                                                       | Neutralizes cold-start lifecycle listeners, drops performance trace/network payloads, silences session event logging, and disables FID registration.                                                            |
| In-App Ads & Mediation              | `ar.k`, `ar.u`, `ar.x`, `ar.c`, `ar.s`, `InMobiSdk`                                                                                                                   | Forces ad eligibility checks to `false`; prevents banner and interstitial loads, ad-event reporting, and InMobi initialization.                                                                                 |
| Facebook & Audience Network         | `FacebookInitProvider`, `AudienceNetworkContentProvider`, `DynamicLoaderFactory`, `FetchedAppSettingsManager`, `AppEventsLoggerImpl`, `AppEventsLoggerImpl$Companion` | Returns `false` from content provider `onCreate` methods, stubs dynamic loader init and settings fetch, and stops App Events dispatch.                                                                          |
| Device Identity & Attribution       | `AdvertisingIdClient`, `AdvertisingIdClient$Info`, `yv.a`, `cr.d` (`AScanAccountManager`), `cb.d`                                                                     | Returns zeroed AAID with limit-ad-tracking enabled, blocks Install Referrer connection, forces hardware `android_id` resolution to `null` in AccountManager, and neutralizes Creative SDK CommonID generation.  |
| Attribution (Branch)                | `g90.e`, `g90.e0`, `g90.o0`                                                                                                                                           | Disables Branch lifecycle tracking, blocks its request queue, and permanently enables its tracking-disabled state.                                                                                              |
| Review Prompts                      | `util.l.z1`, `zq.ha`                                                                                                                                                  | Makes rating predicate `false` and dismisses review dialog on construction.                                                                                                                                     |

Every required target lookup validates its class, exact parameter types, return type, and implementation before modifying the method. A missing or mismatched target throws `PatchException`; the optional `br.j.a0(h90.d)` variant is skipped when absent.

When **Remove Settings** is enabled, the patch hides the `USAGE INFO` category after `PreferencesFragment` loads it (containing **Send usage info**, its explanatory link, and **Send crash info**) and suppresses the cold-start crash reports prompt dialog (`com.adobe.scan.android.b` and its factory `b$a.a`). Telemetry backends are disabled independently of this UI option.

### 3. Preconditions & Verification

1. **Strict Target Validation:** Gates on `com.adobe.scan.android` version `26.09.25` signed with SHA-256 certificate `b6dd0562256487fcd6c98cde137858ef50d9adb9f9cd2f1ca58c5357efdf0faf`.
2. **Compilation Verification:** Build the patch bundle with `./gradlew :patches:buildAndroid`.
3. **Metadata Verification:** Run `./gradlew generatePatchesList` and confirm that **Remove Ads and Tracking** is present for Adobe Scan.
4. **Patch Verification:** Apply the bundle to the target APKM. The patch must complete without `PatchException`.
5. **Bytecode Verification:** Confirm that `br.j.g` returns immediately, `ar.k.b` and `ar.u.a` return `false`, `g90.e.r` returns immediately, and `AdvertisingIdClient.getAdvertisingIdInfo` constructs the zeroed identifier with tracking limited.

---

## Patch: Remove Useless/Promotional Items

- **Name:** Remove Useless/Promotional Items
- **Target Package:** `com.adobe.scan.android`
- **Supported Versions:** `26.09.25`
- **Default State:** `false` (Disabled by default)
- **Type:** Dalvik Bytecode Patch (`bytecodePatch`)
- **Dependencies:** None
- **Compatibility:** `COMPATIBILITY_ADOBE_SCAN` (`ApkFileType.APKM`, target `26.09.25`, `minSdk` 32)
- **Options:**
  - `About Adobe Scan` (`removeAbout`, default `true`): Removes the About Adobe Scan item from the Settings menu.
  - `Help` (`removeHelp`, default `true`): Removes the Help item from the Settings menu.
  - `Rate App` (`removeRateApp`, default `true`): Removes the Rate app item from the Settings menu.
  - `Online Support Forum` (`removeSupportForum`, default `true`): Removes the Online support forum item from the Settings menu.
  - `Share This App` (`removeShareApp`, default `true`): Removes the Share this app item from the Settings menu.
  - `Fill & Sign` (`removeFillAndSign`, default `true`): Removes the Fill & Sign item from file option menus and Recent scan cards.
  - `Open in Adobe Acrobat` (`removeOpenInAcrobat`, default `false`): Removes the Open in Adobe Acrobat option from file option menus, the preview screen, and Recent scan cards.
  - `Generative Summary` (`removeGenerativeSummary`, default `true`): Removes Generative summary actions from the File Options bottom sheet.
  - `Edit Text` (`removeEditText`, default `true`): Removes Edit text from file option menus, the preview bottom toolbar, and scan cards.
  - `Move` (`removeMove`, default `true`): Removes Move file from file option menus across all surfaces.
  - `Compress PDF` (`removeCompressPdf`, default `true`): Removes Compress PDF from file option menus and Send compressed from the Share sheet. Automatically skipped if Local PDF Compression is enabled.

### 1. Motivation & Purpose

The Settings menu and file menus in Adobe Scan feature non-essential promotional, rating, external support, and Play Store redirection links that clutter the view. When combined with login removal, the menus cleanly focus on core scanner preferences and local tools. The **Remove Useless/Promotional Items** patch allows users to selectively remove About Adobe Scan, Help, Rate app, Online support forum, Share this app, and the promotional Fill & Sign option (which otherwise opens the Play Store if the external app is uninstalled), while automatically removing the empty bottom category header (gray bar) when all support items are hidden.

### 2. Technical Implementation & Injection Points

| Layer                            | Target Descriptor / Anchor                                                            | Injected Behavior                                                                                                                                                                                                                                                         |
| -------------------------------- | ------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Preference Inflation**         | `Ljt/v2;->E(Ljava/lang/String;)V` (after `b.F`)                                       | Sets `C(false)` (`setVisible(false)`) on selected preferences (`0x7f141f71`, `0x7f141f73`, `0x7f141f78`, `0x7f141f72`, `0x7f141f79`). If all support items are removed, hides the parent `PreferenceCategory` (`v0.J.C(false)`), eliminating the 72px gray separator bar. |
| **Rate App Visibility Override** | `Ljt/v2;->onCreate(Landroid/os/Bundle;)V` (after last `Preference.C(Z)V`)             | Injects `const/4 p1, 0x0 \n invoke-virtual {v0, p1}, Landroidx/preference/Preference;->C(Z)V` to ensure Rate app remains hidden even if Google Play Services availability checks evaluate to `true`.                                                                      |
| **Fill & Sign Removal**          | `Lqt/u;->a(...)Lm90/b;` (before `IF_EQZ` for `0x7f142619`) & `Lut/r0$b;-><clinit>()V` | Replaces `add` call for Fill & Sign with `nop` in File Options, and replaces `Lut/p0;->f` with `Lut/p0;->h` in `<clinit>`, excluding Fill & Sign from Recent scan card tool lists.                                                                                        |
| **Open in Acrobat**              | `Lqt/u;->a(...)Lm90/b;`, `Lvt/b2;->a(...)V`, `Lut/r0;-><init>(...)V`                  | Neutralizes addition of `0x7f142617` in the File Options bottom sheet, nulls out `Lvt/r4;->e` in the preview bottom toolbar array for `Ll90/s;->u`, and trims `r0.d` to `{Share, SaveAsJpeg}`.                                                                            |
| **Generative Summary Removal**   | `Lqt/u;->a(...)Lm90/b;`                                                               | Overrides GenAI entitlement move-result register with `const/4 v<reg>, 0x0` to hide Generative summary from the File Options bottom sheet.                                                                                                                                |
| **Edit Text Removal**            | `Lcom/adobe/scan/android/util/a;->j()Z`                                               | Returns `false` at index 0, disabling Edit text across all surfaces.                                                                                                                                                                                                      |
| **Move Removal**                 | `Lqt/u;->a(...)Lm90/b;`                                                               | Replaces `Lm90/b;->add` calls for Move resource `0x7f142396` with `nop`.                                                                                                                                                                                                  |
| **Save as Word Removal**         | `Lut/q0;->b(...)Z` & `Lut/r0;-><init>(...)V`                                          | Returns `false` from `q0.b` and trims `Lut/r0;->g` array to exclude Word doc export.                                                                                                                                                                                      |
| **Link Sharing Removal**         | `Lqt/q2;->h(...)V` & `Lqt/q2;->e(...)V`                                               | Stubs `q2.h` and replaces render calls in `q2.e` with `nop`.                                                                                                                                                                                                              |
| **Compress PDF Removal**         | `Lqt/u;->a(...)Lm90/b;` & `Lqt/q2;->i(...)V`                                          | Replaces `add` for `0x7f1421b3` in `qt.u` with `nop`, and replaces `Lqt/q2;->g` for `0x7f1427dd` with `nop`.                                                                                                                                                              |

### 3. Preconditions & Verification

1. **Target Validation:** Gates on `com.adobe.scan.android` version `26.09.25`.
2. **Compilation Verification:** Build patch bundle via `./gradlew :patches:buildAndroid clean --no-daemon`.
3. **Metadata Verification:** Run `./gradlew generatePatchesList`.
4. **Runtime Verification:** Apply patch with `-e "Remove Useless/Promotional Items"`, install on `emulator-5554`, verify Settings shows only `Preferences` with no gray separator bar, and verify File Options bottom sheet and Recent scan cards omit `Fill & Sign`.

---

## Patch: Use System Font

- **Name:** Use System Font
- **Target Package:** `com.adobe.scan.android`
- **Supported Versions:** `26.09.25`
- **Default State:** `false` (Opt-in)
- **Type:** Dalvik Bytecode Patch (`bytecodePatch`)
- **Dependencies:** None
- **Compatibility:** `COMPATIBILITY_ADOBE_SCAN` (`ApkFileType.APKM`, target `26.09.25`, `minSdk` 32)

### 1. Motivation & Purpose

Adobe Scan packages Adobe Clean `.otf` resources for legacy XML layouts, Spectrum input widgets, Creative SDK dialogs, and Jetpack Compose. The **Use System Font** patch replaces those resource loads with the device's configured system typeface while retaining Adobe resource weight and italic variants.

### 2. Technical Implementation & Injection Points

| Layer                  | Target                                                            | Injected behavior                                                                                                                                                  |
| ---------------------- | ----------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| AndroidX font loading  | `Lp6/h;->b(Context, int, TypedValue, int, h$c, boolean, boolean)` | Calls `SystemFontBridge.getSystemTypeface(context, resourceId, style, callback)` and returns its system typeface before AndroidX resolves an Adobe Clean resource. |
| Compose typography     | `Lod/e5;->a()Li5/p;`                                              | Returns `Li5/p;->a:Li5/n;` (`FontFamily.Default`) directly, bypassing Compose font-resource resolution.                                                            |
| Creative SDK text view | `CreativeSDKTextView.setTypeface(Typeface)`                       | Delegates to `androidx.appcompat.widget.c0.setTypeface`, bypassing `fonts/AdobeClean-SemiLight.otf` asset loading.                                                 |

`SystemFontBridge` maps resource-entry keywords to weight: `light` to 300, `medium` to 500, `bold` to 700, and unspecified names to 400. It combines those values with supplied bold and italic style bits; API 28 and newer use `Typeface.create(Typeface.DEFAULT, weight, italic)`, while older releases use the equivalent legacy style. When AndroidX supplies a font callback, the bridge invokes its `c(Typeface)` method on the main looper.

### 3. Preconditions & Verification

1. **Strict Target Validation:** The patch requires the exact ResourcesCompat method signature, Compose accessor, and Creative SDK `setTypeface(Typeface)` implementation; a missing or mismatched target throws `PatchException`.
2. **Compilation Verification:** Build the extension and patch bundle with `./gradlew :extensions:extension:compileReleaseJavaWithJavac` and `./gradlew :patches:buildAndroid`.
3. **Bytecode Verification:** Apply the bundle and confirm the three target methods begin with the bridge call, `FontFamily.Default` return, and AppCompat superclass call respectively.

---

## Patch: Local Premium

- **Name:** Local Premium
- **Target Package:** `com.adobe.scan.android`
- **Supported Versions:** `26.09.25`
- **Default State:** `true` (Enabled by default)
- **Type:** Composite Feature Patch (`compositeFeaturePatch` with companion `resources` and `rawResources`)
- **Dependencies:** None
- **Compatibility:** `COMPATIBILITY_ADOBE_SCAN` (`ApkFileType.APKM`, target `26.09.25`, `minSdk` 32)
  - `Local PDF Compression` (`enableLocalPdfCompression`, default `false`): Replaces Adobe Document Cloud post-save compression with on-device JPEG stream re-compression. Overrides Compress PDF removal when enabled.
  - `Local PDF Password Protection` (`enableLocalPdfProtection`, default `false`): Replaces Adobe Document Cloud password encryption with AES-256 on-device PDF protection and offline removal.
  - `Local PDF Export` (`enableLocalPdfExport`, default `false`): Replaces Adobe Document Cloud export with on-device editable Word, Excel, and PowerPoint conversion. Layout reconstruction is best-effort.
  - `Local PDF Combine` (`enableLocalPdfCombine`, default `false`): Combines local Adobe Scan documents into a new PDF on device without changing the originals.

### 1. Scope

The **Local Premium** patch enables locally executable premium document actions: OCR beyond the free-page limit, document editing, and in-save compression quality selection. Optional feature replacements allow users to enable on-device PDF password protection (Standard handler AES-256 V=5/R=6 encryption with offline removal) and post-save JPEG stream re-compression executed via a bundled native PDF engine (`libaidanscanpdf.so` powered by qpdf 12.4.2 and libjpeg-turbo 3.2.0) in an isolated worker process (`:aidan_pdf`).

All transforms are protected by atomic journaled transactions (`PdfFileTransaction`) with immutable snapshotting, SHA-256 stability checks, and rollback guarantees. Model updates and Room database persistence (`ScanFilePersistentData`) are executed synchronously within database transactions via `ScanFileAdapter`.

When signed in to a personal or trial Adobe ID (with `Remove Login` disabled), cloud features remain functional unless specifically stripped by other patches (e.g., when `Remove Useless/Promotional Items` is enabled with `removeGenerativeSummary=true`, Generative summary is removed even for signed-in accounts); when using `Remove Login`, all local operations run 100% offline without Adobe Document Cloud.

When `Local PDF Compression` is enabled, the promotional neutralizer `removeCompressPdf` safely skips removing Compress PDF from file option menus and the Share sheet, preventing accidental feature stripping. Likewise, when `Local PDF Export` is enabled, the `removeSaveAsWord` option in `Remove Login` safely skips removing Save as Word doc from scan cards.

### 2. Technical Implementation & Injection Points

| Layer                            | Target descriptors                                                                        | Patched behavior                                                                                                                                                                                                                                                                                                                                                        |
| -------------------------------- | ----------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Base Local Entitlements          | `Lcr/d0$a$a;` and `Lcr/y0;` (`c`, `d`, `e`, `f`, `g`, `j`, `l`, `m`, `n`)                 | Returns `true` for Scan Plus, Compression, Edit PDF, Scan Premium, GenAI access, high-volume OCR, High-Speed Scan, Ad-Free, and Scan Premium core across unauthenticated and authenticated sessions.                                                                                                                                                                    |
| Premium Membership Tier          | `Lcr/d0$a$a;` and `Lcr/y0;` method `p()Lcr/d$h;`                                          | Returns `SCAN_PREMIUM`, unlocking profile cards, account headers, and tier gates across the app.                                                                                                                                                                                                                                                                        |
| Subscription Status              | `Lwm/s;->B(Lln/e$e;)Z`                                                                    | Returns `true` for `SCAN_PREMIUM_SUBSCRIPTION`, `ADOBE_SCAN_PLUS`, and `ACROBAT_PREMIUM_SUBSCRIPTION`.                                                                                                                                                                                                                                                                  |
| Protect PDF Entitlement          | `Lcr/d0$a$a;` and `Lcr/y0;` method `r()Z`                                                 | Unlocked locally when **Local PDF Password Protection** is enabled.                                                                                                                                                                                                                                                                                                     |
| Combine PDF Entitlement          | `Lcr/d0$a$a;` and `Lcr/y0;` method `s()Z`                                                 | Unlocked locally when **Local PDF Combine** is enabled.                                                                                                                                                                                                                                                                                                                 |
| Export PDF Entitlement           | `Lcr/d0$a$a;` and `Lcr/y0;` method `u()Z`                                                 | Unlocked locally when **Local PDF Export** is enabled.                                                                                                                                                                                                                                                                                                                  |
| Direct Service Checks            | `Lwm/s;->y(Lln/e$g;)Z`                                                                    | Returns `true` for `EDITPDF_SERVICE`, `SCAN_PREMIUM_SERVICE`, and `ADOBE_SCAN_PLUS` unconditionally; `COMPRESSPDF_SERVICE` when **Local PDF Compression** is enabled; `PROTECTPDF_SERVICE` when **Local PDF Password Protection** is enabled; `COMBINEPDF_SERVICE` when **Local PDF Combine** is enabled; and `EXPORTPDF_SERVICE` when **Local PDF Export** is enabled. |
| Compression Quality              | `Loe/a;->isPremiumLocked()Z`                                                              | Returns `false`, making all locally implemented compression quality levels selectable during save.                                                                                                                                                                                                                                                                      |
| Compression Upsell Gate          | `Lcom/adobe/scan/android/util/a;->n()Z`                                                   | Returns `false` at index 0 when **Local PDF Compression** is enabled, removing the "Subscribe to compress files" banner in `CompressActivity`.                                                                                                                                                                                                                          |
| Worker Process Startup Guards    | `ScanApplication` (`<init>`, `onCreate`, `attachBaseContext`) & `n20/b.attachBaseContext` | Returns immediately in `:aidan_pdf` worker process before Hilt, Adobe SDKs, or SplitCompat initialize.                                                                                                                                                                                                                                                                  |
| Coordinator Initialization       | `ScanApplication.onCreate()V`                                                             | Initializes `PdfOperationCoordinator` and performs crash recovery off-main thread on startup.                                                                                                                                                                                                                                                                           |
| Local Password Protection Bridge | `Lzq/qb;->invoke(Ljava/lang/Object;)Ljava/lang/Object;`                                   | Intercepts password submission to invoke `PdfProtectionBridge.protectFile`, applying AES-256 encryption via isolated engine and updating Room DB state without Document Cloud uploads.                                                                                                                                                                                  |
| Local Password Removal Bridge    | `Lcom/adobe/scan/android/m;->q1(...)V`                                                    | Intercepts password removal to invoke `PdfProtectionBridge.unprotectFile`, stripping password offline and updating Room DB state.                                                                                                                                                                                                                                       |
| Compression Selection Bridge     | `Lcom/adobe/scan/android/services/CompressActivity$e;->invoke()Ljava/lang/Object;`        | Intercepts Compress button to invoke `PdfCompressionBridge.selectCompression`, returning `RESULT_OK` without launching cloud tasks.                                                                                                                                                                                                                                     |
| Compression Result Bridge        | `Lzq/qa;->invoke(Ljava/lang/Object;)Ljava/lang/Object;`                                   | Intercepts selection result to invoke `PdfCompressionBridge.onCompressionResult`, executing local JPEG re-compression via coordinator and preventing cloud dispatch.                                                                                                                                                                                                    |
| Local Combine Bridge             | `Lqt/u;->c(...)V`                                                                         | Intercepts Combine Files action (`0x7f142387`) to invoke `PdfCombineBridge.show`, presenting selection and reordering UI, combining pages via qpdf, and persisting to library via `ScanFileAdapter.createLocalDocument`.                                                                                                                                                |
| Local Export Bridge              | `Lqt/u;->c(...)V` & `Lzq/o3;->invoke(...)`                                                | Intercepts Export PDF action (`0x7f142395`) and Recent scan card Save as Word to invoke `PdfExportBridge.show` / `exportDocxDirect`, reconstructing text/tables into editable DOCX, XLSX, and PPTX via PDFBox and Tesseract OCR without cloud dispatch.                                                                                                                 |
| Native Library Packaging         | `lib/arm64-v8a/libaidanscanpdf.so`                                                        | Bundled via `rawResources` (qpdf 12.4.2, libjpeg-turbo 3.2.0, Leptonica 1.85.0, Tesseract 5.5.1) and marked uncompressed.                                                                                                                                                                                                                                               |
| OCR Model & PDFBox Assets        | `assets/aidan-scan-pdf/ocr/eng.traineddata` & `assets/com/tom_roush/...`                  | Bundled offline via `rawResources` for on-device OCR and font rendering.                                                                                                                                                                                                                                                                                                |
| Manifest Companion               | `AndroidManifest.xml` & `res/xml/file_provider_paths.xml`                                 | Declares isolated `:aidan_pdf` service and grants FileProvider cache path for Send Compressed and Office export sharing.                                                                                                                                                                                                                                                |

### 3. Preconditions & Verification

1. **Target Validation:** Gates on Adobe Scan `26.09.25` through `COMPATIBILITY_ADOBE_SCAN`.
2. **Compilation Verification:** Build the patch bundle with `./gradlew :patches:buildAndroid clean --no-daemon`.
3. **Metadata Verification:** Run `./gradlew generatePatchesList` and confirm that **Local Premium** exposes all four independent options.
4. **Compatibility Verification:** Run `uv run --project tools/apk-lab apk-lab check apk/com.adobe.scan.android.apkm --mpp <bundle> --package com.adobe.scan.android --all`.

---

## Patch: Remove Attribution

- **Name:** Remove Attribution
- **Target Package:** `com.adobe.scan.android`
- **Supported Versions:** `26.09.25`
- **Default State:** `true` (Enabled by default)
- **Type:** Dalvik Bytecode Patch (`bytecodePatch`)
- **Dependencies:** None
- **Compatibility:** `COMPATIBILITY_ADOBE_SCAN` (`ApkFileType.APKM`, target `26.09.25`, `minSdk` 32)
- **Options:**
  - `Remove Scan Name Attribution` (`removeScanAttribution`, default `true`): Names new scans 'Scan on [date]' instead of 'Adobe Scan [date]'.
  - `Remove Share Attribution Text` (`removeShareAttribution`, default `true`): Removes the promotional 'Created and shared using Adobe Scan.' text from shared files.

### 1. Motivation & Purpose

Adobe Scan applies brand attribution in two prominent user-facing areas:

1. When importing photos or creating new scans, the default document filename is formatted using the app name as the scan type prefix, yielding "Adobe Scan [date]" (e.g. "Adobe Scan Oct 13, 2026").
2. When sharing a scan via the OS share sheet ("Send a copy", "Send compressed") or email, Adobe Scan attaches the text "Created and shared using Adobe Scan." in `Intent.EXTRA_TEXT`.

The **Remove Attribution** patch neutralizes both forms of branding: scans are cleanly named "Scan on [date]" instead, and external shares contain only the PDF document without promotional body text.

### 2. Technical Implementation & Injection Points

| Layer                        | Target Descriptor / Anchor                                                                            | Stock Behavior                                                                     | Patched Behavior                                                                                                                                                    |
| ---------------------------- | ----------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Scan Type Evaluation**     | `Lcom/adobe/dcmscan/rename/d;->b(Context, boolean)String` (at `Context.getString` after `0x7f142073`) | Evaluates `CaptureMode.DOCUMENT` to `R.string.adobe_scan_filename` ("Adobe Scan"). | Replaces `Context.getString` call with `const-string v<dest>, "Scan on"` and nops `move-result-object`, causing composite scan names to format as "Scan on [date]". |
| **OS Share Sheet**           | `Lcom/adobe/scan/android/util/b;->r(...)Lk90/m;` (at `putExtra` for `EXTRA_TEXT`)                     | Calls `intent.putExtra("android.intent.extra.TEXT", promoString)`.                 | Replaces `putExtra` call with `nop`, ensuring the OS share chooser intent contains only the PDF attachment stream.                                                  |
| **Email Attachment Share**   | `Lcom/adobe/scan/android/util/b;->q(...)Lk90/m;` (at `putExtra` for `EXTRA_TEXT`)                     | Adds `EXTRA_TEXT` to the primary intent and each resolved email client intent.     | Replaces all `putExtra` calls referencing the `EXTRA_TEXT` register with `nop`.                                                                                     |
| **Formatted Text Generator** | `Lcom/adobe/scan/android/util/b;->j(...)String` (at `0x7f142844`)                                     | Appends `\n\n` and `share_via_email_promotion_message` to the result string.       | Replaces both `StringBuilder.append` calls with `nop`.                                                                                                              |

### 3. Preconditions & Verification

1. **Target Validation:** Gates on Adobe Scan `26.09.25` through `COMPATIBILITY_ADOBE_SCAN`.
2. **Compilation Verification:** Build patch bundle via `./gradlew :patches:buildAndroid clean --no-daemon`.
3. **Metadata Verification:** Run `./gradlew generatePatchesList`.
4. **Runtime Verification:** Deploy to device/emulator, import photo, confirm title renders "Scan on [date]", tap Share -> Send a copy, and confirm share intent Extras omit `android.intent.extra.TEXT`.
