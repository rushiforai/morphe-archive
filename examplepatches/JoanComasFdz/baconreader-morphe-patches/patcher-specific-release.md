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
| `revert` | patch, unless what it reverts is in the same release: then neither counts |
| `chore`, `docs`, others | none |

- A release on `dev` is a pre-release, shown in Morphe Manager when pre-releases are on for this source. A release on `main` is stable.
- Only `release.yml` creates releases. Never create one by hand, edit `CHANGELOG.md`, `patches-list.json` or `patches-bundle.json` (but to repair the patches source, below), or force-push release commits.
- A `revert` of a commit a pre-release already holds makes a new pre-release on `dev`, with no notes: what it reverts
  isn't in it. Reverted again on `main` with that commit, the two leave each other out.
- The README is written by hand. It links to the user guide for the patches: a new or changed patch updates its page and its row in `docs/patches.md` (AGENTS.md, "Patch pages"), not the README.

## The patches source

Morphe Manager reads `patches-bundle.json` on `main` (stable) and on `dev` (pre-releases) and downloads the `.mpp` its
`download_url` names, a release's file.

- **Never delete a release or its tag.** To change what a release says, edit its notes. Deleted, its file is gone, and
  every Morphe Manager that names it can't download the patches.
- `main` can name a pre-release: merging `dev` into `main` brings `dev`'s `patches-bundle.json`, and `main` names
  `dev`'s newest pre-release until it makes a release of its own (a `chore`/`docs` merge makes none).
- The "Patches source" workflow (`patches-source.yml`) downloads what `main` and `dev` name, every day and after each
  push that changes the file, and fails when one doesn't answer 200.
- **If the source's download breaks:** on a branch from `dev`, restore `patches-bundle.json`, `patches-list.json` and
  `gradle.properties`' version from the last release's commit (`git checkout <its "chore: Release" commit> -- …`), as
  a `chore(release)` commit; merge it into `dev`, then the `dev` → `main` PR. Neither makes a release. It's the only
  time these files are edited by hand (#134, 2026-11-10).
