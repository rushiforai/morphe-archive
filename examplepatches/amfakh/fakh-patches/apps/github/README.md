# GitHub

Patches for the GitHub app (`com.github.android`, versions `1.282.0`, `1.283.0`, `1.284.0` and `1.285.0`, APKM from APKMirror).

## Patches

Enabled by default.

| Category | Patch | What it does |
|---|---|---|
| Theme | Material You | Colors the app from your wallpaper (Android 12+): the accent color instead of GitHub blue, and tinted surfaces, cards and borders in light and dark mode. Adds a **Fakh Patches** section to Settings with a **Material You** switch and a **Pitch black** switch. |
| Feature | Navigation bar | Adds **Hide tab labels** and **Navigation bar tabs** settings in Fakh Patches that remove the text under the icons of the navigation bar, and choose which tabs it shows and in what order (drag ≡ in the sheet). Adds **Repositories** and **Stars** tabs, off by default, that open your repositories and your starred repositories. |
| Theme | Glass navigation bar | Draws the navigation bar (the side bar in landscape) as a floating, translucent capsule with a sliding selection pill. On by default; the **Liquid Glass navigation bar** switch in Settings turns it off. Slide a finger along the bar to switch tabs, with a haptic tick for each tab. The **Background blur** switch (off by default) blurs what's behind the bar and bends it at the edges on Android 12 and newer. The pill takes the wallpaper accent with Material You and stays neutral gray without it. |
| Privacy | Disable analytics | Turns off GitHub's own analytics, telemetry and health metrics (the **Analytics** and **Crash reporting** switches under Privacy and analytics stay off), and Firebase Analytics, Crashlytics, Performance and Sessions. Push notifications keep working. |
| Feature | Landscape navigation bar position | Adds a **Landscape navigation bar position** setting in Fakh Patches that moves the landscape navigation bar to the left or right edge. |
| Feature | Smaller navigation bar | Adds a **Smaller navigation bar** switch in Fakh Patches that shrinks the navigation bar height, the space between icon and label, and the label text size. |
| Feature | Download assets | Downloads a release asset straight with Android's download manager when you tap **Download** in its menu, instead of opening the browser. Adds a **Download location** setting in Fakh Patches (default folder `GitHub` in Downloads). If the download cannot start, it falls back to the browser. |

The app draws its screens with both Views and Jetpack Compose, so the patch recolors both: resource
colors for the Views, and the Compose palettes and schemes when the app starts. Markdown and README
bodies are drawn by a WebView with GitHub's own CSS, so they keep their colors. Semantic colors (red,
green, yellow, purple, the diff lines) stay as they are, so a changed line is still easy to spot.

The switches are saved in the app's own settings. **Pitch black** applies right away and
only affects dark mode. **Material You** shows a Restart bar, because the palettes are built once per
launch.

Install over the app you already have only if it was patched by the same Morphe Manager keystore;
otherwise Android asks you to uninstall first.

## Test on desktop

With [morphe-desktop](https://github.com/MorpheApp/morphe-cli/releases) (needs Java 21):

```bash
java -jar morphe-desktop-1.19.1-all.jar patch -p patches/build/libs/patches-<version>.mpp -o github-patched.apk com.github.android_1.283.0-954_4arch_6dpi_apkmirror.com.apkm
```

## Getting the APK

Download the `1.285.0` APKM from APKMirror; `1.282.0`, `1.283.0` and `1.284.0` work too. Morphe Manager looks the app up on APKMirror itself,
so it can take you to that page.
