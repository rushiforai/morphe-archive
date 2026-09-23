# Steam Link portability: decoder precision, sampling and 8-bit output

Read-only investigation, **2026-09-22**. This report compares the 3 currently verified Steam Link client bases with supplied Android Virtual Desktop **1.34.18.0 / 10683**, and separates what an Android foveal shader can reproduce from PC encoder work. No device, application, host setting, native payload or blue-noise file was changed. Installed PC Streamer **1.34.22.0** is a different version from the supplied Android client; its contemporaneous host findings must retain that distinction.

## Findings

1. Saved Galaxy XR evidence disproves the absolute claim that its runtime cannot accept a 10-bit application image. A prior Steam Link session successfully submitted `RGB10_A2` views. The same session's downstream HWC/DPU buffers were `RGBA_8888_UBWC`. Runtime input acceptance, downstream buffer precision and physical panel response are separate facts. The current patch's required output remains 8-bit.
2. No application-owned 8-bit copy was identified between Steam Link's decoder hardware buffer and its foveal shader. The apparent `GL_SRGB8_ALPHA8` argument passed to the input texture constructor does **not** allocate an 8-bit intermediate: the external-texture branch skips storage allocation. Driver-internal conversion precision is still unknown.
3. Steam Link and VD differ at the decoder/import/sampling boundary. Steam Link requests particular decoder color metadata and uses driver-converted external RGB. VD's traced shader treats sampled components as YUV and performs range-aware conversion itself. Matching neutral gamma/saturation policy does not reproduce this entire path.
4. Both clients' inspected video draws disable automatic framebuffer sRGB conversion and store encoded RGB in 8-bit sRGB color attachments. Neither inspected path establishes a special VD final-dither algorithm. `GL_DITHER` starts enabled; that default is not a measured noise pattern or proof that it explains VD's gradients.
5. The 2 existing OLED options can reproduce a supported **client policy**: highp Steam Link sampling/arithmetic, neutral added gamma/saturation, preserved Valve correction/fade/foveal alpha and 8-bit output. They cannot recreate precision already discarded by host capture, RGB-to-YUV conversion, chroma subsampling or compression. Their 8-bit/10-bit labels do not negotiate the input codec.

## Exact Steam Link inputs

Paths are `decoded-apk-android-steamlinkvr-release-base-<version>-<code>/lib/arm64-v8a/libvrlink_scene.so`. Sizes and SHA-256 below were rechecked directly. The 5001712 input is an analysis reconstruction, not evidence of pristine APK packaging. Addresses below are ELF virtual addresses; rodata locations are file offsets.

| Exact base | Bytes | SHA-256 |
|---|---:|---|
| 2.0.20 / 5001712 | 2221072 | `80b62797c7e26d6b67b0cca00693b076a336bdb48ebc1383a16cccb1616ed495` |
| 2.0.22 / 5002244 | 2251920 | `4b2fa5e1b5d9d5c938873f692b0e5e18159e1199dee1253dd6eccc8fa43dfa12` |
| 2.0.23 / 5002363 | 2292008 | `628821feab199d7712be8a51273eb9a21ec440a7c91aa6a768cc7307a4fe22f0` |

### Decoder and external texture

`QSVLCodecNDK::Init` requests MediaFormat transfer 1, standard 6, range 1 and format 54: linear, BT.2020, full range and YUVP010. These requests do not prove the accepted output. The keys are resolved through native relocations; absence of literal key strings is not absence of the requests. The exact setter calls are recorded in [VD-HEVC10-PATH.md](../steamlink-vd-hevc10/VD-HEVC10-PATH.md#steam-link-decoder-metadata-and-the-existing-matrix).

The reader uses `AImageReader_newWithUsage(1, 1, 0x22, 0x100, 20, ...)`: PRIVATE format, GPU-sampled usage. MediaCodec targets the reader's native window. `FlipFrame` obtains the AHardwareBuffer, acquires it, creates its native client buffer, then creates an EGLImage with `EGL_NATIVE_BUFFER_ANDROID`, no EGL context and null attributes. There is no explicit import color/range hint at that call.

| Site | 5001712 | 5002244 | 5002363 |
|---|---:|---:|---:|
| Reader creation call | `0xfd4c4` | `0xfa668` | `0xfd8bc` |
| `eglCreateImageKHR` call | `0x10b004` | `0x108a1c` | `0x10cff0` |
| Renderer resolves `glEGLImageTargetTexture2DOES` | `0x109cf4` | `0x107478` | `0x10ba4c` |
| Resolved pointer storage | `0x220220` | `0x22dae0` | `0x237388` |
| `FlipFrame` binds external texture | `0x10b4f8` | `0x108f9c` | `0x10d570` |
| EGLImage target call, target `0x8d65` | `0x10b520` | `0x108fc4` | `0x10d598` |

`0x8d65` is `GL_TEXTURE_EXTERNAL_OES`. The loaded entry point name was resolved from each base's actual string, not inferred from a neighboring layout. External EGLImage binding associates the image with the texture; it does not prescribe an 8-bit RGB allocation. External sampling converts YUV to RGB using the EGLImage's conversion parameters, preserving the source encoding; the specification leaves whether filtering happens before/after that conversion unspecified. These facts follow from [OES_EGL_image_external](https://registry.khronos.org/OpenGL/extensions/OES/OES_EGL_image_external.txt), sections 3.7.14 and texture application. Internal decoder/driver arithmetic and meaningful sample low bits remain unmeasured.

### The apparent 8-bit input allocation is a false lead

`QSVLRendererXR` passes `0x8c43` (`GL_SRGB8_ALPHA8`) and `0x1908` (`GL_RGBA`) into `Texture::Texture`. However, it also passes `external=true` (`w3=1`) and width/height 0. The constructor selects the external target and branches around both `glTexImage2D` and the texture-storage function. This call therefore does not truncate the decoder image to 8 bits.

| Site | 5001712 | 5002244 | 5002363 |
|---|---:|---:|---:|
| Renderer calls Texture constructor | `0x109db8` | `0x10753c` | `0x10bb10` |
| Texture constructor start | `0x1508bc` | `0x14ffe8` | `0x1575a8` |
| External branch skipping storage | `0x1509b4 -> 0x150a48` | `0x1500e0 -> 0x150174` | `0x1576a0 -> 0x157734` |
| MIN / MAG filter calls | `0x150ab4 / 0x150a94` | `0x1501e0 / 0x1501c0` | `0x1577a0 / 0x157780` |

The constructor sets both filters to `GL_LINEAR` (`0x2601`) and wraps S/T with `GL_CLAMP_TO_EDGE` (`0x812f`). A complete aligned direct-branch scan found 4 `glTexParameteri` calls per scene, all in this constructor. This bounds the observed application state; it does not exhaust every possible indirect or external GL state change.

The imported texture is bound by `SRGBCorrectionPass::RenderSpecificPrep`. `RenderSpecific` attaches the caller-supplied 2D projection texture as `GL_COLOR_ATTACHMENT0`, clears it, selects the distinct masked/base shader and draws. This establishes a direct imported-image-to-projection draw in the traced path, without an identified additional application RGB8 copy before sampling.

| Site | 5001712 | 5002244 | 5002363 |
|---|---:|---:|---:|
| `RenderSpecific` start | `0xf1af4` | `0xee910` | `0xf1a50` |
| Projection color attachment call | `0xf1b4c` | `0xee968` | `0xf1aa8` |
| Masked/foveal draw | `0xf1c44` | `0xeea60` | `0xf1ba0` |
| Opaque/base draw | `0xf1d24` | `0xeeb40` | `0xf1c80` |

### Current shader and final storage

The stock 1087-byte prefix is identical in all 3 bases and declares `mediump float` plus an unqualified external sampler. Current `OledCalibrationPatch.kt:131-158` explicitly declares `highp float` and `highp samplerExternalOES`. Those declarations improve the shader precision contract; they cannot prove or repair precision already lost before sampling.

Current production execution at `OledCalibrationPatch.kt:419-430` writes the existing dither-OFF calibrated prefix, selects `SRGB8_HIGHP`, then applies the separate masked suffix. `VdSdrFoveaPatchHelper.kt:55-64` overwrites only masked RGB with `clamp(_valve1_d2020d709 * texture(tex0,uv).rgb, 0., 1.) * fFadeAmount`, preserves every alpha-operation token, and adds no noise or integer quantizer. Both declared input depths use these same bytes. The opaque shader keeps its calibration.

Valve's retained near-identity matrix numerically resembles compensation between BT.2020 and BT.709 **YUV conversion bases**. That is not the same operation as VD's dormant HDR gamut-primary transform. Removing it or applying VD's YUV-to-RGB coefficients to already converted Steam Link RGB would require new evidence about the actual samples. The numerical comparison and limits are in [VD-HEVC10-PATH.md](../steamlink-vd-hevc10/VD-HEVC10-PATH.md#steam-link-decoder-metadata-and-the-existing-matrix).

The inspected host's optional replacement-shader path is disabled in its persisted/default configuration and its replacement files are absent; [HOST-SHADER-PATH.md](../steamlink-vd-hevc10/HOST-SHADER-PATH.md) records the exact installed driver and branches. Enabled remote overrides can replace complete client shaders and bypass the embedded suffix. No draw-time shader capture was made.

## VD comparison at the GL boundary

The supporting IL and GLSL are under `build/vd-audit/`, revalidated against the supplied Android assembly store in [VD-HEVC10-PATH.md](../steamlink-vd-hevc10/VD-HEVC10-PATH.md).

| Boundary | Steam Link current options | Supplied VD Android client |
|---|---|---|
| Input depth | Host/bitstream choice; checkbox only declares intended input | HEVC and HEVC10bit are separate codec choices, both `video/hevc`; HDR is separate |
| Reader | PRIVATE, GPU-sampled usage, maxImages 20 | PRIVATE, usage 0, maxImages 2; Shared IL 5576 |
| EGL import | Native buffer, null attributes | Native buffer, only preserved-image attribute; Graphics IL 43898 |
| Imported texture | `GL_TEXTURE_EXTERNAL_OES`, `samplerExternalOES`; converted RGB | `GL_TEXTURE_2D`; Shared IL 5740-5746; embedded shaders declare `sampler2D` and treat sampled components as YUV |
| Range handling | Requests full range; external-driver conversion plus Valve matrix | Reads accepted decoder `color-range`, supplies IsFullRange; Shared IL 8298, Mobile IL 49714 |
| Filtering | Linear clamp on imported texture | Fovea PointClamp; base PointClamp when StreamCount=4, otherwise LinearClamp; Mobile IL 47013-47022, 47042-47051, 47554-47562 |
| Shader precision | Explicit highp float and sampler | SpriteGamma highp float, Sharpen/Fovea mediump float; sampler declarations unqualified |
| SDR processing | Neutral added gamma/saturation in fovea, Valve correction retained | Range-aware YUV conversion/clamp, optional luma sharpening; no bit-depth-specific SDR shader branch |
| Final color storage | `GL_SRGB8_ALPHA8` for both options | Enum 29 maps to `GL_SRGB8_ALPHA8`; VR IL 6386, OpenXR IL 11535 |

The `glEGLImageTargetTexture2DOES` function suffix does not determine the texture target. A runtime rewrite to `__samplerExternal2DY2YEXT` has **not** been established by this investigation and is not assumed here. Exact normalized VD sampler values still require runtime evidence. `GL_EXT_YUV_target` offers a raw-YUV external sampler as a possible future client implementation route, but using it would require extension/import support checks and sample validation; its existence is not proof that this VD build uses it. See [EXT_YUV_target](https://registry.khronos.org/OpenGL/extensions/EXT/EXT_YUV_target.txt).

Both clients disable `GL_FRAMEBUFFER_SRGB_EXT` around the traced video draws. This suppresses another linear-to-sRGB write conversion into the sRGB attachment; it is unrelated to whether dithering is enabled. Steam Link call pairs are `0x10b538/0x10b700`, `0x108fdc/0x1091f4`, `0x10d5b0/0x10d7c8`; VD Mobile IL 49719-49737 contains the corresponding pair. See [EXT_sRGB_write_control](https://registry.khronos.org/OpenGL/extensions/EXT/EXT_sRGB_write_control.txt).

The inspected GL calls did not establish a DITHER-state difference between the clients. OpenGL ES initializes DITHER enabled, but its selection between adjacent representable channel values is implementation-dependent. It does not promise a particular useful pattern for this attachment. Effective state and output still need measurement. See [OpenGL ES 3.0.6, section 4.1.9](https://registry.khronos.org/OpenGL/specs/es/3.0/es_spec_3.0.pdf), and the bounded application call scans in the VD client report.

An 8-bit destination has 256 stored values per RGB channel; it does not retain 1024 independent values at a single pixel. Higher-precision YUV encoding can nevertheless reduce intermediate conversion/compression errors and change which final RGB values are reached. YUV-to-RGB conversion is not equivalent to dropping 2 low bits from each decoded component. Dithering, if effective, can represent fractional average levels across pixels or frames. The inspected evidence does not attribute VD's observed smooth gradients to such a mechanism.

## Saved live evidence: acceptance is different from downstream precision

These are existing **2026-09-09** observations, freshly reread; no live check occurred during this investigation. The installed app was modified Steam Link **2.0.20 / 5001712**, native SHA-256 `e5e85146e80abf21709e63a31fa49fc02d24884fdc9450b8fc343de0e67211cd`.

| Evidence under `build/banding-live-20260909-165031/` | Observation | Limit |
|---|---|---|
| `ASSESSMENT.md:9` | Saved host inspection reported `Using 10bit mode: 1` | Host-log line is summarized here; original live log can rotate |
| `logcat-local.txt:189307` | Qualcomm decoder reports `YCBCR_420_P010 1536x6144` | Reported format, not meaningful-low-bit readback |
| `logcat-local.txt:189319,189344` | Current PID 17397 output `color-format=54` | Same limit |
| `logcat-local.txt:189413-189414` | Frame 1 has 4 views with format 32857 (`RGB10_A2`); submission result 0 | Successful sampled runtime submission, not present-day universal support |
| `logcat-local.txt:189555-189556,189847-189848` | Frames 2/3 repeat the same formats and success | Early-frame samples |
| `cpm-local.txt:27,29,31,33` | 4 visible 1536x1536 views, `V0_SRGB_LINEAR` | Runtime scene interpretation |
| `surfaceflinger-local.txt:2056,2094-2111` | HWC plus both DPU tables use `RGBA_8888_UBWC`; repeated dump agrees | Downstream 8-bit storage; exact compositor allocation correlation and optical output unmeasured |

The archived passthrough diagnostic also submitted a tiny additional quad. That bounds the historical composition context; no retired experiment is proposed or restored here. The capture establishes successful RGB10 projection submission despite later 8-bit buffers. It does not establish an uninterrupted 10-bit path or 10-bit panel operation.

The prior linear RGB10 experiment had an additional mathematical limitation: near black, a linear 1/1023 storage step is about 3.22 times an 8-bit sRGB code step after accounting for the sRGB toe. A larger nominal bit count alone therefore does not guarantee better shadow gradients. The current 8-bit sRGB requirement avoids conflating linear and encoded code spacing; it does not prove the remaining banding cause.

## What can be ported into the 2 existing options

| Mechanism identified on a PC/client path | Feasible inside only the current foveal client shader? | Required boundary |
|---|---|---|
| Higher precision PC capture or encoder input | No | Must preserve precision before encoding; a postdecode shader cannot recover discarded distinctions |
| RGB-to-YUV coefficients/range, chroma downsampling, codec bit depth or rate control | No faithful reproduction | Requires the host encoder/conversion path and corresponding bitstream metadata; existing host 10-bit negotiation remains separate |
| Transfer companding before encoding | Only its inverse, after a matching host transform | A client-only inverse on an ordinary stream produces the wrong image and cannot reproduce a precision benefit that occurred before quantization |
| Known full/limited-range conversion from raw decoded YUV | Potentially, with a new verified import/sampler path | Must establish actual layout/range, preserve highp samples and replace the external-RGB correction coherently; not a suffix-only change |
| Point versus linear sampling | Technically yes, with draw-scoped texture state and restoration | Shared input texture also serves the base layer; globally changing constructor filters would violate fovea-only scope; no established banding benefit |
| Known final 8-bit quantizer/dither | Technically yes at the masked draw, if its exact behavior is identified | Current evidence identifies no VD shader algorithm to copy; driver-default DITHER is not an algorithm specification; separate blue-noise work remains untouched |
| Downstream compositor/panel precision | No | Outside the application's foveal shader and 8-bit submission contract |

The current correction should therefore remain described as **VD-informed neutral SDR foveal processing**, not a verified reproduction of VD's complete HEVC10 pipeline or a guaranteed no-banding solution. If host investigation identifies a concrete transform, first locate whether it acts before or after irreversible conversion/compression; only then decide which corresponding operation can be placed in the client. This does not establish that Steam Link fundamentally cannot match VD's gradients. It establishes that 2 postdecode client-shader options cannot, by themselves, reproduce a different host encoding pipeline; targeted client or coordinated host/client improvements remain possible when their mechanism is known.

The most discriminating next evidence would be matched encoded gradient inputs with negotiated codec/profile/range, accepted hardware-buffer format, imported sample values, draw-time DITHER/sRGB state and pre-submission RGB values. This is a proposed measurement boundary, not work performed here. No new binary/compiler artifact was produced by this report; exact bases and existing raw evidence were preserved.
