# Morphe-patches

Reddit patches for the Morphe patcher, plus automation that tracks upstream Reddit versions and publishes releases.

![Build](https://github.com/Psyquix/Morphe-patches/actions/workflows/build.yml/badge.svg)

## Patches

| Patch | What it does | Target |
| ----- | ------------ | ------ |
| Share profile as username | When you share a user profile page, it shares just the username instead of the full link. | <!-- REDDIT-VERSION -->com.reddit.frontpage 2026.40.0 (exp)<!-- /REDDIT-VERSION --> |

### Share profile as username

- **ON:** sharing a profile like `https://www.reddit.com/user/rere` puts just `rere` in the share sheet / clipboard.
- **OFF:** stock behavior — the full profile URL is shared, unmodified.
- Profile links with tracking junk (e.g. `https://www.reddit.com/user/rere/?utm_source=share`) are still shortened to `rere`.
- Anything that is not a user profile (posts, subreddits, comments) is never touched.

## Compatibility

- `com.reddit.frontpage` version <!-- REDDIT-VERSION -->2026.40.0<!-- /REDDIT-VERSION --> (experimental).
- The pinned version lives in `reddit-target.txt` — it is the single source of truth. The version strings above update automatically (see below); never edit them by hand.
- Backward-compatible with the stable and experimental Reddits Morphed builds (currently 2026.24.0 / 2026.39.0) — same share-formatter hook as upstream's sanitize patch.

## How updates work (automatic)

1. Every 6 hours the checker (`.github/workflows/check-upstream.yml`) compares upstream `MorpheApp/morphe-patches` Reddit support against `reddit-target.txt`.
2. On a version move it opens a PR labeled `upstream-retarget` that bumps the target, the patch compatibility, and this README. Builds on the PR are test-gated and there is no auto-merge — merging stays human.
3. Once the update is merged to `master`, the release workflow (`.github/workflows/release.yml`) automatically tests, builds, tags it `<reddit>-morphe-ver-<nn>` (e.g. `2026.40.0-morphe-ver-01`, `nn` ticks up per patch revision), and publishes a Release.
4. Release notes show only the Reddit version the bundle was built for.

## Morphed wiring

Use this bundle alongside upstream patches, then scope with `|`-separated lists:

```toml
patches-source = "'MorpheApp/morphe-patches' 'Psyquix/Morphe-patches'"
excluded-patches = "Share profile as username | <other-patch>"
included-patches = "Share profile as username | <other-patch>"
```
