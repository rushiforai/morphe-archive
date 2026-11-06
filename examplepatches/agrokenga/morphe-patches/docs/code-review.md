# Code Review Notes

## Resolved in commits up to `d39d9aa`

### CI and release

- Release previously ran `npx semantic-release` **before** the build and then ran
  `./gradlew :patches:buildAndroid clean`, which deletes the build output after producing it.
  Fixed by building first and running `clean` before `buildAndroid`.
- Verify now has a real build gate instead of only running on some branches.
- GitHub Packages authentication failed because `settings.gradle.kts` used only
  `gpr.user` or `GITHUB_ACTOR`, and Semaphore did not set `GITHUB_ACTOR`. Fixed with fallbacks
  to `GITHUB_REPOSITORY_OWNER` and `SEMAPHORE_GIT_REPO_OWNER`, plus a preflight request for the
  plugin POM.
- The release job no longer writes a global `~/.git-credentials` file. It uses a temporary
  `GIT_ASKPASS` script and cleans it up.
- Semaphore Ubuntu images do not include the Android SDK. Added
  `scripts/install-android-sdk.sh`, which installs command-line tools, platform 36,
  build-tools 36.0.0, and writes `local.properties`.

### Project metadata and branding

- `patches/build.gradle.kts`: author/contact/website now point to Agrokenga.
- `extensions/extension/build.gradle.kts`: namespace is `io.agrokenga.extension`.
- Packages moved from `app.template.*` and `com.morphe.*` to `io.agrokenga.*`.
- `ExamplePatch` is no longer enabled by default.
- `Constants.kt` app icon colors are consistently `0xFF0045`.
- `IAPBypassPatch` now declares `ApkFileType.APKM`, not `APK`.
- `README.md`, issue templates, `NOTICE`, `CONTRIBUTING.md`, and `patches-bundle.png` were
  added/updated.
- `.gitignore` no longer pretends to ignore the tracked `gradle.properties`.

### Tooling

- `.github/scripts/generate_patches_readme.py`
  - `versions_table` now builds one filtered `entries` list, so null-version targets do not
    misalign the table columns.
  - `re.sub` uses a replacement lambda so backslashes in generated content are not interpreted.
- `PatchListGenerator.kt`
  - Deterministic sorted `.mpp` selection with clear errors.
  - Reads `Version` from `META-INF/MANIFEST.MF` via `JarFile`.
  - NOTE now says `Semaphore CI` instead of the nonexistent `release.yml`.
- Semaphore caching added for Gradle dependencies, Gradle wrapper distributions, and the
  Android SDK.

## Open issues

### 1. Current IAP patch files do not compile

`IAPBypassPatch.kt` is a partial static-patch attempt with no enclosing `resourcePatch`; it
also uses `ByteArray.chunked(...)`, which does not exist. `IAPNativeProbePatch.kt` contains a
top-level `resourcePatch(...)` call, no imports, and a `target { ... }` / `patchBytes(...)`
DSL that Morphe does not provide.

Until this is fixed, the module cannot build.

### 2. `IAPBypassPatch` still says `@author Morphe Patches`

This should be `@author Agrokenga` if the file is kept.

### 3. `STATIC_PATCH_PLAN.md` is inaccurate

It assumes DEX wrappers and a `readBytes(apk, dexOffset + methodRva)` API. The app is IL2CPP;
the relevant logic is in `libil2cpp.so`, and Morphe exposes `get(...)` on a
`ResourcePatchContext`, not methods on the APK itself. It also proposes a `target` DSL that
does not exist.

### 4. Generated metadata is stale

`patches-list.json` was generated from the older source. Regenerate after the code compiles.

### 5. Instrumentation approach is not a static patch

Frida is a runtime instrumentation framework. A `resourcePatch` executes at build time and
cannot start a Frida server or hook a live process. Bundling a Frida gadget would be a
different architecture and still would not be a Morphe resource patch.

### 6. IAP is server-authoritative

The client can be modified to change UI state or local callbacks, but PlayFab validation,
Google Play purchase tokens, and server-side entitlement grants are not decided by the client.
The Ghidra analysis in `projects/com.paradoxplaza.kopp2/ghidra/analysis.md` found no evidence
that an offline client can authoritatively complete a real-money purchase.

### 7. Dependency verification is not enabled

Gradle wrapper checksum is present, but dependency verification metadata is not. This is a
supply-chain hardening gap, not a build failure.

### 8. Verify uses the full release secret

The Verify job attaches `morphe-patches-ci`, which contains the signing key as well as the
GitHub token. If Semaphore exposes secrets to fork PRs in this setup, use a read-only token
secret for Verify.

## Security notes

- Do not commit `morphe-signing.key`, `local.properties`, or tokens.
- A secret scan of history found no leaked tokens; `settings.gradle.kts` only reads
  environment variables.
- `.releaserc` uses an empty `signatureUrlTemplate` with `publicKeyPath`; this matches the
  upstream optional-signing design. The local private key is gitignored.
