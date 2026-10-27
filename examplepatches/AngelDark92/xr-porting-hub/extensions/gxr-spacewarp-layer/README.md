# gxr-spacewarp-layer (2026-10-26 half-rate revival)

The **GXR spacewarp** capability for the Steam Link VR client. It provides an
OpenXR implicit API layer that synthesizes projection content on display ticks
where presentation needs it. Carrier: the host publishes one 4-byte value on
vrlink ValueTransport ID `0x48` through `VrlinkTap`: `0` Off, `1` late-frame
recovery, `2` half rate.

Supported exact Steam Link bases (the bundled `.so` selects the scene-lib pins at
runtime; gate evidence is per base):

| Base | Gate-0 pins | VTS appendix |
|---|---|---|
| 2.0.20/5001712 | `gxr_spacewarp_gate0_5001712.json` | `gxr_spacewarp_vts_5001712.json` |
| 2.0.20/5001812 | `gxr_spacewarp_gate0_5001812.json` | `gxr_spacewarp_vts_5001812.json` |
| 2.0.21/5001968 | `gxr_spacewarp_gate0_5001968.json` | `gxr_spacewarp_vts_5001968.json` |
| 2.0.22/5002244 | `gxr_spacewarp_gate0_5002244.json` | `gxr_spacewarp_vts_5002244.json` |
| 2.0.23/5002363 | `gxr_spacewarp_gate0_5002363.json` | `gxr_spacewarp_vts_5002363.json` |
| 2.0.24/5002395 | `gxr_spacewarp_gate0_5002395.json` | `gxr_spacewarp_vts_5002395.json` |

## Runtime shape

| Piece | File | Role |
|---|---|---|
| Loader entry | `src/xr_layer_entry.cpp` | negotiation + `getInstanceProcAddr` guard; routes the session/frame/swapchain wrappers |
| Dispatch | `src/swp_dispatch.cpp` | predicted-display-time scheduler, A/B history, capture/commit, private output swapchains, frame-local substitution |
| GOT hooks | `src/swp_hooks.cpp` | PLT GOT install for `eglCreateImageKHR` arrival learning (fail closed) |
| Bridge consumer | `src/swp_vts.cpp` | host carrier read for ID `0x48` every 60 endframes |
| Arrival learning | `src/swp_egl.cpp` | image-handle epoch/timestamp/context observations |
| Estimator | `src/spacewarp_est.{h,cpp}`, `src/swp_est_worker.cpp`, `src/swp_shaders.h` | dense coarse-to-fine matcher, median, native subpel refinement, rotation align, extrapolation |
| Manifest | `patches/src/main/resources/steamlink/androidxr/XR_APILAYER_local_GalaxyXR_gxr_spacewarp.json` | implicit layer, disable env `GXR_DISABLE_GXR_SPACEWARP` |
| Kotlin patch | `patches/.../steamlink/androidxr/GxrSpacewarpLayerPatch.kt` | stages the `.so`, manifest and per-base gate assets; `default = false` |

## Scheduler and ownership

- **Carrier 2 (half rate) is driven by OpenXR `xrWaitFrame` predicted display
  time and period**, not decoded arrivals or previous presentation success. After
  warmup the selected-real and synthetic display slots alternate. A skipped
  display slot advances the phase; a duplicate/out-of-order predicted time does
  not. Failures submit the original composite and never shift the phase.
- **Carrier 1 (late-frame recovery)** keeps the arrival-epoch classification and
  the two-consecutive-missed cap. It uses the same private-output path.
- Fresh frames arriving in a synthetic slot are discarded from presentation and
  history. The layer retains three history slots: a write target plus immutable
  A/B composites. Source pixels are copied only while the app image is acquired
  and successfully waited, on `xrReleaseSwapchainImage`, before that release is
  forwarded. Released stock images are never written.
- Motion is estimated once per distinct selected-real pair: A is rotation-aligned
  into B (`R_A * R_B^T`, asymmetric FOV tangents), residual flow A→B is measured,
  and B is extrapolated. The nominal interleaved scale is `1.5`, derived from the
  matching display timestamps; source age beyond two selected-real periods or
  scale beyond 3 falls back to stock.
- Synthetic output is rendered into **owned runtime swapchains** created from the
  app swapchain's create info. Every required eye/component is acquired, waited
  (10 ms explicit timeout), rendered and released before the frame-local
  projection copies substitute the output swapchain and B's pose/FOV. Any failure
  releases acquired private images and submits the original composite.
- Private swapchains are destroyed before the parent session. GL history/maps are
  deleted only on their creating EGL context; otherwise they enter the bounded
  deferred reclaim queue. Settled Off owns zero GL names.

## Estimator (2026-10-26)

- Portable GLSL is the shipped baseline. The QCOM block-match variant is kept
  behind the shader-syntax probe but is not armed: the previous parity check
  compared two portable loops, so it did not prove hardware SAD. It stays
  unarmed until a genuine hardware path and normalized-result parity test exist.
  Status bit 8 therefore reports the portable baseline.
- Working image longest side is capped at 1024; half-resolution levels continue
  down to 64. The coarsest level searches the full ±96-native-pixel envelope with
  dense integer steps (no search gaps); finer levels and the native pass refine
  ±2 around the upsampled seed.
- Matching error is the mean per-channel RGB error in `[0,1]`. Zero displacement
  is always evaluated; a nonzero candidate is accepted only when it improves by
  `max(1e-6, 1% of zero error)`. The former no-motion cutoff is gone.
- Quadratic subpel uses the winner's immediate neighbours, with edge neighbours
  falling back to the centre score. Nonaligned dimensions and partial edge blocks
  are supported.
- Each selected projection keeps its own MV map/geometry; per-call native rects
  and map sizes let independently mapped components share the estimator without
  rewriting settings or cropping output. 2D and array layouts are admitted; the
  array layer index is used for capture and output rendering.
- Admission uses actual runtime image counts, histories, outputs, maps and the
  estimator footprint against the provisional 512 MiB ceiling. Exceeding it logs
  a diagnostic and submits stock.
- Every public estimator call saves/restores FBO, program, active unit, texture
  bindings, sampler bindings, viewport, scissor, blend, depth, cull, colour mask
  and rasterizer discard. `EXT_disjoint_timer_query` provides asynchronous
  completed-GPU timing when available; disjoint samples are rejected.
- The dispatch counts selected, discarded, synthesized, committed, late and
  fallback frames separately.

## Carrier and dormant behavior

- The arrival hook accepts the resolved `libEGL.so` export for
  `eglCreateImageKHR`; it does not require an imported function to reside in
  `libvrlink_scene.so`. Missing or unexpected targets fail closed.
- ID `0x48`, 4-byte int; read every 60 endframes. `0` Off, `1` late-frame
  recovery, `2` half rate. Unknown values read as late-frame recovery and never
  rewrite the host's saved setting.
- Unknown/never-published carrier = disabled. The layer never auto-enables on a
  stock session.
- After carrier 0/unpublished is observed and owner-context cleanup completes,
  frame/image callbacks pass through without synthesis, frame-history copying,
  estimator work or GPU queries. Partial initialization failures also retire their
  estimator/private resources. The EGL import wrapper reads the mode once and
  skips arrival learning, clock reads and locking while Off. Arrival bookkeeping
  uses fixed storage, not heap-backed containers.
- The layer remains loaded. Session/swapchain descriptors and image-ownership
  FIFO tracking (including its locking) remain active for correct hot enable
  with images acquired across frame boundaries. The control hooks remain
  registered; the carrier is checked every 60
  endframes (about 0.67 seconds at 90 Hz or 0.83 seconds at 72 Hz, after delivery).
  Pending layer discovery retries at that cadence rather than every frame.
  Thus disabled synthesis has no ASW rendering work, but it is not literally
  zero-overhead or an unloaded layer. Headset CPU/GPU A/B measurement is still
  needed before claiming no measurable performance impact.
- A 1 → 0 → 1 cycle bumps the carrier generation and clears pre-gap state.

## Build + tests

- Android: `extensions/gxr-spacewarp-layer/Build-Native.ps1` (reuses the shared
  OpenXR headers; compiles the estimator sources when present). Output goes under
  `../builds/steamlink-patches/`.
- Host: configure `extensions/gxr-spacewarp-layer/tests` with
  `OPENXR_SDK_SOURCE_DIR=<reused headers dir>` and build/run `ctest`. Targets:
  `swp_dispatch_tests`, `swp_vts_tests`, `swp_hooks_tests`.
- `tests/swp_shader_syntax.py` compiles every embedded shader with glslang,
  probes the QCOM dialect and reflects every `ULocDef` uniform.
- `tests/swp_est_math_test.py` mirrors the production thresholds (parsed from
  `spacewarp_est.cpp`) for normalized error, zero/motion candidates, dense gap
  coverage, subpel/edges, rotation alignment and extrapolation.
- `tests/derive_gate0.py --base <base>` and `derive_gate0_vts.py --base <base>`
  re-derive the per-base pins; `--check` cross-verifies the compiled constants.
  5001812, 5001968, 5002244 and 5002395 are `--check`-only for
  `derive_gate0_vts.py`; its appendix emitter still encodes the two original
  call shapes.

## Known gaps / evidence limits

- Host source/fixture and package checks do not prove smoother or stable headset
  presentation. Gate P (completed GPU time/distinct-source work) and Gate L
  (physical latency/reprojection error) still need device measurement.
- The QCOM variant remains unarmed; only the portable path has production
  evidence. A future hardware path needs a genuine SAD parity test.
- The arrival epoch still assumes one `eglCreateImageKHR` per decoded frame with
  a bounded round-robin pool; a wider pool disables late-frame learning.
- `SVLRoot` capture shares the scene root lifetime assumption documented for the
  bridge; it is invalidated at `xrDestroySession`.
- Guided filtering, temporal scene detection and TFLite refinement remain out of
  scope; the production improvement rule is the fallback guard.
