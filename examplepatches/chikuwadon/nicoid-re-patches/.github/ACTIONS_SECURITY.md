# GitHub Actions security audit — 2026-11-09

Scope: four workflows, `.releaserc`, Dependabot, and the release lifecycle.
This is CI/infrastructure maintenance only; it does not alter app functionality,
build version, MPP payload, historical tags, or published releases.

## Applied controls

- Audit the latest signed upstream GitHub Action releases; pin all action uses
  to their full 40-character upstream commit SHAs with human-readable versions.
  Keep Dependabot Github Actions updates enabled weekly against `dev`.
- Upgrade `actions/upload-artifact` from Node.js 20-based v4 to Node.js
  24-based v7.0.2; retain two-day retention, fail-on-missing behavior,
  and the original MPP/source archive names and paths.
- Use `actions/checkout` v7.0.1, `setup-java` v6.2.0,
  `setup-node` v7.1.0, and `attest-build-provenance` v4.2.2.
  Hosted runners satisfy the Node.js 24 runtime requirement.
- Disable persisted checkout credentials in read-only jobs; keep them only
  when a separate authorized job must push a release or sync a branch.
- Remove unnecessary Issue write permission from Release; prevent
  semantic-release from creating comments, issues, or released-label changes.
- Disable unneeded npm caching in the privileged release job and install
  lockfile-pinned npm dependencies with lifecycle scripts disabled.
  Pin release-tool Node.js to supported LTS 24 rather than a moving alias.
- Replace the same-process semantic-release backmerge with a separate,
  clean-runner, fast-forward-only sync job. A divergent or protected `dev`
  is left untouched and warned about, never force-pushed or rebased.
- Make release runs mutually exclusive, cancel obsolete development CI runs,
  and cap all job durations. Retain explicit manual APPROVE/UPDATE protections.
- Add a static CI guard that refuses mutable Action tags, accidental
  automatic release triggers, unsafe branch writes and missing approval gates.

## Deliberately retained and future work

- Stable v1.10.5 must not be re-released. Validate new Release changes using
  a read-only release CLI smoke test first; full publication verification
  requires a separately approved future version.
- GitHub's new workflow dependency lockfiles are stronger than direct SHA
  pinning because they also lock transitive dependencies. Migration requires
  generating/reviewing `.github/workflows/actions.lock` with
  `gh actions-lock` and verifying repository policy/runner support.
- Repository administrators should enable required reviews/branch rules for
  `main`, restrict who can run manual release workflows, require signed
  commits where appropriate, and enable Dependabot alerts and secret scanning.
  These account-level settings are not changed by this audit.
- npm 11.21.2 now contains undici 6.29.1 (Issue #110). The temporary\n  bundled dependency replacement is no longer required. This is checked in\n  the private build's release-tooling smoke test and main's npm audit.\n- The release job currently needs write access to publish via semantic-release
  and the Gradle publishing plugin. For stronger isolation, a future
  multi-job artifact-promotion design could separate unprivileged build work
  from the minimal-privilege publishing job. Avoid rewriting this complex
  publication path without release approval and end-to-end testing.

## Workflow dependency lockfiles (2026-11-09)

- Onboard all four production workflows using GitHub's official
  `gh-actions-lock` extension **v0.4.1**, generated with `--no-narrow`
  to preserve existing 40-character SHA-pinned Action references.
- `.github/workflows/actions.lock` records immutable commits, repository
  IDs and transitive dependencies, including `actions/attest` used by the
  provenance attestation Action.
- A read-only CI job runs `gh actions-lock --verify` and
  `gh actions-lock --verify-local`. The existing static SHA verifier also
  checks the lockfile covers all declared dependencies.
- Dependabot's weekly Actions update schedule remains unchanged; after any
  workflow `uses:` edits, regenerate with `gh actions-lock` (or
  `gh actions-lock --relock` when intentionally advancing upstream refs).
- A lockfile is not a vulnerability scanner. Audit third-party actions and
  npm/Gradle dependencies separately. Never hand-edit a generated lockfile.
