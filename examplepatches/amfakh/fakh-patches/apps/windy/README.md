# Windy

Patches for **Windy** (`com.windyty.android`, "Windy.com - Weather Forecast" on APKMirror),
versions `51.3.2` and `51.4.4`, as an APKM.

## Patches

Every patch is on by default. Morphe Manager groups them by category.

| Category | Patch | Default | What it does |
|---|---|---|---|
| Feature | GmsCore support | On | Makes "Log in with Google" work through [microG RE](https://github.com/WSTxda/MicroG-RE) (GmsCore) instead of Google Play services. |
| Premium | Premium unlock | On | Unlocks Windy Pro on your phone: deeper map zoom, 1-hour forecast steps, the premium calendar view and the rest of the premium screens. The "Go Premium" button disappears. |

## How the unlock works

Windy is a web app inside an Android shell: all of its screens, including every subscription
check, come from one JavaScript file shipped in the APK. The patch edits that file so the app
treats you as a Pro subscriber from the moment it starts, and keeps doing so after your
account answers that you have no subscription or after you log out.

No server is contacted to fake a purchase. Windy's servers still see a free account, so anything
they decide on their side stays as it is for free users.

## How Google sign-in works

**GmsCore support** redirects the app's Google Play services calls to microG RE (`app.revanced.android.gms`), disables the
Android 14+ system Credential Manager provider so sign-in goes through Play services / GmsCore, and declares Windy's
original signing certificate SHA-1. A toast tells the user to install microG RE when "Log in with Google" is tapped
without it.

## Test on desktop

With [morphe-desktop](https://github.com/MorpheApp/morphe-cli/releases) (needs Java 21):

```bash
java -jar morphe-desktop-1.19.1-all.jar patch -p patches/build/libs/patches-<version>.mpp -o windy-patched.apk <Windy APKM>
```

## Getting the APK

Download the `51.3.2` or `51.4.4` APKM from APKMirror. Morphe Manager looks the app up on APKMirror itself,
so it can take you to that page.
