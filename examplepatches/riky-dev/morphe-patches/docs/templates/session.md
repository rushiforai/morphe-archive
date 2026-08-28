<!--
SESSION HEADER — agent: read this block before any tool call.
app_id: APP_ID_PLACEHOLDER
phase: 0
active_goal: none
updated: TIMESTAMP_PLACEHOLDER
-->

# Patch session

## App

- **app_id:** APP_ID_PLACEHOLDER
- **package:** PACKAGE_PLACEHOLDER
- **config:** `config/apps/APP_ID_PLACEHOLDER.yaml`

## Patch goals

Add goals below. Each goal needs acceptance criteria so the agent knows when it is done.

```markdown
1. [ ] Example: Hide banner ads
   - **Local done when:** smali assertion on BannerManager (add after implement)
   - **Device done when:** smoke OK; or skip if acceptance allows local-only
   - **Limitations:** none
```

## Constraints

- One new patch per verify cycle during development
- Full bundle verify when all goals are checked
- Read `analysis-notes.md` before re-reading smali sources

## Progress log

| Date | Phase | Notes |
|------|-------|-------|
