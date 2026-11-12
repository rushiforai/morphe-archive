# MEMORY.md — Vogelkop core memory

Read this FIRST in every session. Keep it short; details live in linked files.

## What this is

Persistent memory + backup harness for the AI-agent sandbox that develops
this repository's Opera de-ads patches. Stored in the `harness/` section of
`maniesh-NR/Vogelkop-MorphePatches`.

- Sandbox (only persistent location): `/home/z/my-project`
- Local clone of this repo: `/home/z/my-project/.harness/vogelkop`
- Sandbox backup mirror: `harness/backup/sandbox/` (rsync of the sandbox, filtered)
- GitHub token: `/home/z/my-project/.vault/github.token` (chmod 600; never commit, never print)

## Standing directives

1. Secrets are never printed, committed or echoed. The backup secret guard
   aborts a push if a known token string appears anywhere in the clone.
2. EVERY execution plan ends with `bin/backup.sh` as its FINAL step — send
   the reply only after it returns (no-op when clean; ADR 0004). At rung
   boundaries also write an episode in `memory/episodes/` and update
   `state/NEXT_SESSION.md` before the backup.
3. Do not hand-edit `backup/sandbox/**` — it is rsync-managed.
4. The sandbox is recycled between sessions; anything outside
   `/home/z/my-project` (and every running process) is ephemeral.
5. This repo is public — never put user-specific or secret material in it.

## Memory map

| Path | Holds |
|---|---|
| `identity.md` | owner, environment, canonical paths |
| `knowledge/environment.md` | verified sandbox facts (tools, quirks, layout) |
| `knowledge/project-morphe.md` | project context, state, user-confirmed requirements |
| `episodes/*.md` | one file per session (append-only log) |
| `decisions/*.md` | architecture decision records |
| `procedures/lessons.md` | gotchas and lessons learned |
| `../state/NEXT_SESSION.md` | working memory / handoff (read every session) |
| `../state/LATEST.md` | last backup manifest |
| `../state/MANIFEST.txt` | whole-sandbox file listing (paths + sizes) |

## Current focus

See `../state/NEXT_SESSION.md`.
