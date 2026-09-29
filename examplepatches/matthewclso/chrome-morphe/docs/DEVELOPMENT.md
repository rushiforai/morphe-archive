# Development

Build with JDK 21 and Android SDK platform/build-tools 36. The Morphe Gradle plugin uses GitHub Packages: provide `GITHUB_ACTOR` and `GITHUB_TOKEN` (`read:packages`), or private `gpr.user` / `gpr.key` Gradle user properties. Never commit credentials.

`bash gradlew buildAndroid --no-daemon` produces the `.mpp` bundle. The CI workflows try the repository token by default; if registry access is restricted, provide the `MORPHE_PACKAGES_TOKEN` repository secret with read access.

For the prepared local workstation, `scripts/build.py` can discover JDKs in `../tools/jdk` and the SDK at `../tools/android-sdk-native`, and obtain credentials from `gh auth token` without saving them. The private workspace keeps input APKs, tools, keys and output APKs outside this repository.

`scripts/patch.py` is the local exact-artifact runner. It uses the cached unmodified merged APK or the six-split APKS under `../inputs/chrome-153.0.8010.53/`, and the existing private test key under `../keys/`. It limits JVM processors and heap to avoid excess memory use during signing. For other environments, use Morphe Manager or Morphe Desktop directly with this bundle, the original app and your own signing key.

The local `device_ui.py` helper captures only the test package's accessible UI. Set `ANDROID_SERIAL` or pass `--serial` to select a phone. Its optional exact-label tap refuses missing and ambiguous targets. All fixture data should be disposable. Filter Android logs by the test process ID.

For releases, update `gradle.properties`, `CHANGELOG.md`, `docs/RELEASE_NOTES.md` and `patches-bundle.json` together. Build, test on device, then tag `v<version>`. The workflow prepares a draft release with the `.mpp`, metadata and SHA-256 checksum. Verify the release bundle on the target device before publishing the draft. For a locally tested release, upload the exact assets from `python3 scripts/release_assets.py --tag v<version>` to the draft, replacing its build artifacts together. Copy that metadata to the repository root before committing. Never publish Chrome APKs.
