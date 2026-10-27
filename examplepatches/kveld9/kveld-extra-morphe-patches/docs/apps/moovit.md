# Moovit Patches Guide

Technical documentation and patch catalog for Moovit on Android.

---

## 1. Target & Compatibility

| Property | Value |
| :--- | :--- |
| **Target App** | Moovit |
| **Package Name** | `com.tranzmate` |
| **Target Version** | `5.203.0.1812` |
| **Target Package Format** | APKM |
| **Primary Architecture** | `arm64-v8a` |
| **Authoritative Source** | APKMirror |
| **Download Target** | [Moovit 5.203.0.1812 (arm64-v8a, 160-640dpi, versionCode 1812 / BUNDLE 31 S)](https://www.apkmirror.com/apk/moovit/moovit-bus-train-live-info/moovit-your-transit-tracker-5-203-0-1812-release/moovit-your-transit-tracker-5-203-0-1812-android-apk-download/) |

Note: `versionCode 1812` corresponds to the actual build versionCode assigned on APKMirror, not a trailing versionName fragment.

---

## 2. Applied Patches Catalog

| Patch Name | Typology | Default State | Dependencies | Description |
| :--- | :--- | :--- | :--- | :--- |
| **Block Telemetry & Trackers** | `bytecodePatch` | `true` (Enabled) | `Moovit Telemetry Manifest Purge` | Neutralizes AppsFlyer, Braze, and Inneractive DEX dispatchers, disables analytics services/providers, and strips advertising permissions. |
| **Moovit Telemetry Manifest Purge** | `resourcePatch` | `false` (Opt-in) | None | Strips advertising and tracking permissions, disables analytics services, providers, and receivers, and injects opt-out metadata in AndroidManifest.xml. |
| **Fix Google Maps** | `bytecodePatch` | `true` (Enabled) | `Moovit Custom Maps API Key` | Restores Google Maps rendering by spoofing the original package signature to Google Play Services. Includes opt-in toggle to force the Google Maps engine. |
| **Moovit Custom Maps API Key** | `resourcePatch` | `false` (Opt-in) | None | Injects the required personal Google Maps API key into AndroidManifest.xml and web-service strings. |
| **Use Places API (New)** | `bytecodePatch` | `true` (Enabled) | `Fix Google Maps` | Redirects search autocomplete from the legacy Places API to Places API (New). Requires Places API (New) to be enabled for the API key. |
| **Remove Ads** | `bytecodePatch` | `true` (Enabled) | None | Hides banner and inline ads and neutralizes ad unit ID lookups. |
| **Suppress Paywalls** | `bytecodePatch` | `true` (Enabled) | None | Suppresses subscription paywalls, onboarding upgrade dialogs, and promotional cards. |
| **Unlock Moovit+** | `bytecodePatch` | `true` (Enabled) | None | Unlocks Moovit+ premium subscription features locally, including Safe Ride and address search in favorites. |

---

## 3. Deep Technical Breakdown

### A. Manifest & Telemetry Purge Layer (`resourcePatch`)

1. **Moovit Telemetry Manifest Purge**:
   - **Objective**: Prevent tracker initialization and background analytics collection.
   - **How**: Strips advertising identifiers and install referrer permissions, disables AppsFlyer and DataTransport services, and injects opt-out metadata flags.

2. **Moovit Custom Maps API Key**:
   - **Objective**: Inject the required Google Maps Platform API key.
   - **How**: Replaces the Google Maps key in the manifest and application strings with the user-provided API key.

### B. Bytecode Dispatcher & Premium Unlocking Layer (`bytecodePatch`)

1. **Block Telemetry & Trackers**:
   - **Objective**: Neutralize runtime telemetry and tracking calls.
   - **How**: Short-circuits AppsFlyer, Braze, and Inneractive dispatchers and strips tracking permissions.

2. **Fix Google Maps**:
   - **Objective**: Prevent map tile rendering failures on re-signed builds.
   - **How**: Spoofs original package signatures communicated to Google Play Services and requires a user-owned Google Maps API key injected into AndroidManifest.xml and application strings. The patch spoofs the original package signature and emits a "[Fix Google Maps] Signature spoof active/inactive" verdict line to the user log. Also logs `[Fix Google Maps] SigningInfo spoof active (sha1=...).` or `[Fix Google Maps] Setup note: signingInfo NOT spoofed (<reason>).` to diagnose SigningInfo spoofing. Also probes Google Play Services availability, logging `[Fix Google Maps] Play Services availability: <code>.` to diagnose Google engine support. Provides an opt-in toggle (`forceGoogleMaps`, default `false`) to force the Google Maps engine in the map factory selector instead of the region default. Use this option to validate Google Maps rendering on test devices or in transit regions normally served by OSM/Nutiteq.

   #### Google Maps API Key Setup Guide

   A personal Google Maps API key is required because the built-in key only works with the original signature.

   ##### Step 1: Create an API Key in Google Cloud Console
   1. Open the [Google Cloud Console](https://console.cloud.google.com/).
   2. Create a new project (e.g. "Moovit Personal") or select an existing project.
   3. Go to **APIs & Services > Library** and enable:
      - **Maps SDK for Android** - map rendering.
      - **Places API (New)** - place/address autocomplete.
      - **Geocoding API** - resolving selected places and addresses.
   4. Go to **APIs & Services > Credentials**, click **Create Credentials** at the top, and select **API key**.
   5. Copy the generated API key.

   > **Places API (Legacy) is not available in new Cloud projects.** The **Use Places API (New)** patch switches Moovit to the new endpoint, so the legacy API does not need to be enabled.

   ##### Step 2: Configure Key Restrictions (Recommended)
   - On the Credentials page, click on the newly created API key to edit its settings.
   - Under **API restrictions**, either select **Don't restrict key**, or allow:
     - **Maps SDK for Android**
     - **Places API (New)**
     - **Geocoding API**
   - Under **Set application restrictions**, select **Android apps**.
   - Click **Add an item** and enter:
     - **Package name**: `com.tranzmate`
     - **SHA-1 certificate fingerprint**: Enter the SHA-1 fingerprint of the signature used for your patched APK.
       - You can extract this from the patched APK with:
         ```bash
         apksigner verify --print-certs path/to/patched-moovit.apk
         ```
       - Or obtain it directly from your custom signing keystore:
         ```bash
         keytool -list -v -keystore your-keystore.keystore
         ```
   - *Alternative (testing only)*: You can leave the key unrestricted to test that map tiles render, but beware that unrestricted keys can be used by anyone if leaked.

   ##### Step 3: Billing Account & Usage Note
   - Google Cloud requires a linked billing account to activate Google Maps Platform services.
   - Google provides a USD 200/month recurring free credit for Google Maps Platform, which covers everyday personal transit usage at zero cost.
   - To avoid unexpected charges, set up a budget alert in **Billing > Budgets & alerts** (e.g. at USD 1.00).

   ##### Step 4: Configure the Patch Option
   - In **Morphe Manager**: Select Moovit, configure the options for the **Fix Google Maps** patch, and paste your key into the `mapsApiKey` option field before patching.
   - In **Morphe CLI**: Pass the key through the `mapsApiKey` patch option using your build environment's documented patch-option flag or configuration file.

   ##### Step 5: Verification & Logs
   When a valid key is provided, the patcher log confirms injection during the build:
   ```text
   [Fix Google Maps] Injected custom Google Maps API key into AndroidManifest.xml and strings.xml.
   ```
   If the `mapsApiKey` option is omitted, the patcher framework aborts before patching starts:
   ```text
   The option mapsApiKey requires a value, but the value was null
   ```
   If the option is provided but left blank or empty, the patch aborts with:
   ```text
   [Fix Google Maps] A personal Google Maps API key is required. See docs/apps/moovit.md, section Fix Google Maps.
   ```

3. **Use Places API (New)**:
   - **Objective**: Keep search working now that legacy Places API is unavailable in new Cloud projects.
   - **How**: Locates the search provider selector in `DefaultSearchLocationCallback` and forces the Places API (New) provider branch. Search autocomplete then uses `https://places.googleapis.com/v1/places:autocomplete` instead of the legacy `maps/api/place/autocomplete/json` endpoint. The patch finds the legacy and new provider classes through their `google_place_autocomplete_legacy` / `google_place_autocomplete` markers, so it does not depend on obfuscated class names.

4. **Remove Ads**:
   - **Objective**: Remove banner and inline advertisements.
   - **How**: Hides advertisement views and returns empty strings for ad unit lookups.

5. **Suppress Paywalls**:
   - **Objective**: Prevent subscription dialogs and upgrade popups from interrupting navigation.
   - **How**: Finishes `MoovitSubscriptionOnBoardingActivity` and `MoovitSubscriptionActivity` on creation, hides `MoovitSubscriptionMenuItemFragment` and help center menu items, dismisses `MoovitPlusPackagePopupFragment`, suppresses promo cells, and forces the `goPremiumCard` view to GONE visibility.

6. **Unlock Moovit+**:
   - **Objective**: Enable Moovit+ premium features locally.
   - **How**: Forces subscription status checks to return true, sets `SubscriptionPackage` state to `ACTIVE` on initialization, and activates Safe Ride and favorite address search flags.

---

## 4. Behavioral Hazards Warning

None related to resource trimming.

---

## 5. Known Limitations

If map tiles stay blank on very new Android versions, capture the "[Fix Google Maps]" verdict lines from the log when reporting.

If search returns only stops/lines and no Places/Locations section, verify that **Places API (New)** and **Geocoding API** are enabled and allowed by the API key restrictions. The **Use Places API (New)** patch must also be enabled.

---

## 6. Canonical Universal Patches

The generic maintenance patches removed from this guide (screen densities, languages) are covered by the universal patches in the canonical collection [kveld-morphe-patches](https://github.com/kveld9/kveld-morphe-patches): `Remove Unused Screen Sizes` and `Remove Extra Languages`. For further generic maintenance (packaging leftovers, background sync, native trackers, telemetry) that collection also provides `Clean App Packaging`, `Stop Background Sync`, `Remove Tracking Libraries` and `Block Trackers`. Add that source in Morphe Manager alongside this one to use them; universal patches apply to any APK, including Moovit.
