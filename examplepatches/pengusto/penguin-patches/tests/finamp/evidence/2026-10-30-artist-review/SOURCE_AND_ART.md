# Source verification and ART output diagnosis

The Artist backport follows final upstream PR1832 commit
`3f463b0e697f11aeebc37e1a6b614cde391b7f7f`. The native source is based on official
Finamp 1.0.1, with the pinned Flutter 3.47.2 / Dart 3.13.2 toolchain. These source
tests are separate from Android Manager execution.

| Source mask | Passing tests | Exact source and log |
| --- | ---: | --- |
| 4, Artist | 22 | [Source receipt](source-verification.json), [log](source-mask4-tests.log) |
| 12, Artist + offline artist | 26 | [Source receipt](source-verification.json), [log](source-pair12-tests.log) |
| 36, Artist + reviewed Player | 49 | [Source receipt](source-verification.json), [log](source-pair36-tests.log) |
| 127, all seven | 107 | [Source receipt](source-verification.json), [log](source-all-tests.log) |

The runs overlap. Targeted [analysis](source-analysis.log) reports no issues and
[code generation](source-codegen.log) writes zero outputs. The review source diff
replays to all 64 exact affected [tree hashes](source-diff-proof.json). Masks
containing both Artist and offline filtering include the documented correction
to a pre-existing generated provider debug hash. Production behavior is unchanged
by that correction. All 64 native builds have [source/output/delta receipts](native-builds.json),
and their [public source branches](source-publication.json) were independently
checked against the remote references.

## Real ART failure and corrected export

In official Manager 2.2.0 / Patcher 2.0.1 on the disposable Android 15/API35 ARM64
emulator, a one-selection ART run reported success but exported the original
`libapp.so`. Its APK SHA was
`5e4f7e16baf811e070e0b842736c93882519699c8903a40233332ed2806243d1`;
the expected new library was `d7cd3de98598ecac533c957a08ecedcb5e38fd9ad788e069c909b706acc2db3a`.
That output was not installed. Both old and new libraries are 22,283,144 bytes.

The [Patcher's eager raw-resource path](https://github.com/MorpheApp/morphe-patcher/blob/v2.0.1/src/main/kotlin/app/morphe/patcher/resource/coder/ArsclibResourceCoder.kt)
detects already staged file changes through metadata. Its content-hash check
protects a different path for files extracted on demand. The observed run used
eager decoding; the actual shipped Manager DEX was checked separately.

The [controlled Android probe](android-filetime-probe.json) observed ten of ten
same-length writes with unchanged NIO file time. In some of those cases,
`java.io.File.lastModified()` already reported different milliseconds. This
establishes why a guard based on that latter API would be insufficient.
[Probe source](FileMetadataAndroidProbe.java). It used only temporary files,
removed them afterwards and did not edit Manager or Finamp data.

The [actual Patcher metadata probe](patcher-coarse-filetime-probe.json) reproduces
the missed edit with a deterministic coarse timestamp and detects it after an
explicitly different NIO time, preserving the bytes. [Probe source](FileMetadataProbe.java).
The shared Player update adds the production writer marker and its regression
against the real Patcher; this Artist source backport inherits that packaging fix.

With the corrected writer and the same Artist snapshot, an independently
[verified actual ART export](art-io-recovery/output-verification.json) has the
expected native hash, retained original entries, ARM64-only libraries, the
disposable update certificate, uncompressed libraries and 16 KiB alignment.
Its [source cache](art-io-recovery/source-cache.json), [runtime log](art-io-recovery/runtime-art.log)
and [case receipt](art-io-recovery/case-4-art.json) identify the private checkpoint
and exact exported APK. The input was selected and patched through the normal
Manager UI. This single checkpoint is explicitly marked as an incomplete full
Manager suite.

A controlled engine fault is visibly attributed to **Load artist pages faster**
with no successful output actions. The [fault receipt](art-io-recovery/fault/fault-art.json)
confirms restoration of original cache bytes, owner and mode. A fresh subsequent
[ART recovery export](art-io-recovery/fault/recovery-output-verification.json)
passes the independent output checks. No invalid APK was installed.

These probes establish the tested emulator behavior and exact APK bytes. They
are not measurements of live-server latency, runtime RAM or physical devices.
