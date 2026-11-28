# Facer Watch Faces

Patches for **Facer Watch Faces** (`com.jeremysteckling.facerrel`), version `7.0.82`:
- Phone: `7.0.82_11172253_mobile_receiver.phone` (`11172253`), APKM from APKMirror
- Wear OS watch companion: `7.0.82_11172254_wear_receiver.watch` (`11172254`), APKM from APKMirror

## Patches

Every patch is on by default. Morphe Manager groups them by category. `Premium unlock` and `Disable analytics` apply to both the phone and Wear OS APKs; the remaining patches target the phone APK only.

| Category | Patch | Target | What it does |
|---|---|---|---|
| Feature | GmsCore support | Phone | Makes "Sign in with Google" work through [microG RE](https://github.com/MorpheApp/microg-RE) (GmsCore) instead of Google Play services, while keeping Wear OS watch sync on Google Play services. Needs microG RE installed and signed in to a Google account. |
| Feature | Stop Featured Looks autoplay | Phone | Pauses Featured Looks video cards on Home at the 1-second frame instead of autoplaying. |
| Feature | Stop video autoplay | Phone | Pauses Looks feed and legacy promo videos at the 1-second frame while keeping Looks Detail playback active. |
| Home | Hide category header emoji | Phone | Removes emoji and icons from Home category headers. |
| Home | Hide hero carousel | Phone | Removes the hero banner carousel at the top of Home. |
| Home | Hide storefront pill icons | Phone | Removes icons from Home storefront filter pills. |
| Home | Hide welcome card | Phone | Removes the "Welcome to Facer" promo card on Home. |
| Layout | Hide Looks like tip | Phone | Removes the "See a Look you like?" onboarding banner from the Looks tab. |
| Premium | Premium unlock | Phone | Unlocks Facer Premium, Facer Plus, and removes ads. |
| Privacy | Disable analytics | Phone | Turns off Firebase Analytics, Crashlytics, Performance and Sessions, plus AppsFlyer. |
| Theme | Dark mode | Phone | Follows the system dark theme across XML and Compose screens, including shimmers, headers, toolbars, Explore, Collection Detail, Watchbox, Settings, and Onboarding. |
| Wear OS | Disable analytics (Wear OS) | Watch | Turns off Firebase Analytics, Crashlytics, Performance and Sessions, plus AppsFlyer on the Wear OS companion app. |
| Wear OS | Premium unlock (Wear OS) | Watch | Unlocks Facer Premium and Facer Plus on the Wear OS companion app. |

## Wear OS companion note

Facer syncs watchfaces and premium state between phone and watch over the Google Play services Wearable Data Layer (`com.google.android.gms.wearable`). Android requires both the phone app and the Wear OS companion app to be signed with the **same certificate** for Data Layer messages to be delivered.

Patch both the phone APKM and the watch APKM with the same keystore (for example Morphe Manager's keystore), then install the watch APK onto your Wear OS watch over wireless ADB:

```bash
adb -s <watch-ip>:<port> install -r facer-watch-patched.apk
```

## How the unlock works

Facer checks `isUserPremium` / `isUserPlus` on its local user state (`DomainUserState` and `User` on both phone and watch). The patch forces those flags to `true` and disables the AdMob init provider, so ads and local premium gates disappear without faking any server purchase.

## How Google sign-in works with Wear OS

**GmsCore support** redirects Google Sign-In to microG RE (`app.revanced.android.gms`) with Facer's original signing certificate SHA-1, then restores the Wearable SDK (`com.google.android.gms.wearable.*`, `UidVerifier`, and `GoogleSignatureVerifier`) back to real Google Play services (`com.google.android.gms`). Sign in with Google works through microG RE without breaking watchface syncing to Wear OS.

## Build

See the [repo README](../../README.md).

## Test on desktop

With [morphe-desktop](https://github.com/MorpheApp/morphe-cli/releases) (needs Java 21):

```bash
java -jar morphe-desktop-2.2.0-all.jar patch -p patches/build/libs/patches-<version>.mpp --keystore ~/.morphe/morphe-manager.keystore -o facer-patched.apk <Facer phone APKM>
java -jar morphe-desktop-2.2.0-all.jar patch -p patches/build/libs/patches-<version>.mpp --exclusive -e "Premium unlock (Wear OS)" -e "Disable analytics (Wear OS)" --keystore ~/.morphe/morphe-manager.keystore -o facer-watch-patched.apk <Facer watch APKM>
```

## Getting the APK

Download the `7.0.82` phone and Wear OS APKMs from APKMirror. Morphe Manager looks the app up on APKMirror itself.
