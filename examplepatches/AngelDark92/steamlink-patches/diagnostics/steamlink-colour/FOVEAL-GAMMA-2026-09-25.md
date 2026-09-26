# Foveal gamma adjustment — 2026-09-25

The user reports a lighter square around the fovea with both VD input options and
with both off. This change adds manual compensation; it does not identify the
cause of that boundary or establish a headset fix.

## Control and behavior

`OLED color calibration` now exposes **Foveal gamma adjustment** (`fovealGamma`):
default **1.00**, range **1.00–1.30**, step **0.01**. Start at **1.02** for a modest
darkening and evaluate the same dark scene. 1.00 restores the previous shader bytes.

- Both VD options off: apply the extra exponent to the clamped calibrated RGB.
- Either VD option on: apply it to the clamped Valve-matrix-corrected sample.
- In every case: apply the exponent before fade, preserving black/white endpoints.
  The optional blue-noise wrapper quantizes after this adjustment.
- The common prefix, complete background program, alpha operations/constants/order,
  swapchain formats, decoder settings and projection topology stay unchanged.
- This is an additional curve after the selected RGB processing, not a replacement
  for the profile gamma. With saturation processing, it is not generally equivalent
  to multiplying the profile's gamma. It need not correct an additive black-level offset.

The production mutation fits the existing 296-byte masked suffix. Neutral settings
retain the exact previous stock/VD suffixes. Adjusted variants shorten alpha variable
names only; tests compare the normalized token sequence against Valve's original.
All supported suffix states are recognized exactly, so changing the slider, changing
VD modes and returning to neutral remain idempotent and reversible. Unknown suffixes,
out-of-range/nonfinite exponents and incompatible prefixes fail before writing.

Both blue-noise layers accept the new OFF+gamma suffix with the exact calibrated
prefix; the existing exclusion of VD modes remains. The complete configured foveal
source hash is refreshed, while background configuration stays unchanged. The native
blue-noise payload was not rebuilt or changed.

## Exact bases and live-path boundary

| Exact base | Native SHA-256 | Masked suffix |
|---|---|---|
| 2.0.20/5001712 | `80b62797c7e26d6b67b0cca00693b076a336bdb48ebc1383a16cccb1616ed495` | `0xa6582` |
| 2.0.22/5002244 | `4b2fa5e1b5d9d5c938873f692b0e5e18159e1199dee1253dd6eccc8fa43dfa12` | `0xa11d7` |
| 2.0.23/5002363 | `628821feab199d7712be8a51273eb9a21ec440a7c91aa6a768cc7307a4fe22f0` | `0xa31bb` |

These are the existing exact adaptations. Constructor and RenderSpecific function
hashes preserve the separate masked/foveal `+0x28` and opaque/background `+0x20`
shader route. Unknown exact pairs remain unchanged. 5001712 is an analysis
reconstruction; fixture APKs are not pristine installable source APKs.

Embedded shaders can be replaced by optional host overrides. A read-only host
configuration check during the preceding investigation found the same driver hash
as [the host-path audit](../steamlink-vd-hevc10/HOST-SHADER-PATH.md),
`watchForShaderChanges=false`, no persisted override and no override shader directory.
This supports the normal embedded route, but does not measure live shader execution.

## Validation

Compact receipts: [foveal-gamma-20260925](foveal-gamma-20260925/).

| Check | Result |
|---|---|
| Current source compilation and JUnit, cached dependencies | **124/124 PASS**, 0 skipped |
| Production OLED helpers on actual decoded natives | **3/3 PASS**; each base: 93 gamma cases (31 values × 3 modes), plus 63 legacy variants, 567 transitions, 126 checkbox cases and 21 VD cases |
| Blue-noise combination/native audit | **3/3 PASS**; each base: 99 layer/depth cases, 726 layer transitions, 32 gamma/hash transitions, 134 atomic rejection cases |
| Assembled production shaders, structural checker | **84/84 PASS**, original ES300 source |
| Offline glslang stage linking | **84/84 diagnostic ES310 pairs PASS**; strict ES300 rejects inherited standalone-uniform locations, recorded separately; production dialect unchanged |
| Actual Morphe DSL/finalize and unsigned fixture packaging | **12/12 PASS**; all 3 bases, both VD declarations, both blue-noise finalize orders, gamma 1.02/1.30 |
| Local bundle Android DEX | D8 9.1.31, Release/API26 PASS; `classes.dex` 470,680 bytes |
| Catalogs/reference | Regenerated from the new compiled bundle; only OLED metadata changes in all 4 JSON catalogs; default 1.00 verified |
| Production code review | No actionable findings |

Normal Gradle `:patches:test` failed resolving `app.morphe.patches:1.3.3`; cached
compilation is not a successful Gradle/CI release. No installation, ADB command,
Android GPU execution, headset comparison or visible seam improvement is claimed.

Local bundle: `patches/build/libs/patches-1.19.0-dev.1-foveal-gamma-local.mpp`.
SHA-256: `584ed5cf0148221c353c3cc7a2fdaf2e5f50d86170816f3f85695bf2ed4bf3d7`.
Canonical blue-noise payload SHA-256 remains
`5c30791621cc94a3f2f358e9b98e8029bc0765c1a0d44f6d1bc4690b2f45e858`.

## Reproduction

From the repository root, choose a fresh output directory:

```powershell
& diagnostics/steamlink-5002363/Compile-CachedAudit.ps1 -JavaHome F:/Runtimes/Java21 -OutputDirectory build/foveal-gamma-recheck/compiled
$gammaAuditCp = (Get-Content build/foveal-gamma-recheck/compiled/runtime-classpath.txt -Raw).Trim()
& F:/Runtimes/Java21/bin/java.exe -Xmx1g -cp $gammaAuditCp util.OledDecodedCompatibilityAudit (Get-Location).Path
& F:/Runtimes/Java21/bin/java.exe -Xmx1g -cp $gammaAuditCp util.BackgroundBlueNoiseDecodedAudit (Get-Location).Path
& F:/Runtimes/Java21/bin/java.exe -cp $gammaAuditCp util.Sdr10ShaderAssembleAudit (Get-Location).Path build/foveal-gamma-recheck/glsl
python -X utf8 diagnostics/steamlink-colour/glsl_validate.py build/foveal-gamma-recheck/glsl
& F:/Runtimes/Java21/bin/java.exe -Xmx1g -cp $gammaAuditCp util.VdSdrMorpheAudit build/decoded-fixture-apks/decoded-apk-android-steamlinkvr-release-base-2.0.23-5002363.apk build/foveal-gamma-recheck/vd 10-bit 1.30
& F:/Runtimes/Java21/bin/java.exe -Xmx1g -cp $gammaAuditCp util.BlueNoiseMorpheAudit build/decoded-fixture-apks/decoded-apk-android-steamlinkvr-release-base-2.0.23-5002363.apk build/foveal-gamma-recheck/both 10-bit true oled-first both-background-first 1.30
```

Run each Morphe case in a fresh JVM and absent/empty output directory. Repeat for
all 3 exact fixtures, both VD declarations and both blue-noise orders. Keep decoded
inputs, fixtures and cached tools; remove disposable output after retaining receipts.

## Artifact lifecycle

The final local MPP and compact receipts are retained. Task-created compiler files,
diagnostic shaders, unsigned fixture APKs and the intermediate pre-DEX bundle are
disposable. The measured allowlist and cleanup outcome are recorded in
[cleanup.json](foveal-gamma-20260925/cleanup.json) and `WORKSPACE_CLEANUP.md`.
Existing unrelated diagnostics, older outputs and exact source fixtures are preserved.
Automatic approval review blocked deletion with "blocked by policy" before execution:
1,808 disposable files / 2,009,005,710 bytes remain; 0 bytes reclaimed. Cleanup is
deferred until those allowlisted outputs can be removed under the approval policy.
