# Snowplow: how does a sequence of actions become a dataset?

## What does Snowplow do?

Snowplow supplies tools for collecting structured records of activity. An app includes a **software development kit (SDK)**: a reusable package of code. The SDK records **events**, such as opening a screen or starting a video, and sends them to a **collector**, a server that accepts those records. The publisher decides how to set it up; a Snowplow system can use a publisher's own domain.

An event can carry context and identifiers. An **identifier** is a value used to recognise the same installation, session or account again. Snowplow documents several identifiers, with different lifetimes and sources. Its mobile documentation also describes device language, timezone and screen information. Which fields an app supplies and which privacy settings it uses must be checked separately. [Snowplow identifiers](https://docs.snowplow.io/docs/events/identifiers/), [mobile properties](https://docs.snowplow.io/docs/sources/mobile-trackers/client-side-properties/).

## Why does an identifier matter?

**Hypothetical example:** three records say “radar opened”, “place selected” and “subscription screen opened”. With one installation ID, an analyst can put these actions in sequence. Counting three unrelated clicks gives a different picture from observing one returning installation. This example explains the mechanism; it is not a captured Buienradar session.

## What did our inspected apps actually contain?

In [Buienradar 7.4.8](../apps/buienradar.md), the app creates RTL and DPG trackers for `nl-rtl-prod1.collector.snplow.net` and `c.dpgmedia.net`. The inspected code includes events about screens, screen elements, steps in a process, purchases, radar locations and logins. A **funnel** measures those successive steps through a process. There is also tracking for the installation's origin and changes in app activity. The Kantar/NMO plugin passes the Snowplow user ID as `cs_fpid`; see [Kantar/NMO](kantar-nmo.md). The audit also found a hard-coded consent context. That is a code finding, not a legal conclusion about consent. [Buienradar investigation](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/BUIENRADAR_TRACKING_AUDIT.md).

[NU.nl](../apps/nunl.md), [de Volkskrant](../apps/volkskrant.md), [Trouw](../apps/trouw.md), [AD](../apps/ad.md) and [Parool](../apps/parool.md) have separately audited publisher tracking paths, including `tracking-module.api.dpgmedia.cloud`. Shared technology does not make their exact coverage identical. [Destination evidence](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/TRACKING_DESTINATIONS.md).

## What changes after patching?

Buienradar's **Disable tracking** stops tracker creation and the code that passes events on, including its attached NMO plugin. In the news apps, the patches stop the inspected sending functions, queues and known web collectors. Necessary content, account and notification services remain.

Checking the source and patched output alone cannot show that all network requests have stopped. The patch does not erase records already held by a server.

## What changes in RTL Nieuws?

In [RTL Nieuws 12.7.1 (build 1558)](../apps/rtl-nieuws.md), **Disable tracking** stops the inspected optional recording of reading, screen and viewing activity. The patch retains content, account and playback functions. The app code configures Snowplow/DPG trackers for `c.dpgmedia.net` and `nl-rtl-prod1.collector.snplow.net`. The patch stops tracker creation and re-enablement, event dispatch and the SDK sender, including previously stored Snowplow requests.

RTL Nieuws also has a separate [NMO/FocalMeter sender](kantar-nmo.md). The patch stops it independently; stopping Snowplow alone would not cover it. These findings come from the code and patched-output checks, not a recorded reading history. [RTL Nieuws investigation](https://github.com/johnneerdael/dutch-applications-patches/blob/ec63c97f0b3cf6e4b9fbd17de4dd2d2bc16ed3bb/docs/rtl-nieuws-audit.md).

Evidence reviewed **28 October 2026**. Continue with [how tracking works](../learn/how-tracking-works.md), [identifiers](../learn/identifiers.md) and [our methodology](../reference/methodology.md).
