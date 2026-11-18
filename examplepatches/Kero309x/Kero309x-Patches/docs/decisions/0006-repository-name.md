# 0006 — Repository named Kero309x-Patches

- **Status:** accepted
- **Date:** 2026-11-07

## Context

Decision 0002 recorded the repository as `Kero309x/KeroPatches`, because
`Kero309x-Patches` was occupied by the collection this project replaces.

The owner then created the repository as `Kero309x/Kero309x-Patches`. The first
push created `main` there: the remote has one branch, at the same commit as the
local repository, and no refs from the earlier collection.

## Decision

The repository is `Kero309x/Kero309x-Patches`. The display name stays "Kero309x
Patches". The Maven group, the package root, the extension namespace and the
module names are unchanged.

## Consequences

- The repository row and the rationale about the name in 0002 are superseded by
  this record. The rest of 0002 still stands.
- The manifest `source` and `website`, the security-report link and any future
  links must use the actual repository path.
- Because repository names are compared case-insensitively, choosing a different
  name later means renaming the repository and updating the same places at once.
