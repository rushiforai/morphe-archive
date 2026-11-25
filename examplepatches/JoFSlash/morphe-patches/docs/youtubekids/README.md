# YouTube Kids patches for Morphe

[![Latest release](https://img.shields.io/github/v/release/JoFSlash/morphe-patches?label=release)](https://github.com/JoFSlash/morphe-patches/releases/latest)
[![Downloads](https://img.shields.io/github/downloads/JoFSlash/morphe-patches/total)](https://github.com/JoFSlash/morphe-patches/releases)
[![License](https://img.shields.io/github/license/JoFSlash/morphe-patches)](../../LICENSE)

Patches for [YouTube Kids](https://play.google.com/store/apps/details?id=com.google.android.apps.youtube.kids)
(Google), applied with [Morphe](https://morphe.software). The patches make the app play videos through MicroG-RE
instead of Google Play services, stop its video ads and tracking pings, and skip prompts it shows by itself.

Works with YouTube Kids <!-- VERSIONS_START -->11.47.541<!-- VERSIONS_END --> on Android 7 or newer. No account
and no root needed.

- **No video ads:** no ads before or during videos.
- **Less tracking:** no playback quality, error, ad tracking and remarketing pings, and no interaction events
  about what is tapped and shown. The watch statistics stay, because YouTube fills Watch it again from them.
- **Fewer permissions:** no microphone, storage, app sizes, start at boot or Google services settings.
- **Fewer interruptions:** no "rate the app" card and no parent feature tour in the setup.

YouTube Premium features (background play, downloads) are not part of these patches.

## Before you install

- **Install MicroG-RE first.** A patched YouTube Kids is no longer signed by Google, so Google Play services
  refuses it and the app crashes when a video starts. With GmsCore support it uses
  [MicroG-RE](https://github.com/MorpheApp/MicroG-RE) (`app.revanced.android.gms`) instead.
- **The patched app replaces the Play Store version.** It keeps the package name and is signed with a different
  key, so uninstall the Play Store version first.
- **Use it signed out.** Skip signing in during setup; signing in with a parent's account isn't tested yet.
- **No voice search.** Remove unneeded permissions takes the microphone away and hides the voice search button.
  Turn the patch off if your child searches by voice.

## Install

1. Install Morphe Manager from [morphe.software](https://morphe.software), and MicroG-RE.
2. Add this repository as a patch source: open
   [this link](https://morphe.software/add-source?github=JoFSlash/morphe-patches) on your phone, or add
   `https://github.com/JoFSlash/morphe-patches` under sources in Morphe Manager.
3. Get a supported version of YouTube Kids as an APK, signed by Google. Pick the file in Morphe Manager, then pick
   the patches you want.
4. Uninstall the Play Store version.
5. Tap Install. Android asks you to allow Morphe Manager to install unknown apps. Google Play Protect may then
   say it hasn't seen the app before: tap **More details** and **Install without scanning**.

## Patches

<!-- PATCHES_START -->
Version 1.13.0, 7 patches. Supported YouTube Kids versions: 11.47.541.

<details>
<summary><b>Ads</b> (1)</summary>

The ads YouTube Kids plays before and during videos.

| Patch | Default | What it does |
| --- | --- | --- |
| Hide video ads | on | Stops the ads YouTube Kids plays before and during videos: no ad slot is entered and no player ad is built. |

</details>

<details>
<summary><b>Privacy</b> (2)</summary>

Statistics, tracking pings and permissions. Apart from the voice search button, they change nothing you see.

| Patch | Default | What it does |
| --- | --- | --- |
| Block tracking | on | Stops the playback quality reports, error reports, ad tracking and remarketing pings, and the interaction events (what is tapped and shown). The watch statistics are kept, because Watch it again is filled from them. Analytics in the Google services library is off in the app already, and its Clearcut logs go to MicroG-RE, which drops them. |
| Remove unneeded permissions | on | Removes the microphone permission (voice search), storage access, reading app sizes, starting at boot and reading Google services settings. The voice search button is hidden, as it can't listen any more; typing a search works as before. |

</details>

<details>
<summary><b>App</b> (4)</summary>

What the app needs to play videos without Google Play services, prompts it shows by itself, and the Sign in tab.

| Patch | Default | What it does |
| --- | --- | --- |
| GmsCore support | on | Makes videos play through MicroG-RE instead of Google Play services. A patched app can't use Play services, because it is no longer signed by Google, and Play services stops the player. Needs MicroG-RE (app.revanced.android.gms) installed; without it the app says once that MicroG-RE is missing. |
| Hide review prompt | on | Stops the card that asks to rate YouTube Kids from popping up, as if the app was rated already. |
| Hide Sign in tab | off | Hides the Sign in tab at the bottom while signed out. Off by default: after the setup it is the only way to sign in (Settings has no sign-in button), so with it on you can only sign in by clearing the app's data and choosing Sign in during the setup. |
| Skip parent feature tour | on | Skips the "Parent feature tour" slides in the setup, as if Done was pressed at once. |

</details>
<!-- PATCHES_END -->

## FAQ

**Does it need MicroG-RE?**
Yes, to play videos: Google Play services refuses a re-signed YouTube Kids, and the unpatched check crashes the
app when a video starts. Without MicroG-RE the patched app says once that it is missing.

**Why is Hide Sign in tab off?**
After the setup the Sign in tab is the only way to sign in; Settings has no sign-in button. With the patch on,
signing in means clearing the app's data and choosing Sign in during the setup.

**Why are the watch statistics not blocked?**
Signed out, YouTube fills Watch it again from them. Without the watch time ping it stays empty. The playback
quality, error and ad pings and the interaction events are blocked.

**Something doesn't work.**
Please [open an issue](https://github.com/JoFSlash/morphe-patches/issues/new?template=bug_report.yml) with the
app's version, and leave out your name and any personal details.

## Building

```
./gradlew :patches:buildAndroid
```

Building needs a GitHub token with `read:packages` in `GITHUB_ACTOR` / `GITHUB_TOKEN` (or `gpr.user` /
`gpr.key` in `~/.gradle/gradle.properties`), because the Morphe Gradle plugin comes from GitHub Packages.
`python .github/scripts/check_app.py youtubekids <youtubekids.apk> --cli <morphe-cli.jar> --install --expect-screen`
applies every patch to the app and starts it on a connected phone or emulator, as the emulator test does.

## License

[GPLv3](../../LICENSE). YouTube and YouTube Kids are trademarks of Google LLC. This project isn't affiliated with
Google or Morphe.
