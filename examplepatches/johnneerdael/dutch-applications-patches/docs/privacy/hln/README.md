# HLN

Use the original Play split set **9.22.0 / 2009220000**, minimum SDK 32. Source/configuration evidence is not a packet capture. [Technical audit](../../hln-audit.md) · [Tracking destinations](../../TRACKING_DESTINATIONS.md).

All five prerelease controls pass Morphe FULL patching, output-signature checks and independent decoded verification, individually and together. Original-input coverage passes and each effect was shown RED before implementation. The added Catsure heartbeat and queue suppression also pass the real tracking, consent and combined-output rechecks, including local persistence and coroutine selector/mask preservation. Device validation remains unverified.

| Control | Effect verified in decoded output |
| --- | --- |
| Hide ads | Remove explicit commercial components, advertorials and Deals/Shop/Games cards; disable banner technologies and video/game prerolls with the existing rejected/error continuation. |
| Disable tracking | Stop audited collectors, queues, identifier acquisition, Gemius CIM, optional FIAM and independent audio/video analytics. Include Hide ads. Stop detached Catsure heartbeat/queue reporting while retaining functional login, notifications, local queue publication/persistence and radio/car state. |
| Skip consent screens | Skip automatic consent/login/topic prompts through the guest route; preserve manual login/privacy controls, existing choices and city selection. Notification and newsletter opt-ins stay off until manually selected. Include Disable tracking and Hide ads. |
| Hide Premium banner | Remove premium labels and marketing templates; preserve editorial inline/read-more content. |
| Read full articles | Request the complete representation through the existing API and complete marketing with empty typed results. Never grant an entitlement or supply withheld text. |

The server's anonymous premium article yield is unknown. There is no HLN device test or network capture in this audit. Remote widgets, scripts, effective configuration, signature acceptance and full functional runtime coverage remain open.

| Inspected destination/path | Purpose | Change / retained behavior |
| --- | --- | --- |
| `c.dpgmedia.net`, `sb.scorecardresearch.com`, Google/Facebook measurement families | Publisher events, audience analytics, diagnostics and identifier-linked events | Stop the inspected collectors, queues and re-enable paths. Exact upload routing is not captured. |
| `comcluster.cxense.com`, Piano regional endpoints, `sdk.out.usbla.net` | Pageviews, queued events, automatic feedback events/custom variables | Stop scheduler/sender boundaries; retain manual feedback readiness. |
| `gabe.hit.gemius.pl` | HLN audience measurement | Stop SDK initialization/event sending and video CIM flag writes. |
| `tracker.prd.dpge.be/track` | Independent Amalia audio analytics | Complete locally with the existing Success(Unit) type; preserve local session/player state. |
| `/api/v1/events/video.analytics.v1` | Video analytics payloads | Complete its audited coroutine with actual Kotlin Unit. Effective base host remains unverified. |
| Marketing-template services | Article/section marketing templates | Stop the two request paths with an empty list and a Flow containing an empty list; no fake authentication or subscription values. |
| PrivacyGate metrics / PIP telemetry | Diagnostics sharing service families with consent/login | Stop measurement methods; retain genuine privacy storage, authentication and token refresh. |
| `cat-sure.api.dpgmedia.cloud/api/player/heartbeat`, `/api/queue/sync` | Outbound playback position/device and queue reporting; results are discarded by their callers | Stop the heartbeat sender and bypass only the inlined queue upload block. Preserve duplicate handling, local queue publication/serialization/persistence, shared device/radio/car/auth state. Cross-device/server effects remain untested. |

Published candidate: [v1.20.0-dev.4](https://github.com/johnneerdael/dutch-applications-patches/releases/tag/v1.20.0-dev.4). The downloaded CI bundle has SHA-256 `3b8552f366231151645f219b4599eb31d060b3ed973d5bac49e433c5dc15c27a`; all 45 new-app/shared class payloads and the release catalogue match the validated source. Reapplying all controls with the downloaded published bundle also passed the patch report, output-signature and independent decoded-output checks for this app (`published-hln-validation.log`). Runtime and live-network acceptance remain unverified.
