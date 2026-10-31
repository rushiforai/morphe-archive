# Omroep West

**Supported app:** 20.1 · **Build:** 10596 · **Input:** APKS

`nl.omroepwest.android`

[Use your own APKS](../guides/downloads.md#local-original-inputs){ .md-button }

Select this file in Morphe Manager to apply the patches.

The patches remove the inspected ads and newsletter signup block from pages and video, stop identified app and SDK measurements, and keep startup limited to region selection. Use the complete original split archive exported from version 20.1 on your phone.

## What did we find in the app?

| Activity / service | What our evidence shows | What changes |
| --- | --- | --- |
| Page ads and promotional recommendations | Pinch supplies native ad placements, including nested and horizontal layouts. Outbrain can create recommendation widgets and initialise its advertising adapters. | Hide ads omits the identified ad and inline newsletter models, their headings and owned spacing, completes Pinch loads through the native failure callback, and prevents cached Outbrain widgets from starting. |
| Video ads | Blue Billywig has separate scheduling, renderer, outstream and late-option paths. The vertical-video pager can insert synthetic ad assets and translate indices around them. | Hide ads suppresses the inspected ad inputs and controller creation and selects the consistent native no-ad pager routes. Content identity and playback lifecycle code remain. |
| Reading and media measurements | [Piano](../trackers/additional-services.md#piano) receives article, click, search, settings and audiovisual context. An NMO/Piano identifier can be stored and forwarded separately. | Disable tracking stops the inspected event and sender paths, optional identifier generation and forwarding. It retains native queue cleanup and functional app services. |
| SDK diagnostics and identifiers | [Firebase](../trackers/firebase.md), Google measurement and advertising SDKs include usage, crash, session, notification and optional identifier paths. Blue Billywig statistics are separate from content delivery. | The patch suppresses the audited collectors, statistics and optional identifiers, and filters four identified queued measurement transport types while keeping real completion and unknown transport types. |

## What remains and what is still unknown

News, configuration, accounts, radio, video, casting, Android Auto, widgets and push services keep their functional code paths. These requests can still carry information needed by the service. The patches do not create a subscription or unlock content withheld by a backend.

Remote web scripts, overlays, server-side inserted ads and every possible third-party measurement are not proven removed. Smartocto is named in the app's cookie explanation, but an independent native sender was not established from that copy alone. Existing stored identifiers are not claimed deleted. Device playback, rendering, notification delivery and residual traffic need user testing of this release.

## Available controls

Disable tracking, Hide ads, Skip consent screens.

All three controls are on by default. Disable tracking includes Hide ads. Skip consent screens includes both and removes automatic cookie presentation and notification permission requests, plus the cookie entry in both settings layouts. Startup asks only for your region and saves that choice. The welcome, language, notification-preference and consent pages are omitted; startup completes directly if no regions are available. Notifications stay off by default, while existing choices and manual notification settings remain. Consent for embedded content you choose to open remains available. The patch does not record acceptance or rejection or grant notification permission.

[Read what each patch changes](../reference/catalogue.md). See [installation](../guides/install.md) for original files and signing, and [choosing patches](../guides/choose-patches.md) for which patches depend on others.

## Evidence

The [stable releases](https://github.com/johnneerdael/dutch-applications-patches/releases) publish these three controls.

The [implementation audit](https://github.com/johnneerdael/dutch-applications-patches/blob/a5b15fadadd8f990813f6efb59bd11194026fb9c/docs/omroep-west-audit.md) describes the supported input, original code contracts, emitted verification and remaining runtime limits. The [original APK assessment](https://github.com/johnneerdael/dutch-applications-patches/blob/b7b339af36ba403dc438520c2551cc218f484b98/docs/research/2026-10-31-omroep-west.md) records the comparison with Omroep Brabant. Automated native instruction fixtures do not establish Android or network behaviour. [How to read the evidence](../reference/methodology.md).
