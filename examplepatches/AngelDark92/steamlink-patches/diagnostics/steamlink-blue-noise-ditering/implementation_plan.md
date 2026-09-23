# Implemented scope update — 2026-09-22

The implementation is now the separate, **default-off** Morphe patch **Foveal blue-noise dithering (experimental)**. The current contract is documented in [README.md](README.md); the original plan below is retained as historical design evidence.

- **Foveal layer only**, for both eyes. This supersedes every historical instruction below to modify both base and foveal layers. Exact complete masked-shader hashes and each base's verified foveal draw return address jointly gate the effect; the base draw is excluded.
- **8-bit and 10-bit declared inputs use the same final 8-bit sRGB quantizer.** The input option does not force host negotiation or decoder precision. High-precision video sampling/arithmetic precedes quantization after colour processing and fade; the original alpha/mask is preserved.
- Exact pairs: **2.0.20/5001712**, **2.0.22/5002244**, and **2.0.23/5002363**. The 5001712 decoded input remains an analysis reconstruction. Per-base layout/native-path evidence is in [native-layouts.json](native-layouts.json) and [NATIVE-INTEGRATION-EVIDENCE.md](NATIVE-INTEGRATION-EVIDENCE.md).
- Existing OLED behavior stays intact. Optional OLED calibration is accepted only with both older VD-like fovea toggles off; either enabled toggle is rejected rather than stacked. The new patch is independent of OLED and outside recommended bundles.
- Unknown remote/host shader replacements remain unchanged, including after reconnect or reload. Live shader coverage is still an acceptance gap. The disable property `debug.steamlink.blue_noise=0` is checked on shader submission, so it requires an app restart or shader reload.
- The canonical native implementation is under `patches/src/main/cpp/blue_noise/`, with the packaged helper under `patches/src/main/resources/steamlink/blue-noise/`. It uses narrow guarded scene-import/lookup-string routing, not the historical proposed Application/ByteHook bootstrap.
- The [Virtual Desktop verification](virtualdesktop-verification.md) does not find this blue-noise operation in the inspected VD streaming shaders. Neither the new quantizer nor the legacy arithmetic dither is a verified copy of VD dithering.
- Current evidence includes 13 passing host native contract groups, deterministic arithmetic/spatial checks, and production-helper checks against 3 exact decoded inputs. These are separate from actual GPU/headset results. The cached Kotlin compiler route bypasses the unresolved Gradle plugin; any Morphe fixture packaging results belong in their own final validation receipt.

See the README for reproduction commands, optional-calibration rules, numerical limits, and remaining runtime checks. The unchanged historical text below must not override this implemented scope.

---

# Steam Link VR 2.0.20: headset-side output dithering plan

## Scope and result

Target: the supplied decoded `com.valvesoftware.steamlinkvr` APK, version `2.0.20` / `5001712`, AArch64. This plan is based on static inspection of that copy, not an assumption about the store release. See `static_evidence.md` for disassembly and exact file identity.

**Implement a small native shader-interception module that adds blue-noise quantization to the existing video output shaders. Preserve the decoder’s available precision and existing stream settings, retain the existing sRGB swapchains, and modify both base and foveal video shaders whenever they compile or reload. Do not add a post-process that first reads an already-quantized 8-bit eye image.**

This is an implementation plan, with a standalone GLSL helper and arithmetic tests. It is not a rebuilt APK or a finished native injector. No headset execution was performed. Eliminating every visible contour cannot be guaranteed when the runtime later filters, composites, or requantizes the result.

## 1. Findings that determine the design

| Item in the supplied library | Finding | Consequence |
|---|---|---|
| `lib/arm64-v8a/libvrlink_scene.so` | Contains native OpenGL ES/OpenXR rendering and embedded GLSL | The main change belongs here or in a shim intercepting its calls, not in WebUI/Java video settings. |
| `QSVLRendererXR::SetupSwapchains`, `0x10A904` | Both video swapchain requests use `0x8C43`, `GL_SRGB8_ALPHA8` | The app already requests an 8-bit sRGB output boundary. Do not blindly force an earlier decoder conversion. |
| `QSVLRendererXR::FlipFrame`, `0x10AD18` | Imports decoder hardware buffers and renders base/foveal images for both eyes | Preserve the import path and patch all applicable video draws. |
| `SRGBCorrectionPass::RenderSpecific`, `0xF1AF4` | Attaches the supplied output texture and draws the video shader | Put dithering in that draw's fragment shader, before the attachment write. |
| `FlipFrame`, `0x10B534–0x10B700` | Calls `glDisable(0x8DB9)` around the four video draws, then re-enables it | Verify `GL_EXT_sRGB_write_control` and live state. The intended path writes already-encoded RGB into sRGB storage. |
| Fragment prefix at file offset `0x9B4B8` | `mediump` floats; no explicit external-sampler precision; commented dither; existing matrix and fade | Test high-precision sampling separately, preserve colour processing, and replace—not blindly enable—the old dither idea. |
| Shader-push handler near `0xFC250` | Receives remote shader strings and reloads the base/foveal shaders | Embedded-string-only modifications may be replaced during connection or settings changes. |
| Common compiler at `0x150D90`; `glShaderSource` call at `0x150DE0` | Used by initial compilation and reload | Intercepting this library's GLES shader calls can cover both paths. |

These are static observations. The selected runtime format, active shader text, decoded precision, and final panel path must still be measured on the headset. OpenXR assigns non-linear interpretation through the sRGB swapchain format; other formats are interpreted as linear [W1].

The local prefix is **1087 bytes**, copied with an explicit length before a separate base or foveal suffix is appended. Its source path string is `/data/src/vrlink/client_android/src/scene/graphics/srgbcorrection.cpp`; that C++ source file is not included in the ZIP. The decoded package is not a rebuildable Valve C++ project.

## 2. Establish a reversible, installable baseline

Keep the original ZIP, a known-good installable APK set, settings you can export, and an untouched library copy. Record the headset OS/runtime versions and PC SteamVR version. Use the same scene, codec, bitrate, render resolution, refresh rate and foveation settings for comparisons.

First rebuild the decoded tree **without a graphics modification**. The ZIP contains a `build/` directory; remove generated `build/` and `dist/` directories from the WORKING COPY before rebuilding, so stale generated files cannot mask changes.

Example commands, with Apktool, Android SDK build-tools and a JDK installed:

```sh
# Run outside the extracted directory. Keep the original tree untouched.
cp -a decoded-apk-android-steamlinkvr-release-base-2.0.20-5001712 steamlink-dither
rm -rf steamlink-dither/build steamlink-dither/dist
mkdir -p out

# Create a local test key once; the tool prompts for its password/details.
keytool -genkeypair -keystore steamlink-test.jks -alias steamlink-test \
  -keyalg RSA -keysize 3072 -validity 3650

apktool b steamlink-dither -o out/steamlink-unsigned.apk
zipalign -P 16 -f 4 out/steamlink-unsigned.apk out/steamlink-aligned.apk
apksigner sign --ks steamlink-test.jks --ks-key-alias steamlink-test \
  --out out/steamlink-test.apk out/steamlink-aligned.apk
apksigner verify --verbose out/steamlink-test.apk
```

Alignment precedes signing [W6, W7]. Use a consistent test key for all local variants. The APK alignment command does not fix native ELF segment alignment; build new ARM64 libraries for the device's page-size requirements.

**Installation gate:** a locally signed APK cannot normally update an installed copy signed with Valve's key [W8]. Do not automate uninstallation: it may remove app data. Use an appropriate test installation and preserve a recovery path first. Check whether the installed application requires additional split APKs. A baseline that cannot launch and enter XR is a packaging/signature/runtime-access problem, not a shader problem.

Do not change the package name as an incidental fix, replace `libc++_shared.so`, modify headset system files, or disable UBWC. First verify that the unmodified rebuild can connect and display PCVR.

## 3. Add an early-loading diagnostic shim

Create a small ARM64 NDK module, provisionally named `libsldither.so`. Keep Valve's renderer binary unchanged for the initial implementation. Prefer hooks at the GLES/OpenXR C ABI, rather than constructing Valve's private C++ objects or passing STL values across library boundaries.

A PLT hook library such as ByteHook is suitable for a prototype: its documented interface can restrict hooks to one caller library and handle libraries loaded later [W4]. This is a proposed integration mechanism, not a claim that it has been tested on this headset. Frida/Gadget is an alternative for investigation, but a small native module is the intended sustained-use implementation.

The manifest currently has no custom `Application` class. Add a bootstrap class, for example:

```text
smali/com/valvesoftware/steamlink/DitherApplication.smali
```

Set `android:name="com.valvesoftware.steamlink.DitherApplication"` on `<application>`. The class extends `android.app.Application`, calls `super.onCreate()`, and loads/initializes the diagnostic library before either activity starts. Include the hook library and its required initialization/dependencies. Handle late loading of `libvrlink_scene.so`; do not assume it already exists during application initialization. Keep the existing `NativeActivity` and its `vrlink_scene` metadata unchanged.

Start with a no-op shim. It must load without modifying shaders or GL state. Verify connection, both eyes, reconnection and app restart before proceeding.

### Diagnostic capture

Restrict interception to calls originating from `libvrlink_scene.so`. Capture:

- The return values and arguments of `xrEnumerateSwapchainFormats`, `xrCreateSwapchain`, and `xrEnumerateSwapchainImages`, associating each video swapchain with its GL textures.
- Complete shader source at `glShaderSource`, shader type, and a source hash. Record `glAttachShader` / `glLinkProgram` relationships to map source to program.
- Which program and framebuffer are used during the video `glDrawArrays` calls; query attachment format/colour encoding, framebuffer-sRGB state and blending state on representative draws.
- Decoder output format/metadata and `AHardwareBuffer_describe` where available. PRIVATE/opaque hardware-buffer formats may not expose full physical precision; do not treat an opaque result as proof of 8-bit or 10-bit decoding.

Respect `glShaderSource`'s count and per-string length arguments; do not assume every source is one NUL-terminated string. The supplied common compiler uses one string, but the wrapper should be robust.

Save shaders at launch, after PC connection, after resolution/foveation changes, and after reconnect. The supplied dispatch table routes shader ID **1** to the foveal object and **2** to the base object; confirm these relationships against actual draws rather than relying solely on IDs.

Store captures in app-private storage. Log only hashes and relevant state, not every frame or unrelated application data. Collect a log snapshot using:

```sh
adb logcat -d -v threadtime > out/steamlink-dither-log.txt
adb shell dumpsys SurfaceFlinger > out/surfaceflinger.txt
```

The SurfaceFlinger dump is supplemental; it does not replace in-process swapchain and shader tracing.

**Pass condition:** identify the active video fragment programs for both eyes and all active base/foveal layers, confirm the intended sRGB write path, and show that the shim sees replacements after reconnect.

## 4. Test precision independently of dithering

On the identified video shaders, preserve all original operations and test higher precision first:

```glsl
precision highp float;
// Preserve the existing sampler's name and uniform location.
layout(location = 2) uniform highp samplerExternalOES tex0;
```

This declaration reflects the fallback's existing location; use the actual live shader declaration when it differs. Do not introduce unsupported layout syntax into a shader that did not already support it.

Make sampled colour, colour-transform intermediates, final RGB and dither-coordinate arithmetic explicitly `highp`. Match vertex/fragment varying precision across the interface; a blind global replacement can change more than intended. Avoid assigning a low-precision texture result to a high-precision variable and assuming precision has been recovered. `samplerExternalOES` has a separate default precision of `lowp` [W3]; raising only `precision float` does not change that sampler default.

Do not claim that this necessarily changes actual device precision. Drivers can exceed minimum precision guarantees. Measure the precision-only variant before adding dither.

Keep the existing matrix, range handling, transfer handling, fade, UV remapping and foveation reconstruction unchanged. Ten-bit transport does not by itself establish HDR/PQ; do not add HDR tone mapping based only on bit depth.

## 5. Inject dither at the end of the existing video shader

Use a token-aware rewrite on **recognized video source hashes**, not a process-wide regular-expression replacement. Unknown shaders pass through unchanged and produce a single diagnostic message.

For a verified source, rename its `main` to a unique helper name and append a wrapper:

```glsl
void main()
{
    SL_originalMain();
    color.rgb = SL_ditherSrgb8(color.rgb);
}
```

`color` is the fallback's output variable; map the actual output for each captured source. This wrapper runs after the original colour/fade calculations, keeps alpha untouched and handles an ordinary early `return` inside the original main. Preserve `discard`, output declarations, `#version`, extension directives and uniforms. Unsupported source structures should remain unmodified rather than being guessed at.

Do not append a second dither when the active host-provided shader already performs final dithering. Identify and replace that particular operation, or select an explicitly undithered input path. The embedded fallback's old dither is commented out, but that does not establish the live shader's contents.

### Blue-noise resource

Use one fixed **128 × 128, single-channel, uniformly distributed blue-noise threshold tile**, stored as `GL_R8`, with one noise texel per output pixel. A 128² R8 tile occupies 16,384 bytes. Use an established void-and-cluster / blue-noise threshold asset or generate one offline. Verify that all 256 byte values are evenly represented; histogram balance alone is not proof of blue-noise spatial structure.

Set nearest filtering, base/max mip level 0, no mipmaps, and no sRGB decoding for the noise. The helper uses `texelFetch`, not filtered texture sampling. Start with a static tile, not time-dependent noise. NVIDIA discusses why blue-noise structure and subsequent filtering matter [W5]. The package does not include a noise tile; selecting/generating and validating that asset is an implementation task.

The companion `dither_srgb8.glsl` implements:

```glsl
uniform highp sampler2D u_SLBlueNoise;

highp vec3 SL_ditherSrgb8(highp vec3 cEncoded)
{
    highp ivec2 p = ivec2(gl_FragCoord.xy) & ivec2(127);
    highp float stored = texelFetch(u_SLBlueNoise, p, 0).r;
    highp float threshold = (stored * 255.0 + 0.5) / 256.0;
    highp vec3 scaled = clamp(cEncoded, 0.0, 1.0) * 255.0;
    return floor(scaled + vec3(threshold)) / 255.0;
}
```

This selects neighbouring output codes without averaging neighbouring image pixels. Exact black/white and neutral greys are preserved by the construction. A finite R8 threshold tile approximates unbiased stochastic rounding; for a uniformly repeated histogram, the residual mean-code error is at most 1/512 of an 8-bit code. This numerical property is covered by the included tests. Noise may still obscure very low-contrast detail.

### Colour-space preconditions

The helper expects the **final full-range RGB values in the encoding being written**. For the observed intended path, these are sRGB-encoded values written to `GL_SRGB8_ALPHA8` with automatic framebuffer sRGB conversion disabled. Confirm `GL_EXT_sRGB_write_control` is supported and the disable succeeded [W2]. Do not add another sRGB encode/decode pair merely because the attachment format contains `SRGB`.

A diagnostic write of encoded `0.5` with encoding disabled should read back near code 128 in that app-owned attachment. With linear-to-sRGB encoding enabled, linear `0.5` maps near 188. Read back before releasing the image to OpenXR, in a temporary diagnostic build only.

When tracing reveals a different live path, adapt explicitly:

- Linear shader output with automatic sRGB conversion enabled: encode to sRGB for quantization, decode the quantized result to linear, then let the attachment encode on write.
- A linear 8-bit destination: this is a different quantization target; do not label it sRGB or reuse this helper blindly.
- A later inaccessible runtime conversion: client-side dither remains experimental because subsequent filtering/requantization can suppress it.

## 6. Bind the resource safely, including after reloads

Maintain shader/program records scoped to the relevant EGL context/share group. After each successful link of a modified video program, locate the new uniform and select a genuinely unused texture unit. **Uniform locations and texture-unit numbers are different namespaces.**

The app writes several uniforms using hard-coded numeric locations, including video parameters around 2–13. Do not let the added sampler occupy a reserved location just because an original uniform optimized out. Audit the actual active shader and native writes; reserve a verified unused explicit location using the shader's supported mechanism, or verify that automatic allocation avoids every reserved slot. The helper's unqualified location is not an instruction to skip this audit.

Bind the R8 tile immediately before an identified video draw, using a dedicated sampler state, then restore any changed active texture, texture binding and sampler binding. Preserve blending, framebuffer-sRGB state, viewport, FBO, alpha and the original program. For controlled tests, save/disable/restore `GL_DITHER` around only the targeted draw so the explicit quantizer is isolated from implementation-defined fixed-function dithering.

Do not allocate GL resources from a loader thread without a current appropriate context. Create per-context/shared resources on the render thread and rebuild them after context loss. Remove stale records on shader/program deletion; a hot reload creates new program IDs.

Start with the same tile and phase in the two eyes' corresponding output coordinates. Apply the method to both base and foveal layers, preserving their original alpha. Test visible seams explicitly: the runtime may resample or blend these layers differently, so identical settings do not prove identical final noise.

### Failure behaviour

If rewriting, compilation, linking, uniform validation or resource setup fails, use the original shader unmodified and log the failure once. Retain original source strings for every modified shader. Intercept compilation/linking sufficiently to restore and recompile/relink the original before the app accepts a failed replacement. Avoid leaving a half-modified video pipeline running.

Include a local disable switch. Do not stop accepting host shader updates. Reapply the rewrite to recognized replacements and record which version/source hash is active.

## 7. Test in controlled stages

Prepare four variants using the same signing key and unchanged stream settings:

| Variant | Modification | Purpose |
|---|---|---|
| A | No-op shim, original rendering | Packaging/instrumentation control |
| B | Higher video-sampling/arithmetic precision only | Detect a precision bottleneck before quantization |
| C | B plus ordinary nearest 8-bit rounding | Isolate the quantization control |
| D | B plus static blue-noise quantization | Evaluate the proposed fix |

First synthesize a high-precision dark ramp **inside the final video shader, immediately before the quantizer**. This bypasses decoder/source uncertainty. Compare A/B/C/D in a pre-submission attachment capture and in the headset. Then restore streamed content and repeat with dark gradients, solid near-black patches, thin high-contrast lines, small text and saturated gradients.

Inspect both eyes, base/foveal transitions, fade-to-black, stationary viewing and slow head motion. Repeat after reconnect, render-resolution changes, foveation changes, pause/resume and context recreation. A modification that only works in the menu or before the host shader push is not complete.

Acceptance criteria:

- The correct active shaders remain patched after all lifecycle events.
- D visibly reduces contours compared with B/C without softening edges or adding objectionable grain/shimmer.
- Black level, brightness, colour and alpha/mask behaviour are not unintentionally changed.
- Both eyes and all active layers behave consistently; no new foveation seam appears.
- The GPU/frame-time distribution and missed-frame rate show no unacceptable regression. Remove diagnostic readbacks and per-draw logging for performance measurements; do not add a full-resolution extra framebuffer pass.

The relevant test hardware is the actual XR headset. A normal Android emulator cannot validate its compositor, optics or physical panel output. Android screenshots and cast/mirror output can also follow a different conversion path; do not treat them as final-panel evidence.

If the locally generated ramp is correctly dithered before submission but becomes banded only through the headset runtime, report that with the input/output captures and active formats. Increasing grain indefinitely is not an equivalent fix. If the local ramp improves but streamed scenes do not, investigate decoder sampling, pre-existing compression bands and the host-provided shader before altering the runtime hypothesis.

Only after static blue noise passes should spatiotemporal blue noise be considered as a separate experiment. Judge dark-scene shimmer and motion stability on the headset; do not assume temporal variation is better.

## 8. Deliverable structure

A finished implementation should contain approximately:

```text
native/
  bootstrap.cpp             # initialization; targeted, late-load-safe hooks
  shader_capture.cpp        # source/program tracking and diagnostics
  shader_rewrite.cpp        # recognized video shaders only; fail-open fallback
  dither_resources.cpp      # GL texture/sampler/context lifecycle
  gl_state_guard.h           # save/restore states touched by the shim
  dither_srgb8.glsl
assets/dither/
  blue_noise_128_r8.bin
smali/com/valvesoftware/steamlink/
  DitherApplication.smali
lib/arm64-v8a/
  libsldither.so
  <required hook-library dependencies>
```

Keep captures, native library hashes, shader source hashes and test results with the build. Do not distribute the extracted proprietary libraries as part of a standalone open-source helper project.

## Reference sources

[W1] Khronos OpenXR rendering / swapchain colour interpretation: `https://raw.githubusercontent.com/KhronosGroup/OpenXR-Docs/main/specification/sources/chapters/rendering.adoc`

[W2] Khronos `EXT_sRGB_write_control`: `https://registry.khronos.org/OpenGL/extensions/EXT/EXT_sRGB_write_control.txt`

[W3] Khronos `OES_EGL_image_external_essl3`, default sampler precision: `https://registry.khronos.org/OpenGL/extensions/OES/OES_EGL_image_external_essl3.txt`

[W4] ByteHook maintainer documentation, library-scoped PLT interception and late-loaded libraries: `https://github.com/bytedance/bhook`

[W5] NVIDIA, Rendering in Real Time with Spatiotemporal Blue Noise Textures, Part 2: `https://developer.nvidia.com/blog/rendering-in-real-time-with-spatiotemporal-blue-noise-textures-part-2/`

[W6] Android `apksigner`: `https://developer.android.com/tools/apksigner`

[W7] Android `zipalign`: `https://developer.android.com/tools/zipalign`

[W8] Android application signing and update identity: `https://developer.android.com/studio/publish/app-signing`
