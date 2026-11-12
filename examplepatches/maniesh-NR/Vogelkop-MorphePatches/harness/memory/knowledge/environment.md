# Sandbox environment (verified 2026-11-12)

- Linux sandbox; ONLY `/home/z/my-project` survives recycling. Processes,
  `/tmp` and `~` are ephemeral. Recycles have already destroyed work twice
  during v1.3.x (see root STATE.md header).
- Layout: `upload/` (user inputs — CAN CONTAIN SECRETS; two different token
  files found on 2026-11-12), `download/` (deliverables), `scripts/` (agent
  scripts), `skills/` (platform skills — internal, never mirror).
- The platform provides a cron tool for scheduled agent turns (max 3
  triggers/day) — NOT used for backups anymore: backups are event-driven,
  the last step of every execution plan (ADR 0004). A system crontab
  would NOT survive recycles — do not use one either.
- Tools verified present: git 2.47.3, rsync 3.5.0, flock, curl, jq, python3
  (venv at /home/z/.venv). Egress to api.github.com and github.com works.
- The sandbox root is itself a local-only git repo (branch `main`, one
  platform commit, no remote) — its `.git` is excluded from the mirror.
- Chinese fonts at `/usr/share/fonts/truetype/chinese/` (Noto Sans SC).
- Writing outside `/home/z/my-project` (except `/tmp/render`) is blocked by
  policy.
