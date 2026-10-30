# RTL Nieuws

**Supported app:** 12.7.1 · **Build:** 1558 · **Input:** APKS

`nl.rtl.rtlnieuws`

[Download the original APKS](https://buzzheavier.com/lvklis48sf8r){ .md-button .md-button--primary }

Select this file in Morphe Manager to apply the patches.

The standard controls remove the identified built-in ads and block the requests the inspected video-player code uses to load ads. Native promotional campaigns and Swrve campaigns no longer appear either. The tracking patch stops the identified reading and viewing measurements, optional identifiers and known stored measurement data. Push and the privacy and notification settings you open yourself remain available.

## What did we find in the app?

| Activity / service | What our evidence shows | What changes |
| --- | --- | --- |
| Ads and promotional campaigns | The code contains native ad placements, separate video-ad paths, and native and Swrve campaigns. Startup, cached messages or campaign links can select campaigns. | Hide ads stops the inspected native placements and video-ad inputs and blocks campaigns before display. Content, normal playback completion and DRM remain. |
| Reading and viewing measurements | [Snowplow](../trackers/snowplow.md)/DPG, a separate [NMO/FocalMeter](../trackers/kantar-nmo.md) sender, SmartOcto, [Bitmovin](../trackers/bitmovin.md), [Firebase](../trackers/firebase.md) and automatic [Usabilla](../trackers/usabilla.md) events were inspected. App, article and player events can be linked to sessions or users. | Disable tracking stops the inspected collection, re-enablement and separate senders. Optional diagnostics and notification measurements also stop. |
| Identifiers and identity | The inspected code uses optional advertising, App Set and device IDs, and links to external identities. | The optional identifiers and identity links stop. Genuine authentication and the account data it needs remain. |
| Stored measurement data | Firebase transport and the Swrve queue can send previously stored measurement data later. | Known Firebase measurement records and Swrve records of types `event` and `session_start` are filtered, and the patch does not report them as successfully delivered. Unknown transport names and unknown or malformed Swrve records remain. |

## What remains and what is still unknown

Accounts, real purchases, manual feedback, media authorisation, DRM and configuration services remain. With the standard controls, functional Swrve and push services also stay active. These services can still exchange identifiers and IP information. Cast and Billing diagnostics, unknown transport names and remote scripts fall outside complete suppression.

Ads inserted into media by the server or shown in remote web content are not proven removed. The shipped legacy TFK player references a missing Source overload: a version of a player function that was not included. Whether that legacy path runs remains unresolved, and the patch does not guarantee playback through it. The app bundles an Adobe hostname in its configuration, but that does not prove an active sender.

The patches do not create a subscription or guarantee anonymity or zero network traffic. Use the complete original Android 12L+ Play split set.

## Available controls

Disable Swrve (expert), Disable tracking, Hide ads, Skip consent screens.

Hide ads, Disable tracking and Skip consent screens are on by default. Hide ads removes the inspected native ads, video-ad inputs and promotional campaigns, while manual notification settings and push remain available. Disable tracking includes Hide ads and stops the inspected measurements, optional identifiers and known stored measurement data.

Skip consent screens includes both controls. It skips the automatic startup cookie/privacy screen and the notification setup and reminders without saving acceptance or rejection. On a fresh installation, notification groups stay off until you enable them yourself. Manual settings and existing choices remain.

Disable Swrve (expert) is off by default and includes all three standard controls. It also stops the remaining Swrve user, device and configuration exchanges, background activity and push delivery by switching to Swrve's built-in inactive implementation. That reduces the SDK data sharing left by the standard controls, which already block the inspected campaigns and optional events. With this option, push notifications and Swrve channel synchronisation no longer work, so leave it off if you want push notifications. Your local preferences stay stored, and shared Firebase authentication, installation and configuration services remain available.

[Read what each patch changes](../reference/catalogue.md). See [installation](../guides/install.md) for original files and signing, and [choosing patches](../guides/choose-patches.md) for which patches depend on others.

## Evidence

Reviewed 28 October 2026: [tested implementation](https://github.com/johnneerdael/dutch-applications-patches/tree/a55b09a6f8e8acaf1ea0a2944c3b13993831b18f/patches/src/main/kotlin/patches/rtl) at `a55b09a`, and the [final implementation audit](https://github.com/johnneerdael/dutch-applications-patches/blob/ec63c97f0b3cf6e4b9fbd17de4dd2d2bc16ed3bb/docs/rtl-nieuws-audit.md) and [destinations and remaining data](https://github.com/johnneerdael/dutch-applications-patches/blob/ec63c97f0b3cf6e4b9fbd17de4dd2d2bc16ed3bb/docs/privacy/rtl-nieuws/README.md) at `ec63c97`. The user approved stable publication. The audit separates earlier on-device confirmation of the main features from later source and bytecode checks. The approval adds no new complete device test or decrypted network capture, and it does not cover every screen, player or billing scenario. [How to read the evidence](../reference/methodology.md).
