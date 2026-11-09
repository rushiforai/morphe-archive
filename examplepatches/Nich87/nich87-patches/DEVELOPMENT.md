# Development

## Prerequisites

- JDK 21 for Gradle, matching the upstream release workflow.
- Android SDK Platform 36 and Android SDK Build Tools 36.0.0. The Morphe
  extension plugin currently selects `compileSdk = 36`.
- Git, GitHub CLI, and a GitHub account with access to GitHub Packages.
- Optional: Android Studio or IntelliJ IDEA with Kotlin support, jadx,
  apktool, and ADB for work on actual applications.
- Node.js and npm are needed for release automation, not a local `.mpp`
  build. GitHub Actions installs them in the existing workflow.

Set `ANDROID_HOME` to your SDK installation, or set `sdk.dir` in ignored
`local.properties`. Do not commit a machine-specific SDK path.

## Authentication and building

Public packages on GitHub Packages also require authentication:

```sh
gh auth login --hostname github.com --scopes read:packages
# For an already authenticated account:
gh auth refresh --hostname github.com --scopes read:packages

git switch dev
./scripts/gradle.sh buildAndroid
```

`scripts/gradle.sh` forwards Gradle arguments and reads the token directly
from GitHub CLI. Existing `GITHUB_ACTOR` and `GITHUB_TOKEN` environment values
take precedence. The token is not written to a project file or passed as a
command-line property.

The default Gradle cache is `${TMPDIR:-/tmp}/nich87-patches-gradle-${UID}`.
Temporary caches may disappear after a reboot; Gradle will download
dependencies again. Set `GRADLE_USER_HOME` to a private, persistent directory
if preferred. Any `gpr.user` or `gpr.key` properties there must be current
because the upstream plugin reads those properties before environment
credentials.

The underlying upstream command is still `./gradlew buildAndroid`. It works
when the Gradle user home has valid `gpr.user` / `gpr.key` properties or when
`GITHUB_ACTOR` / `GITHUB_TOKEN` are set without conflicting Gradle properties.
Use the wrapper rather than the system `gradle` installation.

The bundle is `patches/build/libs/patches-<version>.mpp`. A successful
`buildAndroid` adds `classes.dex` for Android; an ordinary JVM build alone
does not prove the Android bundle was produced.

## Loading and testing patches

Download the official Morphe Desktop release into ignored `.local/tools/`
or use an existing installation. Check its `--help` for the current listing
and patching commands. Desktop `v1.20.0` is compatible with the pinned Patcher:

```sh
mkdir -p .local/tools
gh release download v1.20.0 --repo MorpheApp/morphe-desktop \
  --pattern 'morphe-desktop-1.20.0-all.jar' --dir .local/tools
java -jar .local/tools/morphe-desktop-1.20.0-all.jar --help
java -jar .local/tools/morphe-desktop-1.20.0-all.jar list-patches \
  --patches patches/build/libs/patches-1.0.0.mpp \
  --with-packages --with-versions
```

Select the actual `.mpp` filename for the version being built.
Desktop `v1.20.0` and this project both use Patcher `2.1.0`. Use a compatible
Desktop/Patcher version when upgrading `gradle/libs.versions.toml`.
Load the local `.mpp` before testing it on a
target APK. Do not run `generatePatchesList` merely to validate loading:
that task replaces the release-managed `patches-list.json`.

The `Liquid Glass bottom bar` and `Library import, export and downloads`
patches target Apple Music `com.apple.android.music` 7.0.0 (1614).
Their tested input is a merged APK from an arm64 split set; direct APKM/XAPK
support is not declared. The patches can be selected independently.
Android 13+ provides live refraction. Older versions retain the native blur;
that fallback has not been verified on a device.

### Library metadata repair

`Repair Japanese library metadata` is a separate Apple Music 7.0.0 patch.
It adds a settings entry that scans existing cloud library items, compares
their exact catalog IDs with Japanese catalog data, and previews metadata
changes before selected or bulk repair. Playlist-only items are excluded.
The default view shows suspected romanization in titles, artists or albums;
disabling its filter also shows candidates with differences in other fields.
Candidates start unselected, and search includes current and proposed values.

The repair updates existing cloud items through the app's authenticated DAAP
transport. It does not remove or add library items. Before writing, it checks
the account/library identity and the reviewed values; after writing, it reads
the server values again. A stopped batch finishes verification of its current
request and leaves subsequent items unprocessed. No credentials are extracted
or stored by the extension.

After cloud verification, the selected catalog item is refreshed in the native
local library with cloud-library addition disabled. This keeps the Android
library view consistent after metadata imports. On the tested sample, the
existing persistent ID, added date and play count were preserved. A local
refresh failure is reported separately from a verified cloud save.

The field registry covers titles, artists, albums, album artists, composers,
genres, their sort names, works, movements, grouping, comments, release year,
track/disc numbers and counts, BPM, and movement numbers/counts. A field is
offered only when the exact catalog item supplies a nonempty replacement.
Rich catalog fields are used only when their names agree with the forced
Japanese lookup. Missing data is not invented or used to clear existing
values. Play counts, ratings, favorites, membership and asset identifiers are
outside the writable registry. The transport uses private app APIs, so a new
Apple Music version requires fresh compatibility and server verification.

UI brief: review possible name changes, select songs, then verify the cloud
save. Layout: a full-screen native page with fixed toolbar, search/filter and
repair action; the candidate ListView owns the remaining vertical area.
Expanded details stay inside that list; the confirmation page has one
ScrollView. It reuses the app's SF fonts, native icons and semantic color
resources in both themes. The normal scrollbar sits outside row controls;
fast scrolling is disabled so its touch area cannot cover disclosure buttons.
Text controls use small software layers to avoid disappearing cached text
after list invalidations on the tested Android renderer; the list remains
hardware accelerated.

Build the bundle and run the tests with:

```sh
./scripts/gradle.sh :patches:test buildAndroid
```

The spring is Android-independent. The JVM patch module runs its tests against
the actual extension source because the extension plugin disables Android unit
test variants. Tests cover settling, collision rebound, retargeting momentum
and agreement across refresh rates.

Apply only the real patch to a local APK with Morphe Desktop:

```sh
java -jar .local/tools/morphe-desktop-1.20.0-all.jar patch \
  --patches patches/build/libs/patches-1.0.0.mpp --exclusive \
  --enable 'Liquid Glass bottom bar' --validate --bytecode-mode=FULL \
  --out .local/applemusic/applemusic-7.0.0-liquid.apk \
  .local/applemusic/applemusic-7.0.0-merged.apk
```

A successful build or patch listing is not an APK or device test. Local
validation uses a separately signed QA copy with a different package, preserving
the original installation and data. Package renaming is not part of the patch.
Sign in to the QA copy when verifying account-dependent flows.
Keep all test APKs, signing keys and local evidence out of Git.

## Release workflow

Develop on `dev` and use semantic commits. Prefer `feat:`, `fix:` and
`chore:`; only `feat:` and `fix:` among those produce a release. `dev`
publishes pre-releases, while `main` publishes stable releases. Users must
enable pre-releases in their Morphe Manager source to use development builds.

Merge `dev` into `main` without squashing or rebasing. The upstream release
automation also backmerges `main` into `dev`. Keep the long-lived branches.

The GitHub repository must allow Actions to create and approve pull requests.
The release job declares its own write permissions; the repository's default
workflow token can remain read-only. Merge commits are enabled and squash /
rebase merges are disabled to match the upstream release model.

GitHub template generation with all branches can create `main` and `dev`
with separate root commits. Check `git merge-base origin/main origin/dev`
before the first release merge. If there is no common ancestor, join those
histories once with an explicitly requested, non-squash merge; preserve both
histories rather than replacing or force-pushing a branch.

Use the existing `release.yml` and `.releaserc`. Generated metadata,
CHANGELOG, release versions and the README patch list belong to that workflow.
Do not create manual release tags or upload `.mpp` files as releases.

Release signing is optional and has not been enabled by this setup. When
requested, use the upstream `generateSigningKey` task, commit only
`morphe-signing.pub`, and put the private key in the repository's
`MORPHE_SIGNING_KEY` Actions secret. Retain a private backup.

## Agent instructions

Read `AGENTS.md` and `.agents/skills/nich87-patches-dev/SKILL.md` when working
here. Codex discovers the repository skill when this repository is the open
workspace; the parent `GitHub` folder is not itself this repository.

## Upstream references

This setup started from template commit
`f4da72f66e008c5bb021a9f19b33dcf5f0523772` on 2026-11-01. Re-check upstream
instructions when changing dependencies or release behavior.

- [Template setup and release rules](https://github.com/MorpheApp/morphe-patches-template/blob/f4da72f66e008c5bb021a9f19b33dcf5f0523772/README.md)
- [Naming restrictions](https://github.com/MorpheApp/morphe-patches-template/blob/f4da72f66e008c5bb021a9f19b33dcf5f0523772/NOTICE)
- [Patcher setup and Packages authentication](https://github.com/MorpheApp/morphe-patcher/blob/main/docs/2_1_setup.md)
- [Patches and fingerprints](https://github.com/MorpheApp/morphe-patcher/tree/main/docs)
- [Morphe development environment](https://github.com/MorpheApp/morphe-documentation/tree/main/docs/morphe-development)
- [Codex repository skill discovery](https://developers.openai.com/codex/skills/)
