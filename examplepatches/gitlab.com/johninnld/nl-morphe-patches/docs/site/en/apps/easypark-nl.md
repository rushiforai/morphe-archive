# EasyPark NL

**App version:** 26.42.4 · **Build:** 82642040 · **Original file:** APKS

[Use your original split archive](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

This patch is intended solely for using EasyPark on third-party Android Auto systems such as DriveDeck. If you do not use such a system, you do not need this patch.

This is the Netherlands app, package `com.parkmobile`. It is a separate target from the international `net.easypark.android` app. Select the complete original archive in Morphe Manager, including its architecture, language and display splits.

## Patches

| Patch | Default | What it does |
| --- | --- | --- |
| **Add microG-RE support** | On | Enables Google sign-in through installed MicroG-RE. Required for login in the patched NL app. |
| **Allow custom Android Auto hosts** | On | Allows EasyPark NL's native parking interface on any compatible host by default, including DriveDeck. Optionally limits access to specified host app packages. |

## Advertising and tracking services

This patch changes car-host access. The app's existing analytics, advertising, accounts, location, payment and online services remain active.

## Before using

Leave **Allowed host packages** empty for unrestricted access. To allow only DriveDeck, enter `app.johninnl.drivedeck`. Add other package names separated by commas when needed. Every unlisted host is denied; include `com.google.android.projection.gearhead` if Google's Android Auto should remain allowed. Repatch the original archive to change this choice.

Unrestricted mode adds permission to look up installed packages so arbitrary hosts can be identified. Restricted mode adds visibility for the listed packages. Each host must own its claimed package, regardless of its signing key.

The host must support Android Auto's parking templates and the app's car API level. Sign in to the patched app on the phone before expecting account-dependent parking functions in DriveDeck. This patch does not activate an account or bypass backend verification or payment requirements.

**Login requires MicroG-RE.** Install a compatible `app.revanced.android.gms` provider and sign in with Google. The tested provider was MicroG-RE 7.3.0. Phone-number and email login do not work in the patched app. Accounts requiring a separate email or phone verification may therefore remain blocked.

The signed-in NL app opened its native parking screen in DriveDeck on a physical phone. Parking and payment transactions were not tested.

[Installation](../guides/install.md) · [Choose patches](../guides/choose-patches.md) · [Compatibility and defaults](../reference/catalogue.md)
