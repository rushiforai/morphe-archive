---
name: nich87-patches-dev
description: Develop and validate patches in Nich87/nich87-patches, including its Morphe build environment, fingerprints, extensions and existing release workflow. Use only for this repository.
---

# Nich87 Patches development

Read the repository's `AGENTS.md` first and use `DEVELOPMENT.md` for setup
details and authoritative upstream references. This skill supports this
repository; it does not grant permission to commit, push or publish.

## Establish the task

Inspect the branch and dirty work before changing files. Patch development
belongs on `dev`. Confirm the target app, exact version, original APK type
and requested behavior before implementing a patch.

Read the existing patch and the pinned Patcher API before copying API usage
from another project or a newer upstream revision.

## Build environment

Use JDK 21 and Android SDK Platform 36. Run
`./scripts/gradle.sh buildAndroid` from the repository; extra Gradle arguments
are forwarded. The launcher uses a separate temporary `GRADLE_USER_HOME`
and reads credentials from GitHub CLI unless explicitly supplied in the
environment. The separate Gradle cache isolates credentials between projects.

If Packages returns 401/403, check the credential source and `read:packages`
scope without printing a token. Use GitHub's browser authentication flow;
never ask for a PAT in chat. If a custom Gradle user home contains `gpr.*`
properties, those properties take precedence in the upstream plugin.

Find the actual output at `patches/build/libs/patches-*.mpp`; verify that it
contains `classes.dex` and the declared extension resource. A JVM-only build
is insufficient for Android loading.

## Patch changes

Keep package paths, declarations, imports and smali descriptors in sync.
Use the user-selected base namespace `app.voidhack`, with
`app.voidhack.patches` for patches and `app.voidhack.extension` for extensions.
The extension class `app.voidhack.extension.applemusic.LiquidGlass` is referenced
as `Lapp/voidhack/extension/applemusic/LiquidGlass;` in smali.

Resolve fingerprints against the real target APK. A fingerprint matching a
different method is a failure even when it compiles. Declare exact versions
that were tested and the actual APK/APKM/XAPK format. Treat unrestricted
future versions as unverified unless there is evidence for that declaration.

Build and load the `.mpp` with a compatible official Morphe Desktop release.
For behavior changes, apply it to the original target APK and verify the
result through the appropriate app/device surface. Report build, loading,
patching, installation and runtime evidence separately. Successful compilation
alone does not prove target app behavior.

Do not use `generatePatchesList` as a loading check in the working tree;
it rewrites the release-managed `patches-list.json`.

## Release work

Follow `AGENTS.md`: semantic commits on `dev`, merge into `main` without
squash/rebase, and use the existing `release.yml` / `.releaserc`. Do not add a
new release script or manually repair generated release artifacts.

Before the first `dev` to `main` merge, check that the generated template
branches share an ancestor. If not, preserve both histories with a one-time
merge only when that Git operation has been requested.

Re-check live branch state, Actions permissions and completed workflow results
before calling a release ready. Optional release signing uses the upstream
task and `MORPHE_SIGNING_KEY`; the private key never belongs in Git.
