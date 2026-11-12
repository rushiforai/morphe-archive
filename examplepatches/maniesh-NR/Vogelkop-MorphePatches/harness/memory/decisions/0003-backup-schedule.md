# ADR 0003 — backup frequency

Date: 2026-11-12 · Status: **superseded by [0004](0004-event-driven-backups.md)**

## Decision

- An automated platform job (agent turn, name "Vogelkop sandbox backup", id
  tracked in the platform cron tool) runs `harness/bin/backup.sh` **every 8
  hours** (fixed_rate 28800 s = 3 runs/day).
- Every working session additionally backs up at the end (AGENTS.md protocol)
  — the primary path. The scheduled job is the crash backstop and a no-op
  when clean.

## Why every 8 hours and not hourly

The platform caps scheduled agent-turn jobs at **3 executions per day**;
an hourly schedule was tried first and the platform warned that 21 of 24
triggers would be ignored (unpredictably). A fixed 8-hour interval uses the
full quota deterministically.

## Rationale

- The sandbox only changes during sessions, so most scheduled runs are
  no-ops anyway; the end-of-session backup is what actually protects rung
  work.
- Worst-case loss after a mid-session recycle is bounded at ~8 hours of
  sandbox drift — and in practice the memory + project files are committed
  at rung boundaries by the working session itself.

## Changing it

Delete and re-create the platform cron job with the desired interval
(keep it at ≤ 3 runs/day); nothing else depends on it. The scripts
themselves are frequency-agnostic (flock makes concurrent runs safe).
