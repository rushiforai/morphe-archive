# Gearslip

**App version:** 0.3.31-alpha · **Build:** 13 · **Original file:** APK

[Download original app](https://buzzheavier.com/szlgyqfl0ghx){ .md-button .md-button--primary }

Use the official Gearslip APK. **Keep music player entries** and **Hide apps from drawer** also support 0.3.12-alpha, build 12. **Control car display density** requires 0.3.31-alpha, build 13.

## Patches

| Patch | Default | What it does |
| --- | --- | --- |
| **Keep music player entries** | On | Keeps a music app's player available alongside its separate car Settings screen, including YT Music Morphe. |
| **Hide apps from drawer** | On | Places an **Apps** card first under **Car** in Gearslip's phone settings. Every app is ticked by default; untick one to hide its tile from the car drawer. Apps remain installed. |
| **Control car display density** | On | Adds **Car display density** under **Car → Screen**, immediately after **Size**, on the phone. Adjusts text and controls in Gearslip and hosted car apps. **From car** is selected initially, preserving the car's density. |

## Advertising and tracking services

These patches change the app drawer, player selection and car display density. They do not change Gearslip's usage reporting, network services or permissions.

## Before using

Start a track in Gearslip's music screen, return to the map, then use the dock button in the now-playing bar to place the player beside the map. SoundCloud uses Gearslip's existing player. YT Music also needs its separate **Gearslip music browser support** patch.

To choose what the car drawer shows, open the **Apps** card, shown first under **Car** on Gearslip's home screen on your phone. Every app with a car screen or player is ticked. Untick one to hide its tile, and tick it again to bring it back. A music app with a separate Settings tile has a row for each. A tile you pinned to the nav bar stays there, and Gearslip's own tiles such as Settings aren't listed.

For larger text and controls, open **Car → Screen → Car display density** on the phone. The density row is immediately after **Size**. Choose **From car**, **160**, **180**, **200**, **220** or **240 DPI**. Start with **Size → Normal** and **200 DPI**, then try **240 DPI** if needed. The existing **Large** size setting multiplies Gearslip's own scaling. Return to **From car** if controls clip. Reconnect the car or reopen the preview to apply the selection; the preview caption shows the effective density.

Density changes preserve video resolution and touch coordinates, and leave the phone's display, phone mirroring and instrument-cluster display unchanged. The Screen submenu, Apps ordering and 200/240 DPI preview were checked on an Android emulator. The published v1.26.0 bundle also patched the original APK successfully. Physical EONON X3U readability and projection behavior remain unverified.

The launcher and host-identity checks have passed on Android. Signed-in YT Music browsing and playback still need integration testing. A newly signed patched APK cannot update an official installation signed with another key; preserve the existing installation and its data when testing.

[Installation](../guides/install.md) · [Choose patches](../guides/choose-patches.md)
