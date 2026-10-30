# Smart Life, Tuya Smart and BARDI

Patches for three apps built on the Tuya SDK. They share one set of patches, so one bundle covers all
of them.

| App | Package | Version | Source |
|---|---|---|---|
| Smart Life | `com.tuya.smartlife` | `7.12.3` | XAPK from APKPure ("SmartLife - Smart Living") |
| Tuya Smart | `com.tuya.smart` | `7.12.3-870` | APKM from APKMirror |
| BARDI Smart Home | `com.bardi.smart.home` | `1.5.3` | XAPK from APKPure |

## Patches

| Category | Patch | Apps | What it does |
|---|---|---|---|
| Layout | Hide Plus button | Smart Life, Tuya Smart | Removes the "Plus" pill from the home header. |
| Layout | Hide Recommended for you | Smart Life, Tuya Smart | Removes the "Recommended for You" section and its cards from the home screen. |
| Layout | Hide AI ask bar | Smart Life, Tuya Smart | Removes the "How can I help?" Tuya AI bar above the bottom navigation. |
| Layout | Hide Explore tab | Smart Life, Tuya Smart | Removes the Explore tab from the bottom navigation. |
| Layout | Hide Rewards Hub | Smart Life, Tuya Smart | Removes the "Rewards Hub" row and its banner from the Me tab. |
| Layout | Hide My Orders | Smart Life, Tuya Smart | Removes the "My Orders" row from the Me tab. |
| Layout | Hide Tuya AI Web Version | Smart Life, Tuya Smart | Removes the "Tuya AI Web Version" row from the Me tab. |
| Layout | Hide Mall tab | BARDI | Removes the Mall tab from the bottom navigation. |
| Layout | Hide Me banner | BARDI | Removes the "Enjoy Your Smart Life" banner and its ad slot from the Me tab. |
| Layout | Hide App Mall | BARDI | Removes the "App Mall" row from the Me tab. |
| Privacy | Hide ads | Smart Life, Tuya Smart | Removes the ad banners and the AdMob ad entry. |
| Privacy | Disable analytics | Smart Life, Tuya Smart | Stops AppsFlyer from tracking installs and in-app events, and turns off Firebase Analytics, Crashlytics and Sessions. Tuya's own usage statistics stay on. |
| Feature | GmsCore support | all | Makes "Sign in with Google" and location work through [microG RE](https://github.com/MorpheApp/microg-RE) instead of Google Play services, so it needs microG RE installed and signed in. Off by default. |

The layout patches, Hide ads and Disable analytics are on by default.

## Signature check

The native security library reads the app's signing certificate and kills the process when it
is not Tuya's, so a resigned app closes a few seconds after it starts. Every patch here pulls in a
hidden helper that makes the app see the original certificate again, through a PackageManager proxy
(the same idea as [ApkSignatureKillerEx](https://github.com/L-JINBIN/ApkSignatureKillerEx)).

The installed app must be replaced: the Play Store build is signed with another key, so uninstall it
first (local data is lost, devices stay in your Tuya account).

## Google sign-in

The app signs in through Android's Credential Manager, which on Android 14+ goes to Google's own
Play services and skips GmsCore. **GmsCore support** turns that framework provider off so the app
falls back to the Play services one, which is pointed at microG RE.

## Build

See the [repo README](../../README.md).

## Test on desktop

With [morphe-desktop](https://github.com/MorpheApp/morphe-cli/releases) (needs Java 21):

```bash
java -jar morphe-desktop-1.19.1-all.jar patch -p patches/build/libs/patches-<version>.mpp -o smartlife-patched.apk <app XAPK or APKM>
```

## Getting the APK

Download the XAPK from APKPure by hand (Smart Life, BARDI) or the APKM from APKMirror (Tuya Smart). Morphe Manager's own lookup only knows APKMirror
and Uptodown pages.
