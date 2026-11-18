# Release workflow

The stable Morphe source is `main`; `dev` is the pre-release channel. Do not publish an unapproved feature or fix to `main`. Make changes and publish experimental bundles on `dev`, then ask the owner to test. Promote to stable only when the owner says they are happy with that version. Repository documentation or release-process changes are not a patch release and may be updated on main when needed.

This repository does not currently have an active automated release pipeline. Publish and verify channel metadata explicitly; do not assume a GitHub release or CI job exists.

For a pre-release:

1. Branch from the latest stable state and work on `dev`. Keep the stable `main` bundle, metadata and patch list unchanged.
2. Assign a monotonically increasing SemVer pre-release version such as `0.2.1-dev.1`, build and test that exact version, and use a unique versioned `.mpp` filename. Never overwrite an already published bundle.
3. Generate `patches-list.json` from that exact `.mpp` using `./gradlew :patches:buildAndroid :patches:generatePatchesList`; verify its version and patch entries match the bundle.
4. On `dev` publish source, bundle, `patches-list.json`, and `patches-bundle.json` together. The dev metadata's `download_url` must point to the dev bundle, e.g. `https://raw.githubusercontent.com/pholcroft/brother-morphe-patches/dev/patches-0.2.1-dev.1.mpp`. Keep `created_at` in the format already used by the project.
5. Fetch both remote `dev` and `main` JSON files and bundles independently and verify versions, checksums and channel separation. Test a prerelease-enabled Morphe Manager when a device is available. Clearly label untested phone behavior.

For an approved stable release, build a new stable version, generate its matching list, and publish the stable source and versioned bundle on `main`. Ensure main metadata points to the stable bundle on main, not to a dev artifact. Then bring `dev` forward to the new stable state before further prerelease work. Check both channels again.

Morphe's pre-release switch needs a switchable repository source. Use `https://github.com/pholcroft/brother-morphe-patches` (or a raw `.../main/patches-bundle.json` URL). Raw URLs containing `refs/heads/main` may be treated as fixed and may not switch to `dev`.

