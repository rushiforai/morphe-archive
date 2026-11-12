# Jooble patches

**App:** Jooble — Job Search App (`jooble.org`) · **version 1.47.0** · versionCode `247611` ·
minSdk 24 / targetSdk 36 · XAPK bundle (base + `config.arm64_v8a` (Flutter AOT) + `config.mdpi`
+ `config.en`).

**Signer (SHA-256):** `b04f1f3ee9399ec2a19a4d5dfe2d9bfe708726d1a0ad20ab3dd8464d0d66fd5f`.

## Patches

| Patch | Default | What it does |
|---|---|---|
| **Remove ads** | ✅ | Removes the AdMob `APPLICATION_ID` meta-data (so Google Mobile Ads never initialises), disables any ad-SDK init provider, and strips the advertising-ID / ad-services / install-referrer permissions. |
| **Disable AppsFlyer** | ✅ | No-ops `com.appsflyer.internal.AFa1uSDK`'s `start(...)` ×3 and `logEvent(...)` ×2 (the concrete `AppsFlyerLib`). |
| **Disable trackers** | ✅ | Disables the AppsFlyer referrer provider and the Facebook SDK provider/receivers, switches Facebook app-events + advertiser-ID collection off, adds the Firebase/Crashlytics/GA opt-out flags, and removes install-referrer. |

## Why Jooble is Java-side only

Jooble is a **Flutter** app: its UI and ad *slots* are Dart code compiled AOT into
`libapp.so` (in the `arm64_v8a` split), so nothing in the Dart layer can be edited by a
smali/resource patcher. Everything below the Dart layer is fair game:

- **Google Mobile Ads (AdMob)** — bundled (`APPLICATION_ID` meta-data, `com/google/android/gms/ads`).
  There is **no** `MobileAds.initialize` call in the dex; AdMob auto-initialises from the
  meta-data, which is exactly why removing it is the effective switch. Ad slots then fail to
  fill and stay empty.
- **AppsFlyer** (457 classes) — the concrete implementation is
  `com.appsflyer.internal.AFa1uSDK`, the only `AppsFlyerLib` subclass. The Flutter `appsflyer`
  plugin calls `start(...)`/`logEvent(...)` through `AppsFlyerLib.getInstance()`, so no-oping
  those five methods stops attribution and analytics while leaving the plugin callable.
- **Facebook SDK** — `flutter_facebook_auth` + `facebook_app_events`, initialised by
  `com.facebook.internal.FacebookInitProvider`. That provider is disabled and the SDK's
  `AutoLogAppEventsEnabled` / `AdvertiserIDCollectionEnabled` / `AutoInitEnabled` are set to
  `false`, so Facebook analytics stops. *(Side effect, harmless: the
  `GeneratedPluginRegistrant` logs `Error registering plugin facebook_app_events` — the plugin
  cannot register because the SDK is intentionally not initialised. The app continues normally.)*
- **Firebase Analytics + Crashlytics** — switched off with the official opt-out flags, plus any
  Google measurement component disabled. **FCM push** and **Freshchat** (support chat) are kept.
- Permissions removed: `AD_ID`, `ACCESS_ADSERVICES_{ATTRIBUTION,AD_ID,CUSTOM_AUDIENCE,TOPICS}`,
  `BIND_GET_INSTALL_REFERRER_SERVICE`.

## Premium

None. Jooble has no client-side paid tier; nothing to unlock (per the agreed scope, premium was
only to be touched where it is decided client-side).

## Verification

- **Static (independent re-patch + decode):** `appliedPatches` = the three patches,
  `failedPatches: []`; in the patched manifest the advertising-ID/ad-services/install-referrer
  permissions are gone (`0` matches), the AdMob `APPLICATION_ID` meta-data is gone, the
  opt-out + Facebook meta-data are present, and `FacebookInitProvider` is
  `android:enabled="false"`. Re-decoding `AFa1uSDK` shows all five `start`/`logEvent` bodies
  reduced to `return-void`.
- **Device (RootEmu, x86_64 Android 14):** installs, launches, `topResumedActivity` =
  `jooble.org/.MainActivity`, process alive, **0 `Fatal signal` / `FATAL EXCEPTION`**, and the
  full Flutter onboarding UI renders (screenshot verified).
