# Decoder helper injection audit

Scope: static inspection of actual decoded 2.0.22/5002322 and 2.0.23/5002363 arm64 libraries, plus comparison with the captured installed 5002363 APK. No device commands or runtime mutation were performed. The selected implementation uses data-pointer hooks, not inline instructions.

## Exact layout artifact

`decoder-hook-layouts.json` records independent per-base ELF metadata, full function hashes, entry bytes, symbol visibility, relocation locations, vtable slots, immediate branch references, and source-agent-verified object fields. Regenerate with `build/live-hitch-20260915/reset-analysis/audit_decoder_hooks.py`. The 14 recorded function bodies and 3 metadata consumers match the captured installed 5002363 native library byte-for-byte. This does not imply that every possible existing patch combination has been tested.

| Item | 5002322 | 5002363 |
|---|---|---|
| ELF build ID | `585d88d646a8c6efe94bdd9fc6c9dbbc68fc13ba` | `c31bb979123b76736930d3c820d8d0619fb5bed2` |
| Unique `libmediandk.so` string, raw offset | `0x69656` | `0x69925` |
| Codec vtable address point | `0x222a40` | `0x224a90` |
| Init pointer | `0x222a50` | `0x224aa0` |
| Submit pointer | `0x222a58` | `0x224aa8` |
| Acquire pointer | `0x222a60` | `0x224ab0` |
| Flush pointer | `0x222a78` | `0x224ac8` |
| Stop pointer | `0x222a80` | `0x224ad0` |
| Stop import-table pointer | `0x22d6c8` | `0x22f7a8` |
| D1/D2 destructor pointer | `0x222a40` | `0x224a90` |
| D1/D2 destructor import-table pointer | `0x22d6e8` | `0x22f7c8` |
| Optional FrameSubmitted import-table pointer | `0x22ef80` | `0x231068` |

All pointer addresses in this table are ELF virtual addresses. Their raw file locations are 0x4000 lower in these exact binaries. Runtime addresses are load bias plus virtual address; never add raw offsets to the load bias.

All selected methods and the codec vtable are `STB_GLOBAL/STV_DEFAULT`. Vtable records use `R_AARCH64_ABS64` (257); import-table records use `R_AARCH64_JUMP_SLOT` (1026). Both binaries have bind-now flags, no `DT_SYMBOLIC`, and the relevant pointer slots are covered by `PT_GNU_RELRO`.

## Call coverage and destruction

An instruction-aligned B/BL scan of every executable section finds no immediate branch directly to the original 12 inspected function definitions. Acquire, Submit, Flush and Init have only the listed vtable relocations. Stop additionally has 1 import-table call from the nondeleting destructor. FrameSubmitted additionally has 1 import-table call from FEC ordered submission. The other 22 packaged arm64 native libraries per base contain no dynamic-symbol reference to these original 12 selected methods. AcceptVideoPacket and InternalAcceptFrameFromRX were subsequently added for installer preconditions; their individual branch/relocation results are also retained in the JSON.

D1 and D2 share the same entry: `0xfdb28`/`0xfe8f0`. D0, the deleting destructor, invokes that shared entry through its import-table slot at `0xfdc3c`/`0xfea04`; it then deletes the object. Hooking the D1/D2 vtable entry and import-table slot therefore covers the discovered virtual and deleting-destructor paths without a separate D0 hook. The original D1/D2 invokes Stop, so teardown wrappers must account for that nested call. Destroy per-codec helper state only after the original destructor has finished using the codec, and only once. Stop/Init alone are not object destruction.

This establishes coverage of decoded direct branches and relocation references. It cannot exclude a separately loaded library obtaining a function address with `dlsym`, runtime vtable copies, or another runtime hook. Runtime pointer validation must reject unexpected replacement targets rather than chaining an unknown hook silently.

## Dependency replacement and constructor order

`libmediandk.so` and `libgxr_dbuf.so` are both 13 bytes excluding the terminator. Each actual library contains exactly 1 matching original string, referenced by its `DT_NEEDED`. Neither library has a mediandk entry in `DT_VERNEED`. Preserve the helper's own explicit dependency on the real `libmediandk.so`; verify it in the compiled ELF so linker `--as-needed` cannot silently remove the dependency. This preserves resolution of the scene's media imports through the dependency graph.

AOSP Bionic calls dependency constructors before the parent's `DT_INIT`/`DT_INIT_ARRAY`. Its dlopen path loads/links the library group before invoking constructors, and `dl_iterate_phdr` walks the loaded-object list. Thus installing verified pointer hooks in the helper constructor is supported by that source model. The headset's specific linker build was not inspected. Sources: [constructor traversal](https://android.googlesource.com/platform/bionic/+/refs/heads/main/linker/linker_soinfo.cpp#467), [dlopen and object iteration](https://android.googlesource.com/platform/bionic/+/refs/heads/main/linker/linker.cpp#443).

The constructor should only locate/validate/install, without invoking codec methods or starting decoder work before scene constructors run. Match the mapped scene by its library basename and verified build ID/segments/entry signatures. Avoid calling `dlopen` on the scene from its dependency constructor. If the helper was already initialized before a later scene load, its constructor will not automatically run again; unsupported missing-scene or reload states must leave hooks disabled and report the condition. Initial APK load and uninstall/reload behavior still require runtime verification.

## Data-only installation requirements

- Validate every target pointer against the expected scene function address, plus build ID and code signatures, before changing any pointer. Build ID alone is not a content hash and may survive existing binary patches.
- Resolve every original function directly from the verified load bias and function VA, or save the verified original slot. Do not call a rewritten slot as the original; that recurses into the wrapper.
- Use the runtime page size, validate mapped bounds and original protections, and request read/write access only for the data pages involved. Restore original protection afterward. Executable permission and instruction-cache flushing are unnecessary for this pointer-only method.
- Check all required pages can be made writable before committing hook pointers. On any failure, restore original pointers/protections and keep buffering disabled. A partial set of ownership hooks must never become active. Publish the enabled state only after the complete installation succeeds.
- Treat already-original and already-this-helper states deliberately. Reject mixed or foreign replacements. A fresh helper constructor should not assume an old pointer belongs to its own generation.
- Avoid holding helper locks across original methods that may reenter Stop/Init; Acquire's -10000 path does exactly that. Coordinate generation and destructor ownership with the actual FEC reset path.

## Inline fallback is unnecessary here

The first 16 bytes of Acquire, Submit, Flush, Stop and Init contain no PC-relative instruction in either base. FrameSubmitted is exactly 16 bytes including RET, so a copied original body would already return. However, the destructor's fourth instruction is ADRP and cannot be copied to an arbitrary trampoline unchanged. Data hooks avoid that relocation hazard and avoid editing executing code.

The initial synchronous staging experiment should leave FrameSubmitted, metadata consumers, AcceptVFD and receive error pumping on their stock paths unless the implementation needs an independently justified hook. Their additional layouts are retained as evidence, not an instruction to hook them. Static loading/call coverage does not prove decoder lifecycle correctness or hitch improvement.
