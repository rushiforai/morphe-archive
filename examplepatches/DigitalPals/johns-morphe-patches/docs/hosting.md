# Hosting John's Morphe Patches

Display name: **John's Morphe Patches**. Repository slug:
`DigitalPals/johns-morphe-patches` (GitHub repository names cannot contain spaces
or apostrophes). This name is independent of the Morphe project's authorship.

## Current state

The public `DigitalPals/johns-morphe-patches` repository was created from the
official template on 6 October 2026, including `main` and `dev`. The prepared
NLZIET source is being imported through a feature pull request to `dev`.
No release has been published yet. A locally compiled `.mpp` is not an
auto-updating remote Morphe source.

Repository creation and read access were verified through Whombat's GitHub
connection. Repository settings remain person-owned. The Actions setting
**Allow GitHub Actions to create and approve pull requests** was still off
at import time; the owner needs to enable it before the automatic release PR.
Do not put tokens in chat or the repository.

GitHub initialized `main` and `dev` as separate root commits with identical
template trees. The import branch joins both histories without changing the
template release files. Merge the import PR with **Create a merge commit**,
not squash or rebase, so subsequent `dev` → `main` release PRs have a common
ancestor. Whombat's merge wrapper currently squashes and ignores merge-method
flags; use GitHub's merge-commit option for this PR and stable-release PRs.

## One-time setup

1. Use the [official template](https://github.com/new?template_owner=MorpheApp&template_name=morphe-patches-template&owner=DigitalPals&name=johns-morphe-patches),
   choose the `DigitalPals` owner, `johns-morphe-patches` name, **Public** visibility
   and **Include all branches**. Keep both `main` and `dev`.
2. In **Settings → Actions → General**, enable Actions and
   **Allow GitHub Actions to create and approve pull requests**. Organization
   policy may prevent this; that requires the organization's administrator.
3. Give Whombat's GitHub connection access to the new repository and enable it
   for agents in **Whombat Settings → Connections → GitHub**.
4. Import the prepared project through a feature branch/PR targeting `dev`.
   Preserve the template's `.github/workflows/release.yml`, `.releaserc`,
   `package.json`, lockfile and release history. Do not import APKs, APKMs,
   signing keys, tool caches or build output into Git.
5. Review and merge the feature PR. Use a `feat:` commit to introduce the patch
   so semantic-release publishes a prerelease. After its checks and review,
   merge `dev` into `main` using a **merge commit, not squash or rebase**,
   as specified by the official template, to publish a stable release.

The code, Gradle metadata and fallback build use the verified owner
and slug above. If a different owner is chosen, update the source URLs in
`README.md`, `patches/build.gradle.kts`, `scripts/build-public.sh`, this document
and the issue templates before building/publishing.

## Release mechanics

Keep the official semantic-release workflow rather than manually creating a
release or uploading assets. It builds the bundle, generates `patches-list.json`
and `patches-bundle.json`, updates the README between the patch-list markers,
updates the changelog/version and publishes the `.mpp` release asset. These
generated files must not be hand-edited or hand-committed.

- `feat:` and `fix:` commits trigger releases on `dev`/`main`.
- `chore:` commits alone do not publish a release.
- `dev` releases are prereleases; `main` releases are stable.
- A successful Release job on another branch verifies compilation; it does
  **not** prove that a release or usable remote source was published.
- CI uses its automatically issued `GITHUB_TOKEN` for GitHub Packages; no
  personal token belongs in the repository. The public fallback in README is
  for local builds, not a replacement release workflow.

The runtime tests can be run locally using the README's commands before
publishing. Preserve the experimental target until detailed real-device
acceptance is recorded; a successful use report does not cover every DRM,
casting or vendor-specific lifecycle scenario.

## Verify before sharing

1. Read the release workflow logs: semantic-release must report a published
   release, not merely a successful compilation step. Inspect the release tag
   and its downloadable `patches-<version>.mpp` asset.
2. Fetch `patches-bundle.json` and `patches-list.json` from the published branch
   without GitHub authentication. The bundle version and public download URL
   must match the published release, and the list must contain the NLZIET PiP
   patch with only `nl.nlziet` 5.15.3 / arm64-v8a code 740503, minimum SDK 29.
3. Download the advertised bundle, inspect its manifest and load it with
   official Morphe Desktop. Confirm the project's display name, exact patch
   compatibility and embedded `extensions/extension.mpe` runtime.
4. Add the repository in Morphe Manager and confirm that it loads the source
   and patch. Do not describe source import as tested until this has been seen.
5. Share the one-tap source link only after these checks pass:
   `https://morphe.software/add-source?github=DigitalPals/johns-morphe-patches`.

## References

- [Official template and branch/release rules](https://github.com/MorpheApp/morphe-patches-template)
- [Official Morphe patch-source documentation](https://github.com/MorpheApp/morphe-manager/blob/main/docs/patch-sources.md)
