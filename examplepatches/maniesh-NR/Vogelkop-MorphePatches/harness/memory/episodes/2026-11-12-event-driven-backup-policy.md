# Episode: event-driven backup policy (2026-11-12)

## Context

- Owner directive after the harness bootstrap (ADR 0003): "Backups should
  always be the last step in every execution plan, every output to a prompt
  should end with a backup, rather than backups at a fixed time interval."
- Prior state: platform cron job "Vogelkop sandbox backup" (job id 525546,
  fixed_rate 28800 s = every 8 h) + end-of-session backup per AGENTS.md.

## What happened

- Deleted the cron job (id 525546) — no timer-based backup exists anymore.
- AGENTS.md: replaced "Session end" + "Automated backups" sections with
  "End of every prompt — MANDATORY final step" (reply sent only after
  backup.sh returns; failures must be reported, never skipped silently)
  and "No scheduled backups (ADR 0004)".
- README.md: intro, "Fresh sandbox" (no cron job to re-create) and
  "Backup policy" sections updated to event-driven wording.
- backup.sh: LATEST.md field "Schedule" → "Trigger: last step of every
  execution plan"; lock comment updated. restore.sh: reminder no longer
  tells you to re-create the cron job.
- ADR 0003 marked superseded; wrote ADR 0004 (event-driven backups) with
  the owner directive quoted verbatim.
- MEMORY.md standing directive 2, knowledge/environment.md,
  procedures/lessons.md and state/NEXT_SESSION.md updated to the new rule.

## Outcome / handoff

- Backup trigger is now: END OF EVERY EXECUTION PLAN. Loss window after a
  mid-prompt recycle is bounded by the previous prompt's backup.
- This episode itself was committed by the very backup run that closes
  this execution plan (dogfooding the new protocol).
- Open threads unchanged otherwise: v1.3.2 adblock patch recon, W1/W2
  device results, token expiry ~2026-11-19 (see NEXT_SESSION.md).
