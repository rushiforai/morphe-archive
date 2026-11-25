# Speedtest by Ookla patches for Morphe

[![Latest release](https://img.shields.io/github/v/release/JoFSlash/morphe-patches?label=release)](https://github.com/JoFSlash/morphe-patches/releases/latest)
[![Downloads](https://img.shields.io/github/downloads/JoFSlash/morphe-patches/total)](https://github.com/JoFSlash/morphe-patches/releases)
[![License](https://img.shields.io/github/license/JoFSlash/morphe-patches)](../../LICENSE)

Patches for the [Speedtest by Ookla](https://play.google.com/store/apps/details?id=org.zwanoo.android.speedtest)
Android app, the internet speed test, applied with [Morphe](https://morphe.software). The patches take out the
ads and stop the third-party trackers, so the speed test runs on its own with nothing watching.

Works with Speedtest <!-- VERSIONS_START -->7.1.5<!-- VERSIONS_END --> on Android 9 or newer. No account and no
root needed.

- **No ads:** no banner and no ad after a speed test, and the ad networks (Google Ad Manager, Prebid and Amazon)
  are never started.
- **Less tracking:** the Appvestor monetization SDK and the CellRebel SDK (which collects and sells network and
  coverage measurements) are stopped, Firebase Analytics and Crashlytics stay off, and the advertising ID and
  install-referrer permissions are removed.
- **No nagging:** no Google Play "rate the app" dialog.

These patches don't unlock Speedtest Premium (ad-free, VPN or any paid feature). Those run on Ookla's servers and
need a subscription; the patches don't change what your subscription gives you.

## Before you install

- **The patched app replaces the Play Store version.** It is signed with a different key, so uninstall the Play
  Store version first. The speed test needs no account, so there's nothing to sign back in to.
- **Arm phones only.** The Play Store APK of Speedtest is arm64 only; the patched app runs on arm phones (nearly
  all of them), not on an x86 device or emulator without arm translation.

## Install

1. Install Morphe Manager from [morphe.software](https://morphe.software).
2. Add this repository as a patch source: open
   [this link](https://morphe.software/add-source?github=JoFSlash/morphe-patches) on your phone, or add
   `https://github.com/JoFSlash/morphe-patches` under sources in Morphe Manager.
3. Get a supported version of Speedtest from
   [APKMirror](https://www.apkmirror.com/apk/ookla/speedtest/) (Ookla's own, by its certificate). Pick the file
   in Morphe Manager, then pick the patches you want.
4. Uninstall the Play Store version.
5. Tap Install. Android asks you to allow Morphe Manager to install unknown apps. Google Play Protect may then
   say it hasn't seen the app before: tap **More details** and **Install without scanning**.

## Updating

- **New patches:** a new version of these patches comes out every Saturday when something changed (see
  [Updating](../../README.md#updating)). Morphe Manager then marks the patched app with an Update badge. Patch
  the same Speedtest file again and install it over the patched app. No need to uninstall.
- **New Speedtest version:** the patched app doesn't update from the Play Store. New versions on APKMirror are
  noticed automatically every day and tested, so support usually arrives within a day or two. When a release of
  these patches lists the new version as supported, patch that version the same way.

## Patches

<!-- PATCHES_START -->
Version 1.13.0, 4 patches. Supported Speedtest versions: 7.1.5.

<details>
<summary><b>Ads</b> (1)</summary>

The banner and the ad after a speed test.

| Patch | Default | What it does |
| --- | --- | --- |
| Hide ads | on | Hides the banner and the ad after a speed test, and never starts the ad networks (Google Ad Manager, Prebid and Amazon) or asks for ad consent. Premium and your subscription aren't touched. |

</details>

<details>
<summary><b>Privacy</b> (2)</summary>

Trackers and permissions. They change nothing you see.

| Patch | Default | What it does |
| --- | --- | --- |
| Block tracking | on | Stops the third-party trackers: the Appvestor monetization SDK and the CellRebel SDK that collects and sells network and coverage measurements. Firebase Analytics and Crashlytics stay off (they already ship off). The speed test and your results aren't touched. |
| Remove unneeded permissions | on | Removes the permissions that only serve advertising and install tracking: the advertising ID, Android's ad services (ad ID, attribution and topics) and the Google Play install referrer. With the ad and tracking patches on, nothing in the app uses them. |

</details>

<details>
<summary><b>App</b> (1)</summary>

Prompts the app shows by itself.

| Patch | Default | What it does |
| --- | --- | --- |
| Hide rating prompts | on | Stops the Google Play in-app review dialog that asks you to rate the app. |

</details>
<!-- PATCHES_END -->

## FAQ

**Is hiding ads allowed when "ad-free" is a paid add-on?**
The patches hide what you didn't ask to see on your own phone. They don't touch your subscription or any paid
feature, and Premium works as before if you have it.

**Does the speed test still work?**
Yes. The test, the result history, the coverage map and the rest of the app work as before; only the ads and the
third-party trackers are gone. Measuring your connection still talks to Ookla's own servers.

**Something doesn't work.**
Please [open an issue](https://github.com/JoFSlash/morphe-patches/issues/new?template=bug_report.yml) with the
app's version, and leave out your name and any personal details.

## Building

```
./gradlew :patches:buildAndroid
```

Building needs a GitHub token with `read:packages` in `GITHUB_ACTOR` / `GITHUB_TOKEN` (or `gpr.user` /
`gpr.key` in `~/.gradle/gradle.properties`), because the Morphe Gradle plugin comes from GitHub Packages.
`python .github/scripts/check_app.py speedtest <speedtest.apk> --cli <morphe-cli.jar> --install --expect-screen`
applies every patch to the app and starts it on a connected phone or emulator, as the emulator test does.

## License

[GPLv3](../../LICENSE). Speedtest by Ookla is a trademark of Ookla, LLC. This project isn't affiliated with Ookla
or Morphe.
