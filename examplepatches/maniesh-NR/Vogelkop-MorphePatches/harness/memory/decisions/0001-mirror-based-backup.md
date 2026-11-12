# ADR 0001 — mirror-based backup inside the repo clone

Date: 2026-11-12 · Status: accepted

## Context

Frequent sandbox backups must land in a *section* of the existing
Vogelkop-MorphePatches repo, whose other content (patches, docs, releases)
must stay intact. The sandbox root is already a local-only git repo with no
remote; a git repo cannot be pushed into a subdirectory of another repo.

## Decision

Keep a full clone at `<sandbox>/.harness/vogelkop` and rsync the sandbox into
`harness/backup/sandbox/` inside it — filtered (`--delete
--delete-excluded`, `--max-size=95m`). `backup.sh` then stages the WHOLE
clone (uncommitted project work included), commits only when something
changed, and pushes with rebase-retry. `.harness` is excluded from its own
mirror, so there is no recursion.

## Consequences

+ One repo, one history: the git log doubles as the backup log, and project
  commits interleave naturally with auto-snapshots.
+ Uncommitted rung work left behind by a crashed session is swept up by the
  scheduled job instead of being lost.
- Two copies of mirrored files on disk (the mirror is small by design).
- A concurrently editing session can be snapshotted mid-edit; acceptable for
  a crash-safety backstop — it is a backup, not a release.
