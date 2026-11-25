# Reolink

Watch your Reolink cameras on the car screen of Android Auto and car hosts such as DriveDeck, with Reolink's phone layout and a Back that works.

**App version:** 4.64.3.20261023 · **Build:** 796 · **Original file:** APKM

[Use your original APKM](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Select the complete original APKM archive in Morphe Manager, including the base, architecture and display APKs.

## Patches

| Patch | Default | What it does |
| --- | --- | --- |
| **Parked app for Android Auto** | On | Declares Reolink a parked video app, so Android Auto and hosts that follow the documented discovery list it on the car screen by themselves. |
| **Custom layout for Android Auto** | On | On a car screen, shows Reolink's phone layout across the whole width: the overview, and the camera page with its controls, Playback and Quick reply. Full screen still shows the video alone; Back leaves full screen and then returns to the overview, without rotating. Nothing changes on the phone. |
| **Change package name** | On | Installs the patched Reolink beside the Reolink from the Play Store, which keeps its sign-in, devices and notifications. |
| **Fix push notification registration** | On | Lets the re-signed copy register for push notifications, including with a changed package name. Keeps native FCM delivery and Android's normal notification permission. No MicroG or notification relay is needed. |
| **Doorbell calls through Android Auto** | Off | Experimental. Registers doorbell rings as Telecom audio calls, connecting the car's Answer, Reject, Hang up and mute controls to Reolink's native two-way audio. Adds its own private call service; no video activity is opened. Real car acceptance is pending. |
| **Custom branding** | On | Names the patched copy "Reolink AA" with its own launcher icon. The name and Reolink's original icon can be chosen instead. |

## Before using

A car screen is landscape and never rotates. Reolink's camera page is a portrait layout, and in landscape Reolink shows the video alone, where Back only asks Android to rotate the phone back to portrait. On a car screen that never happens, so Back never leaves the video. The car screen layout gives every Reolink screen its portrait layout across the whole car screen and makes the full-screen button and Back switch the camera page without rotating. It applies on every screen other than the phone's own, whichever car host shows Reolink, such as Android Auto, DriveDeck, AARE or Flywheel: there is no list of allowed hosts. Hosts that mirror the phone screen, such as Gearslip, show Reolink as on the phone.

The patched copy is a separate app with its own data: sign in or add your cameras in it once. Enable **Fix push notification registration** to register the patched copy for alerts, allow Android notifications and enable push for the cameras you want. The patch corrects Firebase Installations' identity headers while keeping Reolink's native notification handling. Registration was verified in the renamed, re-signed Android app; the owner also confirmed enabling push and receiving a real camera notification on the phone.

**Doorbell calls through Android Auto** is a separate experimental option. Open Reolink once after updating to activate app-handled push delivery, and grant microphone access on the phone before use. The integration uses Telecom for doorbell calls on the phone as well as Android Auto, including visitor events sent as ordinary alerts rather than Reolink's optional native call mode. Motion alerts retain their normal notification handling. Calls have no video screen; older devices may still need a background preview transport to provide visitor audio. If the call cannot be registered, Reolink's native notification remains the fallback. Do not treat a successful patch build as proof of Android Auto call controls or two-way car audio.

Android Auto still needs Unknown sources in its developer settings for a patched app. Validated on DriveDeck through Android's desktop head unit: the overview, the live camera page and the playback page show their phone layout across the car screen with the camera picture in its own proportions, and Back returns to the overview, also after opening a camera again. The full-screen switch was not captured in that session.

[Installation](../guides/install.md) · [Choose patches](../guides/choose-patches.md) · [Compatibility and defaults](../reference/catalogue.md)
