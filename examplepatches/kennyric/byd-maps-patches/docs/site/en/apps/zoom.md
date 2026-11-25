# Zoom Workplace

Use Zoom's native car interface with DriveDeck or another compatible projection host.

**App version:** 7.2.1.43844 · **Build:** 6702010 · **Original file:** APKS

[Use your original APKS](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Select the complete original archive in Morphe Manager, including the base, architecture and display APKs. This target is the ARM64 build.

## Patches

| Patch | Default | What it does |
| --- | --- | --- |
| **Allow all Android Auto hosts** | On | Opens Zoom's native meeting and phone interface to every compatible projection host, without a host package or certificate check. |

## Advertising and tracking services

This patch changes access to the car interface. Zoom's existing accounts, analytics, permissions and online services remain active.

## Before using

Sign in to Zoom on the phone. The patch keeps Zoom's car service enabled so compatible hosts can discover it after installation and startup. Meeting availability and Zoom Phone features depend on your account and license. The host must implement Zoom's car templates and required car API level.

The patch also prevents Zoom closing itself because the patched app uses a different APK signing certificate. It allows the car screen to reopen when a host has no car-manufacturer or model information.

Host access is unrestricted when this patch is selected. Install a patched copy only if this is the behavior you want. The patch does not add video meeting surfaces to the car screen.

[Installation](../guides/install.md) · [Choose patches](../guides/choose-patches.md) · [Compatibility and defaults](../reference/catalogue.md)
