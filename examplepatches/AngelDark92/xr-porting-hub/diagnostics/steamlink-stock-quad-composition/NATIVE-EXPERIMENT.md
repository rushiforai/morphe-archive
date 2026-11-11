# Separate native quad experiment

## Status

`Native quad composition (experimental)` is a separate, default-off candidate.
It does not replace the existing `Stock quad composition` patch or change that
patch's default. Native implementation and host validation completed on
2026-11-10; headset compatibility and improved performance remain unproven.

The target is direct construction of four eye-aware quads inside Steam Link's
native rendering path, without first constructing projection layers or using
an `xrEndFrame` conversion layer. The reference is stock build
`2.0.24/5002527`; that build is not a target of this patch.

## Exact targets

- `2.0.20/5001712`
- `2.0.20/5001812`
- `2.0.21/5001968`
- `2.0.22/5002244`
- `2.0.23/5002363`
- `2.0.24/5002395`

Each base needs its own guarded native edits. A matching version name alone
is not sufficient. Other packages and builds are excluded.

## Testing the separate patch

Use a pristine source APK for the selected exact build. Do not switch modes
by patching an APK that already contains the other mode.

1. Disable **Stock quad composition**, which is selected by default.
2. Enable **Native quad composition (experimental)**.
3. Keep every other patch and option identical for the comparison.
4. Build and install the test APK through the normal Morphe workflow.

Selecting both quad patches is an error in either application order. The
installer does not silently remove the other mode or undo its native edits.
The existing stock patch remains available for a clean-source comparison.

Do not publish a successful on-headset result based only on compilation or
host emulation. Confirm launch, connection, both eyes, gaze/fovea placement,
overlay ordering, suspend/resume, reconnect and renderer teardown/recreation.
Record the exact base, selected patches/options and APK/helper provenance.
Compare flicker, foveal depth and frame pacing rather than assuming that a
native implementation fixes the original symptom report.

## Intended failure contract

There is no projection fallback. A missing or unavailable helper produces no
stream layers and a diagnostic message, not fabricated OpenXR success or a
new synthetic error. Real downstream OpenXR results remain authoritative.
Transient invalid frame or eye data must not permanently disable the path;
the next valid update must recover without recreating the app.

The renderer continues to own its real swapchains and rendering operations.
The helper must preserve coherent quad state when rejecting invalid input.
The old API-layer helper and manifest are not part of the new native mode.

## Evidence limits

Decoded native libraries are retained for all six exact targets. There are
no pristine source APKs retained for `5001812`, `5001968` or `5002395`, so
native-library audits for those builds are not pristine end-to-end APK proof.

Host checks must cover exact mutation sites, register/return-address behavior,
state ownership, geometry, no remaining projection construction, atomic and
idempotent installation, both mode-conflict orders, and composition with the
other native patches. Synthetic fixtures alone do not establish compatibility.

Headset/Bionic loading and actual runtime performance remain separate evidence.
Only replace the existing stock patch after the new mode works correctly in
those tests.

## Completed native path (2026-11-10)

The native mode patches `libvrlink_scene.so` itself. Renderer construction loads
`libgxr_quad_native.so`; initialization creates four persistent, eye-aware quad
records. Swapchain setup fills their sub-images directly. The native frame path
derives geometry from frame metadata and cached eye poses, and the existing
stream-layer collection entry appends the four quad pointers. No OpenXR API
layer or `xrEndFrame` interceptor is installed by this mode.

Projection header initialization, projection-view setup, the legacy per-eye
FOV/view-writing block and projection pose construction are bypassed/replaced.
The three-projection builds additionally bypass underside swapchain setup and
remove both unused underside acquire/pose/release scopes. Valid frame execution
uses four base/fovea swapchains and four texture draws, matching the reference's
two-family topology. Existing base/fovea rendering, synchronization, settings
chains and unrelated overlay handling remain owned by the app.

The unreachable underside setup format instructions remain in place because
OLED precision owns and validates those bytes. Only the entry branch and old
projection-view call are edited there. Static CFG checks prove that no remaining
instruction inside that block is reachable; preserving the dead format bytes
allows both patch orders and all precision transitions without weakening either
patch's preconditions. Unused swapchain members remain constructor-initialized
for stock normal/exception cleanup. Other scene/UI projection users are untouched.

States are pooled after teardown and reset before reuse, including sub-images,
dimensions and renderer-relative settings pointers. This relies on stock
ownership: `SVLRoot` joins its existing events thread before deleting the renderer.
Pooling does not make stale calls safe. Host recreation tests exercise a new
renderer address and verify no old settings pointers or geometry survive.

The helper now stages valid dimensions even when FOV input is unusable, preventing
the abandoned view-size cache from repeatedly triggering swapchain regeneration.
The source, bundled payload and generated Kotlin identity all use
`GXR-NATIVE-QUAD-1.2-ABI1`: **8640 bytes**, SHA-256
`e2f636a0661d1b6f7c3f84ff39e347ade1b59ec452ace2b584048534fe72e90c`.
Two external build directories produced these same bytes. ELF inspection confirms
AArch64, 16-KiB load alignment, unwind entries and one exported entry point,
`gxr_sq_entry`; dependencies are Android `libm.so`, `libc.so` and `libdl.so`.

## Exact-base provenance

These are retained decoded scene-library inputs, never rewritten in place.
Version names are listed above; 5002527 remains reference-only.

| Code | Bytes | SHA-256 | Owned mutation sites |
|---|---:|---|---:|
| 5001712 | 2221072 | `80b62797c7e26d6b67b0cca00693b076a336bdb48ebc1383a16cccb1616ed495` | 15 |
| 5001812 | 2220872 | `eebf7eabfb299ab7b9e5bba1612d4a32b27c51f451efc2bd206ba6fc6ac5205a` | 15 |
| 5001968 | 2234048 | `596b5680aa6c217daf5c151de517b1ad61b3999c6fd864ff59a718136ca40192` | 15 |
| 5002244 | 2251920 | `4b2fa5e1b5d9d5c938873f692b0e5e18159e1199dee1253dd6eccc8fa43dfa12` | 19 |
| 5002363 | 2292008 | `628821feab199d7712be8a51273eb9a21ec440a7c91aa6a768cc7307a4fe22f0` | 19 |
| 5002395 | 2301432 | `5fab23a7eac1429c93520bdd4d7c579b75a6d55525a755379d15388272571a4b` | 19 |
| 5002527 | 2333472 | `cfa9a9081afe9f011d50088642b11c04c8c386f393231d434621121e2c65ea03` | Reference |

`NativeQuadLayouts.kt` records every owned file offset, length, original-range
hash and replacement bytes. The generator resolves/validates each exact binary's
symbols, calls and instruction preconditions before emitting a plan. Whole-file
hashes identify stock provenance; application pins size and owned ranges so
independent native patches can compose outside those ranges. Mixed/foreign owned
sites fail before any write. Full plans and static evidence are retained externally.

## Verification and reproducible commands

Use external paths for `<plan>` and `<helper-build>`:

```powershell
.\extensions\native-quad-composition\Build-Native.ps1 -OutputDirectory <helper-build>
python -B extensions/native-quad-composition/tools/build_patch_tables.py <plan>
python -B extensions/native-quad-composition/tools/audit_native.py <plan>
$env:NATIVE_QUAD_HELPER = (Resolve-Path patches/src/main/resources/steamlink/nativequad/libgxr_quad_native.so).Path
$env:NATIVE_QUAD_PLAN = '<absolute-plan-path>'
python -B -m unittest discover -s extensions/native-quad-composition/tests -p 'test_*.py'
.\gradlew.bat build :patches:test :patches:buildAndroid :patches:generatePatchesList -PreleaseChannel=stable --console=plain
```

- **Static:** all six generated plans and the complete-text escape/storage audit
  pass. No renderer calls to the projection-view builder remain. Intended calls
  into replacement thunks are classified separately from forbidden old-body entry.
  Known call signatures narrow register analysis; unknown calls stay conservative.
  Alias/flag dependency regressions and reaching-definition checks cover the
  corrected audit model rather than suppressing failed assertions.
- **Ghidra:** installed 12.1.4 analyzed all seven original libraries directly:
  26 selected renderer/lifecycle functions per legacy base, 27 for the reference.
  Decompilation confirms two or three old families, two reference families with no
  projection-view construction, and join-before-renderer-delete on every input.
  REA 6.7.0's Windows bridge rejects ARM64 ELF even though Ghidra is configured.
  The initial full analysis stalled in GCC LSDA handling; final runs explicitly
  disable **GCC Exception Handlers**, complete without timeouts, and retain this
  limitation. They do not establish exception-handler recovery or runtime proof.
- **Native host execution:** **41 executed, 0 skipped, 0 failures/errors**.
  These execute compiled helper and patched scene bytes through a host interpreter
  with recording stubs for platform calls. Geometry uses 240 stock-derived quad
  vectors (worst absolute error `7.15e-7`) and 120 legacy fovea vectors (error 0).
  Cases cover four swaps/draws/quads, no underside acquisitions, state recreation,
  invalid FOV/size recovery, missing helper, ABI preservation and allocation errors.
  The interpreter's fused NaN/infinity handling is fixed and regression-tested.
- **Local build:** full `build`, `:patches:test`, Android packaging and stable
  catalog generation pass: **283 total, 260 executed, 23 skipped, 0 failures/errors**.
  Production-helper composition audits cover all six decoded bases. Applicable
  patch families are declared explicitly; exceptions are no longer treated as
  evidence that a failing composition is inapplicable.
- **Isolated checkout:** the same graph passes without decoded trees:
  **283 total, 231 executed, 52 skipped, 0 failures/errors**. Native discovery there
  passes **2 portable tests**, with **39 fixture-dependent tests skipped**.
  The isolated harness redirects Gradle/Kotlin output externally; it copies no
  decoded inputs. Skips are not exact-base compatibility proof.
- **Package inspection:** `patches-2.7.1.mpp` contains the exact pinned helper,
  existing extension payloads and no JUnit/Kotlin test classes. No native source
  rebuild is added to release workflows. Catalogs and the full technical reference
  are regenerated without removing other app or experimental entries.

All native logs, plans, per-base Ghidra reports, ELF/package inspection and compact
verification summary are under
`../builds/steamlink-patches/extensions/native-quad-composition/`.
Isolated build logs/results are under
`../builds/steamlink-patches/build/verification/native-quad-final-20261110/`.
Cleanup preview/apply passed: **18,652 bytes removed**, one repository-local
Gradle cache (8 files), **12 protected entries**, zero errors. Receipt:
`../builds/steamlink-patches/_cleanup/steamlink-residue-20261110-181312.json`.
All six decoded-input hashes were rechecked after cleanup. No CI run, pristine
end-to-end apply for the missing APK bases, headset
validation, performance result, installation, commit, push or release is claimed.
