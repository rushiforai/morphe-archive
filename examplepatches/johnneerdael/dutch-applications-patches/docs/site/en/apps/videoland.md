# Videoland Android

**Supported app:** 1.116.4 · **Build:** 1627 · **Input:** APKS

`nl.rtl.videoland.v2`

[Use your own APKS](../guides/downloads.md#local-original-inputs){ .md-button }

Select this file in Morphe Manager to apply the patches.

These controls target the Android phone and tablet application. They suppress client advertising and optional measurements, save a genuine refusal of optional cookie purposes, and leave notifications off without an automatic permission question. Free-tier catalogue filtering is outside this mobile release.

## What did we find in the app?

| Activity / service | What our evidence shows | What changes |
| --- | --- | --- |
| Video, banner and pause advertising | Mobile Bedrock requesters and the player loader use separate typed results. The supplied live alternative retains its own DRM object. | Hide ads completes the client requesters with their supported empty results and uses only a supplied live fallback. |
| Measurement and identifiers | Tealium, Snowplow, NPAW, New Relic, Firebase, Facebook, Salesforce analytics, Usabilla and JOIN measurement have distinct startup, configuration and upload paths. | Disable tracking stops those optional paths, including saved preference overrides and queued uploads. JOIN editorial delivery and explicit feedback callbacks remain. |
| Privacy and notification onboarding | The OneTrust SDK persists refusal before normal ready completion. A native startup task can finish without launching notification UI. | Skip consent screens records optional purposes as rejected and completes automatic notification onboarding without a permission request. Manual settings remain available. |

## What remains and what is still unknown

Accounts, subscriptions, authentication, content delivery and license services remain genuine. These controls do not grant content rights or remove advertising embedded in the programme itself. Live assets without a supplied clean fallback can retain server-stitched advertising. The mobile build does not include the TV-only unavailable-content filter. End-to-end casting and every subscription tier have not been independently tested.

Customizer configuration and experiment assignment retrieval remain. They can use user, profile or device identifiers to select configuration overrides; these requests are not established event measurement, and their server-side processing is outside the observed boundary. Fresh installations, every device and long sessions need broader testing.

## Available controls

Disable tracking, Hide ads, Skip consent screens.

All three controls are enabled by default. Skip consent screens includes Disable tracking; ad removal remains independently selectable.

[Read what each patch changes](../reference/catalogue.md). See [installation](../guides/install.md) for original files and signing, and [choosing patches](../guides/choose-patches.md) for which patches depend on others.

## Evidence

Inspected against the original phone split set collected on 30 October 2026: [mobile analysis](https://github.com/johnneerdael/dutch-applications-patches/blob/main/docs/research/2026-10-30-videoland-mobile.md) and [consent and notification contracts](https://github.com/johnneerdael/dutch-applications-patches/blob/main/docs/research/2026-10-31-videoland-consent.md). Independent whole-output comparisons cover all original methods, class declarations, selected changes and packaged payloads. Android 16 ART checks exercise typed ad, telemetry and live-fallback contracts; the user tested the final three-control APK on their phone, confirmed startup and playback work and approved the stable release. The current account and app data were preserved. The 41 isolated Android 16 ART cases cover the preceding ad/tracking controls; consent and notification startup are backed by independent emitted checks and the final phone test, not an invented onboarding ART pass. [How to read the evidence](../reference/methodology.md).
