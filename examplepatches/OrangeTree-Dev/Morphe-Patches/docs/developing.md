# 🛠️ Building and releasing

Notes for working on these patches. You don't need any of this to use them.

- Push to the `dev` branch and GitHub Actions publishes a beta. Merge `dev` into `main` (merge commit, no squash) for a stable release.
- Only `feat:`, `fix:` and `perf:` commits make a release, `chore:` and `docs:` commits don't.
- Versions are dates and times in UTC: stable releases look like `v1.26.11.05.1432`, betas like `v1.26.11.05.1432-beta`.
- The first number goes up by one when the patches move to a new YouTube Music app version (set `releaseMajor` in `gradle.properties`).
- The patch table in the README is generated on each release from `patches-list.json`. A patch name links to its page in `docs/` when one exists.

[← Back to OrangeTree Patches](../README.md)
