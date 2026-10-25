# gxr-spacewarp-layer (09-LAYER-B1b skeleton, 10-W2A bridge + estimator wiring)

The **GXR spacewarp** capability for the Steam Link VR client (exact base
`2.0.23/5002363`; not yet available for `2.0.24/5002395`): asynchronous spacewarp in the VirtualDesktop sense — on a display
tick where no fresh decoded video frame arrived, extrapolate the projection content by
warping the two most recent decoded frames with an on-device estimator (block-match
motion vectors + pose-integrated extrapolation), while preserving the client's
composition layers exactly. Carrier: a native OpenXR **implicit API layer** following
the established repo pattern (`extensions/<name>-layer`, mounted at every XR app start,
patches the scene library's PLT GOT after load, wraps per-frame OpenXR entry points).

This wave (B1b) delivers the **layer skeleton**: entry + dispatch + hooks + manifest +
packaging + Kotlin staging patch + mirrored test. The estimator core
(`spacewarp_est.h/.cpp`, `swp_shaders.h`, `swp_est_worker.cpp`) is the sibling builder's
brief (08-ESTIMATOR-B1a); the two are joined by the shared interface contract in
`builds/steamlink-patches/build/asw-20261017/impl/RE-SHARED-IMPL.md`
(`SwpSetGlTable`-style entry points: `SwpInit`, `SwpGenerateVectorsStereo`,
`SwpExtrapolateStereo`, `SwpLastStatus`, `SwpLogTag`="GXRSwarp").

## Runtime shape

| Piece | File | Role |
|---|---|---|
| Loader entry | `src/xr_layer_entry.cpp` | `xrNegotiateLoaderApiLayerInterface` + `getInstanceProcAddr` with the mandatory guard (`nullptr` NEXT ⇒ `*function=nullptr` + `XR_ERROR_FUNCTION_UNSUPPORTED`, never forward through an unassigned chain) |
| Dispatch | `src/swp_dispatch.cpp` | Per-frame wrappers (`xrCreateSession`/`xrDestroySession`/`xrBeginFrame`/`xrLocateViews`/`xrEndFrame`), per-session history, missed-tick classification, estimator calls, texture-id resolution |
| GOT hooks | `src/swp_hooks.cpp` | `dl_iterate_phdr` scan + anchor-verified PLT GOT install for `eglCreateImageKHR` in `libvrlink_scene.so` (fail closed on unknown layout) |
| Bridge consumer | `src/swp_vts.cpp` | The host→client toggle (brief 10): one-shot SVLRoot* PLT capture (two SVLRoot methods) + a direct pinned call to `ValueTransportSystem::BGetRemoteValue` for carrier `0x48` every 60 endframes; owns its own capture-slot GOT installs (fail closed independently of the egl hook) |
| Arrival learning | `src/swp_egl.cpp` | `eglCreateImageKHR` post-hook: arrival epoch + monotonic timestamp + frame-asset context per new image handle |
| Manifest | `patches/src/main/resources/steamlink/androidxr/XR_APILAYER_local_GalaxyXR_gxr_spacewarp.json` | `implicit.d` layer manifest (disable env `GXR_DISABLE_GXR_SPACEWARP`) |
| Gate-0 evidence | `patches/src/main/resources/steamlink/androidxr/gxr_spacewarp_gate0_5002363.json` | Frozen pins (re-derivable by `tests/derive_gate0.py`) |
| Kotlin patch | `patches/.../steamlink/androidxr/GxrSpacewarpLayerPatch.kt` | Window-gated staging of the `.so` + manifest + gate-0 asset; `compatibleWith` 2.0.23/5002363 only; `default = false` |

### Missed-tick decision (shared-brief candidate 1)

- `eglCreateImageKHR` calls on the scene lib carry the decoded-frame arrivals. The
  wrapper (`swp_egl.cpp`) **bumps an arrival epoch whenever the created image handle
  differs from the previous call's handle** (consecutive duplicates don't count).
  Assumes the scene lib creates ~one image per decoded frame with a round-robin
  buffer pool (`maxImages 20`).
- At `xrEndFrame`: identical epoch as the previous endframe ⇒ the same decoded arrival
  is being presented again ⇒ **missed tick** ⇒
  `SwpExtrapolateStereo(mvMapL/R, srcL/R, stagingL/R, scaleFactor)` into owned
  staging images, then committed into the pending projection textures by a
  format-matched blit — and only after every eye of every selected projection
  rendered successfully, so a partial failure never reaches the compositor.
- Fresh epoch ⇒ **real tick** ⇒ `SwpGenerateVectorsStereo(prev=older, curr=newest, the
  LocateViews pose of each tick)`; the first real tick only records history.
- `scaleFactor = (predictedDisplayTime − arrivalPrev) / (arrivalNewest − arrivalPrev)`
  (VD's normalized progress between the two history frame indexes: 1.0 exactly at the
  newest arrival, 2.0 one skipped interval; the extrapolation shader applies `1 − scale`;
  arrivals converted into XrTime through the `xrBeginFrame` monotonic/paired-anchor
  ring), clamped to `[0.05, 3.0]`, and at most **2 consecutive** extrapolated ticks
  before the layer passes stock again.
- **Synthesis modes.** The carrier value is the mode: `0` off, `1` late frames only
  (the original behavior), `2` half rate. **Half rate is retired since 2026-10-21:**
  the host no longer publishes `2`, and this layer maps a `2` from an older host to
  late frames while `g_halfRateRetired` is true, so a stale driver cannot enter the
  mode. Any value above `2` also reads as late-frames-only, and nothing rewrites the
  host's saved setting. In half-rate mode (un-retired) every second presented tick is
  synthesized from the previously presented frame instead of showing the fresh
  decode, so real frames update at half the display rate; the client still decodes
  every frame. A mode flip mid-session behaves like a fresh enablement: stale maps are
  dropped and the next real tick regenerates them.
- Any failure stands down **this tick only** (contract status 16), logged **once per 30
  occurrences**; the already-rendered client content still reaches the compositor, so
  the worst case equals stock. Estimator-init failure stands the session down
  permanently (status bit 16 persists until re-init = next session).

### Texture resolution (deliberate intercept-list extension, documented)

The contract demands `dstTex` = "the currently pending swapchain GL texture ... from the
projection view subimage data at THIS xrEndFrame". The GLES swapchain images are GL
texture ids reachable only via the swapchain's own enumeration + acquisition state, so
the layer also wraps (as **pure passthrough observers**, never mutating):
`xrEnumerateSwapchainImages` (records `XrSwapchainImageOpenGLESKHR.image` per index) and
`xrAcquireSwapchainImage` (records the pending index whose image the compositor reads).
A non-GLES image type at enumerate ⇒ the session passes stock.

### Context discipline (CRITICAL, per the shared brief)

The draw happens on the **client's current EGL context only**: at each warp the
dispatch verifies `eglGetCurrentContext()` equals the context recorded with the
frame-asset arrival (when the arrival carried an explicit context); no current context
or a mismatch stands the tick down. The layer **never creates or currents its own
context** in this iteration. MV-map textures are allocated lazily in the client's
current context (two RGBA16F textures sized by the block-match grid). On
`xrDestroySession` they are deleted only while that exact context is still current,
else intentionally leaked (documented; a few KB once per session).

### The one boolean enable entry + the VTS bridge gate (brief 10)

`SwpSetEnabled(bool)` / `SwpGetEnabled()` (exported, default visibility) per
RE-SHARED-IMPL.md stays the single user entry: the value is read at **session
init** and a mid-session flip applies to the next session; `GXR_DISABLE_GXR_SPACEWARP`
(manifest `disable_environment`) disables everything including all GOT hooking.

On top of it the **brief-10 bridge gate** composes per tick: ALL synthesis (MV
generation + extrapolation) runs only while **both** the entry and the host's
published carrier are on. The carrier is the vrlink typed ValueTransportSystem
boolean that receipt 06 ranked first and the owner pinned:

- ID `0x48` (72; inside the receiver's `1..0x73` auto-instantiation guard, verified
  unused by the client's own value transport — the two `movz w1, #0x48` sites in
  the lib are libc++ locale helpers). Payload: 4-byte int, nonzero = enabled.
- Consumed with a DIRECT call to `ValueTransportSystem::BGetRemoteValue`
  (runtime vaddr `0x179ee0` in `libvrlink_scene.so`) with the VTS object embedded
  at `SVLRoot + 0xa08` — both re-derived from the receipt's disassembly and
  pinned in `tests/derive_gate0_vts.py` → `gxr_spacewarp_vts_5002363.json`.
  **BGetRemoteValue returns true only when the id holder exists AND the full
  requested size was copied**, so a size/type mismatch reads as "not present".
- The `SVLRoot*` comes from the receipt's one-shot PLT capture recipe:
  the layer wraps two PLT-routed SVLRoot methods (GOT slots `0x22f378`
  `SVLRoot::ParsePeerValueSettings` — the receipt's named example — and
  `0x22f2e0` `SVLRoot::RXUnreliableStream`, which fires per unreliable datagram
  in any active session); each wrapper forwards verbatim and captures `x0`.
- Read cadence: **every 60 endframes** (~1.5 Hz; the call takes the VTS-internal
  mutex internally, safe from the render thread). Published `0` = disabled;
  unknown (capture pending) = disabled; never published this session = disabled
  with the one line `"carrier value not present"`; read failure / garbage
  payload = disabled with one line per session.
- **The layer NEVER auto-enables on stock sessions**: with no VrlinkTap on the
  host (or no session flowing), the gate stays off and the layer remains the
  pure-passthrough observer set. Arrival learning keeps running (the egl GOT
  wrapper and its bounded 8-entry ring), so a later publish starts from fresh
  arrival data; nothing else is collected.
- **Dormant fast path (2026-10-21).** While the carrier reads 0/unpublished,
  `xrEndFrame` is one lock-free mode load, one cadence increment and the client's
  own call — no clock read, no session lookup, no tick classification, no frame
  history, no GL/EGL, no pose math (`xrLocateViews` returns before its lock).
  The first tick after a publish is therefore a cold-start tick (estimator init +
  one history record) and synthesis begins on the tick after: one display frame
  of warm-up, ~11 ms at 90 Hz. A 1 -> 0 -> 1 carrier cycle is detected by a
  carrier *generation* counter (the value alone would read identical) and clears
  the history and clock anchors collected before the gap.
- A mid-session carrier flip takes effect live within the cadence; entering the
  enabled state discards pre-enablement motion maps (fresh real-tick generation
  required before any extrapolation — stale content is never warped).

## Pinned scene-lib evidence (Gate-0, re-derive before pinning)

`python -B extensions/gxr-spacewarp-layer/tests/derive_gate0.py` against
`android-steamlinkvr-release-base-2.0.23-5002363/lib/arm64-v8a/libvrlink_scene.so`
(stdlib-only ELF parse; fails loudly on any ambiguity). Re-derived [verified
2026-10-17]: file 2,292,008 bytes; full-file SHA-256
`628821feab199d7712be8a51273eb9a21ec440a7c91aa6a768cc7307a4fe22f0`
(**diagnostics only — never a gate**); code anchor `0xfd6fc` + 0x80 bytes
(`f5c43c6a…` — the codecs-support audit anchor for the same base, independently
cross-checked); brief-01 windows `0x10cd00` / `0x11b708` unique-hash verified;
`eglCreateImageKHR` = exactly one `.dynsym` import (#107 of 5110) with exactly one
JUMP_SLOT relocation, **GOT slot runtime vaddr `0x22fcc8`** (this base is *not*
PT_LOAD-identity in its writable segments — the GOT file offset differs by the PT_LOAD
delta; add the vaddr to `dlpi_addr`, never use it as a file offset). The lib carries
`DF_BIND_NOW`/`DF_1_NOW` (BIND_NOW + full RELRO), so the GOT patcher mprotects the page
RW first and restores it read-only after the write.

**Gate-0 VTS appendix** (brief 10): `python -B
extensions/gxr-spacewarp-layer/tests/derive_gate0_vts.py` emits
`gxr_spacewarp_vts_5002363.json` and re-verifies [verified 2026-10-17]:
`BGetRemoteValue` defined once at VA `0x179ee0` (164 bytes; anchor `0cd07a66…`),
its JUMP_SLOT `0x22f348` reached through PLT stub `0x219cd0` from the two real
client call sites (`0xfc0d4` / `0xfc330`, each `add x0, x20, #0xa08` pair unique —
the embed-offset proof); carrier id `0x48` unused by the client's value transport
(2 raw `movz w1, #0x48` in `.text`, both attributed to libc++
`time_get_storage` locale helpers, none to a ValueTransportSystem function); the
two capture slots: `SVLRoot::ParsePeerValueSettings` (VA `0x16c60c`, anchor
`64e1e456…`, unique slot `0x22f378`) and `SVLRoot::RXUnreliableStream` (VA
`0x16c4ac`, anchor `f3e3ff1f…`, unique slot `0x22f2e0`), each exactly one
JUMP_SLOT. `... --check` cross-verifies the compiled-in pins of
`src/swp_hooks.cpp` (slots + capture anchors) and `src/swp_vts.cpp` (vaddr,
embed offset, carrier id, anchor sha). The scene lib has NO `PT_GNU_PROPERTY`
segment (BTI/PA unmarked — the direct `BGetRemoteValue` call and the GOT wrappers
need no landing pads); the layer itself builds without branch protection.
Staging: the appendix JSON is emitted beside the layer sources; staging it into
`patches/src/main/resources/steamlink/androidxr/` (beside the gate-0 asset) plus
the Kotlin parity extension is the packaging wave's step.

### Per-base pin table (brief 13 — runtime-selected profiles, freshly derived per base)

| Base | Gate-0 pins file | VTS appendix | Kotlin window list | `eglCreateImageKHR` GOT slot (runtime vaddr) | VTS read API (runtime vaddr) |
|---|---|---|---|---|---|
| 2.0.20/5001712 | `patches/src/main/resources/steamlink/androidxr/gxr_spacewarp_gate0_5001712.json` | `gxr_spacewarp_vts_5001712.json` | `0xfd304` · AppTick `0x13eb80` · FlipFrame `0x10ad18` · Render `0x1190a4` | `0x21bb88` | `GetRemoteValue` @ `0x16a2c4` — returns the copied byte count (present = copied 4) |
| 2.0.23/5002363 | `patches/src/main/resources/steamlink/androidxr/gxr_spacewarp_gate0_5002363.json` | `gxr_spacewarp_vts_5002363.json` | `0xfd6fc` · FlipFrame `0x10cd00` · Render `0x11b708` | `0x22fcc8` | `BGetRemoteValue` @ `0x179ee0` — bool, true = full 4-byte copy |

Both bases embed the VTS at `SVLRoot+0xa08` and share the carrier (`0x48`, 4-byte
payload, 60-endframe cadence). The C++ profiles (`swp_hooks.cpp` + `swp_vts.cpp`)
select at runtime by hashing the base's identity anchor at the `dl_iterate_phdr`
base (`0xfd304`/`6e5dcb4f…` for 5001712, `0xfd6fc`/`f5c43c6a…` for 5002363 — the
anchors do NOT share bytes across the bases); no match = fail closed. Derive with
`python -B tests/derive_gate0.py --base <base>` / `tests/derive_gate0_vts.py --base
<base>`; `--check` cross-verifies the compiled-in pins (both scripts).

## Build + tests

- Android build: `extensions/gxr-spacewarp-layer/Build-Native.ps1` (reused OpenXR
  headers dir; adds the sibling estimator sources automatically when present; fails a
  mixed estimator state rather than silently stubbing).
- Host tests: `cmake -S extensions/gxr-spacewarp-layer/tests -B
  ../builds/steamlink-patches/extensions/gxr-spacewarp-layer/build-host-tests
  -DOPENXR_SDK_SOURCE_DIR=<reused headers dir>` then build + `ctest`. The three
  targets (`swp_dispatch_tests`, `swp_vts_tests`, `swp_hooks_tests`) compile the
  production dispatch/arrival/vts TUs with estimator fakes and prove: pose→matrix,
  scale-factor + clamp, mono→XrTime windows, tick classification, the arrival
  round-robin assumption + pool-anomaly disable, the full flow (real→vectors→
  missed→extrapolate→cap) against a fake compositor, every stand-down path, the
  brief-10 bridge gate (unknown / never-published / published-0 stay stock with the
  one fallback line; the 60-endframe poll cadence; a mid-session flip enables only
  fresh data; the entry stays authoritative), the mocked-table carrier state
  machine (pins (VTS*, 0x48, out, 4), capture wrappers forward + capture the
  latest root, session end invalidates the root), and the fail-closed GOT
  mechanism (unknown layout / mprotect failure / unresolved slot never write).
- The shipped `.so` staging + sha pin in `GxrSpacewarpLayerPatch.kt` is the owner
  build flow (payload tests self-activate once the pin stops being the placeholder).
- The same suite also builds as an arm64 executable for an on-device run:
  `aarch64-linux-android29-clang++ -std=c++17 -DSWP_HOST_TESTS -I tests/stubs
  tests/swp_dispatch_tests.cpp src/swp_egl.cpp src/swp_vts.cpp -o
  swp_dispatch_tests_arm64`, then `adb push` + run from `/data/local/tmp`. The
  deterministic test clock is guarded by `SWP_HOST_TESTS` (not by `_WIN32`), so
  the vectors hold on any host or device. Production builds never define it.

## Known gaps (recorded, not hidden)

- MV-map grid = 16 px cells and `fovScale = 1.0` are assumed constants for
  `SwpInit` (`SwpInitInfo`); the REA brief's engine notes are the source to refine them.
- Arrival learning depends on the scene lib actually routing decoded frames through
  `eglCreateImageKHR` ([hypothesis] from brief-01 evidence; the single JUMP_SLOT
  relocation proves the import exists, not that it fires per frame). On-device
  validation must confirm the arrival cadence before any default flip.
- The bridge capture shares the SVLRoot lifetime risk of the arrival learning: the
  root pointer is captured at any SVLRoot-method call and invalidated at
  `xrDestroySession`; between the scene root's own destruction and the session end
  the residual window is the app's own teardown order (same class as receipt 09's
  documented lifetime assumptions).
- Guided filter / temporal / scene-detect / TFLite refinement and the ME_Frame
  Interpolation-style blending path are out of scope per the shared contract.
- GUI/host toggle publishing (the VrlinkTap side: `galaxyXr.spacewarp` → carrier
  `0x48`) lands in the host workstream (receipt 06 §4); the layer consumes
  bridge-agnostically — until the publisher ships, every session is stock (the
  never-published fallback).