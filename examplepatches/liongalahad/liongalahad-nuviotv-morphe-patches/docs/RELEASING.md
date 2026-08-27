# Releasing

## Commit and branch policy

- Develop on `dev` using conventional commits (`feat:`, `fix:`, `perf:`, `bump:`).
- CI must pass before merge.
- Semantic-release creates private prereleases from `dev`.
- Stable releases come only from reviewed, non-squash merges of `dev` into protected `main`.

## Stable gate

Before merging to `main`:

- all unit/build/list/isolated application/inspection checks pass;
- `Television_4K` runtime acceptance passes;
- `Pixel_10` Manager/public-source flow passes;
- a real Android TV passes install, D-pad, persistence, Media3 playback, seeking, track changes, and patch behavior;
- `validation/<version>-<device>.md` records Nuvio version, official digest, bundle version/digest, model, ABI, Android version, and results.

Release assets are `.mpp`, patch list/metadata, checksums, and attestations only. An APK in a release or Actions artifact is a release-blocking failure.

## Rollback

Do not rewrite release history. Mark the affected release, revert the fault on `dev` with a conventional `fix:` commit, rerun every gate, and publish a new prerelease/stable version. Remove compatibility for a broken target rather than widening its fingerprint.
