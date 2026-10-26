# Release process

Current accepted local product: **1.5.8 / local-1.5.8-m7b / candidate-02**; public release remains **1.5.7**. [M7b review](maintenance/reviews/M7b-REVIEW.md) accepts the local source, two finite compositions and installation preparation. The [first-round acceptance](maintenance/reviews/M7-FINAL-ACCEPTANCE.md) now includes user-reported manual device checklist success and a matching m7b export, with a bounded user real-provider sample. Hardware metrics, installed signature/APK hash and billing remain unverified; no agent signing/installation, future real API call or publication is authorized. [The device handoff](maintenance/M7b-DEVICE-ACCEPTANCE.md) binds unsigned artifacts, actual package/signature conditions and the user's original on-phone Manager path. Local validation, semantic-release prepare and remote publication remain separate evidence levels.

The existing `.github/workflows/release.yml` and `.releaserc` are the only publisher. This follows the [official template](https://github.com/MorpheApp/morphe-patches-template/blob/main/README.md).

1. Develop on `dev`, preserving release tags and historical product anchors. Use semantic commits; a `feat:` since the latest stable tag requests a minor release, `fix:` requests a patch. Preview the computed version before merging.
2. PR validation builds the **current Java/Kotlin source**, at the version declared in `gradle.properties`. The recovered 1.3.5 Smali snapshot is historical and never substitutes for validating current source.
3. Review both the English and Chinese user docs against the new runtime behavior, compatibility declarations, secret/privacy hygiene and actual build provenance. Build and validate the final addon against the intended official/YouTube inputs. A compatibility listing is not proof of every OEM scene.
4. Merge `dev` into `main` without squashing or rewriting existing history. `release.yml` runs semantic-release, which generates the version, CHANGELOG, bundle metadata and patch list, builds the current Android MPP, and regenerates the README patch table from the final patch list before creating the release commit.
5. Publish `patches-<version>.mpp` and automatic build provenance. Do not upload patched YouTube APKs, private API profiles, signing keys or phone diagnostics. The runtime MPE is already embedded in the MPP.
6. Verify anonymous retrieval of `main/patches-bundle.json`, patch list, changelog and asset; match the downloaded asset SHA-256 to the final CI build. Keep source metadata/version/URL and actual MPP identity coherent.
7. Record tag/source/asset identity and known evidence boundaries in the project state. Do not overwrite published assets; fix mistakes with a new release. Keep backups for local rollback.

Generated `patches-list.json`, `patches-bundle.json`, `CHANGELOG.md` and version changes are produced by the pipeline, not hand-maintained. Keep `main` stable; dev prerelease publishing is optional and must be deliberately enabled rather than creating accidental releases during preparation.

## Current verification and release gates

Use `tools/workspace/verify-full.cmd` after configuring the [development environment](DEVELOPMENT.md), or
`python3 tools/verify_current.py --run-id <unique-id>` with a configured toolchain. Candidate mode
checks both `:translation-core:testDebugUnitTest` and `:extensions:extension:testDebugUnitTest`,
localization, source/provenance and compiled boundaries, independent UI and explicit MPP/MPE
identity. Reports and actual task outcomes are archived under `validation/runs/<unique-id>/`;
the isolated candidate is under `build/maintenance/M1a/<unique-id>/`. See the [maintenance operations guide](maintenance/OPERATIONS.md). The ignored local `.devenv` files are not required.

These are separate contracts:

- Candidate consistency uses the version/build ID of current source and permits local IDs. It
  does not regenerate public metadata. Existing online metadata is checked internally with
  `validate_morphe_metadata.py --mode published`, so a local 1.5.8 can coexist with public 1.5.7.
- Semantic-release prepare calls `tools/verify_current.py --mode release --version <next-version>`
  before the git/GitHub publisher plugins. That entry runs both suites, builds with a process-only
  `-PcaptionBuildId=release-<version>`, generates the patch list at the normal release output path,
  and applies strict source/public-metadata and package checks. Failure stops prepare. The README
  table and final strict checks follow in the same prepare command.
- The strict bundle checker defaults to release mode, including existing `verify_bundle.py
  <version>` callers. It requires the exact release ID and rejects local markers; candidate mode
  must name `--mpp`, `--mpe`, `--version` and `--build-id`. Never relax release mode for a local build.

Validation runs for dev/codex/fix pushes and PRs targeting main/dev. Failure artifacts include
core reports at the evaluated build root and extension reports at `extensions/extension/build/`.
Release workflow also archives prepublication evidence on failure. A local run or configuration
inspection is not evidence that remote GitHub Actions or a real publication ran.

## Community visibility

Maintain a clear README, repository About and relevant topics. The official website links [Morphe Community Patches](https://morphe-patches.software/); it is community-maintained, and no automatic listing is promised. Its Feedback form can be used to ask about adding a source.

[Awesome Morphe](https://github.com/nvbangg/awesome-morphe) has a [Bundle Request](https://github.com/nvbangg/awesome-morphe/issues/new?template=bundle-request.yml) requiring an existing release and compatibility with Morphe. This is an independent directory.

The official community [r/MorpheApp](https://www.reddit.com/r/MorpheApp/) permits discussion subject to its current rules; do not share or link pre-patched APKs. Share the source, instructions and compatibility limits instead. Community inclusion is not official endorsement. Prepare outreach separately and only send it when explicitly authorized.

## Pending GitHub synchronization

The [read-only GitHub plan](maintenance/GITHUB-UPDATE-PLAN.md) records that remote main/dev still point to the 1.5.7 post-release source commit; accepted m7b changes remain local and uncommitted. Feature-branch CI/source synchronization precedes any separately authorized release. A main push can run the publisher and a dev push can open a PR automatically; neither is part of local workspace cleanup. Private snapshots, raw diagnostics, APK inputs, toolchains/caches and validation archives stay off GitHub. See the [workspace map](WORKSPACE.md).
