# Contributing

## Layout

| Path | What lives there |
| :--- | :--- |
| `patches/` | Kotlin patch bundle (`patches-*.mpp`). Fingerprints, bytecode patches, patch list. |
| `extensions/` | Java extension code (`extensions/*.mpe`), injected into the app at runtime. `shared` holds code common to all extensions; `macrofactor` is the MacroFactor-specific one. |
| `docs/recon/` | Per-app-version reverse-engineering notes. See [Reverse-engineering notes by version](docs/recon/README.md). |
| `.github/workflows/` | `verify.yml` (build + tests on every push/PR), `verify-patches.yml` (fingerprints against a supplied APK), `release.yml` (semantic-release). |

## How a patch is put together

1. **Fingerprint** (`**/Fingerprints.kt`) — locates the target method in smali. Prefer shape and
   string filters (`parameters`, `returnType`, `accessFlags`, `string(...)`, `methodCall(...)`) over
   class or method names: R8 keeps framework descriptors and string constants, not your names.
2. **`bytecodePatch { }`** — declares `name`, `description`, `default`, then `execute { }`, which
   injects smali through the matched `MutableMethod`.
3. **`compatibleWith(...)` / `availability(...)`** — declares the supported app versions and
   preconditions (e.g. `requireRootMount`), so the patch is hidden or refused on unsupported builds.
4. **Extension hook** — the injected smali calls into an extension class (`dependsOn(...ExtensionPatch)`);
   the Java side is in `extensions/macrofactor`. Keep the injected call free of app-specific
   signatures so it survives obfuscation.

## Adding support for a new app version

1. Add an `AppTarget` entry with the new version in `patches/src/main/kotlin/…/**/Constants.kt`.
2. Run `.github/workflows/verify-patches.yml` (`workflow_dispatch`) with the new APK's `apk_url` and,
   optionally, the `patch_name` you expect. It builds the bundle, applies it through `morphe-patcher`
   and fails on the first fingerprint that no longer matches.
3. **Expect breakage.** Any R8 change (5.8.13 switched to whole-dex class renaming) can rename
   classes and invert `static`/`final`, which changes both the class-match and the parameter register
   (`p0` vs `p1`). Fix the fingerprint by shape — `.locals`/`.registers` count, parameter descriptors,
   a distinctive string constant — not by a new guessed name.
4. Record what you found, and the smali it came from, in `docs/recon/<version>.md`.
5. `./gradlew buildAndroid` locally (see the README for prerequisites) before opening a PR.

## Credentials

Never put a token in the repo. `gradle.properties` is tracked and only holds `version` (the release
job bumps it) — it must stay safe to publish.

- Local: `gpr.user` / `gpr.key` in `~/.gradle/gradle.properties`, or `GITHUB_ACTOR` /
  `GITHUB_TOKEN` in the environment.
- CI: `GITHUB_ACTOR` / `GITHUB_TOKEN` from `secrets.GITHUB_TOKEN`.

The token only needs `read:packages` for `maven.pkg.github.com/MorpheApp/registry`.
