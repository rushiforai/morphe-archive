## 1.5.0 (2026-11-16)

### 🐛 Bug Fixes

* **boldvoice:** neutralize PairIP DRM chain to fix Play Store installer check 53e1e16
* **boldvoice:** preserve startup and complete local license state c6ff92c
* **boldvoice:** preserve StartupLauncher to fix startup crash ed98d4d
* **boldvoice:** restore PairIP virtualized startup, strings, and callbacks bceb8d6
* **chatgpt:** preserve the registered OAuth redirect in clones 5e266fa
* **linkedin:** expose premium navigation hook to app callers fd111d6
* **linkedin:** include translated settings in combined development preview 36eb695, closes #6
* **linkedin:** match settings shortcut to drawer cards 1bcdbd1
* **linkedin:** never open the full screen Premium page instead of closing it 41905b7
* **sciencenews:** bypass PairIP Play Store installer check 1f8c536

### ✨ New Features

* **boldvoice:** support BoldVoice 5.1.3 (build 470) 4167628
* **chatgpt:** add Install next to ChatGPT clone patch (v1.4.1-dev.2) ca484a9
* **linkedin:** add private performance diagnostics and report export 98ebaef
* **linkedin:** support GmsCore push notifications and enable privacy by default (v1.5.0-dev.12) bbcda7e
* **sciencenews:** support Science News Daily 23.8 (build 238) 4b168f6
* **ticktick,linkedin:** support TickTick 8.3.0.2 and LinkedIn 4.1.1272 60d5b29

## 1.5.0-dev.12 (2026-11-15)

### LinkedIn

- **GmsCore Push Notifications Fix:** Spoofs the `X-Android-Cert` request header to LinkedIn's official signing certificate when communicating with Firebase, resolving `API_KEY_ANDROID_APP_BLOCKED` and `FIS_AUTH_ERROR` so push notifications register and deliver reliably under microG / GmsCore.
- **Privacy Defaults:** Enabled **Anonymous profile viewing** and **Block tracking** by default out of the box, ensuring private profile browsing and tracking suppression without requiring manual configuration.

### Installation

Enable pre-releases for BadFella Patches in Morphe Manager and refresh Sources. Repatch the app with dev.12, then install using your existing Manager signing key to preserve app data.

## 1.5.0-dev.11 (2026-11-14)

### BoldVoice 5.1.3 (build 470, ARM64)

Complete devirtualization and PairIP neutralization fix:
- Devirtualizes and inlines the 5 startup lifecycle methods moved to external DEX.
- Restores 1,417 hoisted static strings across 32 classes via bytecode initialization.
- Restores notification callbacks (`GuardedAsyncTask.doInBackground` and `NotificationsService.onReceive`) and provides `NotificationTask`.
- Restores pristine ARM64 native shared libraries (`libreactnative.so`, `libonnxruntime.so`, and `libavformat.so`), completely severing the `libpairipcore.so` dependency and eliminating PairIP tampering detection / Play Store redirects / crashes.
- Sets `extractNativeLibs=true` to ensure shared libraries load reliably.
- Retains client-side subscription unlocks and Expo OTA protection.

### Installation

Enable pre-releases for BadFella Patches in Morphe Manager and refresh Sources. Repatch the original stock app with dev.11, then install using your existing Manager signing key to preserve app data.

## 1.5.0-dev.10 (2026-11-14)

### LinkedIn 4.1.1272

Adds French translations for the Navigation bar, More tab and newer feed settings, plus the post-copy confirmation. Download buttons now use the selected language for their accessibility labels. Other languages retain English fallback for missing translations.

### BoldVoice 5.1.3 (build 470, ARM64)

Includes the dev.9 startup correction: initializes the local license state and preserves the native VM, application wrapper and protected lifecycle methods. Retains the subscription edits and Expo OTA guard. Server-controlled authentication, scoring and content access retain their existing requirements.

### Installation

Enable pre-releases for BadFella Patches in Morphe Manager and refresh Sources. Repatch the original stock app with dev.10, then install using your existing Manager signing key to preserve app data.

## 1.5.0-dev.9 (2026-11-14)

### BoldVoice 5.1.3 (build 470, ARM64)

Corrects the local PairIP license-state handling used by the startup and Play Store checks. Keeps the native VM, application wrapper and protected lifecycle methods intact. The earlier preview disabled the outer license entry point but left the state at CHECK_REQUIRED; this preview initializes FULL_CHECK_OK and disables the inner license-check entry point and local installer restriction.

Client-side subscription edits and the Expo OTA guard are retained. Server-controlled authentication, scoring and content access retain their existing requirements.

### Installation

Enable pre-releases for BadFella Patches in Morphe Manager, refresh Sources, and apply **BoldVoice subscription features** to the original BoldVoice 5.1.3 APKS. Install the result using the same Manager signing key and preserve existing app data.

## 1.5.0-dev.8 (2026-11-14)

### 🐛 Bug Fixes

* **boldvoice:** preserve StartupLauncher to fix startup crash while keeping PairIP DRM neutralized

### BoldVoice startup crash fix

Fixes the startup crash (**"BoldVoice closed because this app has a bug"**) introduced in v1.5.0-dev.7.

The root cause was neutralizing `StartupLauncher.launch()`. StartupLauncher is required to run `VMRunner.invoke()` which initializes the obfuscated reflection method table (`androidx.constraintlayout.widget.gp.BEMMk.bRWkwQWZoKIbUe`) invoked during `MainApplication.onCreate()`. Without this initialization, `MainApplication.onCreate()` threw a `NullPointerException` immediately upon opening the app.

**Fix:**
- Preserved `StartupLauncher.launch()` so the method pointers required by `MainApplication.onCreate()` are initialized properly.
- Kept `SignatureCheck.verifyIntegrity()`, `LicenseClient.checkLicense()`, and `LicenseClient.startErrorDialogActivity()` neutralized with `return-void` to prevent the APK signature check and the Google Play licensing "Get this app from Play Store" dialog.
- Also neutralized `LicenseClient.scheduleAppShutdown()` with `return-void` to prevent delayed shutdown triggers.

## 1.5.0-dev.7 (2026-11-13)

### 🐛 Bug Fixes

* **boldvoice:** neutralize PairIP DRM chain to fix "Get this app from Play Store" dialog

### BoldVoice PairIP DRM fix

Fixes the **"Get this app from Play Store"** dialog shown after installing the patched BoldVoice 5.1.3 (build 470) outside Google Play.

The root cause was the PairIP DRM chain executing during app startup even after the manifest application-class swap:

- `StartupLauncher.launch()` is called from `MainApplication.<clinit>` and `CoreComponentFactory.<clinit>`, triggering `VMRunner` which runs the native `libpairipcore.so` DRM program.
- `SignatureCheck.verifyIntegrity(Context)` compares the APK signature against Google Play's certificate hash and throws `SignatureTamperedException` when re-signed with a different key.
- `LicenseClient.checkLicense(Context)` contacts Google Play's licensing service and, on failure, calls `LicenseClient.startErrorDialogActivity()` which displays the Play Store install dialog.

**Fix:** All four methods — `StartupLauncher.launch`, `SignatureCheck.verifyIntegrity`, `LicenseClient.checkLicense`, and `LicenseClient.startErrorDialogActivity` — are now replaced with `return-void` in DEX before the manifest is rewritten, neutralizing the entire DRM chain at the bytecode level.

## 1.5.0-dev.6 (2026-11-13)

### 🚀 Features

* **boldvoice:** support BoldVoice 5.1.3 (build 470)

### BoldVoice 5.1.3 support

Adds **BoldVoice subscription features** for com.wellocution.androidapp version 5.1.3 (build 470, ARM64). The patch unlocks client-side premium features and lessons by patching Hermes 99 bytecode targets (`hasClientPremiumAccess`, `selectIsSubscriber`, and `selectIsProSubscriber`) to return constant true. Google Play's PairIP licensing wrapper is neutralized by restoring the real application class (`com.wellocution.android.MainApplication`) and removing PairIP activities and stamp metadata. Expo OTA updates are disabled to prevent overwriting the patched bundle on launch.

### Installation

1. Enable pre-releases for the BadFella Patches source in Morphe Manager and refresh Sources.
2. Select the original BoldVoice 5.1.3 APKS.
3. Apply **BoldVoice subscription features**.
4. Install with the existing Manager signing key and keep existing app data.

### Limits

Patch-output verification covers the reviewed 5.1.3 (build 470) input. Server-side AI processing and accounts remain untouched; microphone recording, pronunciation analysis, and authentication continue to function normally.

## 1.5.0-dev.5 (2026-11-13)

### 🐛 Bug Fixes

* **sciencenews:** bypass PairIP Play Store installer check

### Science News Daily PairIP bypass

Restores the application class in AndroidManifest.xml to com.appsfornexus.sciencenews.AppController and removes the PairIP licensing activity and Google Play stamp metadata so the app launches cleanly when installed outside Google Play.

## 1.5.0-dev.4 (2026-11-13)

### 🚀 Features

* **sciencenews:** support Science News Daily 23.8 (build 238)

### Science News Daily 23.8 support

Adds **Science News Daily local subscription** for com.appsfornexus.dailysciencenews version 23.8 (build 238, ARM64). The patch reports the cached subscription flag as active (CONST_4 0, 1 return), enabling ad-free reading, premium article browsing, offline downloads, and upsell-free screens. Google Play billing callbacks, authentication, restore flows, and server verification requests remain preserved.

### Installation

1. Enable pre-releases for the BadFella Patches source in Morphe Manager and refresh Sources.
2. Select the original Science News Daily 23.8 APKS.
3. Apply **Science News Daily local subscription**.
4. Install with the existing Manager signing key and keep existing app data.

### Limits

Patch-output verification covers the reviewed 23.8 (build 238) input. Local subscription flag does not create a purchase or grant remote server-authorized content.

## 1.5.0-dev.3 (2026-11-13)

### 🚀 Features

* **ticktick:** support TickTick 8.3.0.2 (build 8302)
* **linkedin:** declare LinkedIn 4.1.1272 (build 218000) as a concrete target

### TickTick 8.3.0.2 support

TickTick 8.3.0.2 (build 8302) renames the obfuscated preferences class from `Ltv8` to `Lov8`. The reminder privacy gate now matches `Lov8->d()Z`, so the reminder scheduler still runs, and every other TickTick patch keeps its existing class, method and instruction anchors. 8.3.0.2 replaces 8.3.0.1 as the concrete target because the reminder gate's class no longer resolves on 8.3.0.1; the previous bundle remains available for that build.

### LinkedIn 4.1.1272 support

LinkedIn 4.1.1272 (build 218000) is declared as a concrete target alongside 4.1.1271 and 4.1.1267. The patches already resolve their classes, methods and instruction shapes, so no patch byte changed; Morphe and Helper for Morphe can now resolve the matching stock APK for 4.1.1272.

### Installation

1. Enable pre-releases for the BadFella Patches source in Morphe Manager and refresh Sources.
2. Select the original TickTick 8.3.0.2 APKS or LinkedIn 4.1.1272 APK.
3. Apply the TickTick or LinkedIn patches.
4. Install with the existing Manager signing key and keep existing app data.

### Limits

Patch-output verification covers the reviewed 8.3.0.2 and 4.1.1272 inputs; it does not establish phone, account or server behavior.

## 1.5.0-dev.2 (2026-11-13)

The complete 45-patch bundle retains the existing ChatGPT clone and LinkedIn improvements.

### LinkedIn 4.1.1271 (build 217900)

* Add a Diagnostics section with a 20-second performance capture, clipboard report and text-file export.
* Capture frame durations, slow-frame counts and aggregate SDUI hook timings only while the capture is running. It stops automatically and is off by default.
* Reports include versions, device model, included patches, known boolean choices, fixed event counts and extension error locations. Account identity, messages, posts, links, cookies, tokens and custom setting text are excluded. Reports stay local until copied or saved; nothing is uploaded automatically.
* Remove synchronous diagnostic log writes, verbose component-tree inspection and request-body formatting. Reuse scrolling-hook cache storage and glass-bar position buffers.
* Include the French translation update and block the Premium takeover page before it opens.

### Updating and diagnostics

Enable pre-releases for the BadFella Patches source in Morphe Manager, refresh Sources, re-patch the original LinkedIn APK and install using the same signing key.

Open BadFella Patches → Diagnostics. Start performance capture and scroll the screen that feels slow for 20 seconds. Reopen Diagnostics and use Save diagnostic report to create a text file. Review the file before sharing it. The capture adds some overhead and is diagnostic information, not a guarantee that scrolling is fixed. Results and event counts cover the current app process only.


## 1.5.0-dev.1 (2026-11-12)

The complete 45-patch BadFella Patches bundle includes ChatGPT clone support and the LinkedIn drawer layout fix.

### ChatGPT 1.2026.307

* Keep the original OAuth callback in sign-in requests instead of deriving an unregistered address from the clone package. The clone retains its separate Android package and app data.
* Check the native redirect builder before applying the change and reject changed or ambiguous code.
* If Android asks which app should handle the sign-in callback, choose the copy. Actual sign-in remains subject to the service's checks; a successful patch does not establish account sign-in compatibility.

### LinkedIn 4.1.1271

* Keep BadFella Patches below Groups with the same inset card width, icon and spacing as Puzzle games.

### Updating

Enable pre-releases for the BadFella Patches source in Morphe Manager, refresh Sources and patch the original app again with the same signing key.

## 1.4.1-dev.2 (2026-11-12)

The complete 45-patch BadFella Patches bundle includes ChatGPT clone support.

### ✨ New Features

* **ChatGPT:** add "Install next to ChatGPT" clone patch with dual OAuth redirect scheme registration for login callback handling, signature and package verification bypass, and Play Integrity escalation interception.

### Updating

Enable pre-releases for the BadFella Patches source in Morphe Manager, refresh Sources and patch the original app again with the same signing key.

## 1.4.1-dev.1 (2026-11-12)

The complete 44-patch BadFella Patches bundle includes this LinkedIn layout fix.

### Fixes

* **LinkedIn 4.1.1271:** place BadFella Patches directly after the Groups shortcut in the Me panel, with the same inset width, icon, spacing and native card styling as Puzzle games. If Groups is hidden or More items stay in their tab, settings remains available above Settings & Privacy.

### Updating

Enable pre-releases for the BadFella Patches source in Morphe Manager, refresh Sources and patch the original app again with the same signing key.

## 1.4.0 (2026-11-12)

The complete 44-patch BadFella Patches bundle includes these improvements to our LinkedIn patches.

### ✨ New Features

* **LinkedIn:** add preset and custom hex accent colors alongside wallpaper colors; give Copy text, Download and Save PDF their own post-menu icons; refine the glass navigation bar with a spring selection pill, a thin rim and no press ripple while keeping its floating inset and full-height hiding behavior.

### 🔧 Improvements

* **LinkedIn:** use Morphe's class, string and method-call indexes for theme, share-link and GmsCore patch discovery, preserving the existing checks and Google identity.
* Keep the post-text extraction and failed PDF-download cleanup fixes from 1.3.1.

### Updating

Refresh Sources in Morphe Manager and patch the original app again with the same signing key. Accent colors require Material You; glass styling requires Glass navigation bar. Restart LinkedIn after changing colors. Experimental features remain experimental.

## 1.4.0-dev.1 (2026-11-12)

The complete 44-patch BadFella Patches bundle includes these improvements to our LinkedIn patches.

### ✨ New Features

* **LinkedIn:** add preset and custom hex accent colors alongside wallpaper colors; give Copy text, Download and Save PDF their own post-menu icons; refine the glass navigation bar with a spring selection pill, a thin rim and no press ripple while keeping its floating inset and full-height hiding behavior.

### 🔧 Improvements

* **LinkedIn:** use Morphe's class, string and method-call indexes for theme, share-link and GmsCore patch discovery, preserving the existing checks and Google identity.
* Keep the post-text extraction and failed PDF-download cleanup fixes from 1.3.1.

### Updating

Refresh Sources in Morphe Manager and patch the original app again with the same signing key. Accent colors require Material You; glass styling requires Glass navigation bar. Restart LinkedIn after changing colors. Experimental features remain experimental.

## 1.3.1 (2026-11-12)

Includes the complete 44-patch bundle from v1.3.0 and all dev changes promoted into v1.3.1, across LinkedIn, TickTick, Emby, Remote for Android TV, Pep Talk, Wanderlog and Torrent Search Revolution V2. This is the full BadFella Patches bundle, with additional LinkedIn corrections.

### 🐛 Bug Fixes

* **LinkedIn:** copy actual post text, including line breaks, from the post menu instead of a tracking identifier.
* **LinkedIn:** remove temporary document slices when a PDF download fails.
* Restore copyright notices and source credits.

### Updating

Refresh Sources in Morphe Manager and patch the original app again. Keep the same Manager signing key when updating an existing patched installation. Experimental features remain experimental.

## 1.3.1-dev.1 (2026-11-12)

### 🐛 Bug Fixes

* **LinkedIn:** copy the actual post text, including line breaks, from the post menu instead of a tracking identifier; remove temporary document slices when a PDF download fails; restore copyright notices and credits.

### Notes

* Applies to the existing LinkedIn 4.1.1271 patches. Keep the same Morphe Manager signing key when updating an existing patched installation.
* Anonymous profile viewing remains experimental. These fixes do not change Google sign-in or privacy guarantees.

## 1.3.0 (2026-11-12)

### ✨ New Features

* **torrent search revolution:** add the local Pro patch for Torrent Search Revolution V2 2.3.5, covering thirteen local Pro checks across search ads, banners, native ads and Pro settings to unlock the full offline search experience and remove ads while retaining startup callbacks
* **ticktick:** support TickTick 8.3.0.1 (build 8301) across TickTick Premium, Disable analytics collection, Restore notifications and Restore reminder alarms by finding the reviewed bytecode shapes instead of the class names R8 renamed, and declare 8.3.0.1 as an explicit target so Morphe can fetch that exact version
* **linkedin:** add the Install next to LinkedIn patch for LinkedIn 4.1.1271 and 4.1.1267, which installs the patched build as a second app with its own package name, home screen name and data, so both the copy and the installed LinkedIn can be signed in side by side (closes #2)
* **linkedin:** add a Dark app icon option, Material bottom navigation icons, an Icon-only post actions option, Copy post text and an Always show navigation bar option
* **linkedin:** float the glass navigation bar above the system navigation bar, with the screen showing through the room under it, and slide it fully off screen while scrolling

### 🐛 Bug Fixes

* **linkedin:** keep the Install next to LinkedIn copy's microG spoofed package name as LinkedIn's own, so Continue with Google signs in instead of reporting an account abnormality
* **linkedin:** center the tab icons and labels inside the glass navigation bar capsule
* **linkedin:** decode bottom bar icon resources before replacing them
* **linkedin:** close an empty Premium upsell full-page takeover instead of leaving a blank screen
* **linkedin:** resolve the My Network tab from the visible tab row when swiping between feeds

### 🗑️ Removed

* **ultimea:** remove the experimental Pitch black, Hide Explorer tab and Custom font patches and the font files bundled only for them, so the bundle covers LinkedIn, TickTick, Emby, Remote for Android TV, Pep Talk, Wanderlog and Torrent Search Revolution V2

### Notes

* Patch the unmodified APKs in Morphe Manager. Keep the same Manager signing key when updating an existing patched installation.
* TickTick Premium and the Torrent Search Revolution local Pro patch change local app behavior only; they do not grant a Pro Key, a subscription or a server entitlement.
* The Install next to LinkedIn copy starts with empty data and needs its own sign-in. Select GmsCore support to sign in with Google through microG RE.

## 1.3.0-dev.10 (2026-11-12)

### ✨ New Features

* **Torrent Search Revolution V2:** add local Pro/ad-free mode for the original 2.3.5 APKS, covering thirteen local Pro checks across search ads, banners, native ads and Pro settings while retaining startup callbacks.

### Notes

* Patch the unmodified Torrent Search Revolution V2 2.3.5 APKS in Morphe Manager. Keep the same Manager signing key when updating an existing patched installation.
* This patch changes local app behavior; it does not grant a Pro Key subscription or server entitlement. Changed app bytecode is rejected for review.

## 1.3.0-dev.9 (2026-11-11)

### ✨ New Features

* **ticktick:** support TickTick 8.3.0.1 (build 8301) by finding the premium wrapper, limits, privacy gate, reminder guard and analytics provider through their reviewed bytecode shapes instead of the class names that R8 renamed, and declare 8.3.0.1 as an explicit target so Morphe sources can fetch that exact version

### Notes

* TickTick also keeps the experimental any-version target. Every patch still verifies its own anchors and fails closed on a changed one.
* TickTick Premium remains client-side only: it does not grant server AI access, cloud quota or a subscription.

## 1.3.0-dev.8 (2026-11-10)

### 🗑️ Removed

* **ultimea:** remove the experimental Ultimea patches (Pitch black, Hide Explorer tab and Custom font) and the font files bundled only for them, so the bundle covers LinkedIn, TickTick, Emby, Remote for Android TV, Pep Talk and Wanderlog again

### Notes

* Preparation of a clean baseline for the upcoming stable release after the experimental Ultimea patches are withdrawn. An already patched Ultimea install is unaffected by this bundle change.

## 1.3.0-dev.7 (2026-11-11)

### 🐛 Bug Fixes

* **linkedin:** keep the Install next to LinkedIn copy's microG spoofed package name as LinkedIn's own, so Continue with Google signs in instead of reporting an account abnormality

## 1.3.0-dev.6 (2026-11-11)

### 🐛 Bug Fixes

* **linkedin:** slide the floating glass navigation bar completely off screen when scrolling, instead of leaving half of the capsule at the bottom

## 1.3.0-dev.5 (2026-11-11)

### 🐛 Bug Fixes

* **linkedin:** float the glass navigation bar above the system navigation bar, with the screen showing through the room under it, and center the tab icons and labels inside the capsule

## 1.3.0-dev.4 (2026-11-10)

### ✨ New Features

* **linkedin:** add a Dark app icon option that paints the launcher icon background black while keeping the white "in"
* **linkedin:** add Material icons to the bottom navigation bar, filled when selected and outlined otherwise
* **linkedin:** add an Icon-only post actions option that shows Like, Comment, Repost and Send as icons without their labels
* **linkedin:** add Copy post text, so long pressing a post's text copies all of it, including the part behind "...more"
* **linkedin:** add an Always show navigation bar option that keeps the bar on screen while scrolling

### 🐛 Bug Fixes

* **linkedin:** close an empty Premium upsell full-page takeover instead of leaving a blank screen
* **linkedin:** resolve the My Network tab from the visible tab row when swiping between feeds

## 1.3.0-dev.3 (2026-11-10)

### ✨ New Features

* **linkedin:** add the Install next to LinkedIn patch for LinkedIn 4.1.1271 and 4.1.1267, which installs the patched build as a second app with its own package name, home screen name and data, so both the copy and the installed LinkedIn can be signed in side by side (closes #2)

### Notes

* The copy starts with empty data and needs its own sign-in.
* Features that check the installed package or signing certificate, such as verified app links and Google Play services based sign-in, may behave differently in the copy. Select GmsCore support as well to sign in with Google through microG RE.

## 1.3.0-dev.2 (2026-11-10)

### 🐛 Bug Fixes

* **ultimea:** make the Ultimea patches take effect on device: pitch black dark mode now replaces the reviewed dark palette tokens and the native night window colors, the Explorer/Community tab is removed from the bottom navigation and its icons are blanked, and the chosen font is injected through the Flutter font manifest so it renders across the app

### 🚀 Features

* **ultimea:** add a Custom font option with Rosemary (Samsung), Google Sans, Open Sans, Segoe UI and System Default

## 1.3.0-dev.1 (2026-11-10)

### 🚀 Features

* **ultimea:** add Pitch black AMOLED dark theme, Hide Explorer tab, and Use system font patches for Ultimea 1.4.4

## 1.2.0 (2026-11-08)

### 🐛 Bug Fixes

* **linkedin:** comprehensively eliminate promoted, boosted, and sponsored feed content (v1.2.0-dev.13) b0246b8
* **linkedin:** describe boosted and label-only promoted coverage 3efbf11
* **linkedin:** eliminate feed scroll jitter and visual flicker (v1.2.0-dev.11) 802494b
* **linkedin:** filter ads at the feed collection boundary 6fcaf21
* **linkedin:** filter sponsored items in SDUI Compose feed (v1.2.0-dev.8) 85951fc
* **linkedin:** filter the parsed feed page before it reaches the paged list 1f9dcf8
* **linkedin:** remove boosted and label-only promoted posts from the feed 4e66a05
* **linkedin:** remove promoted ads and video carousels from the feed 9534f84

### ✨ New Features

* **linkedin:** add LinkedIn 4.1.1271 feed filters and navigation options c741941
* **linkedin:** add missing Fakh patches and restore customizable navigation (v1.2.0-dev.10) daa6e59
* **linkedin:** full AMOLED pitch black theme and fix default-enabled behavior (v1.2.0-dev.12) 4aadb58, closes #000000 #0D0D0D #1A1A1A
* **linkedin:** import complete 22-patch suite and add version-agnostic support (v1.2.0-dev.9) 9be6d86

## 1.2.0-dev.13 (2026-11-08)

### 🐛 Bug Fixes

* **linkedin:** remove promoted, boosted and sponsored posts again by hiding any server-driven component that carries sponsored tracking metadata regardless of its view name, expanding sponsored URN detection and matching Promoted/Sponsored badges, and applying the same sponsored URN, boost header, lead-gen, call-to-action and promoted label checks to the legacy feed

## 1.2.0-dev.12 (2026-11-08)

### 🚀 Features

* **linkedin:** rename AMOLED black bars to Pitch black and give it the complete three tone AMOLED theme (pure black canvas, dark cards and tints) across Compose and View screens, and enable it by default once its patch is included instead of leaving it inert until the in-app switch was found

## 1.2.0-dev.11 (2026-11-08)

### 🐛 Bug Fixes

* **linkedin:** make the home feed scroll smoothly by serializing and parsing each server-driven component at most once per visibility sample instead of for every component and every nested part of every post, and by only inspecting the components that Expand posts, Tap to hide in viewers and Post menu items can edit

## 1.2.0-dev.10 (2026-11-07)

### 🚀 Features

* **linkedin:** add the Expand posts, More tab, Navigation bar, Swipe between tabs and Glass navigation bar patches from Fakh Patches, restore Customize navigation bar with Morphe options for the six bottom tabs, and make AMOLED black bars work with or without Material You

## 1.2.0-dev.9 (2026-11-06)

### 🚀 Features

* **linkedin:** import comprehensive 22-patch LinkedIn suite from Loki Patches, featuring root SDUI component filtering (`ComponentTransformer.doTransform`), in-app BadFella Patches settings, media download, and version-agnostic support across future LinkedIn releases

## 1.2.0-dev.8 (2026-11-06)

### 🐛 Bug Fixes

* **linkedin:** filter the server-driven UI feed at `SduiPagedList.addAll(Collection)` before Compose receives the page, so sponsored, promoted and suggested components no longer enter the modern home feed; also match Promoted/Sponsored accessibility labels and Videos for you carousels

## 1.2.0-dev.7 (2026-11-06)

### 🐛 Bug Fixes

* **linkedin:** filter each parsed feed page at `addAll(CollectionTemplate)` before the paged list reads its elements, which is the ingestion funnel the home feed actually uses, and check the carousel content type before the sponsored test so organic carousels such as Videos for you no longer pass the suggested-carousel filter

## 1.2.0-dev.6 (2026-11-06)

### 🐛 Bug Fixes

* **linkedin:** drop sponsored, promoted, suggested and video updates from the parsed feed page before the list accepts them, so an ad no longer takes a list slot or reaches the presenter; also match sponsored URNs, ad tracking metadata, aggregated updates and contextual labels

## 1.2.0-dev.5 (2026-11-06)

### 🐛 Bug Fixes

* **linkedin:** remove boosted and label-only promoted posts from the feed, including labels in accessibility text, supplementary actor info, headers and call-to-action cards

## 1.2.0-dev.4 (2026-11-06)

### 🐛 Bug Fixes

* **linkedin:** remove promoted and lead-gen ads that carry entity, discovery or carousel cards, and remove video carousels such as Videos for you

## 1.2.0-dev.3 (2026-11-06)

### ✨ New Features

* **linkedin:** add LinkedIn 4.1.1271 sponsored-post, promoted-job, suggested-carousel and feed-video removal, plus a customizable bottom navigation bar

## 1.1.0 (2026-11-06)

### ✨ New Features

* support reviewed patch targets without version pins 05fa478
* **wanderlog:** make dark mode follow the device theme aa6b1a8
* **wanderlog:** make the theme follow the device dark-mode setting 4cc8368

# BadFella Patches

## 1.2.0-dev.2

### ✨ New Features

* **Wanderlog:** make the theme follow the device dark-mode setting 4cc8368

Wanderlog 2.227. The dark-mode provider's value is gated on a Pro check that
stays false for non-subscribers, so the previous preview never rendered the
dark theme. The patch now runs the preference evaluation regardless of that
gate and treats the light preference as the system setting: the app is dark
when the phone is dark and light when it is light. Export to Google Maps runs
on Wanderlog's servers and is not granted by the patch. Installation: enable
pre-releases for BadFella Patches in Morphe Manager, refresh the source, and
re-patch the original stock APKM.

## 1.2.0-dev.1

### ✨ New Features

* **Wanderlog:** make dark mode follow the device theme aa6b1a8

Wanderlog 2.227. The app's dark mode entry is Pro-only and the theme
preference is set by Wanderlog's servers on subscription; the patch now makes
the app theme follow the device dark-mode setting. Export to Google Maps runs
on Wanderlog's servers and is not granted by the patch. Installation: enable
pre-releases for BadFella Patches in Morphe Manager, refresh the source, and
re-patch the original stock APKM.

## 1.0.0

TickTick, Emby, Remote for Android TV, Pep Talk and Wanderlog patches.
