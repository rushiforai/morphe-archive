# NRC

Version-specific source/SDK/configuration evidence is not a packet capture showing that every listed host received data. [Evidence notes](../../TRACKING_DESTINATIONS.md) · [All app READMEs](../README.md).

Use the original APK, **5.12.24 / 626**, Android 6+. The user confirmed the app works and approved stable publication on 2026-10-28.

| Patch | Effect |
| --- | --- |
| Hide ads | Hides evidenced appview ad slots and reserved space, blocks their loader, and filters replica pages whose frames are entirely advertising. Preserves mixed editorial pages. |
| Disable tracking | Stops inventoried native collectors, analytics partner launchers, advertising identifiers, Firebase telemetry and known web collector requests. Includes Hide ads. |
| Skip consent screens | Skips automatic Didomi UI and the first guest login welcome through the original Skip completion. Retains saved consent/accounts and manual privacy/login. Includes Disable tracking and Hide ads. |
| Hide Premium banner | Hides the evidenced subscription top banners and sticky campaign roots in editorial appviews. |
| Read full articles | Stops the article-only wall decision before destructive clipping, then hides wall UI while preserving all received body nodes. |
| Hide newspaper tab | Removes Krant from the bottom bar, redirects newspaper navigation to News and migrates saved tab state. Enabled by default. |

Three saved premium appviews contain 17, 15 and 11 paragraphs. Browser checks cover their paragraph order and final substantive digests, the original wall's failure branch, editorial media and manual account forms. Native font interception, cache, navigation and session callbacks remain intact. Guest edition metadata is available, but sampled asset requests return HTTP401 without page/download links. The default newspaper-tab control removes that unavailable interface; account/download entitlement checks remain genuine. Printed ads sharing editorial bitmaps remain visible when using the original reader interface. These controls cannot supply withheld text or guarantee future remote behavior. See the [NRC audit](../../NRC_PATCH_AUDIT.md).

<details>
<summary>Tracking destinations, collected data and patch effects</summary>

| Destination | Purpose and data in the inspected path | Patch effect / remaining exposure |
| --- | --- | --- |
| `ping.chartbeat.net`, `pong.chartbeat.net`, `static.chartbeat.com` | **Traced integration + web policy:** reading/engagement measurement and its script loader. | App initialization/event paths and evidenced web destinations disabled. |
| `sb.scorecardresearch.com`, `p1.parsely.com`, `p.parsely.com` | **Traced SDK integration + web policy:** audience, article/reader events and engagement measurement. | Native measurement and known web beacons stopped; functional Parsely recommendations remain allowed. |
| `ec114.nrc.nl`, `klik.nrc.nl`, `cdn.sophi.io` | **Audited appview source/policy:** first-party tag/click collection and Sophi measurement/loader. Exact remote payloads not captured. | Known web requests blocked; loader presence is not a captured upload. |
| `api.cxense.com`, `scomcluster.cxense.com` | **Traced SDK paths / shipped destinations:** profile/segment requests and audience personalization. | Analytics/profile launchers stopped; genuine initialized defaults and account/session renewal retained. |
| `app-measurement.com`; Mediahuis analytics (exact endpoint not pinned in the audit) | **Traced:** Firebase events/properties/user IDs and Mediahuis event, attention-time and analytics-partner paths. | Inventoried sinks/launchers disabled; functional device/session state and account refresh retained. |
| `nh-apps-backend.nrc.nl` | **Retained mixed service:** article/edition metadata and actual guest `phone_id`/session state; not automatically a tracking-only host. | Content/authentication remain. Crashlytics/performance/push analytics are separately suppressed; installation/configuration and actual notification delivery remain. |

</details>
