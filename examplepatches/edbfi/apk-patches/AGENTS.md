# Agent instructions

Patches by edbfi for several Android apps, in two bundles from two independent Gradle builds: `revanced/` builds the
ReVanced bundle, `patches-<version>.rvp`, and `morphe/` the Morphe bundle, `patches-<version>.mpp`. Each has its own
code, extension Java, tests, docs and patch list, and they will drift apart: a change to one never needs a change to
the other. Only the release is shared.
CI comes from [edbfi-ci](https://github.com/edbfi/edbfi-ci); its rules apply here. `CLAUDE.md` is a symlink to this
file.

## Layout

- `revanced/` and `morphe/` each hold a whole Gradle build with its own wrapper, version catalog and
  `gradle.properties`. Paths in Patches and in each tree's section are relative to the tree.
- At the root: `docs/revanced/` and `docs/morphe/` for each bundle's app pages; `keys/release-signing.asc`, the GPG key
  that signs both bundles; `scripts/` for the release's and rea's scripts; `justfile`; `.github/`.
- Every bundle a user loads shares one class loader, so a bundle file another bundle also has can be read in place
  of ours. Hence the `edbfi` in resource and extension paths in both trees; each tree's `PatchMetadataTest` checks it.

## Local files

- Never commit APKs, bundles, keystores or app code. Local files go in the main checkout's ignored `tmp/`:
  `inputs/<name>-<version>/` for downloads, one version per directory; `decompiled/<app>-<version>/`;
  `repos/` for other projects' clones; `tools/<purpose>/` for our scripts; `evidence/<feature>/`;
  `releases/<version>/` for release assets and notes; and `archive/` for finished work. `<app>` is as in its
  package dir; `<name>` is `<app>` for our apps and the project's repo name otherwise (`revanced-manager`).
  `just revanced-patch` and `just morphe-patch` write the current checkout's `tmp/out/`, and the device-test skills
  write `tmp/device-test/<run>/`.
- Fetch an APK yourself with `agent-browser`, which runs cloakbrowser for Cloudflare's check, from APKMirror,
  APKPure or a similar site.

## Patches

Both trees follow these rules; their sections add each patcher's API rules.

- The name says what the patch does ("Remove ads"); the description says it in third person ("Removes ads.").
  Every named patch has a description and a compatibility naming the app, its package and the versions it was tested
  on. `PatchMetadataTest` checks these and that names are unique per app.
- Match on stable facts: strings, types, access flags, opcodes. Use an obfuscated name only when nothing stable
  exists, and say so in a comment.
- More than a few injected instructions belong in extension Java; the smali only calls into it.
- Fail at patch time: throw `PatchException` when a match is missing or ambiguous rather than risk a
  `VerifyError` in the app. Look up and check everything a patch needs before its first change: the patcher keeps
  a failed patch's changes, and the ReVanced CLI still writes the APK. A shared hook patch must leave the app no worse
  until a feature turns it on.
- Helpers are `internal`; only patches are public.
- A patch lives in `patches/src/main/kotlin/app/edbfi/patches/<app>/<area>/<feature>/`. `<app>` is a short
  lowercase app name (`syncforreddit`), `<area>` groups features (`ads`, `api`, `layout`, `misc`). Resources go in
  `patches/src/main/resources/edbfi/<app>/<feature>/`; code several apps share goes in `patches/…/patches/shared/`.
- Java that runs inside an app goes in an extension module, `extensions/<app>/`, package
  `app.edbfi.extension.<app>`, with compile-only stubs of the app's classes in its `stub/` subproject. Add it with
  the first patch that needs it, name its file with the plugin's `extension { name }` as each tree says, and keep
  kotlin-stdlib out of its runtime classpath. A tree's extension modules share its `extensions/proguard-rules.pro`
  and `build.gradle.kts`'s `android.library apply false`; building them needs an Android SDK (`ANDROID_HOME`).

## Commands

- `just check` runs what CI runs: the prek hooks, then `just revanced-check` and `just morphe-check`. `just build`
  builds both bundles. Each tree's section names its own recipes; inside a tree, run `./gradlew` from it.
- Gradle needs `githubPackagesUsername` and `githubPackagesPassword` (a classic PAT with only `read:packages`)
  in `~/.gradle/gradle.properties`; both trees read the same pair. Each daemon runs on JDK 25
  (`gradle/gradle-daemon-jvm.properties` in each tree); point `org.gradle.java.installations.paths` there at a JDK 25
  that Gradle doesn't find by itself, such as Homebrew's.

## Test device

- `just device` starts Android 15 in Docker ([Redroid](https://github.com/remote-android/redroid-doc), no VM or
  KVM) and connects adb on loopback; use `ANDROID_SERIAL=127.0.0.1:5600`. Agents share it: take turns.
  `just device-reset` deletes it and its data, the owner's login included: run it only when the owner asks.
- Test a bundle on it with the device-test skill for its ecosystem: `revanced-device-test` or `morphe-device-test`.
  `just revanced-patch` and `just morphe-patch` sign with the same key, the main checkout's
  `tmp/test-signing.keystore`, so either ecosystem's build installs over the other's with `adb install -r` and keeps
  the app's data.
- The host kernel needs binderfs and PSI; where PSI is off by default, boot with `psi=1`. On arm64 Linux, use a
  native `adb` on `PATH`, not the SDK's x86_64 one.
- It renders in software, and playing a video crashes its SurfaceFlinger
  ([redroid-doc#920](https://github.com/remote-android/redroid-doc/issues/920)): turn autoplay off and check
  videos through downloaded files and logs.
- Reddit's login page rejects Redroid's WebView (Chromium 128), so on arm64 `just device` installs a pinned
  Chromium WebView over it, re-signed with AOSP's public test key; the first run needs `ANDROID_HOME` for
  `apksigner`.
- Agents never type account credentials. The owner logs in through scrcpy; the agent then keeps the login by
  updating with `adb install -r`, never uninstalling.

## rea

- `.mcp.json`, `.codex/config.toml` and `opencode.json` start `scripts/rea.sh`, which runs rea from the main
  checkout's ignored `.rea/install/`, shared by every worktree. `just setup-rea` installs the current checkout's
  pin (`.rea/package.json`) there, fetches its JADX bridge, re-syncs `.agents/skills/reverse-engineer-anything`
  from the installed package, and checks Ghidra and JADX.
- Machine tools: Homebrew `openjdk@25` and `apktool`, and `adb`. rea verifies its Ghidra bridge against 12.1.4
  only and runs later 12.x, such as Homebrew's 12.2, unverified, so Ghidra 12.1.4 comes from NSA's release zip into
  `~/.local/opt/ghidra_12.1.4_PUBLIC` (or set `GHIDRA_INSTALL_DIR`); on arm64, build its decompiler with
  `support/gradle/gradlew buildNatives`.
- On arm64 Linux, x86_64 Android tools such as aapt2 run through `qemu-user-binfmt` with `libc6-amd64-cross`.
- Bump rea by hand: change `.rea/package.json`, refresh the lock with
  `npm install --package-lock-only --prefix .rea`, run `just setup-rea`, and commit the skill changes with it.

## Docs

- Docs hold only what the code can't say: this file, `README.md` and `docs/` for users, and short comments next to
  the code they explain. No reports, plans or notes in the repo: evidence goes in the PR body.
- When a fact changes, fix or delete every other statement of it; never append history.
- `README.md` lists each app in Supported apps: its name, its package, and a column per ecosystem that links the
  app's page for that bundle, named by its number of patches, or holds `—` where the bundle has none. It also holds
  what all apps share, such as Install for each manager and CLI. Each app has a page per bundle,
  `docs/<ecosystem>/<app>.md` (`<ecosystem>` is `revanced` or `morphe`, `<app>` as in its package dir), titled with
  its name: Tested version, Patches (name and description as in the code, On/Off default), Options (what they are for,
  not their defaults) and Known issues (bold symptom, then cause; deleted once fixed). Leave out an empty Options or
  Known issues. Each tree's `ReadmeTest` checks its own column and its own pages against its bundle.
- Keep the product name "edbfi patches" (`apk-patches` for the repository). Morphe's NOTICE forbids "Morphe" in a
  project, bundle or product name; secondary wording such as "for use with Morphe" is fine.

## Commits and releases

- Conventional Commits with a DCO sign-off (`git commit -s`), through a PR. Scope a change to one app's patches with
  its ecosystem and app, `<ecosystem>-<app>` (`fix(morphe-syncforreddit): …`, `feat(revanced-rifisfun): …`), a change
  to a whole tree with `revanced` or `morphe`, and the rest by area (`ci`, `rea`, `docs`).
- New source files carry `SPDX-License-Identifier: AGPL-3.0-or-later`. Other patch repos are reference only:
  nothing is copied from them.
- Both bundles share one [SemVer](https://semver.org/) version. Release by publishing a GitHub release from main
  tagged `vX.Y.Z`; `release.yml` builds both bundles, signs them, attaches the assets and ReVanced's
  `patches-bundle.json`, then pushes Morphe's feed, `patches-bundle.json` at the root of main, with a deploy key. Never
  edit that file by hand. Never move, delete or reuse a tag; fix a bad release with a new one.
- Bump from all commits since the last tag, whichever tree they touch: breaking → major (minor while the version is
  `0.y.z`), `feat` → minor, `fix` or `perf` → patch. A fix on one side re-releases the other side's unchanged bundle
  under the new version. A change is breaking when users must act on it: a removed or renamed patch or option, or a
  dropped app version. Mark it with `!`.

## ReVanced (`revanced/`)

- ReVanced Patcher v22 API only: `bytecodePatch`/`resourcePatch` with `apply {}` and declarative method matchers,
  never `execute {}` or `fingerprint {}`. A feature's matchers go in `Matchers.kt` beside its `<Feature>Patch.kt`.
- Each patch's `compatibleWith` names the package and the versions it was tested on.
- An extension's file is `extensions/edbfi/<app>.rve`.
- Its app pages are `docs/revanced/<app>.md`, and its README column is ReVanced.
- `just revanced-check` lints, tests and builds the bundle; `just revanced-build` builds
  `revanced/patches/build/libs/patches-<version>.rvp`. `just revanced-patch <apk>` applies it with the pinned
  revanced-cli into `tmp/out/`, signed with the main checkout's `tmp/test-signing.keystore`, which it creates on its
  first run.

## Morphe (`morphe/`)

- Morphe Patcher API only, at the version `gradle/libs.versions.toml` pins: `patch(...)` with `execute {}`. A
  feature's `Fingerprint` objects go in `Fingerprints.kt` beside its `<Feature>Patch.kt`; code one app's fingerprints
  share goes in `<app>/`.
- Resolve every lookup to exactly one match: `matchSingle()`, or `matchAll()`/`matchAllOrNull()` and an explicit
  check of the count. Never take the default first match.
- A fingerprint's `accessFlags` must equal the method's flags exactly. Where only some flags matter, check them with
  `shared/Matching.kt`'s `hasFlags` in `custom`.
- Look up and check everything before the first change: collect the changes as `Edit`s (`shared/Edit.kt`), check
  their counts, and apply them last.
- Each patch's `compatibleWith` takes the app's `Compatibility`, defined once per app in `<app>/`, whose `targets` are
  the versions it was tested on.
- Class files are Java 17 or older: Morphe Manager runs patches on Java 17.
- An extension's file is `extensions/edbfi/<app>.mpe`.
- Pin `morphe-patcher` (`gradle/libs.versions.toml`) only to a version the latest released Morphe Manager and Morphe
  desktop both ship, and bump it by hand: Manager warns on a bundle whose `Patcher-Version` is newer than its own.
  The justfile's `morphe_cli_version` pins the Morphe desktop jar that `just morphe-patch` and the release's signature
  check use.
- Its app pages are `docs/morphe/<app>.md`, and its README column is Morphe.
- `just morphe-check` lints, tests and builds the bundle; `just morphe-build` builds
  `morphe/patches/build/libs/patches-<version>.mpp`, unsigned. `just morphe-patch <apk>` applies it with the pinned
  Morphe CLI into `tmp/out/`, signed with the same `tmp/test-signing.keystore`; run `just revanced-patch` once first
  if it doesn't exist yet.
- The release writes an Ed25519 signature into the `.mpp`'s zip comment. Morphe Manager and the Morphe CLI check it
  when they download the bundle and pin the key; its public half is `morphe-signing.pub`.
