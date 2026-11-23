# FOMO Indonesia

Patches for **FOMO Indonesia** (`id.anon.android`, "FOMO Indonesia" on APKPure),
version `9.0.64`, as an XAPK.

## Patches

| Category | Patch | What it does |
|---|---|---|
| Ads | Hide ads | Hides the FOMO+ upsell cards and banners (such as the "LANGGANAN F+ AJA~" banner) and the sponsored posts in the home feed. |
| Theme | Themed icon | Adds the themed (monochrome) app icon of Android 13 and later, which follows the wallpaper colors. The two chat bubbles keep different shades. |

## How it works

FOMO is a React Native app: every screen lives in one Hermes JavaScript bundle
inside the APK. The home feed draws each server item through one function that
already has a "render nothing" exit. The patch rewrites a few instructions in
place so the four promo item types (`CLIENT_PROMO`, `INTERNAL_PROMO`,
`BANNER_PROMO`, `PROMO`) take that exit. The bundle keeps its size and nothing
is repacked.

## Build

See the [repo README](../../README.md).

## Test on desktop

With [morphe-desktop](https://github.com/MorpheApp/morphe-cli/releases) (needs Java 21):

```bash
java -jar morphe-desktop-2.2.0-all.jar patch -p patches/build/libs/patches-<version>.mpp -o fomo-patched.apk <FOMO Indonesia 9.0.64 XAPK>
```

## Getting the APK

Download the `9.0.64` XAPK from APKPure by hand.
