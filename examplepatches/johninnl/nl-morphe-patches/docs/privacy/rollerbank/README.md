# Rollerbank 4.5.3.1 audit

Package `com.dennisk.rollerbank`, build 4531, minimum SDK 32, target SDK 36.
Original base SHA-256: `d8e32f93fe1d9697a9897076b2cbfac8f20f6f98cf5113098cfe6a8d60243d7c`.
Original publisher certificate SHA-256: `dff7cf9d4f59e4be49a5135425a00c6feb0fc561d5b3aa0d703456dab6d9b788`.

This is a source and shipped-artifact audit. Packaging an SDK or finding a URL does not prove transmission. Detailed REA records, original split hashes, source extracts, screenshots and runtime results accompany the local audit artifacts. No packet-capture claim is made. Full JADX recovery reported 173 errors globally; the relevant methods were corroborated with original smali and focused REA evidence.

## Advertising and consent

`rn2` (MobileAdService) owns Google Mobile Ads initialization, banner and native requests, and Google UMP consent updates. Home/All lists insert native ad rows. Map, report detail, report creation and En Route screens have banner placements. Seven separate local boolean flags control these placements; they are distinct from the route-access flag.

Hide ads switches those flags off and stops the central initialization/load boundaries. Skip consent screens additionally completes the app-owned setup callback with `completed=true`, `canRequestAds=false`, no error and no message. It does not call UMP, store an accepted decision or grant an Android permission. The consent button and accompanying explanation are hidden while their view IDs remain available to native completion handling. Home content, optional location setup and Nearby/area validation remain.

Premium promotion is a separate introduction page selected by a stored preference. Hide Premium banner omits that page, removes the three-entry Upgrades preference category and removes both purchase entries from the toolbar menu shared by Home, Map, All and Settings. The settings action remains. It leaves purchase processing and entitlement flags unchanged.

## Optional tracking and retained services

| Service / boundary | Observed data and behavior | Patch effect / limitation |
| --- | --- | --- |
| Firebase Analytics | Custom navigation and setting events; `melding_send` includes submitted report latitude, longitude, city, location and control type. These are report coordinates, not proven background location uploads. | Stop the explicit event boundary and set collection deactivated metadata. Preserve the separate functional report submission. |
| Firebase Crashlytics | Authentication success attaches values named Auth Token, User Token and Unique ID to custom attributes. Startup and consent errors explicitly resolve the cached report decision with true. | Stop custom attributes, logs and exceptions; disable automatic collection; resolve those three explicit upload decisions with false. Remove the two direct authentication Log.e calls that expose identifiers outside Crashlytics. These changes do not establish historical data deletion. |
| Google CCT transport | Runtime showed a firebaselogging.googleapis.com batch upload attempt; body and producer were not established. | Acknowledge and discard optional CCT batches before serialization/network; the original uploader drains persisted events without a retry loop. Incoming FCM and token registration use separate transport paths. |
| Firebase Sessions | Eager registrar starts lifecycle/session infrastructure. | Remove only its registrar and set its enabled flag false. Keep Firebase initialization, Installations and Messaging. |
| Advertising identifiers / Privacy Sandbox | Manifest requests advertising ID, AdServices Topics, advertising ID and attribution permissions, plus install-referrer permission. | Remove those declarations under Disable tracking. Ordinary location and network permissions remain. |
| `api.rollerbank.net` | Anonymous/device-linked authentication, report retrieval and submission, push token registration, route location requests and purchase processing. | Functional paths retained. Necessary requests still reveal network/device context to the service. |
| Firebase Installations / Messaging | Installation identity, token registration and incoming push. | Functional paths retained; optional delivery metrics export disabled. Re-signing requires original public-certificate compatibility for SDK package lookups. |
| Google Maps / Places | Maps, place search and area selection; service requests can include selected or current location. | Retained. Maps uses the unchanged existing community key from the release build. Firebase and Places retain their original key; package-scoped SDK lookups retain the original input certificate. A controlled key-only comparison rendered tiles and markers with this existing working key. The user authorized synchronizing the local input and Actions secret; no Cloud restrictions were changed. These functional providers can still collect their own service diagnostics. |

REA examples: package `ev_4238bb2bc02992a6ed09904c9c70874b0eefa9071f0f6e4e6a41346868501c42`; original consent gate `ev_5ee7708bf8f29edeff263ee412846880ba11b55fe9c0ec5427d3d85513921bda`; original onboarding `ev_33adb003ddb383883c564a120cb95e3803d4b1c2a06d5cf05478b18f46eaec3f`. The APK subject digest and JADX engine JAR digest identify different artifacts and must not be conflated.

## Local feature locks and notification feasibility

En Route is locally gated by the route button, `ActivityRoute.j`, activity startup and its purchase callback. The service itself already implements location tracking, nearby requests, distance checks, notification channels, sound, speech, deduplication and a serialized alert queue. The separate Enable En Route alerts control enables the local route entry and keeps purchase callbacks from closing it, while retaining real billing and authentication state.

The route API sends location and display radii to POST `/api/user/route`. Its response contains controls and `static_cameras`. Camera coordinates come from the service, not an established bundled offline database. Static map markers appear above zoom 13 without a premium check in the traced marker path. Main lists receive controls; the route list combines controls and cameras.

Default control notification radius is 3000 m; static-camera warning radius is 500 m, with a 750 m request radius. Static-camera warnings default off. Alerts compare straight-line distance strictly below the radius. Speed drives display and bearing drives map orientation; no speed-limit, direction or road-matching test was found in the alert branch. Static points include license-plate/low-emission-zone cameras, so they are not all established speed-enforcement cameras.

The existing location callback refreshes after 50 m displacement. The original alert queue waits for TTS initialization even when speech is disabled; Enable En Route alerts removes that wait for sound/visual warnings and permits speech only after TTS is ready. Failed requests, overlapping camera/control IDs, permission denial and existing notification-channel settings remain validation boundaries. Camera warnings are enabled once on first route use, preserving later explicit disabling. The route screen requests POST_NOTIFICATIONS where required and preserves native location/background-location checks. The fresh-installation server check below proves route and static-camera data access for this test identity; it does not prove every account or FCM push eligibility. No purchase token, billing response or backend entitlement is fabricated.

Ordinary FCM control pushes use a different mechanism: incoming server events are filtered locally against all content, a stored area or current location. They do not start the En Route service. Retaining FCM registration is not evidence of actual push delivery.

## Verification and scope

Use `python3 scripts/validate_targets.py rollerbank ORIGINAL.apks --bundle BUNDLE.mpp` for independent and combined controls. It requires the audited original base digest, applies the whole split archive and verifies output signing, complete graphs in touched classes, placement flags, consent callback values, resource changes, retained components and Google certificate compatibility. Runtime validation uses a dedicated Android 36 emulator; physical-phone installation, live driving, actual FCM delivery and production camera coverage are separate acceptance items.

The stable branch and release are unchanged. Source changes and a locally signed test APK are prepared for review; no publication is implied.

## Live server data verification (31 October 2026)

REA controlled replay used the dedicated fresh emulator installation's genuine authentication, FCM token and stored user credential. No purchase was made or submitted and no entitlement response was fabricated. TLS was verified against the system CA bundle; the first attempt with the Python installation's missing CA configuration failed before reaching an authenticated response and was not treated as an access denial.

- GET `/api/rollerbank/all`: HTTP 200, API Success; 16 control reports and 50 static cameras in this sample.
- POST `/api/user/route` at a synthetic central-Amsterdam position, with 5000 m control / 750 m camera request radii: HTTP 200, Success; one control and no camera inside this sample area.
- The same route request at returned camera #39, IJtunnel entrance: HTTP 200, Success; one control and one static camera.
- POST `/api/staticcam/get` with id 39: HTTP 200, Success; license-plate camera details returned.

These results establish that the tested fresh installation can retrieve camera and route data. They do not prove all accounts, complete camera coverage, background alert delivery or offline availability. This was a host-side replay of the exact shipped request fields, not a completed in-app route run. Runtime route verification is recorded separately. Responses were retained with credential fields redacted and raw response SHA-256 digests. REA evidence: `ev_f983cfb8ed02189ac10932fd8547ac06ad3870082ec2b9039fcce08c3349bafc`, `ev_fb4892e2723347c693a263de1d58f9eca09e518f3e6c5b2f7718572368cf1ac1`.

## Native route acceptance

On the dedicated Android36 emulator, the native route service loaded real server camera39 and control54982 and displayed their locations/distances in its own list. A synthetic movement outside and back inside the radii triggered both native notifications while the activity was in the background. Camera39 used route_channel_v2 at importance4 with configured sound and vibration. Repeating with the TTS engine disabled still displayed the camera warning in the Android notification shade. This establishes local alert execution and background posting in this test; emulator host audio was disabled, so audible hardware output and real driving are not claimed.

First-entry permission sequencing was exercised: the original location rationale appears first, normal Android settings grant background location, then the app requests notifications. RouteService does not start while the notification choice is pending. Six focused fixtures also cover denial, pending/re-entry and inherited callback forwarding.

The six controls passed standalone and combined whole-split patch/signature/emitted-DEX verification. The combined check compares151 complete original method graphs plus the new route helpers and CCT acknowledgement behavior. The Python suite ran378 tests:339 passed and39 environment/input-dependent cases were skipped.
