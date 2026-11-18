# Magic Earth

Use Magic Earth's own navigation interface with compatible Android Auto hosts, including DriveDeck and other custom HUD backends.

**App version:** 7.1.26.38.B4684D03.6207A61BA · **Build:** 2026141716 · **Original file:** APKM

[Use your original APKM](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

The feature and GEM controls support ARM64 only. Use the original ARM64 APK set with its base, language and display splits; an ARMv7 native library is not supported by those controls.

## Patches

| Patch | Default | What it does |
| --- | --- | --- |
| **Allow custom Android Auto hosts** | On | Lets compatible custom HUD hosts connect to Magic Earth's navigation service, without restricting access to Google's host. |
| **Enable TV launcher** | On | Lists the existing app activity in TV launchers and makes touch input optional. |
| **Enable local feature controls** | Off | Opens local traffic, recording, offline-map and elevation controls, enables native car navigation eligibility, and hides selected premium promotions. |
| **Disable Google telemetry transport** | Off | Drops Google telemetry events and prevents queued Google uploads. |
| **Disable GEM telemetry dispatch** | Off | Stops the traced GEM usage and crash-report jobs from being queued. Local statistics storage may remain. |

## Advertising and tracking services

The optional privacy controls target Google's telemetry transport and GEM usage/crash-report dispatch. They preserve map and traffic connectivity and do not claim to remove every possible tracking path.

## Before using

Enable **Enable local feature controls** for the feature and native car controls. Select the two privacy patches if you want their additional suppression. Online traffic and map downloads still need working services and connectivity.

Open Magic Earth on the phone and finish its normal setup and permission prompts before selecting it in a host. The host must support its navigation templates and surface protocol. The TV launcher patch provides discovery; it does not create a new remote-control interface.

[Installation](../guides/install.md) · [Choose patches](../guides/choose-patches.md) · [Compatibility and defaults](../reference/catalogue.md)
