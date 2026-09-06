# Releasing

## Commit and branch policy

- Develop on `dev` using conventional commits (`feat:`, `fix:`, `perf:`, `bump:`).
- CI must pass before merge.
- The manually dispatched release workflow can create development prereleases from `dev`; pushes do not publish releases.
- Reviewed beta and stable source reaches protected `main` through a non-squash merge of `dev`. For this solo-maintainer repository, pull requests remain required but approving-review count is zero and last-push approval is disabled. CI must pass before merge; conversation resolution, administrator enforcement and restrictions on force pushes/deletion remain enabled.
- For a beta, set the intended prerelease version (the first is `1.0.0-beta.1`), build and verify the Android bundle, and publish a GitHub prerelease explicitly from the merged main commit using the `liongalahad` account. Never invoke the stable semantic-release path for this beta.
- Validate the local bundle in Android Manager before publishing. Immediately download the exact public release asset and repeat Manager validation, confirming seven patches and patch application before declaring the release ready.
- The beta may carry explicitly documented outstanding physical-TV acceptance. This exception does not waive the stable gate below.

## Stable gate

Before publishing a stable release from `main`:

- all unit/build/list/isolated application/inspection checks pass;
- `Television_4K` runtime acceptance passes;
- `Pixel_10` Manager/public-source flow passes;
- a real Android TV passes install, D-pad, persistence, Media3 playback, seeking, track changes, and patch behavior;
- `validation/<version>-<device>.md` records Nuvio version, official digest, bundle version/digest, model, ABI, Android version, and results.

Release assets are `.mpp`, patch list/metadata, checksums, and attestations only. An APK in a release or Actions artifact is a release-blocking failure.

## Rollback

Do not rewrite release history. Mark the affected release, revert the fault on `dev` with a conventional `fix:` commit, rerun every gate, and publish a new prerelease/stable version. Remove compatibility for a broken target rather than widening its fingerprint.
