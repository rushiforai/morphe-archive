# Windows setup

## Automated setup

Run `scripts/bootstrap.ps1 -InstallMissing`. It:

- configures Android Studio's JDK 21 as user `JAVA_HOME`;
- configures `ANDROID_HOME`/`ANDROID_SDK_ROOT` and adds platform-tools/emulator to the user PATH;
- verifies Node.js LTS, GitHub CLI, `Pixel_10`, `Television_4K`, and WHPX;
- downloads the pinned Morphe Desktop JAR to gitignored `tools/`;
- clones and verifies the official Morphe Gradle plugin and patcher at the pinned tags under gitignored `tools/`;
- creates one gitignored JKS test key and credentials under `local/keystore/`.

The same key must be used for CLI and Manager test outputs. Back up `local/keystore` securely if test upgrades must survive a machine rebuild.

## GitHub credentials

The active `liongalahad` credential needs `repo` and `workflow`. Local builds use the public, pinned Morphe source checkouts created by bootstrap, so `read:packages` is not required locally. Morphe Manager does not need a PAT to read the public patch source.

Configure the Actions secret `MORPHE_PACKAGES_TOKEN` with a PAT that can read Morphe's GitHub Packages registry. Never use this secret for APK downloads or publish it to logs.

## Emulators

- `Pixel_10`: Manager/public-source/import/selection workflow.
- `Television_4K`: API 36 x86_64 Nuvio runtime, D-pad, Media3, screenshots, UI dump, and logcat. Both the x86_64 and official universal APKs are tested on this AVD.

Real devices are not interchangeable with the AVD gate. `test.ps1 -Device real` detects `ro.product.cpu.abi` and selects only the declared arm64-v8a or armeabi-v7a official asset.
Pass `-Asset universal` to explicitly validate the official universal APK on a compatible emulator or real device.
