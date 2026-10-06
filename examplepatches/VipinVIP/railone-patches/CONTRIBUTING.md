# Contributing

Build and release notes for this patch bundle. Nothing here is needed to *use* the patches; see
the [README](README.md) for that.

## Build prerequisites

- **JDK 21.** The `app.morphe.patches` Gradle plugin requires exactly 21.
- **Android SDK**, with `ANDROID_HOME` set. The `extensions/extension` module is an Android
  library, so `buildAndroid` compiles it too.
- **Read access to the Morphe package registry.** The `app.morphe.patches` plugin and
  `app.morphe:morphe-patcher` are served from `maven.pkg.github.com/MorpheApp/registry`, which
  requires authentication even for public packages. In GitHub Actions the workflow's automatic
  `GITHUB_TOKEN` covers this (workflow permission `packages: read`), which is why this repository
  needs no secret for CI. Building on your own machine is different: a personal access token only
  gets package access from an explicit scope, so run

  ```bash
  gh auth refresh -h github.com -s read:packages
  ```

  and export `GITHUB_ACTOR=$(gh api user --jq .login)` and `GITHUB_TOKEN=$(gh auth token)`.

## Building

```bash
./build.sh                 # -> patches/build/libs/patches-<version>.mpp
```

`build.sh` prefers a locally extracted Gradle over `./gradlew`, because the wrapper's Java
downloader can time out following services.gradle.org's redirect to GitHub releases on some
networks while `curl` fetches the same file at full speed. Set `GRADLE_BIN` to override.

To exercise a bundle before releasing it, use the Morphe desktop CLI, which is the same engine the
manager uses:

```bash
java -jar morphe-desktop-*-all.jar list-patches --patches=patches/build/libs/patches-<ver>.mpp
java -jar morphe-desktop-*-all.jar patch --patches=patches/build/libs/patches-<ver>.mpp \
  --keystore your.keystore --keystore-entry-alias <alias> \
  --keystore-password <pass> --keystore-entry-password <pass> \
  -o patched.apk app.apks
```

## Release checklist

Morphe Manager resolves a patch source by fetching files from this repository's default branch, so
a release is not just a tag:

1. Set the new `version` in `gradle.properties`.
2. Build, then test the bundle against a real copy of the app (see above). A released version
   should mean "verified", not "compiled".
3. Update `CHANGELOG.md` with the release notes.
4. Update `patches-bundle.json`: `version`, `download_url` (pointing at the new release asset) and
   `created_at`. Morphe Manager parses `created_at` as a **local** timestamp, so it must look like
   `2026-10-04T05:09:58`: a timezone suffix such as `Z` or `+05:30` makes the manager fail to
   deserialize the whole manifest, which shows up as a source with "Metadata N/A" and 0 patches.
   Blank fields break the source in the same way.
5. Commit, tag, and create the release, attaching `patches-<version>.mpp`.

Steps 3 and 4 exist because this repository has no semantic-release pipeline; upstream they are
generated. If that changes, this checklist gets shorter.
