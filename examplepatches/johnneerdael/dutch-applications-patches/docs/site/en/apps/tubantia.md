# Tubantia

**Supported app:** 9.23.2 · **Build:** 9230200 · **Input:** APKS

`com.mecom.tctubantia.nl`

[Download the original APKS](https://buzzheavier.com/ja9uyq2fejyp){ .md-button .md-button--primary }

Select this file in Morphe Manager to apply the patches.

Tubantia uses the Kubus app family also used by AD. All five controls have been adapted to this newer build, including its changed login routing and tracking initializer. All five controls are available in the stable patch bundle.

## What did we find in the app?

| Activity / service | What our evidence shows | What changes |
| --- | --- | --- |
| Advertising and commercial article rows | The inspected constructors carry explicit ad, advertorial and preroll flags. | Hide ads filters identified commercial components while preserving editorial object order and uses the existing game error continuation. |
| Measurement and identifiers | The code contains publisher events, Comscore, Firebase, Cxense, automatic Usabilla events and video telemetry. FIAM startup moved into an initializer. | Disable tracking stops the mapped collectors and identifier acquisition and guards all three optional FIAM consumers. |
| Consent, onboarding and article delivery | This build has a changed automatic-auth router and a reduced-content parameter on its article API. | Skip consent screens defaults to guest reading and manual notification opt-in. Read full articles sends reduced=false and completes marketing resolvers with their supported empty results. |

## What remains and what is still unknown

The article control requests complete components; availability still depends on what the service returns. No Tubantia premium-body response has been captured. Account rights, purchases, city selection and manual push choices remain. Audio session synchronization and remote editorial embeds retain the same research limits as AD. Runtime startup, playback and actual network traffic have not been tested for Tubantia.

## Available controls

Disable tracking, Hide Premium banner, Hide ads, Read full articles, Skip consent screens.

All controls are enabled by default. Disable tracking includes Hide ads; Skip consent screens includes both.

[Read what each patch changes](../reference/catalogue.md). See [installation](../guides/install.md) for original files and signing, and [choosing patches](../guides/choose-patches.md) for which patches depend on others.

## Evidence

Compared on 30 October 2026 against the supplied original split set: [technical comparison](https://github.com/johnneerdael/dutch-applications-patches/blob/main/docs/research/2026-10-30-tubantia.md). Original and emitted-output checks cover the mapped instructions, preserved contracts and supported control selections. These are static and controlled instruction checks, without a new device test or network capture. [How to read the evidence](../reference/methodology.md).
