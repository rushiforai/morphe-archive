# Contributing

## Development workflow

1. Follow the official [Morphe development setup](https://github.com/MorpheApp/morphe-documentation/blob/main/docs/morphe-development/README.md).
2. Install or select the project's JDK with SDKMAN:

   ```shell
   sdk env install
   ```

3. Create changes on the `dev` branch.
4. Build the project:

   ```shell
   ./gradlew buildAndroid
   ```

5. Use semantic commit messages:

   - `feat:` for a new patch or user-visible capability.
   - `fix:` for a user-visible correction.
   - `chore:` for maintenance that should not create a release.
   - `bump:` when updating supported app versions.

6. Open or update the pull request from `dev` to `main`.

Merging `dev` into `main` without squashing creates a stable release. Commits
on `dev` can create prereleases. Do not manually edit `CHANGELOG.md`,
`patches-bundle.json`, `patches-list.json`, or the generated patch list in
`README.md`.

## Scope

Contributions must be suitable for lawful, authorized use. Do not submit APK
files, proprietary application source code, secrets, signing keys, or requests
to bypass paid access, DRM, or licensing controls.
