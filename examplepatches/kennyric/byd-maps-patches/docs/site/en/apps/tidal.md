# TIDAL

Use TIDAL's car media browser with DriveDeck, Gearslip or another compatible Android Auto host.

**App version:** 2.216.0 · **Build:** 10020 · **Original file:** APKM

[Use your original APKM](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Select the complete original archive for this exact version in Morphe Manager, including its architecture, language and display splits.

## Patches

| Patch | Default | What it does |
| --- | --- | --- |
| **Allow custom Android Auto hosts** | On | Lets TIDAL's car media browser accept a third-party Android Auto host instead of rejecting it through TIDAL's known-host certificate list. |

## Why the car browser was empty

TIDAL's `MediaBrowserService` receives the host package name and its UID, looks the caller up, and compares its signing certificate with TIDAL's own known-car list. A third-party host has a different certificate, so TIDAL returned no browser root and the car showed an empty or missing TIDAL entry. The patch keeps the caller lookup and the root construction and only skips the rejection branch. It also adds `QUERY_ALL_PACKAGES` so Android 11 and newer can resolve the arbitrary host package during the lookup.

TIDAL's account, subscription, catalogue and playback services are unchanged.

## Before using

Sign in to TIDAL on the phone first. The host must implement the media-browser protocol and the media templates it uses for TIDAL. A patched APK uses a new signing certificate and cannot be updated in place from the Play Store.

[Installation](../guides/install.md) · [Choose patches](../guides/choose-patches.md) · [Compatibility and defaults](../reference/catalogue.md)
