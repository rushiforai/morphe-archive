# YouTube

**App version:** 21.30.216 · **Build:** 1561187872 · **Original file:** APK

[Use your original APK](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Select the original YouTube APK and patch it together with Morphe Patches. Morphe may rename the installed result to **YouTube Morphe**; that result is not a separate app in this patch source.

These patches add to Morphe Patches for YouTube as a parked app on the car screen, on Android Auto, DriveDeck and other car hosts. They detect the car display by themselves, without a list of allowed apps or hosts.

## Patches

| Patch | Default | What it does |
| --- | --- | --- |
| **Parked app for Android Auto** | On | Declares YouTube a parked video app, so Android Auto and DriveDeck list it on the car screen by themselves. Any version. |
| **Auto-hide navigation bar on car displays** | On | On the car screen, hides the bottom navigation bar after 5 seconds, giving its room to the videos. Swipe up from the bottom edge to show it again. Touching the bar keeps it. |
| **Automotive layout on car displays** | On | Uses the automotive layout on the car screen and the original layout on the phone, also when the app moves between them. Works together with Morphe's Change form factor: on the car screen this patch decides, on the phone Morphe's setting applies. |

**Car display detection** (option of both car display patches):

- **Car displays** (default): Android Auto, while it reports a car connection; DriveDeck, Gearslip, graphene-auto and MyCar, by the name of their car screen; and hosts that give the screen the car mode. Gearslip, graphene-auto and MyCar cannot place YouTube on their car screen yet and mirror the phone screen instead: on Android 15 and later, YouTube on the phone also uses the car layout while it is captured and one of these hosts is installed.
- **Any external display**: every screen other than the phone screen, for other car hosts. It also applies to a TV or a monitor.

**Hide after (seconds)** sets how long the navigation bar stays; 5 by default.

## Advertising and tracking services

These compatibility patches do not remove advertising, tracking, account requirements or subscriptions. YouTube's existing online services remain active.

## Before using

Patch the original app with Morphe Patches and these patches together. Morphe's **Change form factor** can stay selected; its manual Automotive setting is no longer needed in the car, as the car screen uses the automotive layout by itself.

Android Auto lists a parked app that it did not install from Google Play only with **Unknown sources** on in its developer settings. Android Auto takes video apps on newer car screens. DriveDeck lists YouTube under parked apps by itself; you can also add any app with **Add an installed app**.

The automotive layout of YouTube breaks channel pages, playlists, the You tab, the video description and Shorts comments, also on cars with Google built-in. These use the tablet layout instead, as Morphe's Change form factor does; Home and Subscriptions keep the automotive layout.

Tested with 21.30.216 and Morphe Patches 2.1.0 and 2.2.0-dev.3 by patching both together, with Change form factor selected; in DriveDeck's car preview on a phone; and on an emulator with a car screen named the way DriveDeck names it and with another external screen. Android Auto's car connection and the phone mirroring of Gearslip, graphene-auto and MyCar were not tested with a car or head unit.

Use the same signing key as the installed copy for an in-place update.

[Installation](../guides/install.md) · [Choose patches](../guides/choose-patches.md)
