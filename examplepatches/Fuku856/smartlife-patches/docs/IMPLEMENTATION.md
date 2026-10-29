# SmartLife Patches — implementation status & roadmap

Target analysed: **SmartLife 7.12.0** (versionCode 866, APKM, minSdk 24 / target 36),
package `com.tuya.smartlife`, signer `CN=www.tuya.com`
(SHA-256 `0fc361999cc0c35ba8aca57daa5593a20cf55727702ea85ad7b3228949f888fe`).

## How SmartLife feature gating works (the three stable handles)

R8 obfuscates method and helper-class names, but these are stable across versions
and are what the patches target:

1. **`res/values/bools.xml`** — ~300 `<bool>` feature flags. The app reads the local
   bool first (obfuscated `L.getBoolean`, via `hhl`/`ihl`) before any remote override.
   Flipping these is the most robust, lowest-risk mechanism.
2. **`assets/module_app.json`** — startup `pipeLine` list + `serviceMap`
   (interface → impl). Removing an entry stops a subsystem from starting / resolving.
3. **`assets/tab_config.json`, `assets/home_fragment_new.json`,
   `assets/personal_center_config_list.json`** — tab set, home card order, "me" tab rows.

## Build & verification status (2026-10-25)

Verified end-to-end on this machine: build (Gradle 9.8.1 / JDK 21) -> patch (Morphe
Desktop 1.19.0 CLI) -> install (Android 16 emulator). All 4 patches apply and the
bundle builds to `patches/build/libs/patches-1.0.0.mpp`.

- **Resource patches confirmed in the patched APK**: 13 AI/ads/telemetry bools flipped
  true -> false (e.g. `is_ai_assistant_support`, `is_admob_support`,
  `firebase_analytics_enable`); unrelated flags untouched (no over-reach).
- **Signature self-check**: the app ships a native integrity check
  (`com.thingclips.smart.security.watchdog`) that, after re-signing, showed
  "integrity check failed" and self-terminated after ~3.8s. The library-level
  getPackageInfo spoof did NOT defeat it (the check reads signatures via native code).
  A Parcel-level spoof (`PackageInfo.CREATOR` replacement + cache clear, in
  `extensions/smartlife/.../SignatureSpoof.java`) **does** defeat it: the app now
  launches and stays alive on the normal first-run privacy screen. Original cert
  extracted from the APK (SHA-256 matches `0fc3...88fe`).
- **module_app.json pipelines removed & verified**: 8 ad + 9 telemetry + 12 AI startup
  pipelines stripped from the patched APK (JSON intact, no `,,`/`[,`/`,]`); the app still
  launches to the privacy screen with no crash or ClassNotFound.
- **AI bar bytecode gate: intentionally not added (redundant).** The bar's visibility
  method `B2()` reads `is_ai_assistant_support` through the LOCAL-only config path
  (`hhl.e`, not the remote-overridable `hhl.a`), so the flipped bool is authoritative. A
  bytecode gate on the obfuscated method would be more version-fragile, not less.
- **Not yet verified (needs the user)**: tapping through the privacy consent and
  logging in with a real Tuya account to confirm visually in the home UI that the AI
  bar / AI tab / ads are gone. The bool flips that drive these are confirmed in the
  APK, but the on-screen result is behind the login gate.

## Implemented now (resource layer — bools.xml)

| Patch | File | Flags set to false |
|-------|------|--------------------|
| Disable AI features | `ai/DisableAiPatch.kt` | `is_ai_assistant_support`, `is_ai_phone_support`, `support_ai`, `is_support_on_app_ai`, `is_aiAssistant_show_in_nav`, `is_aiAssistant_show_in_deeppull`, `ai_assistant_support_{action,greeting,inspiration}`, `support_ai_memory_manage`, `support_ble_gpt`, `batch_setting_xiaozhi`; + option: `support_agent_tab`, `assistant_tab` |
| Hide ads | `ad/HideAdsPatch.kt` | `is_admob_support`, `is_admob_banner_badge_enabled`, `is_marketing_advertising_support` |
| Disable telemetry | `misc/telemetry/DisableTelemetryPatch.kt` | `firebase_analytics_enable`, `firebase_crash_enable`, `is_open_page_auto_track` |

Each is ON by default and reversible via Morphe patch options. Unknown flags on a
different app version are skipped with a warning (not a hard failure).

## Next increments (need a build→install→test loop)

These were scoped from the APK but are intentionally **not** written blind, because
they depend on matching obfuscated code and on an iterative build loop:

- **assets/module_app.json removal** — DONE & verified (assets ARE editable via `get()`):
  drop pipelines `AdvertisementManagerPipeline`, `PidAdvertisePipeline`,
  `ActivityAdPushManagerPipeline`, `StatPipeLine`/`StatUploadInitPipeline`,
  `LogUploadPipeLine`, `ApiEventPipleLine`, `AutoPageTrackerPipeLine`,
  `AttributionConfigPipeline`, `AiModelManagerPipeLine`, `AIRecommendSwitchPipeline`,
  `AITodoPipeline`, `ProactiveServiceStartPipeline`, `VoiceServicePipeline`; and the
  matching `serviceMap` impls (`AbsAdvertisementService`, `FirebaseAnalyticsService`,
  `AppsFlyerService`, `AbsActivityAdPushService`, `AbsMarketingBoothService`, …).
  Risk: removing a service an active screen resolves can crash on open → gate behind
  per-item options and test.
- **UI config edits**: remove `ThingMainPageMarketing` / `ThingMainPagePidBanner` /
  `ThingShoppingMall` from `home_fragment_new.json`; `personal_center_advertising` /
  `personal_center_welfare_banner` / `personal_center_mall` from
  `personal_center_config_list.json`; AI/agent tab from `tab_config.json`.
  (Confirm the Morphe patcher exposes `assets/` as editable files; if not, edit via a
  bytecode hook on the asset loader instead.)
- **AI bar final gate** (bytecode): `com.thingclips.smart.ai.assistant.api.AIAssistantEnableService`
  impl `()Z` visibility methods → return false. Device-panel floating ball:
  `com.thingclips.smart.panel.common.ai.AIBarContainerMonitor` injection site.
- **Settings screen (2 entry points)** + extension module:
  - top of `com.thingclips.smart.personal.setting.plug.activity.SettingActivity`;
  - long-press on `com.thingclips.smart.personal.center.plug.cell.toolbar.setting.ToolbarSettingCell`.
  Needs `extensions/smartlife` to depend on `morphe-extensions-library` (BaseSettings /
  BooleanSetting), androidx-preference and hiddenapibypass, plus app-class stubs.
- **Disable force app update** (bytecode): the `Business` subclass issuing
  `thing.m.app.version.upgrade` and reading `force_update` / `upgradeType`.
- **Spoof signature**: DONE — custom Parcel-level spoof in `extensions/smartlife`
  (the library wrapper was insufficient against the native check).

## Building (required to verify)

The Morphe gradle plugin and `morphe-patches-library` are served from **GitHub Packages**,
which needs a token with the **`read:packages`** scope. The `gh` CLI token in this
environment does **not** have that scope, so the project cannot be built/verified here yet.

1. Create a GitHub PAT (classic) with `read:packages`.
2. Put it in `gradle.properties` (git-ignored) or env:
   ```
   gpr.user=Fuku856
   gpr.key=<PAT with read:packages>
   ```
   (or `GITHUB_ACTOR` / `GITHUB_TOKEN`).
3. `./gradlew :patches:buildAndroid` → `patches/build/libs/patches-*.mpp`.
4. Apply to SmartLife 7.12.0 APKM with Morphe Desktop/Manager and install to a device/emulator.

## Verification checklist

- Login with email/phone + password still works (needs the Spoof signature patch).
- Home AI bar, AI tab and device-panel floating ball are gone.
- No in-app ads / home banners / "me" tab ad rows.
- No forced-update dialog.
- App does not crash on launch; toggling each option OFF restores the feature.

## 2026-10-25 (increment 2): AI runtime toggle + in-app settings
- AI disable converted from baked bool-flip to a RUNTIME gate on usk.c (fingerprinted by log strings); toggled in-app. bool-flip + AI pipeline removal dropped so the toggle is authoritative.
- In-app "SmartLife Patches" screen (AlertDialog + Switch, framework only) in extensions/smartlife; app context captured in SignatureSpoof.attachBaseContext.
- Two entry points (both long-press): profile-tab settings button (ToolbarSettingCell.k) and the Settings-screen toolbar (SettingActivity.initToolbar).
- Verified: all 5 patches apply (fingerprints resolved), app launches with no crash/VerifyError. NOT verified (needs login): the screen actually opening and the toggle effect.
- Scope note: the runtime AI toggle covers the AI bar / B2-gated entries (via usk.c). The AI tab and sub-feature flags are not covered by this toggle v1. Ads/telemetry stay patch-time.
- Entry point #1 is a toolbar long-press, not a settings-list row: adding a real RecyclerView/Archer row is adapter surgery that needs login to verify placement.

## 2026-10-25 (increment 3): fixes from real-device test
- **Bug: toggles did not persist.** `SignatureSpoof.attachBaseContext` stored
  `base.getApplicationContext()`, which is still null during Application.attachBaseContext
  (the framework registers the Application only after it returns). The settings context was
  therefore null, so writes were silently dropped and reads always returned the default (ON).
  Fix: store the Application itself (`init(this)`), fall back to the Activity context when the
  screen opens and to `ActivityThread.currentApplication()`, write with `commit()`, and show a
  toast + revert the switch if a save ever fails (never silently drop a change).
- **New: "Hide home recommendations"** (runtime toggle, default ON): hooks
  `FindMoreDataSource.buildAllPitList` (the only builder of the home "おすすめ" cards) to return
  an empty list.
- Settings screen is now localized (Japanese when the device language is Japanese).
