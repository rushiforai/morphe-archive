# Offline verification — Taobao 10.66.30

## Provenance

- Original: `com.taobao.taobao` 10.66.30 arm64-v8a APK (user-supplied, not committed)
- Original SHA-256: `3e709717a60fdeeb59354df60fb6cf279ffb023c01e095e16bccfbad75f683dd`
- Tested signed output SHA-256: `277d142f4fa9f1386a15c3f1c789ec7ede01087bbff4a53132a7e192479086e2`
- Source patch: `TaobaoLingo: Force English UI`, *only* this patch enabled
- Rebuild mode: `FULL`
- Tested CLI: Morphe Desktop 1.18.1, Morphe Patcher 1.15.1

## API compatibility

The canonical `patches-0.1.0.mpp` from GitHub Actions builds **successfully** with Morphe Patcher **2.0.0**. Morphe Desktop **1.18.1** embeds Patcher **1.15.1**, so this 2.0 bundle fails at load time with `NoSuchMethodError: Compatibility.<init>`.

To verify the same patch logic offline, a Desktop-1.18-compatible test bundle was built using `scripts/build_legacy_cli.py`. It substitutes exact DEX access flags for Patcher 2.0's `isStatic` fingerprints and compiles against the Desktop 1.18 JAR. This legacy bundle is for CLI testing only (it does not contain Android `classes.dex`).

## End-to-end test

Morphe Desktop 1.18.1 successfully:

1. Matched `com.taobao.taobao` version `10.66.30`.
2. Applied only `TaobaoLingo: Force English UI`.
3. Rebuilt all 13 DEX files in FULL mode.
4. Reassembled, aligned, and signed the APK.

The patcher JSON report was `PATCHING=true, REBUILDING=true, SIGNING=true`, with **zero failed patches**.

## Independent checks on output

| Check | Result |
| --- | --- |
| ZIP integrity | Pass (`ZipFile.testzip() == None`) |
| APK entries | 5,985, same number as original |
| Android APK signature verification | **Pass**, v1 + v2 + v3; no verification errors |
| `Localization.h()` | Starts with `sget-object v0, Language.ENGLISH; return-object v0` |
| `LocalizationManager.d()` | Starts with `sget-object v0, Locale.ENGLISH; return-object v0` |
| `Localization.o()` and `SceneIdentifier.isI18nEdition()` | Original entry instructions retained |
| Non-DEX, non-signature ZIP contents | No changes to decompressed files |
| Rebuilt DEX files | All 13 changed, as expected with FULL rebuild |
| Final APK file | 81,773,647 bytes |

The original signing certificate is replaced with a local Morphe signing key. **Neither the proprietary APK nor the signing key is checked into Git.**

## Remaining verification

**Android installation, app launch, account login, actual translated UI coverage, regional behavior, and purchase flow are NOT verified.** Build/signature validation cannot establish these runtime properties. Japanese localization and server/WebView translation are not implemented.

Device test: install the patch variant, observe settings/product listing/detail/cart, and compare language and shipping currency/region with the original. Record any errors and screenshots in an issue without credentials.
