# Bitmovin: what does a video player report besides the video request?

## Is playing a video the same as measuring it?

Bitmovin supplies playback technology and a separate analytics collector. A **player** retrieves and displays media. A **collector** observes player events and sends measurement records. The player and collector can be connected, but they serve different purposes. Bitmovin describes analytics setup as attaching a collector that listens to player events. [Bitmovin collector setup](https://developer.bitmovin.com/playback/docs/setup-analytics).

Its analytics field reference includes buffering, startup timing, playback technology, approximate city/country, advertising fields and optional customer-provided user IDs or custom data. These are product capabilities, not a checklist of fields proven present in Buienradar. An app can configure different fields or omit optional ones. [Analytics field reference](https://developer.bitmovin.com/playback/docs/analytics-api-fields).

## What can viewing telemetry reveal?

**Hypothetical example:** an event sequence records a particular video starting, buffering twice and stopping halfway. That can diagnose a poor connection. If attached to a stable ID, repeated sequences can also describe what one installation watches and when it stops. These measurements can describe both technical performance and viewing behaviour. This example explains what is possible; it is not an observed viewing history.

The important questions are what the app sends, which identifier accompanies it and whether the collector is required for playback. The service delivering the video stream also receives network metadata when the app requests it. Removing the analytics collector does not stop that functional exchange.

## What did we find in Buienradar?

[Buienradar 7.4.8](../apps/buienradar.md) passes enabled analytics configurations for both the Bitmovin player and its source. The identified receiving address is `analytics-ingress-global.bitmovin.com`. The same audit traces a separate Smartocto video-play request. The Smartocto code uses a separate collector. [Buienradar investigation](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/BUIENRADAR_TRACKING_AUDIT.md), [related media services](additional-services.md#editorial-analytics).

## What changes after patching?

**Disable tracking** changes the player and video-source settings so the measurement collector is no longer attached. Video playback and Bitmovin licensing checks continue, so some functional traffic with Bitmovin remains.

This finding is based on the inspected configuration, code path and patched output. It does not establish the exact fields transmitted in a real viewing session, the provider's retention period or the behaviour of an unknown future remote player integration.

## What changes in RTL Nieuws?

With **Disable tracking** in [RTL Nieuws 12.7.1 (build 1558)](../apps/rtl-nieuws.md), the inspected optional video measurement stops without replacing the player or video source. The patch disables video-measurement configurations and stops both the Bitmovin analytics connections for the player and source and the separate Smartocto senders. The inspected measurement code covers video IDs and player events such as play, pause, progress, seeking, buffering and errors. The inspected code and SDK identify `analytics-ingress-global.bitmovin.com` and `ingestion.smartocto.com` as measurement destinations.

Content metadata, playback authorisation and DRM retain their own functions. This does not guarantee every player works: the legacy TFK player's compatibility issue remains unresolved. Ads inserted into the stream and remotely embedded content also fall outside a blanket removal claim. These destinations and code paths were inspected; no new viewing-session traffic was captured. [RTL Nieuws investigation](https://github.com/johnneerdael/dutch-applications-patches/blob/ec63c97f0b3cf6e4b9fbd17de4dd2d2bc16ed3bb/docs/rtl-nieuws-audit.md).

Evidence reviewed **28 October 2026**. Read [how tracking works](../learn/how-tracking-works.md) and [our methodology](../reference/methodology.md).
