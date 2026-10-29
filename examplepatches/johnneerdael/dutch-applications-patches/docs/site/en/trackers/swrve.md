# Swrve: why do weather alerts and profile collection share a component?

## What does Swrve provide?

Swrve supplies tools for messages, campaigns and audience selection. Its documentation describes selecting audiences using user and device profiles and behavioural history, including sessions and campaign interactions. A **profile** is a set of properties associated with an identifier; an **audience** is a group that meets conditions on those properties or events. These capabilities do not prove that every customer uses every targeting option. [Swrve audience filters](https://docs.swrve.com/user-documentation/segmentation/about-audience-filters/).

An SDK can combine those measurement features with functional push delivery. A **push notification** is a message delivered to an app installation through a notification service. Removing the SDK can therefore remove both optional profiling and a feature the person wants to keep.

## Why does location plus an ID matter?

**Hypothetical example:** two latitude/longitude pairs are sent hours apart with the same user ID. The ID lets a receiver associate those points even if the record contains no name. Whether they describe current GPS location or places deliberately saved for a forecast matters too. This does not describe a reconstructed journey or establish what conclusions a server draws.

## What is the actual Buienradar finding?

[Buienradar 7.4.8](../apps/buienradar.md) starts Swrve and supplies device and session information and properties including dark mode and subscription status. Separately, the background task `LocationIntelligenceWorker` contains a request to `userapi.buienradar.nl/2.0/userlocation`, with latitude, longitude and the Swrve user ID. The location receiver is a Buienradar service; the audit does not label it a direct Swrve upload or establish every Swrve upload hostname. [Buienradar investigation](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/BUIENRADAR_TRACKING_AUDIT.md).

## Does Disable tracking remove this?

**No: Swrve and the background location upload remain by default.** The separate **Disable Swrve and location upload** control is **off by default** and includes Disable tracking. It makes the app use Swrve's existing inactive implementation and stops the upload; the worker can still store the last location locally.

Selecting that control disables Buienradar weather alerts, because all its weather alerts use Swrve push. Current-location alerts also depend on the upload. Rain, air quality, barbecue and daily-forecast alerts are part of that tradeoff. The default tracking control does not guarantee that all location data stays on the phone.

## What changes in RTL Nieuws?

In [RTL Nieuws 12.7.1 (build 1558)](../apps/rtl-nieuws.md), **Hide ads**, also included in **Disable tracking**, stops the inspected promotional campaigns before their screens appear. This also covers campaigns configured later that use the same inspected app and SDK paths. **Disable tracking** additionally stops optional events, clicks and impressions. Known stored `event` and `session_start` records are removed from the queue; unknown or malformed records remain.

You can therefore stop the inspected campaign prompts and usage measurement while keeping Swrve push. In this standard mode, the SDK still processes user, device and configuration data for retained functions, including push registration and followed-channel synchronisation. Those exchanges can include service identifiers and IP information. The audit does not establish exact Swrve upload hosts and contains no network recording of current campaign messages.

The separate **Disable Swrve (expert)** option is **off by default** and includes the standard controls. If you do not want push notifications, it also reduces the remaining SDK exchanges involving users, devices, channels and background work. It uses Swrve's shipped inactive implementation, stops persisted SDK workers, and disables push components and automatic FCM initialisation. **Push notifications and Swrve channel synchronisation then stop working.** Local preferences remain saved. Shared Firebase Auth, Installations and configuration services remain available; the app can still make network requests with this expert option. [RTL Nieuws investigation](https://github.com/johnneerdael/dutch-applications-patches/blob/ec63c97f0b3cf6e4b9fbd17de4dd2d2bc16ed3bb/docs/rtl-nieuws-audit.md), [expert-option implementation](https://github.com/johnneerdael/dutch-applications-patches/blob/a55b09a6f8e8acaf1ea0a2944c3b13993831b18f/patches/src/main/kotlin/patches/rtl/DisableSwrvePatch.kt).

Evidence reviewed **28 October 2026**. Read [location](../learn/location.md), [identifiers](../learn/identifiers.md) and [methodology](../reference/methodology.md).
