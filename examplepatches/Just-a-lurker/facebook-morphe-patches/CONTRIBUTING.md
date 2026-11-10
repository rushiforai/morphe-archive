# Contributing

Commit and publishing conventions for facebook-morphe-patches. They come from the Morphe
patches template and this repository's release setup (`.releaserc`, `release.yml`).

## Development setup

1. [Set up](https://github.com/MorpheApp/morphe-documentation/blob/main/docs/morphe-development/README.md)
   your development environment.
2. Gradle resolves the Morphe plugin from GitHub Packages. Create a **classic PAT with the
   `read:packages` scope**, then put it in the **Gradle user home**, not this repository:

   ```properties
   # C:\Users\hoang\.gradle\gradle.properties  (or ~/.gradle/gradle.properties)
   gpr.user=<your GitHub username>
   gpr.key=<your PAT>
   ```

   Or set `GITHUB_ACTOR` / `GITHUB_TOKEN` for the shell. The project's tracked
   `gradle.properties` holds only `version`; never put credentials there. The `gh` CLI OAuth
   token does not have Packages access for the Morphe registry.
3. In the repo: **Settings → Actions → General → Workflow permissions**, allow GitHub Actions
   to create and approve pull requests. The `Open a PR to main` workflow needs it.
4. Push-triggered workflows must be enabled. If a push does not create a run, check
   Settings → Actions before suspecting the workflow file.

## Building and validating

- `./gradlew buildAndroid` (`gradlew.bat buildAndroid` on Windows) builds the bundle to
  `patches/build/libs/patches-*.mpp`.
- Apply the bundle to the **full Android 11+ `.apkm`**, not a single `base.apk`; the ad
  patches need the merged split dexes. Morphe Desktop's CLI `--validate` checks that every
  fingerprint matches exactly one method; applying the bundle to the target APK is the real test.
- `./gradlew generatePatchesList` regenerates `patches-list.json`. The release runs this;
  never commit the result by hand.

## Commit convention

Always use [semantic commit](https://kapeli.com/cheat_sheets/Semantic_Commits.docset/Contents/Resources/Documents/index)
messages. To keep it simple, use only 3 commit message types:

- `feat: Added a new feature` — creates a minor release.
- `fix: Some problem now fixed` — creates a patch release. (`perf:` and `bump:` also make
  patch releases.)
- `chore: Random change you do not want in the user facing changelog` — creates no release.

`docs:` also creates no release. Commits of `feat:` and `fix:` on `dev` automatically
generate new pre-releases; users can apply them by enabling `pre-release` in Morphe Manager
patch sources.

## Publishing / release convention

- Make all changes on the `dev` branch. When `dev` is ready for a stable release, merge `dev`
  into `main` — a plain merge only, never squash.
- **Always use semantic release (`release.yml`).** Never create or upload releases by hand:
  release.yml updates `patches-list.json`, `patches-bundle.json`, `CHANGELOG.md`, the version
  in `gradle.properties`, and the README patch list between `PATCHES_START` / `PATCHES_END`.
- Never hand-edit or manually commit any of those generated files.
- Do not force-push semantic-release commits; that breaks all future releases. If a release is
  broken, cut a new release instead of rewriting the old one.
- Never commit `morphe-signing.key` (git-ignored).
- If release behavior has to change, edit the existing `release.yml` / `.releaserc`. Do not
  write new release scripts from scratch.

## Signing releases

Signing is already set up for this repository:

- `morphe-signing.pub` is committed and published in `patches-bundle.json`.
- `MORPHE_SIGNING_KEY` holds the private key as a repository secret.
- Every release is signed, dev prereleases included.

Do not regenerate the key unless it is lost or leaked. To rotate it: run
`./gradlew generateSigningKey`, commit the new `morphe-signing.pub`, replace the
`MORPHE_SIGNING_KEY` secret, then tell users the key changed. Morphe Manager remembers the
first key and asks before accepting the new one.

## Community index

The bundle can be listed at `https://morphe-patches.software/?app=com.facebook.katana` by
submitting the repository through the site's **Submit a bundle** form. The index is curated;
it checks `patches-list.json` on `main` and adds the entry after review. Listing is optional:
the repo works as a Morphe source without it.

## Naming

Keep the project name free of any implication of authorship by the Morphe open source project.
If unsure, name the patches after yourself. See the [NOTICE](NOTICE) for details.
