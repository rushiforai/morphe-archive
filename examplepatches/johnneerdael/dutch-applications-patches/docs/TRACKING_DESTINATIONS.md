# Tracking destination evidence (2026-10-28)

The [bilingual documentation site](site/en/apps/index.md) contains the user-facing
explanations for each app. The original destination tables remain available in
the [reviewed README snapshot](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/README.md).
This note records where those domain annotations come from. A hostname in code/configuration is evidence
of a destination or capability, not proof of a request from a particular phone.
No decrypted traffic capture was added for this documentation update. Raw APKs,
source decodes, response bodies, account values and credentials remain private.

## Evidence classes

- **Traced:** app call sites reach a sender or initialize/configure the relevant
  SDK. Data descriptions come from the inspected arguments/payloads/audit.
- **SDK endpoint:** the relevant SDK declares or constructs the host. This alone
  does not establish that its optional branch ran. Configuration/loader hosts
  are identified as such, not called data-upload endpoints.
- **Configured:** an actual brand/resource selects it, including placeholders;
  a generic other-brand or nonproduction alternative is insufficient.
- **Web policy:** the patch covers that host if loaded. An allowed/blocked URL
  fixture is not a historical traffic capture.
- **Retained:** functional or unclassified mixed requests deliberately remain.
  Necessary device/session/location data can still leave a patched application.

The entries describe inspected versions. They do not establish retention periods,
resale, cross-company sharing, legal compliance, or activity by an individual
application owner. Payload fields and destination selection can vary with account,
permissions, consent, remote configuration, region and selected features.

## Version-specific references

| App | Destination references and boundary |
| --- | --- |
| Buienalarm 4.32.0 | [Existing inventory](TRACKING_AUDIT.md): exact `/v2/ads/targetting` method and its shared `api.meteoplaza.com` host; PPID and city/country arguments. The original extraction is no longer at its former temporary path. Unpinned Google/Facebook/RevenueCat/Didomi/NotifyHub upload hosts are explicitly left unknown in README rather than inferred from other apps. |
| Buienradar 7.4.8 | [Inventory](BUIENRADAR_TRACKING_AUDIT.md): `dh9.a` selects both Snowplow collectors, `yz3` adds the Kantar/NMO ping, `ue9.j` selects Smartocto, `TFKBitmovinPlayer` enables analytics, `UbTelemetryRecorder` configures Usabilla; `LocationIntelligenceWorker → h25.E → gn0.a` sends latitude/longitude plus Swrve user ID. |
| Weeronline 3.61.0 | [Inventory](WEERONLINE_TRACKING_AUDIT.md) supplies app event/consent/identifier paths. Re-read original smali: `t9.1/L` and Google measurement configuration contain `app-measurement.com`; `com/facebook/f` / `$c` build `graph.%s`, with Facebook domain configuration in the SDK. The explicit `graph.facebook.com` URL also appears in functional `InstagramCmsContentItemKt`; that is not classified as an app-event call or blocked wholesale. `POBCommonConstants` contains PubMatic ad hosts; `POBCrashReporter` contains `owsdk.pubmatic.com`; `Ac/a.1` contains RevenueCat endpoint alternatives; `io/didomi/sdk/e1.1` contains `mobile-2470.api.privacy-center.org`; `H6/c` sends Blue Billywig statistics. Firebase settings is configuration, not a pinned diagnostics-upload host. |
| Weerplaza 3.13.1 | [Inventory](WEERPLAZA_TRACKING_AUDIT.md#collector-coverage): fetched webapp GTM tag, photo iframe's `analytics.infraloods.nl` script and exact host/path policy. Domains from the broader policy are explicitly labeled policy coverage, not captured transfers. |
| NU.nl 26.9.0 | [Inventory](NUNL_TRACKING_AUDIT.md): app TrackingSDK/SAC/Firebase/Comscore/Usabilla/JW/BrandMetrics and BFF boundaries; production `be/persgroep/tracking/config/Environment` host; `sb.scorecardresearch.com` and `sdk.out.usbla.net` SDK constants. Other web rows mirror the audited `WebContentPatch` policy, identified accordingly. `graph.nu.nl` card-completion side effects were tested through real anonymous requests and remain functional. |
| de Volkskrant 7.53.1 | [Inventory](VOLKSKRANT_TRACKING_AUDIT.md): native collector paths and first-party web embed evidence/policy. Shared audio environment names identify a coverage follow-up, not a new claim that the existing patch stops Amalia's separate sender. |
| Trouw 7.53.1 | [Inventory](trouw-audit.md): preserved Catsure device/queue/heartbeat data; re-read `AmaliaEnvironmentProvider`, video `NetworkEnvironmentProvider` and TrackingSDK `Environment` constants for `tracker.prd.dpge.be`, `psti.prd.dpge.be` and `tracking-module.api.dpgmedia.cloud`. Other endpoints include actual CIM configuration, Comscore/native destinations and existing scoped web policy. |
| FTM 2.6.8 | [Inventory](FTM_TRACKING_AUDIT.md#transport-and-native-analytics): inspected website senders/loader and exact comments-visibility route, with field/key cleanup and retained functional browser/account/push behavior. |
| AD 9.22.0 | [Inventory](AD_PATCH_AUDIT.md): app-owned native events, pending senders and actual video analytics route. Original production SDK environment/constants include the listed publisher/Piano/Comscore/Usabilla destinations. Regional Piano alternatives are marked alternatives, not all observed transfers. First-party editorial `valley.*` documents are not classified as collectors merely by hostname. The separate original audio `/track` sender (`tz8 → rz8`, production environment `ys`) is not targeted by the AD patch and is disclosed as a remaining gap. |
| NRC 5.12.24 | [Inventory](NRC_PATCH_AUDIT.md): native app integration and appview source/policy. Re-read `com/chartbeat/androidsdk/Tracker` (`ping`/`pong.chartbeat.net`), `com/parsely/parselyandroid/ParselyTrackerInternal` (`p1.parsely.com`) and `com/mediahuis/oneapps/sharedsdk/partners/CxenseTrackingPartner` (`scomcluster.cxense.com`). The article/edition backend is retained, not presented as tracking-only. |
| Parool 7.53.1 | [Research](research/2026-10-28/parool.md#webnative-host-roles-and-mixed-transports) and [implementation audit](parool-audit.md): actual Parool `default.json` config selects `phx.bmtrcs.com` with DMOI/survey placeholders; concrete Amalia `/track`, video environment, Gemius setup, native Comscore and shared web policies. Functional Catsure and Firebase installation/push/configuration are separately disclosed. |
| Dumpert 5.8.0 | [Research](research/2026-10-28/dumpert.md) and [implementation audit](dumpert-audit.md): separate GAM/Prebid and detail/Shorts paths; actual PostRec sender, Piano queued conversions, Comscore native-acquisition gate, Firebase/Facebook runtime controls. IMA/functional SDK initialization, social players, CMP and necessary service traffic remain explicit residuals. |
| RTL Nieuws 12.7.1 | [Research](research/2026-10-28/rtl-nieuws.md) and [implementation audit](rtl-nieuws-audit.md): independent Snowplow and NMO/FocalMeter senders, video measurement and DMOI identity links, selective persisted queues, native automatic/manual privacy readiness and campaign gates. Standard controls retain useful push and configuration; the optional expert Swrve control stops remaining SDK/background push activity and disables push/channel synchronization. Shared Firebase auth/installations/configuration, unknown queue names, remote media and legacy TFK limits remain explicit. |
| Omroep Brabant 11.1.0 | [Research](research/2026-10-28/omroep-brabant.md) and [implementation audit](omroep-brabant-audit.md): independent ContentInsights, NMO and publisher read-history senders; Piano and Blue Billywig measurements; native ad placements and separate video-ad paths; known persisted measurement filtering. Local history, Piano local expiry/cap cleanup, content, media, manual notification settings and push remain. Remote scripts, server-side inserted ads and unknown measurement receivers remain explicit limits. |

New app increments must add their own app documentation and evidence. Unknown exact
hosts or payloads must stay explicit until source/runtime evidence resolves them;
never copy a sibling app's endpoint list as if it were captured traffic.

## Planned-app tables

The five remaining research targets without stable controls are VI,
NOS Teletekst, 9292, Marktplaats and TVgids.nl. The
[research-only app guide](site/en/apps/research.md) links their committed reports
under [research/2026-10-28](research/2026-10-28/README.md), with explicit
“research only / no controls published” status. They do not imply existing
Morphe coverage, observed per-phone traffic or successful re-signing.

For TVgids.nl, a follow-up read of the original input archive's three
`libcomScore.so` entries (ARM64, ARMv7, x86_64) independently found
`b`, `sb`, `udm` and `census-app.scorecardresearch.com`. This corroborates
native destination capability alongside the already traced Comscore startup;
it does not establish which endpoint a runtime session selects.

The optional attempt to read the installed Buienalarm APK found no single
available USB device. No APK/device state was changed; unpinned domains stay
explicitly unknown.

## Belgian news candidates (2026-10-30)

| App | Destination evidence and patch boundary |
| --- | --- |
| De Tijd 5.6.1 | [Audit](detijd-audit.md) and [research](research/2026-10-30/detijd.md): Hermes Snowplow initialization/events (`tr.mediafin.be`), native Gemius CIM/video/audio tracking (`gabe.hit.gemius.pl`), Admantx keyword requests (`euasync01.admantx.com`), Mux consent gate and Firebase analytics defaults. Airship push/screen naming, Firebase Remote Config/client credentials, Auth0, content and manual Didomi preferences remain. Host roles are static evidence; anonymous article response-shape observations establish delivered paragraphs, without proving whole-app network silence. |
| De Morgen 7.53.1 | [Audit](demorgen-audit.md) and [research](research/2026-10-30/demorgen.md): publisher banner/IMA, Prebid, video/game advertising settings, Gemius CIM/video CIM, Amalia analytics, Contentsquare/Heap, Comscore, Piano and scoped BrandMetrics web stops. Detached Catsure queue/heartbeat uploads also stop, with local queue state/persistence retained; remote cross-device queue/playback synchronization is lost. Firebase installation/push/config remains functional; whole-app traffic is not yet measured. |
| Humo 7.53.1 | [Audit](humo-audit.md) and [research](research/2026-10-30/humo.md): the DPG edition app, with the same typed collector boundaries and Belgian video-CIM/provider handling as De Morgen. Detached Catsure queue/heartbeat uploads also stop; local queue, radio identity, account/session, push and server entitlement remain. Remote queue/playback reporting is lost; no anonymous premium delivery or network-silence claim from static output. |
| HLN 9.22.0 | [Audit](hln-audit.md) and [research](research/2026-10-30/hln.md): retargeted Kubus native collectors, Gemius CIM initialization/events and video flags, plus Amalia's `tracker.prd.dpge.be/track` analytics path. The analytics completion uses the app's actual Success<Unit> wrapper. Detached Catsure heartbeat and queue uploads also stop; local queue publication/persistence remain, while outbound cross-device queue/playback updates are lost. Native/web marketing calls complete with supported empty list/Flow results; entitlement, account, push and genuine service state remain. Host/code evidence is static; live traffic and anonymous premium yield require runtime checks. |
| Nieuwsblad 22.0.0 | [Audit](nieuwsblad-audit.md) and [research](research/2026-10-30/nieuwsblad.md): Mediahuis One Kaching banner/audio/video boundaries, native partner/audience/event collectors, Mux/video-CIM, the separate Agnoplay Data event listener and the embedded Twipe logger/Engage Readers paths. The shipped logger selects Kinesis; its credentials are not reproduced. Content, reader authorization, push and account/billing paths remain; source and emitted checks do not prove network silence. |
| DS Nieuws 22.0.0 | [Audit](dsnieuws-audit.md) and [research](research/2026-10-30/dsnieuws.md): independently pinned brand input with the same Mediahuis/RN tracking boundaries. DS-specific alternative billing remains unchanged. Premium UI suppression does not alter server-provided article bodies or edition authorization. |
