# Release process

The current publisher is `.github/workflows/release.yml` plus `.releaserc` and locked npm dependencies. Current local configuration validates main/dev/feature pushes; publication is a separate manual workflow_dispatch on main, and the dev→main PR helper is manual on dev. These local guards take effect on GitHub only after their exact revision is delivered. Older remote revisions can still have automatic main publication/dev PR triggers; inspect the actual remote revision before pushing. Source delivery is not permission for publication or PR creation. Current identities and blockers are in [PROJECT-STATE](PROJECT-STATE.md).

## Prepare and publish

1. Review the precise source changes, privacy/compatibility/user docs and pending product issues. Keep historical tags/assets immutable. Do not upload patched YouTube APKs, profiles, credentials, signing keys or raw diagnostics.
2. Validate fixed source with the [canonical entry](DEVELOPMENT.md), then the intended finite official/YouTube compositions and relevant device observation. A compatibility declaration or green unit suite does not prove a physical player or translation completeness.
3. Use semantic commits and preview the version decision. feat requests a minor version; fix/perf/bump request a patch under the current release rules. Do not invent a tag or rename a local 1.5.8 package as a released 1.5.9.
4. After authorization for the concrete changeset and workflow effects, synchronize the intended branches without rewriting history. Source pushes run validation. Publication requires a separately authorized explicit dispatch of Release on main; the publisher rejects a stale main checkout. The PR helper requires a separately authorized manual dispatch on dev.
5. Semantic-release prepare normalizes generated metadata and persists `release-<version>` in gradle.properties, then calls `tools/verify_current.py --mode release --version <next-version>` before git/GitHub publication. It runs both suites, generates metadata/patch list and applies strict package checks. The Gradle publisher subsequently invokes its own build; it must see the same persisted identity. The exec publish hook checks that final package again before the GitHub plugin uploads it. Failure stops publication.
6. The pipeline generates version/CHANGELOG/metadata/README patch table, then publishes patches-<version>.mpp and provenance. The raw MPE is embedded. Do not hand-maintain metadata to bypass this sequence.
7. Verify real CI, final tag/source, downloaded asset SHA and anonymous Manager metadata chain. Record exact delivery and remaining limits in state; local preparation is not remote completion.

Candidate mode accepts explicit local build IDs and checks current public metadata with `--mode published` without regenerating it. Release mode requires exact release identity and rejects local markers. Keep that distinction and the rejection tests.

Review generated release-note drafts as concise user-facing English bullets compared with the previous version. Notes may be corrected editorially after publication without changing the tag/asset; preserve the existing language/style. Version-specific history belongs in CHANGELOG/Releases, not an accumulating README update diary.

## Tool and evidence boundaries

PR/main/dev/codex/fix validation uses the current source and canonical verifier. Candidate files and evidence are under build/maintenance/M1a and validation/runs; failure artifacts include both suites and package checks. `npm ci` reconstructs release dependencies. A locally inspected workflow is not evidence of an executed remote run.

The released 1.5.8 asset remains immutable. Historical publication/CI observations and branch-policy snapshots are available through [history](history/README.md); they do not authorize future actions or certify unchanged remote settings. Public release, source synchronization, phone installation and paid service calls are distinct operations.
