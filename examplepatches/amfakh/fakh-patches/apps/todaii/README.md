# Todaii: Learn Japanese N5-N1

Patches for **Todaii: Learn Japanese N5-N1** (`mobi.eup.jpnews`), version `5.6.0`, as an APKM from APKMirror.

## Patches

Every patch except **GmsCore support** is on by default. Morphe Manager groups them by category.

| Category | Patch | Default | What it does |
|---|---|---|---|
| Feature | GmsCore support | Off | Makes Google sign-in work through [microG RE](https://github.com/WSTxda/MicroG-RE) (GmsCore) instead of Google Play services. |
| Premium | Premium unlock | On | Unlocks the client-side Premium and Premium AI checks and removes ads. |
| Privacy | Disable analytics | On | Stops Adjust, Facebook App Events and Firebase Analytics, Crashlytics, Performance and Sessions. |

## How the patches work

**Premium unlock** forces the Premium and Premium AI checks to true. It also removes ads: it disables `MobileAdsInitProvider` and `AppLovinInitProvider` in the manifest and skips `MobileAdsState` and `AppLovinSdk` initialization at startup. Banner containers (`AdsBanner`) are hidden on attach, full-screen interstitials (`AdsInterval`) return without showing, rewarded-ad gates (`AdsReward` and `FeatureAdUnlockManager`) invoke their reward callback immediately, the "Remove ads / Upgrade" row is omitted from the news feed, and in-house promo fetches (`AdsInHouseViewModel` and `AdsInHouseRefresher`) are skipped.

**GmsCore support** redirects the app's Google Play services calls to microG RE (`app.revanced.android.gms`) and declares Todaii's original signing certificate SHA-1 so Google issues the ID token that Todaii's login endpoint expects.

**Disable analytics** turns off Firebase Analytics, Crashlytics, Performance and Sessions through their manifest switches and disables `TransportBackendDiscovery`, disables Adjust's `SystemLifecycleContentProvider` and `AdjustHelper`, stubs `TrackEventHelper` and `BaseActivity` event logging, and turns off Facebook App Events and advertiser ID collection while keeping `FacebookInitProvider` alive for the TTS cache directory lookup in `SpeakTextHelper`.

## Known limitations

Paid mock tests (for example Mock Test 3) still show "Oops, something's wrong!". Their questions come from `easyjapanese.net/api/test/detail/{idTest}`, and the server checks the account's `Authorization` token, so no client-side patch can unlock them. Premium unlock opens only the checks inside the app.

## Build

See the [repo README](../../README.md).

## Test on desktop

With [morphe-desktop](https://github.com/MorpheApp/morphe-cli/releases) (needs Java 21):

```bash
java -jar morphe-desktop-2.2.0-all.jar patch -p patches/build/libs/patches-<version>.mpp -o todaii-patched.apk <Todaii 5.6.0 APKM>
```
