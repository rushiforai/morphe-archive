# Trouw

Version-specific source/SDK/configuration evidence is not a packet capture showing that every listed host received data. [All app READMEs](../README.md).

Use the original Play Store split APK set, **7.53.1 / 23136515**, Android 12L+. The user confirmed Trouw is fully functional and approved release to the stable channel on 2026-10-27.

| Patch | Effect |
| --- | --- |
| Hide ads | Disables the identified native/video loaders, removes explicit advertisement body/feed components and exact advertorial results, and filters evidenced shared WebView ad hosts. |
| Hide Premium banner | Hides marketing templates, premium labels and the separate automatic subscriber-benefit onboarding row. |
| Disable tracking | Suppresses inventoried native/media collectors, identifiers and shared WebView collectors; includes Hide ads. |
| Skip consent screens | Skips automatic consent, login and notification setup through native completion. Fresh notifications stay off; saved accounts/choices and manual settings remain available. Includes Disable tracking and Hide ads. |
| Read full articles | Uses the existing successful empty marketing-template result to render received article bodies through blocking and inline gates. |

Two live premium API samples supply full bodies and final paragraphs. Off-device checks cover callbacks, startup consumers, retained navigation and emitted Android call kinds. The user completed phone testing and approved the release. The original audio queue and heartbeat coordination remain intact; remaining website/newsletter/sponsored-content coverage and further privacy classification are documented follow-ups.

<details>
<summary>Tracking destinations, collected data and patch effects</summary>

| Destination | Purpose and data in the inspected path | Patch effect / remaining exposure |
| --- | --- | --- |
| `tracking-module.api.dpgmedia.cloud`, `c.dpgmedia.net` | **Traced publisher tracking + web policy:** app/read/screen events and user/advertising identifier linkage. | Native dispatch/queues and known WebView requests disabled. |
| `contentsquare.net`, `contentsquare.com`, `heapanalytics.com`, `heap.io` | **Traced SDK integrations + web policy:** interaction, screen/component events, identity/properties and web instrumentation. | Inventoried initialization, event/upload and web bridge paths stopped. |
| `gabe.hit.gemius.pl`, `scorecardresearch.com`, `api.cxense.com`, `sdk.out.usbla.net` | **Traced:** audience measurement, pageview/conversion/DMP events, automatic feedback/campaign telemetry. | Inventoried native senders and relevant known web destinations disabled; completion callbacks preserved. |
| `tracker.prd.dpge.be`, `psti.prd.dpge.be` | **Shipped audio/video senders:** audio UI-event payloads and video telemetry. The independent audio sender is not covered by the original shared target list. | Video telemetry disabled; additional audio-sink coverage remains a follow-up. Do not read Disable tracking as proof every audio event is blocked. |
| `googletagmanager.com`, `google-analytics.com`, `dev.visualwebsiteoptimizer.com`, `brandmetrics.com` | **Audited web policy:** analytics tags, experimentation and ad-effectiveness measurement; actual remote selection/payloads vary. | Known requests blocked. Actual `bmtrcs.com` coverage is a separate Parool addition, not implied by `brandmetrics.com`. |
| `cat-sure.api.dpgmedia.cloud` | **Retained:** device/queue identity, media URNs, position and playback state in actual queue/heartbeat synchronization. | Retained pending evidence about functional server coordination. Article, account, paper/PDF, notifications and configuration remain. |

</details>
