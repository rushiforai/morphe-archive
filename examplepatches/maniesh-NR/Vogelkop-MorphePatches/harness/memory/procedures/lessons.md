# Lessons learned

From the project's own history plus this bootstrap:

- Sandbox recycles are THE threat model: two recycles during v1.3.x lost the
  toolchain, the keystore and repo history (root STATE.md header). Back up
  at the END OF EVERY execution plan (ADR 0004) — the reply goes out only
  after `backup.sh` ran; there is no scheduled job to sweep up anymore.
- `upload/` can contain live secrets (two different token files found on
  2026-11-12). Never mirror it unfiltered; never print such files; compare by
  hash (`cmp`/`sha256sum`) rather than reading them.
- Fine-grained PAT + GIT_ASKPASS: username = account login, password = token.
  This keeps `.git/config` and remote URLs secret-free.
- `git diff --cached --quiet` exits 1 when changes exist — guard it inside an
  `if` when `set -e` is on.
- rsync needs `--delete-excluded`: plain `--delete` keeps newly-excluded
  files in the mirror forever.
- A system crontab does not survive recycles — and the platform cron tool
  is no longer used for backups (event-driven since ADR 0004; the former
  8-hour job was deleted 2026-11-12).
- The repo is public: think before committing anything user-specific.
  Screenshots, tokens and APKs have no place in git; big artifacts belong in
  the `sandbox-storage` prerelease.
- GitHub blocks files > 100 MiB (guard at 95 MiB for safety).
- Old scripts may reference `/tmp/my-project` — the previous sandbox layout.
  Current layout is `/home/z/my-project` (e.g. `upload_storage.py` is stale).
- `git clone` of an empty-output command pipeline can hide failures: always
  check `test -d .git` after cloning, and let scripts fail loudly.
