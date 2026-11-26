# Todaii Super

Patches for **Todaii Super** (`com.eup.todaiisuper`), version `1.1.5`, as an XAPK from APKPure.

## Patches

Every patch is on by default. Morphe Manager groups them by category.

| Category | Patch | Default | What it does |
|---|---|---|---|
| Feature | GmsCore support | On | Makes Google sign-in work through [microG RE](https://github.com/WSTxda/MicroG-RE) (GmsCore) instead of Google Play services. |
| Premium | Premium unlock | On | Unlocks the client-side Premium checks. |
| Privacy | Disable analytics | On | Stops Firebase Analytics, Crashlytics, Performance and Sessions. |
| Theme | Themed icon | On | Adds the themed (monochrome) app icon of Android 13 and later, which follows the wallpaper colors. |

## How the patches work

**Premium unlock** makes `ConfigPreferences.isPremiumForLanguage` and the `isPremiumFlow` combiner resolve to true, so every screen that reads the Premium state opens. Todaii Super has no ad SDK. Content the server only sends to paying accounts still depends on the server.

**Disable analytics** turns off Firebase Analytics, Crashlytics, Performance and Sessions through their manifest switches and disables `TransportBackendDiscovery`, prevents `SuperApplication.onCreate` from re-enabling Crashlytics at runtime, and stubs the Firebase Analytics event logging helpers. Both patches also stub `Pairip` license checks (`LicenseClient.checkLicense`) so the repackaged APK runs normally.

**GmsCore support** redirects the app's Google Play services calls to microG RE (`app.revanced.android.gms`), disables the Android 14+ system Credential Manager provider so sign-in falls back to Play services / GmsCore, and declares Todaii Super's original signing certificate SHA-1.

## Build

See the [repo README](../../README.md).

## Test on desktop

With [morphe-desktop](https://github.com/MorpheApp/morphe-cli/releases) (needs Java 21):

```bash
java -jar morphe-desktop-2.2.0-all.jar patch -p patches/build/libs/patches-<version>.mpp -o todaiisuper-patched.apk <Todaii Super 1.1.5 XAPK>
```
