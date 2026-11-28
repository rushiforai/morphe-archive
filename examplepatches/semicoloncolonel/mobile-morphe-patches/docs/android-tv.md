# Android TV

This source patches phone apps only. The Android TV patches are in their own source, [TV Morphe Patches](https://github.com/semicoloncolonel/tv-morphe-patches), which lists the Android TV apps, the tested versions, and how to install them.

Version 1.1.0 is the last release of this source that includes the Android TV apps. Starting version 1.2.0, they are only in the TV source. To keep receiving them, [add the TV source](https://morphe.software/add-source?github=semicoloncolonel/tv-morphe-patches) in Morphe Manager. You can also go to Sources, tap +, choose Remote, and paste `https://raw.githubusercontent.com/semicoloncolonel/tv-morphe-patches/main/patches-bundle.json`.

Some apps, such as Disney+, HBO Max, and Tubi, use one package name for the phone app and the Android TV app. Patch the phone build with this source, and the Android TV build with the TV source.

Please report a problem with an Android TV app in [the TV source's issues](https://github.com/semicoloncolonel/tv-morphe-patches/issues).
