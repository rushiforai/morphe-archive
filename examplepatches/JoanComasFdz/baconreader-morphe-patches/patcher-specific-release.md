<!-- SPDX-FileCopyrightText: 2026 JoanComasFdz -->
<!-- SPDX-License-Identifier: GPL-3.0-only -->

# Patcher-specific: release (Morphe)

## Branches and PRs

- Work on `dev`: branch from it and open PRs against it.
- `open_pull_request.yml` keeps a `dev` → `main` PR open. A stable release merges it with a merge commit, no squash.

## Commits and releases

semantic-release (`.releaserc`) releases from the commit types:

| Type | Release |
|---|---|
| `feat` | minor |
| `fix`, `perf`, `bump` | patch |
| `chore`, `docs`, others | none |

- A release on `dev` is a pre-release, shown in Morphe Manager when pre-releases are on for this source. A release on `main` is stable.
- Only `release.yml` creates releases. Never create one by hand, edit `CHANGELOG.md`, `patches-list.json` or `patches-bundle.json`, or force-push release commits.
- The README is written by hand: update its tables and the patch count badge when a patch is added or changed.
