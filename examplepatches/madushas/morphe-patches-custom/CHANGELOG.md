# Changelog

## 0.5.6 - Strava joins the bundle

**New app: Strava (com.strava) 480.15 / 485.12 / 486.9 / 486.11**

- Unlock Premium: forces the SubscriptionDetail constructor (premium, expiry
  2099, PAID, full product-access bitfield) so every client premium gate opens.
- Remove upsells: renderer gates for the Data Peek carousel, Maps "Explore
  anywhere" card, "Time to flex" replay card, "Your predictions are ready",
  "See how far you've come" and subscriber preview banners - each with a
  runtime toggle in Extra Settings (module dispatcher + 4 converters +
  performance-predictions composable, per-type defaults baked in smali).
- Remove telemetry: Sentry, Embrace, Facebook AppEvents, GA4
  (logEventInternal), first-party Room analytics DAO, Mapbox telemetry;
  GAID hard-emptied at AdvertisingIdClient; push (FCM) untouched.
- Extra Settings screen: native-looking screen in Settings with upsell
  hide-switches (live, no restart), accent display, recording touch-lock and
  patch info.
- AMOLED dark theme: dark surfaces remapped to a true-black ladder
  (48 entries).
- Custom app name: optional launcher-label rewrite (stravaAppName option).
- Recording touch lock: full-screen shield over the recording screen with a
  "tap to unlock" pill - stray taps no longer flip map/stat views or open
  sheets (on by default, toggle in Extra Settings).
- Signature spoof + original certificate re-enabled for Strava.
- Recording touch lock (persistent pill toggle, DecorView-level shield).
- SuperUser debug console export is now opt-in (suConsoleExport option,
  default off) - a security surface no stable build should expose.

All notable changes to the Pdb & MyDialog Morphe patch bundle. The Manager reads
this file to show per-app update hints and the in-app changelog.

## [0.7.2](https://github.com/madushas/morphe-patches-custom/compare/v0.7.0...v0.7.2) (2026-11-28)

### 🧹 Changes
* feat(bundle): drop adidas Running, Fitbit and TextNow (verdicts in docs/DEVLOG) — 78 patches, v0.7.2 ([e3b6495](https://github.com/madushas/morphe-patches-custom/commit/e3b6495))
* drop adidas, fitbark, textnow, googleapp targets; add universal patches, hutch ads, GmsCore extension, pairip tooling ([515bdb1](https://github.com/madushas/morphe-patches-custom/commit/515bdb1))
* welovedeals: release tidy - drop probe and diagnostic patches from the bundle ([52da9c9](https://github.com/madushas/morphe-patches-custom/commit/52da9c9))
* welovedeals: phone A/B verification + Frida/Dart probe lesson ([5190205](https://github.com/madushas/morphe-patches-custom/commit/5190205))
* welovedeals: document the Dart unchecked-entry Frida hook limitation (device-proven) ([744623c](https://github.com/madushas/morphe-patches-custom/commit/744623c))
* welovedeals: document the complete gate decode + device A/B evidence ([d9e116f](https://github.com/madushas/morphe-patches-custom/commit/d9e116f))
* welovedeals: probe script - log via android.util.Log for detached runs ([8921b68](https://github.com/madushas/morphe-patches-custom/commit/8921b68))
* welovedeals: NOP the redeem paywall gate branch (third patch site) ([82deed6](https://github.com/madushas/morphe-patches-custom/commit/82deed6))
* welovedeals: inline class-id names into probe script output (191 classes) ([b5d1d69](https://github.com/madushas/morphe-patches-custom/commit/b5d1d69))
* welovedeals: document the experimental probe patch + decoded redeem gate (phase 1) ([906b63d](https://github.com/madushas/morphe-patches-custom/commit/906b63d))
* welovedeals: final probe script - full redeem-gate decode chain ([7e1326d](https://github.com/madushas/morphe-patches-custom/commit/7e1326d))
* welovedeals: EXPERIMENTAL Frida probe patch (phase 1 - deep runtime probing) ([dcf3602](https://github.com/madushas/morphe-patches-custom/commit/dcf3602))
* welovedeals: document redeem-gate anatomy (redemption state machine vs subscription flag) ([6c56751](https://github.com/madushas/morphe-patches-custom/commit/6c56751))
* welovedeals: unlock premium by forcing has_active_subscription (Dart AOT patch) ([c3ee041](https://github.com/madushas/morphe-patches-custom/commit/c3ee041))
* welovedeals: device-verified working; map Dart-AOT premium gate; drop OferHub ([7064673](https://github.com/madushas/morphe-patches-custom/commit/7064673))
* adidas: drop 14.12.1 (full-VM check binds signature+running dexes; device-proven unpatchable) ([30d7ae2](https://github.com/madushas/morphe-patches-custom/commit/30d7ae2))
* refactor(adidas): re-form the 14.12.x PairIP pass after studying community patches ([dda1488](https://github.com/madushas/morphe-patches-custom/commit/dda1488))
* fix(adidas): re-anchor Disable trackers for 14.12.1 via the analytics SDK sinks ([ecacf67](https://github.com/madushas/morphe-patches-custom/commit/ecacf67))
* docs(strava): clarify telemetry and target scope ([a436f78](https://github.com/madushas/morphe-patches-custom/commit/a436f78))
* fix(strava): keep race banner delegate registers valid ([3b70f08](https://github.com/madushas/morphe-patches-custom/commit/3b70f08))
* fix(strava): make target resolution fail closed ([38eae2f](https://github.com/madushas/morphe-patches-custom/commit/38eae2f))
* feat(strava): add 490.15 compatibility ([a0ee33e](https://github.com/madushas/morphe-patches-custom/commit/a0ee33e))
* feat(strava): retarget upsell fingerprints ([efac9e2](https://github.com/madushas/morphe-patches-custom/commit/efac9e2))
* feat(strava): resolve version-drifted targets ([4c3a0b8](https://github.com/madushas/morphe-patches-custom/commit/4c3a0b8))
* feat(strava): broaden upsell module suppression ([79d8d7f](https://github.com/madushas/morphe-patches-custom/commit/79d8d7f))
* feat(adidas): support 14.12.1 PairIP full VM by keeping the VM alive ([4eef43a](https://github.com/madushas/morphe-patches-custom/commit/4eef43a))
* feat(welovedeals): ads pass strips the vestigial CHECK_LICENSE permission ([d74a5e8](https://github.com/madushas/morphe-patches-custom/commit/d74a5e8))
* feat(skillshare): drop Crashlytics user-identity custom keys ([969274b](https://github.com/madushas/morphe-patches-custom/commit/969274b))
* fix(fitbit): enable the GmsCore sign-in fix by default ([97e2278](https://github.com/madushas/morphe-patches-custom/commit/97e2278))
* feat(fitbit): add the rotated-key cert seed and GmsCore Google sign-in fix ([3baf4c2](https://github.com/madushas/morphe-patches-custom/commit/3baf4c2))
* docs: per-app docs for pluralsight, oferhub and welovedeals ([76270af](https://github.com/madushas/morphe-patches-custom/commit/76270af))
* feat(pluralsight): bypass PairIP and remove the reachable telemetry ([eeb2565](https://github.com/madushas/morphe-patches-custom/commit/eeb2565))
* feat(welovedeals): bypass PairIP launch gate incl. the custom-trial re-arm ([7b2b126](https://github.com/madushas/morphe-patches-custom/commit/7b2b126))
* feat(oferhub): bypass the PairIP launch gate ([53c669d](https://github.com/madushas/morphe-patches-custom/commit/53c669d))
* feat(skillshare): add off-by-default Blueshift patch and per-app docs ([450e115](https://github.com/madushas/morphe-patches-custom/commit/450e115))
* feat(skillshare): defensive ad permission strip ([27c6eb2](https://github.com/madushas/morphe-patches-custom/commit/27c6eb2))
* feat(skillshare): disable Sentry, Singular and the app-owned event sink ([a652b54](https://github.com/madushas/morphe-patches-custom/commit/a652b54))
* feat(skillshare): add client-side premium unlock patch ([338d404](https://github.com/madushas/morphe-patches-custom/commit/338d404))
* fix(nike): bypass libnike-obfuscator signing-cert gate so OIDC login works ([92d3a40](https://github.com/madushas/morphe-patches-custom/commit/92d3a40))

## [0.7.1](https://github.com/madushas/morphe-patches-custom/compare/v0.7.0...v0.7.1) (2026-11-14)

* Bundle maintenance release.

## [0.7.0](https://github.com/madushas/morphe-patches-custom/compare/v0.6.0...v0.7.0) (2026-11-13)

* Bundle maintenance release.

## [0.6.0](https://github.com/madushas/morphe-patches-custom/compare/v0.5.9...v0.6.0) (2026-11-12)

### ✨ New Features
* five new app patch sets, fail-closed guards, category metadata, tooling ([dbcbf86](https://github.com/madushas/morphe-patches-custom/commit/dbcbf86))

### 🧹 Changes
* fix(strava): close the upsell leak with a shape predicate and chokepoints ([1468ef7](https://github.com/madushas/morphe-patches-custom/commit/1468ef7))
* security: remove hardcoded account email/name from tools/pdblogin ([be5317e](https://github.com/madushas/morphe-patches-custom/commit/be5317e))

## [0.5.9](https://github.com/madushas/morphe-patches-custom/compare/v0.5.8...v0.5.9) (2026-11-12)

### ✨ New Features
* five new app patch sets, fail-closed guards, category metadata, tooling ([dbcbf86](https://github.com/madushas/morphe-patches-custom/commit/dbcbf86))
* add patch support for Hutch, Material Capsule, Nike Run Club, Fitbit/Health, adidas Running and TextNow ([e717b96](https://github.com/madushas/morphe-patches-custom/commit/e717b96))

### 🧹 Changes
* fix(strava): close the upsell leak with a shape predicate and chokepoints ([1468ef7](https://github.com/madushas/morphe-patches-custom/commit/1468ef7))
* security: remove hardcoded account email/name from tools/pdblogin ([be5317e](https://github.com/madushas/morphe-patches-custom/commit/be5317e))

## [0.5.8](https://github.com/madushas/morphe-patches-custom/compare/v0.5.7...v0.5.8) (2026-11-02)

### 🧹 Changes
* fix(pdb): soul history newest-first + honest Chat/Profile pill (channel pre-check off-thread); PdbTools.DB_EXECUTOR public ([7c54d92](https://github.com/madushas/morphe-patches-custom/commit/7c54d92))

## [0.5.7](https://github.com/madushas/morphe-patches-custom/compare/v0.5.6...v0.5.7) (2026-11-01)

### 🧹 Changes
* fix(pdb): demote Chat-button-on-profiles to expert (bad anchor on 2.135.1 — Ldra; is a different menu; blank+ANR) — v0.5.7 stable set verified: chat→profile renders ([4d3c4b2](https://github.com/madushas/morphe-patches-custom/commit/4d3c4b2))
* chore(repo): keep local app packages untracked (*.apkm/*.xapk/*.apks/*.aab, .kotlin/) ([aa7ab16](https://github.com/madushas/morphe-patches-custom/commit/aa7ab16))
* chore(build): pin patcher 2.0.1 + smali ac700e1942, record Manager 2.2.0 floor ([4cd66e1](https://github.com/madushas/morphe-patches-custom/commit/4cd66e1))
* docs: DEVLOG — cross-app screenshot contamination was co-agent interference, not an app bug ([9aa60dd](https://github.com/madushas/morphe-patches-custom/commit/9aa60dd))
* fix(pdb): async openChat + cached-user guard (blank-profile ANR), MmkvRelocate patch, DEVLOG bisection lessons ([a5a5e60](https://github.com/madushas/morphe-patches-custom/commit/a5a5e60))
* fix(manager): add CHANGELOG.md — the Manager 404s it into an empty list, which suppresses the per-app update badge; pdbrelease now maintains it ([16ffa6c](https://github.com/madushas/morphe-patches-custom/commit/16ffa6c))

## [0.5.6](https://github.com/madushas/morphe-patches-custom/compare/v0.5.5...v0.5.6) (2026-10-28)

### 🐛 Bug Fixes

* **Pdb - Soul history:** injected screens now follow the app's dark mode (the in-app appearance setting is read from MMKV; Extras + Soul history use a mode-aware palette)
* **Pdb - Soul history:** thought-bubble and other non-Soul users no longer pollute the local history (only the learned Soul card class is recorded; likes always)
* **Pdb - Soul history:** timestamps are real again (30-minute upsert dedupe instead of per-render records)
* **Pdb - Chat:** deep links carry the required host — `pdb://pdb.app/chat/{type}:{id}` and `/u/{id}` (host-less forms hit the router's blank fallback)

### ✨ New Features

* **Pdb:** native Soul history screen — every Soul profile you saw or liked, newest first, with per-entry Chat (opens your existing conversation; channels are server-created, so no channel = profile fallback)
* **Pdb:** "Chat" entry in the profile screen's ⋯ menu (the stock app has no chat CTA on profiles)
* **Pdb:** Extras power row opens the native history screen

## [0.5.5](https://github.com/madushas/morphe-patches-custom/compare/v0.5.4...v0.5.5) (2026-10-27)

### ✨ New Features

* **Pdb:** Soul history — a local record of every Soul profile you saw or liked (server keeps only a short window; likes beyond it are still recorded)
* **Pdb:** "Chat directly" power action for the last viewed profile

### 🐛 Bug Fixes

* **Pdb:** chat deep link colon format (router splits `type:id`), 30-minute upsert dedupe for seen entries, native-styled history cards
* **Pdb:** deep links need a host — `pdb://pdb.app/chat/{type}:{id}` and `/u/{id}` (verified live on device)

## [0.5.4](https://github.com/madushas/morphe-patches-custom/compare/v0.5.3...v0.5.4) (2026-10-26)

### ✨ New Features

* **MyDialog:** remove the AI assistant FAB entirely (server-driven `fabItems` resolves to nothing)
* **MyDialog:** the menu footer now shows the patch release id next to the device id

## [0.5.3](https://github.com/madushas/morphe-patches-custom/compare/v0.5.2...v0.5.3) (2026-10-25)

### ✨ New Features

* **MyDialog:** unlock hidden feature flags (`showO2A`, `showO2AShop`, `showO2ABuy`, `showUber`, `showDeleteAccount`) via a native response rewrite

## [0.5.2](https://github.com/madushas/morphe-patches-custom/compare/v0.5.1...v0.5.2) (2026-10-25)

### ✨ New Features

* **MyDialog:** kill residual beacon traffic (Facebook event queue + config fetch, CleverTap domain hijack)

## [0.5.1](https://github.com/madushas/morphe-patches-custom/compare/v0.5.0...v0.5.1) (2026-10-24)

### 🐛 Bug Fixes

* **MyDialog:** the server integrity gate passed — the spoofed signing-cert hash now returns `success:true` ("NO IMSI" fixed on re-signed builds)

### ✨ New Features

* **MyDialog:** "Spoof stock signing cert hash" patch (setAppToken resolves the stock constant)
