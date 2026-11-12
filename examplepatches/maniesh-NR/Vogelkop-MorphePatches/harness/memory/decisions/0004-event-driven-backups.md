# ADR 0004 — event-driven backups (supersedes [0003](0003-backup-schedule.md))

Date: 2026-11-12 · Status: accepted

## Decision

- Backups are **event-driven**: `harness/bin/backup.sh` is the **last step
  of every execution plan**. Every output to a prompt ends with a backup —
  the reply is sent only after the script returns (pushed, or
  "clean — nothing to back up").
- The fixed-interval platform cron job ("Vogelkop sandbox backup",
  job id 525546, every 8 h) was **deleted** on 2026-11-12. No timer-based
  backup exists anymore.

## Why

- Owner directive (2026-11-12, verbatim): "Backups should always be the
  last step in every execution plan, every output to a prompt should end
  with a backup, rather than backups at a fixed time interval."
- The sandbox only changes during sessions, so a timer mostly fired
  no-ops between prompts while consuming the platform's 3-per-day
  scheduled-turn quota (see ADR 0003). Tying the backup to the end of
  each execution plan bounds the loss window at **one prompt** instead
  of up to 8 hours, at zero quota cost.
- `backup.sh` is idempotent and a cheap no-op when clean, so per-prompt
  runs are safe; `flock` still guards concurrent runs.

## Failure handling

If the end-of-prompt backup fails (expired token, oversize file, secret
guard tripped), the reply to the user must say so instead of hiding it.
Recovery paths are unchanged (ADR 0001, script header). If the sandbox is
recycled mid-prompt, the loss window is bounded by the previous prompt's
backup.

## Changing it

Re-creating a scheduled job is a deliberate reversal of an owner
decision — discuss with the owner first. The scripts themselves are
frequency-agnostic.
