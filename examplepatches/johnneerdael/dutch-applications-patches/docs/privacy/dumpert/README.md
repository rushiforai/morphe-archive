# Dumpert

Version-specific source/SDK/configuration evidence is not a packet capture showing that every listed host received data. [Evidence notes](../../TRACKING_DESTINATIONS.md) · [All app READMEs](../README.md).

Version **5.8.0 / 22001778**, original Play **APKS**, Android 12L or newer. [Implementation audit](../../dumpert-audit.md) · [research evidence](../../research/2026-10-28/dumpert.md). The user approved stable promotion on 2026-10-28 following v1.9.0-dev.2, including the account/promotion cleanup.

| Patch | Effect |
| --- | --- |
| Hide ads | Removes native feed/banner slots, detail/Shorts prerolls and subscription banners in guest/logged-in More and the subscription pane. Uses the app's localized Deluxe/ad-free account copy and omits the Free price label. |
| Disable tracking | Includes Hide ads; suppresses audited app/SDK analytics, optional identifiers, targeting, diagnostics and queued measurement sends. |
| Skip consent screens | Includes both controls; skips automatic Didomi advertising-choice UI while keeping readiness, real consent state and manual privacy settings. |

Real accounts, Deluxe purchases, kudos, favourites, push and playback configuration remain intact. The Deluxe/ad-free account presentation is local display only; real subscribers retain their product metadata and management action. The patches grant no paid entitlement and write no consent decision.

<details>
<summary>Tracking destinations, collected data and patch effects</summary>

| Destination | Purpose and data in the inspected path | Patch effect / remaining exposure |
| --- | --- | --- |
| `pubads.g.doubleclick.net/gampad/ads`, `prebid-server-fra2.rubiconproject.com/openrtb2/auction` | **Traced ad/auction builders:** PPID/hashed advertising ID, account/DMP IDs when available, LAT, slot/content, autoplay/mute, test-group and consent context. | Hide ads suppresses native slot creation, both preroll attachments and AdsManager/GMA/Prebid startup. Initialized IMA/player infrastructure remains; remote creatives, social players and stitched ads are unverified. |
| `api-dms.dumpert.nl/api/v1.0/post-rec/…` | **Traced conditional first-party sender:** view/video/progress and kudo recommendation events, optional logged-in token and Cxense ID. Remote tracking flag defaults to true. | Disable tracking stops this separate PostRec sender even if remote configuration enables it. Actual kudo/favourite submissions remain genuine. The whole DMS host is not blocked. |
| `api.cxense.com`, `comcluster.cxense.com`; `b.scorecardresearch.com`, `sb.scorecardresearch.com`, `udm.scorecardresearch.com`, `census-app.scorecardresearch.com` | **Traced Piano/Comscore integration; SDK/native destinations:** pageviews, segments, ID association and audience measurement. Central events include login/Deluxe context. | Disables app events, Piano segment/association/queued sends and Comscore native library acquisition. Original queued callbacks preserve actual sent/unsent status. Initialized Java services and local fallback UUIDs remain. |
| `app-measurement.com`; `firebaselogging.googleapis.com`, `firebaselogging-pa.googleapis.com` (SDK CCT alternatives); Facebook Graph (exact event-upload host not pinned) | **Traced integrations / SDK capability:** app/screen/purchase/share/video events, login/Deluxe properties, user-linked crash diagnostics and optional automatic Facebook events/IDs. | Permanent collection flags, runtime re-enable guards and audited event/queue/diagnostic/session/push-statistics gates. Previously persisted Firebase crash/session/notification events and DataTransport client metrics are filtered at the CCT send boundary; all-filtered batches take the native failure/delete path without claiming delivery. Shared Firebase auth/push/config and genuine Facebook login remain; SDK feature/configuration traffic is not claimed absent. |
| CCT SDK logging endpoints above: `CAST_SENDER_SDK`, `PLAY_BILLING_LIBRARY` | **Known retained SDK diagnostics:** Cast-client and Play Billing library diagnostic events. Exact payload fields and complete callback/lifecycle behavior were not audited. | Retained pending that audit, separately from genuine Cast/playback and purchase operations. These diagnostics can still transmit; the patch does not eliminate every SDK diagnostic sender. |
| `post.dumpert.nl`, `media.dumpert.nl`, `comment.dumpert.nl`, `user.dumpert.nl`, `upload.dumpert.nl`; `sdk.privacy-center.org`, `mobile-2470.api.privacy-center.org` | **Functional/mixed services:** content, comments, accounts, uploads and consent configuration/decisions. These services still receive necessary connection and service identifiers. | Retained. Skipping automatic consent UI neither grants consent nor suppresses all CMP/configuration requests; manual preferences remain available. |
| `connect.facebook.net`, `www.tiktok.com/embed.js`, `platform.twitter.com/widgets.js`; remote Instagram/Twitch content | **Traced functional embed templates/bridges:** third-party media scripts, layout callbacks and chat. Their runtime collector requests/payloads were not captured. | Retained with the functional players. These remote services can have their own collection; the native controls do not provide a universal WebView or network filter. |

</details>
