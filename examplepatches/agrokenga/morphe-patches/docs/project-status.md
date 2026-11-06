# Project Status

## Git state

| Ref | Commit | Notes |
|---|---|---|
| `dev` | `d39d9aa` | Checked out; includes the review fixes and the ELF32 probe fix. |
| local `main` | `d39d9aa` | Rebased onto `origin/main`; **not pushed**. |
| `origin/dev` | `d39d9aa` | Pushed. |
| `origin/main` | `113429b` | Release commit `chore: Release v1.0.0 [skip ci]`; tag `v1.0.0`. |

Recent commits:

```text
d39d9aa fix(iap): parse ELF32 segment flags correctly
113429b chore: Release v1.0.0 [skip ci]
c55e88a fix(ci): install Android SDK before Gradle builds
047809e chore: regenerate patches list
dd23dab fix(tooling): harden patch metadata generation
f994761 docs: update project documentation and issue templates
7b052f0 fix(ci): authenticate GitHub Packages and gate releases on build
9f746fa feat(iap): add native libil2cpp probe patch
13a6a7f refactor: rebrand packages and project metadata to agrokenga
```

## Working tree

```text
 M .semaphore/semaphore.yml
 M patches/src/main/kotlin/io/agrokenga/patches/iap/IAPBypassPatch.kt
 M patches/src/main/kotlin/io/agrokenga/patches/iap/IAPNativeProbePatch.kt
?? STATIC_PATCH_PLAN.md
?? docs/
```

The two patch files are **not** the versions from `d39d9aa`. They were replaced with
experimental static-patch code that does not compile.

## Build status

`./gradlew :patches:compileKotlin --offline --no-daemon` fails.

Representative errors:

- `IAPBypassPatch.kt`
  - `List<Byte>` passed where `ByteArray?` is expected (`buffer.take(4)`).
  - `ByteArray.chunked(...)` does not exist.
  - Top-level `execute { ... }` with no enclosing `resourcePatch`.
  - `enableBypass`, `get`, and `readBytes` unresolved.
  - `return@resourcePatch` used outside a `resourcePatch` builder.
- `IAPNativeProbePatch.kt`
  - No `package` or imports.
  - Top-level `resourcePatch(...)` call.
  - `target { ... }` and `patchBytes(...)` are not Morphe APIs.
  - `logger.success(...)` / `logger.error(...)` are not `java.util.logging.Logger` methods.
  - `booleanOption` and `Compatibility` unresolved.

The last compile-clean state is `d39d9aa`.

## Generated metadata

`patches-list.json` still describes the older patches:

- `IAP Bypass Patch` — old bytecode description, `APKM`, `default: false`.
- `IAP Native Probe` — read-only diagnostic description.
- `Example Patch` — default `false`.

The current source no longer matches those descriptions. Regenerate only after the source
compiles:

```bash
./gradlew :patches:generatePatchesList --offline --no-daemon
```

## Immediate next steps

1. Decide what to keep:
   - restore the probe from `d39d9aa`:
     ```bash
     git show d39d9aa:patches/src/main/kotlin/io/agrokenga/patches/iap/IAPNativeProbePatch.kt \
       > patches/src/main/kotlin/io/agrokenga/patches/iap/IAPNativeProbePatch.kt
     ```
   - or replace the broken attempts with a small, valid diagnostic patch.
2. Remove or rewrite `STATIC_PATCH_PLAN.md`; it contains incorrect assumptions about DEX and
   about Morphe's patch DSL.
3. Keep `IAPBypassPatch` disabled (`default = false`, option default `false`) or remove it.
4. Run compile and build:
   ```bash
   ./gradlew :patches:compileKotlin --offline --no-daemon
   ./gradlew clean :patches:buildAndroid :patches:generatePatchesList --offline --no-daemon
   ```
5. Review the uncommitted Semaphore caching change and commit it separately.
6. Do not commit `morphe-signing.key`, `local.properties`, or any token.

## Known limitations

- No Morphe CLI/Manager is installed in this environment; patch behavior has not been tested
  end-to-end here. The probe results came from running the patch through Morphe Manager 2.3.0.
- The probe offsets are specific to KoPP2 **2.21.4** and must be re-derived for any other
  version.
- `patches-list.json` is generated; do not hand-edit it.
