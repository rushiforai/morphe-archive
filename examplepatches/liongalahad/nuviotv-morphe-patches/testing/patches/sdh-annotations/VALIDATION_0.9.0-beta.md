# 0.9.0-beta validation — 2026-09-05

Source under test is the 0.9 port prepared for `1.0.0-beta.1`, based on `e52aa299332a6bf9a0f24cdaae2a523d45423a10`. APKs and raw evidence remain in ignored `local/`. Historical checked boxes in TEST_PLAN.md refer to earlier versions unless explicitly identified here.

## Completed checks

- All seven TV AVDs selected all four cleanup modes and restored the original Normalize setting.
- Ten locale configurations passed translated mode-dialog navigation and selection.
- Live Media3 sidecar subtitles loaded the eight-cue synthetic fixture. Detailed cleanup behavior, multiline annotations, lyric preservation and normalization are covered by automated tests; no claim is made that arbitrary real-world subtitles are perfectly classified.

Settings translations were checked in English, Spanish, Italian, German, French, Portuguese, Japanese, Korean, Simplified Chinese and Traditional Chinese. Live locale sweeps included both pt-BR and pt-PT. The title remains Morphe in every locale. Unlisted languages use English fallback; diagnostic messages and all upstream application strings are outside this translation scope.

## Limits

This is an emulator-tested development build for physical-TV acceptance, not a stable release certification. Physical-TV, commercial-account streaming and long-duration soak acceptance remain outstanding. These runtime checks preceded publication; see [public release Manager validation](../../../validation/1.0.0-beta.1-manager.md) for the subsequent release gate.
