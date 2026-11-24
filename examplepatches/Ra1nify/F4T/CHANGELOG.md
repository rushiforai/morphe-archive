# Changelog

Release notes for F4T are generated from the conventional commits between two release tags by
`scripts/generate_changelog.py`, and this file is prepended automatically by the `Publish` workflow.
Do not edit it by hand.

Commit types and the sections they land in:

| Type | Section |
| --- | --- |
| `feat` | ✨ New Features |
| `fix` | 🐛 Bug Fixes |
| `improve` | 🔧 Improvements |
| `perf` | ⚡ Performance |
| `bump` | 🚀 Updated App Support |

`chore`, `ci`, `build`, `docs`, `refactor`, `test`, `style` and `revert` are dropped. Commits that are
not conventional commits are dropped too, unless the range contains no conventional commit at all —
then they are listed under "Other Changes" so a release never has an empty body.

Scope goes in parentheses and is rendered in bold, e.g. `feat(Keyboard): Add a patch` becomes
`- **Keyboard:** Add a patch`.

## 26.11.23.7 (2026-11-23)

Range: `v26.11.20.6`..`HEAD` (2 commit(s))

### 🐛 Bug Fixes

- **bilibili:** nop the guard's exit_group syscalls

## 26.11.20.6 (2026-11-20)

Range: `v26.11.20.5`..`HEAD` (1 commit(s))

### Other Changes

- via upload
