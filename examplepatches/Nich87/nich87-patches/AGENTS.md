# Nich87 Patches

Read `.agents/skills/nich87-patches-dev/SKILL.md` for development, build,
compatibility or release work in this repository. Read `DEVELOPMENT.md` for
environment setup and authoritative upstream links.

## Repository identity

- Repository: `Nich87/nich87-patches`; product name: `Nich87 Patches`.
- Base namespace and Maven group: `app.voidhack` (user-selected).
- Kotlin patches: `app.voidhack.patches`.
- Extension namespace and Java package: `app.voidhack.extension`.
- Keep `LICENSE` and `NOTICE`. Morphe is a compatibility reference, not the
  name or primary brand of this project. In a conflict, use the actual NOTICE
  rather than copying a naming example from documentation.

## Development and releases

- Inspect the current branch and working tree before editing. Develop on
  `dev`; preserve existing user changes.
- When commits are requested, use `feat:`, `fix:` or `chore:`. `feat:` and
  `fix:` trigger releases on the release branches; `chore:` does not.
- Stable releases merge `dev` into `main` with a merge commit. Do not squash
  or rebase this release history, delete `dev`, or force-push release commits.
- Use the existing `.github/workflows/release.yml` and `.releaserc` for
  releases. Do not introduce a separate release script, create release tags
  by hand, upload release bundles manually, or hand-edit release versions.
- Do not hand-edit or manually commit generated `patches-list.json`,
  `patches-bundle.json` or `CHANGELOG.md`. Preserve the generated README
  section between `PATCHES_START` and `PATCHES_END`; keep permanent developer
  documentation outside that section.

## Build and credentials

- Use JDK 21, the checked-in Gradle wrapper, and Android SDK Platform 36.
- Local build: `./scripts/gradle.sh buildAndroid`. This launcher obtains
  GitHub Packages credentials from `gh` and isolates the Gradle cache from
  unrelated projects. CI continues to use the original `./gradlew` commands.
- Never put tokens in repository files, command-line arguments, logs or chat.
  Keep original APKs and local tools out of Git. `.local/` is ignored.
- Signing is optional. Never commit `morphe-signing.key`; only its public key
  belongs in Git. Upload the private key only as `MORPHE_SIGNING_KEY` when
  release signing is requested.

## Patch correctness

- Update source paths, package declarations, imports, extension namespace
  and smali class descriptors together when renaming.
- A fingerprint must identify the intended method in the actual target APK.
  Use the Patcher API version pinned in `gradle/libs.versions.toml`.
- Compatibility declarations must reflect the actual APK/APKM/XAPK type and
  versions tested. Do not infer support for future versions from a build.
- Validate the `.mpp` build and loading separately from APK patching,
  installation and device behavior. Report precisely which steps ran.
