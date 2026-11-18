# Release process

Status: `v0.1.0` was published from a local build; `v0.1.1` was the first release
produced by the automated workflow; `v0.1.2` is the first signed release built by
`buildAndroid` for Morphe Manager; `v0.1.3` is the first release that carries a
second application; `v0.1.4` completes the behaviours of that application;
`v0.1.5` carries the corrected password and account-limit behaviours and the
cash connection change; `v0.1.6` adds the account check of the login
repository. The sections below distinguish what has been exercised from what is
still intended.

## Published so far

| Version | Date | Status | Asset |
|---|---|---|---|
| 0.1.0 | 2026-11-09 | pre-release, published manually, Desktop-only | `Kero309x-Patches-0.1.0.mpp` |
| 0.1.1 | 2026-11-09 | pre-release, published by the release workflow, Desktop-only | `Kero309x-Patches-0.1.1.mpp` |
| 0.1.2 | 2026-11-09 | pre-release, published by the release workflow, signed, Manager-ready | `Kero309x-Patches-0.1.2.mpp` |
| 0.1.3 | 2026-11-10 | pre-release, published by the release workflow, signed, Manager-ready, two applications | `Kero309x-Patches-0.1.3.mpp` |
| 0.1.4 | 2026-11-11 | pre-release, published by the release workflow, signed, Manager-ready, two applications | `Kero309x-Patches-0.1.4.mpp` |
| 0.1.5 | 2026-11-11 | pre-release, published by the release workflow, signed, Manager-ready, two applications | `Kero309x-Patches-0.1.5.mpp` |
| 0.1.6 | 2026-11-12 | pre-release, published by the release workflow, signed, Manager-ready, two applications | `Kero309x-Patches-0.1.6.mpp` |

Each bundle is built from the tagged commit.

- `0.1.0` — `BD74E5B95BADD671DB0C4678D874EE7456750A688FCB0849FEFACFD4F102B644`
- `0.1.1` — `849971EF03A28F5767DCCE5FCBC6428D5D64626C6309615D486554377CED9FE4`
- `0.1.2` — `47B177D75EF06CA5E34497B8005DB0415B57A10C9A5C41B7F049C127BE6FEDFD`
- `0.1.3` — `1BA60367F99AD3D68C0FBC7700C37EE47B057F09F47897CC8BB026DAA3BE2B00`
- `0.1.4` - `751FDE19FB9E1079A0D564B1C9510C0671E0A095BB929B204FC253661EE9BBD7`
- `0.1.5` - `CF95C866694AD06B6273953A6F99F300357CF8FCBCAEBE4D936DE8D77CA965AF`
- `0.1.6` - `15D60BCA6963F7A190A6254514EB5AE2F413A84AEBB7F0447FBC8C24904E4942`

The same hash is repeated in the release notes.

## Versioning

The bundle version lives in `gradle.properties` as `version`. A release is a tag
of the form `v<version>` on `main`. The version is bumped in its own commit
before the release commit, so the tag and the manifest always agree. The index
file is regenerated in that same commit: it carries the version, so a bump that
left it behind would make the build report a stale index.

## What a release publishes

- `Kero309x-Patches-<version>.mpp` — the patch bundle, built by `buildAndroid`
  at `patches/build/libs/patches-<version>.mpp` and renamed when it is attached to
  the release. `buildAndroid` adds `classes.dex`, which Morphe Manager needs; the
  plain `build` output has no DEX and only serves Morphe Desktop.
- Release notes on the tag page. They summarise the change and the verification
  status; they do not replace the behaviour specs.

The framework plugin writes `META-INF/MANIFEST.MF` inside the bundle from the
`patches` block in `patches/build.gradle.kts`. The `.mpp` is a build artefact and
is never edited by hand.

`patches-bundle.json` at the repository root is the patch source metadata that
Morphe Manager reads from `main`. The release workflow rewrites it after each
release with the version, the release time, the published notes, the asset URL
and an empty signature URL. `public_key` is added only when the build was signed.
It is generated, not edited by hand.

The `description` is a copy of the release notes taken at publish time, so notes
rewritten afterwards do not reach the manager until the next release. `0.1.2` and
`0.1.3` are the two cases where the field was synced by hand, in a dedicated
commit, after its notes were replaced.

`patches-list.json` at the repository root is the file third-party indexes read.
The manager never reads it. `buildAndroid` regenerates it from `Catalogue` through
the `generatePatchesList` task, so the index tables list exactly the patches the
bundle ships: name, description, default state, category, target package, accepted
signatures, versions and minimum SDK. The release workflow commits it next to
`patches-bundle.json`, and the build workflow fails when the committed copy is
stale. It is generated, not edited by hand; changing the catalogue and running
`./gradlew generatePatchesList` is the only supported edit.

## Signing

Signing lets the manager refuse a release that was altered after publication.

The bundle is signed with an Ed25519 key. The signature is appended inside the
`.mpp` itself, in the `MorpheSig1` trailer after the zip end record, so a release
publishes no separate signature file. `patches-bundle.json` carries the matching
`public_key` instead.

Current state:

- The key pair was generated on 2026-11-09. `morphe-signing.pub` is committed;
  `morphe-signing.key` is ignored by `.gitignore` and stays on the maintainer's
  machine.
- `MORPHE_SIGNING_KEY` holds the private key, so `0.1.2` is signed. The release
  workflow only writes `public_key` into the metadata when that secret is present,
  so an unsigned build is never described as signed.
- `0.1.2` is the first release built by `buildAndroid`, so it carries
  `classes.dex` and works with Morphe Manager. Releases `0.1.0` and `0.1.1` were
  built by `build`, carry no DEX, and are Desktop-only.
- Every `0.1.2` artefact was checked after publication: 112 entries,
  `classes.dex` of 99,480 bytes, a `MorpheSig1` trailer whose public key equals
  `morphe-signing.pub`, and a SHA-256 that matches the release notes.
- The private key must be backed up offline. Losing it means every future release
  is rejected by clients that already trust the old key; generating a new pair
  means every client must re-add the source.

The steps, for the record:

1. `./gradlew :patches:generateSigningKey --no-configuration-cache` produces
   `morphe-signing.key` and `morphe-signing.pub`. The task captures the project,
   so it fails when the configuration cache is on.
2. `morphe-signing.pub` is committed. The private key never is.
3. The Base64 contents of `morphe-signing.key` are stored as the repository
   secret `MORPHE_SIGNING_KEY`. No Dependabot secret is needed; only the release
   workflow signs.
4. `buildAndroid` reads the secret and appends the signature. Without the secret
   the build still succeeds and the bundle is unsigned.

## Workflow rules

- The release workflow runs on `main` only, plus manual dispatch.
- It does nothing when the tag already exists, so a documentation push cannot
  produce a duplicate release.
- `permissions` is `contents: write` and nothing else.
- `concurrency` prevents two releases at once.
- Versions starting with `0.` are published as pre-releases.
- No scheduled runs, no polling, no workflow chaining.

## Registry access

The framework Gradle plugin is published to GitHub Packages and needs an
authenticated read. Repository secrets are not shared with other repositories, so
a personal access token with `read:packages` must be stored as
`MORPHE_REGISTRY_TOKEN`. It must be read-only and scoped as narrowly as GitHub
allows. The same name must also exist in the Dependabot secret store, because
Dependabot-triggered runs cannot read repository secrets.

Both workflows check the secret before they configure Gradle, and fail with an
explicit message when it is empty instead of the plugin-resolution error a missing
credential otherwise produces. A local build uses the credentials in the
maintainer's Gradle properties instead.

## Rollback

A bad release is marked as a draft or pre-release rather than deleted, so that
clients which already downloaded it can be told what happened. Deleting a tag is
a last resort and requires a decision recorded in `docs/decisions/`.
