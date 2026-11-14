# Mobile Morphe Patches

[![Latest release](https://img.shields.io/github/v/release/semicoloncolonel/mobile-morphe-patches?label=release&color=4f46e5)](https://github.com/semicoloncolonel/mobile-morphe-patches/releases/latest) [![81 supported apps](https://img.shields.io/badge/apps-81-0ea5e9)](docs/apps.md) [![7 apps also on Android TV](https://img.shields.io/badge/Android_TV-7_apps-14b8a6)](docs/android-tv.md) [![License: GPL-3.0](https://img.shields.io/github/license/semicoloncolonel/mobile-morphe-patches?color=64748b)](LICENSE)

Morphe patches that remove ads and block tracking in the phone versions of streaming, news, social, shopping, carrier, and government apps.

<p align="center">
  <a href="https://morphe.software/add-source?github=semicoloncolonel/mobile-morphe-patches"><img alt="Add to Morphe Manager" src="https://img.shields.io/badge/%2B_Add_to-Morphe_Manager-4f46e5?style=for-the-badge"></a>
  <br>
  <sub>Open this link on your phone with Morphe Manager installed.</sub>
</p>

<p align="center">
  <a href="#install">Install</a> ·
  <a href="docs/apps.md">Supported apps</a> ·
  <a href="docs/patches.md">What the patches do</a> ·
  <a href="docs/known-issues.md">Known issues</a> ·
  <a href="docs/faq.md">FAQ</a> ·
  <a href="docs/android-tv.md">Android TV</a> ·
  <a href="https://github.com/semicoloncolonel/mobile-morphe-patches/issues/new/choose">Report a problem</a>
</p>

> [!NOTE]
> Some patches are phone ports of [ajstrick81's Android TV patches](https://github.com/ajstrick81/morphe-androidtv-patches), and the original hook designs are their work. For Android TV apps that this project does not list, use the original project.
>
> This project focuses on phone apps that no other patch source covers. The [Morphe patches site](https://morphe-patches.software/) lists the patches from every source, so search it to see what else exists before you request an app. If another source already patches the app you want, please ask its author for updates or new patches.
>
> The patches are built and tested on phones. They may work on tablets, but I can test a tablet only on an Android emulator, so my ability to reproduce a tablet problem is limited.

## Install

1. Download the app in the version listed in [Supported apps](docs/apps.md), which also says whether to use the `.apkm` bundle, the `.apk`, or the Play Store copy. If Morphe Manager does not accept the file, the [FAQ](docs/faq.md) explains how to get the right one.
2. Add this project in Morphe Manager with the link above, or go to Sources, tap +, choose Remote, and paste `https://raw.githubusercontent.com/semicoloncolonel/mobile-morphe-patches/main/patches-bundle.json`.
3. Select the file and apply the patches.

> YouTube TV and Moviebase sign in with Google through MicroG RE, so install it first. The patched YouTube TV installs beside the official app and asks to see MicroG RE's accounts, which Android lists under Contacts. It cannot read your contacts. The patched Moviebase replaces the official app unless you turn on the Clone app option.

On a TV, patch the Android TV build of the app. [Android TV](docs/android-tv.md) explains how to get it.

## Apps

| Category | Apps |
|----------|------|
| [Streaming](docs/apps.md#streaming) | 29 |
| [News](docs/apps.md#news) | 21 |
| [Social](docs/apps.md#social) | 1 |
| [Government](docs/apps.md#government) | 6 |
| [Shopping](docs/apps.md#shopping) | 15 |
| [Carriers](docs/apps.md#carriers) | 7 |

## What the patches do

| Kind | Examples |
|------|----------|
| [Ads](docs/patches.md#ads) | Skip ads, Block ads, Mask live ad breaks, Hide sponsored listings |
| [Pop-ups and prompts](docs/patches.md#pop-ups-and-prompts) | Rating prompts, subscription upsells, surveys, and promo banners |
| [AI features](docs/patches.md#ai-features) | Disable AI, Disable Ask NBA AI, Hide AI summaries |
| [Privacy](docs/patches.md#privacy) | Block analytics & tracking, Block session recording, Hide device identifiers |
| [Playback](docs/patches.md#playback) | Auto-skip, Disable up next, Skip launch video, Start at high quality |
| [Sign-in and startup](docs/patches.md#sign-in-and-startup) | GmsCore support, Remove social sign-in, Faster launch |
| [Needed for the app to run](docs/patches.md#needed-for-the-app-to-run) | Disable Pairip license check, Disable signature check |
| [Extra features](docs/patches.md#extra-features) | Show release times, Watchlist filters, Save videos, Show poll results |

The patches do not currently remove paywalls or unlock paid content.

## Disclaimer

This project is not affiliated with, endorsed by, or sponsored by any of the companies whose apps it patches. All app names and trademarks belong to their owners and are used here only to identify the apps.

This project does not distribute any app, APK, or app code. The patches modify a copy of the app that you supply yourself. Use them on your own devices and accounts, and at your own risk.

## License

GPL-3.0. See [LICENSE](LICENSE) and [NOTICE](NOTICE) for credits.