# Orpheon

**App version:** 1.0.0 · **Build:** 1194 · **Original file:** APK

[Use your original APK](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Orpheon is the rebranded Myspoti music app: the same code and media session, published under its own package name. Select the publisher-signed Orpheon APK. **Allow any Android Auto host** and **Custom branding** are compatible with any version whose existing browser access structure is uniquely recognized; an unsupported or ambiguous structure stops patching. **Android Auto Up next** accepts 1.0.0 / 1194. The version above is the reference input. Myspoti itself stays available on its own [app page](myspoti.md).

!!! warning "Orpheon 1.0.0 removed Spotify functionality"
    The non-beta Orpheon 1.0.0 release no longer provides any Spotify functionality. These patches only change Android Auto browser access, queue publication and branding for the app's own library.

[Set up music players and personal libraries in Gearslip](../guides/gearslip-music.md){ .md-button }

## Patches

| Patch | Default | What it does |
| --- | --- | --- |
| **Allow any Android Auto host** | On | Lets any Android Auto compatible host connect to Orpheon's library and playback, such as Google's Android Auto, DriveDeck, Gearslip, MyCar, Flywheel, BetterAuto, AndroidAuto and AARE, whatever its package name or signing key. |
| **Android Auto Up next** | Off | Orpheon already exports the actual current and upcoming playlist/radio queue with metadata and queue selection itself; this patch can restrict browsing to the host packages you list. |
| **Custom branding** | Off | Sets a custom app name and selects one of six bundled Spotify-style launcher icons, or keeps the original icon. |

## Advertising and tracking services

These compatibility patches change browser access and the car host decision. They do not remove online services, supply an account or change subscription access.

## Before using

**Allow any Android Auto host** is on by default and removes the original car-host restriction: every Android Auto compatible host, including third-party systems such as DriveDeck and Gearslip, can browse the library, search and select music for playback. Orpheon's own verification that a caller's UID owns the package it claims stays active, so a forged package claim is still rejected.

Orpheon publishes its own queue to the media session, so **Android Auto Up next** does not duplicate it. Enable it only to restrict browsing to an explicit host package list. Enter one or more Android app package names separated by commas, for example `app.johninnl.drivedeck`; every other app is denied browsing, and `com.google.android.projection.gearhead` must be in the list when Google's Android Auto must remain allowed. When the patch is enabled with such a list, that list decides browsing for every host. Repatch to change this choice.

Enable **Custom branding** to use its **App name** field and **App icon** dropdown. The choices are Original, Classic Spotify Green, Elegant dark Spotify, Emerald Spotify on pitch black, Dark emerald Spotify glass, Platinum Spotify on charcoal, and Black Spotify on warm white. An empty name keeps Orpheon. Name and icon can be changed independently; changing them requires patching again. Branding can be selected together with the other two patches from the same bundle. It changes the Android app label and launcher icon; in-app logos, the splash screen, notification artwork and account access stay as provided by Orpheon.

Orpheon is the released rebrand of Myspoti. Sign in before testing the car and keep the publisher-signed installation: a patched APK must be signed again and cannot update an installation signed with a different key.

[Installation](../guides/install.md) · [Choose patches](../guides/choose-patches.md)
