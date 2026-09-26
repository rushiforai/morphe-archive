## Git workflow

Use a separate `.worktrees/<task>` worktree on an `agent/<task>` branch,
created before the first edit. The default branch is append-only:
never merge, reset, or amend it locally.
Integrate through `ship`, which verifies and squash-merges a GitHub PR.
Run the repository checks with `task verify`.
