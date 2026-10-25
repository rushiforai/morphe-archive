# CapCut Patches Guide

Technical documentation and patch catalog for CapCut on Android.

---

## 1. Target & Compatibility

| Property | Value |
| :--- | :--- |
| **Target App** | CapCut |
| **Package Name** | `com.lemon.lvoverseas` |
| **Target Version** | `19.9.0` |
| **Target Package Format** | standalone APK |
| **Primary Architecture** | `arm64-v8a` |
| **Authoritative Source** | APKMirror |
| **Download Target** | [CapCut 19.9.0 (arm64-v8a, nodpi, versionCode 19900002)](https://www.apkmirror.com/apk/bytedance-pte-ltd/capcut/capcut-video-editor-19-9-0-release/capcut-video-editor-19-9-0-android-apk-download/) |

---

## 2. Applied Patches Catalog

| Patch Name | Typology | Default State | Dependencies | Description |
| :--- | :--- | :--- | :--- | :--- |
| **Block Telemetry & Trackers** | `bytecodePatch` | `true` (Enabled) | `CapCut Telemetry Manifest Purge` | Neutralizes Google AppMeasurement, AppsFlyer, ByteDance AppLog, APM/Slardar, Gecko, Pitaya, BDTuring, and UserGrowth event dispatchers. |
| **CapCut Telemetry Manifest Purge** | `resourcePatch` | `false` (Opt-in) | None | Strips 6 advertising/tracking permissions, disables measurement/analytics/attribution components (AppMeasurement, AppLovin, Vungle, BDInstall, ByteDance AppLog Collector, LogService, Pangle), prunes analytics discovery registrars (MLKit/messaging/crashlytics preserved), injects 8 opt-out metadata flags. |
| **Locale Assets Slimmer** | `resourcePatch` | `false` (Opt-in) | None | Strips unselected assets/locales/*.json bundles via locales option (default en). English always preserved. res/values-* tables are covered by the canonical universal Remove Extra Languages patch. |
| **Bypass Effects Region Restriction** | `bytecodePatch` | `true` (Enabled) | None | Spoofs device_platform to "windows" and resets deviceId in EffectConfiguration to bypass ByteDance Shark WAF effect loading blocks. |
| **Bypass GeoBlock Region Restriction** | `bytecodePatch` | `true` (Enabled) | None | Forces CapCut GeoBlock config lists (cert, dock, entrance, page, scheme) to empty so region-blocked surfaces stay enabled. Server-refused content may still fail to load. |
| **Bypass Signature Check** | `bytecodePatch` | `true` (Enabled) | None | Spoofs official APK SHA-256 signature, suppresses signature blacklist and abnormal-source toasts, disables Godzilla inject detection, stubs the cracking verdict persistence plus the security dialog render, and neutralizes the template-feed cracking interceptor so re-signed builds are not blocked, plus stubs Pangle PGL signature verification gates. |
| **Bypass Unsafe Package Modal** | `bytecodePatch` | `true` (Enabled) | None | Rewrites Lynx schema default fallback URL from unsafe-package modal to template portal to bypass security notice dialogs. |
| **Unlock Premium** | `bytecodePatch` | `true` (Enabled) | None | Forces VIP and subscription gates to return true (SubscribeImpl, PayVipImpl, UserVipInfo, UserDetailInfo, VipUserServiceImpl, SubscribeCloudImpl), plus central account-status flags. |
| **Native Bloat Slimmer** | `rawResourcePatch` | `false` (Opt-in) | None | Zeroes AppLovin crash-reporter .so in-situ across arm64-v8a/armeabi-v7a; optional trimSpeechEngines toggle zeroes speech .so libs (breaks voice features). |
| **Remove Watermark** | `bytecodePatch` | `true` (Enabled) | None | Forces watermark-removal gates and the default ending gate to allow export without watermark or outro. |
| **Unlock Ultra HD Export** | `bytecodePatch` | `true` (Enabled) | None | Enables Ultra HD and 4K video export options by unlocking high-resolution export eligibility gates. |
| **Unlock Premium Templates** | `bytecodePatch` | `true` (Enabled) | None | Marks premium template styles as available so locked template features stay usable. |
| **Redirect API to v2 Boot** | `bytecodePatch` | `false` (Opt-in) | None | Loads effects, feeds and templates where default endpoints are blocked by using official alternate endpoints. |

---

## 3. Deep Technical Breakdown

### A. Manifest Purge Layer (`resourcePatch`)

1. **CapCut Telemetry Manifest Purge**:
   - **Objective**: Prevent tracker initialization, install attribution, and background telemetry collection.
   - **How**: Strips advertising and attribution permissions from the manifest, disables tracking, install attribution, and dynamic ad components (including VungleProvider, BDInstallProvider, AppLog Collector, LogService, and Pangle BinderPoolService), prunes discovery registrars, and injects opt-out flags.

### B. Bytecode Dispatcher Neutralization Layer (`bytecodePatch`)

1. **Block Telemetry & Trackers**:
   - **Objective**: Stop runtime telemetry event dispatching across first-party and third-party tracking pipelines.
   - **How**: Intercepts event logging entrypoints (Google AppMeasurement, CapCut AppsFlyerAnalytics and AppsFlyer delegate entrypoints, ByteDance AppLogInstance event dispatchers, APM/Slardar, Gecko, Pitaya, BDTuring, and UserGrowth dispatchers) and injects immediate void returns, and neutralizes the TempStatics network interceptor as a passthrough.

2. **Bypass Effects Region Restriction**:
   - **Objective**: Restore loading of effects, transitions, and templates blocked by region firewalls.
   - **How**: Spoofs the device platform parameter to "windows" and resets the device identifier to zero in effect requests.

3. **Bypass GeoBlock Region Restriction**:
   - **Objective**: Keep region-restricted application entrypoints and pages accessible.
   - **How**: Forces internal geographic restriction configuration lists to return empty lists.

4. **Bypass Signature Check**:
   - **Objective**: Allow re-signed application packages to run without integrity errors or tamper alerts.
   - **How**: Returns the official APK signature hash during telemetry checks, clears the signature blacklist, silences tamper toasts, disables injection detection gates, stubs the cracking verdict persistence plus the security dialog render, and neutralizes a second cracking interceptor on the template feed (it would otherwise relaunch the notice on specific server verdicts) so the blocking notice can never display, and stubs Pangle PGL signature verification gates.

5. **Bypass Unsafe Package Modal**:
   - **Objective**: Prevent blocking security warning dialogs on startup.
   - **How**: Rewrites Lynx schema default fallback addresses to point directly to the template portal instead of the security notice dialog.

6. **Unlock Premium**:
   - **Objective**: Enable VIP editing capabilities and premium user interface elements locally.
   - **How**: Forces subscription status and VIP account entitlement checks to return true, including central account-status flags.

7. **Remove Watermark**:
   - **Objective**: Allow exporting videos without watermark by unlocking watermark removal options.
   - **How**: Overrides watermark eligibility checks and scene removal gates to allow export without watermarks, disables the default-on brand watermark flag, and forces the default ending gate off so exports ship without the outro.

8. **Unlock Ultra HD Export**:
   - **Objective**: Keep Ultra HD and 4K video export options available during export.
   - **How**: Forces template export Ultra HD availability and feature gates to return true, bypassing high-resolution export restrictions. This also enables HD in flows that consult these gates even when a stored per-template HD preference is off.

9. **Unlock Premium Templates**:
   - **Objective**: Keep locked premium template styles and features usable in the template editor.
   - **How**: Overrides template purchase feature flags in the template view-model, forcing access and style availability gates to return true while disabling purchase restrictions.

10. **Redirect API to v2 Boot**:
    - **Objective**: Restore loading of effects, templates, feeds, and commerce/passport features in regions where default API hosts return choking or rate-limiting responses ("Too many people are using this feature now. Try again later").
    - **How**: Performs client-side bytecode const-string rewrites on candidate methods across the DEX string pool, mapping verified functional hosts (`editor-api.capcutapi.com`, `feed-api.capcutapi.com`, `commerce-api.capcutapi.com`, `passport-api.capcutapi.com`) to official alternate v2-boot hosts (`editor-api-v2-boot.capcutapi.com`, `feed-api-v2-boot.capcutapi.com`, `commerce-api-v2-boot.capcutapi.com`, `passport-api-v2-boot.capcutapi.com`). Note: both `editor-api.capcut.com` and `i18n-api.faceueditor.com` were pruned per Rule R2 as their 2 occurrences each in classes20.dex are non-executable pool entries rather than rewritable bytecode const-strings (all active editor endpoints use `editor-api.capcutapi.com`). Telemetry and tracker hosts (APM/Slardar `mon.*`, Gecko `*gecko*`, AppLog `log.*` / `i.*`, BDTuring `vcs-*`, Pitaya, UserGrowth) are strictly excluded from redirection because their dispatchers are already neutralized in Block Telemetry & Trackers and must remain inactive.

### C. Resource and Binary Debloat Axes

1. **Locale Assets Slimmer (`resourcePatch`)**:
   - **Objective**: Reduce package size by removing unneeded CapCut asset language bundles.
   - **How**: Deletes unselected `assets/locales/*.json` files while preserving English. `res/values-*` string tables are left to the canonical universal Remove Extra Languages patch.

2. **Native Bloat Slimmer (`rawResourcePatch`)**:
   - **Objective**: Reduce disk space by stripping unused native libraries.
   - **How**: Empties target crash reporter and optional speech recognition binaries directly within the native library directories.

---

## 4. Behavioral Hazards Warning

1. **Opt-in Status**:
   Telemetry, resource slimmer, and API v2-boot redirection patches are opt-in and disabled by default.
2. **Locale Assets Slimmer**:
   Asset language bundles for stripped languages will fall back to English. res/values-* tables are untouched by this patch.
3. **Native Bloat Slimmer**:
   Stripping speech recognition and synthesis engines disables voice effects, text-to-speech, and automatic captions.

---

## 5. Known Limitations

1. **Templates Catalog**:
   The templates feed returns an empty list on re-signed builds due to remote signature verification.
2. **Security Modal Re-prompting**:
   The unsafe package modal dialog render and its verdict persistence are stubbed, so the blocking notice cannot display even when remote verdicts evaluate. Server-refused content (Templates catalog) may still fail to load.
3. **Cloud VIP Assets**:
   Remote cloud-hosted VIP assets and server-validated processing remain locked.
4. **Server-Side Capacity and Region Rejections**:
   The API v2-boot redirection routes requests to official alternate endpoints to bypass region-level choking ("Too many people are using this feature now"), but server-refused content or endpoints that require server-side cryptographic attestation / unbanned IP ranges may still refuse requests.

---

## 6. Canonical Universal Patches

The generic maintenance patches removed from this guide (screen densities, `res/values-*` languages) are covered by the universal patches in the canonical collection [kveld-morphe-patches](https://github.com/kveld9/kveld-morphe-patches): `Remove Unused Screen Sizes` and `Remove Extra Languages`. For further generic maintenance (packaging leftovers, background sync, native trackers, telemetry) that collection also provides `Clean App Packaging`, `Stop Background Sync`, `Remove Tracking Libraries` and `Block Trackers`. Add that source in Morphe Manager alongside this one to use them; universal patches apply to any APK, including CapCut.
