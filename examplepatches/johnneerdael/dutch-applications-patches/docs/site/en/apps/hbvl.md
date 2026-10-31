# HBVL

**Supported app:** 22.0.0 · **Build:** 2012316104 · **Input:** APKS

`be.concentra.hbvl.MediaApp`

[Download the original APKS](https://buzzheavier.com/7lz3azzelidy){ .md-button .md-button--primary }

Select this file in Morphe Manager to apply the patches.

HBVL uses the same Mediahuis app and embedded newspaper reader as the inspected Nieuwsblad build. Its four controls are available in the stable patch bundle.

## What did we find in the app?

| Activity / service | What our evidence shows | What changes |
| --- | --- | --- |
| Advertising and promotions | Kaching requests and sponsored groups match the inspected Nieuwsblad methods. The Shop filter also recognises the exact HBVL hostname. | Hide ads uses the existing disabled-ad result and removes identified promotional groups. |
| Tracking and the newspaper reader | The native collectors and complete embedded reader bundle match Nieuwsblad. | Disable tracking stops the mapped native collectors and reader logging/Engage Readers paths while retaining delivery, push and login. |
| Consent and Premium UI | Onboarding completion and remote-config subscription predicates match Nieuwsblad. | The controls skip automatic prompts and hide promotional surfaces. |

## What remains and what is still unknown

Article and newspaper access still depend on genuine publisher authorization. The controls preserve billing, account, push and content-delivery paths. Runtime startup, playback and actual network traffic have not been tested for HBVL.

## Available controls

Disable tracking, Hide Premium banner, Hide ads, Skip consent screens.

All controls are enabled by default. Disable tracking includes Hide ads; Skip consent screens includes both.

[Read what each patch changes](../reference/catalogue.md). See [installation](../guides/install.md) for original files and signing, and [choosing patches](../guides/choose-patches.md) for which patches depend on others.

## Evidence

Compared on 30 October 2026 against the supplied original split set: [technical comparison](https://github.com/johnneerdael/dutch-applications-patches/blob/main/docs/research/2026-10-30-hbvl.md). Original and emitted-output checks cover the mapped instructions, preserved contracts and supported control selections. These are static and controlled instruction checks, without a new device test or network capture. [How to read the evidence](../reference/methodology.md).
