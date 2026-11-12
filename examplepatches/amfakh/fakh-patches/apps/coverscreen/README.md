# CoverScreen OS

Patch for **CoverScreen OS** (`apps.ijp.coverscreenos`, "CoverScreen OS Pro" on APKMirror),
version `CSOS_9.0.1_BETA` (244), as an APKM.

## Patches

Enabled by default.

| Category | Patch | What it does |
|---|---|---|
| Premium | Premium unlock | Unlocks Pro on your phone: every premium feature, no ads, no payment screen, and the trial never expires. The Play license check no longer closes the app, and the ad SDKs no longer start. |
| Privacy | Disable analytics | Turns off Firebase Analytics, Crashlytics, Performance and Sessions, and the GIF keyboard no longer sends your advertising ID, device model, carrier or screen size with its ad requests. |

The license is still checked by the app's server, so anything the server decides on its side
stays as it is for a free account.

## Test on desktop

With [morphe-desktop](https://github.com/MorpheApp/morphe-cli/releases) (needs Java 21):

```bash
java -jar morphe-desktop-1.19.1-all.jar patch -p patches/build/libs/patches-<version>.mpp -o coverscreen-patched.apk <CoverScreen OS APKM>
```
