# SledgeSune's Morphe Patches

> [!CAUTION]
> ## ⚠️ MADE BY AI, NOT BY ME ⚠️
>
> **Every patch and every line of code here was written by Claude (an AI by Anthropic), not by me.**
> I don't know how any of it works, and I won't fix it, support it or answer questions about it.
>
> **For my own personal use only.** Tested only on my own phone, if at all.
> It may break your app, lose your data or stop working at any time. **Use at your own risk.**
> No warranty of any kind (see the [license](LICENSE)).

My collection of [Morphe](https://github.com/MorpheApp) patches. Any patch I make goes here.

<a href="https://morphe.software/add-source?github=SledgeSune/morphe-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

Or add `https://github.com/SledgeSune/morphe-patches` as a patch source in Morphe Manager.

## Patches

<!-- PATCHES_START EXPANDED -->
> **[v1.3.0](https://github.com/SledgeSune/morphe-patches/releases/tag/v1.3.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;9 patches total
<details open>
<summary>📦 Waze&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

**Package name:** `com.waze`

**🎯 Supported versions:**

| 5.27.4.900 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable reroute auto-accept](#disable-reroute-auto-accept) | Removes the countdown from the "faster route found" prompt while driving, so the route only changes when you tap the button yourself. |  |
| [Keep Waze alive](#keep-waze-alive) | Lets Waze stay open in the background longer before it closes itself (Waze's "background timeout", normally set by Waze's servers). | • Time in the background |
| [Remove ads](#remove-ads) | Removes sponsored pins on the map, sponsored search results, the full-screen ad when stopped and promotional launch screens. |  |
| [Trip history](#trip-history) | Records how long each drive took and how far you drove. Shows it next to each place under Recent in "Where to?", and lists all drives under "Trip history" in the side menu. |  |

</details>

<details open>
<summary>📦 Sync.ME&nbsp;&nbsp;•&nbsp;&nbsp;5 patches</summary>
<br>

**Package name:** `com.syncme.syncmeapp`

**🎯 Supported versions:**

| 4.71.2.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable tracking](#disable-tracking) | Stops usage analytics from being sent to Firebase, Mixpanel, Singular and Facebook. |  |
| [Hide ads](#hide-ads) | Removes all ads (banners, native, interstitial and app-open ads), the same way the "No Ads" purchase does. Other Premium features stay locked. |  |
| [Hide upgrade prompts](#hide-upgrade-prompts) | Skips the "Go Pro" screen after sign-up and hides Premium sales banners, the Premium sheet after SMS, Premium promo notifications and upgrade banners in the call history. |  |
| [Keep navigation bar](#keep-navigation-bar) | Stops "aggressive mode" from hiding the phone's navigation bar. |  |
| [Skip app promotions](#skip-app-promotions) | Removes the "free gift" card after calls and banners promoting other apps. |  |

</details>

<!-- PATCHES_END -->

## Privacy

- The patches only change the app on your phone. They don't send anything anywhere.
- "Disable tracking" stops analytics, but the patched app still talks to its own servers for its normal features
  (for Sync.ME: caller ID and contact sync).

## Build

Needs JDK 21, the Android SDK, and a GitHub token with `read:packages` set as `gpr.user` / `gpr.key`
in `~/.gradle/gradle.properties`.

```
./gradlew buildAndroid
```

The bundle ends up in `patches/build/libs/patches-*.mpp`. Load it in Morphe Manager or Morphe Desktop.

## License

[GPLv3](LICENSE). Built from the [Morphe patches template](https://github.com/MorpheApp/morphe-patches-template).
