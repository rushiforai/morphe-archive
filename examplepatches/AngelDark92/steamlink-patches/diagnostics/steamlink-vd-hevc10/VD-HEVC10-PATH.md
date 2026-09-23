# Virtual Desktop PCVR SDR HEVC 10-bit: client evidence

Read-only investigation: **2026-09-22**. Scope: the user's banding comparison inside a PCVR game, using the supplied Android Virtual Desktop **1.34.18.0 / 10683**. Desktop HDR is outside this comparison. No device, SteamVR, encoder, application, or GL state was changed. This report does not modify the separate blue-noise implementation or its evidence.

## Result and implementation recommendation

The decoded client uses the same SDR video shaders for HEVC and HEVC 10-bit. Those shaders perform range-aware YUV conversion, optional sharpening, and foveal masking; they do **not** implement the previous OLED patch's arithmetic noise, gamma 1.2, or saturation 1.45. HEVC 10-bit is a distinct codec choice, independent of HDR. The traced final PCVR color attachments are 8-bit sRGB.

For the 2 existing OLED VD options, the supported correction is the same neutral SDR shader policy for either input depth: remove the patch-added gamma/saturation/noise in the actual foveal shader, preserve Steam Link's own decoder correction and fade/alpha behavior, and retain 8-bit output. A shader option cannot itself negotiate a 10-bit host stream or establish the decoder's actual output precision. The input labels describe the intended stream, not separate VD shader algorithms.

**Retain Valve's correction matrix.** Steam Link explicitly requests BT.2020/linear/full-range decoder metadata, whereas VD does not make those requests in the traced decoder setup. Steam Link's external sampler returns driver-converted RGB; VD's sampler values are treated as YUV by VD's shader. Copying VD's YUV conversion onto Steam Link's RGB would apply a second, inappropriate conversion. Conversely, bypassing Valve's matrix assumes an already-correct RGB basis that the available evidence does not establish. The numeric matrix comparison below supports preserving it, without claiming its original design intent is proven.

This implements a **VD-informed SDR policy**, not a claim of visually identical decoding or a guaranteed banding fix. Higher precision on the host/decoder path, encoder behavior, and driver quantization can explain smoother gradients without an explicit shader noise formula.

## Source identity and verification

- `VirtualDesktop/base/apktool.yml:10-11`: version code 10683, version name 1.34.18.0.
- `VirtualDesktop/split_config.arm64_v8a/lib/arm64-v8a/libassemblies.arm64-v8a.blob.so`: SHA-256 `2b879cfa184921586e5ee6e25c777f3c7c65ce45e51e1fbad3676ca3f5cb3505`.
- Fresh in-memory LZ4 extraction from that store matched the retained managed DLLs. Regenerated IL matched the retained 6 IL reports. All 46 retained GLSL files matched their exact DLL byte ranges. These checks validate the evidence source, not runtime shader compilation or execution.
- Evidence paths in the table below are under `build/vd-audit/`. Managed `RVA` values are assembly-relative method addresses; native addresses later in this report are ELF virtual addresses.

| Extracted assembly | Bytes | SHA-256 |
|---|---:|---|
| VirtualDesktop.Mobile.dll | 529408 | `80ba3b1a1f4dc4328ab835b7a0c5b9bb293cbb10562542226d272b07f9f377fc` |
| VirtualDesktop.Mobile.Shared.dll | 96256 | `b09cb18ee27b262b4e01b89ca727daedb3e1c5043a3854dc5e7b7d7fc0ebf83d` |
| Xenko.Graphics.dll | 626176 | `2cab7a326d45a328639cb7df380a212c9801e18d80876282e4b4b731feb0b3fa` |
| Xenko.OpenXR.dll | 161792 | `f7d992dacc10509c753376248613f75c5e0f38210e4b9aa6651f224f57636cc6` |
| Xenko.VR.dll | 106496 | `56685e112d1b89d7ce5f89c6147e13dec012fd3208eea0df14c8955ec1ae3f69` |

## PCVR path

| Stage | Exact local evidence | Established behavior |
|---|---|---|
| Codec selection | `codec-metadata.txt:2-18`; `VirtualDesktop.Mobile.il.txt:51582`, `GetMimeType` RVA `0x28ab8` | HEVC=2, HEVC10bit=6; both map to `video/hevc`. AV1=10 and AV110bit=11 similarly share MIME. `FrameMetadata.IsHDR` is a separate field. |
| Decoder setup | `VirtualDesktop.Mobile.il.txt:50025`, `VideoPlaybackLoop` RVA `0x27880`, especially 50059-50141 | Sets MIME, dimensions, low latency; selects/creates MediaCodec; configures its output to AImageReader's native window. No explicit bit-depth/profile/color-standard/color-transfer/color-range/color-format setter in this method. |
| Compressed input | `VirtualDesktop.Mobile.il.txt:50781`, `DecodeVideo` RVA `0x281b4` | Reads received compressed bytes into codec input and queues them. The encoded stream governing decoder profile/bit depth is an inference from this path and codec operation, not a captured stream measurement. |
| Output allocation | `VirtualDesktop.Mobile.Shared.il.txt:5576`, AImageReader constructor RVA `0x54c8`; caller at Mobile IL 50121-50125 | Requests image format 34 (`PRIVATE`), usage 0, maxImages 2. PRIVATE neither proves 8-bit nor guarantees P010. |
| GPU import | `VirtualDesktop.Mobile.Shared.il.txt:5664`, `AcquireLatestImage` RVA `0x55a4`, especially 5707-5746; `Xenko.Graphics.il.txt:43898`, RVA `0x1f52c` | Hardware buffer → native client buffer → EGLImage → `GL_TEXTURE_2D`. EGL target `EGL_NATIVE_BUFFER_ANDROID`, no context; attributes only `EGL_IMAGE_PRESERVED_KHR=TRUE, EGL_NONE`. No explicit per-image range/colorspace hints or CPU conversion to 8-bit in this path. |
| Decoder range | `VirtualDesktop.Mobile.Shared.il.txt:8298`, `OnFormatChanged` RVA `0x7490` | Reads `color-range`; sets IsFullRange when value=1. This callback does not inspect actual output bit depth or buffer layout. |
| Sampling and draw | `VirtualDesktop.Mobile.il.txt:46936`, `set_VideoFormat` RVA `0x25258`; 47013-47022, 47042-47051, 47554-47562; `DrawVR` at 49532, RVA `0x27230` | SpriteGamma uses PointClamp when StreamCount=4, otherwise LinearClamp; Fovea uses PointClamp. DrawVR supplies imported textures and each decoder's IsFullRange. Choice depends on stream topology, not codec bit depth. Sharpen is an optional effect. |
| HDR and gamma | `Xenko.Graphics.il.txt:1678-1688`; `VirtualDesktop.Mobile.il.txt:47383-47418`, 47569-47588; `VirtualDesktop.Mobile.Shared.il.txt:949-951` | IsHDR defaults false; the VideoPlayer IsHDR setter targets desktop-style effects, not SpriteGamma/Sharpen/Fovea. No enabling write to those 3 VR effects found. ShouldUseGammaBoost returns false, bypassing all 3 GammaBoost setters. Presence of a dormant PQ/HDR shader branch does not make PCVR HEVC10 HDR. |
| Write conversion | `VirtualDesktop.Mobile.il.txt:49719-49737`, with analogous right-eye/fovea calls | Disables `GL_FRAMEBUFFER_SRGB_EXT` before video drawing and restores it afterward. The extension permits storing the shader's encoded values without an additional linear-to-sRGB conversion. |
| App color output | `Xenko.VR.il.txt:6386`, `BeginDrawLeftEyeVR` RVA `0x64f0`; `Xenko.OpenXR.il.txt:11535`, `ToOpenGLESFormat` RVA `0xa2ac`; swapchain constructor at 11734 | Ordinary and extrapolated color swapchains use Xenko enum 29 → `GL_SRGB8_ALPHA8` (35907). Separate FP16 motion-vector images are not video color output. No HEVC10 branch selects a 10-bit final color format here. |

## Exact active shader processing

The 3 embedded PCVR shaders are:

| Effect | Path under `build/vd-audit/shaders/` | Bytes | SHA-256 |
|---|---|---:|---|
| SpriteGamma | `Xenko.Graphics.dll-55f2c.glsl` | 4270 | `6bbe533e034323cbca4588c3fb5301dc22b6aa7f525496bf17f6b725b3a27e17` |
| Sharpen | `Xenko.Graphics.dll-58da2.glsl` | 5226 | `5bd2344e8100382df38621eafda367a547b20721a3cc7e08764012cdbc686088` |
| Fovea | `Xenko.Graphics.dll-531db.glsl` | 5210 | `09d4c2a8bff02799bb7f6adc139c91f5807124bf4f5adc13ccf04488d1afaddd` |

SpriteGamma lines 47-70 convert sampled components as YUV. For full range, `Y = x`; for limited range, `Y = 1.164383561643836 * (x - 0.0625)`. Both use `U = y - 0.5`, `V = z - 0.5`:

| Range | R | G | B |
|---|---|---|---|
| Full | `Y + 1.5748022598870055*V` | `Y - .4681242876829077*V - .187324826121567*U` | `Y + 1.855631138801164*U` |
| Limited | `Y + 1.792741071428571*V` | `Y - .532909328559444*V - .21324861427373*U` | `Y + 2.112401785714286*U` |

The result is clamped to [0,1]. The same coefficients appear for both codec depths; no explicit 8-bit/10-bit shader normalization branch was found. Actual normalized values supplied by the opaque imported buffer remain a device question. SpriteGamma has `highp float`; Sharpen/Fovea use `mediump float`. Their `sampler2D` declarations do not explicitly request highp. These source declarations alone do not prove the implementation's effective decoded-sample precision.

Each shader has 1 video sampler, no noise texture, no temporal noise uniform, and no explicit arithmetic dithering/rounding sequence. Optional luma sharpening and the Fovea circular alpha computation remain distinct from dithering. The dormant `ToSDR` function applies PQ decoding and a BT.2020-primary-to-BT.709-primary matrix only behind IsHDR; it must not be copied into this SDR PCVR comparison.

## GL_DITHER: explicit noise absence is not disabled dithering

OpenGL ES 3.0 specifies that dithering starts **enabled**, and its algorithm is implementation-dependent. Therefore a shader with no noise can still be followed by driver dithering. See [OpenGL ES 3.0.6 specification, section 4.1.9](https://registry.khronos.org/OpenGL/specs/es/3.0/es_spec_3.0.pdf). This is a default-state guarantee, not proof of a particular effective noise pattern on the headset.

Fresh call inspection across the retained Mobile, Shared, Graphics, VR, and OpenXR IL found 63 literal `GL.Enable/Disable` calls: 32 in Mobile and 31 in Graphics. Every inspected call had a literal capability argument; none used `GL_DITHER` (3024). Mobile used 3089/36281; Graphics used 2884/2929/2960/3042/3089/33346/34383. The inspected native executable sections of `libcore`, `libxenko`, `libMotionEngine`, Mobile AOT, Shared AOT, and Graphics AOT also contained no MOVZ loading 3024 in any 32-bit/64-bit register. This negative native-immediate scan does not exhaust indirect state mutation or driver/runtime behavior.

For each Steam Link scene library below, a complete aligned scan of direct AArch64 BL instructions found 11 calls to the glEnable/glDisable PLT entries. Their capabilities were scissor/cull/blend/depth/framebuffer-sRGB, with no DITHER call. No MOVZ 3024 occurred in their executable sections either. FlipFrame disables/restores sRGB at `0x10b538/0x10b700` (5001712), `0x108fdc/0x1091f4` (5002244), and `0x10d5b0/0x10d7c8` (5002363).

Thus the inspected sources do not establish a VD-versus-Steam-Link difference in DITHER enable state. Leave that state unchanged for this shader correction. Whether driver dithering affects the final attachment, and whether either runtime changes it indirectly, requires draw-time state/sample capture. [EXT_sRGB_write_control](https://registry.khronos.org/OpenGL/extensions/EXT/EXT_sRGB_write_control.txt) explains the separate sRGB conversion toggle.

## Steam Link decoder metadata and the existing matrix

All 3 exact decoded scene libraries were checked directly. `QSVLCodecNDK::Init` resolves these 4 native MediaFormat keys through GOT relocations and calls `AMediaFormat_setInt32` with the same values:

| Request | Value | Android meaning |
|---|---:|---|
| COLOR_TRANSFER | 1 | LINEAR |
| COLOR_STANDARD | 6 | BT2020 |
| COLOR_RANGE | 1 | FULL |
| COLOR_FORMAT | 54 | YUVP010 |

These are **requests**, not measurement of the decoder's accepted output. Decoder behavior and encoded metadata can affect the actual output. Android defines the [MediaFormat color constants](https://developer.android.com/reference/android/media/MediaFormat) and [YUVP010 value 54](https://developer.android.com/reference/android/media/MediaCodecInfo.CodecCapabilities#COLOR_FormatYUVP010); the latter uses 10 meaningful bits in 16-bit storage. No HDR conclusion follows from these requests alone.

| Exact Steam Link base | Scene bytes / SHA-256 | Init start | Transfer / standard / range / format calls | EGL import call |
|---|---|---|---|---|
| 2.0.20 / 5001712 | 2221072 / `80b62797c7e26d6b67b0cca00693b076a336bdb48ebc1383a16cccb1616ed495` | `0xfd2f8` | `0xfd3e0 / 0xfd3f8 / 0xfd410 / 0xfd428` | `0x10b004` |
| 2.0.22 / 5002244 | 2251920 / `4b2fa5e1b5d9d5c938873f692b0e5e18159e1199dee1253dd6eccc8fa43dfa12` | `0xfa49c` | `0xfa584 / 0xfa59c / 0xfa5b4 / 0xfa5cc` | `0x108a1c` |
| 2.0.23 / 5002363 | 2292008 / `628821feab199d7712be8a51273eb9a21ec440a7c91aa6a768cc7307a4fe22f0` | `0xfd6f0` | `0xfd7d8 / 0xfd7f0 / 0xfd808 / 0xfd820` | `0x10cff0` |

Inputs are `decoded-apk-android-steamlinkvr-release-base-<version>-<code>/lib/arm64-v8a/libvrlink_scene.so`. The 5001712 fixture is an analysis reconstruction; this table does not imply a pristine APK patching result. All 3 EGL calls pass no context, `EGL_NATIVE_BUFFER_ANDROID`, and a null attribute list. No explicit per-import color or range hint was found at those calls.

The [OES_EGL_image_external specification](https://registry.khronos.org/OpenGL/extensions/OES/OES_EGL_image_external.txt) specifies that external sampling converts YUV to RGB while retaining the source colorspace/encoding, with conversion parameters determined by the EGLImage. It does not guarantee that arbitrary imported RGB is already the desired BT.709 display signal. This distinguishes Steam Link's `samplerExternalOES` from VD's shader interpreting imported components as YUV.

Valve's matrix, expressed as rows rather than GLSL's column-major constructor, is:

```text
 1.04988847  -0.04433306  -0.00555700
 0.05442289   0.96052738  -0.01509698
 0.00393458   0.01122383   0.98628952
```

Using the standard YUV luma coefficients BT.709 `(Kr=.2126, Kb=.0722)` and BT.2020 `(Kr=.2627, Kb=.0593)`, the matrix `RGBfromYUV709 * YUVfromRGB2020` is:

```text
 1.05010000  -0.04607053  -0.00402947
 0.05479396   0.96074289  -0.01553685
 0.00360246   0.00929754   0.98710000
```

Maximum absolute coefficient difference is **0.001926285619**. The reverse conversion differs by about 0.108646. This is evidence that Valve's matrix resembles compensation for a YUV conversion-basis mismatch, **not** VD's much larger HDR gamut-primary matrix. It is a numerical inference; exact Valve intent, source normalization, and driver behavior remain unproven. Android's color-standard documentation supplies these luma coefficients; the [ITU BT.2020 specification, table 4](https://www.itu.int/dms_pubrec/itu-r/rec/bt/R-REC-BT.2020-2-201510-I!!PDF-E.pdf) independently states its coefficients.

## What the VD developer actually claims

- The developer's [June 2023 HEVC 10-bit release announcement](https://www.reddit.com/r/OculusQuest/comments/14jik0r/virtual_desktop_update_hevc_10bit_support_400/) attributes reduced gradient banding in desktop and VR streaming to the added 10-bit encoder option. It does not disclose a client noise algorithm or require HDR.
- Official [1.34.8 notes](https://github.com/guygodin/VirtualDesktop/releases/tag/v1.34.8) report a gamma correction for 10-bit codecs on some AMD cards. This confirms host/vendor behavior can matter, without identifying the current cause.
- Official [1.34.16 notes](https://github.com/guygodin/VirtualDesktop/releases/tag/v1.34.16) report improved color gradients and color accuracy across codecs. They do not explain the implementation. The supplied 1.34.18.0 Android client cannot identify which PC-side changes produced that improvement.

The supplied Android APK does not contain the PC Streamer's capture, encoder input conversion, rate control, or host dithering implementation. No evidence here establishes host noise absence or presence. No shader-noise match should be inferred from the user's observed lack of banding.

## Remaining questions and limits

Unmeasured: actual PC capture/encoder input depth; HEVC profile/VUI/range and compressed gradients; accepted decoder format/dataspace; imported sample values and precision; live DITHER/sRGB state; shader output before submission; compositor quantization; physical panel precision. Host codec precision can improve gradients even when the final application attachment has 8-bit channels, but these static sources cannot attribute the user's exact visual result to a single stage.

A meaningful runtime comparison would hold the PCVR scene, host image, codec bitrate, sharpening, and headset settings constant, then capture negotiated codec metadata, decoded buffer format, imported samples, and pre-submission output. No such capture was performed here. The report created no disposable binary, decoded copy, or build output; existing exact fixtures and active evidence were preserved.
