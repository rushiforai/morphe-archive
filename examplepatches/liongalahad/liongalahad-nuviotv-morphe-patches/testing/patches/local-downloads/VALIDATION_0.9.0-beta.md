# 0.9.0-beta validation — 2026-09-05

Source under test is the 0.9 port prepared for `1.0.0-beta.1`, based on `e52aa299332a6bf9a0f24cdaae2a523d45423a10`. APKs and raw evidence remain in ignored `local/`. Historical checked boxes in TEST_PLAN.md refer to earlier versions unless explicitly identified here.

## Completed checks

- All seven TV AVDs passed settings visibility, enable/disable, dependent controls, 1% and 100% slider bounds, restoration to 80%, autoplay toggle, storage picker and Downloads manager navigation.
- API 28 passed movie download action, long-press Play/Download menu, unsupported playlist rejection, same-source duplicate rejection, successful 16,090,018-byte download, SHA-256 equality, native local playback and deletion of the video folder.
- The corrected 0.9 language parser saved the 487-byte preferred English SRT beside the movie. Hide, reopen progress, Cancel and partial-file cleanup passed on a throttled HTTP fixture.
- Index identity, different-source overwrite, per-episode isolation, storage-capacity limits and FAT32 segmentation retain unit coverage. Live greater-than-4-GB FAT32 and physical USB tests were not performed in this port.

Settings translations were checked in English, Spanish, Italian, German, French, Portuguese, Japanese, Korean, Simplified Chinese and Traditional Chinese. Live locale sweeps included both pt-BR and pt-PT. The title remains Morphe in every locale. Unlisted languages use English fallback; diagnostic messages and all upstream application strings are outside this translation scope.

## Limits

This is an emulator-tested development build for physical-TV acceptance, not a stable release certification. Physical-TV, commercial-account streaming and long-duration soak acceptance remain outstanding. These runtime checks preceded publication; see [public release Manager validation](../../../validation/1.0.0-beta.1-manager.md) for the subsequent release gate.
