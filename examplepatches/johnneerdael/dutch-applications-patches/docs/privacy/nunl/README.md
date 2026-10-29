# NU.nl

Version-specific source/SDK/configuration evidence is not a packet capture showing that every listed host received data. [Evidence notes](../../TRACKING_DESTINATIONS.md) · [All app READMEs](../README.md).

Use the original Play Store split APK set (Android 12L+).

| Patch | Effect |
| --- | --- |
| Hide ads | Removes banner and video ad paths and evidenced commercial BFF blocks and links. |
| Hide Premium banner | Filters the observed registration and Premium content-blocker notices. |
| Disable tracking | Disables identified native, media, push-statistics and WebView collectors. Includes Hide ads. |
| Skip consent screens | Skips automatic privacy prompts, notification setup and the login offer while retaining topic selection, manual privacy/account/notification controls and existing choices. Fresh notifications stay off. Includes Disable tracking and Hide ads. |

The news onboarding flow is separate from consent. Its required show/completion acknowledgements remain enabled. Earlier phone checks passed onboarding and two cold starts; the user subsequently approved the optional notification/account skips with topic selection retained on 2026-10-28. These patches do not recover NU+ bodies withheld by the backend. See the [NU.nl audit](../../NUNL_TRACKING_AUDIT.md) for collector coverage and verification limits.

<details>
<summary>Tracking destinations, collected data and patch effects</summary>

| Destination | Purpose and data in the inspected path | Patch effect / remaining exposure |
| --- | --- | --- |
| `tracking-module.api.dpgmedia.cloud` | **Traced:** publisher/Snowplow tracking with install/session/screen, geography and deep-link context. | Native startup and sender disabled; ad/profile IDs and persistent UDS header suppressed. |
| `app-measurement.com`, `www.google-analytics.com`, `googletagmanager.com` | **SDK destinations + web policy:** app events, screens, user properties and analytics tags. | Inventoried native analytics and web collectors disabled. |
| `sb.scorecardresearch.com`, `sdk.out.usbla.net` | **Traced SDK integrations:** Comscore/Nobo audience measurement and Usabilla events/telemetry. | App initialization, dispatch and identified queue/sender paths stopped. |
| `bmtrcs.com`, `jwpltx.com`, `dev.visualwebsiteoptimizer.com`, `sentry.io`, `applets.ebxcdn.com` | **Native integration/web policy:** BrandMetrics ad-effectiveness surveys, JWPlayer viewing metrics, experiments, diagnostics and EBX instrumentation/loader. Exact remote payloads not captured. | Known requests and identified native BrandMetrics/JW telemetry sinks disabled. |
| `pg.dpgmedia.net/api/metrics` | **Traced:** PrivacyGate error metrics, separate from consent functionality. | Metrics method and exact web route blocked; manual privacy retained. |
| `graph.nu.nl` | **Retained mixed service:** content, pagination, cookies and the three required first-run card-completion acknowledgements. Other BFF tracking events are suppressed. | Keeps functional onboarding completion; no UDS tracking header. Login, Firebase push/installation and DPNS registration remain. |

</details>
