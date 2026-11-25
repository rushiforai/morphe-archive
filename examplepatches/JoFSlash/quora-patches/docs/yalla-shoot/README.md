# Yalla Shoot patches for Morphe

[![Latest release](https://img.shields.io/github/v/release/JoFSlash/morphe-patches?label=release)](https://github.com/JoFSlash/morphe-patches/releases/latest)
[![Downloads](https://img.shields.io/github/downloads/JoFSlash/morphe-patches/total)](https://github.com/JoFSlash/morphe-patches/releases)
[![License](https://img.shields.io/github/license/JoFSlash/morphe-patches)](../../LICENSE)

Patches for the [Yalla Shoot - Live Scores](https://play.google.com/store/apps/details?id=com.yallagroup.yallashoot)
Android app, live football scores, lineups and news, applied with [Morphe](https://morphe.software). The patches
take out the ads and keep the app's Firebase tracking off.

Works with Yalla Shoot <!-- VERSIONS_START -->6.0.15<!-- VERSIONS_END --> on Android 7 or newer. No account and no
root needed.

- **No ads:** no banners, no native ads, no full-screen or rewarded video ads, and the ad networks (Google AdMob
  with AppLovin, Meta Audience Network, Pangle, Liftoff and DT Exchange) are never started.
- **Less tracking:** Firebase Analytics and Crashlytics stay off, and the advertising ID, install-referrer and other
  ad-only permissions are removed.

These patches don't unlock Gold Membership (the subscription) or any paid feature. The patches don't change what your subscription
gives you.

## Before you install

- **The patched app replaces the Play Store version.** It is signed with a different key, so uninstall the Play
  Store version first. Scores and news need no account; if you signed in (for predictions or comments), sign in
  again with your email afterwards.
- **Signing in with Google may not work.** Google signs in only the app signed by Yalla Group. Scores, lineups,
  news and notifications don't need an account.

## Install

1. Install Morphe Manager from [morphe.software](https://morphe.software).
2. Add this repository as a patch source: open
   [this link](https://morphe.software/add-source?github=JoFSlash/morphe-patches) on your phone, or add
   `https://github.com/JoFSlash/morphe-patches` under sources in Morphe Manager.
3. Get a supported version of Yalla Shoot. It isn't on APKMirror or APKPure: download the APK from Yalla Group's
   [own download page](https://www.ysscores.com/en/news/1849696/Download-Yalla-Shoot-App) (signed by Yalla Group),
   or save the Play Store version from your phone. Pick the file in Morphe Manager, then pick the patches you want.
4. Uninstall the Play Store version.
5. Tap Install. Android asks you to allow Morphe Manager to install unknown apps. Google Play Protect may then
   say it hasn't seen the app before: tap **More details** and **Install without scanning**.

## Updating

- **New patches:** a new version of these patches comes out every Saturday when something changed (see
  [Updating](../../README.md#updating)). Morphe Manager then marks the patched app with an Update badge. Patch
  the same Yalla Shoot file again and install it over the patched app. No need to uninstall.
- **New Yalla Shoot version:** the patched app doesn't update from the Play Store. New versions on Google Play
  are noticed automatically every day, but the app has to be added by hand before it can be tested, so support
  can take a few days. When a release of these patches lists the new version as supported, patch that version
  the same way.

## Patches

<!-- PATCHES_START -->
Version 1.13.0, 3 patches. Supported Yalla Shoot versions: 6.0.15.

<details>
<summary><b>Ads</b> (1)</summary>

Banners, native ads, full-screen and rewarded ads.

| Patch | Default | What it does |
| --- | --- | --- |
| Hide ads | on | Hides the banners, the native ads, the full-screen ads and the rewarded video ads, and never starts the ad networks (Google AdMob with AppLovin, Meta, Pangle, Liftoff and DT Exchange). The subscription and any paid feature aren't touched. |

</details>

<details>
<summary><b>Privacy</b> (2)</summary>

Trackers and permissions. They change nothing you see.

| Patch | Default | What it does |
| --- | --- | --- |
| Block tracking | on | Keeps Firebase Analytics and Crashlytics off for good: the app ships them off and turns them on by itself after it starts. Scores, news and notifications aren't touched. |
| Remove unneeded permissions | on | Removes the permissions that only serve advertising and install tracking: the advertising ID, Android's ad services (ad ID and attribution), the Google Play install referrer, the basic phone state and the ad attestation permission the ad SDK asks for. With the ad patch on, nothing in the app uses them. |

</details>
<!-- PATCHES_END -->

## FAQ

**Is hiding ads allowed when "ad-free" is part of the subscription?**
The patches hide what you didn't ask to see on your own phone. They don't touch your subscription or any paid
feature.

**Does the app still show live matches?**
Yes. Scores, match pages, lineups, standings, news and notifications work as before; only the ads and the
tracking are gone. The app is Flutter, so the patches stop the ads where the app asks the ad plugin for them, not
in the screens themselves.

**Something doesn't work.**
Please [open an issue](https://github.com/JoFSlash/morphe-patches/issues/new?template=bug_report.yml) with the
app's version, and leave out your name and any personal details.

## Building

```
./gradlew :patches:buildAndroid
```

Building needs a GitHub token with `read:packages` in `GITHUB_ACTOR` / `GITHUB_TOKEN` (or `gpr.user` /
`gpr.key` in `~/.gradle/gradle.properties`), because the Morphe Gradle plugin comes from GitHub Packages.
`python .github/scripts/check_app.py yalla-shoot <yalla-shoot.apk> --cli <morphe-cli.jar> --install --expect-screen`
applies every patch to the app and starts it on a connected phone or emulator, as the emulator test does.

## License

[GPLv3](../../LICENSE). Yalla Shoot is a trademark of Yalla Group. This project isn't affiliated with Yalla Group
or Morphe.
