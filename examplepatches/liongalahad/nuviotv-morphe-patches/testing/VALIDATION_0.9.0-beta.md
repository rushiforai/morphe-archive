# NuvioTV Morphe 0.9.0-beta validation — 2026-09-05

The official [NuvioTV 0.9.0-beta release](https://github.com/NuvioMedia/NuvioTV/releases/tag/0.9.0-beta) was ported with all seven existing patches. Source changes were prepared for 1.0.0-beta.1, based on e52aa299332a6bf9a0f24cdaae2a523d45423a10. This is a development APK for physical-TV acceptance. These runtime checks preceded publication; release-asset Manager validation is recorded separately in validation/1.0.0-beta.1-manager.md.

## Final ARM32 artifact

- Package: com.nuvio.morphe (side-by-side installation).
- Version: 0.9.0-beta; ABI: armeabi-v7a.
- File: local/port-0.9.0/runtimefix6-armeabi-v7a/patched.apk
- Size: 72,926,224 bytes.
- SHA-256: 60e9adafa32c0b9c3ac886438b576fb86bc7624750e3f3ecf3881d2d1fc216d9
- Android signature verification and 16 KB ZIP alignment passed. The final combined build also passed patch application, signing and alignment for arm64-v8a, x86_64 and universal.

## Automated and isolated validation

295 extension tests and 9 patch tests passed, with zero failures, errors or skipped tests. Android lintDebug and non-empty Android DEX bundle validation passed. Isolated application and manifest/DEX inspections passed for all seven patches across four APK variants (28 combinations). The evidence matrix records each exact bundle hash: unchanged patch compartments retain earlier passing runs; the final affected subtitle/download compartments were rerun after their last changes. A transient archive-read failure during overlapping bundle reassembly was rerun successfully against a frozen bundle.

Raw evidence is retained under ignored local/port-0.9.0: automated-test-counts.json, artifact-verification.json, isolated-matrix.json, final-checks.log and per-emulator logs, screenshots and result files. Isolated patch evidence is under local/patches/<id>/<run>.

## TV emulator coverage

All seven installed TV AVD profiles were exercised. Each passed the settings sweep and local H.264 discovery/playback/remote-control/return-to-Storage checks. The final candidate received 30 additional cold launches across API 28 and API 36, including 4K, with no app crash, verifier error or ANR observed in those runs.

| AVD | API | Display | Last playback build stage |
| --- | --- | --- | --- |
| Television_4K | 36 | 4K | runtimefix5; final 6 cold launches |
| AndroidTV_API28_QA | 28 | 1080p | runtimefix5; final 6 cold launches |
| AndroidTV_API36_QA | 36 | 1080p | runtimefix6 |
| Shield_API30_QA | 30 | 1080p | runtimefix4 |
| Shield_Diagnostic_QA | 36 | 1080p | runtimefix4 |
| Stremio_Morphe_Public_QA | 36 | 4K | runtimefix4 |
| Television_4K_Morphe_POC | 36 | 4K | runtimefix4 |

Build stages are retained to make coverage precise: runtimefix5 corrected preferred-subtitle-language parsing and local subtitle identity; runtimefix6 corrected the ordering of local URI observation. The final local-file subtitle import was verified on API 36. Earlier broad settings/playback results cover unchanged behavior. ARM binaries were built and inspected; the available emulators execute x86/x86_64 binaries, so ARM hardware acceptance remains with the physical TV.

## Settings localization

Catalogs cover English, Spanish, Italian, German, French, Portuguese, Japanese, Korean, Simplified Chinese and Traditional Chinese. Live sweeps passed it, es, de, fr, pt-BR, pt-PT, ja, ko, zh-CN and zh-TW: invariant Morphe branding, translated categories and four subtitle-processing choices, with D-pad selection. Unit checks cover catalog completeness and locale fallback. Portuguese regional locales share the Portuguese catalog. Other languages fall back to English. This covers Morphe settings and the translated feature surfaces documented per patch; diagnostic messages and the entire upstream app were not comprehensively translated or linguistically reviewed by native speakers.

## Patch-specific evidence

- [Local Downloads](patches/local-downloads/VALIDATION_0.9.0-beta.md)
- [Local Media](patches/local-media/VALIDATION_0.9.0-beta.md)
- [Allow Importing Subs from Local Storage](patches/local-storage-subtitles/VALIDATION_0.9.0-beta.md)
- [Random Episode](patches/random-episode/VALIDATION_0.9.0-beta.md)
- [Remove SDH Annotations](patches/sdh-annotations/VALIDATION_0.9.0-beta.md)
- [Mark SDH Subtitles](patches/sdh-marking/VALIDATION_0.9.0-beta.md)
- [Side-by-side installation](patches/side-by-side-installation/VALIDATION_0.9.0-beta.md)

## Acceptance limits

Functional emulator checks include local playback, download completion and byte-hash equality, preferred subtitle download, duplicate rejection, hide/reopen/cancel and partial cleanup, delete, subtitle import and native sidecar selection, random episode continuation and persisted pool selection. Unit tests cover additional parser, SDH transformation, storage-capacity, overwrite and segmentation cases. Physical USB/FAT32 files over 4 GB, commercial-account streaming, every possible subtitle cue and long-duration playback soak were not tested live. Emulator success does not establish crash-free operation on every physical TV. The user-delivered APK is ready for that acceptance test.
