# Morphe-patches

Reddit patches for the Morphe patcher, plus automation that tracks upstream Reddit versions and publishes releases.

![Build](https://github.com/Psyquix/Morphe-patches/actions/workflows/build.yml/badge.svg)

## Patches

| Patch | What it does | Target |
| ----- | ------------ | ------ |
| Profile share actions | On user profile share sheets, adds [Copy username] (copies the bare username) and [Open ghostddit] (opens the profile on ghostddit). Profile-only; [Copy link] stays stock. | <!-- REDDIT-VERSION -->com.reddit.frontpage 2026.40.0 (exp)<!-- /REDDIT-VERSION --> |

### Profile share actions

- **ON:** on a profile share sheet (e.g. `https://www.reddit.com/user/rere`), two extra buttons appear: [Copy username] puts just `rere` in the clipboard, [Open ghostddit] opens `https://ghostddit.aeddit.com/user/rere/` in a browser.
- **OFF:** stock behavior — only the stock share buttons are shown.
- [Copy link] output is untouched (stock full profile URL, tracking junk included).
- Anything that is not a user profile (posts, subreddits, comments) shows no new buttons.

## Compatibility

- `com.reddit.frontpage` version <!-- REDDIT-VERSION -->2026.40.0<!-- /REDDIT-VERSION --> (experimental).
- The pinned version lives in `reddit-target.txt` — it is the single source of truth. The version strings above update automatically (see below); never edit them by hand.
- Backward-compatible with the experimental Reddits Morphed builds (currently 2026.40.0 / 2026.39.0).

## How updates work (automatic)

1. Every 6 hours the checker (`.github/workflows/check-upstream.yml`) compares upstream `MorpheApp/morphe-patches` Reddit support against `reddit-target.txt`.
2. On a version move it opens a PR labeled `upstream-retarget` that bumps the target, the patch compatibility, and this README. Builds on the PR are test-gated and there is no auto-merge — merging stays human.
3. Once the update is merged to `master`, the release workflow (`.github/workflows/release.yml`) automatically tests, builds, tags it `<reddit>-morphe-ver-<nn>` (e.g. `2026.40.0-morphe-ver-01`, `nn` ticks up per patch revision), and publishes a Release.
4. Release notes show only the Reddit version the bundle was built for.

## Morphed wiring

Use this bundle alongside upstream patches, then scope with `|`-separated lists:

```toml
patches-source = "'MorpheApp/morphe-patches' 'Psyquix/Morphe-patches'"
excluded-patches = "Profile share actions | <other-patch>"
included-patches = "Profile share actions | <other-patch>"
```
