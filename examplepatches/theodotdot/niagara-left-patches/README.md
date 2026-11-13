# Niagara Left Patches

A one-patch Morphe repository that anchors the Niagara Button (the round/pill button on the home
screen) to the **left** edge instead of the right edge.

Niagara has no setting for this: both button views are inflated from `res/layout/home_activity.xml`
and anchored to `@id/guideline_end`, a vertical guideline `@dimen/alphabet_wave_width` from the
right edge. The patch swaps that anchor for `constraintStart` plus the same start margin, so the
button keeps the column that the alphabet wave occupies on the right side. No bytecode is touched,
and nothing in `HomeActivity` re-anchors the button at runtime.

## Publishing

1. Create the public GitHub repository `theodotdot/niagara-left-patches` and push `main`. If you use
   another owner or name, update `patches-bundle.json`, the `about.source` in
   `patches/build.gradle.kts`, and the URLs in this README.
2. Repository → Settings → Actions → General → Workflow permissions: allow **Read and write
   permissions**, which the release workflow needs to push the updated `patches-bundle.json`.
3. Every push to `main` builds the bundle, publishes the release `v<version>` with the `.mpp`
   attached, and rewrites `patches-bundle.json` to point at that asset.

## Adding it to Morphe Manager

Add this repository as a patch source:

```
https://github.com/theodotdot/niagara-left-patches
```

Morphe Manager resolves a GitHub repository URL to
`https://raw.githubusercontent.com/theodotdot/niagara-left-patches/main/patches-bundle.json`.

Or use the deep link:

```
https://morphe.software/add-source?github=theodotdot/niagara-left-patches
```

Then patch Niagara Launcher and enable **Niagara Button on the left**.

## Supported versions

- `1.16.36` — the version the patch was written and verified against.
- Any other version — offered as experimental. The patch copies the button's right-edge reserve from
  the guideline the app itself declares, so it does not depend on a dimension name that Niagara
  renamed between releases (`1.16.28` has no `@dimen/alphabet_wave_width`). It fails with a readable
  `PatchException` instead of silently doing nothing when the two button views are not found.

## Building locally

The patch plugin is published on GitHub Packages, which requires an authenticated token even for a
public package:

```bash
export GITHUB_TOKEN=$(gh auth token)
export GITHUB_ACTOR=$(gh api user -q .login)
./gradlew :patches:buildAndroid
```

The bundle lands in `patches/build/libs/patches-<version>.mpp`; apply it with Morphe Desktop or by
pushing it to this repository, where `.github/workflows/release.yml` builds it, publishes a release
`v<version>` with the `.mpp` attached, and rewrites `patches-bundle.json` to point at that asset.

Bump `version` in `gradle.properties` when the patch changes.
