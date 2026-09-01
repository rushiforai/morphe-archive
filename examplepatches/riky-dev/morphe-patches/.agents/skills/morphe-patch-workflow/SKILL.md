---
name: morphe-patch-workflow
description: >-
  Morphe Android patch development session — bytecode research, patch
  implementation, local verify, structured device testing. Use when the user
  mentions patching an app, Morphe, APK, smali, or starts a patch session.
---

# Morphe patch workflow

**Canonical instructions live in [AGENTS.md](../../../AGENTS.md)** — read the "AI agent workflow" section first. This skill is a Cursor shortcut only.

## Start or resume

1. If `scratch/<app_id>/session.md` exists, read the **SESSION HEADER** and continue from that phase.
2. Otherwise run `scripts/init_session.sh <app_id> [--goal "..."]`.
3. If `config/apps/<app_id>.yaml` is missing, copy `config/apps/_template.yaml` and ask the user for package + apkpure slug once.

## Quick phase map

| Phase | Action |
|-------|--------|
| 0 | `check_env.sh`; capture device profile to `scratch/<app>/device-profile.yaml` |
| 1 | Research — tiered gate (see AGENTS.md); write `analysis-notes.md` + `hypotheses.md` |
| 2 | Implement one new patch → `build.sh` → `verify_patch.sh` |
| 3 | Device test only when session.md acceptance criteria require it |

## Reference

Script examples and UI navigation fallback chain: [reference.md](reference.md)

Deep retrospective and token analysis: [docs/agent-device-workflow.md](../../../docs/agent-device-workflow.md)

Upstream Morphe patch/fingerprint docs: [Morphe development guide](https://github.com/MorpheApp/morphe-documentation/blob/main/docs/morphe-development/README.md)
