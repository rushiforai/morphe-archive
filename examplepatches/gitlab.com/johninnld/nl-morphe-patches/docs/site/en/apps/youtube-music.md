# YouTube Music

**App version:** 9.30.53 · **Build:** 93053240 · **Original file:** APK

[Use your original APK](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Select the original YouTube Music APK. Morphe may rename the installed result to **YT Music Morphe**; that result is not a separate app in this patch source.

Compatibility is **Any** when the browser and Morphe library structures are recognized uniquely. The complete combined workflow is tested with 9.30.53 and Morphe Patches 2.0.0. Changed structures or missing required hooks stop patching. Morphe's own Android Auto patch must also support the app version selected.

[Set up music players and personal libraries in Gearslip](../guides/gearslip-music.md){ .md-button }

## Patches

| Patch | Default | What it does |
| --- | --- | --- |
| **Gearslip music browser support** | On | Lets Gearslip browse personal Home and Library using the app's existing account, while verifying the actual Android caller. |

## Advertising and tracking services

This compatibility patch does not remove advertising, tracking, account requirements or subscriptions. YouTube Music's existing online services remain active.

## Before using

Select the original app and enable **Android Auto** from Morphe Patches together with **Gearslip music browser support** from Dutch App Patches. The Gearslip patch includes the personal-library integration; there is no second library patch to select. Use the original input when repatching an existing installation.

Apply **Keep music player entries** to Gearslip so the player tile is retained. **Trusted Gearslip and DriveDeck packages** defaults to the Gearslip and DriveDeck packages, including their `.dev` builds; add another package only for a build you intentionally use.

Automated tests cover host admission, real root and library-folder construction, and the combined original-app patching workflow. Catalogue contents and playback depend on the signed-in account and available content.

Use the same signing key as the installed copy for an in-place update. Preserve the account-bearing installation while testing.

[Installation](../guides/install.md) · [Choose patches](../guides/choose-patches.md)
