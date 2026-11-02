# 2dehands

**Privacy controls:** advertising, optional tracking and consent-form controls for this exact original. Account, incoming push and checkout acceptance follows stable publication.

**App version:** 16.19.0 · **Build:** 633464 · **Original file:** XAPK

[Download original app](https://buzzheavier.com/p3t8spl0cswx){ .md-button .md-button--primary }

## Supported original files

Use the complete supplied `2dehands-be-16-19-0.xapk`, package `be.tweedehands.m`.
It contains the base, Notifications feature, ARM64/ARMv7 and density splits.
The inspected variant requires Android 12L or later. Other builds are rejected.

## Patches

| Patch | Default | What it does |
| --- | --- | --- |
| **Hide ads** | On | Removes native/display advertising, Admarkt listings, marked paid placements and promotional search cards. Ordinary classifieds and legal notices remain. |
| **Disable tracking** | On | Includes ad and ThreatMetrix blocking; stops the supported optional SDK, publisher-view, call-tracking and consent page-view paths. |
| **Disable ThreatMetrix** | On | Stops device/security profiling and its session headers. |
| **Skip consent screens** | On | Includes tracking removal; rejects through the genuine SDK before rendering startup forms and closes manual privacy screens. |

## Advertising and tracking services

Controls cover the inspected Horizon integrations with Adjust/Criteo, Meta,
Braze, Datadog, Firebase measurement, UserZoom, Gemius/CIM, optional Adyen
events and Sourcepoint page-view reporting. Functional consent configuration
and genuine rejection requests remain. Libraries remain packaged.

Marketplace APIs, images, authentication, payments and functional messaging
still communicate with their providers. The controls do not make those services
anonymous or erase existing server-side history.

## Before using

Select the entire XAPK so Notifications remains bundled. Four controls default
on. Blocking ThreatMetrix can affect protected account/payment operations.
Braze marketing messages are disabled. Firebase registration compatibility is
scoped to the original publisher fingerprint; no account or payment result is
fabricated.

Anonymous browsing is being checked on Android 16. Account, incoming push and checkout acceptance must be
reported separately from anonymous browsing.

[Installation](../guides/install.md) · [Choose patches](../guides/choose-patches.md) · [Compatibility and defaults](../reference/catalogue.md)
