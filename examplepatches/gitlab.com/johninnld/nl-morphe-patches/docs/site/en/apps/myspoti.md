# Myspoti

**App version:** 2.4.1 · **Build:** 1175 · **Original file:** APK

[Use your original APK](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Select the publisher-signed Myspoti APK. **Allow any Android Auto host** and **Custom branding** are compatible with any version whose existing browser access structure is uniquely recognized; an unsupported or ambiguous structure stops patching. **Android Auto Up next** accepts 2.3.0 / 1121, 2.4.0 / 1142 and 2.4.1 / 1175. The version above is the reference input. Myspoti is developed by [kota-zo/myspoti](https://github.com/kota-zo/myspoti). Orpheon, the rebranded Myspoti, has its own [app page](orpheon.md) with the same patches.

[Set up music players and personal libraries in Gearslip](../guides/gearslip-music.md){ .md-button }

## Patches

| Patch | Default | What it does |
| --- | --- | --- |
| **Allow any Android Auto host** | On | Lets any Android Auto compatible host connect to Myspoti's library and playback, such as Google's Android Auto, DriveDeck, Gearslip, MyCar, Flywheel, BetterAuto, AndroidAuto and AARE, whatever its package name or signing key. |
| **Android Auto Up next** | Off | On 2.4.0 and newer, Myspoti already exports the actual current and upcoming playlist/radio queue with metadata and queue selection; this patch can restrict browsing to the host packages you list, and on 2.3.0 it also exports that queue. |
| **Custom branding** | Off | Sets a custom app name and selects one of six bundled Spotify-style launcher icons, or keeps the original icon. |

## Advertising and tracking services

These compatibility patches change browser access and the car host decision. They do not remove online services, supply an account or change subscription access.

## Before using

**Allow any Android Auto host** is on by default and removes the original car-host restriction: every Android Auto compatible host, including third-party systems such as DriveDeck and Gearslip, can browse the library, search and select music for playback. Myspoti's own verification that a caller's UID owns the package it claims stays active, so a forged package claim is still rejected.

Myspoti 2.4.1 publishes its own queue to the media session, so **Android Auto Up next** no longer duplicates it. Enable it only to restrict browsing to an explicit host package list, or on 2.3.0 to export the queue. Enter one or more Android app package names separated by commas, for example `app.johninnl.drivedeck`; every other app is denied browsing, and `com.google.android.projection.gearhead` must be in the list when Google's Android Auto must remain allowed. When the patch is enabled with such a list, that list decides browsing for every host. Repatch to change this choice.

On 2.3.0 / 1121, enable **Android Auto Up next** to export up to 50 actual player occurrences, including the current item, and select upcoming rows through Myspoti's existing queue handler. The user confirmed that the missing Up next behavior was fixed on the phone after the signed APK was installed as an update, preserving app data and the existing Spotify branding.

Enable **Custom branding** to use its **App name** field and **App icon** dropdown. The choices are Original, Classic Spotify Green, Elegant dark Spotify, Emerald Spotify on pitch black, Dark emerald Spotify glass, Platinum Spotify on charcoal, and Black Spotify on warm white. An empty name keeps Myspoti. Name and icon can be changed independently; changing them requires patching again. Branding can be selected together with the other two patches from the same bundle. It changes the Android app label and launcher icon; in-app logos, the splash screen, notification artwork and account access stay as provided by Myspoti.

Sign in to Myspoti before testing the car. A patched APK must be signed again. The publisher-signed installation cannot be updated using a different signing key. Keep it while testing a separate copy; do not uninstall it just to try this patch.

[Installation](../guides/install.md) · [Choose patches](../guides/choose-patches.md)
