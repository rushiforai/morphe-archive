# Fitbit / Health patches

**App:** Fitbit (labelled *Health*) (`com.fitbit.FitbitMobile`) · **version**
`5.11.1.health-mobile-1104134730-1009077909` · versionCode `1104134730` · minSdk 30 /
targetSdk 37 · split-APK APKM bundle (base + `config.arm64_v8a` + `config.xxhdpi` +
20 language splits).

**Signer (SHA-256):** `2cc914da5a849426c1b591e12f0a8adb042fa2feade3a4762845ce6bfadcf313`
(`CN=Android, O=Google Inc.` — Play signing; an older Fitbit certificate covers the
minSdk 24–32 builds).

Fitbit is a large native Kotlin/Java app (8 dex, R8-shrunk). Its telemetry stack is
Google Firebase core. The two patches below are **manifest-only** — the app's tracker
and ad surfaces are declared (or absent) in `AndroidManifest.xml`, so no bytecode
fingerprint is required.

## Patches

| Patch | Default | What it does |
|---|---|---|
| **Remove ads** | ✅ | No ad SDK ships; disables any ad-init provider and strips the ad-ID / ad-services / install-referrer permissions. |
| **Disable trackers** | ✅ | Disables Google-Analytics-for-Firebase measurement components, forces Crashlytics + Firebase/GA collection off via the official opt-out flags, drops the install-referrer permission. FCM push is kept. |

## Ads

Fitbit 5.11.1 declares **no ad SDK and no ad placement** — recon of the base APK's
eight dex files found no `com/google/android/gms/ads`, AppLovin, Unity, ironSource,
Vungle, Pangle or ByteDance ad class, no `MobileAdsInitProvider`, no AdMob App-ID
meta-data and no ad view. The patch therefore keeps the standard set of ad-init
providers force-disabled **defensively** (so a future build that adds one cannot
auto-initialise), and strips `com.google.android.gms.permission.AD_ID`,
`android.permission.ACCESS_ADSERVICES_*` and the install-referrer permission — none
of which are declared in this build, so the strip is a no-op that closes the surface
at the OS level if they return.

## Telemetry

- **Firebase Crashlytics** — the shipping manifest already carries
  `<meta-data android:name="firebase_crashlytics_collection_enabled" android:value="false"/>`;
  the patch re-asserts it.
- **Google Analytics for Firebase** — Fitbit bundles only the
  `com.google.firebase.analytics.connector` AIDL stub; there is **no** `FirebaseAnalytics`
  class and **no** `com.google.android.gms.measurement.*` implementation in the dex, and
  the manifest declares none of the `AppMeasurementReceiver` / `AppMeasurementService` /
  `AppMeasurementJobService` components. The patch disables those components
  defensively and adds the documented opt-out flags
  (`firebase_analytics_collection_enabled=false`,
  `firebase_analytics_collection_deactivated=true`,
  `firebase_data_collection_default_enabled=false`,
  `google_analytics_adid_collection_enabled=false`,
  `google_analytics_default_allow_ad_personalization_signals=false`).
- **Install-referrer** — the `BIND_GET_INSTALL_REFERRER_SERVICE` permission is removed
  if present (not declared in this build), so Play cannot attach an attribution
  referrer.

**Kept working:** Firebase core stays initialised (`FirebaseInitProvider` /
`ComponentDiscoveryService` untouched) and FCM push (`firebase.iid.Registrar` /
`FirebaseMessagingService` / `FirebaseInstanceIdReceiver`) is deliberately left intact.

**Honesty note:** Fitbit's own first-party product analytics
(`com.fitbit.platform.metrics.*`, `com.fitbit.jsscheduler.*`) is **not** touched — it
is not the Firebase telemetry named in this patch's scope.

## Verification

Manifest verified with `aapt2 dump xmltree <patched.apks> --file AndroidManifest.xml`:
the measurement components are absent/disabled, the Crashlytics + Firebase/GA opt-out
meta-data are set, and `AD_ID` / ads-services / install-referrer permissions are gone.
