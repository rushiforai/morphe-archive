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

The Apple Music patches target `com.apple.android.music` 7.0.0 (1614),
7.0.1 (1622), 7.0.2 (1624), and 7.0.3 (1626). Their tested input is an APK
merged from an arm64 split set. Merge APKM or XAPK splits before applying the
patches. Each patch can be selected independently.
Android 13+ provides live refraction. Older versions retain the native blur;
that fallback has not been verified on a device.

### On-device vocal separation

Enable `On-device vocal separation` for a merged arm64 Apple Music 7.0.3
(1626) APK. Tap the microphone above the lyrics screen's playback controls.
Select `Prepare model` to download the approximately 30 MB UVR-MDX-NET 3 model.
After preparation, drag the vertical slider between accompaniment, the
original mix and isolated vocals.

Ultimate Vocal Remover and its core developers Anjok07 and aufr33 provide the
model under MIT terms. The downloaded file is verified against the SHA-256 of
the original release's `UVR_MDXNET_3_9662.onnx`. [UVR license and credits](https://github.com/Anjok07/ultimatevocalremovergui#license)

Separation runs on the device CPU for stereo PCM at 32, 44.1, 48, 88.2, 96,
176.4 and 192 kHz. The model receives a 44.1 kHz copy of the decoded audio.
The estimated vocals are converted back to the original sample rate before
mixing, so playback retains its original rate and frame count. The first
processed audio requires a window of approximately 5.92 seconds. Other
formats use the app's normal audio path.

### Liquid Glass rendering

The bottom tabs and mini-player use the active, untinted Regular material
from iOS 26 beta 2 (`23A5276f`) as their reference. `GlassPyramid` crops the
live Apple Music backdrop, prepares a quarter-resolution base, and repeatedly
halves it with the recovered 13-sample filter. `GlassShaders` evaluates a
continuous-corner signed distance field and blends adjacent blur levels at
the inner and outer refraction coordinates. The face, ambient bleed and
shadow use the recovered size and color equations.

The selected tab uses separate backdrop refraction and lifted-content warp.
The shape field blends toward circular ends as the bounds narrow. The
backdrop refraction tapers at the lens centerline, where the sampling
direction changes sides. The renderer uses the Android tab views and springs
with RenderNode sampling and compositing. The centerline taper, highlight
settings and chromatic edge are Android adaptations.
Fidelity depends on the Android backdrop boundaries and on the material the
iOS compositor selected for the reference frame.

### Library metadata repair

`Repair Japanese library metadata` is a separate Apple Music patch.
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

### Twitter/X Spaces local mute

`Spaces local mute` targets `com.twitter.android` `12.19.1-release.0`
(`versionCode = 312191000`, `ApkFileType.APKM`). It is a pure bytecode patch
with no resource modifications, avoiding resource ID and hook collisions with
`crimera/piko` (`app.voidhack.extension.twitter.spaces.mute.*` hooks only
`com.twitter.rooms.*`, `tv.periscope.*`, ExoPlayer2 `DefaultAudioSink`, and
Media3 `AudioTrackAudioOutput`).

Per-user listener-side muting is exposed in two native surfaces using the app's
`ConstraintSet` (`androidx.constraintlayout.widget.d`):

- Directly inside Twitter's Space User Profile popup (`com.twitter.rooms.ui.utils.profile.r0.O`)
  as a 1-tap toggle row (automatically hidden on the current user's own profile).
- Via a compact Mute pill injected into live Space (`a2.O`) and Space replay
  (`l0.O`) headers that opens a speaker-list control sheet with live talking
  indicators, one-tap mute/unmute, unmute-all, and Smart vs Strict overlap mode.
- Uses per-speaker `org.webrtc.AudioTrack.setVolume(0.0d)` isolation in WebRTC
  mode (`tv.periscope.android.hydra.janus.b.{d,g}`, `tv.periscope.android.hydra.media.d.b`)
  and a real-time active-speaker `AudioTrack` volume gate (400ms word-gap
  hangover and smooth volume ramp) in HLS listener and Replay modes.

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
