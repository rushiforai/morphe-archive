# Maintenance

## Development

Changes target `dev`. Keep fixes and features in separate commits, with tests for
changed behavior. Merge `dev` into `main` with **Create a merge commit** for a
stable release.

## Shared fixes

All patches that modify Twitch include the shared settings integration. It provides
Patch settings, notification registration, theme synchronization and DJ playback
settings. These fixes have no separate selection or toggle. APK inspection remains
read-only.

Keep reduced-selection coverage alongside full patch builds. Check theme changes
across Following, Live and Clips, and retain Twitch's player and rendition checks
when updating DJ controls.

## Verification

Run from the repository root:

```powershell
./scripts/check-source.ps1
./scripts/build.ps1
./scripts/test.ps1
npm.cmd test
```

Bytecode changes also require a full APK rebuild, original-aware DEX verification
and device testing. Record supported app versions and results in
`config/compatibility.json`.

## Twitch version updates

`scripts/evaluate-update.ps1` verifies an original APK or complete split bundle,
records its identity and optionally decompiles or patches it. For example:

```powershell
./scripts/evaluate-update.ps1 -InputApk '.local/inputs/twitch.apkm' -ExpectedVersion '31.5.2' -Decompile
```

Review the candidate's hooks before updating `TwitchTarget.kt`. Evaluate native
and React Native playback, chat, settings and ad handling before declaring a
version supported. Originals, signing keys and run artifacts stay under `.local/`.

See [the upgrade workflow](UPGRADES.md) for repository synchronization, baseline
checkpoints, device recovery and overnight acceptance checks.

## Releases

The workflow uses semantic-release. With `PATCH_RELEASES_ENABLED=true`, pushes to
`dev` publish prereleases and merges into `main` publish stable releases.

| Commit type | Version change |
| --- | --- |
| `fix:`, `perf:`, `bump:` | Patch |
| `feat:` | Minor |
| `BREAKING CHANGE:` footer | Major |
| `docs:`, `chore:`, `refactor:`, `test:` | None |

The highest version increment among the included commits wins. Commit subjects
form the release notes. The workflow generates `CHANGELOG.md`, patch metadata and
`.mpp` assets; public releases also receive build attestations. Builds and tests
run before publication. Release runs share a queue across `dev` and `main`.

The automatic run starts after a push or merge. Use **Run workflow** to retry a
failed run or release changes already on the branch. A second run checks for
unreleased commits before publishing.

The patch-bundle version is independent of the supported Twitch app versions.
A Twitch update uses `bump:`; a new feature uses `feat:`. Release notes group these
under App Support and Features, with fixes under Bug Fixes. Commit completed
changes locally before pushing; the push starts the release workflow. Do not
set the next version or add a future changelog entry manually.

Existing release notes can be edited in GitHub. Keep the corresponding historical
`CHANGELOG.md` entry in sync and retain the release tag and asset version.
