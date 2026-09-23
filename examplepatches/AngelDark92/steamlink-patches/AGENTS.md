# Steam Link Morphe patch guidance

The parent workspace `AGENTS.md` also applies. These rules are mandatory for every change under this repository.

## Multi-version compatibility

- Preserve every verified Steam Link adaptation. Adding a new base must extend compatibility and guarded layouts; it must not replace or broaden an older base implicitly.
- Model a verified base as the exact pair `(versionName, versionCode)`. Never assume the version name from the build code.
- Use the primary `AppTarget` constructor so the description is retained:

```kotlin
AppTarget(
    version = versionName,
    versionCodes = SupportedAbi.entries.associateWith { versionCode },
    description = description,
)
```

- A `Compatibility` may contain several `AppTarget`s when their `version` strings differ. Morphe rejects duplicate version strings inside one `Compatibility`, so builds that share a version name must remain separate `Compatibility` objects and be passed together with `compatibleWith(*items.toTypedArray())`.
- `versionCodes = null` means every build code for that version. Use it only when every such build is intentionally supported. Use an explicit experimental target for warning-only unknown-version work; exact compatibility does not weaken patch preconditions.
- `Patch.default` is global, not per version/build. Preserve old defaults by filtering exact compatibility entries rather than changing a shared patch default or duplicating a patch name.
- Morphe executes dependencies recursively without re-checking their compatibility. Every build-specific dependency or mutation body must independently return unchanged on excluded builds before reading or writing target files.

## Base adaptation safety

- A request to "make compatible" means implementing and verifying the actual mutation and reachable code path for every requested exact base, not merely adding compatibility labels. Inspect that base's decoded APK before choosing offsets or method/shader targets; never transplant a neighboring build's offsets without evidence.
- Exercise the production patch helpers against the actual decoded native libraries for every newly supported option. Verify all intended sites change, no unrelated bytes change, shader boundaries/interfaces survive, reapplication is idempotent, and supported option transitions work. Synthetic fixtures supplement this evidence; they do not replace it. Trace native callers/references to establish that the edited shader and format fields belong to the active rendering path.
- Record per-base metadata, hashes, offsets, code-path evidence, checks performed, and remaining runtime gaps. Distinguish byte/code-path compatibility from runtime acceptance of an experimental format and from physical panel precision. If a requested base is unavailable or reconstructed, state the limitation explicitly.

- Pin native layouts by exact file size, SHA-256 where available, symbol-derived offsets, and original/already-patched byte preconditions. Unknown layouts must fail closed or remain unchanged; never infer offsets from a neighboring build.
- Validate all edits atomically and idempotently. Do not use global replacement counts when a supported binary can contain a legitimate duplicate.
- Compare manifests, DEX classes/methods, config assets, renderer topology, and native symbols before declaring a patch compatible. Build-specific experiments stay isolated unless the new base demonstrates the same contract.
- Keep generated catalogs and tests synchronized with source compatibility. Report Gradle/static validation separately from actual Morphe APK patching, installation, ADB, headset, and SteamVR runtime proof.
- Analysis reconstructions and malformed/hybrid APK extractions are evidence sources, not installable or byte-for-byte pristine APKs. Do not claim an end-to-end patching result without a pristine source APK.

## Local artifact lifecycle

- Apply the parent workspace's required cleanup rule whenever an experiment ends or a patch is finalized/applied. Keep a dated tried/retired record and validation evidence, then delete obsolete experiment APKs, bundles, decoded derivatives, compiler output, and stale source/resource copies.
- Canonical patch code and payloads are under `patches/src/main`; do not create or use `patches/bin` as another source tree. Keep generated CMake build trees out of Git.
- GitHub release workflows build Morphe bundles and catalogs; they do not currently regenerate the native `.so` payloads. Preserve source resource binaries, tracked release catalogs/docs, exact decoded bases, fixture APKs, and tools required by local audit scripts.
- Root `build/` mixes disposable output with required `decoded-fixture-apks`, tool dependencies, and unique diagnostic evidence. Classify children individually; retain current captures and compact historical reports. Never delete it wholesale.
- See `WORKSPACE_CLEANUP.md` for audited ownership, recovery commands, retained exceptions, and the dated cleanup record.

## Retired hitch experiments — tested, did not work, removed from source (2026-09-19)

The three standalone experiments below targeted exact Steam Link **2.0.22/5002322** and **2.0.23/5002363** to fix the streaming hitching / whole-view-freeze regression. The user tested them on the headset and **they did not solve the problem**. They were removed from `patches/src/main` on 2026-09-19 (patch code, tests, standalone audit runners, and the bundled `libgxr_dbuf*` helper payloads), and the committed catalogs no longer list them. **Do not re-add, re-import, or re-derive any of them — including partial variants such as telemetry-only mode or the duplicate check alone — when trying to solve this problem.**

| Retired patch name | What it exactly did | Headset outcome |
|---|---|---|
| `Decoder input buffering (experimental)` | Rewrote the scene ELF `DT_NEEDED` entry `libmediandk.so` → `libgxr_dbuf.so` (file offset `0x69656` @5002322 / `0x69925` @5002363) and installed a bundled `lib/arm64-v8a/libgxr_dbuf.so` decoder-input helper (per-build payloads, plain and telemetry variants) hooked through guarded vtable/GOT pointers. **Buffered** staged incomplete compressed frames in bounded memory (24 lazy 4 MiB allocations per codec, 96 MiB cap) before synchronous codec submission; **Observe** only counted on the stock input path. No executable instructions, shaders, output images, or OpenXR layers changed. | Tested on 2.0.23/5002363: whole-view freezes persisted. Not a fix. |
| `FEC duplicate reservation guard (experimental)` | NOP'd the verified duplicate-check bypass in `libvrlink_scene.so` (4 instruction bytes at `0x167094` / `0x167f60`, full-function identity and executable-mapping guarded) so the existing accepted/submitted-frame duplicate checks run before packet-driven decoder input acquisition, including after a stream reset. | Tested: did not resolve the hitching problem. |
| `UDP receive buffer (experimental)` | Raised the active VR UDP receive socket buffer request from 1 MiB to 8 MiB in `libvrlink_scene.so` (instruction `08 02 a0 52` → `08 10 a0 52` at `0x1745a8` @5002322 / `0x1757a8` @5002363; actual byte difference at offset +1). | Live trial on 2.0.23/5002363 failed: freezes worse and longer — decoded gaps >50 ms 12→46, longest 1.804→3.065 s, codec flushes 10→300, host resets 29→133 per 180 s, with 0 app-socket drops. |

Evidence, exact byte/function guards, and the tried ledger remain under `diagnostics/steamlink-hitches/` (`TRIED-EXPERIMENTS.md`, experiment records, validation receipts). Any future attempt at this regression must target a different mechanism with new evidence and must read `diagnostics/steamlink-hitches/TRIED-EXPERIMENTS.md` first.

## Official Morphe references

- Multi-version `AppTarget` example: https://github.com/MorpheApp/morphe-patcher/blob/v1.9.0-dev.1/docs/2_2_patch_anatomy.md#L12-L37
- `AppTarget` and `versionCodes`: https://github.com/MorpheApp/morphe-patcher/blob/v1.9.0-dev.1/src/main/kotlin/app/morphe/patcher/patch/Compatibility.kt#L55-L101
- Duplicate-version validation and compatibility helpers: https://github.com/MorpheApp/morphe-patcher/blob/v1.9.0-dev.1/src/main/kotlin/app/morphe/patcher/patch/Compatibility.kt#L299-L359
- `compatibleWith` behavior: https://github.com/MorpheApp/morphe-patcher/blob/v1.9.0-dev.1/src/main/kotlin/app/morphe/patcher/patch/Patch.kt#L480-L523
- Global patch metadata: https://github.com/MorpheApp/morphe-patcher/blob/v1.9.0-dev.1/src/main/kotlin/app/morphe/patcher/patch/Patch.kt#L27-L51
- Recursive dependency execution: https://github.com/MorpheApp/morphe-patcher/blob/v1.9.0-dev.1/src/main/kotlin/app/morphe/patcher/Patcher.kt#L71-L103
