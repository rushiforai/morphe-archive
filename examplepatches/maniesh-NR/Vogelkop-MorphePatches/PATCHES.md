# 🧩 Opera patches

Morphe patches for the Opera browser family, built from a full reverse-engineering
pass over Opera 103.3.5234.91185 (stable), Opera Beta 104.0.5262.91143 and
Opera GX 3.3.18.

## Opera Browser (com.opera.browser)

**Supported versions:** `103.3.5234.91185` (Play bundle `1910312306`, direct download `1910312408`)

| Patch | Details |
|---|---|
| **Disable analytics & tracking** | Rewrites 93 tracker endpoint constants to a dead host (Firebase Analytics `app-measurement.com`, Google Ads/Doubleclick/IMA, `pagead2.googlesyndication.com`, Leanplum's `Constants.API_HOST_NAME`, plus the Pangle/TikTok ad pipeline `*.pangle.io` / `*.tiktokpangle*` / `*.pglstatp*` / `analytics.tiktok.com`, the Liftoff/Vungle pipeline `*.ads.vungle.com`, AppsFlyer incl. its Privacy-Sandbox trigger `privacy-sandbox.appsflyersdk.com`, and Google's crash telemetry `*.crashlytics.com`). Firebase infrastructure that features depend on is untouched. Merged builds that include the Pangle split gain further rewrites. |
| **Disable ad modules** | Prevents Opera from loading its bundled third-party ad network modules (Liftoff/Vungle, Mintegral, Pangle/ByteDance) by breaking the reflective class lookup used by the ad mediation layer. |
| **Remove ad & tracking permissions** | Drops five ad-profiling/tracking permissions from the manifest (v1.2.5): Google Privacy Sandbox `ACCESS_ADSERVICES_TOPICS`, the Google Advertising ID (`AD_ID`), Play install-referrer attribution, `READ_BASIC_PHONE_STATE` and the Huawei AppGallery telemetry shim. Permission hygiene verified against community modded builds; the browser already tolerates every runtime permission being denied. |
| **Ignore browser boot failures** | Converts engine boot (MainLibraryBoot) failure announcements into success notifications, so a failed engine load/start can no longer deadlock the welcome splash screen. The engine itself ships inside the APK and is kept byte-identical by patching. |
| **Spoof app signature** | Presents Opera's original "Opera Software" signing certificate to the app after Morphe re-signing, in two independent layers (v1.2.3): signature-reading call sites (`getPackageInfo`, `hasSigningCertificate`, `SigningInfo` readers) are redirected to a bundled helper that swaps the certificate in the result, plus a hardened `PackageInfo.CREATOR` parcel proxy — keeps preinstall checks, the MoMi SDK and metrics on their vendor-build behavior. |
| **Hide broken installation dialog** | Neutralizes the "Your app installation appears to be broken" crash-recovery nag (it also appears on unmodified installs after a crash) and clears the broken-installation flag so startup continues. |
| **Remove sponsored Speed Dial** | Stops sponsored/partner tiles from appearing on the start page by making Opera's suggested-sites database queries return no rows. Regular Speed Dial entries and bookmarks are not affected. |
| **Disable Acceptable Ads whitelist** | Replaces Opera's hidden partner whitelists (Google/Yandex measurement, Taboola, gambling and shopping affiliates, AppsFlyer/Adjust/Kochava/CJ tracking domains) with empty filter lists, so the built-in ad blocker actually blocks them. |
| **Startup diagnostics** | New in v1.2.4: records a startup breadcrumb trail and the full stack trace of any launch crash to `Android/data/<package>/files/vogelkop-diag.log` (openable with any file manager, no adb/root needed). Also logs the signing certificate the app sees for itself and the spoof hook's install state. Does not alter app behavior. |

## Opera Browser Beta (com.opera.browser.beta)

**Supported versions:** `104.0.5262.91143`

| Patch | Details |
|---|---|
| **Disable analytics & tracking** | Same as stable: 93 tracker endpoint constants rewritten to a dead host. |
| **Disable ad modules** | Same as stable: breaks the Liftoff/Mintegral/Pangle module lookups. |
| **Remove ad & tracking permissions** | Same as stable: drops the five ad-profiling/tracking permissions (Privacy Sandbox, AD_ID, install referrer, basic phone state, Huawei shim). |
| **Ignore browser boot failures** | Same as stable: keeps the welcome screen reachable if the engine boot ever fails. |
| **Spoof app signature** | Same as stable (v1.2.3 two-layer spoof): the app sees the original Opera certificate instead of the Morphe signing key. |
| **Hide broken installation dialog** | Same as stable: suppresses the crash-recovery nag and the broken-installation early return. |
| **Remove sponsored Speed Dial** | Same as stable: neutralizes the `partner_data` / `partner_tree` / `domain_data` queries. |
| **Disable Acceptable Ads whitelist** | Same as stable: empties the pure-whitelist lists in `assets/abp_files/op/`. |
| **Startup diagnostics** | New in v1.2.4: self-reporting crash log + startup breadcrumbs in `Android/data/<package>/files/vogelkop-diag.log`. See the stable table. |

## Opera GX (com.opera.gx)

**Supported versions:** `3.3.18`

| Patch | Details |
|---|---|
| **Disable analytics & tracking** | Rewrites 12 tracker endpoint constants to a dead host (Firebase Analytics, Google Ads, `google-analytics.com`, Google's crash telemetry `firebase-settings.crashlytics.com`). |
| **Remove ad & tracking permissions** | Same as stable: drops the ad-profiling/tracking permissions declared by GX (Privacy Sandbox `ACCESS_ADSERVICES_AD_ID`/`ATTRIBUTION`, `AD_ID`, install referrer). |
| **Remove sponsored Speed Dial** | Removes sponsored tiles (Eneba, Instant Gaming, Amazon and other affiliate links routed through operagx.gg) from Opera GX's preloaded start page, keeping the organic default tiles. |
| **Spoof app signature** | The app sees the original Opera certificate instead of the Morphe signing key (v1.2.3 two-layer spoof). |
| **Startup diagnostics** | New in v1.2.4: self-reporting crash log + startup breadcrumbs in `Android/data/<package>/files/vogelkop-diag.log`. See the stable table. |
