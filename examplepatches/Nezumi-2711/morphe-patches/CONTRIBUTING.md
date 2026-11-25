# Ticket linking

The release workflow comments on tickets automatically.

- Reference tickets in commit messages or PR bodies with `Refs #123`.
  `Closes/Fixes #123` also works, but GitHub then closes the ticket as soon as `dev` is merged into `main`, before the release finishes.
- Push to `dev`: pre-release is published, the bot comments on each referenced ticket and labels it `in-prerelease`. The ticket stays open.
- Merge `dev` into `main` with a **merge commit** (not squash) so the original commit references are kept.
- Stable release: the bot comments, labels the ticket `released` and closes it.
