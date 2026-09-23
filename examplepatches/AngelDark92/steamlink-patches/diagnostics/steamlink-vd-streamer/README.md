# Installed Virtual Desktop Streamer: PCVR 10-bit audit

Read-only investigation, **2026-09-22**. The comparison is inside a PCVR game.
Installed Windows Streamer: **1.34.22.0**. Supplied decoded Android client:
**1.34.18.0 / 10683**. These are different versions; this is not a captured,
version-matched end-to-end session. Exact installed inputs are pinned in
[installed-inputs.json](installed-inputs.json).

The user's follow-up clarifies the required result: **prepare a good 8-bit image
inside the app before submission**, because the runtime's 10-to-8 result visibly
bands. [APP-OUTPUT-BOUNDARY.md](APP-OUTPUT-BOUNDARY.md) distinguishes this feasible
client goal from copying host processing. The existing VD-like options select
8-bit storage but do not yet establish controlled, banding-free quantization.

## Result and implementation decision

The traced VD pipeline does **not expose a special lossless 10-bit-to-8-bit
dithering function** that can be copied into the 2 Steam Link foveal options.
It does expose host processing and 10-bit encoder configuration. Those operate
before the compressed stream reaches either APK option.

No additional production change is justified by this investigation. The existing
`foveaVdLike10Bit` and `foveaVdLike8Bit` options retain the previously implemented
[VD-informed SDR foveal behavior](../steamlink-vd-hevc10/README.md): highp sampling,
Valve's decoder correction, clamp/fade, 8-bit sRGB output, and no added
gamma/saturation/arithmetic noise in the foveal RGB result. Their base-layer
behavior remains unchanged. They are **not an exact VD pipeline or a demonstrated
banding fix**. The separate blue-noise patch is unchanged.

## What the installed Streamer actually requests

| Stage | Observed code | Consequence |
|---|---|---|
| Codec preference | HEVC 10-bit = enum 6; AV1 10-bit = enum 11; capabilities can cause fallback | The selected preference does not prove the active encoded stream's depth |
| PCVR effects | Fovea, Foveation and Sharpening end with `pow(saturate(rgb), Gamma)` | A host transfer adjustment happens before encoding |
| Gamma value | Normal path: `Gamma = 0.9 / userGamma`; userGamma defaults to 1.0 | This adjustment is shared across codec depths, not a HEVC10/AV110-only debander |
| NVIDIA encoder input | Creates `B8G8R8A8_UNORM` textures (DXGI 87), 4 bytes/pixel; registers `NV_ENC_BUFFER_FORMAT_ARGB` | The traced application-owned input textures have 8-bit RGB components |
| HEVC10 configuration | `pixelBitDepthMinus8 = 2` | Requests 10-bit coded output |
| AV110 configuration | `pixelBitDepthMinus8 = 2`, `inputPixelBitDepthMinus8 = 2` | Requests 10-bit output and declares 10-bit input despite the separately observed ARGB8 registration; these are distinct facts |
| NVIDIA color metadata | Primaries, transfer and matrix identifiers = 1; full-range choice is outside the codec-depth branch | SDR BT.709 signaling, not an HDR/PQ output mode |
| Android client | Range-aware YUV-to-RGB, optional sharpening, 8-bit sRGB target; no explicit depth-specific shader noise in the traced video programs | Final 8-bit output does not establish where any earlier precision was lost |

The installed GPU list contains an **RTX 5090** and Intel UHD 770. The NVIDIA
factory route is therefore relevant, but no active adapter/encoder session was
captured. Only the VD service was running during process inspection. The saved
preference was HEVC10 while the cached active codec name was H.264+; the code writes
those from different sources. Neither is proof of a current HEVC10 session.

NVIDIA's current [high-bit-depth encoding documentation](https://docs.nvidia.com/video-technologies/video-codec-sdk/13.0/nvenc-video-encoder-api-prog-guide/#high-bit-depth-encoding)
explicitly supports internal 8-to-10-bit conversion for HEVC and AV1; an 8-bit
resource is therefore not proof of an 8-bit encoded stream. VD uses older API
fields, and its AV1 input-depth declaration differs from the registered texture
depth. We preserve those observed arguments rather than claiming to know how the
installed driver resolves them. See the exact mappings and limits in
[ENCODER-PATH.md](ENCODER-PATH.md).

The AMD path is different: a vendor converter consumes BGRA8 and requests
R10G10B10A2 output for the 10-bit codecs. Its converter transfer properties include
PQ, while encoder output metadata remains BT.709; an RX 90-series workaround
changes another input-transfer property. These are SDK requests, not a recovered
transfer algorithm, and must not be transplanted into the NVIDIA or APK path.

## Why 10-bit streaming can help an 8-bit final image

An 8-bit RGB framebuffer and an 8-bit YUV video stream do not represent the same
color grid. RGB-to-YUV conversion, chroma subsampling, compression and reconstruction
can add errors before final RGB output. More precision in that middle part can
reduce the errors even when both endpoints use 8-bit RGB. This explains how a
10-bit video option can help without requiring a lossless 10-to-8 conversion.
It does **not** establish which stage causes the user's observed VD/Steam Link
difference; that remains unmeasured.

A single 8-bit component cannot represent all 1,024 distinct 10-bit codes at once.
Spatial or temporal dithering can represent intermediate averages, but no such
explicit algorithm was found in the traced VD video shaders. Hardware encoder,
decoder/import, graphics-driver and compositor internals are not recovered here.
OpenGL ES enables dithering by default; actual draw-time state remains unmeasured.
That default does not identify a noise pattern or prove a difference between clients.

## Why these 2 APK options cannot reproduce the host pipeline

1. **They run after decode.** Applying VD's gamma exponent after decoding is not
   equivalent to applying it before RGB-to-YUV conversion and compression. It can
   change brightness; it cannot reproduce the earlier rounding decisions or
   recover information already discarded by the encoder/import.
2. **They cannot configure the PC encoder.** NVENC/AMF surface formats, coded bit
   depth and preprocessing belong to the host. Declaring 10-bit input in the OLED
   option does not negotiate a 10-bit Steam Link stream.
3. **Their inputs differ.** VD's Android shader interprets sampled components as
   YUV and performs conversion; actual sample values remain unmeasured. Steam
   Link's external sampler supplies converted RGB.
   Copying VD's YUV matrix onto that RGB would be incorrect. No app-owned 8-bit
   intermediate before the Steam Link shader was identified, but effective import
   precision remains unmeasured.
4. **The final boundary is partly outside the app.** No identified app shader
   exposes the proprietary driver's/compositor's quantization behavior. A new
   quantizer would be a new experiment, not an implementation of observed VD code.

This is a boundary of the **2 existing client shader options**, not a claim that
Steam Link as a whole is fundamentally incapable of comparable quality. An exact
host match would require work on its PC capture/conversion/encoder path; changing
decoder import would require a separate renderer change with new precision evidence.
Both go beyond merely substituting the foveal shader expression.

The statement that Galaxy XR categorically rejects 10-bit OpenXR images is also
stronger than the retained evidence: a saved earlier Steam Link run reports
successful RGB10_A2 projection submissions, while downstream SurfaceFlinger/DPU
buffers were 8-bit. Submission success does not prove physical panel precision or
current runtime support. The requested output for these options stays 8-bit.
See [STEAMLINK-PORTABILITY.md](STEAMLINK-PORTABILITY.md) for the exact saved log sites.

## Evidence and validation

- [STREAMER-CODEC-ROUTING.md](STREAMER-CODEC-ROUTING.md): managed codec routing,
  fallback, host gamma and effect bindings.
- [SHADER-PATH.md](SHADER-PATH.md): disassembled installed effects and gamma math.
- [ENCODER-PATH.md](ENCODER-PATH.md): NVIDIA and AMD encoder requests with native/IL
  locations and primary SDK references.
- [STEAMLINK-PORTABILITY.md](STEAMLINK-PORTABILITY.md): exact 3-base client path,
  unchanged foveal options and runtime evidence boundaries.
- [preservation-validation.json](preservation-validation.json): all 50 protected
  blue-noise files and all 7 inspected installed binaries/effects remain identical.

No installed file, live setting, APK, device or SteamVR process was changed. No new
production source was edited, so the previous patch validation is not represented
as a new build or new headset test. The user-observed banding comparison is not a
controlled trace of the installed host and supplied Android build together.

Reproduce from the repository root with the retained Python dnfile/dncil tooling:

```powershell
python -B diagnostics/steamlink-vd-streamer/managed-evidence.py --write
python -B diagnostics/steamlink-vd-streamer/disassemble_shaders.py
```

These read the installed program without executing its managed code or shaders.
The managed extractor refuses a different executable hash. The shader inventory
records each source offset, size and bytecode hash. Its 76 textual disassemblies
under `build/vd-streamer-shaders` total 260,760 bytes and are retained as compact
audit evidence; no APK, DLL or decoded application copy was created for this audit.
Earlier deferred validation-output cleanup is unchanged and is recorded in
[WORKSPACE_CLEANUP.md](../../WORKSPACE_CLEANUP.md).
