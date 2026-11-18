# EasyPark

This patch is intended solely for using EasyPark on third-party Android Auto systems such as DriveDeck. If you do not use such a system, you do not need this patch.

**App version:** 26.40.1 · **Build:** 82640010 · **Original file:** APKM

[Use your original APKM](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Select the complete original archive for this exact version in Morphe Manager, including its architecture and display splits.

## Patches

| Patch | Default | What it does |
| --- | --- | --- |
| **Allow custom Android Auto hosts** | On | Allows the native EasyPark parking interface on any compatible host by default. Optionally limits it to specified host app packages. |

## Advertising and tracking services

This patch changes car-host access. EasyPark's existing analytics, advertising, accounts, location, payment and online services remain active.

## Before using

Leave **Allowed host packages** empty for unrestricted host access. To restrict access, enter one or more Android app package names separated by commas, for example `app.johninnl.drivedeck,app.seb3thehacker.gearslip`. Every other host is denied. Include `com.google.android.projection.gearhead` if Google's Android Auto should also remain allowed. Repatch the original archive to change this choice.

Unrestricted mode adds permission to look up installed packages so arbitrary hosts can be identified. Restricted mode adds visibility for the listed packages. A host must own its claimed package; its signing key does not need to match EasyPark's original host list.

The host must support Android Auto's parking templates and EasyPark's required car API level. This patch cannot add those capabilities to a display. EasyPark's account and service requirements still apply. Login, payments, backend device verification and physical head-unit projection require separate acceptance; they are not established by building the patch.

Native car entry and the sign-in screen were checked with Android Auto 17.9 and Desktop Head Unit on an Android 14 emulator. A restricted list also rejected the same unlisted Android Auto host. Account login, parking transactions and physical HUDs were not exercised.

[Installation](../guides/install.md) · [Choose patches](../guides/choose-patches.md) · [Compatibility and defaults](../reference/catalogue.md)
