# Wikipedia patches for Morphe

[![Latest release](https://img.shields.io/github/v/release/JoFSlash/morphe-patches?label=release)](https://github.com/JoFSlash/morphe-patches/releases/latest)
[![Downloads](https://img.shields.io/github/downloads/JoFSlash/morphe-patches/total)](https://github.com/JoFSlash/morphe-patches/releases)
[![License](https://img.shields.io/github/license/JoFSlash/morphe-patches)](../../LICENSE)

Patches for [Wikipedia](https://play.google.com/store/apps/details?id=org.wikipedia) (Wikimedia Foundation),
the official Wikipedia app, applied with [Morphe](https://morphe.software). The patches hide the fundraising
banners and the prompts the app shows by itself, and stop the usage analytics and the install ID it sends.

Works with Wikipedia <!-- VERSIONS_START -->50619-r-2026-11-18<!-- VERSIONS_END --> on Android 7 or newer. No
account and no root needed.

- **No fundraising pop-ups:** no donation banner over articles, no donation reminders and no "You matter" slide
  in Year in Review. Donate stays in the menu, so you can still give when you want to.
- **No usage analytics:** the app reports what you tap, read and search to Wikimedia, and it has no setting to
  turn that off. These patches stop it.
- **No install ID:** the app sends a permanent ID of your install with every request, which lets all your
  reading on the phone be linked together, signed in or not. The patches leave it out.
- **Fewer interruptions:** no surveys, no full-screen feature announcements, no widget prompts.

Wikipedia has no ads and nothing in it is paid, so there is nothing to unlock. If you use Wikipedia a lot,
consider [donating](https://donate.wikimedia.org) another way.

## Before you install

- **The patched app replaces the Play Store version.** It is signed with a different key, so uninstall the Play
  Store version first. Reading lists synced to your Wikipedia account come back when you sign in again; lists
  that weren't synced stay with the uninstalled app.
- **Push notifications may not arrive.** Google Play services may refuse push messages for a re-signed app. The
  app also checks for notifications (talk page replies, thanks) by itself now and then, so they still come, later.
- **Use the APK bundle (APKM).** Take the universal bundle for Android 7.0+.

## Install

1. Install Morphe Manager from [morphe.software](https://morphe.software).
2. Add this repository as a patch source: open
   [this link](https://morphe.software/add-source?github=JoFSlash/morphe-patches) on your phone, or add
   `https://github.com/JoFSlash/morphe-patches` under sources in Morphe Manager.
3. Get a supported version of Wikipedia from
   [APKMirror](https://www.apkmirror.com/apk/wikimedia-foundation/wikipedia/) as an APK bundle (APKM), the
   Wikimedia Foundation's own (by its certificate). Pick the file in Morphe Manager, then pick the patches you
   want.
4. Uninstall the Play Store version.
5. Tap Install. Android asks you to allow Morphe Manager to install unknown apps. Google Play Protect may then
   say it hasn't seen the app before: tap **More details** and **Install without scanning**.

## Updating

- **New patches:** a new version of these patches comes out every Saturday when something changed (see
  [Updating](../../README.md#updating)). Morphe Manager then marks the patched app with an Update badge. Patch
  the same file again and install it over the patched app. No need to uninstall; your reading lists and
  history stay.
- **New version of Wikipedia:** the patched app doesn't update from the Play Store. New versions on APKMirror are
  noticed automatically every day and tested, so support usually arrives within a day or two. When a release of
  these patches lists the new version as supported, patch that version the same way.

## Patches

<!-- PATCHES_START -->
Version 1.13.0, 11 patches. Supported Wikipedia versions: 50619-r-2026-11-18.

<details>
<summary><b>Donations</b> (2)</summary>

Fundraising banners and donation prompts. You can still donate from the menu.

| Patch | Default | What it does |
| --- | --- | --- |
| Hide Donate buttons | off | Hides the Donate entry in the More menu. Off by default: it is only there for when you want to donate, and Hide donation requests already stops the prompts. |
| Hide donation requests | on | Hides the fundraising banners that pop up over articles, the donation reminder (its setting, the banner on top of articles and its survey) and the "You matter" donation slide in Year in Review. The Donate entry in the menu stays, so you can still donate. |

</details>

<details>
<summary><b>Privacy</b> (5)</summary>

Usage analytics, the install ID and permissions. They change nothing you see.

| Patch | Default | What it does |
| --- | --- | --- |
| Block tracking | on | Stops the usage analytics the app sends to Wikimedia (Event Platform and Test Kitchen events about what you tap, read and search, and how long you use the app) and the Google Play install referrer. The app has no setting for this. Reading, editing, sync and notifications keep working. |
| Don't send install ID | on | Stops sending the app's permanent install ID (the X-WMF-UUID header) with every request to Wikipedia, which lets all your reading and searching on this phone be linked together, signed in or not. Block tracking doesn't cover it. Links to donate and to edit in the browser still carry it, as they need it to come back to the app. |
| Leave experiments | off | Puts you in the control group of every A/B test, so you get the app as it is for everyone and not features Wikimedia is trying out on some users (for example extra notifications about trending articles, semantic search or donation reminders). Off by default, because you also miss new features while they are tested. |
| Remove location access | off | Removes the location permissions, so the app can never ask for or read your location. Only Places (articles about what is near you) uses it: the map still opens and you can move it by hand, but it can't jump to where you are. |
| Remove unneeded permissions | on | Removes the Google Play install referrer, used only for install tracking, and the phone state permission, which a library adds and the app never asks for. |

</details>

<details>
<summary><b>App</b> (3)</summary>

Surveys and prompts the app shows by itself, and parts of the app you may not want.

| Patch | Default | What it does |
| --- | --- | --- |
| Hide feature prompts | on | Stops the screens and dialogs that advertise app features by themselves: the Reading Challenge, Year in Review and "create an account" screens that open over the home screen or an article, the prompts to add the search and Reading Challenge widgets, and the "swipe to explore" hint. The features stay where they are in the app. |
| Hide Games | off | Hides Wikipedia Games (the daily "Which came first?" game): the Games entry in the More menu, the game card on the home screen and the games module in Activity. |
| Hide surveys | on | Stops the feedback surveys that pop up by themselves: the one about the home feed and the one after using Read aloud. Feedback you send yourself still works. |

</details>

<details>
<summary><b>Reading</b> (1)</summary>

Small changes to reading articles.

| Patch | Default | What it does |
| --- | --- | --- |
| Keep screen on while reading | off | Keeps the screen from turning off while an article is open, so it doesn't go dark while you read a long article. The screen turns off as usual elsewhere in the app. |

</details>
<!-- PATCHES_END -->

## FAQ

**Can I still donate?**
Yes. Hide donation requests only stops the prompts; Donate stays in the More menu unless you also turn on Hide
Donate buttons. You can always donate at [donate.wikimedia.org](https://donate.wikimedia.org).

**Does Block tracking break anything?**
No. It stops the analytics events only. Reading, editing, signing in, synced reading lists and notifications
work as before.

**Why is Leave experiments off?**
Wikimedia tries new features on part of its users first. With the patch on you always get the app as everyone
else does, but you also miss those features until they are released to everyone.

**Something doesn't work.**
Please [open an issue](https://github.com/JoFSlash/morphe-patches/issues/new?template=bug_report.yml) with the
app's version, and leave out your name and any personal details.

## Building

```
./gradlew :patches:buildAndroid
```

Building needs a GitHub token with `read:packages` in `GITHUB_ACTOR` / `GITHUB_TOKEN` (or `gpr.user` /
`gpr.key` in `~/.gradle/gradle.properties`), because the Morphe Gradle plugin comes from GitHub Packages.
`python .github/scripts/check_app.py wikipedia <wikipedia.apkm> --cli <morphe-cli.jar> --install --expect-screen`
applies every patch to the app and starts it on a connected phone or emulator, as the emulator test does.

## License

[GPLv3](../../LICENSE). Wikipedia is a trademark of the Wikimedia Foundation, and the Wikipedia app is its
product. This project isn't affiliated with the Wikimedia Foundation or Morphe.
