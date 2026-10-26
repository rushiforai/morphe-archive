# Contributing

Thanks for helping improve GinArena Patch.

## Development flow

- Work on the `dev` branch for pre-releases, or merge into `main` (merge commit, not squash) for
  stable releases.
- Use semantic commit messages:
  - `feat:` new patch or feature
  - `fix:` bug fix
  - `chore:` maintenance that should not create a user-facing release by itself
- Do not manually edit generated files such as `patches-list.json`, `patches-bundle.json`, or
  `CHANGELOG.md`. The release workflow updates them automatically.
- Do not force-push semantic-release commits or tags.

## Patch rules

- Only target app versions that have been audited. Obfuscated names change between builds (`1DM`,
  `CRICFy TV`, etc.); do not declare a new version compatible without checking fingerprints.
- Do not commit APK/APKM files, built `.mpp` files, tokens, or local machine settings.
- Keep the scope to privacy, debloating, UI ads/promotions, and quality-of-life fixes. Do not add
  paid-feature unlocks or proprietary code/resources.

## Bug reports

Please include the GinArena Patch version, Morphe Manager version, target app name and version/build,
device and Android version, steps to reproduce, screenshots if an issue remains, and
`AndroidRuntime` logs if the app crashes.
