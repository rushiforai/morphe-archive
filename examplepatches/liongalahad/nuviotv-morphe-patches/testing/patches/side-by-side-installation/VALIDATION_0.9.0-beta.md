# 0.9.0-beta validation — 2026-09-05

Source under test is the 0.9 port prepared for `1.0.0-beta.1`, based on `e52aa299332a6bf9a0f24cdaae2a523d45423a10`. APKs and raw evidence remain in ignored `local/`. Historical checked boxes in TEST_PLAN.md refer to earlier versions unless explicitly identified here.

## Completed checks

- All seven TV AVDs installed and launched com.nuvio.morphe. The original com.nuvio.tv package was not removed.
- Manifest tests cover the new icon-selection launcher aliases and consistent Nuvio Morphe labels.
- Every combined APK passed signature and 16 KB zip-alignment validation. The delivery variant contains only armeabi-v7a native libraries.

## Limits

This is an emulator-tested development build for physical-TV acceptance, not a stable release certification. Physical-TV, commercial-account streaming and long-duration soak acceptance remain outstanding. These runtime checks preceded publication; see [public release Manager validation](../../../validation/1.0.0-beta.1-manager.md) for the subsequent release gate.
