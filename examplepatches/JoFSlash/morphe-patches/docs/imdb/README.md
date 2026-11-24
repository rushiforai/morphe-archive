# IMDb patches for Morphe

[![Latest release](https://img.shields.io/github/v/release/JoFSlash/morphe-patches?label=release)](https://github.com/JoFSlash/morphe-patches/releases/latest)
[![Downloads](https://img.shields.io/github/downloads/JoFSlash/morphe-patches/total)](https://github.com/JoFSlash/morphe-patches/releases)
[![License](https://img.shields.io/github/license/JoFSlash/morphe-patches)](../../LICENSE)

Patches for the [IMDb](https://play.google.com/store/apps/details?id=com.imdb.mobile) Android app, the movie and
TV database, applied with [Morphe](https://morphe.software). The patches take out the ads and stop the
third-party trackers, so browsing and search run on their own with nothing watching.

Works with IMDb <!-- VERSIONS_START -->9.3.7.109370600<!-- VERSIONS_END --> on Android 11 or newer. Browsing and
search need no account and no root. Signing in with Google needs MicroG-RE (see below).

- **No ads:** IMDb's own "Sponsored" banners (home screen, title pages, search, video feed), the video ads
  before trailers and the banner and inline ads of the ad networks never load, and the ad networks (Amazon
  Publisher Services and Google Ad Manager) are never started.
- **Less tracking:** comScore, Branch, the AWS Pinpoint SDK, the Amazon clickstream and the Play
  install-referrer lookup are stopped, and the advertising-ID, ad-services, install-referrer, phone-state and
  Amazon metrics permissions are removed. Push notifications still come through Braze (they need MicroG-RE).
- **Google sign-in through MicroG-RE:** a re-signed app can't use Google Play services, so Google sign-in and
  push are routed to MicroG-RE instead.
- **Optional:** a separate, off-by-default patch disables Braze too (which also turns off push notifications).

IMDb is free. There is no paid ad-removal tier in the app (IMDbPro is a separate app), so hiding the ads unlocks
nothing you would otherwise pay for. These patches don't touch any account or paid feature.

## Before you install

- **The patched app replaces the Play Store version.** It is signed with a different key, so uninstall the Play
  Store version first. Browsing and search need no account, so there's nothing to sign back in to.
- **MicroG-RE is required for Google sign-in and push notifications.** Like the Kalorické Tabulky and Google Health patches, the patched
  app no longer uses real Google Play services; Google sign-in and push go through
  [MicroG-RE](https://github.com/WSTxda/MicroG-RE) (`app.revanced.android.gms`). Install MicroG-RE and add your
  Google account to it. Without it, the app says once that MicroG-RE is missing. Signing in with IMDb or Amazon
  may refuse a re-signed app; that's a login failure, not an account ban. Browse, search and title pages all work
  logged out.
- **Arm phones only.** IMDb's APK carries arm64 and arm code only; the patched app runs on arm phones (nearly all
  of them), not on an x86 device or emulator without arm translation.

## Install

1. Install Morphe Manager from [morphe.software](https://morphe.software).
2. Add this repository as a patch source: open
   [this link](https://morphe.software/add-source?github=JoFSlash/morphe-patches) on your phone, or add
   `https://github.com/JoFSlash/morphe-patches` under sources in Morphe Manager.
3. Get a supported version of IMDb from [APKPure](https://apkpure.com/imdb-movies-tv/com.imdb.mobile) (IMDb's own,
   by its certificate). Pick the file in Morphe Manager, then pick the patches you want.
4. Uninstall the Play Store version.
5. Tap Install. Android asks you to allow Morphe Manager to install unknown apps. Google Play Protect may then
   say it hasn't seen the app before: tap **More details** and **Install without scanning**.

## Updating

- **New patches:** a new version of these patches comes out every Saturday when something changed (see
  [Updating](../../README.md#updating)). Morphe Manager then marks the patched app with an Update badge. Patch
  the same IMDb file again and install it over the patched app. No need to uninstall.
- **New IMDb version:** the patched app doesn't update from the Play Store. New versions on APKPure are noticed
  automatically every day and tested, so support usually arrives within a day or two. When a release of these
  patches lists the new version as supported, patch that version the same way.

## Patches

<!-- PATCHES_START -->
Version 1.11.0, 6 patches. Supported IMDb versions: 9.3.7.109370600.

<details>
<summary><b>Ads</b> (1)</summary>

IMDb's own Sponsored banners, video ads and the ad networks.

| Patch | Default | What it does |
| --- | --- | --- |
| Hide ads | on | Hides IMDb's own "Sponsored" banners (on the home screen, title pages, search and the video feed) and the video ads before trailers, and doesn't start the ad networks (Amazon Publisher Services and Google Ad Manager). IMDb is free with no paid ad-removal tier, so nothing you pay for is unlocked. |

</details>

<details>
<summary><b>Privacy</b> (3)</summary>

Trackers, permissions and the Braze marketing SDK.

| Patch | Default | What it does |
| --- | --- | --- |
| Block tracking | on | Stops the third-party trackers: comScore audience measurement, Branch attribution, the AWS Pinpoint analytics and endpoint SDK, the Amazon clickstream and the Play install-referrer lookup. Push notifications still come through Braze. Browsing, search and your watchlist aren't touched. |
| Disable Braze | off | Stops the Braze (Appboy) marketing SDK from starting. This also turns off Braze push notifications (with Block tracking on, IMDb then sends no push notifications at all), content cards and in-app messages, so it is off by default; turn it on only if you don't want Braze at all. |
| Remove unneeded permissions | on | Removes the permissions that only serve advertising and tracking: the advertising ID, Android's ad services (ad ID, attribution and topics), the Play install referrer, the phone-state read and Amazon's metrics collection. With the ad and tracking patches on, nothing in the app uses them. |

</details>

<details>
<summary><b>App</b> (2)</summary>

Prompts the app shows by itself, and signing in with Google without Google Play services.

| Patch | Default | What it does |
| --- | --- | --- |
| GmsCore support | on | Makes signing in with Google (and push notifications) work through MicroG-RE instead of Google Play services. A patched app can't use Play services, because it is no longer signed by IMDb. Needs MicroG-RE (app.revanced.android.gms) installed, with your Google account added to it; without it the app says once that MicroG-RE is missing. |
| Hide rating prompt | on | Hides the "Like the IMDb app?" dialog that asks you to rate the app on Google Play. |

</details>
<!-- PATCHES_END -->

## FAQ

**Does hiding ads unlock anything paid?**
No. IMDb is free and has no in-app ad-removal tier (IMDbPro is a separate app). The patches only stop ads and
trackers that run on your own phone; no account or paid feature is touched.

**Does the app still work?**
Yes. Browsing 22M+ titles, search, title and name pages, ratings and your watchlist work as before; only the ads
and the third-party trackers are gone. Signing in is optional and may fail on a re-signed build (a login failure,
not a ban).

**Something doesn't work.**
Please [open an issue](https://github.com/JoFSlash/morphe-patches/issues/new?template=bug_report.yml) with the
app's version, and leave out your name and any personal details.

## Building

```
./gradlew :patches:buildAndroid
```

Building needs a GitHub token with `read:packages` in `GITHUB_ACTOR` / `GITHUB_TOKEN` (or `gpr.user` /
`gpr.key` in `~/.gradle/gradle.properties`), because the Morphe Gradle plugin comes from GitHub Packages.
`python .github/scripts/check_app.py imdb <imdb.apk> --cli <morphe-cli.jar> --install --expect-screen`
applies every patch to the app and starts it on a connected phone or emulator, as the emulator test does.

## License

[GPLv3](../../LICENSE). IMDb is a trademark of IMDb.com, Inc. This project isn't affiliated with IMDb, Amazon or
Morphe.
