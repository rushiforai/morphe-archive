# EE Morphe Patches

Custom Morphe patch bundle maintained at:
`https://gitlab.com/early.egg3707/ee-morphe-patches`

## Add source in Morphe

Use the bundle JSON URL, not the repository homepage URL.

- Stable (`main`): `https://gitlab.com/early.egg3707/ee-morphe-patches/-/raw/main/patches-bundle.json`
- Pre-release (`dev`): `https://gitlab.com/early.egg3707/ee-morphe-patches/-/raw/dev/patches-bundle.json`

If you enter only `https://gitlab.com/early.egg3707/ee-morphe-patches`, some Morphe versions may fail to resolve it as a bundle source.

## Authentication requirements

Morphe patch builds still resolve core dependencies from Morphe's GitHub Packages registry.
This follows Morphe's setup guide:
`https://github.com/MorpheApp/morphe-documentation/blob/main/docs/morphe-development/1_setup.md`

For local development/builds, set credentials in `~/.gradle/gradle.properties`:

```properties
gpr.user = <github-username>
gpr.key = <github-pat-with-read-packages>
```

Equivalent environment variable fallback is also supported:

- `GITHUB_ACTOR`
- `GITHUB_TOKEN`

Do not store tokens in this repository.

## Release flow

This repository follows the Morphe template release model (semantic-release + generated `patches-bundle.json`) and publishes `.mpp`/`.mpp.asc` assets on GitLab releases.

Required GitLab CI/CD variables:

- `GL_TOKEN` (or `GITLAB_TOKEN`) with GitLab `api` scope (and `write_repository` if used for Git auth/push)
- `GITHUB_ACTOR` (GitHub username)
- `GITHUB_TOKEN` (GitHub PAT with `read:packages`)

Token behavior for `GL_TOKEN`/`GITLAB_TOKEN` follows `@semantic-release/gitlab`:
`https://github.com/semantic-release/gitlab#configuration`

Without published GitLab release assets, Morphe cannot download the `.mpp` referenced by `patches-bundle.json`.

## Production checklist

- Add the three CI variables above in GitLab project settings.
- Protect/mask token variables.
- Push commits to `dev` or `main` to trigger release automation.
- Confirm each release contains `patches-<version>.mpp` and `patches-<version>.mpp.asc` assets.

## Template reference

Original template: `https://github.com/MorpheApp/morphe-patches-template`
