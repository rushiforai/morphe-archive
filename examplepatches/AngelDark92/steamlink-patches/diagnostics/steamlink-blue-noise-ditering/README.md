# Foveal blue-noise output dithering

Implemented 2026-09-22 as the separate, **default-off** Morphe patch **Foveal blue-noise dithering (experimental)**. Select it explicitly; it is not included in the recommended bundles. It accepts declared **8-bit or 10-bit input** and uses the same final **8-bit sRGB output quantizer** for both. The declaration does not negotiate a codec, change decoder precision, or turn an 8-bit source into a 10-bit source.

The quantizer operates only on the recognized **foveal video layer**, for both eyes. The base-layer draw is excluded. It uses a fixed 128 × 128 R8 blue-noise tile in the existing video draw, after the original colour processing and fade, without an extra image pass. Sampling and arithmetic use high precision before quantization; the original foveal alpha/mask is preserved.

This README supersedes conflicting scope in the historical [implementation plan](implementation_plan.md), which proposed modifying both layers. [Native integration evidence](NATIVE-INTEGRATION-EVIDENCE.md) and [per-base layouts](native-layouts.json) record the actual implementation boundaries.

## Exact supported inputs

| Version name | Version code | Evidence limitation |
|---|---:|---|
| 2.0.20 | 5001712 | The available decoded input is an analysis reconstruction, not a pristine installable APK. |
| 2.0.22 | 5002244 | Exact decoded native layout is pinned independently. |
| 2.0.23 | 5002363 | Exact decoded native layout is pinned independently. |

These are exact version/build pairs. They do not imply support for other builds sharing the version name. Scene size, import slots, shader boundaries, native-route hashes, and original/already-patched states are checked before the helper is configured. Unknown supported-base layouts or mixed modification states fail closed.

At runtime, the helper requires an exact complete masked/foveal shader hash and the verified foveal `glDrawArrays` return address. It recognizes the stock masked shader and the particular configured masked shader produced during patching. The opaque/base shader and unknown host-provided replacements pass through unchanged. This also applies after reconnects and shader reloads: interception continues, but an unknown replacement is deliberately **not dithered**. Live host-shader coverage remains an acceptance gap.

The draw additionally requires the expected 8-bit sRGB attachment, disabled automatic framebuffer sRGB conversion, compatible blending, and valid program/resource bindings. Failure leaves explicit quantization disabled; shader compilation/link/resource setup failures restore the original shader/program.

## OLED calibration and Virtual Desktop

The existing OLED patch and its older VD-like controls keep their previous behavior. They have not been silently replaced by this experiment.

The new patch works independently with the stock colour pipeline. To combine it with OLED calibration, leave **Fovea VD-Like Input 10 bit** and **Fovea VD-Like Input 8 bit** both **off**. Either existing VD-like mode causes the combination to be rejected, preventing stacked dithering or an ambiguous shader transformation. OLED calibration runs before the new patch's finalization, so recognized calibration/fade results are quantized afterward.

The fresh [Virtual Desktop verification](virtualdesktop-verification.md) does **not** establish that VD uses this blue-noise method, or that the old Steam Link arithmetic dither reproduces VD. The inspected VD 1.34.18.0/10683 video shaders contain no explicit noise texture or output quantizer. Their 8-bit sRGB output boundary is a shared finding, including the traced 10-bit codec route. Any driver/runtime/display dithering remains unmeasured. The legacy control names are not evidence of matching algorithms.

## Quantizer and numerical evidence

For each RGB component, after colour processing and fade:

```text
threshold = (noise_byte + 0.5) / 256
output = floor(clamp(encoded_rgb, 0, 1) * 255 + threshold) / 255
```

Both input declarations use this formula. An exact 8-bit code remains unchanged; interpolation, calibration, and fade can create fractional values even from an 8-bit source. A 10-bit source can retain fractional output-code information until this final boundary. No decoder precision is inferred from the option label.

The original deterministic void-and-cluster tile contains 16,384 bytes, with each of the 256 values occurring 64 times. Its SHA-256 is `bd714ed8957aa7dd2ba2aada91484e487e17322e68d96ac91be48ba4c59e77f5`. It is static, uses nearest texel access, and has no frame-dependent noise phase.

The [numeric/spatial receipt](../../patches/src/main/cpp/blue_noise/noise_validation.json) covers 90 calibrated/faded 8-/10-bit ramp cases and 65,537 fractional samples. The ideal finite-threshold maximum mean error is **1/512 of an 8-bit code** over the complete balanced tile. Endpoints, exact-code preservation, monotonicity, adjacent-code selection, R8 threshold decoding, and UNORM8 output round-tripping passed. This average bound is not a guarantee for every small image region or after compositor filtering.

Low-frequency intensity power is approximately `0.0000639` of a deterministic shuffled tile with the same histogram. Threshold-mask ratios are approximately `0.0153–0.0612`; these masks test the actual binary rounding decisions, not histogram balance alone.

## Canonical sources and reproduction

- [Native helper and shader rewrite](../../patches/src/main/cpp/blue_noise/) contain the generator, tile, wrapper, and host tests.
- [Morphe patch](../../patches/src/main/kotlin/app/template/patches/steamlink/binary/BlueNoisePatch.kt), [guarded installer](../../patches/src/main/kotlin/app/template/patches/steamlink/binary/BlueNoisePatchHelper.kt), and [exact layouts](../../patches/src/main/kotlin/app/template/patches/steamlink/binary/BlueNoiseLayouts.kt) own APK mutation and configuration.
- The packaged native input is [libgxd.so](../../patches/src/main/resources/steamlink/blue-noise/libgxd.so). Release workflows package this resource; they do not rebuild it. Preserve it with its sources and verified integrity pin.

From the repository root, using the existing Android NDK and host Zig toolchain:

```powershell
& patches/src/main/cpp/blue_noise/Build-Native.ps1
& patches/src/main/cpp/blue_noise/Test-Native.ps1
```

`Build-Native.ps1` defaults to NDK `27.2.12479018`, targets ARM64/API 29 with 16 KiB ELF segment alignment, and copies its result into the canonical resource path. An intentional source/toolchain change can change the payload hash: review the resulting payload and update its integrity pin together with the evidence before packaging. Do not bypass the pin.

To regenerate and verify the numerical asset without changing global Python packages:

```powershell
python -m venv build/blue-noise-tools
& build/blue-noise-tools/Scripts/python.exe -m pip install numpy==2.3.3
& build/blue-noise-tools/Scripts/python.exe patches/src/main/cpp/blue_noise/generate_noise.py --check
```

The existing cached Kotlin runner compiles current production/test sources and executes JUnit. It requires the cached compiler and dependencies documented in [the runner's guide](../steamlink-5002363/README.md). Adjust the JDK path for the local machine:

```powershell
& diagnostics/steamlink-5002363/Compile-CachedAudit.ps1 -JavaHome F:/Runtimes/Java21 -OutputDirectory build/blue-noise-kotlin
$auditCp = (Get-Content build/blue-noise-kotlin/runtime-classpath.txt -Raw).Trim()
& F:/Runtimes/Java21/bin/java.exe -cp $auditCp util.BlueNoiseDecodedAudit (Get-Location).Path
```

[BlueNoiseDecodedAudit](../../patches/src/main/kotlin/util/BlueNoiseDecodedAudit.kt) exercises the production helper against the actual decoded libraries, with stock and optional dither-off calibration cases, both declarations, transitions, idempotence, exact byte differences, and negative guards. Its current [decoded validation receipt](decoded-validation.txt) reports 3 exact-base passes. The 5001712 reconstruction limitation still applies.

[BlueNoiseMorpheAudit](../../patches/src/main/kotlin/util/BlueNoiseMorpheAudit.kt) is the separate runner for actual Morphe DSL/finalize execution and unsigned fixture packaging. Each invocation needs a fresh JVM and an absent or empty output directory. Example invocation; the completed cases are recorded in [the final validation receipt](VALIDATION.md):

```powershell
& F:/Runtimes/Java21/bin/java.exe -cp $auditCp util.BlueNoiseMorpheAudit `
  build/decoded-fixture-apks/decoded-apk-android-steamlinkvr-release-base-2.0.23-5002363.apk `
  build/blue-noise-morphe-repro/5002363-10bit-plain 10-bit false blue-first
```

Repeat explicitly for each requested exact base, `8-bit`/`10-bit`, and optional OLED combination/order. These fixture APKs are decoded-tree audit inputs, not pristine-source or installation proof. The final validation receipt records which packaging cases actually ran.

## Disable switch and remaining validation

The helper reads Android property `debug.steamlink.blue_noise` when a shader is submitted. A value of `0` leaves that shader unchanged. **Restart the app or trigger a shader reload after changing it**; this is not a per-frame toggle for an already-linked program. No device command or restart is part of the host validation above.

The native suite currently passes **13/13** test groups using stateful GL/EGL test doubles. It checks interception, exact-source/caller guards, fallback paths, texture/unpack/sampler/dither state restoration, and context sharing/reuse/destruction. These checks simulate compile/link outcomes; they do not prove Android GPU compilation or rendering.

The cached Kotlin route bypasses the unresolved `app.morphe.patches:1.3.3` Gradle plugin resolution gap. It is not a successful Gradle release build. Numerical tests, decoded-byte checks, native builds, host test doubles, offline shader validation, and any fixture packaging receipts must remain separate evidence categories.

Actual decoder sample precision, Android linker behavior, live host shader recognition, both-eye rendering, foveal seams, GPU/frame timing, compositor behavior, and headset/panel quality remain runtime acceptance work. No installation, ADB/device test, headset run, or panel-precision proof is claimed here. Remove disposable `build/blue-noise-*` compiler/test outputs after retaining compact receipts; preserve canonical payloads, exact bases, fixture APKs, and required tooling under the repository's [cleanup rules](../../WORKSPACE_CLEANUP.md).

## Strict offline shader check

Valve's embedded `#version 300 es` source already uses standalone-uniform location
qualifiers that strict ES 3.00 rejects. The production helper preserves that source
dialect and restores the original on compile/link failure; actual headset driver
acceptance remains unverified. Updating only the fragment to ES 3.10 would create a
vertex/fragment version mismatch, so production versions are not changed here.

The [syntax receipt](shader-syntax-validation.json) records the strict original and
modified ES 3.00 failures. It separately verifies all 3 full shader pairs after promoting
**both stages only in diagnostic copies** to ES 3.10, plus the isolated production
quantizer arithmetic under standards-compliant ES 3.00. These are syntax/interface
checks, not production driver-compilation proof. See Khronos [ES 3.00 section 4.3.8.3](https://registry.khronos.org/OpenGL/specs/es/3.0/GLSL_ES_Specification_3.00.pdf)
and [ES 3.10 sections 1.5 and 4.4.3](https://registry.khronos.org/OpenGL/specs/es/3.1/GLSL_ES_Specification_3.10.pdf).

Reproduce with `validate_shader_syntax.py --glslang <glslang.exe> --rewriter <rewrite-cli.exe> --output <new-directory>`.
Build the CLI from `patches/src/main/cpp/blue_noise/tests/rewrite_cli.cpp` with a C++17
host compiler. The retained official Khronos compiler is `build/tooling/bin/glslang.exe`
(version 16.6.0, SHA-256 `63eb8a7dd8a059110bc38fcc33ae0f7954a9219763913a95d50038ec56d66cfe`).
