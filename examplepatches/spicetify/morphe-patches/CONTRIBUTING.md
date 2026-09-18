# Contributing

Keep changes focused on Spotify Android customizations. Submit source and
tests without Spotify binaries, account data, signing keys, or access tokens.

## Build and test

Use Java 21 and an Android SDK. Set `JAVA_HOME` and `ANDROID_HOME` to their
installation directories. The Gradle wrapper selects the Gradle version.

Morphe dependencies use GitHub Packages. Authenticate GitHub CLI with
`read:packages`, then expose credentials only for the build process:

```sh
gh auth refresh -h github.com -s read:packages
GITHUB_ACTOR="$(gh api user --jq .login)" \
GITHUB_TOKEN="$(gh auth token)" \
./gradlew :extensions:extension:testDebugUnitTest :patches:test buildAndroid
```

The bundle is `patches/build/libs/patches-*.mpp`. You can also supply `gpr.user`
and `gpr.key` in your user-level `~/.gradle/gradle.properties`. Never put
credentials in this repository's `gradle.properties`.

## Verify a patch

Unit tests cover URL cleanup and resource editing. They do not prove that a
Spotify build still uses the patched method or resources.

The normal Gradle test command also runs synthetic DEX verifier checks.
After applying a bundle with Morphe Desktop, inspect the signed output:

```sh
python3 scripts/verify-artifact.py \
  --stock /path/to/stock-base.apk \
  --patched /path/to/patched.apk \
  --desktop /path/to/morphe-desktop-all.jar \
  --aapt2 "$ANDROID_HOME/build-tools/36.0.0/aapt2" \
  --apksigner "$ANDROID_HOME/build-tools/36.0.0/apksigner" \
  --sharing \
  --theme '#FF000000' '#FF1ED760' '#FF1ABC54'
```

Use your installed build-tools version in those paths. Run with Java 21 on
`PATH`, or supply `--java "$JAVA_HOME/bin/java"`. Omit `--sharing` when that
patch is disabled. Omit `--theme` when colors are disabled; otherwise pass
the exact background, accent, and pressed-accent values used for patching.
The checker verifies default color values and IDs, equivalent relocated XML
selectors, sanitizer injection, and the APK signature. It does not execute
Spotify or cover every resource configuration.

Record the stock APK's version, version code, ABI, SHA-256, Android version,
and Morphe version. Apply each patch separately and together, inspect the
output, and test the affected behavior on Android. Record missing runtime
checks in [the verification record](docs/verification.md).

Keep compatibility targets experimental until the normal Manager source-add,
patch, installation, and update flows pass. Test sharing with tracks, albums,
playlists, and episodes, including timestamp links. Check theme colors in
Home, library, player, settings, and dialogs. Confirm login, playback, queue,
Connect, background playback, and notifications still work.

When importing code, record its source revision, license, retained notices,
and local changes in [third-party sources](THIRD_PARTY_NOTICES.md).

## Release

The repository retains the official template's semantic-release workflow.
Work targets `dev`; `feat:` and `fix:` commits produce prereleases there.
The README's explicit `refs/heads/dev` source URL always follows prereleases;
enable **Experimental app versions** separately to show the initial Spotify
target. Sources configured through a regular repository URL also need their
prerelease setting enabled once a stable feed exists. Merge `dev` into `main`
without squashing only when the stable verification pass is complete.

Stable release automation is disabled unless the repository variable
`STABLE_RELEASE_ENABLED` is `true`. Enable it only after recording the
required runtime evidence. Tests run before release preparation.

Check that the push starts a workflow for the expected commit. If no run
appears, investigate the trigger and use **Actions > Release > Run workflow**
with branch **dev** for an explicit experimental build. A manual run proves
the build and release jobs, not the automatic push trigger.

Let automation generate `patches-list.json`, `patches-bundle.json`, and the
changelog. Do not manually create releases or upload bundles. Preserve
release commits and tags so semantic-release can calculate later versions.
