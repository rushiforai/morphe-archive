# Agent instructions

Patches by edbfi for several Android apps. The independent Gradle builds in `revanced/`, `morphe/` and `reseam/`
produce `patches-<version>.rvp`, `patches-<version>.mpp` and `edbfi-patches.reseam`. Each has its own code, extensions,
tests, docs and patch list. Only the release is shared.
CI comes from [edbfi-ci](https://github.com/edbfi/edbfi-ci); its rules apply here. `CLAUDE.md` is a symlink to this
file.

## Layout

- Each bundle tree has its own Gradle wrapper and configuration. Paths in Patches and in each tree's section are
  relative to the tree.
- At the root are `docs/<ecosystem>/` for the bundles' app pages, `keys/release-signing.asc` for the ReVanced and
  Morphe GPG key, `scripts/` for the release and REA, `justfile`, and `.github/`.
- ReVanced and Morphe each load their bundles into a shared class loader. A bundle file with a conflicting path can be
  read in place of ours. Both trees use `edbfi` in resource and extension paths, checked by `PatchMetadataTest`.

## Local files

- Never commit APKs, bundles, keystores or app code. Local files go in the main checkout's ignored `tmp/`:
  `inputs/<name>-<version>/` for downloads, one version per directory; `decompiled/<app>-<version>/`;
  `repos/` for other projects' clones; `tools/<purpose>/` for our scripts; `evidence/<feature>/`;
  `releases/<version>/` for release assets and notes; and `archive/` for finished work. `<app>` is as in its
  package dir; `<name>` is `<app>` for our apps and the project's repo name otherwise (`revanced-manager`).
  `just revanced-patch`, `just morphe-patch` and `just reseam-patch` write to the current checkout’s `tmp/out/`.
  Device-test skills write to `tmp/device-test/<run>/`.
- Fetch an APK yourself with `agent-browser`, which runs cloakbrowser for Cloudflare's check, from APKMirror,
  APKPure or a similar site.

## Patches

All trees follow the naming and matching rules. Use the Reseam section for its layout and API.

- The name says what the patch does ("Remove ads"); the description says it in third person ("Removes ads.").
  Every named patch has a description and a compatibility naming the app, its package and the versions it was tested
  on. `PatchMetadataTest` checks these and that names are unique per app.
- Match on stable facts: strings, types, access flags, opcodes. Use an obfuscated name only when nothing stable
  exists, and say so in a comment.
- In ReVanced and Morphe, put substantial injected logic in extension Java and call it from smali.
- Resolve and check every target before editing. In ReVanced and Morphe, throw `PatchException` for missing or
  ambiguous matches. ReVanced CLI can still write the APK after a failed patch, so validate before the first edit.
  Keep shared hooks inert until a feature enables them.
- Helpers are `internal`; only patches are public.
- In ReVanced and Morphe, a patch lives in `patches/src/main/kotlin/app/edbfi/patches/<app>/<area>/<feature>/`.
  `<app>` is a short lowercase name such as `syncforreddit`. Group features by area (`ads`, `api`, `layout`, `misc`).
  Put resources in `patches/src/main/resources/edbfi/<app>/<feature>/` and shared code in `patches/…/patches/shared/`.
- In ReVanced and Morphe, Java that runs inside an app goes in `extensions/<app>/`, package
  `app.edbfi.extension.<app>`, with compile-only stubs of the app's classes in its `stub/` subproject. Add it with
  the first patch that needs it, name its file with the plugin's `extension { name }` as each tree says, and keep
  kotlin-stdlib out of its runtime classpath. A tree's extension modules share its `extensions/proguard-rules.pro`
  and `build.gradle.kts`'s `android.library apply false`; building them needs an Android SDK (`ANDROID_HOME`).

## Commands

- `just check` runs the prek hooks and the three bundle checks. `just build` builds all three bundles. Each tree's
  section names its own recipes. Run `./gradlew` from the corresponding tree.
- ReVanced and Morphe read `githubPackagesUsername` and `githubPackagesPassword` from `~/.gradle/gradle.properties`.
  Use a classic PAT with only `read:packages`. Both run their Gradle daemon on JDK 25
  (`gradle/gradle-daemon-jvm.properties` in each tree); point `org.gradle.java.installations.paths` there at a JDK 25
  that Gradle doesn't find by itself, such as Homebrew's.

## Test device

- `just device` starts Android 15 in Docker with a two-CPU limit using
  [Redroid](https://github.com/remote-android/redroid-doc) (no VM or KVM) and connects adb on loopback.
  Use `ANDROID_SERIAL=127.0.0.1:5600`. Agents share it and take turns.
  `just device-reset` deletes it and its data, the owner's login included: run it only when the owner asks.
- Test a bundle on it with the device-test skill for its ecosystem: `revanced-device-test` or `morphe-device-test`.
  All three patch recipes call `just test-keystore` to create or reuse the main checkout’s `tmp/test-signing.keystore`.
  Verify the APK certificate against the installed copy before updating with `adb install -r`.
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
- Machine tools: Homebrew `openjdk@25`, Ghidra 12.2 or later, `apktool`, and `adb`. `scripts/rea.sh` prefers a
  Homebrew Ghidra installation and accepts an official release extracted under `~/.local/opt` through
  `GHIDRA_INSTALL_DIR`; on arm64, build its decompiler with `support/gradle/gradlew buildNatives`.
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
  `docs/<ecosystem>/<app>.md` (`<app>` as in its package dir), titled with
  its name: Tested version, Patches (name and description as in the code, On/Off default), Options (what they are for,
  not their defaults) and Known issues (bold symptom, then cause; deleted once fixed). Leave out an empty Options or
  Known issues. The ReVanced and Morphe `ReadmeTest` classes and the Reseam catalog check each validate their own
  column and pages. Use `Compatible version` for Reseam until the build has runtime evidence for every listed version.
- Keep the product name "edbfi patches" (`apk-patches` for the repository). Morphe's NOTICE forbids "Morphe" in a
  project, bundle or product name; secondary wording such as "for use with Morphe" is fine.

## Commits and releases

- Conventional Commits with a DCO sign-off (`git commit -s`), through a PR. Scope a change to one app's patches with
  its ecosystem and app, `<ecosystem>-<app>` (`fix(morphe-syncforreddit): …`, `feat(revanced-rifisfun): …`), a change
  to a whole tree with `revanced`, `morphe` or `reseam`, and the rest by area (`ci`, `rea`, `docs`).
- New source files carry `SPDX-License-Identifier: AGPL-3.0-or-later`. Other patch repos are reference only:
  nothing is copied from them.
- The bundles share one [SemVer](https://semver.org/) version. Publish a GitHub release from main tagged `vX.Y.Z`.
  The release workflow builds and signs the assets, attaches ReVanced's feed, and pushes Morphe's feed,
  `patches-bundle.json` at the root of main, with a deploy key. Never edit that file by hand. Never move, delete
  or reuse a tag. Fix a bad release with a new one.
- Bump from all commits since the last tag, whichever tree they touch: breaking → major (minor while the version is
  `0.y.z`), `feat` → minor, `fix` or `perf` → patch. A release sets the same version on each bundle. A change is
  breaking when users must act on it: a removed or renamed patch or option, or a
  dropped app version. Mark it with `!`.

## ReVanced (`revanced/`)

- ReVanced Patcher v22 API only: `bytecodePatch`/`resourcePatch` with `apply {}` and declarative method matchers,
  never `execute {}` or `fingerprint {}`. A feature's matchers go in `Matchers.kt` beside its `<Feature>Patch.kt`.
- Each patch's `compatibleWith` names the package and the versions it was tested on.
- An extension's file is `extensions/edbfi/<app>.rve`.
- Its app pages are `docs/revanced/<app>.md`, and its README column is ReVanced.
- `just revanced-check` lints, tests and builds the bundle; `just revanced-build` builds
  `revanced/patches/build/libs/patches-<version>.rvp`. `just revanced-patch <apk>` applies it with the pinned
  revanced-cli into `tmp/out/`, signed with the shared test key.

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
  Morphe CLI into `tmp/out/`, signed with the shared `tmp/test-signing.keystore`.
- The release writes an Ed25519 signature into the `.mpp`'s zip comment. Morphe Manager and the Morphe CLI check it
  when they download the bundle and pin the key; its public half is `morphe-signing.pub`.

## Reseam (`reseam/`)

- Pin the `app.reseam.workspace` plugin and the CLI together at `1.0.1`. The workspace uses JDK 17. See the
  [pinned SDK guide](https://github.com/Reseam/reseam/tree/v1.0.1/docs).
- Point `JAVA_HOME` at a native JDK 17. On arm64 Linux the CLI runs under QEMU and loads an x64 JVM from
  `tmp/inputs/temurin-17-x64` in the main checkout. Set `RESEAM_X64_JAVA_HOME` to change that path or
  `RESEAM_BIN` to use a compatible CLI executable instead of the platform default.
  For direct CLI commands on arm64 from the repo root, run:

  ```sh
  export RESEAM_X64_BIN="$(just _reseam-cli)"
  export RESEAM_X64_JAVA_HOME="${RESEAM_X64_BIN%/reseam-1.0.1/reseam}/temurin-17-x64"
  reseam() { "$PWD/scripts/reseam-arm64.sh" "$@"; }
  reseam --version
  ```
- App patches live in `apps/<app>/patch/`. Export public top-level `val`s using `patch { execute { … } }`, with English
  user-visible strings in `src/main/strings/values/strings.xml`. Keep published Kotlin package and property names
  stable because they form patch IDs. Use unnamed patches for dependencies and keep other helpers internal.
- Pin each app's package and supported version in `compatibleWith`. Resolve required targets uniquely before
  editing. Use SDK targets, points and typed code blocks where they express the edit. Put in-app code in
  `apps/<app>/extensions/<name>/` and call it through generated bindings when needed.
- `just reseam-check` runs the extensions’ JVM tests and checks the compiled catalog with Python 3.11 or later.
  Put JVM regression tests in the extension’s `src/test/`. `just reseam-build` writes
  `reseam/build/reseam/unsigned/edbfi-patches.reseam`. `just reseam-patch <apk>` uses temporary EC signing for the
  CLI output, then re-signs it with the shared test certificate using `apksigner` from Build Tools in `ANDROID_HOME`.
- Run the on-demand Redroid check after changing rif’s Markdown links, media links or Settings Search, or Sync’s
  comment queries.
  Install SDK Platform 36 and Build Tools 36.0.0 under `ANDROID_HOME`, set `ANDROID_SERIAL` and run
  `bash reseam/tests/android-framework/run.sh reseam/build/reseam/unsigned/edbfi-patches.reseam` after building.
  For rif Settings Search, patch rif 5.6.22 with that same bundle and pass the resulting APK as the second argument.
- After changing Sync’s Backup screen, test backup and restore on a disposable profile. Change a harmless setting
  after saving, restore the backup, and verify the saved value after a cold start.
- For Sync’s locally implemented features, use a fresh, unsubscribed install on a disposable device as the primary
  check, through the app’s normal UI. Archived, genuinely subscribed installs are optional comparison controls.
  Use a device with Google Play services to verify automatic detection and successful **Translate all** output.
- After changing Sync’s translation, open an eligible comment and text post as a guest and check their translation
  actions. Use **Action visibility → Translate** to turn **Translate all** off and back on. Check source selection,
  cancel and retry, missing Play services and model availability, and the return to the discussion. With ML Kit
  available, check the English result against known source text and confirm the original text is preserved.
- After changing Sync’s image text recognition, set `ANDROID_SERIAL` to the disposable device and run
  `bash reseam/tests/android-framework/image-text.sh reseam/build/reseam/unsigned/edbfi-patches.reseam`.
  Open an image in the guest viewer and choose **Extract text**. With Play services and the ML Kit Latin OCR module,
  use a known-text image to check selection, **Copy text**, and return to the viewer. Without Play services, check
  the availability message and return to the viewer. Check an HTTP image failure with the sheet open, then repeat
  with a delayed failure after dismissing the sheet and after rotating it.
  Confirm the old callback runs without showing an error or closing a replacement sheet.
- After changing Sync’s Ultra settings, check the Settings entry summary and open Ultra as a guest. Check that the
  page describes local tag and paint storage and omits the cloud-backup shortcut and terms. Open **Backup now** from
  Settings Search to verify local backup is still reachable.
- After changing Sync’s website previews, open an eligible comment link with a public `og:image` inline and in
  Link options on a fresh guest install. Check retry after an image fails. Use **Settings → Link handling → Website
  previews** to turn them off and back on. Verify that Settings Search opens that switch. With a proxy configured,
  check that previews are suppressed and the ordinary link actions still work.
- After changing Sync’s retired comment restore action, check discussion menus, comment-card long presses, Ultra
  settings and Settings Search with ordinary, `[removed]` and `[deleted]` fixture comments. Cover the guest flow.
  With synthetic Ultra eligibility and the restore flag on, use stock as the discussion control and a patch-off
  build as the native card control.
- After changing Sync’s tags or paints, add, edit and remove a guest tag. Cold-start Sync after each change and
  check the author in a discussion. Pick and edit an author color as a guest, then remove it in **Settings →
  Sync Ultra → Local author colors**. Cold-start Sync after each change and compare the colored author with
  another author in the same discussion. Rotate an open color editor from both entry points with an incomplete
  hex value, then check Save and Cancel and their return screens.
  **Force refresh** does nothing where shown, **Clear all** preserves entries and shows “TODO”, and the tag menu
  hides **Import local**.
- Reseam's release job signs the bundle with its own key and attaches `edbfi-patches.reseam` and the Reseam source
  index `patches.json` to the GitHub release. Before the first Reseam release, review and commit the authorized
  publisher public key at `keys/reseam-signing.pub` for the release tag and provision the matching
  `RESEAM_SIGNING_KEY_B64` secret. Local checks use a temporary key.
