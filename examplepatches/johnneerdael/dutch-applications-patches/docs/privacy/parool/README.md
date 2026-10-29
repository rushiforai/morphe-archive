# Parool

Version-specific source/SDK/configuration evidence is not a packet capture showing that every listed host received data. [Evidence notes](../../TRACKING_DESTINATIONS.md) · [All app READMEs](../README.md).

Use the original Play Store split APK set, **7.53.1 / 23136515**, Android 12L+. The user confirmed device validation and approved stable promotion on 2026-10-28.

| Patch | Effect |
| --- | --- |
| Hide ads | Removes inventoried native/video/game advertising, explicit commercial feed/body components and known WebView ad requests. Uses real disabled/error continuations. |
| Disable tracking | Stops inventoried native/web collectors, independent audio UI telemetry, monitoring forwarding and advertising-ID acquisition/header addition. Includes Hide ads. |
| Skip consent screens | Completes automatic consent and first-launch login/welcome/notification setup through the native guest completion. Fresh notifications stay off; saved choices and manual settings remain. Includes Disable tracking and Hide ads. |
| Hide Premium banner | Hides premium labels, marketing templates and the subscriber-only onboarding benefit row. |
| Read full articles | Completes the marketing resolver with its supported empty success so article bodies already supplied by the API can render. |

Two anonymous premium API samples supply substantive final paragraphs. These controls create no account, purchase or rewarded-ad entitlement. Functional audio queue/heartbeat, login, notifications and newspaper/PDF APIs remain. See the [Parool audit](../../parool-audit.md) for exact verification and phone scenarios.

<details>
<summary>Tracking destinations, collected data and patch effects</summary>

| Destination | Purpose and data in the inspected path | Patch effect / remaining exposure |
| --- | --- | --- |
| `tracking-module.api.dpgmedia.cloud`, `c.dpgmedia.net` | **Traced publisher integration + web policy:** app/screen/reading events and identifier linkage. | Inventoried native dispatch/queues and known WebView collectors disabled. |
| `tracker.prd.dpge.be/track` | **Traced independent audio sender:** audio UI/follow interaction payloads, SDK/platform metadata and event parameters. This is player interaction telemetry, not microphone listening. | Both Amalia event/payload ingress methods stopped; actual playback and follow/save mutations retained. |
| `psti.prd.dpge.be` | **Traced video SDK destination:** player telemetry; separate analytics/CIM reducers also emit video measurement. | Inventoried telemetry dispatcher, analytics/CIM reducers and enablement getters disabled. |
| `gabe.hit.gemius.pl`, `scorecardresearch.com`, `api.cxense.com`, `sdk.out.usbla.net` | **Traced integrations:** audience/pageview/conversion/DMP and automatic feedback/campaign events. Comscore includes separate native transport. | Inventoried native, JNI, queued and web measurement boundaries stopped; callbacks preserved. |
| `phx.bmtrcs.com` | **Configured in actual Parool ad JSON:** BrandMetrics survey/ad-effectiveness URL includes a DMOI user-ID placeholder and survey keys. A request was not captured. | Native ad loaders stopped; actual `bmtrcs.com` family additionally blocked in the WebView policy. |
| `contentsquare.net`, `contentsquare.com`, `heapanalytics.com`, `heap.io`; `googletagmanager.com`, `google-analytics.com`, `dev.visualwebsiteoptimizer.com` | **Traced SDK integrations / web policy:** screen/component interactions, identity/properties, instrumentation, analytics and experimentation. Exact remote payloads vary. | Inventoried startup, recording/event, upload, identifier and WebView instrumentation paths disabled. |
| `pg.dpgmedia.net` (metrics only); PIP OIDC telemetry (shared authentication service) | **Traced:** privacy error and OIDC metrics. Authentication and consent use the same service families for functional operations. | Only measurement methods stopped; manual privacy, real auth/token/account state retained. |
| `cat-sure.api.dpgmedia.cloud` | **Retained:** real device ID, ordered audio queue/clip URNs, playback position and playing/paused/stopped state for queue/heartbeat coordination. | Retained pending evidence about functional server effects; no complete network-silence claim. |
| `mobile2.parool.nl`, `firebaseinstallations.googleapis.com`, `fcmregistrations.googleapis.com`, `firebaseremoteconfig.googleapis.com` | **Retained services:** article/paper/account/push requests, Firebase installation/token/configuration identity. The generic ad-ID header is removed, while distinct functional headers remain. | Content and services still involve servers and necessary identifiers. No account or newspaper access is invented. |

</details>
