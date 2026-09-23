# Virtual Desktop comparison: verified streaming shaders

Date: 2026-09-22. Reference: supplied decoded Virtual Desktop **1.34.18.0 / 10683**, ARM64. Scope: static client inspection; no device, APK installation, live stream, driver, compositor, or panel measurements.

## Result

**The existing Steam Link OLED/VD-like comparison patch does not reproduce the traced Virtual Desktop streaming processing.** Its unconditional matrix, chosen gamma/saturation, 10-bit-only arithmetic noise and shared-prefix pixel weight differ; the detailed comparison is below. This verifies the existing patch independently of the new blue-noise feature.

The inspected Virtual Desktop streaming shaders have no corresponding explicit dither. They sample video, convert full/limited-range YUV to RGB, optionally sharpen, and write to an 8-bit sRGB colour attachment. There is no noise texture, threshold lookup, explicit RGB quantization, frame-dependent noise, or blue-noise formula in the 3 traced VR video fragment shaders. Therefore neither the previous Steam Link arithmetic dither nor the proposed blue-noise implementation can be described as a verified copy of Virtual Desktop's dithering.

The common point is the **8-bit sRGB application output boundary**, including the traced 10-bit codec route. This is not evidence that VD applies a particular dither to the entire image. Driver dithering, native postprocessing, remote encoder behaviour, runtime composition, and physical display processing remain unmeasured.

## Fresh source verification

`VirtualDesktop/base/apktool.yml:10-11` identifies the exact version/build. The current decoded assembly store is:

```text
VirtualDesktop/split_config.arm64_v8a/lib/arm64-v8a/libassemblies.arm64-v8a.blob.so
SHA-256 2b879cfa184921586e5ee6e25c777f3c7c65ce45e51e1fbad3676ca3f5cb3505
```

The 5 relevant assemblies were freshly decompressed **in memory** from their XALZ/LZ4 records and compared byte-for-byte with `build/vd-audit/assemblies/`. All matched. No input or extracted assembly was overwritten.

| Assembly | XALZ file offset | Descriptor | Bytes | SHA-256 |
|---|---:|---:|---:|---|
| VirtualDesktop.Mobile.dll | `0x4fad8b` | 55 | 529408 | `80ba3b1a1f4dc4328ab835b7a0c5b9bb293cbb10562542226d272b07f9f377fc` |
| VirtualDesktop.Mobile.Shared.dll | `0x537f2f` | 56 | 96256 | `b09cb18ee27b262b4e01b89ca727daedb3e1c5043a3854dc5e7b7d7fc0ebf83d` |
| Xenko.Graphics.dll | `0x593bb9` | 62 | 626176 | `2cab7a326d45a328639cb7df380a212c9801e18d80876282e4b4b731feb0b3fa` |
| Xenko.OpenXR.dll | `0x5c77fc` | 63 | 161792 | `f7d992dacc10509c753376248613f75c5e0f38210e4b9aa6651f224f57636cc6` |
| Xenko.VR.dll | `0x5db848` | 64 | 106496 | `56685e112d1b89d7ce5f89c6147e13dec012fd3208eea0df14c8955ec1ae3f69` |

Resolved IL was regenerated in memory with the existing `build/vd-audit/dump_managed.py` / `dump_graphics.py` logic and compared to the saved dumps instead of writing them. All 6 produced dump comparisons passed, including the 5 source-verified assemblies above and the existing VirtualDesktop.Core assembly. All **46** extracted GLSL files were also checked against their exact byte ranges in the source-verified Xenko.Graphics.dll; all matched.

## Active video branch and bit depth

`build/vd-audit/VirtualDesktop.Mobile.il.txt:49532` onward contains `VideoPlayer.DrawVR` (RVA `0x27230`). Its default video effect is `SpriteGammaEffect`; it selects `SharpenEffect` for the applicable sharpening branch, and `FoveaEffect` for separate foveal draws. The left-eye choice/texture/range writes are at lines 49659-49717; the foveal branch begins at line 49738. Equivalent right-eye draws follow.

`DrawVR` supplies the decoder's `IsFullRange` property and the acquired video texture. The 3 effect bodies have no input-bit-depth uniform or 8-bit-versus-10-bit dither switch. Their selection is based on rendering/sharpening/foveation state, not a separate noise operation for Main10. Codec enum and MIME mapping remain distinct from shader processing: `HEVC=2`, `HEVC10bit=6`, `AV1=10`, `AV110bit=11` (`codec-metadata.txt`, `VirtualDesktop.Mobile.il.txt:51582`, `VideoPlayer.GetMimeType`, RVA `0x28ab8`). This is static path evidence, not proof of actual decoded 10-bit sample precision on a device.

`Xenko.VR.il.txt:6386`, `OpenXRHMD.BeginDrawLeftEyeVR` (RVA `0x64f0`), passes format enum 29 for the ordinary and extrapolated colour swapchains. `Xenko.OpenXR.il.txt:11535`, `ToOpenGLESFormat` (RVA `0xa2ac`), maps 29 to **35907 / GL_SRGB8_ALPHA8**. The same constructor path is used without a 10-bit-codec branch changing this colour format. FP16 motion-vector textures are separate from these colour targets.

Around each video draw, `DrawVR` disables then restores capability **36281 / GL_FRAMEBUFFER_SRGB_EXT** (`VirtualDesktop.Mobile.il.txt:49719-49737` for the 1st draw). This is consistent with writing already encoded video RGB to sRGB storage. It does not identify the effective GL_DITHER state.

## Exact shader evidence

Paths below are under `build/vd-audit/shaders/`. These files match the supplied DLL bytes, including CRLF line endings.

| Effect | DLL offset / file | Bytes | SHA-256 |
|---|---|---:|---|
| SpriteGammaEffect | `0x55f2c`, `Xenko.Graphics.dll-55f2c.glsl` | 4270 | `6bbe533e034323cbca4588c3fb5301dc22b6aa7f525496bf17f6b725b3a27e17` |
| SharpenEffect | `0x58da2`, `Xenko.Graphics.dll-58da2.glsl` | 5226 | `5bd2344e8100382df38621eafda367a547b20721a3cc7e08764012cdbc686088` |
| FoveaEffect | `0x531db`, `Xenko.Graphics.dll-531db.glsl` | 5210 | `09d4c2a8bff02799bb7f6adc139c91f5807124bf4f5adc13ccf04488d1afaddd` |

Each shader has exactly **1 sampler**, `Texture_id21_Sampler_id24`, used for video. There is no second noise sampler, noise lookup table, threshold array, tile coordinate, mip selection, noise filter/wrap state, noise strength, or time/frame uniform in these bodies. No `floor`, `fract`, `round`, `sin`, `noise`, `random`, or `texelFetch` invocation occurs in them. Consequently **VD noise asset dimensions/distribution, noise tiling/filtering/range, and temporal behaviour cannot be specified from this traced video path**.

`SpriteGammaEffect:47-74` converts YUV to RGB according to `IsFullRange`, with U/V centred at 0.5 and limited-range luma adjusted by `(Y - 0.0625) * 1.164383561643836`; it clamps the RGB result. The sharpening variants perform their 4-neighbour luma adjustment before that conversion (`SharpenEffect:74-85`, `FoveaEffect:74-85`). They do not quantize the result to an integer output code in GLSL.

`FoveaEffect:111-127` computes a circular edge alpha from `length(uv - 0.5)`, optionally sharpens using that alpha, then performs the same YUV-to-RGB conversion. The video draw uses the corresponding foveal viewport/scissor and non-premultiplied blending. This foveal overlay is distinct from Steam Link's layer/program topology; copying its radial mask would not prove correct Steam Link layer selection.

**Colour-conversion correction:** VD's BT.2020-to-BT.709 matrix is inside `ToSDR`, called only under `IsHDR`. In SpriteGammaEffect that function is at lines 76-100 and the conditional call at lines 118-121. The ordinary SDR path uses the YUV-to-RGB conversion above; the presence of the HDR matrix is not evidence that it runs for every SDR10 frame. Shader gamma-boost math also exists, but `ShouldUseGammaBoost` is the literal `false` return at `VirtualDesktop.Mobile.Shared.il.txt:949-951`; the matching setters are skipped in the inspected loading path.

## Bundled functionality is not active streaming-path proof

The broader 184-assembly name scan found generic dither declarations in FFmpeg.AutoGen, OpenTK, System.Drawing.Common, Xenko.Engine, and Xenko.Rendering. In particular, the saved Xenko.Rendering.dll contains `Xenko.Rendering.Images.Dither.Dither`:

- `.ctor`, RVA `0x350d5`: selects a colour transform named `Dither`.
- `UpdateParameters`, RVA `0x350e4`: writes `DitherKeys.Time` from total elapsed seconds.
- `FXAAEffect.Dither` also exists, but its values select FXAA quality ranges.

These generic engine classes must not be confused with a demonstrated streamed-video pass. No direct dither member reference was found in the inspected VirtualDesktop.Mobile/Shared assemblies, and the traced video shaders contain none of that logic. No `blue_noise` or `bluenoise` string was found in the 184 saved assemblies. String searches of the supplied `libcore.so`, `libMotionEngine.so`, `libxenko.so`, and the Graphics/Mobile/Mobile.Shared AOT libraries found no blue-noise/dither/quantization label. These are bounded searches, not exhaustive native control-flow proof. Engine scene assets or an untraced native path can only be ruled in/out by tracing their execution.

## Existing OLED / VD-like patch compared with VD

This comparison concerns the **existing `OLED color calibration` patch and its `Fovea VD-Like Input 10 bit` / `Fovea VD-Like Input 8 bit` options**, not the separate new blue-noise patch. The existing patch's behaviour is preserved. Findings below come from its `OledCalibrationPatch.kt` shader template, mode resolver and execute block as supplied at task start (also present in the repository HEAD).

| Operation | Existing Steam Link OLED / VD-like patch | Supplied VD streaming path |
|---|---|---|
| Input declaration | 10-bit option enables `STANDARD` arithmetic noise; 8-bit option disables it. Neither forces stream/decoder bit depth. | 8/10-bit codec modes feed the traced video draw path; no equivalent depth-dependent noise branch in the 3 shaders. |
| Colour conversion | External video sampling followed by Valve's existing matrix, whose diagonal is approximately `1.0499, 0.9605, 0.9863`. | Ordinary path samples YUV and applies full/limited-range YUV→RGB. VD's different BT.2020→709 matrix is inside the HDR-only `ToSDR` branch. |
| Gamma/saturation | Applies `pow(clamp(c), gamma)` and luma-centred saturation before noise. Default profile uses gamma **1.20**, saturation **1.45**, including when either VD-like option is selected. | No equivalent saturation step in the traced video effects. The optional gamma-1.5 branch is dormant because `ShouldUseGammaBoost` returns false. |
| Noise | Per-channel `fract(framePhase * .43 + channelOffsets + x * 1.67 + y * 1.127) - .5`, scaled by `.00392` in the 10-bit mode, by a UV weight, and by endpoint fade guards. | No corresponding arithmetic noise, blue-noise lookup or explicit output-code quantizer in the traced shaders. |
| Quantization/fade | Adds floating-point noise before `fFadeAmount`; 8-bit attachment storage performs final conversion. There is no explicit `floor(... * 255 + threshold) / 255`. | Shader writes floating RGB to an 8-bit sRGB attachment. Effective driver/output quantization behaviour was not measured. |
| Layer scope | Rewrites the **common prefix used by both base and foveal programs**. Its UV weight does not identify which layer is being drawn. | Traced draws use separate base and foveal effects; no full-image blue-noise pass was established. |

The old UV weight is `clamp(1 - 4 * dot(d,d), 0, 1)`, where `d = abs(fract(uvmask * vec2(1,4)) - .5)`. The native embedded vertex shader supplies `uvmask = uv * vec2(1,.25)` in its 4-section modes, independently of the group used for the video lookup. At the centre of either normalized output quad, that makes the weight **1**, not 0 on the base layer. The 2 fragment programs append different alpha suffixes to the same modified prefix; neither the weight nor an alpha suffix prevents RGB processing in the base program. Thus the old implementation is **not restricted to the foveal layer** on the traced fallback path. Its gamma/saturation processing also remains common to both programs. Remote shader replacement can replace this embedded behaviour, so this is not a claim about measured live draws.

The old 8-bit option's description of a "neutral path" does not match its default shader arithmetic: it disables the noise but leaves the selected gamma/saturation profile active. The existing patch is therefore **not verified as what Virtual Desktop does**, for either 8-bit or 10-bit input. The matrix, gamma/saturation, arithmetic-noise formula, timing and layer restriction differ from the inspected VD path. This finding does not authorize or make changes to that existing patch.

## Separate new blue-noise patch

The implementation requested in this directory is a **separate Steam Link foveal blue-noise quantizer to 8-bit sRGB**, applicable after existing colour processing for either input depth. Input bit depth does not decide whether colour conversion/filtering produces fractional output codes. It must not be advertised as Virtual Desktop's verified algorithm, nor as proof that VD dithers the entire image. It uses its own shader/draw guards to restrict the new quantizer to the foveal layer; that does not retroactively make the preserved OLED patch foveal-layer-only.

This audit created only this compact report. Existing decoded inputs, tools, DLLs, GLSL files, and prior diagnostic evidence were preserved. No temporary extracted copies or native compiler outputs were created.
