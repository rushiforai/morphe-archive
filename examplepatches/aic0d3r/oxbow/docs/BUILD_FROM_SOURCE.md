# Build from source

This guide explains how to build Oxbow yourself. Building from source lets
you inspect the patches and avoid trusting a prebuilt APK. Oxbow is a fork of
[Feurstagram](https://github.com/jean-voila/FeurStagram) by Jean Herail (GPL-3.0).

## Requirements

- JDK 21 and the Android SDK (`ANDROID_HOME` set, build-tools installed)
- A GitHub token with the `read:packages` scope in `~/.gradle/gradle.properties`
  (used to fetch the patcher dependency):
  ```properties
  gpr.user=<your-github-username>
  gpr.key=<token-with-read:packages>
  ```
- A supported Instagram `.apkm` bundle (arm64-v8a from a trusted source such as APKMirror)

## Steps

1. Clone the repository.
   ```sh
   git clone https://github.com/aic0d3r/oxbow.git
   cd oxbow
   ```

2. Build and apply the patches to your Instagram bundle.
   ```sh
   ./build.sh instagram.apkm
   ```
   The result is `oxbow.apk`. Add `--clone` to build `oxbow-clone.apk` (installs
   alongside a stock Instagram), and `--install` to push to a connected device:
   ```sh
   ./build.sh instagram.apkm --clone --install
   ```

3. Install the signed result (if you did not pass `--install`).
   ```sh
   adb install -r oxbow.apk
   ```

## Signing

The bundle is signed during the build. Set `FEURSTAGRAM_KEYSTORE_PASS` (and
optionally `FEURSTAGRAM_KEY_PASS`) to sign with `feurstagram.keystore`
(these internal names are kept from upstream on purpose); otherwise a throwaway
keystore is generated. Do not commit your keystore, and keep the same one to
reinstall without losing app data.

## Notes

- Only use APKs from trusted sources.
- Patches are fingerprint-based, so a new Instagram version usually only needs a
  rebuild.
- If the build fails, check open issues or create a bug report.
