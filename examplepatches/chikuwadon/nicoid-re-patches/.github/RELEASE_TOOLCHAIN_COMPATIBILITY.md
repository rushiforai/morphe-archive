# Release toolchain compatibility notes — 2026-11-16

Scope: **build and GitHub Release tooling only**, no Android application logic or settings changes.

## Updated and verified

- Update `conventional-changelog-conventionalcommits` from 9.3.1 to **10.4.1**.
- The v10 preset expects the current `conventional-changelog-writer` **9.3.0**. The stable `@semantic-release/release-notes-generator` 14.1.1 still uses writer 8 and cannot correctly render v10 release notes; beta v15 is not suitable for a stable-only toolchain. Therefore the project's existing optional fallback notes generator uses the v10 preset and stable v9 writer directly.
- Convert the preset's obsolete `hidden` flags to `effect`. Preserve the manually reviewed release-note files in `.github/release-notes/` as the normal release path and the existing Morphe-compatible heading format.
- Pin `@MorpheApp/changelog` to the current stable `bundle` commit `f3d88b22e0276c44e76907bed292f3cdd96873f9`. The upstream plugin is now ESM-only; release pipeline integration through semantic-release's plugin loader remains supported.
- Preserve the existing `releaseJson` options, download URL and empty signature template.
- Regenerate `package-lock.json` with Node 26 / npm 11, install using `npm ci --ignore-scripts`, and retain the stub that disables npm registry publishing.
- Add a reusable **no-publish** regression smoke test: ESM import, formatted Features/Bug Fixes/Improvements notes, hidden maintenance commits, Morphe release JSON and download URL in a temporary directory. Run it in development, main and release preflight workflows.

## Remaining restriction: semantic-release 26

The stable npm distribution now has `semantic-release@26.0.1` (requires Node >=26.13), while this project uses `gradle-semantic-release-plugin@1.10.3`, whose latest published stable package declares peer `semantic-release: ^24 || ^25`. npm rejects the combination with `ERESOLVE`, even though CI Node 26.13.1 meets the runtime requirement.

**Do not** suppress npm peer checks with `--force`, `--legacy-peer-deps`, or a global npm configuration. Retain **semantic-release@25.0.9** until upstream publishes a compatible stable Gradle plugin or a separately verified, minimally scoped replacement is ready. A dry-run import is not equivalent to testing the full publishing process.

## Safety

- No automatic release, tag, Issue updates, branch history rewrite or published Release changes.
- Keep existing `.releaserc` approval gates, branch configuration, and release asset policies.
- Only merge these changes into `dev` after the no-publish tests and CI pass.
