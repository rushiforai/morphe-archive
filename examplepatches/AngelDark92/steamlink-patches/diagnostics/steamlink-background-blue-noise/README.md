# Separate background and foveal blue-noise patches

Implemented and locally validated on 2026-09-25. This extends the separate blue-noise implementation; the VD-like OLED options are unchanged. It does not claim to reproduce Virtual Desktop's algorithm.

## Selection and behavior

| Selection | Explicit blue-noise quantization |
|---|---|
| Foveal blue-noise dithering (experimental) | Only the masked foveal draw |
| Background blue-noise dithering (experimental) | Only the opaque background/base draw |
| Both patches | Each matching layer independently |
| Neither patch | No blue-noise helper |

Both patches are default-off, outside recommended bundles, and expose the same `inputDepth` choices: **8-bit** or **10-bit**, default **10-bit**. Output is always **8-bit sRGB**. The choice declares the intended input; it does not negotiate the host codec. Both depths use the same original 128x128 static tile and final RGB quantizer:

```text
t = (tileByte + 0.5) / 256
rgb = floor(clamp(rgb, 0, 1) * 255 + t) / 255
```

Quantization follows the original shader's color processing and fade. Alpha is preserved. The background is the entire opaque base projection, including the area underneath the foveal overlay; it is not restricted to a visible peripheral ring.

The original foveal quantizer, tile, generator and numerical evidence are preserved. The shared native helper now recognizes each layer by its complete shader hash and its own verified draw callsite. A recognized shader at the other layer's callsite does not enable quantization. Unknown shaders, ambiguous matches, shader/resource failures and unsupported framebuffer state retain the guarded fallback. Selecting both patches merges their helper configuration in either order.

When combining with OLED calibration, leave both VD-like input options off. Start from the original supported APK when changing patch selections. Older configured blue-noise helper binaries are rejected rather than silently migrated. Helper-level removal transitions are audited; deselecting a patch in a patcher UI does not undo an already modified APK.

## Exact compatibility

| Steam Link version | Build code | Background draw return PC |
|---|---|---|
| 2.0.20 | 5001712 | `0xf1d28` |
| 2.0.22 | 5002244 | `0xeeb44` |
| 2.0.23 | 5002363 | `0xf1c84` |

Sizes, SHA-256 identities, shader locations and caller evidence are in [native-layouts.json](native-layouts.json) and [NATIVE-INTEGRATION-EVIDENCE.md](NATIVE-INTEGRATION-EVIDENCE.md). Build 5001712 is an analysis reconstruction. These checks do not establish a pristine-source APK result.

## Validation results

| Check | Result / evidence |
|---|---|
| Current production/test compilation using cached dependencies | **119/119 JUnit tests pass**, [log](kotlin-validation.txt) |
| Native stateful GL/EGL doubles | **16/16 pass**, layer isolation, state restoration and fallback; [log](native-validation.txt) |
| Actual decoded native libraries | **3/3 bases pass**, each with 72 layer/depth cases, 528 transitions and 108 atomic rejections; [log](decoded-validation.txt) |
| Existing foveal decoded audit | **3/3 bases pass**, [log](foveal-regression.txt) |
| Actual Morphe finalize and unsigned fixture packaging | **13/13 cases pass**, background-only, both selection orders, OLED combinations and foveal regression; [receipt](morphe-validation.json) |
| Offline GLSL | **6 diagnostic ES310 pairs + 1 isolated ES300 quantizer pass**, [receipt](shader-syntax-validation.json) |
| Current local bundle | Release/API26 D8 passes; [log](d8-validation.txt), [hash receipt](bundle-validation.json) |
| Preservation | Original quantizer/tile unchanged; only layer patch catalog metadata changed; [receipt](preservation-validation.json) |

Strict ES300 validation rejects Valve's existing explicit-uniform-location dialect in both original and generated full shaders. The diagnostic ES310 checks are syntax evidence, not production-driver acceptance. Native tests use doubles, not a GPU. No APK installation, Android linker execution, live shader coverage, headset test, compositor precision or visual banding improvement is claimed.

The normal offline Gradle build remains blocked because `app.morphe.patches:1.3.3` cannot resolve ([log](gradle-validation.txt)). Cached compilation and D8 are separate evidence, not a normal Gradle release.

The retained [local validation bundle](../../build/background-blue-noise-package/patches/build/libs/patches-1.18.0-background-blue-noise-local.mpp) has SHA-256 `fdb7daf9608ba3d5f074aa1551bbf193177b440f8255d373ea4cb7681a8ddf34`. It is an MPP patch bundle, not an installed/signed APK or published release.

## Reproduction

Run from the repository root with the retained NDK, Zig, Java and cached dependencies:

```powershell
$env:ZIG_GLOBAL_CACHE_DIR = Join-Path (Get-Location) 'build/zig-cache-background'
$env:ZIG_LOCAL_CACHE_DIR = Join-Path (Get-Location) 'build/zig-local-background'
& patches/src/main/cpp/blue_noise/Build-Native.ps1 -OutputDirectory build/background-blue-noise-native
& patches/src/main/cpp/blue_noise/Test-Native.ps1
& diagnostics/steamlink-5002363/Compile-CachedAudit.ps1 -JavaHome F:/Runtimes/Java21 -OutputDirectory build/background-blue-noise-kotlin
$auditCp = (Get-Content build/background-blue-noise-kotlin/runtime-classpath.txt -Raw).Trim()
& F:/Runtimes/Java21/bin/java.exe -cp $auditCp util.BackgroundBlueNoiseDecodedAudit (Get-Location).Path
& F:/Runtimes/Java21/bin/java.exe -cp $auditCp util.BlueNoiseDecodedAudit (Get-Location).Path
& F:/Runtimes/Java21/bin/java.exe -cp $auditCp util.BlueNoiseMorpheAudit `
  build/decoded-fixture-apks/decoded-apk-android-steamlinkvr-release-base-2.0.23-5002363.apk `
  build/background-blue-noise-morphe/example 10-bit false blue-first background
& build/tooling/zig/ziglang/zig.exe c++ -std=c++17 -O2 patches/src/main/cpp/blue_noise/tests/rewrite_cli.cpp -o build/background-blue-noise-native/rewrite.exe
python -B diagnostics/steamlink-background-blue-noise/validate_shader_syntax.py --glslang build/blue-noise-glsl/bin/glslang.exe --rewriter build/background-blue-noise-native/rewrite.exe --output build/background-blue-noise-glsl
python -B diagnostics/steamlink-background-blue-noise/package_cached.py
```

Use a fresh JVM and empty output directory for each Morphe case. Its final argument accepts `fovea`, `background`, `both-fovea-first`, or `both-background-first`; the preceding argument controls OLED ordering. The [Morphe receipt](morphe-validation.json) lists the validated matrix. Native rebuilds replace the canonical payload; verify its SHA pin before using a rebuilt bundle. Catalog generation must use the current bundle in its isolated staging directory; preserve existing channel choices.

Temporary output ownership and cleanup are recorded in [cleanup.json](cleanup.json) and [WORKSPACE_CLEANUP.md](../../WORKSPACE_CLEANUP.md). Exact inputs, canonical source/payloads, toolchains, compact evidence and the current local MPP are retained.
