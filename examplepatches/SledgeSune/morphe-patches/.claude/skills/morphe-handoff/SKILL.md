---
name: morphe-handoff
description: Start or end a working session on the SledgeSune/morphe-patches repo. At the start, load the project state from HANDOFF.md and check what changed (git, releases, GitHub Actions, tools). At the end, update HANDOFF.md so the next session can continue. Use whenever a session begins work on these patches, when the user asks "where were we" / "continue", or when handing off, wrapping up or summarising the project.
---

# Session handoff

`CLAUDE.md` = stable rules. `HANDOFF.md` = state. Read both first.

## Start

```bash
git status --short && git branch --show-current          # should be dev
git fetch -q origin && git log --oneline -5 origin/dev && git log --oneline -3 origin/main
gh release list -R SledgeSune/morphe-patches --limit 3
gh run list -R SledgeSune/morphe-patches --limit 3      # Actions billing lock lifted?
```

- Uncommitted files you didn't write: read them and ask before committing or deleting.
- `dev` should differ from `main` only by unreleased commits.
- If Actions runs succeed again, note it in HANDOFF.md: releases can go back to the workflow.
- Build once (CLAUDE.md › Build) to confirm the tools still work.
- Ask the owner about any **untested** patch the task touches. Their phone is the only real test.

Then: new or changed patch → `new-morphe-patch`; app updated → `update-app-version`; publish → `release-morphe-patches`.

## End

Update `HANDOFF.md`: header date; "Where things are" (release, APKs); one row per new/changed patch (hook,
obfuscated name for the tested version, fingerprint anchors, tested or not); open issues (verified vs not);
ideas mentioned but not started; one dated session-log line; any new owner decision.

Commit on `dev` with `chore: Update handoff notes` (no release) and the attribution line from the current system
reminder; push `dev`.

Facts only ("untested", not "should work"). The repo is public: no private details.
