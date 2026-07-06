# Morphe Patch Source Repositories

An auto-generated, continuously updated index of every GitHub or GitLab repository that publishes a [Morphe](https://morphe.software) (`.mpp`) patch bundle.

![Repos tracked](https://img.shields.io/badge/repos%20tracked-0-6366f1) ![Last updated](https://img.shields.io/badge/last%20updated-2026-07-06%2008:56%20UTC-555)

---

## How this list is built

This repo list is kept in [`repos.txt`](./repos.txt) and assembled from three sources:

1. **Registry scan** - crawling [`Jman-Github/ReVanced-Patch-Bundles`](https://github.com/Jman-Github/ReVanced-Patch-Bundles) and extracting the source repo behind every bundle that passes the Morphe (`.mpp`) filter.
2. **GitHub-wide search** - scanning all of GitHub for `patches-bundle.json` files, excluding forks, and verifying each candidate has an actual `.mpp` release asset.
3. **Manual additions** - anything listed in [`custom_repos.txt`](./custom_repos.txt).

Repos are never silently removed when a source goes quiet - add an entry to [`ignore_repos.txt`](./ignore_repos.txt) to intentionally drop one.

README and settings output include only repos whose `patches-bundle.json` is reachable and contains a real `.mpp` reference.

---

## Tracked Repositories (0)

| # | Repository | Source | Morphe |
|---|------------|--------|--------|

---

## Updating

This README is regenerated automatically by GitHub Actions whenever `repos.txt` changes.
To add a repo manually, append it to `custom_repos.txt`. To remove one permanently, add it to `ignore_repos.txt`.
Use `owner/repo` for GitHub, or `gitlab.com/group/project` for GitLab.

*Last generated: 2026-07-06 08:56 UTC*
