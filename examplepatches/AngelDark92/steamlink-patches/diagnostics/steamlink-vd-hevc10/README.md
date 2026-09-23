# VD HEVC 10-bit PCVR and the existing OLED options

Implemented and inspected **2026-09-22**. The user confirmed the comparison is inside
a PCVR game. This supersedes the old options' depth-dependent arithmetic noise and
shared-prefix `uvmask` weight. The separate blue-noise implementation is unchanged.

Follow-up: the [installed Windows Streamer audit](../steamlink-vd-streamer/README.md)
now traces **1.34.22.0** HEVC10/AV110 configuration and pre-encode gamma. That host
gamma is separate from the Android shader behavior described here. It does not
identify an additional client dithering function to port; these options remain a
VD-informed SDR comparison, not an exact host/decoder/compositor reproduction.

## What VD does, and what can be matched

The supplied VD **1.34.18.0/10683** uses HEVC10 as a codec choice, with the same SDR
video processing as its 8-bit path: decoder output import, range-aware YUV→RGB,
optional sharpening, and 8-bit sRGB color output. Its traced PCVR shaders have no
depth-specific noise, gamma boost, or saturation boost. HDR desktop tone mapping
is a different path. Driver dithering is not the same as explicit shader noise;
no difference in GL_DITHER enable state was established between these clients.

See [the complete VD trace](VD-HEVC10-PATH.md), including primary documentation and
the developer's HEVC10 encoder announcement. The PC Streamer's capture/encoder code
is not in the supplied Android APK. Neither the lack of shader noise nor the user's
smooth gradients identifies every upstream/downstream processing stage.

Steam Link's external sampler already returns converted RGB; copying VD's manual
YUV conversion would convert the wrong input. Steam Link also requests
LINEAR/BT2020/FULL/P010 decoder metadata, unlike VD's traced setup. Valve's existing
matrix resembles a correction between YUV conversion bases. It is retained;
its exact intent and actual decoder/import output remain unmeasured.

## Implemented behavior

The existing `OLED color calibration` options retain their keys, titles, defaults,
and exact compatibility: **2.0.20/5001712**, **2.0.22/5002244**, **2.0.23/5002363**.

| Selection | Foveal RGB | Base RGB | Output |
|---|---|---|---|
| Both options off | Existing chosen calibration | Existing chosen calibration | 8-bit sRGB |
| `foveaVdLike10Bit` | Highp sample → Valve correction → clamp → fade; no added gamma/saturation/noise | Existing chosen calibration | 8-bit sRGB |
| `foveaVdLike8Bit` | Identical processing to the 10-bit option | Existing chosen calibration | 8-bit sRGB |

Select the option matching the intended host input. These are declarations, not
codec negotiation controls. Both cannot be selected together. Leave both off when
using the separate blue-noise patch. Existing saved enabled options now select this
revised behavior; default both-off behavior remains byte-identical.

The implementation keeps the calibrated common prefix unchanged and overrides RGB
only in the **separate masked/foveal suffix**, after the earlier calibration result.
The opaque/base program remains byte-identical. The final RGB write explicitly
bypasses added gamma/saturation/noise; Valve's alpha expression retains every token
and operation. No GL state, host setting, decoder metadata, texture filter, native
executable instruction, or additional payload changes.

`VdSdrFoveaPatchHelper.kt` changes the 296-byte suffix at `0xa6582`, `0xa11d7`, or
`0xa31bb`, respectively. It checks the exact pair/size, known original-or-patched
suffix, surrounding NUL boundaries, original opaque suffix, and independently hashed
constructor/renderer functions before copying. Reapplication is idempotent; OFF
restores the original suffix; unsupported version pairs remain unchanged.

The [installed host investigation](HOST-SHADER-PATH.md) traces SteamVR **2.17.10 beta,
build 25330290**: optional remote shader replacement is disabled in the inspected
configuration, and the override files are absent. This supports the embedded path's
use in normal streaming on that host. Enabled custom shader overrides can bypass
this modification; no live shader submission was captured.

## Validation

| Check | Result and boundary |
|---|---|
| [Current Kotlin/JUnit](kotlin-validation.txt) | **115/115**, none skipped; cached toolchain |
| [Real decoded bases](decoded-validation.txt) | **3/3**; each 63 precision/dither variants, 567 transitions, 126 historical checkbox cases and 21 current VD toggle cases |
| New foveal guard tests | All 3 actual inputs; exact suffix-only differences, unchanged base, original alpha tokens, 8/10 equality, reversible transitions and atomic corruption rejection |
| Morphe fixture APKs | **6/6**: each base × both input declarations; exact production output, 113 other entries unchanged including manifest/DEX, no entries added, source fixture unchanged |
| [Complete shader assembly](shader-assembly.txt) | Both real suffixes assembled with current production prefix for all 3 bases |
| [Strict/offline GLSL](shader-syntax-validation.json) | **12 diagnostic ES310 stage pairs link**; opaque byte equality and 8/10 source equality verified. Production ES300 retains Valve's pre-existing standalone-uniform-location dialect, rejected by the strict compiler for baseline and revised sources alike |
| [Bundle/resources and D8](bundle-validation.json) | Current local JAR/resources and **Release/API26 DEX** pass; canonical blue-noise payload unchanged |
| Catalogs/reference | Regenerated from current compiled bundle; only OLED metadata differs across all 4 catalogs |
| [Blue-noise preservation](blue-noise-preservation.json) | **50/50 files byte-identical**, including its code, payload, tests and diagnostics; catalog entry unchanged |
| [Blue-noise decoded regression](blue-noise-regression.txt) | All 3 bases still pass their existing production-helper audits |
| [Combined OLED-off/blue-noise Morphe regression](blue-noise-morphe-regression.txt) | 5002363 passes with exact expected scene/helper bytes |
| Independent cavecrew review | No actionable findings |

Morphe receipts are `morphe-<build>-<8-bit|10-bit>.txt` beside this file. These use
decoded-fixture APKs, **not pristine-source installation proof**; the 5001712 input
is an analysis reconstruction. No APK was installed, and no device/SteamVR state was
changed. [Normal Gradle](gradle-validation.txt) still cannot resolve
`app.morphe.patches:1.3.3`. Cached checks do not imply a successful Gradle release.

Production GPU compilation, effective decoder/import precision, live GL state,
both-eye rendering/seams, and visible banding improvement remain untested. This is
a VD-informed SDR client correction, **not an end-to-end clone of VD or a proven
banding fix**.

## Reproduction

From the repository root, with the existing cached dependencies:

```powershell
& diagnostics/steamlink-5002363/Compile-CachedAudit.ps1 -JavaHome F:/Runtimes/Java21 -OutputDirectory build/vd-sdr-kotlin-repro
$auditCp = (Get-Content build/vd-sdr-kotlin-repro/runtime-classpath.txt -Raw).Trim()
& F:/Runtimes/Java21/bin/java.exe -Xmx1g -cp $auditCp util.OledDecodedCompatibilityAudit (Get-Location).Path
& F:/Runtimes/Java21/bin/java.exe -cp $auditCp util.Sdr10ShaderAssembleAudit (Get-Location).Path build/vd-sdr-glsl
python -X utf8 diagnostics/steamlink-vd-hevc10/validate_shader_syntax.py
& F:/Runtimes/Java21/bin/java.exe -Xmx1g -cp $auditCp util.VdSdrMorpheAudit build/decoded-fixture-apks/decoded-apk-android-steamlinkvr-release-base-2.0.23-5002363.apk build/vd-sdr-morphe-repro/5002363-10-bit 10-bit
```

The assembly/Morphe output directory must be absent or empty. Repeat the last
command in a fresh JVM for both declarations and each exact fixture. The syntax
script reads `build/vd-sdr-glsl`; both-stage ES310 promotion is diagnostic only.
Bundle DEX validation uses the retained `build/ci-d8-validation-20260915/D8Parity.java`
with R8 9.1.31, API26 minimum and the cached compiler classpath; catalog generation
uses `util.PatchListGeneratorKt`, followed by the existing reference generator.

## Artifact lifecycle

Compact reports and source hashes are retained here. The earlier automatic approval
review blocked recursive and individually inspected deletion with **"blocked by policy"**.
No alternate deletion route was attempted. Newly generated disposable validation
outputs total **1,173,911,723 bytes / 1,072 files**; cleanup is deferred in
[cleanup.json](cleanup.json). Earlier blue-noise outputs and all 50 protected files
were preserved. The allowlist excludes exact decoded inputs, fixture APKs, tools,
authoritative code/resources and evidence needed to reproduce the results.
