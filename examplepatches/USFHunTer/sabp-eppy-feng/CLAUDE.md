# CLAUDE.md

See README.md for what this repo is, and docs/ARCHITECTURE.md / docs/TESTING.md for how it's built and tested.

Workspace: locally this repo sits next to sibling repos that use it (PC read along builds from `../sabp-eppy-patches`). `../README.md`
explains how they connect, if it's there. Update it when a link between the repos changes, such as eppy's read-along classes, the
transcript format or `tools/pc-transcribe`.

## Agent skills

setup-matt-pocock-skills = true

### Issue tracker

Issues and specs live as local markdown under `.scratch/`, which is git-ignored (the repository is public). See `docs/agents/issue-tracker.md`.

### Domain docs

Single-context: `GLOSSARY.md` and `docs/adr/` at the repo root. See `docs/agents/domain.md`.
