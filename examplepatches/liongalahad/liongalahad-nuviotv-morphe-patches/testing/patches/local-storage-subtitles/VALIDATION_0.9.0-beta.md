# 0.9.0-beta validation — 2026-09-05

Source under test is the 0.9 port prepared for `1.0.0-beta.1`, based on `e52aa299332a6bf9a0f24cdaae2a523d45423a10`. APKs and raw evidence remain in ignored `local/`. Historical checked boxes in TEST_PLAN.md refer to earlier versions unless explicitly identified here.

## Completed checks

- All seven TV AVDs passed the Morphe switch toggle and settings navigation. The 0.9 three-rail overlay shows Local Storage immediately after None.
- API 28 passed importing a real SRT through Material Files and selecting it in the native player. The player reported all eight sidecar cues ready with buffer preservation.
- API 36 passed SRT import while playing a Storage-library local file. Its private URI identity survives the source-before-controller initialization order; the imported row shows English SDH and the exact filename.
- Ownership, format decoding, selection persistence, duplicate suppression, expiry and MPV rejection have unit coverage. Material Files was installed only in temporary test images; a compatible Android document picker is required.
- The source SRT remains unchanged; imported copies stay in app-private storage.

Settings translations were checked in English, Spanish, Italian, German, French, Portuguese, Japanese, Korean, Simplified Chinese and Traditional Chinese. Live locale sweeps included both pt-BR and pt-PT. The title remains Morphe in every locale. Unlisted languages use English fallback; diagnostic messages and all upstream application strings are outside this translation scope.

## Limits

This is an emulator-tested development build for physical-TV acceptance, not a stable release certification. Physical-TV, commercial-account streaming and long-duration soak acceptance remain outstanding. These runtime checks preceded publication; see [public release Manager validation](../../../validation/1.0.0-beta.1-manager.md) for the subsequent release gate.
