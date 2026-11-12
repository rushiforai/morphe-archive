# AGENTS.md — Vogelkop harness protocol

For any AI-agent session working in the Vogelkop sandbox (`/home/z/my-project`)
or in this repository. Humans: see [README.md](README.md).

## The problem this solves

The sandbox is recycled between sessions — twice already during v1.3.x it
destroyed the toolchain, keystores and uncommitted rungs (see root
`STATE.md`). Only `/home/z/my-project` persists; processes never do. This
harness keeps, on GitHub: (a) a filtered mirror of the sandbox, (b)
structured agent memory, (c) big binaries in the `sandbox-storage`
prerelease — updated as the last step of every execution plan.

## Canonical paths

- Sandbox root: `/home/z/my-project` (only persistent location)
- Repo clone: `/home/z/my-project/.harness/vogelkop` (excluded from the mirror)
- Mirror: `harness/backup/sandbox/` (rsync of the sandbox, filtered)
- Token: `/home/z/my-project/.vault/github.token` (chmod 600; never print or commit)
- Big binaries: GitHub prerelease `sandbox-storage` (`bin/storage_upload.py`)

## Session start

1. If `/home/z/my-project/.harness/vogelkop` is missing → bootstrap per
   `harness/README.md` "Fresh sandbox" (token must be at `.vault/github.token`
   or uploaded as `Vogelkop access key.txt`).
2. `git -C /home/z/my-project/.harness/vogelkop pull --rebase --autostash origin HEAD`
3. Read, in order: `harness/memory/MEMORY.md` → `harness/state/NEXT_SESSION.md`
   → root `STATE.md` (project ladder state).
4. Glance at `harness/state/LATEST.md` to see how fresh the last backup is.

## During the session

- Project work happens IN THE CLONE, as before (edit, build, verify).
- Durable insight → `memory/knowledge/` or `memory/procedures/lessons.md`.
- Significant design choice → `memory/decisions/NNNN-*.md` (next free number).
- Big artifact that must survive → `bin/storage_upload.py FILE`.
- NEVER hand-edit `harness/backup/sandbox/**` (rsync-managed).
- NEVER write secrets into the clone — the backup secret guard aborts the
  push on known token values, and the repo is public.

## End of every prompt — MANDATORY final step

EVERY execution plan ends with a backup: the reply to a prompt is sent
only after `harness/bin/backup.sh` has run. No exceptions for trivial
turns — the script is a cheap no-op when nothing changed.

1. Commit your project work with a descriptive message (as before).
2. If state or open threads changed, update `harness/state/NEXT_SESSION.md`.
3. `bash harness/bin/backup.sh` — pushes memory + mirror + anything pending.
4. Only once it returns (pushed, or "clean — nothing to back up") send the
   reply. A FAILED backup (auth error, oversize file, secret guard) must be
   reported to the user in the reply, never skipped silently.

At rung boundaries additionally: create the episode via
`harness/bin/session-log.sh "rung title"` and fill it in (facts and
outcomes, not prose) BEFORE the backup, so it is included in the push.

## No scheduled backups (ADR 0004)

There is deliberately NO fixed-interval backup job. Backups are purely
event-driven — tied to the end of every execution plan (see above). The
former 8-hour platform cron job ("Vogelkop sandbox backup") was removed
on 2026-11-12 by owner decision; see `memory/decisions/0004`. If the
sandbox is recycled mid-prompt, the loss window is bounded by the
previous prompt's backup.

## Token lifecycle

The PAT is fine-grained, scoped to this repo (Contents: Read & Write), and
follows the project's ~7-day expiry convention. When pushes fail with auth
errors: ask the user to re-issue it and upload the new key as
`Vogelkop access key.txt` — `backup.sh` auto-imports it into the vault and
retries. Never print the token; never put it in a URL that gets stored.

## Public-repo rules

This repository is PUBLIC. The mirror therefore excludes `upload/` (user
APKs, pasted screenshots, tokens), `skills/` (agent-platform internals) and
all binaries/secrets. Do not relax these filters without an explicit owner
decision — see `memory/decisions/0002`.
