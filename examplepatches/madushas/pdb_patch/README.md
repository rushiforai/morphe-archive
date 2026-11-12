# 🧩 Patches

Pdb Patches — a Morphe patch bundle for a small set of Android apps.

## ❓ About

Pdb Patches are built on the prior work of [ReVanced](https://github.com/ReVanced) and the
[Morphe](https://github.com/MorpheApp) patch ecosystem, and follow their conventions
(per-app patch list, universal patches, changelog in the release notes). Patches for
specific apps are re-implementations of publicly documented behaviour unless a CREDITs
note says otherwise; the Git history holds every change with its date.

**Every app in this bundle gets ads **and** telemetry/tracking removed** — that is a
project rule, not a per-app choice. Where a limit is inherent to the app (a server-side
entitlement, a Play Integrity gate, a virtualised code section), the patch description
and the app notes say so plainly instead of pretending otherwise.

- **Add this source to Morphe Manager:** <https://morphe.software/add-source?github=madushas/morphe-patches-custom>
- **Releases / changelog:** <https://github.com/madushas/morphe-patches-custom/releases>
- **App notes & verification detail:** [`docs/`](docs/)

&nbsp;
## 🩹 Patches list

<!-- PATCHES_START -->

> **[v0.7.0](https://github.com/madushas/morphe-patches-custom/releases/tag/v0.7.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;77 patches total

<details>
<summary>📦 Fitbit&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 5.11.1.health-mobile-1104134730-1009077909 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable trackers](#disable-trackers) | Disables Google Analytics for Firebase measurement components, switches Crashlytics and Firebase/Google-Analytics collection off via the official opt-out flags, and removes the install-referrer permission. FCM push is kept. |  |
| [Remove ads](#remove-ads) | Fitbit ships no ad SDK or ad placement; this additionally disables any ad-SDK auto-init provider and removes the advertising-ID / ad-services / install-referrer permissions so no advertising ID is exposed. |  |

</details>

<details>
<summary>📦 Glassdoor&nbsp;&nbsp;•&nbsp;&nbsp;5 patches</summary>
<br>

**🎯 Supported versions:**

| 13.15.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Bypass PairIP](#bypass-pairip) | Disables Glassdoor's PairIP integrity/licence verification (full VM + native check), restores the real Application class, removes the licence activity, and restores the runtime strings the VM would have provided. |  |
| [Disable AppsFlyer](#disable-appsflyer) | No-ops AppsFlyer's start() and logEvent() entry points, so no install attribution or analytics events are sent. |  |
| [Disable tracker components](#disable-tracker-components) | Disables the AppsFlyer install-referrer receiver/provider and any Google measurement component, turns Crashlytics and Firebase/Google-Analytics collection off, and removes the install-referrer permission. FCM push is kept. |  |
| [Fix launcher theme (PairIP VM)](#fix-launcher-theme--pairip-vm) | Points the launcher activity at the AppCompat @style/AppTheme instead of the splash theme, whose runtime theme-swap lives in the removed PairIP VM. |  |
| [Remove ads](#remove-ads) | Removes the advertising-ID, ad-services and install-referrer permissions (and disables any ad-SDK init provider). Glassdoor ships no third-party ad SDK. |  |

</details>

<details>
<summary>📦 Hutch&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 4.4.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable SSL pinning](#disable-ssl-pinning) | Unpins the react-native-ssl-pinning OkHttp client so HTTPS traffic can be intercepted, and trusts user-installed CAs (targetSdk 35). Normal TLS validation stays intact. |  |
| [Disable security checks](#disable-security-checks) | Stops Hutch from refusing to run on rooted, adb-enabled, developer-options or emulator devices. The device-integrity probes (jail-monkey + react-native-device-info) all answer "clean". |  |
| [Disable trackers](#disable-trackers) | Disables Google Analytics for Firebase collection (the app's only third-party analytics) and removes the advertising-ID permissions. Push notifications keep working. |  |

</details>

<details>
<summary>📦 Jooble&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 1.47.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable AppsFlyer](#disable-appsflyer) | No-ops AppsFlyer's start() and logEvent() entry points, so no install attribution or analytics events are sent. |  |
| [Disable trackers](#disable-trackers) | Disables AppsFlyer/Facebook/Google measurement components, switches Facebook app events and Firebase/Crashlytics/Google-Analytics collection off, and removes the install-referrer permission. Push notifications are kept. |  |
| [Remove ads](#remove-ads) | Stops Google Mobile Ads from initialising (removes the AdMob app id) and strips the advertising-ID, ad-services and install-referrer permissions. Ad slots in the Flutter UI cannot be removed, but they no longer fill. |  |

</details>

<details>
<summary>📦 Material Capsule&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

**🎯 Supported versions:**

| 17.3 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Bypass PairIP license check](#bypass-pairip-license-check) | Disables Material Capsule's PairIP / Play licence verification so the app runs after Morphe re-signs it. Restores the real Application class (com.pryshedko.mtisland.App). |  |
| [Disable trackers](#disable-trackers) | Disables Google Analytics for Firebase measurement and switches off Firebase Analytics / Advertising-ID data collection via the official opt-out flags. |  |
| [Mock Pro (client-side)](#mock-pro--client-side) | Forces the client-side Pro entitlement (custom colors, card/anim controls, full-size player, app search, widgets, gestures). Material Capsule's premium is a local flag derived from a Play purchase query and stored AES-encrypted on-device — it is NOT server-re-validated, so the whole set opens. No purchase is fabricated; real purchases and restore still work. |  |
| [Remove ads](#remove-ads) | Material Capsule ships no ad SDK or ad placement; this additionally disables any ad-SDK auto-init provider and removes the advertising-ID / ad-services permissions so no advertising ID is exposed. |  |

</details>

<details>
<summary>📦 Microsoft Teams&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 1416/1.0.0.2026202302 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable AppCenter telemetry](#disable-appcenter-telemetry) | No-ops Microsoft AppCenter's SDK bootstrap (configureAndStartServices / startServices) so the bundled telemetry/crash SDK never initialises. |  |
| [Remove ads](#remove-ads) | Microsoft Teams ships no ad SDK; this strips the advertising-ID, ad-services and install-referrer permissions and disables any ad-SDK init provider. |  |
| [Unbloat (trim manifest)](#unbloat--trim-manifest) | Removes the third-party launcher-badge permission zoo Teams declares (Samsung/HTC/Sony/Huawei/OPPO/badger), which only add manifest bulk. |  |

</details>

<details>
<summary>📦 MyDialog&nbsp;&nbsp;•&nbsp;&nbsp;12 patches</summary>
<br>

**🎯 Supported versions:**

| 18.6.5 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable AppsFlyer](#disable-appsflyer) | Neutralizes AppsFlyer attribution/telemetry: the SDK is never initialized or started, and the JS bridge reports success as usual. |  |
| [Disable CleverTap](#disable-clevertap) | Stops CleverTap session/activity tracking and push-click attribution. Push notifications themselves keep working. |  |
| [Disable Firebase Performance + installer check](#disable-firebase-performance---installer-check) | Makes Firebase Performance's connection wrapper a pass-through (no perf telemetry) and reports installs as Play-installed regardless of the actual installer. |  |
| [Disable SSL pinning](#disable-ssl-pinning) | Removes certificate pinning at both layers (OkHttp pin comparison and the platform network-security-config pin-set) and trusts user-installed CAs, so HTTPS traffic can be inspected with a MITM proxy. Normal TLS validation stays intact. |  |
| [Disable security checks](#disable-security-checks) | Stops MyDialog from exiting itself on root/debug/emulator/adb detection and on Play Integrity failure. Signature verification is reported clean so patched builds pass. |  |
| [Disable trackers](#disable-trackers) | Disables Google Analytics measurement and Facebook SDK auto-init, and turns off Firebase Analytics/AdID data collection via their official opt-out flags. |  |
| [Fix SIM identifier access](#fix-sim-identifier-access) | Replaces the IMSI lookup with the public getSimOperator() call so the pre-login flow passes on Android 11+ where re-signed builds lost carrier privileges ('App Error: NO IMSI'). Falls back to Dialog's 41305 on SIM-less devices. |  |
| [Inspect HTTPS traffic (adb reverse proxy)](#inspect-https-traffic--adb-reverse-proxy) | Routes RN network traffic through 127.0.0.1:8080 on the device (adb reverse tunnel to mitmproxy). Off by default; needs the tunnel and a trusted CA. | • Proxy host<br>• Proxy port |
| [Kill residual beacon traffic](#kill-residual-beacon-traffic) | Silences the Facebook SDK's remaining phone-home: app-event uploads (/activities, /app) and the SDK config fetch (mobile_sdk_gk). The SDK class init stays alive (required by RN); only transmission dies. |  |
| [Remove AI assistant FAB (+ footer patch id)](#remove-ai-assistant-fab----footer-patch-id) | Removes the server-driven AI overlay FAB from every screen and surfaces the Morphe patch version on the side-menu footer ("ID ⚡<version>" next to the device id). |  |
| [Spoof stock signing cert hash](#spoof-stock-signing-cert-hash) | Makes NativeUtils.setAppToken() return the stock app's certificate hash instead of the patched build's, so the server-side device/app integrity verdict ('App Error: NO IMSI') is not tripped by the re-signed APK. |  |
| [Unlock hidden feature flags](#unlock-hidden-feature-flags) | Flips the server-sent feature flags showO2A/showO2AShop/showO2ABuy/showUber/showDeleteAccount to true in every API response before the JS sees it, revealing app screens the server hides. |  |

</details>

<details>
<summary>📦 Nike Run Club&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

**🎯 Supported versions:**

| 4.80.0 | 4.80.1 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable tracker components](#disable-tracker-components) | Disables Adobe's extension-discovery service and messaging activities and sets the Firebase Analytics collection opt-outs. |  |
| [Disable trackers](#disable-trackers) | Disables Adobe (Omniture) analytics by stopping the Adobe Experience Platform extension registration, so no tracking payload is built or sent. |  |
| [Enable dark mode](#enable-dark-mode) | Turns on Nike Run Club's built-in dark theme by forcing the DefaultDesignManager colour-mode gate, so the Compose UI renders dark. |  |
| [Remove ads](#remove-ads) | Nike Run Club ships no ad SDK or placement; this disables any ad-SDK auto-init provider and removes the advertising-ID / ad-services / referrer permissions so no advertising ID is exposed. |  |

</details>

<details>
<summary>📦 Pdb&nbsp;&nbsp;•&nbsp;&nbsp;14 patches</summary>
<br>

**🎯 Supported versions:**

| 2.135.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Allow standalone install (split-less APK)](#allow-standalone-install--split-less-apk) | Removes Pdb's base-APK split requirement (requiredSplitTypes=base__abi,base__density) so the single patched APK installs. Required when patching the App Bundle's base APK. |  |
| [Bypass PairIP license check](#bypass-pairip-license-check) | Disables Pdb's PairIP / Play licence verification so the app runs after Morphe re-signs it. Restores the real Application class (pdb.app.App). |  |
| [Chat button on profiles](#chat-button-on-profiles) | Adds a 'Chat' entry to the profile screen's ⋯ menu: opens your conversation with that user when one exists, otherwise their profile (channels are server-created — no fake channel making). |  |
| [Disable trackers](#disable-trackers) | Disables Google Analytics measurement and Yandex AppMetrica telemetry, and turns off Crashlytics/Analytics data collection via their official opt-out flags. |  |
| [Fix app icon](#fix-app-icon) | Gives the default launcher icon a real foreground. The base APK ships an adaptive icon with a null foreground (the visible icon normally comes from a theme alias enabled at runtime). |  |
| [Floating power button](#floating-power-button) | Adds a draggable quick-actions bubble to the main screen (profile IDs / receipts / pause toggles, copy your profile id, open Pdb Extras). Toggle: Pdb Extras → Quick → 'Show floating power button'. |  |
| [Mock Pro (client-side)](#mock-pro--client-side) | Forces the app's client-side pro flag (isProUser → true) and the local ProStatus model: premium-badge UI, client-gated perks (unlimited rewinds, hide online, extra IRL slots) and pro-only screens open. Honestly: features the SERVER re-validates (premium Soul filters, coins, boosts, some AI limits) still refuse — that is a backend check no client patch can lift. |  |
| [No profile-visitor limit](#no-profile-visitor-limit) | Lifts Pdb's client-side cap of 3 profile-visitor views per hour (the 'slow down' sheet). Toggle: Pdb Extras → Limits → 'No profile-visitor limit'. The bytecode ships always-on and is inert until the switch is on. |  |
| [Pdb Extras feature menu](#pdb-extras-feature-menu) | Adds a single Pdb Extras entry to the top of Pdb's Settings screen. |  |
| [Pdb Extras — resources](#pdb-extras---resources) | Adds the Pdb Extras entry to the Settings screen and registers the extension components. |  |
| [Relocate runtime MMKV copy](#relocate-runtime-mmkv-copy) | Copies the bundled MMKV library to a fresh file name so a stale copy from another ABI can never be loaded (fixes emulator crashes; no effect on a clean device). |  |
| [Remove ads](#remove-ads) | Disables Pdb's ad SDKs (GMS, AppLovin, Vungle, Yandex, Pangle) and turns off in-app ad initialisation. |  |
| [Show profile IDs on names](#show-profile-ids-on-names) | Appends the numeric profile id (#1234567) after every profile name — Soul cards, chat headers, lists. Toggle: Pdb Extras → 'Show profile IDs on names'. The bytecode ships always-on and is inert until the switch is enabled, so the toggle works without rebuilding. |  |
| [Soul history](#soul-history) | Records every Soul profile you see or like into a local, on-device history (Pdb Extras / power button → 'Soul history'), so swipes survive the server's short feed window. |  |

</details>

<details>
<summary>📦 Shima+ Dynamic Island&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

**🎯 Supported versions:**

| 0.5.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Bypass PairIP](#bypass-pairip) | Disables Shima+'s PairIP licence/trial verification, restores the real Application class and removes the licence activity. |  |
| [Disable trackers](#disable-trackers) | Adds the official analytics/Crashlytics collection opt-out flags, disables any Google measurement component and removes the install-referrer permission. Shima+ itself ships no telemetry SDK. |  |
| [Remove ads](#remove-ads) | Shima+ ships no ad SDK or ad placement; this additionally disables any ad-SDK auto-init provider and removes the advertising-ID / ad-services / install-referrer permissions so no advertising ID is exposed. |  |
| [Unlock Pro](#unlock-pro) | Forces every "pro_unlock" entitlement check to true, unlocking the client-side Pro features without touching the signed purchase store. | • Unlock Pro |

</details>

<details>
<summary>📦 Strava&nbsp;&nbsp;•&nbsp;&nbsp;7 patches</summary>
<br>

**🎯 Supported versions:**

| 480.15 | 485.12 | 486.9 | 486.11 |
| :---: | :---: | :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [AMOLED dark theme](#amoled-dark-theme) | Makes Strava dark mode true-black for OLED screens: the dark surface colors (#141413 / #21211f / #43423f) are remapped to a black ladder. Light mode is untouched. |  |
| [Custom app name](#custom-app-name) | Renames the launcher label (Settings > Apps, home screen) to the value of the stravaAppName option. Leave the option empty to keep the original name. | • Custom launcher name |
| [Extra settings resources](#extra-settings-resources) | Registers the Extra Settings activity and applies the accent color. | • Accent color<br>• Export SuperUser debug console<br>• Unlock share overlay designs |
| [Extra settings screen](#extra-settings-screen) | Adds an 'Extra Settings' entry at the top of Settings with theme mode switching and patch info. Accent color is a build-time option. |  |
| [Remove telemetry](#remove-telemetry) | Strips Sentry, Embrace and Facebook analytics, disables Firebase analytics, and empties the advertising ID (push notifications keep working). |  |
| [Remove upsells & promos](#remove-upsells---promos) | Removes Strava's subscription upsells and promos: server-driven modular upsells (matched by an upsell-shape predicate so new server types stay covered), subscription bottom-sheet upsells, and the dedicated upsell screens (Year in Sport 2026, Best Efforts Data Peek, Device Connect). Runtime toggles in Extra Settings; the Settings Subscriptions section is stripped. |  |
| [Unlock Premium](#unlock-premium) | Unlocks Strava Premium features (spoofs PAID state + far-future expiry). Also re-enables password login after OTP. |  |

</details>

<details>
<summary>📦 TextNow&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

**🎯 Supported versions:**

| 26.45.0.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable ad SDK](#disable-ad-sdk) | Disables every partner ad-SDK initializer TextNow runs (Facebook Audience Network, Amazon, Fyber/DT Exchange, InMobi, Nimbus, LiveRamp, The Trade Desk) at its own isEnabled() gate, so no ad SDK ever initialises. |  |
| [Disable tracker components](#disable-tracker-components) | Disables Firebase measurement, the AppsFlyer install-referrer provider and Facebook auto-init components, and sets the Firebase/GA/Facebook collection opt-outs. FCM push is kept. |  |
| [Disable trackers](#disable-trackers) | No-ops AppsFlyer's implementation entry points (start, logEvent) so the attribution SDK never starts and no attribution or analytics event is sent. |  |
| [Remove ads](#remove-ads) | Disables every ad-network component TextNow declares (Facebook Audience Network, Amazon APS/DTB) and strips the ad-ID / ad-services / install-referrer permissions. |  |

</details>

<details>
<summary>📦 adidas Running&nbsp;&nbsp;•&nbsp;&nbsp;5 patches</summary>
<br>

**🎯 Supported versions:**

| 14.12.1 | 14.4.0 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Bypass PairIP](#bypass-pairip) | Disables adidas Running's PairIP licence/VM verification, restores the real Application class and bakes the VM's runtime strings (captured from the original app's heap) so Firebase etc. initialize cleanly. NOTE: adidas runs the full PairIP VM whose startup program is the tamper check — the patched app boots past the licence gate but the VM-virtualized init methods cannot be restored without native reverse engineering, so the app may crash after launch. See docs/adidas.md. |  |
| [Disable tracker components](#disable-tracker-components) | Disables the Google Analytics measurement receiver/services and the Adjust lifecycle provider, and sets the Firebase/Google Analytics collection opt-outs. |  |
| [Disable trackers](#disable-trackers) | No-ops the Adjust SDK's event/lifecycle entry points so no attribution or analytics payload is buffered or sent. |  |
| [Enable dark mode](#enable-dark-mode) | Forces adidas Running into its built-in night theme (RtBaseTheme.Dark) by setting AppCompatDelegate night mode at app startup. |  |
| [Remove ads](#remove-ads) | adidas Running ships no ad-serving SDK; this denies the advertising ID and the Privacy-Sandbox ad services and removes the install-referrer permission. |  |

</details>

<details>
<summary>🌐 Universal&nbsp;&nbsp;•&nbsp;&nbsp;7 patches</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable PairIP license check](#disable-pairip-license-check) | Disables PairIP license verification, VM checks, and repeated background checks. |  |
| [Fix Firebase after re-signing](#fix-firebase-after-re-signing) | Fixes Firebase services (push notifications, Remote Config, Firebase Auth) that break after Morphe re-signs the app with a different certificate.

Apply with Original app certificate patch — no other config needed. |  |
| [GmsCore support (MicroG)](#gmscore-support--microg) | Routes Google Play Services calls through MicroG instead of real GPS.

Works for: Google apps (YouTube, Maps, News, Photos) and third-party apps using classic Google Sign-In (Android 13 and below).

Does not work for: Android 14+ Credential Manager sign-in (most modern third-party apps), Play Integrity / SafetyNet checks, or apps with custom auth.

Requires MicroG RE installed. Apply with Original app certificate patch. | • MicroG package name<br>• Main activity class (optional)<br>• Custom package name (optional) |
| [Provide Original app certificate](#provide-original-app-certificate) | Automatically reads the signing certificate from the APK you are patching — no original app installed or file provided needed. Only fill the options below if you are patching an APK that was already re-signed (e.g. a previously patched build): in that case point to the original APK file, or enter the certificate manually. | • Path to original APK (if uninstalled)<br>• Certificate SHA-1 (manual)<br>• Certificate SHA-256 (manual)<br>• Certificate Base64 DER (manual) |
| [Spoof Widevine / DRM level](#spoof-widevine---drm-level) | Reports Widevine L1 (hardware DRM) to apps that check DRM level locally.

Useful for apps that refuse to play HD/4K content on L3 devices or after re-signing.

Does not bypass server-side DRM - Netflix, Disney+ and similar are not affected. | • Widevine security level to report<br>• HDCP level to report |
| [Spoof app signature](#spoof-app-signature) | Makes the app think its signing certificate is unchanged after Morphe re-signs it.

Useful when an app crashes or shows a tamper warning because it checks its own certificate.

Does not bypass Play Integrity / SafetyNet hardware attestation.

Apply with Original app certificate patch. | • Package name override (optional) |
| [Spoof install source](#spoof-install-source) | Makes the app think it was installed from a specific store (default: Google Play).

Useful when an app blocks features or shows errors because it detects it was not installed from the Play Store.

Only affects what the app itself sees - does not change the real system install record. | • Store to impersonate |

</details>

<!-- PATCHES_END -->

&nbsp;
## 🏗️ Building

```bash
# build the bundle (patches/build/libs/patches-<version>.mpp)
./gradlew :patches:buildAndroid

# regenerate patches-list.json and the block above (README is regenerated too)
./gradlew :patches:generatePatchesList
```

`tools/pdbrelease --prepare && tools/pdbrelease --publish` performs the full release:
build, regenerate the catalogue and this README, sync `patches-bundle.json`
(whose `description` carries the changelog Morphe Manager shows), commit, push and
create the GitHub release.

&nbsp;
## 🙏 Credits

- [ReVanced](https://github.com/ReVanced) — the patching framework this ecosystem grew from.
- [Morphe](https://github.com/MorpheApp) — the patcher, Manager and the official patch set that sets the conventions followed here.
- The community patch authors whose public work informed individual patches (credited in each patch's source header where applicable).

&nbsp;
## 📜 License

Released under the [GNU General Public License v3.0](LICENSE), with the additional
conditions of GPLv3 Section 7: original notices must be preserved, and derivative works
must not use upstream naming or branding.
