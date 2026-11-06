# CI and Release Notes

CI is Semaphore. The workflow file is `.semaphore/semaphore.yml`.

## Pipeline blocks

| Block | Purpose |
|---|---|
| Release | Builds the patch bundle, then runs `semantic-release` on `main`/`dev`. |
| Verify build | Builds on pull requests, tags, and non-release branches. |
| Open pull request to main | Opens/updates the `dev` -> `main` pull request. |

The Release job must build **before** releasing. The previous configuration ran
`npx semantic-release` first and then ran `./gradlew :patches:buildAndroid clean`, which
deleted the output after producing it. The current order is:

```bash
./gradlew clean :patches:buildAndroid --no-daemon
npx semantic-release
```

## GitHub Packages authentication

The Morphe plugin is resolved from:

```text
https://maven.pkg.github.com/MorpheApp/registry
```

Gradle needs both a username and a token. `settings.gradle.kts` resolves:

```text
username: gpr.user -> GITHUB_ACTOR -> GITHUB_REPOSITORY_OWNER -> SEMAPHORE_GIT_REPO_OWNER
password: gpr.key  -> GITHUB_TOKEN
```

Semaphore did not set `GITHUB_ACTOR`, so the username was null and GitHub returned 401/404;
Gradle reported the plugin as “not found.” The release prologue now:

- exports `GITHUB_ACTOR` with a fallback;
- fails early if `GITHUB_TOKEN` is unset;
- asks `https://api.github.com/user` for the token owner and overrides `GITHUB_ACTOR`;
- performs a preflight request for the plugin POM and requires HTTP 200.

The preflight URL:

```text
https://maven.pkg.github.com/MorpheApp/registry/app/morphe/patches/
  app.morphe.patches.gradle.plugin/2.1.0/app.morphe.patches.gradle.plugin-2.1.0.pom
```

If it fails, the token needs `read:packages` access to `MorpheApp/registry`, or the token’s
organization needs SSO authorization.

The release job uses a temporary `GIT_ASKPASS` script:

- username: `x-access-token`
- password: `$GITHUB_TOKEN`
- `GIT_TERMINAL_PROMPT=0`
- trap removes the script

It no longer writes a global `~/.git-credentials` file.

## Android SDK

Semaphore’s Ubuntu image does not include the Android SDK. `scripts/install-android-sdk.sh`:

- downloads `commandlinetools-linux-13114758_latest.zip`;
- installs `platform-tools`, `platforms;android-36`, and `build-tools;36.0.0`;
- accepts licenses;
- writes `local.properties` with `sdk.dir`.

Both Release and Verify prologues run the script after checkout and Java 21 setup.

## Caching

Caches are content-addressed with `checksum` and use a `^prefix` regex fallback.

### Restore (both prologues)

```yaml
cache restore "gradle-deps-$(checksum gradle/libs.versions.toml),^gradle-deps-"
cache restore "gradle-wrapper-$(checksum gradle/wrapper/gradle-wrapper.properties),^gradle-wrapper-"
cache restore "android-sdk-$(checksum scripts/install-android-sdk.sh),^android-sdk-"
```

### Store (after a successful build)

```yaml
cache store "gradle-deps-$(checksum gradle/libs.versions.toml)" "$HOME/.gradle/caches" --cleanup-by ACCESS_TIME
cache store "gradle-wrapper-$(checksum gradle/wrapper/gradle-wrapper.properties)" "$HOME/.gradle/wrapper/dists" --cleanup-by ACCESS_TIME
cache store "android-sdk-$(checksum scripts/install-android-sdk.sh)" "${ANDROID_SDK_ROOT:-$HOME/android-sdk}" --cleanup-by ACCESS_TIME
```

Facts:

- The cache CLI is preinstalled in Semaphore jobs.
- Cache is per project, 9.6 GB total on Cloud.
- Entries expire after 30 days or when the cache is full.
- Caches are not available to forked PRs.
- `cache restore` tries the exact key first, then each key as a regex.
- Store only one key per `cache store`; commas are not split for store.
- Absolute paths are preserved (`tar czPf` / `tar xzPf`).
- Cache failures exit 0 unless `CACHE_FAIL_ON_ERROR=true`.
- Store after the build, not in the prologue, to avoid concurrent writes.

npm is not cached; only the three requested caches are configured.

## Release configuration

`.releaserc`:

- assets: `CHANGELOG.md`, `gradle.properties`, `patches-bundle.json`,
  `patches-list.json`, `README.md`;
- `prepareCmd` runs `:patches:generatePatchesList`, updates the version, and regenerates the
  README patch table;
- signing is configured with `publicKeyPath: morphe-signing.pub` and an empty
  `signatureUrlTemplate`, matching the upstream optional-signing design.

A release commit `113429b chore: Release v1.0.0 [skip ci]` and tag `v1.0.0` exist on
`origin/main`.

## Secrets

- `morphe-patches-ci` contains `MORPHE_SIGNING_KEY` and `GITHUB_TOKEN`.
- Verify currently attaches the full secret, including the signing key. If fork PRs can see
  secrets in this setup, create a read-only token secret for Verify.
- Never commit `morphe-signing.key`, `local.properties`, or tokens.

## Local verification

```bash
./gradlew :patches:compileKotlin --offline --no-daemon
./gradlew clean :patches:buildAndroid :patches:generatePatchesList --offline --no-daemon
```

The generated bundle is `patches/build/libs/patches-*.mpp`.

## Current uncommitted change

The caching block is present in the working tree but is not committed. Review it, then commit
separately from the IAP patch cleanup.
