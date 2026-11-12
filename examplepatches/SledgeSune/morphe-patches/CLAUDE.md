# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

Personal [Morphe](https://github.com/MorpheApp) patch bundle (`SledgeSune/morphe-patches`, public), built from
MorpheApp's patches template. Patches **Sync.ME** (`com.syncme.syncmeapp`) and **Waze** (`com.waze`); any new app
gets its own folder here, not a new repo. All code is written by Claude — keep the README's "MADE BY AI" warning.

**Read [HANDOFF.md](HANDOFF.md) at the start of a session** (state, how each patch hooks in, what is untested,
open issues) and update it at the end. Workflows live in `.claude/skills/`:
`morphe-handoff` (start/end a session), `new-morphe-patch`, `update-app-version`, `release-morphe-patches`.

## Build

Needs JDK 21, the Android SDK, and a GitHub token with `read:packages` as `gpr.user`/`gpr.key` in
`~/.gradle/gradle.properties` (all set up on this PC; `local.properties` is git-ignored). In Git Bash:

```bash
export JAVA_HOME="$(ls -d '/c/Program Files/Eclipse Adoptium'/jdk-21* | tail -1)"
export ANDROID_HOME="$LOCALAPPDATA/Android/Sdk"
./gradlew buildAndroid generatePatchesList --console=plain -q   # → patches/build/libs/patches-<version>.mpp
git checkout -- patches-list.json                               # generated; only releases commit it
```

There is no test suite and no device. "Verified" means: the build passes, every patch is listed in
`patches-list.json`, and each fingerprint matches exactly one method in the decompiled target. Only the owner can
test on a phone — say "untested" until they report back. `python3` is a Store stub; use
`$LOCALAPPDATA/Programs/Python/Python3*/python.exe`.

## Architecture

Two Gradle modules bundled into one `.mpp` by the `app.morphe.patches` plugin:

- **`patches/`** (Kotlin), `app/sledgesune/patches/<app>/<feature>/` — `Fingerprints.kt` (objects extending
  `app.morphe.patcher.Fingerprint`) and a `*Patch.kt` with a top-level
  `val x = patch(name, description, default) { compatibleWith(...); execute { ... } }` that edits the matched
  methods' smali. Patches are discovered automatically; `name`/`description` are user-facing (Morphe Manager, README).
- **`extensions/extension/`** (Java → `extensions/extension.mpe`), `app.sledgesune.extension.<app>` — helpers that
  injected smali calls with `invoke-static Lapp/sledgesune/extension/...;`. Patches using them call
  `extendWith("extensions/extension.mpe")`. App classes aren't on the compile classpath, so extensions use `Object`
  and reflection, wrap every hook in try/catch and fall back to the original behaviour.
- **`shared/Constants.kt`** — one `COMPATIBILITY_<APP>`: package, `ApkFileType.APKM`, the exact tested version, plus
  `AppTarget(version = null, isExperimental = true)`.

**Fingerprints never match obfuscated names** (they change every release). Match on strings, un-obfuscated
field reads / calls (`fieldAccess`, `methodCall`), return type and parameters; put the obfuscated name for the tested
version in the KDoc. Prefer one gate method (e.g. Sync.ME `PremiumAccess.isAdFree()`) over every caller.

## Git and releases

- Work and commit on `dev`, one commit per patch. `main` only moves at release time (fast-forward).
- Semantic commits drive the version: `feat(<App>): Add "<Patch name>" patch` → minor, `fix(<App>): ...` → patch,
  `chore: ...` → no release.
- Release only when the owner asks (it's public and reaches Morphe Manager users). `release.yml` runs
  semantic-release (`.releaserc`), which writes `CHANGELOG.md`, `patches-bundle.json`, `patches-list.json` and the
  README table between `PATCHES_START`/`PATCHES_END`. GitHub Actions is blocked on this account, so the
  `release-morphe-patches` skill does the same by hand.

## Rules

- Public repo: no real names, emails, user folders, tokens, signing keys, APKs or decompiled app code.
- Downloaded APKs are untrusted: unpack each into its own scratchpad folder, never run anything from them, and don't
  run jars/tools downloaded from the internet (e.g. the Morphe CLI).
- The owner follows along from their phone: keep closing messages self-contained, plain words, one clear question.
