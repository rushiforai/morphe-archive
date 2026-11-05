# Atlas surface and swapchain enlarge evidence (2026-10-27)

Two default-off experimental patches test whether the Galaxy XR compositor's output
sharpness is driven by the projection swapchain extent:

- **Swapchain enlarge (experimental)** — grows Valve's sRGB8 projection swapchains
  by 1.5x, capped at 8192, without adding a layer.
- **Atlas surface (experimental)** — copies each projection view's source sub-rect
  into a runtime Android Surface at the runtime's max per-eye extent, without adding
  a layer.

Both target exact Steam Link **2.0.20/5001712** and **2.0.24/5002395**.

## Why

The retired Surface video + trigger patch copied Valve's images 1:1 at Valve's source
extent and could not raise detail. The remaining question is whether the runtime
sizes its output from the projection swapchain rather than the view. Chronolink's
own probe reports:

> "Sharp with no overlay present = the compositor sizes from the swapchain; soft =
> from the view"

`Swapchain enlarge` is the cheapest test of that rule. `Atlas surface` is the
runtime-Surface version at the max per-eye extent.

## Static evidence for the enlarge preflight

`SRGBCorrectionPass::SetOutputTextureDimensions` is at `0xf17dc` in the exact
5001712 scene and stores the stream width/height at `this+0x150` / `this+0x154`.
`SRGBCorrectionPass::RenderSpecific` at `0xf1af4` calls `glViewport` with those
two fields, not with the swapchain image size. The app therefore keeps rendering at
its original viewport into the enlarged swapchain image, and `XRQCreateProjectionViewLayer`
keeps the original `imageRect`. The layer clears the unused area once. This is what
makes the enlarge preflight a valid extent test rather than a crop test.

## Evidence classes

| Class | Status |
|---|---|
| Source/static inspection | Complete for the two layer sources and the extent math |
| Host tests | PASS: target extent, aspect preservation, no downscale, image ownership, rect/UV mapping, 2-/3-projection frame validation |
| Compilation/packaging | PASS: NDK 27.2.12479018, stripped helpers staged with SHA-256 pins |
| Headset/runtime | **Pending.** No frame has been presented through either layer yet. |

## Runtime checks

```powershell
adb logcat -c
adb logcat -s GXRSwapchainEnlarge
adb logcat -s GXRAtlasSurface
```

Expected:

- Swapchain enlarge: `swapchain_enlarged`, then `enlarged_frame` for the first three
  frames. `enlarge_rejected` means the runtime refused the larger extent and the
  layer retried the original.
- Atlas surface: `session_ready`, `target_surface`, `surface_frame` for the first
  three accepted frames. `create_surface_failed`, `egl_window_failed`,
  `transfer_failed_passthrough` or `surface_frame_rejected` means the layer stood
  down; later frames should pass through.

## A/B

Use the same base, host quality, scene and refresh:

| Run | Selection | Question |
|---|---|---|
| Control | Alpha-0 | Known-good sharpness |
| Extent probe | Swapchain enlarge | Does a larger swapchain change sharpness? |
| Surface probe | Atlas surface | Does max-extent Surface presentation change sharpness? |

If the extent probe does not change sharpness, the compositor is not sizing from the
swapchain and the Surface probe is unlikely to help. The next step would be a
decoder-output redirect, not another composition-layer variant.

## Boundary

These are presentation experiments. Neither adds stream detail. A real detail
increase requires a higher host stream resolution or a decoder-output redirect. No
headset result is claimed here.
# Retirement notice — 2026-11-03

Swapchain enlarge and Atlas surface were removed at the owner's request. Neither
is required by Stock quad composition or Alpha-0. Their patches, native source,
payloads and tests are removed; this document is historical, not an active setup
guide. No new runtime success or failure is inferred from this removal.
