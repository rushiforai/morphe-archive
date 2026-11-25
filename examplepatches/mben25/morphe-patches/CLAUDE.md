# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

A Morphe patch bundle (fork of `MorpheApp/morphe-patches-template`). It compiles Kotlin
patch definitions into an `.mpp` bundle that Morphe Manager / Morphe Desktop applies to an
APK. Currently ships one patch: **Unlock Pro** for MT Capsule (`com.pryshedko.mtisland`,
verified against 15.7, minSdk 32).

## Build & verify

```bash
./gradlew buildAndroid                 # build the bundle -> patches/build/libs/patches-*.mpp
./gradlew :patches:buildAndroid clean  # what CI runs to verify compilation
./gradlew :patches:applyToApk --args "<path-to.apk> [outputDexDir] [--patches=mtcapsule|masareef|deviceinfo]"
./gradlew :patches:generatePatchesList # regenerates patches-list.json (release only)
```

There is no test suite. `applyToApk` **is** the test: it runs the real patcher against a
local APK and exits non-zero if any patch fails to resolve or execute. Default APK path if
no arg is given is `../mtcapsule15.7.apk`. Always run it after touching fingerprints — a
compiling patch that no longer resolves is the normal failure mode.

Gradle resolves the `app.morphe.patches` plugin and `app.morphe:morphe-patcher` from
GitHub Packages, so a GitHub PAT is required: set `gpr.user`/`gpr.key` in
`~/.gradle/gradle.properties`, or `GITHUB_ACTOR`/`GITHUB_TOKEN` in the env.

## Layout

- [patches/src/main/kotlin/app/mtcapsule/patches/](patches/src/main/kotlin/app/mtcapsule/patches/) — the patches. One package per target app (`mtisland/`), plus `shared/` for cross-patch constants.
- [Constants.kt](patches/src/main/kotlin/app/mtcapsule/patches/shared/Constants.kt) — the `Compatibility` object (package name, icon color, `AppTarget` list). Every patch's `compatibleWith(...)` points here; adding a supported version means editing this one file.
- [patches/src/main/kotlin/util/](patches/src/main/kotlin/util/) — build tooling, not shipped behaviour. `ApplyToApk.kt` is the local verifier; `PatchListGenerator.kt` is invoked by release.
- [extensions/extension/](extensions/extension/) — Android library compiled to `extension.mpe` and injected as dex by patches that need real Java code. Still the untouched template sample (`app.template.extension`); no current patch uses it.

Note the Gradle project name is `mtcapsule-patches` and the module is `:patches`, but
`buildAndroid` at the root works too.

## Adding patches for a new app

**Never edit another app's existing patches when adding a new app.** Each target app owns
its own package (`mtisland/` for MT Capsule) — a new app means a new sibling package with
its own patches and its own `Compatibility`. Existing apps' patch files, fingerprints, and
compatibility entries stay byte-for-byte untouched.

If the new app appears to need a change in existing code, do not make it: prefer
duplicating the small piece into the new package, and if the shared code genuinely has to
change, stop and ask first. Silent edits to a working app's patches are how a bundle
regresses on an app nobody was testing.

## How the patches work

Patches are declared as top-level `val`s via `bytecodePatch { ... }` and discovered by
reflection, hence `@Suppress("unused")`. `execute { }` runs against the decoded dex.

Everything is resolved against **obfuscated** R8 output, so the pattern used here matters:

1. One anchor fingerprint that searches the whole app, matched on stable strings
   (`GetOrCreateSecretKeyFingerprint` matches on `"AndroidKeyStore"`, `"pro_version_key"`, …).
2. `originalClassDef` from that anchor is then passed to `Fingerprint.match(classDef)` to
   scope every subsequent lookup to the same class. Inline `Fingerprint(...)` objects
   declared at the call site are normal for these scoped lookups; only reusable/anchor
   fingerprints live in [Fingerprints.kt](patches/src/main/kotlin/app/mtcapsule/patches/mtisland/Fingerprints.kt).
3. Class references are chased through matched instructions —
   `match.instructionMatches[i].getMethodCalled().definingClass` — rather than named,
   since names are obfuscated (`Lfo1;`) and change between versions.

Obfuscated parameter/return types are written as bare `"L"`. `filters` with
`InstructionLocation.MatchAfterImmediately()` / `MatchAfterWithin(n)` express ordering
between instructions.

When inserting instructions by index, iterate **reversed** so earlier insertions don't
shift the indexes still to be patched (see the emit-override loop in
[UnlockProPatch.kt](patches/src/main/kotlin/app/mtcapsule/patches/mtisland/UnlockProPatch.kt)).

The `unlockProPatch` comments record hard-won specifics (why the setter must also be
patched, why the boxing call is the wrong hook point, why R8 merges the collector). Keep
that level of comment when changing bytecode-level logic — it is what makes a regression
diagnosable on the next app version.

## Release process

Do not hand-manage releases.

- Work on `dev`. Merge `dev` → `main` (merge commit, never squash) for a stable release.
- **Only `main` triggers the release.** `release.yml` is configured with `push: branches: [main]` — pushing to `dev` does nothing and silently falls through. The `.releaserc` comment ("dev and main") is outdated; trust the workflow file. After finishing work on `dev`, `git checkout main && git merge --no-ff dev && git push` is the step that cuts the release.
- [Semantic commits](https://kapeli.com/cheat_sheets/Semantic_Commits.docset/Contents/Resources/Documents/index) only: `feat:` and `fix:` cut a release, `chore:` does not.
- `release.yml` + `.releaserc` handle everything. Don't write new release scripts; modify these.
- Generated, never hand-edited or hand-committed: `patches-list.json`, `patches-bundle.json`, `CHANGELOG.md`, and the `<!-- PATCHES_START -->` block in [README.md](README.md).
- Never force-push a semantic-release commit — it breaks all future releases. Fix a broken release by cutting a new one.

## Publishing the bundle & consuming it in Morphe Manager

The repo lives on a **second GitHub account**, pushed over an SSH host alias, so the remote is
not a plain `github.com` URL:

```
origin  git@gh_mba25:mben25/morphe-patches
```

`gh_mba25` is a `Host` block in `~/.ssh/config` (`HostName github.com`, that account's
`IdentityFile`, `IdentitiesOnly yes`). Rules:

- Never rewrite the remote to `git@github.com:…` — it authenticates as the *first* account and
  fails with `Permission to mben25/morphe-patches.git denied to <other user>`.
- `ERROR: Repository not found` on push means the alias resolved but the owner/repo path is
  wrong or that account cannot see the repo — check `git remote -v` against the actual repo
  page, don't "fix" it by dropping the alias.

The Manager source URL is the raw `patches-bundle.json` on `main`:

```
https://raw.githubusercontent.com/mben25/morphe-patches/main/patches-bundle.json
```

`patches-bundle.json` is **generated by semantic-release only**, and it ships in the repo as an
empty template (`"download_url": ""`, `"version": ""`). While it is still empty the Manager
shows the source as `Unnamed` / `Metadata N/A` / `Patches 0` with
*"The patch bundle could not be downloaded. The source URL may be incorrect or the file does
not exist"* — that is an empty `download_url`, not a wrong URL. Do not hand-fill it.

Fix is always to cut a real release:

- `release.yml` runs on every push, but `.releaserc`'s `commit-analyzer` only releases on
  `fix:`, `feat:`, `bump:`, `perf:` and `build(Needs bump):`. A commit like `Init commit` or
  `chore: …` produces no release, no `.mpp` asset, and no `patches-bundle.json` update — the
  workflow silently falls through to its "Verify project compiles" step instead.
- After CI releases, it pushes a `chore: Release vX.Y.Z [skip ci]` commit back. `git pull`
  before doing further work, or the next push conflicts.
- Then refresh (or re-add) the source in the Manager; a source added while the JSON was empty
  stays broken and has to be deleted and re-added.

- For unfamiliar features, don't write from scratch—first search Github, GitLab, BitBucket and Codeberg for open-source projects, compare approaches, then get started

- When I say "new", summarize our discussion in 200 words formatted as: key decisions made, code patterns established, next steps identified. Format as a system prompt for my next chat, ready for one-click copy. Output only the summary, nothing else.
