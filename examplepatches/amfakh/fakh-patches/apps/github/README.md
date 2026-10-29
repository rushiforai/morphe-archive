# GitHub

Patches for the GitHub app (`com.github.android`, version `1.282.0`, APKM from APKMirror).

## Patches

Enabled by default.

| Category | Patch | What it does |
|---|---|---|
| Theme | Material You | Colors the app from your wallpaper (Android 12+): the accent color instead of GitHub blue, and tinted surfaces, cards and borders in light and dark mode. Adds a **Fakh Patches** section to Settings with a **Material You** switch and a **Pitch black in dark mode** switch. |

The app draws its screens with both Views and Jetpack Compose, so the patch recolors both: resource
colors for the Views, and the Compose palettes and schemes when the app starts. Markdown and README
bodies are drawn by a WebView with GitHub's own CSS, so they keep their colors. Semantic colors (red,
green, yellow, purple, the diff lines) stay as they are, so a changed line is still easy to spot.

The switches are saved in the app's own settings. **Pitch black in dark mode** applies right away and
only affects dark mode. **Material You** shows a Restart bar, because the palettes are built once per
launch.

Install over the app you already have only if it was patched by the same Morphe Manager keystore;
otherwise Android asks you to uninstall first.

## Test on desktop

With [morphe-desktop](https://github.com/MorpheApp/morphe-cli/releases) (needs Java 21):

```bash
java -jar morphe-desktop-1.19.1-all.jar patch -p patches/build/libs/patches-<version>.mpp -o github-patched.apk com.github.android_1.282.0-953_4arch_6dpi_apkmirror.com.apkm
```

## Getting the APK

Download the `1.282.0` APKM from APKMirror. Morphe Manager looks the app up on APKMirror itself,
so it can take you to that page.
