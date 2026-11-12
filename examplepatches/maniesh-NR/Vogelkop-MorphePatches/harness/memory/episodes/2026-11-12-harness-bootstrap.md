# Episode: harness bootstrap (2026-11-12)

## Context

- Session resumed from a compacted conversation; the prior topic (v1.3.2
  adblock defaults) was preserved into
  `knowledge/project-morphe.md` §"v1.3.2 adblock patch".
- Task: frequent sandbox backups to GitHub + harness-like memory and
  infrastructure in a section of the vogelkop repo.

## What happened

- Vaulted the provided fine-granced PAT (`.vault/github.token`, chmod 600).
  A second, DIFFERENT token file (`upload/github_token.txt`) exists and is
  excluded from all backups (secret guard covers both values).
- Identified the target repo: `maniesh-NR/Vogelkop-MorphePatches` (public;
  token has admin+push). Cloned to `/home/z/my-project/.harness/vogelkop`.
- Studied existing conventions: STATE.md rungs, HANDOFF.md recovery dance,
  `sandbox-storage` prerelease for big binaries, root .gitignore
  binary/secret policy.
- Created the `harness/` section: memory system (core/knowledge/episodes/
  decisions/procedures), `bin/{backup,restore,install,session-log}.sh` +
  `storage_upload.py`, AGENTS.md protocol (harness + root pointer), README.
- Mirror policy tuned for a PUBLIC repo: `upload/`, `skills/`, secrets,
  binaries excluded; `state/MANIFEST.txt` records what exists (names+sizes).
- First backup pushed and verified on GitHub; automated job created (every
  8 h — the platform caps scheduled agent turns at 3/day, so hourly was
  rejected); fresh-sandbox install path tested end-to-end (dry run).

## Outcome / handoff

- Harness live; open threads in `state/NEXT_SESSION.md`.
- The PAT was shared in plain chat this session — rotation suggested when
  convenient; expect expiry per the ~7-day convention.
