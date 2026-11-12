# Vogelkop harness — sandbox backups + agent memory

Infrastructure that stops sandbox recycles from losing work. It lives in the
`harness/` section of the [Vogelkop-MorphePatches](../README.md) repository
and provides:

1. **Frequent sandbox backups** — a filtered mirror of `/home/z/my-project`
   plus any uncommitted project work, pushed to GitHub as the LAST step of
   every execution plan: every prompt response ends with a backup (no
   fixed-interval timer — see `memory/decisions/0004`).
2. **Harness-like memory** — structured, versioned agent memory (core /
   knowledge / episodes / decisions / procedures + a working-memory handoff
   file), so a fresh sandbox can resume exactly where the last one stopped.
3. **Big-binary storage** — APKs, keystores and test builds go to the
   `sandbox-storage` GitHub prerelease via `bin/storage_upload.py`; git and
   this repo stay lean (the repo is public — see `memory/decisions/0002`).

## Layout

```
harness/
├── README.md            you are here
├── AGENTS.md            the protocol every agent session must follow
├── memory/
│   ├── MEMORY.md        core memory — read this first
│   ├── identity.md      owner, environment, canonical paths
│   ├── knowledge/       durable facts (sandbox environment, project context)
│   ├── episodes/        session log — one file per session
│   ├── decisions/       architecture decision records (ADRs)
│   └── procedures/      how-tos & lessons learned
├── backup/sandbox/      rsync mirror of the live sandbox (filtered)
├── state/
│   ├── NEXT_SESSION.md  working memory — the handoff to the next session
│   ├── LATEST.md        manifest of the last successful backup
│   └── MANIFEST.txt     paths+sizes of the whole sandbox at last backup
└── bin/
    ├── backup.sh        sandbox → GitHub (the frequent backup)
    ├── restore.sh       GitHub → sandbox (post-recycle recovery)
    ├── install.sh       first-time setup on a fresh sandbox
    ├── session-log.sh   create an episode file for the current session
    └── storage_upload.py  big binaries → the sandbox-storage prerelease
```

## Fresh sandbox (bootstrap)

The clone and the vault are gone after a recycle. With the
token available (uploaded as `Vogelkop access key.txt`, or already at
`.vault/github.token`):

```bash
# 1. vault the token (skip if .vault/github.token already exists)
mkdir -p /home/z/my-project/.vault
cp "/home/z/my-project/upload/Vogelkop access key.txt" /home/z/my-project/.vault/github.token
chmod 600 /home/z/my-project/.vault/github.token

# 2. askpass helper (no secret inside) + clone
printf '%s\n' '#!/bin/sh' 'case "$1" in' '  *sername*) echo maniesh-NR ;;' \
  '  *) tr -d "[:space:]" < /home/z/my-project/.vault/github.token ;;' 'esac' \
  > /home/z/my-project/.vault/askpass.sh
chmod 700 /home/z/my-project/.vault/askpass.sh
GIT_ASKPASS=/home/z/my-project/.vault/askpass.sh GIT_TERMINAL_PROMPT=0 \
  git clone https://github.com/maniesh-NR/Vogelkop-MorphePatches.git \
  /home/z/my-project/.harness/vogelkop

# 3. finish setup + first backup
bash /home/z/my-project/.harness/vogelkop/harness/bin/install.sh
```

Then restore sandbox files with `bin/restore.sh` if needed and re-download
big binaries from the `sandbox-storage` prerelease. There is no cron job to
re-create — backups run at the end of every execution plan (ADR 0004).

## Everyday use

```bash
bash /home/z/my-project/.harness/vogelkop/harness/bin/backup.sh      # manual backup
bash /home/z/my-project/.harness/vogelkop/harness/bin/restore.sh     # restore files
python3 /home/z/my-project/.harness/vogelkop/harness/bin/storage_upload.py FILE  # big binary
/home/z/my-project/.harness/vogelkop/harness/bin/session-log.sh "rung title"     # new episode
```

## How a backup runs

1. `rsync` the sandbox into `harness/backup/sandbox/` — public-repo filters
   (no `upload/`, no `skills/`, no secrets/binaries/caches; >95 MiB skipped).
2. Regenerate `state/MANIFEST.txt` (paths + sizes of everything, names only).
3. Guards: refuse to push oversize files or any content containing the
   literal token value(s).
4. Commit **only when something changed** (the commit also sweeps up any
   uncommitted project work in the clone), then push — with rebase-retry on
   divergence and automatic re-import of a re-uploaded key on auth failure.

## Backup policy

- **Event-driven, no timers** (ADR 0004): `bin/backup.sh` is the last step
  of every execution plan — every prompt response ends with a backup. It
  is a cheap no-op when nothing changed, so it runs even after trivial
  turns.
- There is no scheduled backup job; the former 8-hour platform cron job
  was removed on 2026-11-12 by owner decision.

## Security

- The GitHub token lives only at `.vault/github.token` (chmod 600) or the
  uploaded key file. Authentication goes through `GIT_ASKPASS`, so remote
  URLs and `.git/config` never contain a secret.
- The mirror never contains `upload/`, `skills/`, keystores, `.env` files or
  binaries; the repo's root `.gitignore` is a second layer.
- A secret guard greps the literal token value(s) across the clone before
  every push and refuses to push on any hit.

## Relation to the project's own files

Release-level project state stays in the root `STATE.md`, `CHANGELOG.md` and
`PATCHES.md`; this harness does not replace them — it automates persistence
and keeps the *agent's* memory. See `memory/decisions/` for design rationale
and `memory/episodes/` for the session history.
