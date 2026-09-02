# Telegram Morphe Patches

A Telegram-only Morphe patch bundle based on the Morphe Patches template.

## Supported Telegram builds

| Package | Version | Version code |
|---|---:|---:|
| `org.telegram.messenger` | 12.10.1 | 70382 |
| `org.telegram.messenger.web` | 12.10.1 | 70389 |
| `org.telegram.plus` | 12.10.1.0 | 22478 |

## Included patches

This repository contains only the Telegram patches from the source repository,
plus the small shared certificate/signature components required by those
patches. It also includes the Rich Message forwarded-sender patch.

### Build locally

```bash
./gradlew :patches:buildTelegramMpp
```

The generated bundle is written to:

```text
patches/build/libs/*.mpp
```

### GitHub Actions

Every push, pull request, or manual workflow run builds the `.mpp` and uploads
it as the `telegram-morphe-patches` workflow artifact.

## Rich Message forwarded sender patch

The patch is based on the Telegram Web 12.10.1 DEX investigation performed for
this project. The inspection record is kept under `telegram-dex-inspection/`.

The patch is intended to preserve the Rich Message while forcing the Rich
Message forwarding author-attribution flag off (drop-author behavior). The Telegram Web build is the verified
DEX reference; the other two package targets are compatibility declarations
and should be tested independently.

## License

GPLv3. See `LICENSE`.
