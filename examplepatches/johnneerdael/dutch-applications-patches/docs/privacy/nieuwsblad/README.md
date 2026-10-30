# Nieuwsblad

Use the original Play split set **22.0.0 / 2012316104**, Android 12L+. Source/configuration evidence is not a network capture. [Technical audit](../../nieuwsblad-audit.md) · [Tracking destination evidence](../../TRACKING_DESTINATIONS.md).

Four prerelease controls pass individual and combined local patching, signing and independent decoded-output verification. The original passes 1139 retained method contracts and first failed all four selected-control effect checks. Final output also preserves 44 independently pinned switch mappings; 11 focused regressions pass. Device acceptance remains unverified.

| Control | Effect |
| --- | --- |
| Hide ads | Suppress Kaching display/video/audio requests with its genuine disabled result. |
| Disable tracking | Stop inventoried native collectors, advertising IDs, Twipe remote logging and Engage Readers initialization/events. Includes Hide ads. |
| Skip consent screens | Skip automatic consent and PayOrOk UI; complete onboarding using the original persisted preference setter. Includes Disable tracking and Hide ads. |
| Hide Premium banner | Hide publisher paywall cards and subscribe controls using existing client configuration switches. |

Article bodies, account accesses, subscription status and edition downloads retain real server decisions. These controls do not unlock withheld content. Manual login/privacy settings, push registration, content/media services and shop navigation remain. No account consent is accepted or rejected by the skip patch.

| Inspected service / destination | Evidence and data | Suppression / remaining behavior |
| --- | --- | --- |
| Kaching, Google Ad Manager, Prebid, Teads; pubads.g.doubleclick.net, ib.adnxs.com | Seen configured ad stack and request calls; targeting can include article/section and device attributes. No packet capture. | Typed disabled ad/preroll results; real account ad-free status unchanged. |
| Glitr: prod.mhtr.be, prodh.mhtr.be, prodi.mhtr.be; Piano/Cxense | Seen partner creation and event/attention/segment sends; tenant-specific routing is inferred from brand configuration. | No partners; separate attention, segment sync and promotion stops. Functional session/device getters retained. |
| Gemius / Comscore | Seen audience and player-event code, Gemius hosts gabe.hit.gemius.pl and galu.hit.gemius.pl. | Native audience/video sinks and audited initialization/state updates stopped. |
| Datadog / Mux | Seen performance/tracing and video-quality integrations carrying session/player metadata. | Initialization/monitor creation stopped. Actual effective Datadog settings remain unknown. |
| AWS Kinesis / Loggly | Seen Twipe logging transports and later remote configuration; default Kinesis region eu-west-1. Identifiers/device details are assembled by the logger. | Existing disabled transport selected for every logger configuration; promise completion preserved. |
| Engage Readers / sdk.engagereaders.net | Seen runtime SDK initialization, reader events, user-type/subscription linkage and timer event path. | SDK initialization and all traced event/timer dispatch stopped in the actual RN module. |
| Firebase / Facebook / advertising ID | Seen SDK collection APIs and default manifest configuration. | Collection flags and inventoried sinks disabled; limited zero advertising ID returned and advertising permissions removed. Firebase installation/configuration/push still function. |
| Airship | Seen analytics and push registration share a consent service. | Only analytics disabled; push registration/channel state retained. |
| Content, identity, personalisation, Twipe edition API | Seen functional requests and real bearer-token use. | Retained. Server access rules and subscription/billing behavior are unchanged. |

Remote embedded pages, games/Sportify modules and future server-loaded code may add behavior beyond these inventoried paths. No complete traffic-silence claim is made. Media playback, offline reading, slot collapse and re-signing need device tests.

The separate Agnoplay data-plugin analytics listener is also suppressed at its optional installer. Its configured event/media-metadata uploads are independent of Gemius and Mux. Other playback listeners and release behavior remain original.

Published candidate: [v1.20.0-dev.4](https://github.com/johnneerdael/dutch-applications-patches/releases/tag/v1.20.0-dev.4). The downloaded CI bundle has SHA-256 `3b8552f366231151645f219b4599eb31d060b3ed973d5bac49e433c5dc15c27a`; all 45 new-app/shared class payloads and the release catalogue match the validated source. Reapplying all controls with the downloaded published bundle also passed the patch report, output-signature and independent decoded-output checks for this app (`published-nieuwsblad-validation.log`). Runtime and live-network acceptance remain unverified.
