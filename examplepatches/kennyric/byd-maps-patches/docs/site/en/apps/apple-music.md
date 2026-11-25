# Apple Music

Use Apple Music's car media browser with DriveDeck, Gearslip or another compatible Android Auto host.

**App version:** 7.0.0 · **Build:** 1614 · **Original file:** APKM

[Use your original APKM](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Select the complete original archive for this exact version in Morphe Manager, including its architecture and display splits.

## Patches

| Patch | Default | What it does |
| --- | --- | --- |
| **Allow custom Android Auto hosts** | On | Lets Apple Music's car media browser accept a third-party Android Auto host and use its Android Auto root and browsing hints. |

## Why the car browser was empty

Apple Music's media3 library-root callback verifies the caller package, UID and signing certificate, and answers a denied caller with an unsupported result. It also builds the `__AUTO_ROOT__` and the car browsing hints only for Google's `gearhead` package. The patch keeps the caller lookup and accepts the caller; it then uses the Android Auto root for every accepted host. `QUERY_ALL_PACKAGES` is added so Android 11 and newer can resolve an arbitrary host package.

Apple Music's account, catalogue and playback services are unchanged.

## Before using

Sign in to Apple Music on the phone first. A patched APK is signed with a new certificate and cannot be updated in place from the Play Store.

[Installation](../guides/install.md) · [Choose patches](../guides/choose-patches.md) · [Compatibility and defaults](../reference/catalogue.md)
