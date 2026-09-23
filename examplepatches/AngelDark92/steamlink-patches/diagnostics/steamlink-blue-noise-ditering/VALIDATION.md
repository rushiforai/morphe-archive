# Blue-noise implementation validation — 2026-09-22

Implemented **Foveal blue-noise dithering (experimental)** as a separate, default-off
patch. It is absent from recommendation bundles and the stable catalog. Both declared
input depths run the same quantizer; projection output is always 8-bit sRGB. Exact
supported pairs are **2.0.20/5001712**, **2.0.22/5002244**, and **2.0.23/5002363**.

The existing OLED/VD-like patch's shader generation, options and defaults are unchanged.
Only its descriptions/comments were corrected after the [decoded VD verification](virtualdesktop-verification.md):
its colour operations differ from VD, its 8-bit mode disables arithmetic dithering, and
its common-prefix `uvmask` weight does not isolate the foveal layer.

## Completed checks

| Evidence | Result | Boundary |
|---|---|---|
| [Exact decoded inputs](decoded-validation.txt) | 3/3 bases; each 24 cases, 72 transitions and 34 atomic guard rejections | Production helpers on real native bytes; inputs unchanged |
| [Morphe execution and packaging](morphe-validation.json) | 12/12 cases: each base, both input declarations, independent and combined with OLED; both selection orders covered | Actual patch DSL/finalize; unsigned decoded-fixture APKs, not pristine-source installation proof |
| APK content comparisons | Only scene mutations and 1 added helper; original manifest, DEX and all other entries byte-identical | Includes final shader-hash configuration after optional OLED calibration |
| [Kotlin compilation/JUnit](kotlin-validation.txt) | 109/109 tests | Cached Kotlin/Morphe dependencies; ordinary Gradle plugin resolution failed |
| [Native contract tests](native-validation.txt) | 13/13 groups | Stateful fake GL/EGL; real production C++ logic, simulated driver responses |
| [Original tile and arithmetic](../../patches/src/main/cpp/blue_noise/noise_validation.json) | Deterministic regeneration; all 256 byte values occur 64 times; 90 calibrated/faded input-ramp cases and 65,537 fractional samples | Maximum mean error 1/512 of an output code; endpoints, adjacency, monotonicity and spatial spectrum checked |
| [ARM64 payload](native-payload-validation.json) | API 29 / NDK 27.2.12479018; 16 KiB-aligned ELF; exactly 10 helper exports | Static C++ symbols hidden; real GLES/EGL dependencies retained; no replacement libc++_shared |
| [Bundle and Android DEX](bundle-validation.json) | JAR/resources plus D8 Release/API26 pass; packaged helper matches canonical resource | Local validation bundle, not a Gradle/release publication |
| Generated catalogs/reference | 25 patches in all/experimental; 24 stable; final compiled-source catalog bytes match | Only experimental catalogs contain blue noise; defaults/bundle membership unchanged |
| [GLSL syntax/interface checks](shader-syntax-validation.json) | 3 diagnostic ES310 stage pairs link; isolated quantizer compiles under ES300 | Production stock/modified ES300 sources both fail strict validation on inherited standalone-uniform locations |
| Independent cavecrew review | No outstanding actionable findings | Static review; does not substitute for device acceptance |

Final canonical helper SHA-256:
`f9951b536fa24198799af6778165cbb53951ce0b9d49afa923e4384c9738f602`.
Tile SHA-256:
`bd714ed8957aa7dd2ba2aada91484e487e17322e68d96ac91be48ba4c59e77f5`.

## What remains unproven

- The 5001712 decoded input is an analysis reconstruction. All 12 packaging checks use
  decoded-fixture APKs; none is claimed as a pristine-source, signed installation result.
- `app.morphe.patches:1.3.3` still fails normal Gradle plugin resolution locally. The
  cached compile/tests, D8 and fixture patcher gates are recorded separately.
- No APK installation, ADB, headset, SteamVR change or restart was performed. Android
  symbol resolution, GLES driver compilation, actual 8-/10-bit decoder sampling,
  both-eye appearance, seams, GPU cost, compositor processing and panel quality remain untested.
- Exact known masked shader hashes are supported, including recognized reloads. Unknown
  live host shader replacements pass through unchanged; they need capture/audit before
  coverage can be claimed. The original program is restored if injection fails.
- Valve's embedded ES300 uniform-location dialect is preserved. Diagnostic promotion
  of both stages to ES310 was **only** an offline syntax check. Production GPU compilation
  is not proven by it; [the implementation guide](README.md#strict-offline-shader-check)
  records the specification boundary.

## Reproduction and cleanup

Use the commands in [README](README.md#canonical-sources-and-reproduction). The local packaging check used
the cached compiler runner, `D8Parity.java` with R8 9.1.31, and the production
`PatchListGeneratorKt` followed by `.github/scripts/generate_patches_readme.py`.
The native helper is retained as a canonical resource because release CI does not
rebuild native payloads.

Temporary APKs, local bundles, native/test/Kotlin outputs, staged shaders and the scoped
NumPy environment were allowlisted for removal after these compact receipts were saved.
Exact decoded inputs, fixture APKs, existing tools, canonical source/tile/helper and
unrelated diagnostics are preserved. Cleanup was blocked by automatic approval review (reason: "blocked by policy"),
including the inspected non-recursive deletion attempt. **0 bytes reclaimed;
5,838 temporary files / 4,191,411,166 bytes remain.** This is deferred until the
reviewed task-created outputs can be removed. The allowlist is in [cleanup.json](cleanup.json)
and [WORKSPACE_CLEANUP.md](../../WORKSPACE_CLEANUP.md).
