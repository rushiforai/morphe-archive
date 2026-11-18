# AD

Version-specific source/SDK/configuration evidence is not a packet capture showing that every listed host received data. [All app READMEs](../README.md).

Use the original Play Store split APK set, **9.22.0 / 9220000**, Android 12L+. The user confirmed the app works and approved stable publication on 2026-10-28.

| Patch | Effect |
| --- | --- |
| Hide ads | Filters explicit commercial feed/article components and advertorials, disables identified banner/video ads and completes the game ad flow through its existing error continuation. Preserves editorial siblings, LIVE content and article navigation. |
| Disable tracking | Stops inventoried native collectors, queued uploads, advertising identifiers, FIAM and media/notification telemetry while retaining functional login, push and player synchronization. Includes Hide ads. |
| Skip consent screens | Skips automatic consent, startup login and topic notifications. Keeps city selection with notification and newsletter toggles off until manually enabled, saved accounts/choices, and manual login/privacy controls. Includes Disable tracking and Hide ads. |
| Hide Premium banner | Hides premium labels and marketing templates while preserving editorial inline articles and their read-more links. |
| Read full articles | Requests the shipped API's complete article representation and completes both marketing resolvers with their supported empty results. |

Two saved premium API samples contain 24 and 9 editorial paragraphs, including nested content and final substantive paragraphs; their reduced responses omit those paragraphs. The emitted checks preserve received editorial identity and order. These controls preserve genuine account/purchase state and cannot supply withheld text. Coverage of future remote widgets and further first-party traffic classification remains open.

<details>
<summary>Tracking destinations, collected data and patch effects</summary>

| Destination | Purpose and data in the inspected path | Patch effect / remaining exposure |
| --- | --- | --- |
| `tracking-module.api.dpgmedia.cloud`, `sb.scorecardresearch.com`, `app-measurement.com` | **Traced integrations / shipped destinations:** DPG Snowplow events, audience measurement and Firebase analytics with identifier linkage. | Inventoried configuration, event dispatch, queued uploads and re-enable paths disabled. |
| `api.cxense.com`, `c2.piano.io` / regional SDK alternatives, `sdk.out.usbla.net` | **Traced SDK paths:** pageviews, pending Piano/Cxense events and automatic Usabilla events/custom variables. Regional endpoint selection is not captured. | Identified sender/scheduler paths stopped; genuine login and manual feedback/readiness retained. |
| `tracker.prd.dpge.be`, `psti.prd.dpge.be` | **Shipped SDK destinations:** audio-event and video telemetry families; video analytics uses `/api/v1/events/video.analytics.v1`. | Audited video tracking paths disabled. The independent audio `/track` sender is not covered by the current AD patch; it remains an explicit privacy follow-up. |
| `pg.dpgmedia.net` (metrics route only), PIP OIDC telemetry (shared authentication service) | **Traced:** privacy errors and OIDC SDK metrics, distinct from consent/account operations. | Measurement methods stopped; authentic consent/login/token refresh preserved. |
| Facebook / Crashlytics — exact upload host not pinned in the AD audit | **Traced:** app-event pending flush, diagnostics and advertising/AppSet/Piano identifiers. | Audited optional collection, identifier acquisition and diagnostic upload paths suppressed. |
| `cat-sure.api.dpgmedia.cloud` | **Retained:** device/player/queue state for audio synchronization. | Preserved because server-side functional effects are unclassified. `valley.ad.nl` / `valley.gelderlander.nl` are retained editorial embeds, not automatically classified as ad trackers. |

</details>
