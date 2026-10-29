# Trackers and service providers: what is each component doing?

“Tracker” covers several different mechanisms. One component counts article visits, another records player failures, another selects marketing messages. A consent or subscription provider can also exchange necessary service data alongside optional metrics. Knowing what a component does helps you judge what a patch stops and which features depend on it.

An **SDK** is a reusable package of code embedded in an app. An **event** records something that happened, usually with details about the action. An **identifier** is a value that lets a service link records to the same installation, session or account. **Telemetry** is data software sends about its operation or use. None of these terms alone proves that data is anonymous or identifies a particular person by name.

## Which tools measure behaviour and interactions?

- [Snowplow](snowplow.md): structured screen, action and publisher events, with identifiers and context.
- [Contentsquare and Heap](contentsquare-heap.md): recording screen-view events and actions in the app, with connections to identities and activity on embedded web pages.
- [Usabilla/GetFeedback](usabilla.md): manual feedback alongside automatic event-triggered surveys and telemetry.
- [Matomo and Eventor](additional-services.md#publisher-measurement): first-party collection in FTM's embedded website.

- [DMOI](additional-services.md#publisher-identity): optional publisher, device and account ID associations suppressed in RTL Nieuws while retaining login.

## Which tools measure audiences, content and video?

- [Kantar/NMO](kantar-nmo.md): audience counts and the concrete Snowplow-ID connection in Buienradar. RTL Nieuws has a separate NMO sender.
- [Piano Analytics](additional-services.md#piano): article and media events, optional IDs and queued uploads in Omroep Brabant.
- [Bitmovin](bitmovin.md): player quality and viewing measurements, separate from playback and licensing.
- [Comscore and Gemius](additional-services.md#audience-measurement): measuring how many people use content, including through native code in the app.
- [Chartbeat, Parse.ly and Smartocto](additional-services.md#editorial-analytics): reading, engagement and video-play measurement.
- [Blue Billywig, JWPlayer and DPG media](additional-services.md#media-telemetry): playback measurements, Catsure synchronisation that remains available, and audio measurements that the patches do not yet stop.

## Which components diagnose problems?

- [Firebase](firebase.md): Analytics, Crashlytics, Performance and Sessions have different jobs from installation identity, configuration and push delivery.
- The [additional-service profiles](additional-services.md) also explain why player quality measurements overlap with behavioural records.

## Which tools support marketing and targeting?

- [Meta/Facebook](meta.md): App Events and Audience Network, with separate code for startup and identifiers.
- [Swrve](swrve.md): profiles and campaigns, and the service Buienradar needs for weather alerts. It remains enabled by default. RTL Nieuws stops optional campaigns and offers an expert option without push notifications.
- [Insider](insider.md): events, profiles and geofencing suppressed in Flitsmeister; live CITS location remains.
- [BrandMetrics and VWO](additional-services.md#experiments-and-surveys): advertising-effectiveness surveys and experiments.

## Which services manage consent and subscriptions?

- [OneTrust](onetrust.md): privacy screens, settings and data exchanged when managing consent.
- [Didomi](didomi.md): saved consent choices and optional measurements about the service. What the patch stops differs by app.
- [RevenueCat](revenuecat.md): purchases and access to paid features, alongside optional customer properties and diagnostics.

## How should I read the evidence?

The profiles distinguish what a product can do according to its documentation, what the inspected app code contains and what was observed during use. They also identify configured receiving addresses and the addresses covered by web filters. A hypothetical example explains a mechanism; it is not a captured user session. The linked app pages identify exact supported versions and controls. Provider documentation describes what a product can do, not everything an inspected app did.

These independent sources describe the services and their context: [Exodus's tracker catalogue](https://reports.exodus-privacy.eu.org/en/trackers/), [DuckDuckGo Tracker Radar](https://github.com/duckduckgo/tracker-radar) and the historical **2017** [Cracked Labs report](https://crackedlabs.org/en/corporate-surveillance). Tracker Radar explicitly supplies a dataset rather than a ready-made blocklist. These sources do not replace app-specific evidence or establish current transfers in these versions.

Evidence reviewed **28 October 2026**. No new decrypted packet capture was added. These findings do not establish retention, resale, legal violations or zero remaining traffic. Start with [how tracking works](../learn/how-tracking-works.md), then [identifiers](../learn/identifiers.md), [location](../learn/location.md), [consent](../learn/consent.md) and [our methodology](../reference/methodology.md). The [source guide](../reference/sources.md) explains the source types.
