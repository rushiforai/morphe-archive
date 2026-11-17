<h1 align="center">TV Morphe Patches</h1>

<p align="center">Ad-blocking and anti-tracking patches for Android TV streaming apps.</p>

<p align="center">
  <a href="https://morphe.software/add-source?github=semicoloncolonel/tv-morphe-patches"><img alt="Add to Morphe Manager" src="https://img.shields.io/badge/%2B_Add_to-Morphe_Manager-4f46e5?style=for-the-badge"></a>
  <br>
  <sub>Open this link on the device with Morphe Manager installed.</sub>
  <br><br>
  <a href="https://morphe.software/add-source?github=semicoloncolonel/mobile-morphe-patches"><img alt="Add the phone patches to Morphe Manager" src="https://img.shields.io/badge/%2B_Add_the-phone_patches-4f46e5?style=flat-square"></a>
</p>

These patches are built from [mobile-morphe-patches](https://github.com/semicoloncolonel/mobile-morphe-patches), which holds the source and the documentation. This repository holds the releases, the `patches-bundle.json` that Morphe Manager reads, and the issues for the Android TV apps. Its files are updated automatically, so changes made here are overwritten.

> **New source.** The phone source, mobile-morphe-patches, also lists the Android TV apps in its 1.1.0 release. From 1.2.0, they are only in this source. Hulu (Android TV) is in testing and is marked experimental.

## Install

1. Download the Android TV build of the app, in a version listed in [Supported apps](https://github.com/semicoloncolonel/mobile-morphe-patches/blob/main/docs/android-tv.md), which also explains how to get the Android TV build.
2. Add this source in Morphe Manager with the link above, or go to Sources, tap +, choose Remote, and paste `https://raw.githubusercontent.com/semicoloncolonel/tv-morphe-patches/main/patches-bundle.json`.
3. Select the file and apply the patches.

The phone patches are a separate source, [mobile-morphe-patches](https://github.com/semicoloncolonel/mobile-morphe-patches). To patch phone and Android TV apps in one copy of Morphe Manager, add both sources.

## Apps

<!-- apps:start -->

TV Morphe Patches supports 20 Android TV apps: Apple TV, Disney+, ESPN, Fox One, HBO Max, Hulu, JustWatch, MGM+, MLB, NBA, NewsNation, NFL, PBS, Peacock, Plex, Pluto TV, Prime Video, Starz, Tubi, and YouTube TV. [Supported apps](https://github.com/semicoloncolonel/mobile-morphe-patches/blob/main/docs/android-tv.md) lists the patches and the tested versions for each.

<!-- apps:end -->

## FAQ

### Can you bypass a subscription paywall?

No. This project does not take requests to bypass subscription paywalls. Virtually every streaming service checks your subscription on its own servers before it sends the video, and a patch only changes the app on your device, so no patch can fake that check.

## Report a problem

Open an issue with one of the [forms in this repository](https://github.com/semicoloncolonel/tv-morphe-patches/issues/new/choose). For a security problem, follow the [security policy](SECURITY.md) instead.

## Credits

Some patches are based on [ajstrick81's Android TV patches](https://github.com/ajstrick81/morphe-androidtv-patches), and the original hook designs are their work. [NOTICE](NOTICE) lists every project these patches build on.

## License

[GPLv3](LICENSE), the same license as mobile-morphe-patches.
