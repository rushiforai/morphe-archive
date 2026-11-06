# FlipSide

Patches for **FlipSide** (`com.dinoster.flipside`, "FlipSide: Cover Screen Player" on Google Play),
version `1.6`, as an APKS bundle (APKCube) or merged APK.

## Patches

Every patch is on by default. Morphe Manager groups them by category.

| Category | Patch | What it does |
|---|---|---|
| Premium | Premium unlock | Unlocks premium on your phone: every locked widget style, preset and feature, with no three-day trial limit. The patched app also opens normally instead of closing on Google Play's license check. |

## How the unlock works

The app stores your purchase in a private `unlocked` preference and every premium check funnels
through one getter, `Unlock.isUnlocked()`: the three-day trial countdown (`isLocked()`), the
locked rows in the preset picker, the widget providers and the entitlement query the cover-screen
widgets use all read it. The patch makes that getter always say "unlocked", so the unlock happens
on your phone only; no purchase is faked on the server. The app can still clear or rewrite the
preference on a billing refresh, it makes no difference to what you see.

The app also ships Google's PairIP protection. At startup it asks Google Play whether the app was
signed by the developer, and closes itself when it was not. A patched app is always signed with
another key, so the patch skips that check.

## Install

The Play Store app must be uninstalled first: it is signed with another key. Uninstalling resets
the app's settings, so note your presets before switching.

## Build

See the [repo README](../../README.md).

## Test on desktop

With [morphe-desktop](https://github.com/MorpheApp/morphe-cli/releases) (needs Java 21):

```bash
java -jar morphe-desktop-1.19.1-all.jar patch -p patches/build/libs/patches-<version>.mpp -o flipside-patched.apk <FlipSide 1.6 APKS>
```

## Getting the APK

Download the `1.6` APKS from APKCube by hand. Morphe Manager's own lookup only knows APKMirror
and Uptodown pages.
