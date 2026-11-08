# Preparing a release

No remote, token, signing key or release is configured locally. GitHub Actions uses its ephemeral built-in token; local credentials belong in your existing Git credential manager, not project files.

1. Set `version` in `gradle.properties` and add a simple entry to `changelog.md`.
2. Build with `./build.sh`; use `BOOST_APK=/path/to/original.apk ./build.sh` for application validation.
3. After choosing the actual repository, rebuild with its metadata and prepare local assets:

   ```bash
   GITHUB_REPOSITORY=owner/repository ./build.sh
   python3 tools/prepare-release.py --repository owner/repository
   ```

   The helper verifies the current compiled bundle, version and patch-list count. It writes the bundle, checksum, patch list and release notes into ignored `release/`. It also generates root `patches-bundle.json` using the Morphe schema and an actual GitHub release URL. Commit that descriptor and `patches-list.json` with the matching source version. Without `--repository`, it prepares downloadable assets without inventing a source URL.

4. Review `git diff --cached` / `git diff`. Commit the source and metadata, add your actual remote and push `main`. Create/push the matching `v1.0.0` tag when ready.
5. Create a **draft** GitHub release for that tag, attach the `.mpp`, `.sha256` and `patches-list.json` from `release/`, and paste `release/release-notes.md` into its description. Check the asset URL matches `patches-bundle.json`, then publish the draft when you choose.

The manual `Build release artifacts` workflow offers the same build, preparation and upload, with the repository inferred from GitHub. Download its artifact and use the generated `patches-bundle.json` in the matching release commit. The workflow has read-only repository permissions and performs no release creation, commits or pushes. It has no proprietary APK and therefore reports APK application tests as skipped.

After publishing, users can import the asset as a local source or add your GitHub repository as a source in Morphe Manager. The updater needs the root descriptor committed to the repository and the matching downloadable published release. This layout follows [hxreborn's patches-bundle schema](https://github.com/hxreborn/morphe-patches/blob/main/patches-bundle.json), with an empty detached-signature URL because no signing key has been established.

