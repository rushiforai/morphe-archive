# Didomi: why separate consent choices from consent-service metrics?

## What does Didomi provide?

Didomi supplies a consent management platform. It displays privacy notices, lists purposes and vendors, and stores your choices. Its Android setup supports settings fetched from a server and a preferences screen. Its API has separate functions for checking whether to ask for a choice and for recording a decision. Checking whether a screen is needed is therefore different from saving a consent choice. [Android setup](https://developers.didomi.io/cmp/mobile-sdk/android/setup), [Android API](https://developers.didomi.io/cmp/mobile-sdk/android/reference/api).

An **API** is an interface through which code asks another component or service to do something. A privacy SDK can use APIs for functional configuration and choices, while also having metrics about its own performance or use. Examine configuration, choices and measurement separately even when they share a provider or hostname.

## Why can hiding a notice be insufficient?

**Hypothetical example:** an app stops displaying its cookie notice, but an already initialised analytics component still sends screen events. Blocking every consent-service request could also stop the manual preference screen from working. You therefore need to check separately what happens to the measurement code, saved choices and privacy screens. This example describes possible design choices; no session was recorded.

## What did the inspected apps contain?

In [Buienalarm 4.32.0](../apps/buienalarm.md), the patch disables the function that allows Didomi's performance and API metrics. You can still manage preferences manually, and the app can still use saved consent choices. The exact receiving host for these metrics was not established.

In [Weeronline 3.61.0](../apps/weeronline.md), optional metrics likewise stop, while configuration and consent API events remain. The SDK identifies configuration/API destinations including `sdk.privacy-center.org` and `mobile-2470.api.privacy-center.org`; this is not proof that all requests there are tracking. [Buienalarm investigation](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/TRACKING_AUDIT.md), [Weeronline investigation](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/WEERONLINE_TRACKING_AUDIT.md), [destination evidence](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/TRACKING_DESTINATIONS.md).

[Weerplaza 3.13.1](../apps/weerplaza.md) also stops the inspected native API event queue, the functions that process and send those queued events, and the exact web `/v1/events` and `/v1/sync` routes. Other configuration and manual privacy choices remain available. These extra measures were established for Weerplaza and do not automatically apply to the other apps. [Weerplaza investigation](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/WEERPLAZA_TRACKING_AUDIT.md).

## Does skipping the notice mean accepting or refusing?

In these patches, **Skip consent screens** writes neither acceptance nor rejection and includes tracking suppression. It prevents the screens from appearing automatically while preserving existing choices and manual settings. [NRC](../apps/nrc.md) also retains genuine saved consent and manual privacy when skipping its automatic Didomi interface.

Evidence reviewed **28 October 2026**. These findings come from examining the app code. They do not provide a legal judgement or evidence from a network recording. Read [consent](../learn/consent.md) and [methodology](../reference/methodology.md).
