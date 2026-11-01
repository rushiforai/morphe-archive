# TVgids.nl: tracking destinations and data

Inspected input: `nl.tvgids` **7.0.16 / 106691**, original standalone APK,
Android API 26 or newer. Both development controls default on: **Hide ads** and
**Disable tracking**. Disable tracking includes Hide ads. Phone acceptance remains outstanding.

The table describes code paths and configuration in this exact build. **No phone
traffic capture establishes transfers to these destinations.** App-wired means
the app calls the inspected path. Configured and SDK evidence have narrower scope;
conditional paths may be inactive in a fresh installation.

| Destination and evidence | Purpose and data in the inspected path | Patch effect and remaining exposure |
| --- | --- | --- |
| `json.tvgids.nl/v7/` — **app-wired shared API** | Guide, editorial, account and saved-item requests, plus separate advertising configuration. Genuine account requests can carry bearer authentication. | Hide ads stops the ad-only fetch through its original initialized asynchronous return path. Guide, account, editorial and authentication requests remain. |
| `tvgidsassets.nl` — **app-wired images** | Editorial images and failed-ad/house creatives. Image requests expose ordinary HTTP information, including IP address. | Ad fallback rendering and its wrappers are removed. Editorial image loading remains. |
| `voorkeuren.tvgids.nl` — **app-wired OSB foreground/configuration/CMP** | Page, item, campaign and event context; account linkage, session ID, advertising ID and permission-dependent location. CMP URL construction can use cached `osb-cduid`, advertising ID or Android ID. | Disable tracking stops session-ID creation, identifier collection/publication, foreground events, location/resume work, queue admission and final upload. Manual consent/configuration remain; the CMP URL has an empty `cduid`. Its remote acceptance needs phone testing. |
| `voorkeuren.tvgids.nl/v1/_` — **app-wired background-push POST** | `received_background`, device-unique ID, app/device User-Agent and notification/campaign/push fields. This bypasses the foreground collector. | Disable tracking stops the continuation before device-ID lookup and request construction. Firebase setup and shared cache cleanup retain their original code; the asynchronous result completes once. |
| `b.scorecardresearch.com`, `sb.scorecardresearch.com`, `udm.scorecardresearch.com`, `census-app.scorecardresearch.com` — **native SDK destinations with an app-wired Comscore integration** | Audience/page measurement, publisher/site configuration, content/category values and generated `cs_fpid`. The Java SDK also contains `sb.scorecardresearch.com/p2` diagnostics. Individual contacted hosts and payloads were not captured. | Dart start/configuration/page/FPID paths and native collector/configuration admissions are stopped. Identifier streams end through the real protocol. These findings concern app/media measurement; they do not establish microphone recording. |
| `sentry02.isource.nl` — **app-configured Sentry** | Error/crash diagnostics and associated context; the complete runtime payload is unobserved. Initialization also invokes the application runner. | Disable tracking follows the empty-DSN decision into the SDK's no-op hub, stops integration/native activation and disables the inspected startup providers. The application runner still runs once. The configured DSN value and native libraries remain in the APK. |
| `graph.facebook.com`; SDK template `graph-video.facebook.com` — **configured Graph builders; app-wired optional events/attribution** | App-event names/parameters, anonymous app-device GUID, optional advertising-ID attribution, app identity and install attribution. The video hostname is SDK capability, not evidence of a TVgids video upload. | Event/advertising-ID settings, event processing, timers, persisted-event reads/sends and attribution jobs are blocked. Core initialization, settings and user-invoked authentication remain, so functional Facebook requests can still occur. |
| `firebaselogging.googleapis.com`, `firebaselogging-pa.googleapis.com` — **configured CCT endpoints; conditional FCM measurement** | Delivery metrics can include message/installation identity, project/package details, priority, TTL, topic/collapse key and campaign labels. Export defaults off here; restored preferences or API calls can enable the original path. No Firebase Analytics registrar was found. | Receive/open analytics and export re-enablement are blocked. Persisted batches are filtered after client metrics are appended, removing `FCM_CLIENT_EVENT_LOGGING` and `GDT_CLIENT_METRICS`. Telemetry-only batches use native fatal-discard handling. Other event types retain their real outcomes and retries. |
| `firebaseinstallations.googleapis.com`, `fcmregistrations.googleapis.com` — **configured functional SDK endpoints** | Installation/authentication state, app/project identity and push registration information. | Functional Firebase/FCM initialization, tokens, topics, notification routing and reminders remain. These services and identifiers are not made anonymous by the patch. |
| Native advertising SDK destinations — **app-wired startup/load paths; complete host list unresolved** | Advertising requests, creative loading and measurement depend on SDK/configuration responses. | Hide ads stops native startup/loading, ad-only configuration and the Dart placements. This does not enumerate every possible advertising hostname. |
| NLZIET affiliate link — **explicit promotional widget** | `promo_links/nlziet` click event and an external URL with affiliate campaign parameters. | Hide ads removes the promotional bar. Deliberately opened where-to-watch/provider links remain. |
| API channel banners, YouTube/Instagram and other remote embeds — **functional/mixed content** | Media, external scripts and ordinary request information; exact runtime receivers and payloads remain unverified. | Editorial media and unclassified channel banners remain. External players, linked services and server-delivered media can have their own advertising or collection. |

## Consent and stored history

Manual consent writes, readback, validity checks and channel completion remain.
The original converter stores a local `ANALYTICS_STORAGE=GRANTED` default even
when advertising consent is rejected. Tracking stays blocked after either manual
choice; that local label alone is not evidence of an upload. Invalid raw input
follows the original storage behavior and fails validity checks. The patch
fabricates no accepted consent, account, subscription or successful backend transfer.

Existing local history can remain. OSB's in-memory queue and all-telemetry CCT
batches are discarded when those paths run; Facebook's old event history is not
read/sent by the guarded queue. This does not erase provider-held records.
Unknown CCT event types retain their original transport behavior.

## Verification limits

FULL rebuild/sign/decode checks cover the named controls and dependency closure,
270 pinned Android method graphs/register ABIs, manifest ownership and all 24
native libraries. Native policies cover arm64-v8a, armeabi-v7a and x86_64.
Bounded instruction tests exercise ad layout, background completion, Comscore,
Sentry, SDK queues and consent storage with declared VM/Android/TCF/HTTP boundaries.
They do not render Flutter, run the complete event loop, deliver real push
messages or prove absence of all traffic.

[All app READMEs](../README.md).
