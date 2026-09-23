# Required boundary: good 8-bit output before OpenXR submission

2026-09-22 follow-up. The user reports that leaving 10-to-8-bit conversion to the
Galaxy XR runtime produces strong banding, whereas VD's PCVR result looks smooth.
The user then clarified that this was **1 earlier test handing 10-bit directly to
Galaxy XR**, not a test of the revised VD-like options from this task. Treat that
as an observed quality difference, not as a request to prove panel bit depth.
No new headset test was performed here.

## Correction to the previous conclusion

Successful RGB10 submission does not answer whether the runtime converts it well.
Likewise, inability to reproduce PC preprocessing in a post-decode shader does not
make app-side quality improvements impossible. The practical requirement is:

```text
decoded samples with available precision
  -> color conversion and processing
  -> controlled final quantization in encoded RGB space
  -> 8-bit sRGB application image
  -> OpenXR submission
```

This puts the application's precision reduction before submission. It cannot
prevent subsequent compositor resampling/blending or repair precision already
lost before the shader. The required output remains 8-bit, with the requested
processing confined to the foveal layer.

## What the current options actually do

| Implementation | Final app write | What is controlled |
|---|---|---|
| `foveaVdLike10Bit` and `foveaVdLike8Bit` | Highp sample, Valve matrix, clamp and fade into an 8-bit sRGB attachment | Output format and neutral foveal color processing; final quantization is left to GL |
| Separate blue-noise patch | After original color processing/fade, selects adjacent 8-bit codes with `floor(clamp(rgb,0,1)*255+t)/255` | Explicit final RGB quantization with a known spatial threshold distribution |

The 2 VD-like choices are therefore **not a finished demonstration of the user's
quality requirement**. An 8-bit attachment proves the storage boundary, not smooth
gradients. Their absence of shader noise is a bounded match to the inspected VD
shader policy, not a recovered VD dithering method.

They do already change the handoff relevant to the user's earlier test: Steam Link
writes an 8-bit sRGB image instead of submitting RGB10 for the runtime to reduce.
The earlier RGB10 observation is not a measured failure of this revised path.
Keep its visible outcome unclassified until it has actually been compared.

Current source anchors:

- `patches/src/main/kotlin/app/template/patches/steamlink/binary/OledCalibrationPatch.kt:419`:
  selects `SRGB8_HIGHP`, writes the highp prefix with dither off and applies the
  distinct foveal suffix.
- `patches/src/main/kotlin/app/template/patches/steamlink/binary/VdSdrFoveaPatchHelper.kt:59`:
  foveal RGB is clamped corrected sampling times fade, with no explicit quantizer.
- `patches/src/main/cpp/blue_noise/shader_rewrite.h:28`:
  the separate helper performs its quantization after `SL_originalMain()`.
- `patches/src/main/cpp/blue_noise/blue_noise.cpp:169` and `:265`:
  it requires the intended 8-bit sRGB attachment/write state, disables fixed-function
  dithering for the identified foveal draw and restores the previous state afterward.

These blue-noise sources were read only. Their algorithm, payload, tests and
diagnostics remain protected by the existing 50-file preservation manifest.

## Remaining VD comparison

VD and Steam Link both have a traced 8-bit sRGB app output path and both disable
automatic framebuffer sRGB write conversion for video. No DITHER-state difference
has been established. The unclosed client difference is the **decoder import and
color conversion**: VD's shader interprets sampled channels as YUV, whereas Steam
Link's external sampler supplies converted RGB before Valve's correction matrix.
VD's foveal sampling is point-filtered; Steam Link's is linear-filtered. Neither
difference alone proves the banding cause.

A fresh check of VD's shader creation follows the complete managed path to the GL
entry point: `EffectProgram.CreateShaders` selects embedded ES2/ES3 data, can insert
a depth-clamp wrapper and substitutes a buffer-fetch macro. It does not inject a
YUV sampler or dithering function. The OpenTK wrappers forward shader source and
GL state calls. See [android-draw-gap.il.txt](android-draw-gap.il.txt) for the selected
method evidence. This closes a source-rewrite possibility; it does not measure
the imported values or vendor internals.

The Android library resolver changes `.dll` to `.so` and loads the resulting
library. These wrappers therefore reach `libGLESv2.so`; no extra app-owned shader
or dithering hook was found at that boundary. A fresh direct-call scan in all 3
Steam Link bases again found 11 GL Enable/Disable calls per base with no DITHER
argument. That scan still does not establish the runtime's effective state.

There is a technically available way to own YUV conversion in an app:
[GL_EXT_YUV_target](https://registry.khronos.org/OpenGL/extensions/EXT/EXT_YUV_target.txt)
defines an external sampler that returns YUV without automatic color conversion.
Using that in Steam Link would require verified extension support, actual imported
sample/range behavior, new shader guards and fovea-only routing. Its availability
in the API does not establish that this VD build uses it, nor justify blindly
replacing Steam Link's RGB sampler with VD's matrix.

## Acceptance needed for a VD-equivalent claim

Compare the same controlled gradient and codec/range at the decoded sample, shader
output and 8-bit app-buffer boundaries. Establish where distinct low-level values
collapse, and whether the final 8-bit buffer already contains bands. Check actual
draw-time sRGB/DITHER state and the submitted attachment format. That distinguishes
decoder/import loss, app quantization and later compositor processing.

No new production algorithm is introduced by this follow-up. No specific VD
quantizer has been identified; inventing one and calling it VD's method would be
incorrect. The separate blue-noise implementation already supplies explicit
app-side quantization, with headset efficacy still unverified. The remaining
investigation concerns VD's actual client path, not whether 8-bit app output is
a valid goal.
