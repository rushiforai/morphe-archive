# Full-FOV foveal canvas experiment — 2026-10-01

Target: **Steam Link 2.0.20/5001812**, the latest 2.0.20 original APK available in this workspace. This is a new, default-off experiment; no headset outcome is recorded. Existing resolution helpers, recommendation bundles and older exact adaptations are preserved.

## Interpretation of the developer's suggestion

“Copying the fovea tile onto a full resolution 5*6k canvas, and submitting that as the second projection layer” most plausibly means:

1. Keep the original full-view background as projection 1.
2. Clear a large full-eye image to transparent black.
3. Copy the rendered fovea into its geometrically corresponding area of that image, preserving its alpha mask. Leave the rest transparent.
4. Submit the entire image with the full-eye FOV as projection 2.

This changes the angular coverage and pixel extent of the foveal projection seen by the runtime. It does not stretch the fovea across the whole eye or create new decoded detail. The quote does not specify whether 5*6k is per eye or combined stereo, the swapchain type, canvas transparency or exact dimensions. This candidate deliberately tests **5000x6000 per eye in ordinary OpenGL ES OpenXR swapchains**. It is an interpretation, not verified reproduction of the other app.

[OpenXR projection views](https://registry.khronos.org/OpenXR/specs/1.1/man/html/XrCompositionLayerProjectionView.html) associate an image with its own pose and FOV. Changing only texture allocation would leave the old narrow-FOV contract. Padding requires changing both the image and the submitted FOV.

The native implementation uses tangent-space mapping. For matching poses, destination horizontal endpoints are `(tan(foveaAngle) - tan(fullLeft)) / (tan(fullRight) - tan(fullLeft)) * canvasWidth`; vertical endpoints use the corresponding down/up angles. Endpoints round to the nearest canvas pixel. Mismatched poses/spaces, clipping and destination spans smaller than the source crop are rejected, preserving the original frame.

## Comparison with already tried approaches

| Approach | Previously tested result | Difference here |
|---|---|---|
| Single-projection reconstruction | Stable high path but visibly lower detail after output was capped to 3152x3682 | Keep 2 projections and the original background; no background reconstruction or silent canvas cap |
| 3-to-2 projection removal | Low/high/low around SystemUI | Do not remove a layer; change only fovea image extent and full-eye FOV |
| Fovea quads | Worse/low; retired | Keep a projection, not a video quad |
| Android Surface fovea | User reported not working | Use normal GL swapchains, not Android Surface video output; pad to full-eye coverage |
| Android Surface actual video | User reported low resolution | Preserve background/video decoder path; no all-layer Surface transfer |
| Static 2x2 Android Surface trigger | Working historical sharpness observation | Preserve as an independent selectable patch; omit it when measuring the canvas alone |

The dated ledger is [already-tried resolution experiments](../../SteamLink-GalaxyXR-Python-Patches-Already-Tried-for_Resolution_issue/README.md), with [Surface-fovea](../steamlink-surface-fovea/README.md) and [Surface-video](../steamlink-surface-video/README.md) records. No retired helper or renderer source was imported. The quote suggests a new test of foveal projection representation. It does not prove the cause of Galaxy XR's quality switch. The working tiny quad demonstrates that submitted surface/topology can affect sharpness; adding any extra layer has not been established as sufficient.

## Implementation and evidence

- Patch: `Full-FOV foveal canvas (experimental)`, exact `(2.0.20,5001812)`, default off, experimental catalogs only, outside recommended bundles.
- Source: `extensions/foveal-canvas-layer/src/foveal_canvas_layer.cpp` and `canvas_geometry.h`.
- Payload: `patches/src/main/resources/steamlink/androidxr/libgxr_foveal_canvas.so`, with separate implicit API-layer manifest and pinned SHA-256.
- Installer adds only its helper/manifest. It does not change Valve's scene, DEX, AndroidManifest, video shaders, settings or host negotiation. Existing selected patches retain their own effects.
- Exact original APK, scene identity, symbol/caller evidence and full-function pins are in [native-evidence.json](native-evidence.json). On this base projection 1 is opaque background; projection 2 is the masked fovea with alpha flags 6. Both original views are stereo, with runtime-derived sample count.
- The first eligible frame discovers foveal source handles and passes through unchanged. Later source snapshots are taken while the image is acquired and successfully waited, **before** downstream release. Repeated-image frames use helper-owned snapshots, never released runtime images.
- Source snapshots and canvases use the source format (sRGB8, RGBA8 or RGB10_A2); format changes recreate output swapchains. No codec precision is negotiated by this patch.
- GPU work runs in a private context shared with Valve's GLES context. Original context/surfaces and application GL state are restored. Exact 5001812 initialization requires GLES3 (`0x14f2a8–0x14f2b4`) and WINDOW|PBUFFER config support (`0x14f2c4–0x14f2d4`), then creates/makes current a pbuffer (`0x14f404/0x14f428`).
- This correctness prototype explicitly synchronizes with `glFinish`; it adds GPU copies, clears, allocations and CPU/GPU waits. It is not a performance optimization. A 5000x6000 RGBA image costs 120 MB; 2 eyes with 3 runtime images each cost 720 MB before snapshots/runtime overhead. Actual image counts are logged.
- Accepted sources currently require sample count 1, array/face/mip counts 1, ordinary 2D textures and known formats. Unsupported contracts log their fields and retain original submission. Actual runtime recommendations and source poses remain live acceptance checks.
- The helper preserves projection 1's pointer, frame timing, spaces, poses, foveal alpha flags and an optional terminal quad. Allocation/geometry/capture failures disable this experiment for the session and use original frames. A runtime rejection returns its original error and switches future frames to original submission; it does not resubmit the same frame.
- Exact 5001812 supplies FB composition-layer settings in both projection `next` chains. These original pointers and flags pass through unchanged. The initial null-chain guard was corrected before delivery; host fixtures exercise the actual non-null chain. Both projections use the same metadata-to-pose helper and reference-space lookup, establishing the static matching-pose/space contract.

## Controlled headset trial

Use a clean original **2.0.20/5001812** APK for each arm, the same host profile/stream resolution/bitrate/scene and the same other patch settings. Keep Appear on top permission/window and recording state fixed. No device installation or commands were performed while preparing this experiment.

1. Existing high-resolution patch alone: working reference.
2. Canvas alone: select the 16 individual patches from the exact recommended set **excluding** `Galaxy XR high-resolution 3-projection fix`, plus `Full-FOV foveal canvas (experimental)`. Leave the recommended selector and legacy foundation selector unchecked because they re-enable the 2x2 trigger. Do not select `Appear on top (legacy)`.
3. Both: exact recommended set plus the new canvas patch. This checks coexistence; sharpness here cannot establish whether the canvas works independently.

For each arm compare before, during and after the palm SystemUI element, plus stream stop/start and focus loss/resume. Record sharpness, seams, gaze placement, flicker, stalls and memory failures. Canvas-alone success requires both matching visible detail and `GXRFovealCanvas` logs showing `canvas_created`, successful transformed `frame` events, and no fallback. A successful patching/install step or a large allocation alone is insufficient.

Useful log events: `initialized`, `session` (requested/max size), `source_discovered`, `source_contract`, `canvas_limit`, `canvas_create_failed`, `canvas_created`, `canvas_eye`, `frame`, `fallback`, `summary`. If runtime max size is lower, this version does not silently shrink the canvas. Report that outcome before choosing another size.

Rollback: repatch the original APK with the existing recommended set and no canvas experiment. Merely deselecting a patch does not remove a helper from an already patched APK.

## Rebuild and offline verification

From repository root, with the retained NDK/OpenXR headers/Zig/Java tools:

```powershell
& extensions/foveal-canvas-layer/Build-Native.ps1 -OutputDirectory build/foveal-canvas-work/native-direct
# After successful build/test, stage the .so in canonical resources and update its Kotlin SHA pin.
& build/tooling/zig/ziglang/zig.exe c++ -std=c++17 -O2 extensions/foveal-canvas-layer/tests/geometry_tests.cpp -o build/foveal-canvas-work/geometry-tests.exe
& build/foveal-canvas-work/geometry-tests.exe
& build/tooling/zig/ziglang/zig.exe c++ -std=c++17 -O0 -g -DXR_USE_PLATFORM_ANDROID -DXR_USE_GRAPHICS_API_OPENGL_ES -Iextensions/foveal-canvas-layer/tests/stubs -Iextensions/controller-velocity-layer/build-android/_deps/openxr_headers-src/include extensions/foveal-canvas-layer/tests/layer_tests.cpp -o build/foveal-canvas-work/layer-tests.exe
& build/foveal-canvas-work/layer-tests.exe
& diagnostics/steamlink-5002363/Compile-CachedAudit.ps1 -JavaHome F:/Runtimes/Java21 -OutputDirectory build/foveal-canvas-work/compiled
python -B diagnostics/steamlink-legacy-1812-1968/Package-Local.py build/foveal-canvas-work/compiled patches/build/libs/patches-1.21.0-foveal-canvas-local.mpp
$fcCp = (Get-Content build/foveal-canvas-work/compiled/archive-classpath.txt -Raw).Trim()
foreach ($fcCase in @('alone','trigger-first','canvas-first','recommended','legacy-without-trigger')) {
    & F:/Runtimes/Java21/bin/java.exe -Xmx1g -cp $fcCp util.FovealCanvasMorpheAudit '../Best Apks/android-steamlinkvr-release-2.0.20-5001812.apk' "build/foveal-canvas-work/morphe/$fcCase" $fcCase
    if ($LASTEXITCODE -ne 0) { throw "Morphe audit failed: $fcCase" }
}
```

All audit outputs are unsigned evidence APKs and should be cleaned after preserving compact receipts. This is a local cached-compiler/D8 bundle, not a Gradle/CI release. The normal Gradle path was rechecked and remains blocked before compilation by `app.morphe.patches:1.3.3` resolution. Offline native doubles do not simulate the compositor or prove GPU pixels, color, orientation, runtime resolution or headset acceptance. Final results and cleanup receipts are saved beside this report.

## Prepared result

[Local MPP bundle](../../patches/build/libs/patches-1.21.0-foveal-canvas-local.mpp) contains the new patch plus current existing patches. SHA-256: `f7312d953f01b98882bc37396b50e743f5081a5530b688b968fd351bc52a5823`. This is a patch bundle to import into Morphe, not an APK to install.

Offline results: Android ARM64 helper compiled; geometry checks and 13 production-layer mock scenarios passed; 136/136 JUnit tests passed with 0 skipped; D8 Release/API26 passed; 5/5 original-APK Morphe cases passed from the final MPP's classes/resources. These cover standalone, both patch selection orders with the trigger, recommended combination, and the legacy selection without the trigger. The stable catalog remains byte-identical; all existing catalog entries/defaults/targets/options/dependencies remain unchanged. The 3 experimental/all catalogs add only the new optional entry. See [validation.json](validation.json), [catalog-validation.json](catalog-validation.json) and [cleanup.json](cleanup.json).

Both actual API-layer loading orders and GPU pixel output remain headset checks. The packaging-order cases and terminal-quad mocks establish offline coexistence boundaries only.

## CI correction — 2026-10-01

GitHub run `36907870366` built the Android bundle successfully, then failed 5 tests because the ignored exact decoded scene was absent from the fresh checkout. The test suite now retains 4 real-input audits with explicit missing-only JUnit assumptions and 4 mandatory portable foveal checks, including tracked payload validity/tampering. Installer atomicity and idempotence remain checked with the actual input. A present invalid scene still fails; synthetic invalid bytes establish rejection only.

Verification after correction: 137 tests passed with retained real inputs, 0 skipped/failed. An isolated directory with tracked source files exported via `git archive`, explicit compiled runtime classpaths and no ignored decoded APKs passed 125 tests with 12 missing-input assumptions (4 foveal, 8 existing VD), 0 failures. These are cached compiler/JUnit results, not a corrected GitHub run. Changes remain local pending a push.

Local validation also caught Windows CRLF conversion of the byte-pinned canvas JSON manifest. Its exact `.gitattributes` rule now enforces LF and preserves canonical SHA-256 `2ff0b8e93e682ae39247f9f7e0a394e8ee6cabbefa374a1249b19bb1195a12e5`. No production native helper or scene guard changed. Both edited skills passed `quick_validate.py`. See [CI validation](ci-fix-validation.json), [failed-run excerpt](ci-failure-20261001.txt), local/isolated validation receipts and [CI cleanup](ci-cleanup.json).
