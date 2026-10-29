# Insider: how do events and location become marketing inputs?

## What does this SDK do?

Insider, now documented as Insider One, provides tools for customer profiles, segmentation and messaging. Its **SDK** is a reusable code package embedded in an app. An **event** records an action with its context; an **attribute** describes a profile property, such as a current preference. According to the provider, the app must supply some default fields itself. Device properties can be filled in when the SDK is set up. A feature appearing in documentation does not establish that an app sends it. [Insider events and attributes](https://academy.insiderone.com/docs/android-events-and-attributes?isBot=true).

The service also supports **geofencing**: checking whether a device enters or leaves a defined geographic area. Its instructions describe location permissions and a separate location opt-in. This is product capability; a geofence library's presence is not proof of a particular fence, location history or campaign. [Insider geofencing documentation](https://academy.insiderone.com/docs/expo-start-tracking-geofence).

## Why distinguish navigation from a marketing location feature?

**Hypothetical example:** a navigation app needs the current position to display a map. A separate marketing component might use entry into an area to select a message. Both involve location, but their triggers, receivers and purpose differ. Stopping the marketing component need not disable the GPS function used for driving.

An ID can connect successive events to one installation or profile. The profile and event functions show which code needs inspection. Establishing which profile fields and messages the app actually sends requires evidence from that app.

## What did we find in Flitsmeister?

For [Flitsmeister 14.17](../apps/flitsmeister.md), **Disable tracking** stops Insider startup, events, profile properties, geofencing, saved jobs and sending by the SDK itself. A **saved job** is work stored to run later. Changing only visible screens would miss that route. The published audit does not establish an exact receiving hostname for Insider uploads or include a complete captured message. [Flitsmeister investigation](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/FLITSMEISTER_PATCH_AUDIT.md).

## What location exchange remains?

The same patch separately suppresses identified first-party footprint, floating-car-data, usage and optional sensor/monitoring telemetry. However, **live CITS GPS exchange remains**. CITS is the connected traffic-warning service described in the audit. Essential map and route requests, hazard reports you choose to submit, and account and push registration also remain available. These services can receive location data and identifiers as part of those functions.

All six Flitsmeister controls are enabled by default in the supported release. The user-confirmed device test does not prove complete network silence or establish how long providers keep data.

Evidence reviewed **28 October 2026**. Read [location](../learn/location.md), [identifiers](../learn/identifiers.md) and [methodology](../reference/methodology.md).
