# Background blue-noise route mapping

Inspection date: **2026-09-25**. This records a fresh read of all 3 exact decoded scene libraries for the requested background counterpart to foveal blue noise. It is input/layout evidence, not a claim that the new counterpart has passed production tests or run on a headset. No installed files, devices, host settings or production source were changed by this investigation.

## Separate background route

The background is the **opaque/base video layer**, including the portion underneath the foveal overlay. This is a layer selection, not a pixel mask that excludes the center of the base image.

`SRGBCorrectionPass` owns distinct Shader objects: opaque/base at object `+0x20`, masked/foveal at `+0x28`. `RenderSpecific(int eye, bool fovea, unsigned texture)` binds the appropriate program and uses separate `glDrawArrays(GL_TRIANGLE_STRIP, 0, 4)` call sites. The opaque branch requires the fovea argument to be false; it does not reuse the foveal call site.

| Exact base | Common prefix | Opaque 29-byte suffix | Masked 296-byte suffix | Background draw / return PC | Foveal draw / return PC |
|---|---:|---:|---:|---:|---:|
| 2.0.20 / 5001712 | `0x9b4b8` | `0x9d23d` | `0xa6582` | `0xf1d24 / 0xf1d28` | `0xf1c44 / 0xf1c48` |
| 2.0.22 / 5002244 | `0x957bc` | `0x976e6` | `0xa11d7` | `0xeeb40 / 0xeeb44` | `0xeea60 / 0xeea64` |
| 2.0.23 / 5002363 | `0x970a1` | `0x99013` | `0xa31bb` | `0xf1c80 / 0xf1c84` | `0xf1ba0 / 0xf1ba4` |

The opaque suffix is exactly `\n\t\t\tcolor.a = 1.0;\n        }\n`. Its SHA-256 is `93158a53e85fde1af61ce449f16c91b3b4213c93101cb98da42e5cc5bdca3f4c`. Concatenating the stock 1087-byte prefix and this 29-byte suffix, without their NUL terminators, produces 1116 bytes and SHA-256 **`871e528249132d814a3e1110ded3ff1a25e3f016bdddd1e16aa67a000d835246`** in each base. This is the complete stock background shader identity; the existing stock masked identity must remain separate.

[native-layouts.json](native-layouts.json) pins exact scene sizes/hashes, both source slots, constructor and full `RenderSpecific` function identities. Each slot's adjacent NUL boundaries were checked. Existing 616-byte renderer guards already cover both call sites, while the existing 29-byte opaque and 296-byte masked guards pin both source suffixes. The 5001712 input remains an analysis reconstruction, not pristine-source APK proof.

## Reuse and combination contract

The existing runtime rewrite operates on complete source strings at `glShaderSource`, so a new background quantizer does **not** need to fit into or enlarge the 29-byte opaque suffix. It can append the same highp final RGB quantization after the original shader body and preserve opaque alpha 1.0. The original foveal alpha expression must remain untouched.

Reuse the single scene import interception and helper dependency. Independent installers must not each overwrite the helper configuration: selecting both patches must merge their enabled layer set. Both selection orders need to produce the same helper and scene bytes. Reapplication, disabling either layer while keeping the other enabled, and disabling the final layer require explicit transition tests.

Runtime program classification must associate an accepted complete shader hash with **its own layer** and match that layer's verified draw return PC. Accepting any recognized shader together with any recognized PC would weaken isolation: a background program on a foveal caller, or vice versa, must leave quantization disabled. Unknown source, unknown caller and shader/resource failures retain the current fallback behavior.

The framebuffer conditions, uniform/sampler isolation, GL state restoration, context lifetime handling, static tile and RGB quantizer remain reusable. Both layers still require 8-bit sRGB attachments with automatic framebuffer sRGB conversion disabled. Quantize after the original color processing and fade; preserve alpha. Both declared input depths use the same operation and do not negotiate the codec.

For OLED combinations, keep the existing contract: both VD-like modes must be off. Guarded calibrated prefixes are hashed after OLED execution. Fovea-only must retain its prior visual operation, background-only must leave the foveal program undithered, and selecting both should process each layer once. Shared swapchain format sites are already the 8-bit output boundary; adding the second layer does not require a second format rewrite mechanism.

## Verification command map

This command map was recorded during the initial read-only investigation. The implementation and extended background/combined audits are now complete; see the [final validation report](README.md) for current results and reproduction commands. Existing fovea-only receipts alone do not prove the new counterpart.

From the repository root:

```powershell
& patches/src/main/cpp/blue_noise/Build-Native.ps1
& patches/src/main/cpp/blue_noise/Test-Native.ps1
& diagnostics/steamlink-5002363/Compile-CachedAudit.ps1 -JavaHome F:/Runtimes/Java21 -OutputDirectory build/background-blue-noise-kotlin
$auditCp = (Get-Content build/background-blue-noise-kotlin/runtime-classpath.txt -Raw).Trim()
& F:/Runtimes/Java21/bin/java.exe -cp $auditCp util.BlueNoiseDecodedAudit (Get-Location).Path
```

`Build-Native.ps1` intentionally replaces the canonical bundled `libgxd.so`; update and verify the production payload pin with that rebuild. `Test-Native.ps1` uses the retained Zig toolchain and writes only its build output. The cached Kotlin runner compiles all current production/tests, assembles extension resources and runs JUnit; its classpath includes canonical resources. It bypasses the unresolved Gradle plugin and is not a Gradle release result.

The existing Morphe audit invocation is:

```powershell
& F:/Runtimes/Java21/bin/java.exe -cp $auditCp util.BlueNoiseMorpheAudit `
  build/decoded-fixture-apks/decoded-apk-android-steamlinkvr-release-base-2.0.23-5002363.apk `
  build/background-blue-noise-morphe/fovea-regression 10-bit false blue-first
```

That invocation still selects the existing foveal patch. The extended audit accepts a 6th argument: `fovea`, `background`, `both-fovea-first`, or `both-background-first`. Use a fresh JVM and an absent/empty output directory for every exact base, depth declaration, optional OLED case and selection order. The final report records scene/helper bytes, payload inventory, manifest/DEX identity, input preservation and rejection of both VD-like OLED modes.

Bundle DEX verification uses `build/ci-d8-validation-20260915/D8Parity.java` with R8 9.1.31, Release mode and API26. Its arguments are current source JAR, output directory, Android library JAR and dependency classpath entries. Rebuild the current bundle/resources before invoking it; a prior bundle cannot validate changed native payload/configuration.

`util.PatchListGeneratorKt all` must run from the directory containing the current `build/libs/*.mpp` under the `patches` project. It loads the most recently modified `.mpp` and writes the 4 catalogs into that directory's parent. Use an isolated current staging bundle or ensure the selected project archive is current. The verified repository/branch for reference rendering at inspection time is `AngelDark92/steamlink-patches`, `dev`:

```powershell
python -X utf8 -B .github/scripts/generate_patches_readme.py AngelDark92/steamlink-patches dev patches-list-all.json TECHNICAL_REFERENCE.md
```

Check default-off metadata, exact compatibility and experimental-only placement for the new patch. The release workflow's normal gate remains `./gradlew :patches:test :patches:buildAndroid clean --no-daemon`; cached evidence must remain labeled separately if plugin resolution still blocks it.

The initial read-only investigation created only this report and `native-layouts.json`. Subsequent build/audit outputs and cleanup are recorded in the final report. Actual GPU compilation, rendering, layer coverage and visual quality remain runtime acceptance work.
