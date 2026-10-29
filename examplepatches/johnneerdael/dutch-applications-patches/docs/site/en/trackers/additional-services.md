# Other measurement services: which similar names have different roles?

These measurement services also appear in the supported apps. An **event** is a record of an action, an **SDK** is a reusable code library and an **identifier** links records to an installation, session or account. An address in the code does not prove that the app sent data there. The hypothetical examples explain how the technology works and do not describe observed user behaviour.

<a id="audience-measurement"></a>

## What do Comscore and Gemius count?

Comscore supplies audience and advertising measurement. Gemius also measures audiences, combining tagged-service data with panel-based information in its documented methodology. Their purposes can resemble [Kantar/NMO](kantar-nmo.md), but they are distinct providers and implementations. [Comscore SDK description](https://www.comscore.com/applicationsdk), [Gemius methodology](https://audience.gemius.com/en/methodology/overview/).

**Hypothetical example:** article-open and periodic activity records let a measurement system estimate use over time. A repeated ID may distinguish a return visit from a new installation; the resulting totals do not tell us which fields were collected before aggregation.

[NU.nl](../apps/nunl.md), [NRC](../apps/nrc.md), [AD](../apps/ad.md), [de Volkskrant](../apps/volkskrant.md), [Trouw](../apps/trouw.md) and [Parool](../apps/parool.md) have separately traced Comscore integrations. The evidence includes `scorecardresearch.com` destinations and, in some apps, functions in a native library. Parool's configuration also selects `gabe.hit.gemius.pl`.

The patches stop the inspected startup, event collection and sending paths, including queues and relevant native code. A native library can remain in the app while the identified functions no longer run. AD contains Gemius types, but its audit found no reachable integration that collects data. [Destination evidence](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/TRACKING_DESTINATIONS.md), [AD boundary](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/AD_PATCH_AUDIT.md).

<a id="editorial-analytics"></a>

## What do Chartbeat, Parse.ly and Smartocto learn about content use?

These tools support editorial measurement: which content is used and how people engage. Chartbeat describes tracking interactions and engagement. Parse.ly describes periodic **heartbeats**, requests that report how long someone is actively using content. Smartocto documents video events with content identifiers. These capabilities do not establish identical collection in every integration. [Chartbeat Android SDK](https://docs.chartbeat.com/cbp/tracking/mobile-app-sdks/android-sdk), [Parse.ly engagement](https://docs.parse.ly/installation-resources/parsely-integration/tracking-code-setup/engaged-time/), [Smartocto video tracking](https://knowledgebase.smartocto.com/real-time-video-tracking).

**Hypothetical example:** “article opened” followed by activity pings lets an editor distinguish opening a page from continuing to use it. That can inform editorial decisions while also recording reading behaviour.

[NRC 5.12.24](../apps/nrc.md) has Chartbeat and Parse.ly integrations and destinations including `ping.chartbeat.net`, `pong.chartbeat.net` and `p1.parsely.com`. The patch stops their inspected startup and event paths and web beacons, the small web requests used for measurement. Parse.ly recommendations remain available. Although Parse.ly supplies both functions, the patch treats recommendations and measurement separately. [NRC investigation](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/NRC_PATCH_AUDIT.md).

[Buienradar 7.4.8](../apps/buienradar.md) has a separate video-play sender to `ingestion.smartocto.com/v?t=videoPlay`; **Disable tracking** stops the code that passes on this playback event. It is separate from [Bitmovin](bitmovin.md) analytics. [Buienradar investigation](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/BUIENRADAR_TRACKING_AUDIT.md).

In [RTL Nieuws 12.7.1 (build 1558)](../apps/rtl-nieuws.md), **Disable tracking** stops the separate Smartocto video measurements while retaining the existing player and video source. The inspected code includes video IDs and player context and identifies `ingestion.smartocto.com` as a destination. Smartocto and [Bitmovin](bitmovin.md) have separate measurement paths; the patch addresses both. These are code and configuration findings, not a captured viewing session. [RTL Nieuws investigation](https://github.com/johnneerdael/dutch-applications-patches/blob/ec63c97f0b3cf6e4b9fbd17de4dd2d2bc16ed3bb/docs/rtl-nieuws-audit.md).

In [Omroep Brabant 11.1.0](../apps/omroep-brabant.md), ContentInsights/Smartocto uses `ingestion.contentinsights.com/p` and `/a` for article, session and timed reading activity. These records can connect an article to a session or identifier. **Disable tracking** stops article activation and the independent sender while retaining local reading history and cleanup. The inspected code establishes the fields and routes; it does not establish receipt of a particular reader's data. [Omroep Brabant audit](https://github.com/johnneerdael/dutch-applications-patches/blob/a01857d70b419c677ebdeda56839d316ae69608b/docs/omroep-brabant-audit.md).

<a id="media-telemetry"></a>

## Why distinguish Blue Billywig, JWPlayer and DPG media telemetry from playback?

A player can fetch media and separately report playback events. JWPlayer's documentation explains periodic pings and calculating time watched from them. This is a mechanism description, not evidence of every field in NU.nl. [JWPlayer analytics reference](https://docs.jwplayer.com/platform/docs/analytics-reference).

**Hypothetical example:** “play”, “seek” and “stop” describe interaction with a clip. They are different from retrieving the bytes needed to play it. Audio player telemetry likewise does not imply microphone recording.

[Weeronline](../apps/weeronline.md) traces Blue Billywig statistics to `stats.bluebillywig.com` and stops the statistics sender while keeping playback. [NU.nl](../apps/nunl.md) stops an identified JWPlayer image-pixel sender and known web telemetry while retaining player assets and media requests. [Weeronline investigation](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/WEERONLINE_TRACKING_AUDIT.md), [NU.nl investigation](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/NUNL_TRACKING_AUDIT.md).

DPG's video telemetry includes `psti.prd.dpge.be`; its independent Amalia audio events use `tracker.prd.dpge.be/track`. **Parool stops those separate audio measurements. In AD, Trouw and de Volkskrant, the patch does not yet cover that measurement path.** Their video controls do not prove that every audio event stops.

Catsure still synchronises data used by the player across these apps: a device ID, an ordered queue, media IDs, playback position and whether playback is playing, paused or stopped. The server's exact role has not been fully established. [Current coverage and remaining data](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/README.md), [Parool audio finding](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/parool-audit.md).

In [Omroep Brabant 11.1.0](../apps/omroep-brabant.md), **Disable tracking** turns off both Blue Billywig statistics options after the saved consent settings are applied, and stops the separate statistics sender. Playback events inside the player and content delivery remain. The configured `omroepbrabant.bbvms.com` host supplies media information too; the exact statistics receiver was not pinned. [Omroep Brabant audit](https://github.com/johnneerdael/dutch-applications-patches/blob/a01857d70b419c677ebdeda56839d316ae69608b/docs/omroep-brabant-audit.md).

<a id="publisher-measurement"></a>

## What do Matomo and Eventor show about first-party collection?

Matomo supports pageview and event requests, including optional user and pageview IDs. A publisher can run a collector on its own hostname. First-party domains can still be used for measurement. [Matomo tracking API](https://developer.matomo.org/api-reference/tracking-api).

**Hypothetical example:** the publisher's own `insight` host receives a reading event while its main host supplies the article. A domain owned by the publisher can still be used for measurement.

[FTM 2.6.8](../apps/ftm.md) has Matomo measurement code at `insight.ftm.nl` and code for event and ID updates at `eventor.ftm.nl`. The patch filters those collectors and clears five specific Eventor browser-storage keys after page completion. Temporary local ID creation before that cleanup remains possible. It also blocks the exact comments-visibility telemetry route on the production sites. Account state, comments functionality and ordinary browser storage are not globally replaced. [FTM investigation](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/FTM_TRACKING_AUDIT.md).

The [Omroep Brabant](../apps/omroep-brabant.md) publisher also has its own `api.omroepbrabant.nl/api/event/readarticle` request. The inspected contract contains an article ID and an Android-derived device ID. **Disable tracking** keeps the local history update and skips this upload. News, weather and configuration use the same host and remain available. This is why host ownership alone cannot distinguish tracking from useful requests. [Omroep Brabant audit](https://github.com/johnneerdael/dutch-applications-patches/blob/a01857d70b419c677ebdeda56839d316ae69608b/docs/omroep-brabant-audit.md).

<a id="publisher-identity"></a>

## Which identifiers does DMOI connect?

In [RTL Nieuws 12.7.1 (build 1558)](../apps/rtl-nieuws.md), **Disable tracking** reduces optional links between a publisher identifier and advertising, App Set and device IDs and external account IDs. The inspected code uses a rotating DMOI identifier, with possible associations to `gigya_id` and `pw_id`. The configured identity service and inspected sender use `dmoi.api.dpgmedia.net/dmoi`.

The patch suppresses optional ID lookups, stops external associations and completes DMOI requests through their existing failure handling. Login and account IDs retain their functional uses. This limits the inspected optional identity exchange without replacing genuine accounts. It does not establish that all remaining data is unlinkable or that historical server records were erased. [RTL Nieuws investigation](https://github.com/johnneerdael/dutch-applications-patches/blob/ec63c97f0b3cf6e4b9fbd17de4dd2d2bc16ed3bb/docs/rtl-nieuws-audit.md).

<a id="piano"></a>

## What does Piano Analytics record?

Piano Analytics represents interactions as events with properties describing the content, user or device. Its documentation gives page views, clicks and media playback as examples. Its Android SDK can store events for later sending. These are product capabilities; the inspected app determines which ones are used. [Event model](https://developers.piano.io/analytics/data-collection/general/how-it-works/), [Android SDK and offline storage](https://developers.piano.io/analytics/data-collection/sdks/android-kotlin/).

**Hypothetical example:** an article ID and title identify what was opened. A session or visitor ID can link that opening to later screen or playback events, even without including a name.

In [Omroep Brabant 11.1.0](../apps/omroep-brabant.md), the inspected Piano paths include article ID/title, prior-page context, screen/social and audio/video events, optional advertising IDs and an NMO identifier. **Disable tracking** stops the app gate and SDK event, queued-upload and crash-report senders. Local seven-day expiry and the 2,000 pending-record limit still run; unsent data is not reported as delivered. Piano's exact upload address was not established, and retained SDK initialisation is not a promise of zero traffic. [Omroep Brabant audit](https://github.com/johnneerdael/dutch-applications-patches/blob/a01857d70b419c677ebdeda56839d316ae69608b/docs/omroep-brabant-audit.md).

<a id="experiments-and-surveys"></a>

## How do BrandMetrics and VWO differ from a general event logger?

BrandMetrics measures advertising effectiveness and surveys; VWO supports experiments. Their own descriptions explain survey-based brand measurement and visitor conditions for showing a variant. [BrandMetrics measurement](https://api.brandmetrics.com/), [VWO targeting settings](https://help.vwo.com/hc/en-us/articles/360020424354-Configuring-the-Segment-Settings-in-VWO).

**Hypothetical example:** an experiment compares two presentations by assigning a visitor to a variant and counting outcomes. An ad survey asks a different question, but either can involve identifiers and response context. This example does not establish that a particular experiment ran.

Parool's ad configuration selects `phx.bmtrcs.com` with DMOI identity and survey placeholders. The configuration identifies the chosen destination; it is not a recording of a completed survey. Its policy therefore covers `bmtrcs.com`; `brandmetrics.com` alone would miss that hostname. The web filters in several news apps cover `dev.visualwebsiteoptimizer.com`, but policy coverage does not prove which experiment loaded. [Parool investigation](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/parool-audit.md), [destination distinctions](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/TRACKING_DESTINATIONS.md).

Evidence reviewed **28 October 2026**. No new network recording was made. The findings do not establish retention periods or resale. Read [how tracking works](../learn/how-tracking-works.md), [identifiers](../learn/identifiers.md) and [methodology](../reference/methodology.md).
