# Stock quad composition backport (2026-11-03)

Default-off experimental patch for exact Steam Link 2.0.20/5001712,
2.0.20/5001812, 2.0.21/5001968, 2.0.22/5002244, 2.0.23/5002363 and
2.0.24/5002395. Keep Alpha-0 deselected when using this experiment; its source
and payloads are unchanged. MPP only; no APK is produced by this work.

## Static mechanism

Stock 5002527's streaming renderer replaces the older stereo projection layers
with four quads: base-left, base-right, fovea-left, fovea-right. The new layer
uses the original view head pose and cached runtime eye-to-head poses, a plane
at 1.996000051498413 m, original swapchains/rectangles/spaces and per-family
settings chains, with flags 0/0/6/6. It preserves the frame chain and unrelated
trailing layers. The unused underside is dropped only on the three-projection
bases. Stock four-quad frames pass through unchanged.

All six decoded bases were inspected separately. Earlier three builds use two
projection layers; later three builds use underside/base/fovea projections.
Their pose/FOV helpers and swapchain construction were compared; no layout is
inferred solely from version names. Stock 5002527 is a reference, not a newly
declared compatible base.

This reproduces observable stock layer construction. It does not prove that
quad topology alone causes Android XR high resolution. There is no headset A/B
for this backport and no captured stock 5002527 `xrEndFrame` array. Host output
is not evidence that the runtime accepts the converted frame or raises its
resolution.

## Removed alternatives

At the owner's request the active Surface-video patch, native source, tests,
helper and manifest were removed after the user reported it not working. The
legacy `GxrResolutionProbe` DEX hook and its activation references were removed.
Historical diagnostics remain. No codec, color, controller or permission
feature was intentionally removed.

## Runtime check

Select **Stock quad composition (experimental)** with **Alpha-0 high-resolution
trigger** deselected, using a clean exact-base APK. Check logcat tag
`GXRStockQuad` for eye location and converted-frame records. A disabled reason
means the layer stood down. A runtime rejection returns the error and leaves
later frames unchanged; it never submits twice for one frame.

## Evidence

Static evidence is retained in external analysis reports:

- `../builds/steamlink-patches/build/compare-5002527-audit/REPORT.md`
- `../builds/steamlink-patches/build/quad-backport-all-bases/REPORT.md`

Host native tests passed for both layouts, geometry, rejection, lifecycle,
package inertness and single-submission behavior. Android arm64 compilation and
symbol inspection passed. Kotlin test counts and package verification are
reported with the final delivery, not treated as runtime proof.
