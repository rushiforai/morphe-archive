# GXR spacewarp 2.0.24/5002395 profile

Checked 2026-10-26 against the retained decoded tree
`android-steamlinkvr-release-base-2.0.24-5002395`. Static and host-side
evidence only; no headset, ADB, SteamVR or install run was performed.

## Exact input

| Input | Value |
|---|---|
| Decoded tree | `android-steamlinkvr-release-base-2.0.24-5002395` |
| `lib/arm64-v8a/libvrlink_scene.so` | 2,301,432 bytes, SHA-256 `5fab23a7eac1429c93520bdd4d7c579b75a6d55525a755379d15388272571a4b` |
| ELF | AArch64 `ET_DYN`; `DT_FLAGS=0x8` (BIND_NOW), `DT_FLAGS_1=0x1` (full RELRO) |
| BTI | PT_GNU_PROPERTY segment is present but its region is not a valid GNU properties note; no AArch64 BTI feature record. The layer's direct read call keeps its unmarked-lib precondition |

## Derived pins

The identity window is the same codecs-support audit window this base already
pins (`0xfe954`). Each window below is 0x80 bytes, occurs exactly once in the
file, and is re-derived by
`python -B extensions/gxr-spacewarp-layer/tests/derive_gate0.py --base 5002395`.

| Anchor | File offset | SHA-256 |
|---|---|---|
| Codecs audit identity | `0xfe954` | `ef7f310bbd65499404aa89a18f873c42a87282a16799b84119c75377654003a3` |
| `QSVLClientXR::FlipFrame` | `0xfcc60` | `ae6b472507e1aa0e6d3756cfb0601ec13f4cb1c93e887366e9d898e36a9389bf` |
| `XrSceneStream::Render` | `0x11c9a0` | `1550a9b6903a59092c9416f807975fd99cea203809894fd89750880a7ddaa1ae` |
| `AppTick` | `0x146e5c` | `8b74ca45210ad8a0c647a2f2e8c226adaa09ad5a7a711c1095ecdf440624f57f` |

`eglCreateImageKHR` has exactly one `JUMP_SLOT` relocation:
`slotOffset 0x232170` (runtime vaddr), file offset `0x22e170` under the
writable PT_LOAD delta of `0x4000`.

## Value-transport bridge

| Item | Value |
|---|---|
| Read API | `ValueTransportSystem::BGetRemoteValue` at `0x17ba50`, 164 bytes |
| Read anchor | `9701b8dffa8277fb88f2fe7989bf7caa96b922c33b8f73ce356b950e6b6c9dc9` |
| Read-return policy | `kBoolPresentFullCopy` — the 164-byte (41-instruction) body matches 2.0.23/5002363 modulo branch targets and PLT addresses |
| `SVLRoot::ParsePeerValueSettings` | `0x16dd4c`, 740 bytes, anchor `5923592d8f8675634571537abf2a04f2a5d513a57efc0981e91d62f068a924e2`, GOT slot `0x231800` |
| `SVLRoot::RXUnreliableStream` | `0x16dbec`, 352 bytes, anchor `2808819d4d269ecae43aca1c731e85e8bae64125d05e0853e1f348c717853463`, GOT slot `0x231760`; 4-argument signature (`SVLDataLink*, unsigned long`) |
| VTS embed | `SVLRoot + 0xa08`, proven at 11 real `add x0, xN, #0xa08` + `bl`-to-`BGetRemoteValue` pairs |

The bundled layer selects the profile by hashing the identity window at load
time. Because the 2.0.24 identity window is unique and no other base's anchor
hash matches it, only the exact pair arms; any mismatch logs once and stands
down to stock.

## Artifact changes

| Artifact | Change |
|---|---|
| `patches/src/main/resources/steamlink/androidxr/libgxr_spacewarp.so` | rebuilt with the sixth profile and corrected EGL export guard; 487,816 bytes, SHA-256 `4d07f6b99acbee45ec4b65ac7a655c6c73434a7fc114fcaa4ef0921d0ba782c7` |
| `gxr_spacewarp_gate0_5002395.json` | emitted by `derive_gate0.py --base 5002395`; SHA-256 `efe7d649fa86cff291d803ac11c370d94232fbb3e3d7051f88518209d7d87c98` |
| `gxr_spacewarp_vts_5002395.json` | hand-frozen appendix in the restored-legacy shape; SHA-256 `2b71739a7b5d0722a4f0f63d997e02483c7cd7496da8059ac3bab722a4363762` |
| `GxrSpacewarpLayerPatch.kt` | exact-pair selector, scene preconditions, gate pair and library pin |

## Validation

- `python -B extensions/gxr-spacewarp-layer/tests/derive_gate0.py --base 5002395 --check`
  passed. For 5002395 it reads the exact scene (size/SHA-256 gate), re-derives
  all four 0x80 windows and their uniqueness, checks window overlap, compares
  the ordered `(offset, sha)` list to the Kotlin preconditions, and requires the
  literals in the compiled `kProfile5002395` initializer. The same check still
  passes for 2.0.20/5001712 and 2.0.23/5002363.
- `python -B extensions/gxr-spacewarp-layer/tests/derive_gate0_vts.py --base 5002395 --check`
  passed. For 5002395 `--check` is tree-derived: it re-reads the exact scene,
  checks size/SHA-256, the `.text` dynsym shndx, the read and capture VAs and
  sizes, all three 0x80 anchors, all three `JUMP_SLOT` slots, the
  `eglCreateImageKHR` slot and the 11-site `+0xa08` embed census before
  comparing the compiled initializer. Every derived value must also be one of
  the compiled `CHECK_PINS` literals, so the tree, the C++ table and the
  appendix cannot drift independently. The same check still passes for 5002363
  and 5001712.
- The compiled-profile checks now parse the base's own initializer with comments
  stripped, so a matching literal in a header comment cannot mask a wrong field.
- `derive_gate0.py` overlap detection was made order-independent: 2.0.24's
  identity window (`0xfe954`) sits above its `FlipFrame` gate (`0xfcc60`).
  Overlapping windows are still rejected.
- `:patches:test` passed with **218 tests, 16 skipped, 0 failures**. The
  `GxrSpacewarpLayerPatchTest` class ran **11 tests, 0 skipped, 0 failures**,
  including the per-base payload validation, gate/JSON/Kotlin parity and the
  decoded-tree window hashes for all six bases.
- A separate current-source copy without proprietary decoded inputs passed the
  ASW class: **5 executed, 6 skipped, 0 failures**. Real-scene installation
  tests explicitly skip missing inputs; synthetic bytes only test rejection.
  The isolated copy also passed Android packaging and experimental catalog
  generation.
- All four native CTest suites passed after correcting the shared arrival-hook
  guard. The scene imports `eglCreateImageKHR` from EGL, so its resolved GOT
  pointer must match that export, not reside in the scene library. Missing or
  unexpected exports fail closed before any GOT write. The host fixture now
  exercises that pointer check rather than replacing it with unconditional
  success.
- A fresh Android native build was staged and hash-pinned. The local
  `patches-2.4.0-dev.2.mpp` contains that exact library and all six gate pairs.
- `:patches:buildAndroid :patches:generatePatchesList -PreleaseChannel=experimental`
  passed and regenerated the experimental catalogs; the stable catalog is
  unchanged because the layer remains experimental-only.

## Boundary

- The profile table is statically verified but has not executed against a
  running 2.0.24 client. Headset behavior, stand-down timing and frame
  synthesis remain unverified for this base.
- The value-transport appendix for 5002395 is hand-frozen, matching the
  restored 1812/1968/2244 precedent. `derive_gate0_vts.py` is verify-only for
  this base (`--check`): it re-derives and checks every pin against the exact
  decoded tree, but its appendix emitter still encodes the two original call
  shapes and refuses to emit for 5002395.
- The native host suites (`swp_hooks_tests`, `swp_vts_tests`) drive synthetic
  profiles and do not cover any real per-base pin.
