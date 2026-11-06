# Alpha-0 high-resolution trigger and Appear on top - retired (2026-11-06)

Owner decision: Stock quad composition replaces the Alpha-0 high-resolution trigger as
the recommended high-resolution patch, Appear on top is removed, and Network Optimizations
becomes one default-on patch for every supported base.

## What changed

- **Alpha-0 high-resolution trigger** is deleted: patch object, resource installer,
  2-/3-projection helper libraries (`libgxr_ast_5001712.so`, `libgxr_ast.so`), the API-layer
  manifest, the Alpha-0 resource tests, and the whole native source tree
  `extensions/resolution-trace-layer/` (layer source, its private `session_registry.h`, host tests,
  CMake targets). Stock quad keeps its own `extensions/stock-quad-composition/src/session_registry.h`
  and references nothing from the deleted tree, so no tracing code was shared.
- **Appear on top (legacy)** is deleted with its manifest patch and
  `COMPATIBILITIES_STEAM_LINK_BEFORE_LATEST`, which only it used.
- **Stock quad composition** is `default = true`, stable (no `experimental` name or
  compatibility group) on the six exact bases it already covered
  (5001712, 5001812, 5001968, 5002244, 5002363, 5002395). 5002527 stays outside its scope.
- **Network Optimizations** is one patch object, default on, dispatching on the loaded exact
  build for all seven Steam Link bases. The `(optional)` duplicate is deleted.
- Re-patching an APK that an older release already patched removes the Alpha-0 libraries,
  manifest and `android_surface_trigger_passthrough_v1` mode instead of failing.

## Network Optimizations on 2.0.24/5002527 (new layout, derived from this build)

Evidence class: static inspection of the retained decoded tree
`android-steamlinkvr-release-base-2.0.24-5002527/` (no pristine APK was located;
see `diagnostics/steamlink-5002527/README.md`). Scene SHA-256
`cfa9a9081afe9f011d50088642b11c04c8c386f393231d434621121e2c65ea03` (2,333,472 bytes) and
main SHA-256 `ceddfaf39c3fba0b760ce5afea53ea9a5743502aa770e7d600f8109d67bf8e58`
(16,211,704 bytes) are identical in three retained copies.

| Edit | 5002527 site | Evidence |
|---|---|---|
| E1 retransmit abort | scene `0x1696a8`, 44 bytes | Same instruction shape as 5002395 `0x1682a0`: overflow guard `cmp w20,#0x1ff`, log call, latch store, abort `b 0x1698e0`. The send-path join `ldr w10,[x19,#8]` follows `mov w9,#0x504` at `0x169820`, so it is at `0x169824`, `0x15c` after the abort branch, exactly like 5002395 (`0x1682c0` to `0x16841c`): imm26 `0x57`. |
| E2 reorder bound | scene `0x16a448`, 16 bytes | `csel w24,wzr,w11,eq` / `str xzr,[x23]` / `cmp w24,#6` / `str w22,[x10,#0x720]`, unique; 6 to 12. |
| E3 send buffer | scene `0x179950`, 16 bytes | `mov w8,#0x20000` stored at `[sp,#8]`, then `setsockopt(fd,1,7,sp+8,4)` (`SOL_SOCKET`,`SO_SNDBUF`); 128 KiB to 1 MiB; unique. |
| E4 decoder flush | main `0x940410`, 16 bytes | `AMediaCodec_flush` found by relocation: GOT `0xcca718`, PLT `0xc50690`, two callers. `0x93e870` is a teardown path (`cbz` guarded, followed by a log). `0x940414` has the `ldr x0,[x0,#0x60]; bl; mov w0,#1; b` shape that 5002244, 5002363 and 5002395 patch. The same lookup run on 5002363 finds `0x8ec5c4` (the known site) and the same teardown caller, which validates the method. |

`libmain.so` is written only by this patch, so it is also pinned: stock SHA-256 above, patched
SHA-256 `34ff572255a3b4dc28603c937bb5b3d9f5eb65f5d2e28c244e18722e72bdd816`. The scene library is
shared with other patches in any order, so it is pinned by size and unique byte windows only.
Fully patched scene hash on the stock decode:
`8152f7e0f4fecf61aa9c0fdb982dc9dc8fd788917b50da9e28ad594284e318b5`.

Inherited caveat, not new: on every base the E1 branch lands after the instructions that
reload `x8` and `w9` for the send path. The 5001712 behaviour was reported working by the owner;
no runtime evidence exists for the abort path on any other base, 5002527 included.

## Network Optimizations on 2.0.24/5002395: evidence

No pristine 5002395 APK or decoded `libmain.so` exists in the toolkit, on the Desktop or in the
Downloads folders searched. The retained artifact is the patched release
`steamlink-androidxr-patched/Steam_Link-v2.0.24-XR_Porting_Hub-v2.5.0.apk`
(SHA-256 `efe424bae2569bd070032d7ea54bba06e6e06de4257d1e82ace075d6ff2bf55d`). Inspected:

- `libmain.so`: 15,929,432 bytes, SHA-256 `69f2c778...c06075`, equal to the frozen patched-main hash
  recorded when the real stock library was decoded; `0x903634` holds the patched flush window.
- `libvrlink_scene.so`: 2,301,432 bytes; E1 `0x1682a0`, E2 `0x169044`, E3 `0x1772cc` all hold
  the patched windows.
- The scene was reverted by hand to the stock E1 window and disassembled: abort exit `0x1684d8`,
  send-path join `0x16841c`, the same shape reused for 5002527.

This proves the shipped edit on a real 5002395 build but is patched evidence, not a pristine base.
The pristine 5002395 frozen-output-hash test therefore still skips here. The release APK was
inspected during this task and was no longer present in `steamlink-androidxr-patched/` when the
tests were re-run, so `NetworkOptimizationsPatchTest` skips its retained-APK case on this checkout;
the figures above are the record. Restore the APK (or any pristine 5002395 decode) to re-run it.

## Not changed

- Retired hitch experiments, the foveal canvas and the spacewarp layer stay retired.
- 4XVR is untouched.

## Open items

- No headset run of this change exists; Stock quad runtime status is the owner's report only.
- The 5002527 Network layout is static-derived and unvalidated on a headset.
