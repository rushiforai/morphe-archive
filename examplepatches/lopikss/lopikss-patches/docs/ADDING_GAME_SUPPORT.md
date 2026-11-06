# Adding support for another game

A **single universal zero-cost patch is not realistic**: different games use different asset formats, currencies and verification logic. This project instead supplies a **reusable editor** for one supported kind of Unity serialized cost table, with a small game/version-specific adapter.

## Reusable component

The Kotlin helper `patches/src/main/kotlin/app/lopikss/patches/shared/UnityCostTableEditor.kt`:

- Requires a known original asset **SHA-256**.
- Matches rows containing `cost_param`, `cost_type`, `cost_value`, `group_id` and companion fields in the expected JSON field order.
- Changes **only** explicitly listed currency/type/group IDs when their old prices match.
- Pads replacements to the same character width, leaving asset length unchanged.
- Rejects duplicate rules, missing rows and mismatched input assets rather than blindly patching unknown versions.

It's **not** an IL2CPP decompiler, automatic store detector, receipt bypass or server-validation bypass.

## Per-game adapter checklist

1. Confirm the Android **package ID, app version, file type** (APK/XAPK) and what the store actually reads.
2. Inspect an unmodified, legitimately obtained APK **locally**. Find the correct resource and understand its schema. Do **not** put copyrighted game binaries or private account data into GitHub.
3. Confirm the selected prices actually correspond to the requested items; distinguish gems from coins, advertisements and real-money IAPs.
4. Record the original resource **SHA-256** and each exact `groupId` + expected price pair.
5. Create a game adapter, analogous to `ExchangeCostTransformer.kt`, calling `UnityCostTableEditor.rewrite(...)` with the exact matching information.
6. Register a Morphe `rawResourcePatch` for the game's specific package/version (see `XPHeroExchangeMaterialsPatch.kt`), **disabled by default**.
7. Regression-test on the original resource. Verify only intended bytes change; wrong versions must fail explicitly.
8. Run `./gradlew :patches:buildAndroid`. Back up progress, then test in-game on an isolated installation.
9. Only mark a patch **user-tested** when someone verifies it works; keep untested or unsupported versions clearly labeled.

If the game uses a different format, engine or server-controlled transaction logic, this shared helper may be inapplicable and you'll need a different, game-specific implementation.

## Ask for support

You can [DM **@lopikss** on Discord](https://discord.com/users/493792470778511360) or [open a GitHub patch request](https://github.com/lopikss/lopikss-patches/issues/new/choose).

Please provide: game name, package ID, exact version, your device/Android version if relevant, what screen or feature you mean, and screenshots if useful. Do not post account credentials, receipt data, confidential saves or proprietary APKs in public issues.
