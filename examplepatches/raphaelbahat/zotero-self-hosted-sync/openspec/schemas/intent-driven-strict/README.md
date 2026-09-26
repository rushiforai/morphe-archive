# Intent-Driven Strict OpenSpec Schema

`intent-driven-strict` is a fork of the `intent-driven` proposal-to-tasks
workflow for changes where contributor intent, observable behaviour, technical
design, and durable architectural decisions should all be captured before
implementation — with a hard **validation gate** that verifies the implementation
tasks against live framework/library/tool documentation before apply may
proceed.

It keeps specs mergeable by default OpenSpec archive by generating
`specs/<capability>/spec.md` files. The Markdown headings are the OpenSpec
wrapper; the content inside each requirement and scenario should be written in
Gherkin style with `GIVEN`, `WHEN`, and `THEN` steps.

- Good fit: product or platform changes with meaningful behaviour and
  long-lived design decisions, cross-module work, or architecture choices that
  future changes should honor.
- Not a good fit: small tactical fixes, docs-only changes, dependency bumps, or
  behaviour-only work where `behaviour-driven` is enough.

## Activate

Set this in `openspec/config.yaml`:

```yaml
schema: intent-driven-strict
```

## Stage Gates

Artifact order:

```text
proposal -> specs -> design -> adr -> tasks -> validate
```

Gate expectations:

- `proposal` states why the change matters and lists the capabilities that need
  behaviour specs.
- `specs` creates one OpenSpec Markdown delta file per capability at
  `specs/<capability>/spec.md`.
- `design` explains the implementation approach and accounts for currently
  in-force ADRs.
- `adr` writes the per-change ADR review manifest at
  `openspec/changes/<change>/adr.md` after design and before task planning.
  Durable repository-level ADR files are created only when the change
  introduces a major architectural decision that should persist beyond the
  change.
- `tasks` are planned only after proposal, specs, design, and ADR artifacts are
  complete.
- `validate` is a HARD GATE between tasks and apply. It validates every task
  against live framework/library/tool documentation and emits a machine-readable
  `VERDICT: READY` (apply may proceed) or `VERDICT: NEEDS_FIX` (apply is
  blocked) line in `validate.md`. See [Validation Gate](#validation-gate).

## Spec Format

Use OpenSpec Markdown delta headers so archive can merge the change:

```md
## ADDED Requirements

### Requirement: User data export
Feature: User data export

Rule: Users can export their own data

#### Scenario: Successful CSV export
- **GIVEN** a user has saved data
- **WHEN** the user exports their data as CSV
- **THEN** the system provides a CSV file containing the user's data
```

Do not create `.feature` files for this schema. External Gherkin linting can be
run by the target project, but the schema package intentionally does not include
Gherkin lint configuration.

## ADR Persistence

The `adr` artifact completion signal is the change-local review manifest at
`openspec/changes/<change>/adr.md`. Existing files under the repository-level
`adr/` folder are context for a new change; they are not completion evidence
for that change.

Durable ADR files are generated under the target repository's top-level `adr/`
folder only when the change introduces a major architectural decision that
should persist beyond the change. They are not written inside the OpenSpec
change folder. Accepted ADRs are immutable. If a future decision changes a
prior ADR, create a new ADR that supersedes the old one and leave the original
file unchanged.

## Validation Gate

The `validate` artifact is a HARD GATE between `tasks` and `apply`. It is
produced only after the tasks are planned and emits a single machine-readable
verdict line that `apply` reads before starting:

- **`VERDICT: READY`** — every task was checked against live documentation and
  found valid; apply may proceed.
- **`VERDICT: NEEDS_FIX`** — at least one task references an invalid API,
  configuration, or usage; apply is blocked until the task (and any related
  artifact that repeats the same invalid detail) is revised and re-validated.

Validation process:

1. **Group tasks by technology** — one group per framework/library/tool surface
   (web framework, database driver/ORM, test ecosystem, observability SDKs,
   CI/Docker).
2. **Deploy one validator per group** — a read-only sub-agent per group in
   parallel, falling back to in-session validation in the main agent if
   sub-agent deployment is unavailable or fails.
3. **Consult live documentation in order** — Context7, then jina or exa, then a
   native web fetch tool (e.g., WebFetch). Official docs beat third-party
   blogs; every verdict cites a source URL.
4. **Consolidate findings** into `validate.md`, including cross-cutting fixes
   (a single invalid reference often appears across tasks, specs, and design).
5. **Emit the verdict** — the canonical `VERDICT:` line is the source of truth
   enforcement tooling reads.
6. **Prompt for revision approval** — if `NEEDS_FIX`, revisions require user
   approval before any file is edited; after editing, the change must still
   pass `openspec validate --strict`.

The verdict is tied to the exact `tasks.md` contents that were validated. If
`tasks.md` changes after the verdict is issued (other than applying the approved
revisions), the verdict is VOID and validation must be re-run.

## Validate

```bash
openspec schema validate intent-driven-strict
```

For more schemas, refer to https://github.com/intent-driven-dev/openspec-schemas.
