# Muslim Pro

Patches for **Muslim Pro** (`com.bitsmedia.android.muslimpro`), version `17.11`, as an APKS.

## Patches

Every patch is on by default except GmsCore support. Morphe Manager groups them by category.

| Category | Patch | What it does |
|---|---|---|
| Ads | Hide ads | Removes banner, full-screen, app open and rewarded ads, the ad cards in the Today feed, the partner card on the prayer times screen, and the empty strip the banner leaves at the bottom of screens such as Al-Qur'an and Doa. |
| Ads | Hide Alipay+ Rewards | Removes the Alipay+ Rewards card and the cube icon in the header. |
| Feature | Disable Play license check | Stops the Google Play license check from blocking the patched app with a "Get this app from Play" screen. |
| Feature | GmsCore support | Makes "Continue with Google" work by signing in through [microG RE](https://github.com/MorpheApp/microg-RE) (GmsCore) instead of Google Play services. Needs microG RE installed and signed in to a Google account. Off by default. |
| Feature | Hide Guest Pass | Removes the gift icon in the header and the invite section and row in the profile. |
| Premium | Premium unlock | Unlocks Premium on the device: no ads, no upgrade banners and the Premium-only features that do not need the server. |
| Privacy | Disable analytics | Turns off Firebase Analytics, Crashlytics, Performance and Sessions, and stops the Facebook SDK from logging app events and collecting the advertising id. |
| Theme | Material You | Uses your wallpaper's colors (Android 12+): the app's greens become the wallpaper accent, and its teal backgrounds and cards become the dark surface colors. |

## How the unlock works

The unlock happens on your phone only; no purchase is faked on the server. Features whose content
the server only hands to paying accounts may not work, such as Qalbox videos and some Qur'an
reciters and narrators: their rows can still show the Premium badge or do nothing when tapped.

## Material You

The app is dark only, so only the dark palette is themed. Server-drawn content keeps its own
colors: the promo cards in Umat and post images stay green.

## Build

See the [repo README](../../README.md).

## Test on desktop

With [morphe-desktop](https://github.com/MorpheApp/morphe-cli/releases) (needs Java 21):

```bash
java -jar morphe-desktop-2.2.0-all.jar patch -p patches/build/libs/patches-<version>.mpp -o muslimpro-patched.apk <Muslim Pro 17.11 APKS>
```

## Getting the APK

Download the `17.11` APKS from APKCube by hand and patch the whole bundle, not its `base.apk`.
Morphe Manager's own lookup only knows APKMirror and Uptodown pages.
