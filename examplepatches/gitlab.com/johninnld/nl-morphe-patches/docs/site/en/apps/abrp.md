# ABRP

Unlock ABRP's Premium features without a subscription, and let the app run on any Android Auto host instead of only the ones it already trusts.

**App version:** 8.0.0 · **Build:** 6087 · **Original file:** APKS

[Use your original APKS](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Select the complete split APKS bundle for this exact version in Morphe Manager.

## Patches

| Patch | Default | What it does |
| --- | --- | --- |
| **Allow custom Android Auto hosts** | On | Accepts any car app host during the Android Auto handshake, so the app also starts on third-party head units and projection bridges. |
| **Unlock Premium** | On | Treats the app as the car build that ABRP ships without a purchase flow, which unlocks the Premium switches in the app. Includes the GPS and Android Auto location fix. |

## GPS fix

The GPS issue with Premium enabled is fixed. ABRP now requests the phone's location permission and uses its GPS for the map and Android Auto. The vehicle telemetry permission screen no longer blocks the car map. Downloaded JavaScript updates cannot replace the patched location code.

Repatch ABRP with the latest bundle to receive this fix. Allow precise location when Android asks. Keep **Allow custom Android Auto hosts** selected when using DriveDeck or another custom host.

## Premium

ABRP decides Premium in two ways: the account roles the server returns, or, for the car build, a pair of values that are fixed when that build is compiled. The phone build is compiled without them, so on a phone, in Android Auto and on a sideloaded copy Premium only came from the account.

The patch supplies those two values to the part of the app that reads them. From then on the app takes the same path as the car build: Premium features are on, and the purchase screens are not reached.

Two things it does not do. It does not change your account, so the account page and the ABRP website still show the subscription you actually have. And it cannot grant anything ABRP's server authorizes per account: live vehicle data, traffic and weather are requested with the values the app now sends, but whether the server serves them to an account without a subscription is decided there, not here.

## Android Auto hosts

ABRP uses the car app library for its in-car screen. When a host connects, the app checks the caller against the certificates the library knows and refuses anything else with "Unknown host" before a session exists. A head unit or projection bridge that is not on that list therefore could not start ABRP at all.

The patch replaces only that verdict. The caller's package and user ID are still resolved, and the templates, navigation and playback code are unchanged. The host still has to implement the car app protocol ABRP expects.

ABRP's account, routing and charging services are unchanged.

## Before using

An APKS is a split bundle: select the complete archive so the architecture and language splits are included. A patched APK is signed with a new certificate, so the Play Store installation cannot be updated in place, and Google sign-in can fail because the original certificate is no longer present. Sign in with the ABRP account instead.

[Installation](../guides/install.md) · [Choose patches](../guides/choose-patches.md) · [Compatibility and defaults](../reference/catalogue.md)
