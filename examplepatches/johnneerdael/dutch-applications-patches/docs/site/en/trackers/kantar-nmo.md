# Kantar/NMO: how is an app visit counted as audience measurement?

## Who does what?

NMO, Nationaal Media Onderzoek, coordinates Dutch media audience research. Kantar carries out its online and viewing research. NMO describes a combination of recruited panels and **census measurement**: tags in participating websites and apps count use. A **tag** is measurement code; being counted by a tag is not the same as agreeing to participate in a research panel. [NMO participant information](https://www.nationaalmediaonderzoek.nl/privacy-deelnemers-nmo).

NMO's FAQ says census data include pageview counts and characteristics such as duration, content category and device. Those counts contribute to reach estimates. The FAQ describes the research model; the exact contents of an app request need separate inspection. [NMO Online FAQ](https://www.nationaalmediaonderzoek.nl/nmo-onlinefaq).

## Why can a counting request contain an ID?

**Hypothetical example:** a service wants to distinguish ten opens by one installation from one open by ten installations. A repeated identifier lets the service recognise recurring measurement records. An identifier does not have to contain a person's name to connect activity. Conversely, finding such a value does not prove that a research organisation knows the name of the person holding the phone.

A **ping** is a small network request reporting a measurement. It can have parameters: named values attached to that request. The app code must show which values are sent and what they mean. The word “counting” alone does not tell us that.

## What did we find in Buienradar?

In [Buienradar 7.4.8](../apps/buienradar.md), a plugin attached to the RTL [Snowplow](snowplow.md) tracker adds a Kantar/NMO ping to `nmortlendpoint.2cnt.net`. The parameter `cs_fpid` receives the Snowplow user ID. This is concrete evidence of an identifier connection in the app's code. It is not a packet capture showing a particular person's request, and does not establish what downstream matching, retention or aggregation occurred. [Buienradar investigation](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/BUIENRADAR_TRACKING_AUDIT.md).

## What changes after patching?

Buienradar's **Disable tracking** prevents creation of the Snowplow tracker to which this plugin belongs. The identified NMO ping stops with that tracker. It does not block every domain used by the research company.

Do not apply that conclusion automatically to another app or a later release: the same audience scheme can be integrated through independent code. Assess panel participation separately from the documented census tag. The audit shows how the app invokes the measurement; the research provider explains its stated purpose.

## What changes in RTL Nieuws?

In [RTL Nieuws 12.7.1 (build 1558)](../apps/rtl-nieuws.md), **Disable tracking** also stops the inspected audience measurement carrying a user ID. The app has its own NMO/FocalMeter sender to `nmortlendpoint.2cnt.net`, with `vendor=snowplow`, the user ID in `cs_fpid` and `c12=not_set`. This sender is separate from the Snowplow sender. The patch stops each independently, unlike Buienradar's attached plugin above. The code shows which values are passed; no network recording establishes receipt or further processing by the server. [RTL Nieuws investigation](https://github.com/johnneerdael/dutch-applications-patches/blob/ec63c97f0b3cf6e4b9fbd17de4dd2d2bc16ed3bb/docs/rtl-nieuws-audit.md).

## What changes in Omroep Brabant?

[Omroep Brabant 11.1.0](../apps/omroep-brabant.md) has an independent client for `nmorpoendpoint.2cnt.net`. It registers and reuses a random ID, passes it as `cs_fpid`, and shares that identifier with Piano. **Disable tracking** stops the inspected registration and returns the native absence when the app asks for the cached ID. This prevents the inspected forwarding without claiming historical stored IDs were deleted. No packet capture establishes what the server received or retained. [Omroep Brabant audit](https://github.com/johnneerdael/dutch-applications-patches/blob/a01857d70b419c677ebdeda56839d316ae69608b/docs/omroep-brabant-audit.md).

Evidence reviewed **28 October 2026**. Read [identifiers](../learn/identifiers.md), [consent](../learn/consent.md) and [evidence levels](../reference/methodology.md).
