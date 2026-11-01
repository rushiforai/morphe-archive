# NOS Teletekst

Version-specific source/SDK/configuration evidence is not a packet capture showing that every listed host received data. [All app READMEs](../README.md).

Version **2.8.10**, build **62**, package `com.eoffice.android`. Two controls: **Disable tracking** and **Hide promotions**, independently selectable and both on by default. The user reported successful phone testing and approved main publication on 29 October 2026.

<details>
<summary>Tracking destinations, collected data and patch effects</summary>

| Destination | Purpose and data in the inspected path | Status / functional boundary |
| --- | --- | --- |
| `topspin.npo.nl/mob-event` | **Traced Govolte POST/queue:** Teletekst page/subpage views, navigation origin, favorite/share/promotion interactions and visibility activity, with event/party/session/DAM IDs and timestamps. | Disable tracking prevents SDK construction, queue startup, heartbeats and uploads. Stopping only a later event logger would miss pending uploads. |
| `nmonpoendpoint.2cnt.net` | **Traced independent NMO request:** `cs_fpid` and vendor (`at`); DAM submission has a 24-hour minimum interval. | The same factory control prevents this service from being initialized. It is independent of Govolte transport. |
| Same NPO measurement paths: device/session context | **Traced payload context:** persisted party/session/DAM IDs, screen pixels/density/orientation, SDK/app/version, manufacturer/model and Android release/API in User-Agent. | These are generated tracking IDs; an advertising ID or login is not required to link activity. |
| `teletekst-data.nos.nl/page/{page}` | **Functional content:** page/subpage retrieval and refresh, separate from analytics heartbeat. Requests expose ordinary network information such as IP address to the server. | Preserved. Content is rendered natively. Hide promotions separately stops the recurring NOS-app scoreboard dialog before display or promotion visit counting. |

</details>

Party/session/DAM IDs are persisted locally. Sessions can expire after 30 minutes;
visibility uses a 10-second analytics heartbeat. Existing IDs and queued records
are retained. With Disable tracking selected, the process does not initialize
their SDK. Bundled Piano/ATInternet and dormant advertising-ID fallback code are
not labelled active collection: the inspected factory installs only Govolte.
No application-wired commercial display/video ad loader was established.

Pages, favourites, sharing, refresh, Google Play security-provider setup and the
TV-only informational privacy notice remain. The anonymous page-content sample
establishes content delivery, not analytics transfers. No complete phone traffic
audit or suppression of every platform connection is claimed.
