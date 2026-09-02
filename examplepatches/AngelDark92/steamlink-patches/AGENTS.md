# Steam Link Morphe patch guidance

The parent workspace `AGENTS.md` also applies. These rules are mandatory for every change under this repository.

## Multi-version compatibility

- Preserve every verified Steam Link adaptation. Adding a new base must extend compatibility and guarded layouts; it must not replace or broaden an older base implicitly.
- Model a verified base as the exact pair `(versionName, versionCode)`. Never assume the version name from the build code.
- Use the primary `AppTarget` constructor so the description is retained:

```kotlin
AppTarget(
    version = versionName,
    versionCodes = SupportedAbi.entries.associateWith { versionCode },
    description = description,
)
```

- A `Compatibility` may contain several `AppTarget`s when their `version` strings differ. Morphe rejects duplicate version strings inside one `Compatibility`, so builds that share a version name must remain separate `Compatibility` objects and be passed together with `compatibleWith(*items.toTypedArray())`.
- `versionCodes = null` means every build code for that version. Use it only when every such build is intentionally supported. Use an explicit experimental target for warning-only unknown-version work; exact compatibility does not weaken patch preconditions.
- `Patch.default` is global, not per version/build. Preserve old defaults by filtering exact compatibility entries rather than changing a shared patch default or duplicating a patch name.
- Morphe executes dependencies recursively without re-checking their compatibility. Every build-specific dependency or mutation body must independently return unchanged on excluded builds before reading or writing target files.

## Base adaptation safety

- Pin native layouts by exact file size, SHA-256 where available, symbol-derived offsets, and original/already-patched byte preconditions. Unknown layouts must fail closed or remain unchanged; never infer offsets from a neighboring build.
- Validate all edits atomically and idempotently. Do not use global replacement counts when a supported binary can contain a legitimate duplicate.
- Compare manifests, DEX classes/methods, config assets, renderer topology, and native symbols before declaring a patch compatible. Build-specific experiments stay isolated unless the new base demonstrates the same contract.
- Keep generated catalogs and tests synchronized with source compatibility. Report Gradle/static validation separately from actual Morphe APK patching, installation, ADB, headset, and SteamVR runtime proof.
- Analysis reconstructions and malformed/hybrid APK extractions are evidence sources, not installable or byte-for-byte pristine APKs. Do not claim an end-to-end patching result without a pristine source APK.

## Official Morphe references

- Multi-version `AppTarget` example: https://github.com/MorpheApp/morphe-patcher/blob/v1.9.0-dev.1/docs/2_2_patch_anatomy.md#L12-L37
- `AppTarget` and `versionCodes`: https://github.com/MorpheApp/morphe-patcher/blob/v1.9.0-dev.1/src/main/kotlin/app/morphe/patcher/patch/Compatibility.kt#L55-L101
- Duplicate-version validation and compatibility helpers: https://github.com/MorpheApp/morphe-patcher/blob/v1.9.0-dev.1/src/main/kotlin/app/morphe/patcher/patch/Compatibility.kt#L299-L359
- `compatibleWith` behavior: https://github.com/MorpheApp/morphe-patcher/blob/v1.9.0-dev.1/src/main/kotlin/app/morphe/patcher/patch/Patch.kt#L480-L523
- Global patch metadata: https://github.com/MorpheApp/morphe-patcher/blob/v1.9.0-dev.1/src/main/kotlin/app/morphe/patcher/patch/Patch.kt#L27-L51
- Recursive dependency execution: https://github.com/MorpheApp/morphe-patcher/blob/v1.9.0-dev.1/src/main/kotlin/app/morphe/patcher/Patcher.kt#L71-L103
