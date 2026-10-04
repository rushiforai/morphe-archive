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
  - `Clean Up Auth Components` (`cleanUpAuthComponents`, default `true`): Removes the profile icon and sign-out option from the Settings menu.
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
  sget-object p2, Lcom/adobe/scan/android/ScanApplication;->C:Lcom/adobe/scan/android/ScanApplication;
  const/4 p3, 0x0
  const/4 p5, 0x0
  sget-object p4, Lcom/adobe/scan/android/ScanApplication$LoginActionType;->LOGIN:Lcom/adobe/scan/android/ScanApplication$LoginActionType;
  invoke-virtual {p2, p3, p1, p4, p5}, Lcom/adobe/scan/android/ScanApplication;->f(ZLcom/adobe/scan/android/SplashActivity$a;Lcom/adobe/scan/android/ScanApplication$LoginActionType;Lcom/adobe/scan/android/ScanApplication$LandingScreen;)Landroid/content/Intent;
  move-result-object p1
  invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
  invoke-virtual {p0}, Landroid/app/Activity;->finish()V
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
  const/4 p2, 0x0
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

### 3. Preconditions & Verification

1. **Strict Target Validation:** Gates strictly on `com.adobe.scan.android` version `26.09.25` signed with SHA-256 certificate `b6dd0562256487fcd6c98cde137858ef50d9adb9f9cd2f1ca58c5357efdf0faf`.
2. **Fail-Fast Invariants:** Every method lookup verifies the presence of the class, expected parameter count, return type, and anchor instructions before modifying bytecode; throws `PatchException` on any mismatch.
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
- **Option:** `Remove Settings` (`removeSettings`, default `true`)

### 1. Motivation & Purpose

Adobe Scan transmits first-party Adobe Experience Platform, Document Cloud, Creative SDK, Adobe Target, and Firebase Crashlytics telemetry. It also includes Branch referral attribution, Facebook App Events, AAID and install-referrer collection, Google AdMob mediation, InMobi, banner and interstitial controllers, and Google Play review prompts.

The **Remove Ads and Tracking** patch prevents these SDKs from initializing, dispatching events, loading ads, fetching Target content, sending Branch requests, reading a usable AAID, submitting Crashlytics reports, or presenting rating prompts. It forces the crash-reporting preference to `Never`, including upgrades that retain an earlier `Always` selection. Local scanning, OCR, image processing, PDF creation, and document storage remain untouched.

### 2. Technical Implementation & Injection Points

| Layer | Target descriptors | Patched behavior |
|---|---|---|
| Adobe telemetry | `MobileCore`, `Target`, `br.j`, `uc.f`, `br.d`, `br.j$g`, `br.j$h` | Stops MobileCore actions, privacy updates, and states; Target mbox requests; Document Cloud analytics; analytics-monitoring broadcasts; and Edge consent traffic. |
| Creative SDK telemetry | `com.adobe.creativesdk.foundation.internal.analytics.n`, `g` | Stops Creative SDK event reporting and ETS upload scheduling. |
| Crash reporting | `util.l.r1`, `util.l.q0`, `FirebaseCrashlytics` | Forces the crash preference to `Never` (both setter and getter), neutralizes previous-execution crash detection, and prevents report submission, exception recording, logging, user identification, and custom-key collection. |
| Ads | `ar.k`, `ar.u`, `ar.x`, `ar.c`, `ar.s`, `InMobiSdk` | Forces ad eligibility checks to `false`; prevents banner and interstitial loads, ad-event reporting, and InMobi initialization. |
| Attribution | `g90.e`, `g90.e0`, `g90.o0` | Disables Branch lifecycle tracking, blocks its request queue, and permanently enables its tracking-disabled state. |
| Facebook | `AppEventsLoggerImpl`, `AppEventsLoggerImpl$Companion` | Stops App Events dispatch at both public logger and companion queue entry points. |
| Advertising identity | `AdvertisingIdClient`, `AdvertisingIdClient$Info`, `yv.a` | Returns `00000000-0000-0000-0000-000000000000` with limit-ad-tracking enabled and prevents Play Install Referrer connection. |
| Review prompts | `util.l`, `zq.ha` | Makes the rating predicate `false` and dismisses a dialog if a direct path creates one. |

Every required target lookup validates its class, exact parameter types, return type, and implementation before modifying the method. A missing or mismatched target throws `PatchException`; the optional `br.j.a0(h90.d)` variant is skipped when absent.

When **Remove Settings** is enabled, the patch hides the `USAGE INFO` category after `PreferencesFragment` loads it (containing **Send usage info**, its explanatory link, and **Send crash info**) and suppresses the cold-start crash reports prompt dialog (`com.adobe.scan.android.b` and its factory `b$a.a`). Its telemetry backends are disabled independently of this UI option.


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
  - `Fill & Sign` (`removeFillAndSign`, default `true`): Removes the Fill & Sign item from the File Options bottom sheet.
  - `Open in Adobe Acrobat` (`removeOpenInAcrobat`, default `false`): Removes the Open in Adobe Acrobat option from file option menus and the preview screen.
### 1. Motivation & Purpose

The Settings menu and file menus in Adobe Scan feature non-essential promotional, rating, external support, and Play Store redirection links that clutter the view. When combined with login removal, the menus cleanly focus on core scanner preferences and local tools. The **Remove Useless/Promotional Items** patch allows users to selectively remove About Adobe Scan, Help, Rate app, Online support forum, Share this app, and the promotional Fill & Sign option (which otherwise opens the Play Store if the external app is uninstalled), while automatically removing the empty bottom category header (gray bar) when all support items are hidden.

### 2. Technical Implementation & Injection Points

| Layer | Target Descriptor / Anchor | Injected Behavior |
|---|---|---|
| **Preference Inflation** | `Ljt/v2;->E(Ljava/lang/String;)V` (after `b.F`) | Sets `C(false)` (`setVisible(false)`) on selected preferences (`0x7f141f71`, `0x7f141f73`, `0x7f141f78`, `0x7f141f72`, `0x7f141f79`). If all support items are removed, hides the parent `PreferenceCategory` (`v0.J.C(false)`), eliminating the 72px gray separator bar. |
| **Rate App Visibility Override** | `Ljt/v2;->onCreate(Landroid/os/Bundle;)V` (after last `Preference.C(Z)V`) | Injects `const/4 p1, 0x0 \n invoke-virtual {v0, p1}, Landroidx/preference/Preference;->C(Z)V` to ensure Rate app remains hidden even if Google Play Services availability checks evaluate to `true`. |
| **File Options Fill & Sign** | `Lqt/u;->a(...)Lm90/b;` (before `IF_EQZ` for `0x7f142619`) | Injects `const/4 v<reg>, 0x0` immediately before the conditional branch guarding Fill & Sign creation, bypassing item instantiation and preventing Play Store redirection prompts. |
| **Open in Acrobat** | `Lqt/u;->a(...)Lm90/b;`, `Lvt/b2;->a(...)V`, `Lut/r0;-><init>(...)V` | Neutralizes addition of `0x7f142617` in the File Options bottom sheet, nulls out `Lvt/r4;->e` in the preview bottom toolbar array for `Ll90/s;->u`, and trims `r0.d` to `{Share, SaveAsJpeg}`. |

### 3. Preconditions & Verification

1. **Target Validation:** Gates on `com.adobe.scan.android` version `26.09.25`.
2. **Compilation Verification:** Build patch bundle via `./gradlew :patches:buildAndroid clean --no-daemon`.
3. **Metadata Verification:** Run `./gradlew generatePatchesList`.
4. **Runtime Verification:** Apply patch with `-e "Remove Useless/Promotional Items"`, install on `emulator-5554`, verify Settings shows only `Preferences` with no gray separator bar, and verify File Options bottom sheet omits `Fill & Sign`.

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

| Layer | Target | Injected behavior |
|---|---|---|
| AndroidX font loading | `Lp6/h;->b(Context, int, TypedValue, int, h$c, boolean, boolean)` | Calls `SystemFontBridge.getSystemTypeface(context, resourceId, style, callback)` and returns its system typeface before AndroidX resolves an Adobe Clean resource. |
| Compose typography | `Lod/e5;->a()Li5/p;` | Returns `Li5/p;->a:Li5/n;` (`FontFamily.Default`) directly, bypassing Compose font-resource resolution. |
| Creative SDK text view | `CreativeSDKTextView.setTypeface(Typeface)` | Delegates to `androidx.appcompat.widget.c0.setTypeface`, bypassing `fonts/AdobeClean-SemiLight.otf` asset loading. |

`SystemFontBridge` maps resource-entry keywords to weight: `light` to 300, `medium` to 500, `bold` to 700, and unspecified names to 400. It combines those values with supplied bold and italic style bits; API 28 and newer use `Typeface.create(Typeface.DEFAULT, weight, italic)`, while older releases use the equivalent legacy style. When AndroidX supplies a font callback, the bridge invokes its `c(Typeface)` method on the main looper.

### 3. Preconditions & Verification

1. **Strict Target Validation:** The patch requires the exact ResourcesCompat method signature, Compose accessor, and Creative SDK `setTypeface(Typeface)` implementation; a missing or mismatched target throws `PatchException`.
2. **Compilation Verification:** Build the extension and patch bundle with `./gradlew :extensions:extension:compileReleaseJavaWithJavac` and `./gradlew :patches:buildAndroid`.
3. **Bytecode Verification:** Apply the bundle and confirm the three target methods begin with the bridge call, `FontFamily.Default` return, and AppCompat superclass call respectively.

---

## Patch: Unlock Premium

- **Name:** Unlock Premium
- **Target Package:** `com.adobe.scan.android`
- **Supported Versions:** `26.09.25`
- **Default State:** `false` (Opt-in)
- **Type:** Dalvik Bytecode Patch (`bytecodePatch`)
- **Dependencies:** None
- **Compatibility:** `COMPATIBILITY_ADOBE_SCAN` (`ApkFileType.APKM`, target `26.09.25`, `minSdk` 32)
- **Options:**
  - `Remove Broken Features` (`removeBrokenFeatures`, default `true`): Removes the cloud-only Generative summary action from File Options.
  - `Enable Cloud Tools (Experimental)` (`unlockCloudTools`, default `false`): Enables Combine, Export, and Protect PDF only for signed-in accounts with compatible Adobe Document Cloud access.

### 1. Scope

The **Unlock Premium** patch enables locally executable premium document actions in a signed-out, offline workspace: OCR beyond the free-page limit, document editing, PDF compression, and page organization. It neither creates an Adobe account nor alters billing, purchase persistence, restore-purchase flows, or subscription transport.

Cloud-dependent actions remain unavailable by default. Export PDF and Combine PDF require Document Cloud upload and server processing; Password Protect invokes Document Cloud's `DCPasswordEncrypt` action; and Generative summary requires Adobe's GenAI backend. Enabling these checks while offline produces pending-upload or network failures rather than a usable local tool.

### 2. Technical Implementation & Injection Points

| Layer | Target descriptors | Patched behavior |
|---|---|---|
| Unauthenticated entitlements | `Lcr/d0$a$a;->d()Z`, `e()Z`, `j()Z`, `n()Z` | Returns `true` for Compression, Edit PDF, OCR page-limit, and Scan Premium core gates used with **Remove Login**. |
| Authenticated entitlements | `Lcr/y0;->d()Z`, `e()Z`, `j()Z`, `n()Z` | Returns `true` for the same local tools when an active user session selects the authenticated entitlement implementation. |
| Direct service checks | `Lwm/s;->y(Lln/e$g;)Z` | Returns `true` only for `COMPRESSPDF_SERVICE`, `EDITPDF_SERVICE`, and `SCAN_PREMIUM_SERVICE` before the IMS-session gate. All other service types retain stock behavior. |
| Compression quality | `Loe/a;->isPremiumLocked()Z` | Returns `false`, making all locally implemented compression quality levels selectable. |
| Experimental cloud tools | `Lcr/d0$a$a;` and `Lcr/y0;` methods `r()Z`, `s()Z`, `u()Z` | When **Enable Cloud Tools (Experimental)** is on, enables Protect, Combine, and Export entitlement UI. It does not bypass sign-in, upload, network, or Document Cloud server requirements. |
| Generative summary | `Lqt/u;->a(...)Lm90/b;` | When **Remove Broken Features** is on, forces the GenAI gate false so the File Options bottom sheet omits the unusable Generative summary item. |

The global entitlement cutover replaces caller-local synthetic-lambda hooks. Consequently, File Options and File Browser share the same compression and edit result, and Preview's OCR-page-limit check reads the unlocked `j()` predicate. Every target lookup validates the exact descriptor, method signature, return type, and implementation; missing or changed targets throw `PatchException`.

### 3. Preconditions & Verification

1. **Target Validation:** Gates on Adobe Scan `26.09.25` through `COMPATIBILITY_ADOBE_SCAN`.
2. **Compilation Verification:** Build the patch bundle with `./gradlew :patches:buildAndroid clean --no-daemon`.
3. **Metadata Verification:** Run `./gradlew generatePatchesList` and confirm that **Unlock Premium** exposes both options.
4. **Bytecode Verification:** After applying to the target APKM, confirm that `Lcr/d0$a$a;` and `Lcr/y0;` methods `d`, `e`, `j`, and `n` begin with `const/4 v0, 0x1` and `return v0`; `Loe/a;->isPremiumLocked()Z` begins with `const/4 v0, 0x0`; and `Lqt/u;->a` omits Generative summary with its removal option enabled.
