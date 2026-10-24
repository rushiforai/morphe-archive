# Pdb (`pdb.app`)

Morphe patches for **Pdb: Personality & Friends** — the MBTI / Enneagram pen-pal
social app.

Verified target: **2.134.6** (versionCode **2694**).

## Patches

| Patch | Default | What it does |
|---|---|---|
| **Unlock Pro** | ✅ | Forces `isProUser()` true and the `ProStatus` model to Pro → every entitlement (no ads, hide online, unlimited rewinds/extends, super chats, visitors, view requests, virtual travel, extra IRL slots, Power PDB server, Wonder-chat reconnect, AI-friend limits, name colour, chat bubbles). |
| **Bypass PairIP license check** | ✅ | Pdb uses the *license-check-only* PairIP variant. Replaces `com.pairip.application.Application` with the real `pdb.app.App`, removes `LicenseActivity` + `CHECK_LICENSE`, and no-ops `LicenseClient`. |
| **Remove ads** | ✅ | Disables the ad SDK init providers (GMS, AppLovin, Vungle, Yandex) and, via the feature menu, sets the app's own `isADLibDisabled`. |
| **Allow standalone install (split-less APK)** | ✅ | `pdb_original.apk` is the App Bundle's **base** APK (`requiredSplitTypes="base__abi,base__density"`), which cannot install alone. This removes the split requirement so the single patched APK installs. |
| **Pdb Extras feature menu** | ✅ | Injects a **“Morphe — Pdb Extras”** section into Pdb's built-in Tweaks screen (Settings → tap the version row 4×) — 10 switches + 5 text overrides plus an *Extras tools* screen (JSON export / import, diagnostics, presets, any-preference writer, chat data, MMKV identity controls). |

Optional (shown for all apps, disabled by default): **Spoof app signature**,
**Spoof install source**, **Spoof Widevine / DRM**. Enable if a future build adds
a tamper check.

## Verified build

`pdb_original.apk` → `pdb_patched.apk` (the 5 patches above, no optional ones):

```
size    45,639,072 bytes
sha256  64112bfb774cb829ed0461cda7621a315aaaf6a8f15f1b879a828e997d56960b
```

`pdbverify pdb_patched.apk` → `RESULT: PASS` (manifest, injected preferences, DEX,
4 ad providers off, no PairIP left), and on device the app installs, launches with
`I/PdbExtras: extras applied: mockPro=true adOff=true …` and shows the injected
menu in Pdb's own Tweaks screen.

## Signing in

Pdb offers two ways in: **Continue with Google** and **Continue with email
verification** (hidden behind the *More* button on the login screen).

* **Use email verification on a patched install.** Google binds an OAuth client to
  the app's `packageName` + **signing-certificate SHA-1**, and Morphe has to re-sign
  the APK with a different key. Google's servers therefore reject *Continue with
  Google* with:

  ```
  This android application is not registered to use OAuth2.0, please confirm the
  package name and SHA-1 certificate fingerprint match what you registered ...
  ```

  This check runs **inside Google Play services** (a different process), so it cannot
  be fixed by the shared *Spoof app signature* patch, which only affects signature
  reads inside the app's own process. Making Google sign-in work would require the
  original signing key, or a ROM-level / MicroG signature-spoofing setup.

* Email verification is unaffected, so use it. The security code is sent to the
  address you enter.

## Device notes

Pdb is an **ARM-only** app. Its only native libraries are the MMKV binaries bundled
inside `assets/` (`libmmkv_32.so`, `libmmkv_64.so` — ARM32 / AArch64). At startup the
app extracts the 64-bit one and `System.load()`s it, so:

* On a real ARM device it works as-is.
* On an **x86_64 emulator** it only works when the image provides ARM64 translation
  (`ro.dalvik.vm.native.bridge=libndk_translation.so`) **and** Android assigns the app
  `primaryCpuAbi=arm64-v8a`. That is achieved by adding `lib/arm64-v8a/libmmkv.so` to
  the APK. The `pdbdevice` test script does this automatically; it is not part of the
  shipped patch (real devices do not need it).

## How it works

Pdb's own code is R8-obfuscated on every release, so the patches anchor on stable
signal instead of class names:

* `isProUser()` (obfuscated `zdf.V()Z`) is found by the developer backdoor string
  **`mockIsProUser`** it reads. Returning `true` covers all 17 premium call sites.
* `ProStatus` (obfuscated `l5b`) is found by its `toString()` literal
  **`ProStatus(isPro=`**; its boolean getters are forced true.
* `pdb.app.App`, `pdb.app.tweak.*`, `pdb.app.billing.*` and `com.pairip.*` are
  **kept** (non-obfuscated) class names and are used where possible.

## Feature menu

The menu reuses Pdb's **existing** Tweaks screen (a standard
`PreferenceFragmentCompat` backed by `res/xml/root_preferences.xml`, reachable from
Settings). We append a `Morphe — Pdb Extras` category and register a startup content
provider **and** an `attachBaseContext` hook in `pdb.app.App` that apply the switches
to the app's own preference store (`<pkg>_preferences`).

The extension lives in `extensions/extension/src/main/java/app/template/extension/pdb/`:

* `PdbInitProvider` / `PdbStartup` — apply defaults early.
* `PdbSettings` — key constants + prefs helper.
* `PdbTools` — the actions (JSON export/import, diagnostics, preset, reset).
* `PdbExtrasActivity` — the tools screen (plain framework widgets).

### Why the menu is flat

Pdb's Tweaks host fragment (`pdb.app.tweak.TweaksActivity$a`) implements neither
`OnPreferenceStartScreenCallback` (nested screens) nor
`OnPreferenceStartFragmentCallback` (`android:fragment` rows), and it does not
override `onPreferenceTreeClick`. Verified on device: tapping such a row only logs
`onPreferenceStartFragment is not implemented in the parent activity …` and nothing
opens. So the menu is built from the two row types that do work:

* **Switches are injected directly into the `PreferenceCategory`** — a
  `SwitchPreference` toggles inside `Preference.onClick()`, before the host is
  consulted, so it never needs host support.
* **The tools row is a plain `Preference` carrying an `<intent>`** to
  `app.template.extension.pdb.PdbExtrasActivity`, which the platform handles inside
  `Preference.performClick()`. The activity builds its screen from plain framework
  widgets, so the extension stays free of any AndroidX dependency. (An
  `AlertDialog.Builder#setItems` list is *also* inert here: the app's
  `alertDialogTheme` layout has no list panel, so only the title and message draw.)

### Opening the Extras screen

1. Sign in (email-verification flow — see below).
2. Open **Settings** (gear icon on the profile screen).
3. The **“Pdb Extras — settings, tools & unlocks”** row is at the **very top** of the
   list. Tap it: that is the whole extras screen (toggles, text overrides, tools,
   identity controls).
4. The bottom of that screen has **“Open native dev screen (Tweaks)”** — a plain
   button into Pdb's own hidden developer menu, which the stock app only reaches by
   tapping the version row 4 times (that gesture still works too).

### Always-on unlocks (no switch)

Premium and ad removal are **patch-time, always on** — they are forced by the
bytecode patches (`Unlock Pro`, `Remove ads`) plus two unconditional startup
writes, so there is nothing to toggle and nothing to forget:

| Unlock | How |
|---|---|
| All Pro entitlements | `zdf.V()` + the `ProStatus` getters forced `true` at patch time; `mockIsProUser` written on every start |
| No ads | Ad-SDK init providers disabled in the manifest at patch time; `isADLibDisabled` written on every start |

**What cannot be unlocked client-side.** A few flows stay locked with a server
*unauthorized* error — notably **changing the preferred personality types**
(`POST /api/v2/profiles/{id}/type_unlock`) and **region / virtual travel** feeds.
Those screens pass the client gate (the app really sends the request), but the
Pdb **server** checks the account's subscription record and answers 401/403. The
local `ProStatus.subscriptionBackendConfirmed` flag is already forced `true`, yet
the server only trusts its own billing record. No client patch can change that
answer; faking the response would only desync (the server-side state never
changes). The one honest lever is the app's own **free-trial offer** — the
*Force offer sheet (dev)* toggle makes Pdb show its offer/paywall sheet, and a
trial that completes through Google Play Billing makes the backend confirm Pro
for real (`kzd` then sets `subscriptionBackendConfirmed` from the purchase).

### Trackers

The *Disable trackers* patch (default-on) removes third-party telemetry at the
manifest level:

| Tracker | What happens |
|---|---|
| Google Analytics measurement (receiver, service, job service) | `android:enabled="false"` — no usage events or install pings |
| Yandex AppMetrica (preload provider, services) | disabled — the telemetry service cannot run |
| Firebase Crashlytics (3 registrars) | registered (the app calls `getInstance()` at startup — removing them crashes the app), but data collection is switched off via the official `firebase_crashlytics_collection_enabled=false` opt-out |

Kept on purpose: `FirebaseInitProvider` and the Firebase messaging receiver, so
sign-in and push notifications keep working. Remaining first-party telemetry: the
app's own A/B metrics endpoint (`metrics.personality-database.com/metrics/ab`)
is called from four obfuscated suspend functions; it is app-owned analytics, not
a third-party tracker, and is not touched.

### Switches

Every switch writes an explicit `true`/`false` to a preference **the app itself
reads**, so switching one off really reverts it on the next launch. Only things
you may want to change later are switches.

| Menu switch | Pdb preference |
|---|---|
| Read receipts off | `disableIRLMarkRead` |
| Ignore IRL “see more” | `ignoreIRLMore` |
| Stay signed in | `rememberGoogleAuth` |
| Force offer sheet (dev) | `forceShowOffer` |
| Use staging backend (dev) | `apiIsStaging` |
| Show full error messages | `showFullError` |
| Stream connect toast | `imConnectToast` |
| Force English | `forceEnglish` |
| Verbose file logging | `fileLogLevel` (`4` = info) |
| Pause Morphe Extras | *(extension-only)* |

Text fields (cleared = off): `morphe_geo_country` → `mockFeedCountryCode`,
`morphe_whitelist_host` → `whiteListHost`, `morphe_bubble_url` →
`mockBubbleEntranceURL`, `morphe_mock_latlng` → `mockLatLng`,
`morphe_instant_chat_user` → `debugInstantChatUserId`.

The values are written to the same `<pkg>_preferences` file the app's own Tweaks
screen edits, so Pdb's own switches mirror them 1:1 — e.g. `mockIsProUser` shows as
Pdb's *“Mock you as pro user”* toggle switched **on** at runtime.

“Extras tools” opens a screen with JSON export/import through the clipboard, a full
diagnostics report, a maximum-privacy preset, a reset, an any-preference writer,
read-only chat/visitor data from Pdb's SQLite files, and the MMKV identity /
realtime-socket controls.

## Rebuilding for a new Pdb version

1. Update `PDB_COMPATIBILITY` targets in `shared/Constants.kt`.
2. Re-verify the two string anchors (`mockIsProUser`, `ProStatus(isPro=`) and the
   `pdb.app.App` class still exist.
3. Rebuild the bundle and test the launches + premium toggles.
