# Development

The workspace side of the repo: building the bundle, getting apps, writing and testing a
patch, and how releases happen. The rules for contributions are in
[CONTRIBUTING.md](../CONTRIBUTING.md); the per-app pages next to this one say how each existing
patch works.

## Setup

```sh
bin/bootstrap
```

It checks the JDK (21+) and Android SDK (`ANDROID_HOME`, with platform 36 and build-tools),
installs jadx, apkeep, hermes-dec and uv through [mise](https://mise.jdx.dev) (`mise.toml`),
downloads Morphe Desktop and apktool into `tools/` with checksum checks, and checks GitHub
Packages access. Morphe's Gradle plugin is only published on GitHub Packages, so the build needs
a token with `read:packages`. `bin/build` borrows the `gh` CLI token; give it the scope once:

```sh
gh auth refresh -h github.com -s read:packages
```

For unattended builds (agents, a build server), put a classic token with `read:packages` in
`~/.gradle/gradle.properties` instead (`gpr.user`, `gpr.key`, mode 600): it doesn't depend on the
gh login, which loses the scope when it is renewed.

Everything regenerable (decompiled code, patched APKs, the emulator, logs) goes to
`$MORPHE_WORK`, default `~/build/lurk-morphe-patches/`. Set `MORPHE_WORK` to put it somewhere else.

## Layout

| Path | What |
|---|---|
| `patches/src/main/kotlin/io/github/jordanwoodson/patches/<app>/` | Patches for one app, one folder per feature with `<Name>Patch.kt` and its `Fingerprints.kt`. `shared/Constants.kt` holds the app's package, target versions and pinned signing cert. |
| `patches/.../patches/shared/` | Code shared across apps: extension paths, the settings screen builders. |
| `patches/.../patches/shared/apps/` | The patches every app has (its hidden settings patch and React Native bundle loader, Lurk icon, Clone app, Change app name, Remove tracking permissions), built from one `LurkApp` per app in `Apps.kt`. The app's folder still declares each of them with its name, description and default; what differs between apps is a `LurkApp` field or a builder parameter. |
| `extensions/shared/` | Java injected into patched apps (`extensions/shared.mpe`): the Lurk settings screen, `Logger` (tag `lurk`), per-app helpers under `twitch/` and `kick/`. Add `extensions/<app>/` when an app needs its own module. |
| `tests/<app>/` | Output checks and on-device probes, run through `bin/test-<app>*`. See [Testing](#testing). |
| `docs/<app>.md` | Per-app notes: what each patch hooks, how it was found, how it was tested. |
| `assets/icon.png` | The Lurk icon at full size (1254 px): the hooded figure in mint `#39F8AE` on navy `#080D1B`. `patches-bundle.png` is a 512 px copy, which Manager shows for this source. |
| `assets/readme-hero.png`, `assets/readme-hero-light.png` | The README header (1600×400): the figure, the "Lurk" wordmark, the tagline and the three app icons, on navy for GitHub's dark theme and on white for the light one (a `<picture>` element picks one). |
| `assets/social-preview.png` | The same elements at 1280×640 for link previews. GitHub doesn't read it from the repository: upload it by hand under the repository's **Settings › General › Social preview** whenever it changes. |
| `assets/wordmark.svg` | "Lurk" in mint as outlines (DejaVu Sans Bold, letter-spaced 0.02 em), for places that need the name without the figure. |
| `assets/screenshots/<app>-settings.png` | The Lurk settings screen of each patched app, shown in the README's Screenshots section. |
| `assets/<app>-icon.png` | An app's Lurk launcher artwork, flattened to its two colors. `bin/app-icon` turns it into `patches/src/main/resources/<app>/icon/` (adaptive icon, vector logo, legacy `.webp`), which the app's icon patch copies in. |
| `assets/<app>-icon-round.webp` | The README patch-list icon for apps whose icon patch recolors Rumble's Lurk logo while patching instead of shipping its own (`twitch`, `kick`). |
| `apks/<app>/<version>/` | Original APKs, added with `bin/apk-add`. Not committed. |
| `tools/` | Downloaded jars and the Exodus tracker list. Not committed. |
| `$MORPHE_WORK` (`~/build/lurk-morphe-patches/`) | Decompiled code, patched APKs, the test emulator, reference repos, test output. Regenerable. |
| `~/.local/share/morphe/` | Morphe Desktop data, including the signing keystore. Keep it: updates only install over a patched app signed with the same key. |

Apps known to the workspace are the folders with a `shared/Constants.kt`: `twitch`, `kick`,
`rumble`. Add another with `bin/new-app <slug> "<Launcher name>" <package> [0xRRGGBB]`.

## Getting APKs

Only from **APKMirror**, **Google Play** or **Uptodown**. No other mirrors.

- APKMirror or Uptodown: download in a browser, then `bin/apk-add ~/Downloads/<file>`.
- Google Play: `bin/apk-fetch <app>` (latest version only). It needs a Google account token in
  `~/.config/apkeep/apkeep.ini`:

  ```ini
  [google]
  email = someone@gmail.com
  aas_token = aas_et/...
  ```

  Get the AAS token once with `apkeep -e <email> --oauth-token <oauth2_4/...>`, following
  [apkeep's Google Play guide](https://github.com/EFForg/apkeep/blob/master/USAGE-google-play.md).
  Use a spare account.

`bin/apk-add` reads the package and version, checks the base APK's signature, and compares the
signing cert with the one pinned in the app's `Constants.kt`. It pins the cert on an app's first
APK and refuses a mismatch after that. Files land in `apks/<app>/<version>/`.

Several variants of one version can sit side by side, and should: the phone's arm64-v8a build and
an x86_64 (or universal) one for the emulator. The patches change dex, Hermes and resources, not
native code, so a result on the x86_64 variant holds for the arm64 one. `bin/apk-info <app>` lists
each stored file's ABIs and splits; `bin/patch --abi=x86_64` picks a variant, and an install to an
`emulator-*` serial picks x86_64 by itself. Without such a variant the emulator runs ARM code
through its translation layer (slow, and Kick then needs the native-library workaround in
[kick.md](kick.md)). The smaller the variant, the faster every patch and install: Twitch's
all-ABI bundle patches to a 300 MB APK, a one-ABI one-density build to about 120 MB.

All three apps ship on APKMirror as `.apkm` bundles. Kick is React Native: most of its logic is
Hermes bytecode in `assets/index.android.bundle`. Patch it with `hermesPatch` from
morphe-patches-library (already a dependency); its native side (dex) patches like any other app.

## Workflow

```sh
bin/scan rumble          # tracker SDKs (Exodus Privacy signatures) and URL hosts in the app
bin/decompile rumble     # jadx Java, apktool smali, Hermes disassembly → $MORPHE_WORK/rumble/<version>/
# write patches under patches/.../rumble/
bin/patch rumble         # build the bundle, patch the newest stored version → $MORPHE_WORK/out/
bin/emu start            # headless Android 16 emulator (emulator-5580), ~5 s from its last state
bin/patch rumble --no-build --install=emulator-5580      # seconds; --no-build reuses the bundle
bin/ui launch rumble     # or: bin/ui open https://rumble.com/c/... --app rumble
bin/ui tree              # the screen as text; bin/ui tap "Settings", bin/ui wait "Lurk"
bin/ui lurk rumble       # the Lurk settings screen (runtime switches, no re-patch)
bin/ui log --dump        # Logger output from patched code (tag lurk); without --dump it follows
bin/emu save rumble-home # keep this state; bin/emu start rumble-home boots into it in ~6 s
```

`bin/ui --help` lists the rest (find, swipe, type, key, stop, reset, apps, shot). It honors
`ANDROID_SERIAL`. `bin/emu --port 5582 start` runs a second emulator with its own AVD for parallel
work; `bin/emu --port 5582 serial` prints its serial for `--install=` and `ANDROID_SERIAL`.

- `bin/app-icon <app> <artwork.png>` regenerates an app's launcher icon from square two-color
  artwork (a flat logo on a flat background).
- `bin/patch` passes anything after `--` to Morphe Desktop, for example
  `bin/patch twitch -- --exclusive -e "Disable analytics"`.
  Each run copies the unchanged input into its own `$MORPHE_WORK/tmp/patch.*` directory:
  Morphe extracts APKM components beside its input even when given `-t`. Extraction and
  temporary files are removed on exit; the original upload and shared signing directory
  stay intact, and the output remains in `$MORPHE_WORK/out/`.
- `bin/refs` clones Morphe's own repos (patcher docs, patches library, official patches, the
  template) into `$MORPHE_WORK/refs/` for API reference.
- `bin/apk-info <file|app>` shows a file's package, version and signing cert, or an app's stored versions.
- `bin/bump`, `bin/hermes-pin` and `bin/verify-hooks` move an app to a new version; see
  [Version bumps](#version-bumps).

## Writing a patch

The [Rumble notes](rumble.md) are the gentlest introduction: each Rumble patch, what it changes,
how it finds its code without obfuscated names, and how it was tested. The
[Twitch](twitch.md) and [Kick](kick.md) pages cover the native, React Native and Hermes cases.

One folder per feature under the app, with the patch and its fingerprints:

```
patches/.../patches/rumble/
  shared/Constants.kt
  analytics/DisableAnalyticsPatch.kt
  analytics/Fingerprints.kt
```

```kotlin
@Suppress("unused")
val disableAnalyticsPatch = bytecodePatch(
    name = "Disable analytics",
    description = "Stops the app from sending usage analytics.",
) {
    compatibleWith(COMPATIBILITY_RUMBLE)

    execute {
        SomeAnalyticsFingerprint.method.returnEarly()
    }
}
```

Fingerprints match on strings, signatures and instruction patterns rather than class names,
since R8 renames classes between versions. Each app's `shared/` folder has match helpers
(`Bytecode.kt`, `Hermes.kt`) that require exactly one match and throw a `PatchException`
otherwise, so a new app version fails to patch instead of patching the wrong method. Give each string in a
fingerprint's `strings` whole, never a prefix: Morphe Patcher 2.0 compares them exactly whenever a bundle built
for it is in the same run (Morphe Manager 2.x with Morphe Patches selected), even though Lurk's bundle and
Morphe Desktop 1.18 still match a part. `tests/verify_fingerprint_strings.py` (in `bin/test-host`) checks them
against the stored APK of each target version. See the patcher docs in
`$MORPHE_WORK/refs/morphe-patcher/docs/` (after `bin/refs`) and the
[fingerprinting guide](https://github.com/MorpheApp/morphe-patcher/blob/main/docs/2_2_1_fingerprinting.md).

Patches with runtime behavior depend on the app's settings patch and register their switches
and choices on the app's `SettingsScreen` (`patches/.../shared/settings/Settings.kt`) at the end of
`execute`. A key can be registered once, and a setting's `parent` must be a top-level setting of the
same section (under a switch, it applies only while the switch is on). The settings patch writes the registrations as JSON into the extension, and the Lurk
settings activity (`extensions/shared/.../settings/`) builds its screen from that: only the
included patches' settings, grouped by section, with search, Pause Lurk, export and import, a bug
report link and a restart bar for `restart = true` settings. It is plain framework Java: views and
drawables made in code, no resources, AppCompat or Kotlin. Injected code reads a value with
`Settings.isEnabled(key)` or `getInt(key)`. Lurk fails closed: a key that isn't registered reads
as off (a choice as 0), and so does every key if the registry can't be read; Pause Lurk turns
every switch off except those registered with `keepWhenPaused` (lockout protection such as Block
update prompts). Code that runs inside the app is plain Java in `extensions/shared/`, called
from injected smali; `Logger.d(...)` (tag `lurk`) is the quickest way to confirm a hook fires,
once Lurk settings > Advanced > Debug logging is on. `Logger.i`, `w` and `blocked` always write.

Two things that bite: Morphe silently drops a non-range `invoke-*` whose register is above
v15 (use `/range` forms and check with `dexdump`), and the extension must not pull the Kotlin
standard library into the patched app (`extensions/shared/build.gradle.kts` excludes it).

### Rules that keep patches working across versions

[CONTRIBUTING.md](../CONTRIBUTING.md#rules) has the full list; these are the ones the tooling
relies on:

- **Injected calls**: build them with `invokeStatic(method, registers...)` or
  `invoke(kind, method, registers...)` from `patches/shared/Registers.kt`. Below v16 they emit the
  plain form, above it the `/range` form, and they fail with a message when the registers aren't
  contiguous instead of emitting a call that would vanish. `parameterRegister(i)` gives a
  parameter's v register. Guard any hand-written invoke on `p` registers with
  `requireLowRegisters(what, registers...)` or `requireLowParameterRegisters(what)`, so a later app
  version that adds locals fails to patch rather than losing the call.
- **Expected hooks**: each app's `tests/<app>/expected-hooks.txt` lists the extension methods its
  patches call (`Class.method`, `#` comments). Add new hooks to it; `bin/verify-hooks` checks a
  patched APK against it.
- **Locators**: record every obfuscated name a fingerprint resolves with
  `Locators.record("<app>.<patch>.<what>", typeOrMethod)` from `patches/shared/Locators.kt`. The app's
  settings patch writes them into the patched APK as `assets/lurk/locators.json`; probes look names up
  there instead of pinning R8's output.
- **Versions**: only `shared/Constants.kt` names app versions; everything else reads
  `COMPATIBILITY_<APP>.targets` (see [Version bumps](#version-bumps)).
- **Settings**: a new patch is selected by default with its switch off, except lockout protection,
  privacy that stays on the phone, nags and restoring expected behavior, and a same-named patch in
  another app takes the same defaults. Patch-time-only changes (icon, name, clone, permissions) have no
  switch and say so. A settings key is never renamed: users' values are stored under it.

## Testing

Run `bin/test-host` for offline, APK-free checks with Python 3, Git, a JDK (21 recommended),
Chrome or Chromium, Node.js, the pinned Hermes compilers (`mise install`) and
`python3 -m pip install -r tests/requirements-host.txt`.
It honors `JAVA_HOME`, `CHROME` and `MORPHE_WORK`, runs all registered checks and fails if any check fails.
Both PR builds and release jobs require it before building or publishing. The suite runs the
extension's Twitch, Kick, Rumble and shared helpers on the JVM against small Android doubles, the
offline Kick chat page in headless Chrome, the Hermes compilers, the release script on local Git
fixtures, the patch tooling and the version-literal rule. See [tests/README.md](../tests/README.md)
for what each check covers and how to register another one.

Before each release build, `release.py` reruns the selected source's host gate after checkout,
including an older release being rebuilt for recovery. A missing or failed gate stops publication.

The other checks need a patched APK, decoded output or a Hermes bundle, and for the probes a device.
The workspace emulator is `emulator-5580`; every Android `bin/test-*` script uses it unless
`ANDROID_SERIAL` names another device, so a connected phone is never patched by accident.

```sh
bin/emu start
bin/patch twitch --install=emulator-5580
bash bin/test-twitch "$MORPHE_WORK/out/twitch-31.8.0-patched.apk"       # injected loader and settings
bash bin/test-twitch-privacy "$MORPHE_WORK/out/twitch-31.8.0-patched.apk"
```

- The emulator (`bin/emu`) is a headless Android 16 x86_64 image under KVM with 8 cores, 6 GB and
  a 720x1600 screen at 280 dpi; rendering is SwiftShader on the CPU, so fewer pixels mean faster
  frames and smaller screenshots. One AVD per port lives in `$MORPHE_WORK/avd/`; the profile is in
  `bin/emu` and is applied on start (changing it drops the AVD's snapshots).
- Snapshots: `bin/emu stop` saves the running state and the next `bin/emu start` restores it in about
  5 s; `bin/emu save NAME` keeps a prepared state (apps installed, signed in, on a channel) and
  `bin/emu start NAME` boots into it in about 6 s, discarding changes at stop, while `bin/emu load NAME`
  jumps back in 2 s without a restart. `bin/emu snapshots` lists them, `bin/emu delete NAME` removes
  one, `bin/emu wipe` starts over with a fresh AVD.
- The host renderer keeps about 400 MB for every app process that is killed, so a day of force-stops
  and relaunches adds up. `bin/emu status` shows QEMU's size; `bin/emu restart` releases it and keeps
  the state. On Linux the emulator runs under a 16 GB memory cap.
- `bin/test-<app>` and the other `bin/test-twitch-*` scripts compile a probe from `tests/<app>/`
  with the Android SDK, push it with the patched APK and run it with `app_process`, so the
  probe calls the app's real, patched methods on ART. Several accept `--compile-only`.
- Every patched APK carries `assets/lurk/locators.json`: the obfuscated classes and methods the
  patches matched, as a JSON object keyed `<app>.<patch>.<what>` (for example
  `rumble.settings.app_info_section`) with smali descriptors as values. A patch adds an entry with
  `Locators.record(...)` (`patches/shared/Locators.kt`); the app's settings patch writes the file
  after every other patch has finished. Probes read it from the APK's assets instead of pinning R8
  names, so they keep working when the app is rebuilt.
- `tests/<app>/verify_*.py` and `test_*.py` are standalone Python scripts: they diff stock and
  patched apktool output, decode Hermes bundles, or compile an extension helper against small
  stubs and run it on the JVM. Each docstring gives the usage. They honor `MORPHE_WORK` and
  `JAVA_HOME`.
- `bin/verify-hooks <app> <patched.apk>` checks that app code calls every extension method listed in
  `tests/<app>/expected-hooks.txt` (one `Class.method` per line, `#` starts a comment), through
  `tests/verify_extension_calls.py <patched.apk> Class.method ...`, which also takes names directly.
  Run it after adding a hook or patching a new app version: an injected call can vanish without an
  error (see [Writing a patch](#writing-a-patch)). Add the hook to the app's list in the same change.
  Both need `ANDROID_HOME` for `dexdump`.
- `bin/decompile <app>` decodes the stock APK; decode a patched one the same way for the Python
  checks: `java -jar tools/apktool_*.jar d -f -p "$MORPHE_WORK/apktool-framework" -o <dir> <patched.apk>`.

The per-app pages record which checks exist for each patch and what could not be verified
(signed-in flows, for example). When adding a patch, add a check where there is something
worth pinning, and say in the pull request what you ran.

## Version bumps

Each patch is written for one version of its app (the `targets` in `shared/Constants.kt`). Moving an
app to a new version is mostly finding what no longer matches:

```sh
bin/bump twitch 31.8.0 ~/Downloads/<file>.apkm   # store it (bin/apk-add), patch, sort the failures
bin/bump twitch 31.8.0 --pin                     # React Native apps: point the SHA gate at the new bundle
bin/verify-hooks twitch "$MORPHE_WORK/out/twitch-31.8.0-patched.apk"
```

- `bin/bump <app> <version> [file] [--pin] [--no-build]` stores the file if one is given, builds, and
  patches the new version with every patch enabled (the default-off ones too), Morphe's `-f` (ignore
  the targets) and `--continue-on-error`. It prints the failures grouped by cause: **SHA gate** (the
  React Native bundle isn't the one `Hermes.kt` pins, so every Hermes edit stops there), **Hermes
  pattern** (an edit found its byte pattern no times or more than once), **fingerprint, class or
  bytecode match**, and anything **other**. A patch that failed because a patch it depends on did is
  listed under that patch's cause. It also lists the class names the on-device probes in
  `tests/<app>/` use that the current version defines and the new one doesn't: those probes were pinned
  to R8's names and need the new ones (a name that still exists may now be a different class). The log,
  Morphe's `result.json` and the summary land in `$MORPHE_WORK/bump/<app>-<version>/`. It doesn't
  change `Constants.kt`.
- `bin/hermes-pin <app> [version] [--check]` prints the SHA-256 and Hermes bytecode version of a stored
  version's `assets/index.android.bundle` and rewrites `SOURCE_SHA256` in the app's `shared/Hermes.kt`
  (`--check` only compares). `bin/bump --pin` runs it first. A new hash only lets the Hermes edits run
  against the new bundle; whether they still match is what `bin/bump` then shows. When the bytecode
  version changes too, it says so: that needs a new parser and compiler family, not just a hash.
  `bin/apk-add` prints the bundle's hash when it stores a React Native app and says whether it is the
  pinned one.
- Version strings live only in `shared/Constants.kt`. Code and messages that need the version read it
  from `COMPATIBILITY_<APP>.targets`; `tests/verify_version_literals.py` (part of `bin/test-host`) fails
  on a string literal like `"31.7.0"` anywhere else under `patches/src`. Files that still had such
  literals when the check was added are listed in its `PENDING` set and reported without failing.

Two things `bin/bump` doesn't show: a patch whose code only runs with an option set (Twitch's
*Playlist proxy* without its proxy URL) applies without matching anything, so patch it once more with
the option (`-e "<patch>" -O key=value` after `--`); and `bin/hermes-pin` only rewrites `Hermes.kt`,
while some tests pin the stock bundle's SHA-256 too (`grep` the old hash).

When everything applies: run `bin/verify-hooks`, the probes and the app itself, update the version in
`shared/Constants.kt`, the app's page under `docs/` and the APKMirror variant the README's Install
section names, and commit as `bump(<app>): support <App> <version>`.

## Releasing

- Work on the `dev` branch. Pushing `feat:` or `fix:` commits there makes `release.yml` publish a
  pre-release; `chore:` commits don't release but still build. Merge `dev` into `main` (no squash)
  for a stable release; `open_pull_request.yml` keeps a `dev` → `main` PR open for that.
- `release.yml` runs `.github/scripts/release.py`. The version comes from the commits since the last
  release tag on the branch: `feat` is a minor release, `fix`, `perf` and `bump` a patch, `feat!:` or a
  `BREAKING CHANGE:` footer a major one; `dev` adds `-dev.N`. The script writes the generated files,
  builds the bundle, pushes the release commit and its tag together, then creates the GitHub release with
  the `.mpp`. If that last step fails, the next run (or "Run workflow" on the Release workflow) publishes
  the missing release. Recovery looks for the newest release commit of the branch's own kind, so a newer
  pre-release merged into `main`, or a stable release merged back into `dev`, doesn't hide it; a
  pre-release that a newer stable release already contains is left unpublished. A stable release is merged
  back into `dev`; reruns also finish a failed backmerge after successful publication, without publishing
  again or creating duplicate merges. Published asset outputs survive later failures so the workflow can
  still attest them. To preview the next release and its notes:
  `git fetch && python3 .github/scripts/release.py --dry-run --branch dev`.
- The release notes are the changelog entry, the GitHub release text and the description Manager shows
  (without commit links there). They group commits by app, from the scope, with everything else under
  "Shared", then by type: New Features, Updated App Support (`bump`), Bug Fixes, Improvements (`perf`).
  A patch name in the subject is set in bold, and a subject that starts with `<Patch name>:` gets it as
  a label. Patch and app names are read from the sources, so new patches are recognized in the release
  that adds them.
- Moving an app to a new version is a `bump(<app>): support <App> <version>` commit (see
  [Version bumps](#version-bumps)).
- Non-dry release runs require an index with no staged changes, including recovery of an older release.
  Commit or stash staged work first; the script rejects it before changing the checkout or publishing.
- Use semantic commit messages: `feat(twitch): ...`, `fix(kick): ...`, `bump(rumble): ...`, `chore: ...`.
  [CONTRIBUTING.md](../CONTRIBUTING.md#commit-messages) says how to write subjects that read well as
  release notes.
- Don't hand-edit generated files: `patches-list.json`, `patches-bundle.json`, `CHANGELOG.md`, or
  the patch list in `README.md` (written by `.github/scripts/generate_patches_readme.py`). Don't
  create releases or tags by hand.
- When patches are tested on a new app version, update that version in the app's `targets` in
  `shared/Constants.kt`; Manager links users to the version listed there.

## Dependencies

What the build and the release pipeline pull in, and how each is kept honest:

| Dependency | Pinned by | Updated by |
|---|---|---|
| GitHub Actions in `.github/workflows/` | Commit SHA, with the release in a comment | Dependabot (monthly, into `dev`) |
| Gradle plugins and libraries (`gradle/libs.versions.toml`, `settings.gradle.kts`) | Version | Dependabot |
| The host checks' Python package (`tests/requirements-host.txt`) | Exact version | Dependabot |
| Morphe Desktop and apktool (`bin/lib/common.sh`) | Version and SHA-256, checked by `bin/bootstrap` | By hand |
| jadx, apkeep, hermes-dec, uv (`mise.toml`) | Version | By hand |
| The two `hermes-compiler` npm packages (`mise.toml`, the workflows' `install_args`) | Version, and each platform's `hermesc` SHA-256 in `bin/lib/compile-hermes.py` | By hand, when an app moves to a new Hermes bytecode version |

Dependabot doesn't read `mise.toml`. The Hermes compilers are pinned on purpose to the bytecode
versions the apps ship (98 for Twitch, 99 for Kick); a newer compiler is not an improvement unless the
app moved too. `compile-hermes.py` refuses a compiler binary whose SHA-256 differs from the pinned one,
so a changed package stops the build instead of compiling the bundle's runtime code. To move a family to
a new compiler version, update `mise.toml`, the `install_args` in both workflows and `VERSIONS` in
`compile-hermes.py`, then record the three new hashes (`hermesc/linux64-bin/hermesc`,
`hermesc/osx-bin/hermesc`, `hermesc/win64-bin/hermesc.exe` in the package from `mise where`) in
`COMPILER_SHA256` after checking the package came from the official `facebook/hermes` release.

Plugins resolve from the Gradle Plugin Portal, Google and Morphe's GitHub Packages registry only.
