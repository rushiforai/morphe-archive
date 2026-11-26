# Todaii: Learn German A1-C1

Patches for **Todaii: Learn German A1-C1** (`mobi.eup.easygerman`), version `2.8.2`, as an XAPK from APKPure.

## Patches

Every patch is on by default. Morphe Manager groups them by category.

| Category | Patch | Default | What it does |
|---|---|---|---|
| Feature | GmsCore support | On | Makes Google sign-in work through [microG RE](https://github.com/WSTxda/MicroG-RE) (GmsCore) instead of Google Play services. |
| Premium | Premium unlock | On | Unlocks the client-side Premium and Premium AI checks and removes ads. |
| Privacy | Disable analytics | On | Stops AppMetrica, Facebook App Events, and Firebase Analytics, Crashlytics, Performance and Sessions. |
| Theme | Themed icon | On | Adds the themed (monochrome) app icon of Android 13 and later, which follows the wallpaper colors. |

## How the patches work

**Premium unlock** makes `User.isUserPremium`, `isUserPremiumAi`, `isPremium` and `isPremiumAi` return true. The banner, interstitial and rewarded gates read these, so the ads stop on their own. It also pulls in an ad removal step that disables `MobileAdsInitProvider`, `AppLovinInitProvider`, Yandex `MobileAdsInitializeProvider`, and `AudienceNetworkContentProvider` in the manifest, skips `MobileAdsState` and `AppLovinPrivacySettings` initialization at startup, hides banner containers (`AdsBanner`), skips interstitials (`AdsInterval`), and invokes the continue callback immediately on rewarded-ad gates (`AdsReward`).

**GmsCore support** redirects the app's Google Play services calls to microG RE (`app.revanced.android.gms`) and declares Todaii German's original signing certificate SHA-1 so Google issues the ID token that login expects.

**Disable analytics** turns off Firebase Analytics, Crashlytics, Performance and Sessions through their manifest switches and disables `TransportBackendDiscovery`, stubs `FirebaseAnalytics` event and user-property calls, disables `PreloadInfoContentProvider` (AppMetrica), and turns off Facebook App Events and advertiser ID collection while keeping `FacebookInitProvider` alive, because `BaseFragment.onCreate` crashes without an initialized Facebook SDK.

## Build

See the [repo README](../../README.md).

## Test on desktop

With [morphe-desktop](https://github.com/MorpheApp/morphe-cli/releases) (needs Java 21):

```bash
java -jar morphe-desktop-2.2.0-all.jar patch -p patches/build/libs/patches-<version>.mpp -o todaiigerman-patched.apk <Todaii German 2.8.2 XAPK>
```
