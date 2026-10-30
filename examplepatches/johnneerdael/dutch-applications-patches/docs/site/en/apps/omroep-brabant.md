# Omroep Brabant

**Supported app:** 11.1.0 · **Build:** 7331764 · **Input:** APKS

`nl.omroepbrabant.android`

[Download the original APKS](https://buzzheavier.com/hkxqb9c6hj02){ .md-button .md-button--primary }

Select this file in Morphe Manager to apply the patches.

The patches remove the identified ads and promotional recommendations from feeds, articles and video. They also stop the inspected reading and viewing measurements and optional advertising identifiers. News, local reading history, radio, video and push services keep their existing code paths.

## What did we find in the app?

| Activity / service | What our evidence shows | What changes |
| --- | --- | --- |
| Ads and recommendations | Pinch, Outbrain and Start.io supply native ad placements and promotional widgets. Blue Billywig has separate video-ad paths. | Hide ads omits the inspected placements, their empty space and video-ad inputs while retaining content and player completion. |
| Reading measurements | [ContentInsights/Smartocto](../trackers/additional-services.md#editorial-analytics) records article, session and reading activity. [Piano](../trackers/additional-services.md#piano) receives article and screen context. The publisher's own `event/readarticle` request carries an article ID and an Android-derived device ID. | Disable tracking stops the inspected collectors and the separate read-history upload. Articles you have read remain in the local history on your phone. |
| Audience IDs | An independent [NMO client](../trackers/kantar-nmo.md) uses a stored random ID and passes it to Piano. Optional advertising IDs can also connect records. | The inspected NMO registration, cached-ID lookup and optional advertising-ID paths stop. Existing stored identifiers are not claimed deleted. |
| Video statistics and diagnostics | [Blue Billywig](../trackers/additional-services.md#media-telemetry) has statistics code separate from playback. [Firebase](../trackers/firebase.md) includes usage, crash, session and notification measurements. Some records can wait locally for a later upload. | The patch stops the inspected statistics and diagnostic senders and filters four known stored Firebase measurement types. Unknown types remain. Necessary configuration, installation and push services remain available. |

## What remains and what is still unknown

Content and configuration requests still run. Accounts, genuine purchases, media authorisation, radio, live video, casting and Android Auto keep their existing behaviour. Removing optional measurements does not make these remaining requests anonymous.

The inspected player still receives its own playback events. Remote web content, third-party scripts, overlays and ads inserted into the stream by a server are not proven removed. The exact upload addresses for some SDKs were not established. The shared publisher and media hosts also deliver useful content, so blocking those hosts entirely would affect more than tracking.

The patches do not create a subscription or unlock content withheld by a backend. Use the complete original Android 12L+ Play split set.

## Available controls

Disable tracking, Hide ads, Skip consent screens.

All three are on by default. Hide ads removes the inspected native ads, promotional widgets and video-ad paths. Disable tracking includes Hide ads and stops the inspected measurements, optional identifiers and known queued uploads.

Skip consent screens includes both controls. It prevents the automatic startup notification request and the cookie dialog, and removes Cookie instellingen from the menu. It does not save acceptance or rejection. Existing choices, manual Android notification settings and the privacy gates for embeds you choose to open remain. With this option, enable notifications yourself in the app's notification settings if you want them.

[Read what each patch changes](../reference/catalogue.md). See [installation](../guides/install.md) for original files and signing, and [choosing patches](../guides/choose-patches.md) for which patches depend on others.

## Evidence

The maintainer approved stable publication on 29 October 2026. Evidence pinned at `a01857d`: [implementation audit](https://github.com/johnneerdael/dutch-applications-patches/blob/a01857d70b419c677ebdeda56839d316ae69608b/docs/omroep-brabant-audit.md) and [destinations, data and remaining exposure](https://github.com/johnneerdael/dutch-applications-patches/blob/a01857d70b419c677ebdeda56839d316ae69608b/docs/privacy/omroep-brabant/README.md). The approval promotes the existing dev implementation and implies no new device or network test. The recorded checks cover the original app and each patch selection, including the combined selection. Android rendering, playback on every device and residual network activity remain separate runtime questions. [How to read the evidence](../reference/methodology.md).
