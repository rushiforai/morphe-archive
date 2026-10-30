# Humo

Target: `be.humo.tvgids`, **7.53.1 / 23136515**, original Android 12L+ Play split APKS. This prerelease candidate has static artifact checks; device/network acceptance remains unverified. [Technical audit](../../humo-audit.md) · [destination evidence](../../TRACKING_DESTINATIONS.md).

| Control | Effect |
| --- | --- |
| Hide ads | Stops inventoried native, Prebid, video/game requests and advertising settings fetches; filters explicit commercial body/feed content and known WebView advertising hosts. Disabled/error callbacks preserve normal continuation; rewards remain rejected. |
| Disable tracking | Stops identified event, audience, replay, diagnostics, advertising-ID and web collectors. Belgian Gemius video initialization uses the original NoOpt provider. Catsure device/queue/playback uploads stop while local queue storage remains. Includes Hide ads. |
| Skip consent screens | Runs native guest onboarding completion and omits automatic consent/setup prompts without recording consent. Existing choices and manual account/privacy/notification settings remain. Includes tracking and ads. |
| Hide Premium banner | Omits premium labels, marketing overlays and the subscriber-only onboarding benefit row. |
| Read full articles | Renders editorial body data already supplied by the server through the normal empty marketing-template result. Full anonymous premium delivery for Humo remains unknown. |

Configured/traced destinations include publisher Snowplow (`c.dpgmedia.net`, `tracking-module.api.dpgmedia.cloud`), Contentsquare/Heap, Google/Firebase/GTM measurement, Gemius (`gabe.hit.gemius.pl`), Comscore, Piano/Cxense, Usabilla and BrandMetrics (`phx.bmtrcs.com`). Independent audio interaction telemetry uses `tracker.prd.dpge.be/track`; video telemetry includes `psti.prd.dpge.be`. Identified native/web sending paths are stopped. Configuration strings establish a destination candidate, not a captured request.

Catsure no longer uploads device identity, ordered queue media URNs, position or playback state through the two identified repository methods. Outbound remote cross-device queue/playback synchronization is disabled; local queue publication and persistence remain. Genuine device identity still serves radio URL enrichment. Local emitted behavior is verified, while real playback and backend consequences remain unverified. Real article, login, push, configuration and edition/PDF services still exchange service data and identifiers. No account, purchase, signed consent, watched-ad or server entitlement is invented; Humo magazine/PDF downloads remain subject to genuine server authorization. Other remote HTML/collectors, server-stitched audio advertisements and re-signed runtime behavior require device evidence. No complete network-silence claim is made.

Published candidate: [v1.20.0-dev.4](https://github.com/johnneerdael/dutch-applications-patches/releases/tag/v1.20.0-dev.4). The downloaded CI bundle has SHA-256 `3b8552f366231151645f219b4599eb31d060b3ed973d5bac49e433c5dc15c27a`; all 45 new-app/shared class payloads and the release catalogue match the validated source. Reapplying all controls with the downloaded published bundle also passed the patch report, output-signature and independent decoded-output checks for this app (`published-humo-validation.log`). Runtime and live-network acceptance remain unverified.
