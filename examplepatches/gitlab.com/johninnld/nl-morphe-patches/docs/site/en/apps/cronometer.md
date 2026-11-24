# Cronometer

Unlock local Gold controls and remove selected advertising, promotions and telemetry in Cronometer.

**App version:** 4.57.2 · **Build:** 3399 · **Original file:** APKM

[Use your original APKM](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Use the original multi-architecture APKM and an ARM64 phone. Preserve its bundled libraries when patching. Later releases are not supported.

## Patches

| Patch | Default | What it does |
| --- | --- | --- |
| **Disable ads, tracking and Gold upsells** | On | Applies the combined controls: opens local Gold features, removes selected Gold banners, food suggestions and referrals, and hides the persistent first-food tip. |
| **Disable ads** | On | Prevents Google Mobile Ads initialization and banner/interstitial loading. |
| **Disable Adjust tracking** | On | Stops Adjust initialization and event tracking. |
| **Disable Amplitude tracking** | On | Compatibility control included in the combined selection; preserves the app's plugin replies. |
| **Disable Braze tracking** | On | Stops Braze integration initialization while preserving the app's plugin replies. |
| **Disable Datadog telemetry** | On | Stops Datadog initialization and completes disabled RUM requests without displaying SDK errors. |
| **Disable Firebase Analytics** | On | Stops Firebase Analytics event and user-attribute writes. |

## Advertising and tracking services

The controls target Google Mobile Ads, Adjust, Braze, Datadog and Firebase Analytics. They do not claim to remove every possible telemetry path.

## Before using

Choose the combined patch for local Gold features and promotion removal. Server-backed services still require working access; a Gold account label does not create a paid server subscription. Patch the original APKM in Morphe Manager and retain Manager's signing key for updates that preserve app data.

[Installation](../guides/install.md) · [Choose patches](../guides/choose-patches.md) · [Compatibility and defaults](../reference/catalogue.md)
