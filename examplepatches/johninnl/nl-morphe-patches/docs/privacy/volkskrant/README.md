# de Volkskrant

Version-specific source/SDK/configuration evidence is not a packet capture showing that every listed host received data. [All app READMEs](../README.md).

Use the original Play Store split APK set (Android 12L+).

| Patch | Effect |
| --- | --- |
| Hide ads | Removes advertisements from overview feeds and articles, newsletter promotions, native ad loaders and known app-WebView ad paths. |
| Hide Premium banner | Hides Premium labels and app-owned marketing-template gates. |
| Disable tracking | Disables identified native and app-WebView analytics, identifiers and optional telemetry. Includes Hide ads. |
| Skip consent screens | Skips automatic consent, login, welcome and notification setup using the native completion path. Fresh notifications stay off; saved accounts/choices and manual settings remain available. Includes Disable tracking and Hide ads. |
| Read full articles | Uses the app's successful empty marketing-template result so received article bodies can render through both blocking and inline gates. |

Read full articles preserves the body supplied by the article API; it creates no account entitlement or purchase. The user confirmed that articles, subscriber content, columns and podcasts are fully readable on the phone.

<details>
<summary>Tracking destinations, collected data and patch effects</summary>

| Destination | Purpose and data in the inspected path | Patch effect / remaining exposure |
| --- | --- | --- |
| `tracking-module.api.dpgmedia.cloud`, `c.dpgmedia.net` | **Traced publisher tracking + web policy:** app/read/screen event dispatch and identifier linkage. | Inventoried native dispatch, queues and known web collector requests disabled. |
| `contentsquare.net`, `contentsquare.com`, `heapanalytics.com`, `heap.io` | **Traced SDK integrations + web policy:** screen/component transitions, events, user identity/properties and WebView instrumentation. | Optional startup, collection, upload and WebView bridge paths stopped. |
| `gemius.pl`, `scorecardresearch.com`, `api.cxense.com` | **Traced integrations + web policy:** audience measurement and Piano/Cxense pageview/conversion/DMP events. | Inventoried native/web measurement stopped; callback contracts retained. |
| `tracker.prd.dpge.be`, `psti.prd.dpge.be` | **Shared audio/video SDK destinations:** playback/UI-event and video telemetry families. Exact residual coverage of the independent audio tracker is a follow-up from the Parool audit. | Video telemetry disabled; this version does not claim the new Parool-specific audio-sink coverage. |
| `c2.volkskrant.nl`, `vx.volkskrant.nl`, `googletagmanager.com`, `google-analytics.com`, `dev.visualwebsiteoptimizer.com`, `brandmetrics.com` | **Audited web policy:** first-party collection/experimentation and third-party tags, tests and ad measurement. A policy rule alone is not proof each host received data. | Known WebView destinations blocked; unknown future remote collectors remain outside the evidence. |
| `cat-sure.api.dpgmedia.cloud` | **Retained:** actual device ID, ordered up-next media, clip URN, playback position and playing/paused/stopped state for audio queue/heartbeat coordination. | Functional server effects remain unclassified; intentionally retained. Content, account, paper downloads, push/configuration also remain. |

</details>
