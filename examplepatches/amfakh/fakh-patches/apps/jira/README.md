# Jira

Patches for the Jira app (`com.atlassian.android.jira.core`, version `2026.21.2`, APKM from APKMirror).

## Patches

Enabled by default.

| Category | Patch | What it does |
|---|---|---|
| Theme | Material You | Colors the app from your wallpaper (Android 12+): the accent color instead of Jira blue, and tinted surfaces, in light and dark mode. Adds a **Fakh Patches** card to Settings with **Material You**, **Pitch black**, **Hide Rovo**, **Hide tab labels** switches and a **Navigation bar tabs** row. |
| Theme | Glass navigation bar | Draws the navigation bar as a floating, translucent capsule with a sliding selection pill. It fits its tabs and can hide the tab labels. Slide a finger along the bar to switch tabs, with a haptic tick for each tab. The **Liquid Glass** switch (on by default) blurs what's behind the bar and bends it at the edges on Android 12 and newer. The pill takes the wallpaper accent with Material You and stays neutral gray without it. |
| Feature | Hide Rovo button | Removes the floating Rovo Chat button, the Rovo icon in the issue header and the Rovo "Answers" block in search. |
| Feature | Disable Play license check | Stops the Google Play license check from blocking the patched app with a "Get this app from Play" screen. |

**Material You** is on and **Pitch black** is off until you change them in Fakh Patches. **Pitch black** turns the dark
mode backgrounds black. **Navigation bar tabs** opens a sheet that lists Spaces, All work, Dashboards and Notifications
with a check each; Home is always shown. Changing a switch or a tab shows a "Restart Jira to apply the change" bar,
because the palettes and the navigation bar are built once per launch.

Install over the app you already have only if it was patched by the same Morphe Manager keystore;
otherwise Android asks you to uninstall first.

## Test on desktop

With [morphe-desktop](https://github.com/MorpheApp/morphe-cli/releases) (needs Java 21):

```bash
java -jar morphe-desktop-1.19.1-all.jar patch -p patches/build/libs/patches-<version>.mpp -o jira-patched.apk <jira-2026.21.2>.apkm
```

## Getting the APK

Download the `2026.21.2` APKM from APKMirror. Morphe Manager looks the app up on APKMirror itself,
so it can take you to that page.
