# 0.9.0-beta validation — 2026-09-05

Source under test is the 0.9 port prepared for `1.0.0-beta.1`, based on `e52aa299332a6bf9a0f24cdaae2a523d45423a10`. APKs and raw evidence remain in ignored `local/`. Historical checked boxes in TEST_PLAN.md refer to earlier versions unless explicitly identified here.

## Completed checks

- All seven installed TV AVDs passed Storage tab, folder and video discovery, moving H.264/AVC video, player-ready logging, remote control and return to Storage.
- The 0.9 full-span crash and guest LOCAL badge regression were reproduced, fixed and retested.
- The native MP4 network-session regression was fixed by generic URI transport dispatch; local file reads and unchanged HTTPS delegation also pass a unit regression test.

Settings translations were checked in English, Spanish, Italian, German, French, Portuguese, Japanese, Korean, Simplified Chinese and Traditional Chinese. Live locale sweeps included both pt-BR and pt-PT. The title remains Morphe in every locale. Unlisted languages use English fallback; diagnostic messages and all upstream application strings are outside this translation scope.

## Limits

This is an emulator-tested development build for physical-TV acceptance, not a stable release certification. Physical-TV, commercial-account streaming and long-duration soak acceptance remain outstanding. These runtime checks preceded publication; see [public release Manager validation](../../../validation/1.0.0-beta.1-manager.md) for the subsequent release gate.
