# Offline Games 3.15.3 ARM64 port

Input: user-supplied `Offline Games_3.15.3.apks`, package
`com.JindoBlu.OfflineGames`, version code `3327`, minimum API 23, target API 36.
The archive contains `base.apk` (no native libraries) and
`split_config.arm64_v8a.apk`. This is not the ARMv7 build supported by the old
patch table.

## Verified native identity

- ABI: `arm64-v8a`, ELF64 AArch64, IL2CPP metadata v31.
- `libil2cpp.so`: 90,250,192 bytes; SHA-256
  `80dbeb4bd8f5cd8e1f5c2590c410ac4a49defd56a5cd64a11dc455c18947d74e`.
- `libmain.so`: SHA-256 `e6ee684092c38dd1f604c572506ada33238dd94fb0ac0220b06d4d82ead2cf31`.
- `libunity.so`: SHA-256 `518780936e9e05aa124fe3f5b82d6cc12b9a9fdfa513345a55dc264dd9bbb72d`.

Method names are mapped by metadata image and method-token RID, resolving ELF
`R_AARCH64_RELATIVE` relocations in the codegen module pointers. File offsets and
virtual addresses differ: executable addresses in this build are file offsets
plus `0x4000`. No ARMv7 instruction encoding is reused.

## Patch sites

| Purpose | File offset | Virtual address | Original → replacement |
|---|---|---|---|
| Shared rewarded decision | `0x2aa08a0` | `0x2aa48a0` | `tbz w0,0,...` → `b 0x2aa4998` |
| Rewarded download adapter | `0x258dddc` | `0x2591ddc` | entry → `ret` |
| Hide seconds wrapper | `0x28ec630` | `0x28f0630` | `cset w1,gt` → `mov w1,wzr` |
| Show close button | `0x28ec64c` | `0x28f064c` | `cset w1,eq` → `mov w1,1` |
| Initialize counter | `0x28ece4c` | `0x28f0e4c` | `ldr w8,[x0,0x10]` → `mov w8,wzr` |
| Store-click handler | `0x28ecd60` | `0x28f0d60` | entry → `ret` |
| Firebase startup wait | `0x257631c` | `0x257a31c` | `b.ge` → `b 0x257a33c` |
| Country lookup wait | `0x2576c48` | `0x257ac48` | `tbz` → `b 0x257afa0` |
| Parallel ad initialization | `0x2577360` | `0x257b360` | `tbz w21,0,...` → `nop` |

The rewarded branch targets the existing `showHouseAd` closure after its callback
has been initialized. The ARM64 popup fields are `secondsTextWrapper` at `+0x70`,
`closeButton` at `+0x80` and `counter` at `+0x98`. `Open()` controls visibility via
`GameObject.SetActive`. The duration-copy callback (`<>c__DisplayClass14_0` in
this build) stores the counter at `+0x98`. `ClosePressed` at `0x28f0d18` still
invokes the reward callback and closes normally. `OpenStorePage` is independently
identified at `0x28f0d60`.

Startup follows the same initialization/continuation design as 3.14.1: requests
and consent handling remain; the loading screen stops blocking on pending
Firebase/country results and uses the existing parallel advertising path.

## Loader and validation

The patch-time manifest now includes `abi` and `version`. The runtime loader
accepts only the two supported ABI names and stages all three Unity libraries
from the selected directory. Old manifests without `abi` remain ARMv7-compatible.
The Java Unity resolver and native-load success hook were inspected in the new
DEX and have the same signatures/control flow as the older build.

`scripts/verify_offlinegames.py INPUT.apks PATCHED.apk --fast-startup` dispatches
to the ARM64 verifier using the output manifest. It verifies exact final bytes,
the unchanged close/reward handler, loader hashes, and injected DEX. Unicorn maps
the ELF segments/relocations and executes the actual AArch64 blocks, including
visibility with counter values 0/1/3/15/60, immediate counter completion, both
rewarded readiness values, every Firebase condition flag, and parallel ad dispatch.
Separate loader tests cover ARM64 extraction, ABI-specific cache identity, invalid
ABI rejection, and legacy ARMv7 manifests.

These are rebuilt-APK and isolated-instruction tests, not an Android device run.
The prior on-device ad failure remains unconfirmed; retain the startup status
message and process-map diagnostic when testing this version.

## Reproduction results

Using the CI-built `v1.6.0-dev.1` bundle with Morphe Desktop 1.17.0 / Patcher
1.14.1, the supplied APKS was merged and patched without forced compatibility.
Patching and rebuilding succeeded with all four selected patches and no failures.
The output verifier passed on the actual rebuilt APK, including ARM64 execution
of each modified control-flow block and verification of the loader's DEX hooks.

- All four patches: `libil2cpp.so` SHA-256
  `8712fcd81e74bf32e35eaa147fddda4961a6cceb4f0ff86dc7ad4aa0996f469e`.
- Repatching that output produced the identical native library and loader manifest.
- Fast startup alone: exactly three native edits, leaving all ad methods stock;
  SHA-256 `71331812c6c7994bf62631862f48de63d390c66c7e4d3f252c34370c1769c04f`.
- A 3.14.1 ARMv7 regression run with all four patches passed the existing output
  verifier and retained SHA-256
  `4f8b531d0240f7dcb6bd95708670610a629fb6eeae0537083ce71a3ed3a826e2`.

The CI loader tests include ARM64 extraction, separate ARMv7/ARM64 cache
identities, unsupported-ABI rejection, stale-cache repair, and runtime mapping
classification. Local outputs were unsigned verification artifacts; Manager
should use its own configured key for the user's installation or mount.
