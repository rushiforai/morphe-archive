# Windy

Patch for **Windy** (`com.windyty.android`, "Windy.com - Weather Forecast" on APKMirror),
version `51.3.2`, as an APKM.

## Patches

Enabled by default.

| Category | Patch | What it does |
|---|---|---|
| Premium | Unlock Premium | Unlocks Windy Pro on your phone: deeper map zoom, 1-hour forecast steps, the premium calendar view and the rest of the premium screens. The "Go Premium" button disappears. |

## How the unlock works

Windy is a web app inside an Android shell: all of its screens, including every subscription
check, come from one JavaScript file shipped in the APK. The patch edits that file so the app
treats you as a Pro subscriber from the moment it starts, and keeps doing so after your
account answers that you have no subscription or after you log out.

No server is contacted to fake a purchase. Windy's servers still see a free account, so anything
they decide on their side stays as it is for free users.

## Test on desktop

With [morphe-desktop](https://github.com/MorpheApp/morphe-cli/releases) (needs Java 21):

```bash
java -jar morphe-desktop-1.19.1-all.jar patch -p patches/build/libs/patches-<version>.mpp -o windy-patched.apk <Windy 51.3.2 APKM>
```

## Getting the APK

Download the `51.3.2` APKM from APKMirror. Morphe Manager looks the app up on APKMirror itself,
so it can take you to that page.
