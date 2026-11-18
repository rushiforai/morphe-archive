# Tuya Smart Life

Use Tuya Smart Life's native car interface with DriveDeck or another compatible projection host.

**App version:** 7.12.6 · **Build:** 872 · **Original file:** APKS

[Use your original APKS](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Select the complete original archive in Morphe Manager, including the base, architecture and display APKs. This target is the ARM64 build.

## Patches

| Patch | Default | What it does |
| --- | --- | --- |
| **Allow any Android Auto host** | On | Opens Tuya Smart Life's native car interface to every compatible projection host, without a host package or certificate check. |

## Advertising and tracking services

This patch changes access to the car interface. Tuya Smart Life's existing account, home, device and automation services remain active.

## Before using

Sign in to your Tuya Smart Life home on the phone first. The car screens reuse that account and home selection. The host must support the car templates the app uses; Google's Android Auto keeps working.

Host access is unrestricted when this patch is selected: every Android Auto compatible host, including DriveDeck, Gearslip, MyCar, Flywheel, BetterAuto, AndroidAuto and AARE, may connect, whatever its package name or signing key. Install a patched copy only if this is the behavior you want.

[Installation](../guides/install.md) · [Choose patches](../guides/choose-patches.md) · [Compatibility and defaults](../reference/catalogue.md)
