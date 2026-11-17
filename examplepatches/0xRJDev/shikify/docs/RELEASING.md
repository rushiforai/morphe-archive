# Changes and releases

Shikify has two channels. `dev` holds betas, which Morphe Manager offers when `pre-release` is on for this source. `main` holds the stable version everyone else gets.

## Contributing a change

1. Branch from `dev` and open a pull request into `dev`.
2. Add a line for your change under `# Unreleased` at the top of `changelog.md`, in the list for its app. Create the heading and the app line if they are missing:

   ```markdown
   # Unreleased

   Boost for Reddit:
   - Flair text now sits in the middle of its pill.
   ```

3. Do not change `version` in `gradle.properties`. Versions are set when a release is made, so several changes can go out together.

The build workflow runs on every pull request. It fails if the committed `patches-list.json` differs from the generated one, so rebuild and commit it when you add, rename or remove a patch.

## Releasing a beta

When `dev` has the changes you want to ship:

1. Rename `# Unreleased` in `changelog.md` to the next beta, such as `# Version 1.1.3-dev.1`, and set the same `version` in `gradle.properties`.
2. Build and prepare the assets:

   ```bash
   GITHUB_REPOSITORY=0xRJDev/shikify BOOST_APK=/path/to/original.apk ./build.sh
   python3 tools/prepare-release.py --repository 0xRJDev/shikify
   ```

   The helper checks the bundle, version and changelog entry, writes the bundle, checksum, patch list and release notes into ignored `release/`, and regenerates `patches-bundle.json`.
3. Commit the changelog, `gradle.properties`, `patches-list.json` and `patches-bundle.json` to `dev`.
4. Publish a GitHub **pre-release** for tag `v<version>` targeting `dev`, attach the `.mpp`, `.sha256` and `patches-list.json` from `release/`, and use `release/release-notes.md` as its description. Publish it straight after the commit, because `patches-bundle.json` on `dev` points at that release.

## Releasing stable

When a beta has been tested:

1. Merge `dev` into `main` without squashing.
2. On `main`, set a plain version such as `1.1.3`, and add a `# Version 1.1.3` changelog entry that collects the betas it includes.
3. Build and prepare as above, commit to `main`, and publish a normal GitHub release targeting `main`.

Morphe Manager reads `patches-bundle.json` from `main` for stable users and from `dev` for beta users, so each needs a published release that matches it.

## Builds without an APK

The `Build release artifacts` workflow can also be run by hand. It builds and prepares the same files with read-only permissions and uploads them as an artifact. It has no Boost APK, so it skips applying the patches.
