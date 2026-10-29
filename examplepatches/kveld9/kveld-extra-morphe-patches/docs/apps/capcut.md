# CapCut Patches Guide

Technical documentation and patch catalog for CapCut on Android.

---

## 1. Target & Compatibility

| Property | Value |
| :--- | :--- |
| **Target App** | CapCut |
| **Package Name** | `com.lemon.lvoverseas` |
| **Target Version** | `Single pinned version (see README Patch Catalog)` |
| **Target Package Format** | standalone APK |
| **Primary Architecture** | `arm64-v8a` |
| **Authoritative Source** | APKMirror |
| **Download Target** | [CapCut (arm64-v8a, nodpi)](https://www.apkmirror.com/apk/bytedance-pte-ltd/capcut/) |

---

## 2. Applied Patches Catalog

The authoritative patch catalog with descriptions and options is generated in README.md from the built .mpp; see also patches-list.json.

---

## 3. Deep Technical Breakdown

### A. Manifest Purge Layer (`resourcePatch`)

1. **CapCut Telemetry Manifest Purge**:
   - **Objective**: Prevent tracker initialization, install attribution, and background telemetry collection.
   - **How**: Strips advertising and attribution permissions from the manifest, disables tracking, install attribution, and dynamic ad components (including VungleProvider, BDInstallProvider, AppLog Collector, LogService, and Pangle BinderPoolService), prunes discovery registrars, and injects opt-out flags.

2. **CapCut Play Billing Manifest Purge**:
   - **Objective**: Strip Google Play Billing permission and disable Play Billing activity components to prevent service binding attempts and unresolved intent launches on devices without GMS.
   - **How**: Strips `com.android.vending.BILLING` from manifest permissions via `stripPermissionsWhere` and disables `com.android.billingclient.api.ProxyBillingActivity` and `com.android.billingclient.api.ProxyBillingActivityV2` via `disableComponentsByName`.

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

11. **Neutralize Play Billing**:
    - **Objective**: Prevent crashes, hangs, and unhandled exceptions when Google Play Billing is invoked on devices without Google Mobile Services.
    - **How**: Stubs `BillingClientImpl.h` (`launchBillingFlow`) and `BillingClientImpl.f` (`isFeatureSupported`) to return `BillingResult` with `BILLING_UNAVAILABLE` (`zzdb.b`), stubs `BillingClientImpl.m` (`startConnection`) to notify `BillingClientStateListener.d` immediately with `BILLING_UNAVAILABLE`, stubs `BillingClientImpl.k` (`queryPurchasesAsync`) to return `BILLING_UNAVAILABLE` with an empty list, forces `BillingClientImpl.g` (`isReady`) to return `false`, and stubs `GoogleBillingService.isSupportGooglePay` and `GoogleIapExternalServiceProvider.isSupportGooglePay` to return `false`.

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
   On clean installs the blocking security notice does not appear with the published patch set. Local experiments that replaced the integrity interceptor or the effects device ID re-triggered it and were reverted; if a notice appears on a clean install from current sources, report it with the build date.
3. **Cloud VIP Assets**:
   Remote cloud-hosted VIP assets and server-validated processing remain locked.
4. **Server-Side Capacity and Region Rejections**:
   The API v2-boot redirection routes requests to official alternate endpoints to bypass region-level choking ("Too many people are using this feature now"), but server-refused content or endpoints that require server-side cryptographic attestation / unbanned IP ranges may still refuse requests. That message is a client string shown by the template feed error view when the server refuses the feed request; it is not a local flag the patches miss. The v2-boot redirect is opt-in (default off): builds made with default options still use the stock hosts and can show this message where the alternates would succeed. The v2-boot hosts are real and reachable; stock builds already use `-v2-boot` variants for some telemetry traffic, so those names in a patched APK are not an artifact of the redirect.
5. **Cloud and AI Features Reporting No Connection**:
   Image templates, smart-pack, AI workflow, and digital-human surfaces show "No internet connection" when their request fails at transport level (internal error -7: no route, timeout, or TLS failure), not when a local gate is missed. If online features worked before patching options changed, compare three builds from the same sources: stock unpatched, patched with defaults, and patched with every option on. Stock failing too means a region block no patch can fix; defaults failing while all-options passes means the v2-boot redirect (opt-in) is required in that region; all-options failing points at the manifest purge (TicketGuard / device-registration components) or another opt-in, which can be isolated by toggling one option at a time.
6. **Third-Party Mod Builds**:
   A widely shared mod APK advertising premium unlock, watermark removal, and working online features was compared statically against this patch set. Every advertised behavior maps to a patch already present here (Unlock Premium incl. BusinessManager flags, Remove Watermark incl. default ending, Ultra HD export, premium templates, effects region bypass, API redirect). The mod keeps stock API hosts, stock device identifiers, and all bundled ad and analytics SDKs, so its feature set is a subset of what these patches provide; differences in online-feature behavior between the mod and a patched build come from request content (hosts, app version, device identifiers) or region, not from a technique the mod has and this set lacks.
7. **Shared Effects Device Identifier**:
   Bypass Effects Region Restriction sends the same constant device identifier (`0`) and platform (`windows`) on every install. If the server rate-limits per device, all patched installs share one bucket, which can look like capacity throttling. This is unconfirmed; if template or effect feeds throttle while a stock build on the same network passes, report it so a per-install identifier can be evaluated.

---

## 6. Canonical Universal Patches

The generic maintenance patches removed from this guide (screen densities, `res/values-*` languages) are covered by the universal patches in the canonical collection [kveld-morphe-patches](https://github.com/kveld9/kveld-morphe-patches): `Remove Unused Screen Sizes` and `Remove Extra Languages`. For further generic maintenance (packaging leftovers, background sync, native trackers, telemetry) that collection also provides `Clean App Packaging`, `Stop Background Sync`, `Remove Tracking Libraries` and `Block Trackers`. Add that source in Morphe Manager alongside this one to use them; universal patches apply to any APK, including CapCut.
