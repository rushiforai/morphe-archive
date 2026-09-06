# 0.9.0-beta validation — 2026-09-05

Source under test is the 0.9 port prepared for `1.0.0-beta.1`, based on `e52aa299332a6bf9a0f24cdaae2a523d45423a10`. APKs and raw evidence remain in ignored `local/`. Historical checked boxes in TEST_PLAN.md refer to earlier versions unless explicitly identified here.

## Completed checks

- All seven TV AVDs passed the global setting toggle.
- API 28 exercised a synthetic four-episode series, saved the per-show Unwatched-only pool, retained it across force-stop and reopened the pool dialog.
- A 130-second H.264 fixture exercised natural random continuation and the Next episode action. The native inactivity prompt appeared after continued playback and was handled.
- Route construction preserves the new profile ID. Pool selection, fallback, watched filtering and continuation identity retain automated coverage.

Settings translations were checked in English, Spanish, Italian, German, French, Portuguese, Japanese, Korean, Simplified Chinese and Traditional Chinese. Live locale sweeps included both pt-BR and pt-PT. The title remains Morphe in every locale. Unlisted languages use English fallback; diagnostic messages and all upstream application strings are outside this translation scope.

## Limits

This is an emulator-tested development build for physical-TV acceptance, not a stable release certification. Physical-TV, commercial-account streaming and long-duration soak acceptance remain outstanding. These runtime checks preceded publication; see [public release Manager validation](../../../validation/1.0.0-beta.1-manager.md) for the subsequent release gate.
