# Android XR downstream colour-depth check — 2026-09-06

**Strong evidence of an 8-bit display-composition buffer downstream of RGB10 OpenXR input.**

Read-only ADB inspection while Steam Link was the visible immersive XR client. No display settings, patches, permissions, or composition modes were changed. No screenshots or recordings were taken. Full local service dumps may contain unrelated application/state information; use this assessment for sharing.

| Stage | Observed evidence | What it establishes |
|---|---|---|
| Decoder | Qualcomm `Output Format at frame 0: YCBCR_420_P010 1536x6144`; Steam Link `CCodecBuffers` output-format change reports format 54 | Actual output-format reporting, stronger than the previous setup-only evidence. Not a readback of meaningful low bits. |
| OpenXR input | Projection trace reports RGB10_A2; successful submission samples | Runtime accepts 10-bit RGB storage for the sampled application views. |
| Android XR scene | CPM lists Steam Link client 5, 90 Hz; 4 visible 1536x1536 stereo-projection views, `V0_SRGB_LINEAR` | The runtime scene contains the expected Steam Link views and linear input dataspace. |
| Hardware composer | Display 0: Device/Device composition, `RGBA_8888_UBWC`, SDR | An active vendor display layer uses 8-bit RGB storage. |
| Both display processors | DPU-0 and DPU-1 tables show 7104x3840 `RGBA_8888_UBWC`, split across the eye-sized regions | Strong downstream 8-bit buffer evidence for the combined physical display path. Confirmed by a second live dump. |
| Panel/link | DSI connector status/modes denied to shell; DRM debug state unavailable | Native panel depth, transmitted link depth, panel dithering and optical output remain unmeasured. |

## Interpretation

The RGB10 patch is still doing its job at the application's projection target. The later hardware-composer/display-processor buffer is 8-bit per RGB channel in this capture. This does not support a claim of an uninterrupted 10-bit-per-channel buffer path to the panels.

This conclusion is based on the vendor HWC and both DPU tables, not SurfaceFlinger's ordinary 1x1 placeholder framebuffer. Ordinary SurfaceFlinger composition reports no layers; the separate XR scene and full-size hardware output are the relevant evidence. Exact correlation of the runtime's output allocation to the HWC buffer handle would strengthen attribution further.

`RGBA_8888_UBWC` and `RGBA_1010102_UBWC` are distinct Qualcomm formats. UBWC does not turn the 8888 format into a 10-bit format. See [Qualcomm display format mapping and Is10BitFormat](https://android.googlesource.com/platform/hardware/qcom/display/+/android-8.1.0_r18/sdm845/sdm/libs/utils/formats.cpp).

CPM exposes `local_tone_mapping=1`, but that configuration flag does not prove which tone-mapping operations were applied to these frames, nor that tone mapping caused the bit-depth reduction. Tone mapping and bit-depth quantization are separate. AOSP explicitly documents possible 10-bit-input/8-bit-composition paths and related banding in [tone mapping guidance](https://source.android.com/docs/core/display/tone-mapping).

The DPU can perform further processing after fetching this 8-bit buffer. These logs cannot establish the panel wire format, internal arithmetic precision, spatial/temporal dithering or native physical panel response. Higher precision upstream may still improve intermediate processing and final quantization; this capture does not measure the visual benefit.

## Evidence locations

- `surfaceflinger-local.txt`: line 2063 HWC layer; lines 2101–2104 DPU-0; lines 2115–2118 DPU-1; lines 1783–1806 ordinary composition state.
- `cpm-local.txt`: lines 25, 27, 29, 31 visible stereo views; line 48 Steam Link client; line 247 runtime settings.
- `decoder-evidence.txt`: selected decoder output-format messages.
- `projection-evidence.txt`: sampled projection and submission records.

Further proof would require the runtime output buffer format/readback correlated to the hardware-composer handle, active display-link configuration, and controlled optical tests for actual panel levels. No application-side patch can be claimed to change the runtime's private output format based on the current evidence alone.
