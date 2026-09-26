# Contributing

Thanks for helping improve Telegram Morphe Patches.

## Before opening an issue

For patch failures, include:

- Telegram version and version code
- Morphe Manager version
- Morphe Patcher version
- The complete fingerprint/patch exception
- The patch name that failed

Please remove personal information, account data, tokens, and private APKs.

## Pull requests

Keep changes focused and explain what changed, why it is needed, which Telegram version was inspected, and how the patch was verified.

For fingerprint changes, prefer evidence from the target APK's actual DEX structure over guessed or signature-only mappings.

## Building

Run `./gradlew clean buildAndroid`.

The generated `.mpp` bundle is written to `patches/build/libs/`.

## Compatibility

Telegram bytecode changes frequently between releases. Update fingerprints and patch logic only against the exact supported Telegram version, and verify the resulting bundle with Morphe before publishing.
