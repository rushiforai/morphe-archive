# Confluence

Patches for the Confluence app (`com.atlassian.android.confluence.core`, version `5.26.1.1`, APKM from APKMirror).

## Patches

Enabled by default.

| Category | Patch | What it does |
|---|---|---|
| Theme | Material You | Colors the app from your wallpaper (Android 12+): the accent color instead of Confluence blue on buttons, links, icons and selected items, and tinted surfaces, in light and dark mode. |
| Theme | Pitch black | Turns the dark mode backgrounds black. Works with or without Material You. |
| Theme | Glass navigation bar | Turns the navigation bar into a floating glass capsule with a sliding pill, and gives the Create button, the page's button row and the mini audio player the same glass look. Optional Liquid Glass blur of what is behind them. |
| Feature | Disable Play license check | Stops the Google Play license check from blocking the patched app with a "Get this app from Play" screen. |

Confluence draws its screens with React Native. The patches add a **Fakh Patches** page, opened from the "Rate us" row
in Account settings, with switches for Material You, Pitch black, the glass navigation bar and its background blur.
The gradient behind the Home header keeps its own colors.

Install over the app you already have only if it was patched by the same Morphe Manager keystore;
otherwise Android asks you to uninstall first.

## Test on desktop

With [morphe-desktop](https://github.com/MorpheApp/morphe-cli/releases) (needs Java 21):

```bash
java -jar morphe-desktop-2.2.0-all.jar patch -p patches/build/libs/patches-<version>.mpp -o confluence-patched.apk <confluence-5.26.1.1>.apkm
```

## Getting the APK

Download the `5.26.1.1` APKM from APKMirror. Morphe Manager looks the app up on APKMirror itself,
so it can take you to that page.
