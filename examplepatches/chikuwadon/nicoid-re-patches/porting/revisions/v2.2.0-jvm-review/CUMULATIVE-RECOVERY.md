# v2.2.0 cumulative recovery from the original dev.5 source snapshot

Status: unpublished release preparation. Maintainer approval to release has already been received.

Original dev.5 full repository source and dev.110 MPP/source delta were recovered from maintainer-provided archives. The checked-in dev.5 payload is not the staged device-tested dev.5 MPP. Its two Git blobs match the current preparation branch:
- helpers.mpe: b25fdb888d2196eefbf8cec504f3c1b2d650fe12
- method-delta.dex: c5caa42b70525a3c97f61fd657fcc45723a661f1

The cumulative class overlays reconstruct dev.110 and then the final audited DEX without requiring dev.6–109 individual delta archives. All four reassembled DEX hashes match:
- dev.110 helper (8,898 classes): c048054f80cc769d00d23730a55d1bbc1b8873a4f6c455b3eb5f7ffc35d0faa5
- dev.110 method delta (211 classes): 6cbc43f3c0815308e0817a0ed343823bd53a707a656323ddd33616dfc82dbf08
- final helper: 93bb4a9292290bd0483d9c20a6f3e3bd2f6e1c5227e1e4560e5ede90105c031b
- final method delta: beeaf475e6a15d15a48797c8704c416800028f9567cd7a6a4cb3f88ec908de03

From dev.110 to final: 125 helper and six method-delta class replacements, no class additions/removals. The integrated build starts from the original dev.5 source snapshot and locked cumulative overlays, recompiles the Java/Kotlin patcher, and regenerates the exact previously audited 5,517,602-byte MPP (SHA256 151cc1e7eeed2450855de8b7f115c038a47420b6bd48ac3f5d75d28df4695aa7) without using an existing MPP as build input. Fresh Morphe 2.5.0 patch application against the stock 6.49 APK passed: 11,414 classes, zero class differences, four DEX and 1,191 resources byte-identical to the locked reference. Requested STRIP_SAFE fell back to FULL locally. This is not a fresh Manager 2.8.0 / Patcher 2.6.0 device test.

The private combined source review archive contains 20,836 files and 13,155 hash-locked transfer source files, SHA256 ee9ea0fa443b66ef4483ac9b9aea2b30ea75007836824253edb6b4f9c3381dbc. It includes original dev.5 sources, the original dev.110 deletion guard and its final-source diff, cumulative overlays, final reconstructed source, logs, and isolated Gradle verification tasks. The standalone shell build and patch verification passed. Gradle execution itself and staging into an actual GitHub checkout remain untested.

No claim is made that the original intermediate Java/Kotlin history, preferred corresponding source, or all third-party licensing is completely recovered. The remaining source/provenance and license review, bulk transfer, standard Gradle/release integration, CI/CodeQL and device verification remain release gates. The normal published version and metadata remain unchanged. No tag, merge or Release was created.
