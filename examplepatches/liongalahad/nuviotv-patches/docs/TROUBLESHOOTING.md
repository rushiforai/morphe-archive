# Troubleshooting

## Morphe dependencies fail to resolve

Run `scripts/bootstrap.ps1` to install and verify the pinned public Morphe Gradle plugin and patcher source checkouts. Local scripts select these checkouts automatically and do not require `read:packages`. Actions uses `MORPHE_PACKAGES_TOKEN` for the Morphe registry instead.

## Fingerprint has zero or multiple matches

Stop. Confirm the APK version and SHA-256, inspect the target again, and refine stable structure. Never force compatibility or use an obfuscated class/method name as the solution.

## Morphe full verification fails on the official APK

NuvioTV `0.8.1-beta` contains optional Rhino, Sentry Compose, and RE2J references whose classes are not packaged. Morphe `FULL` SDK verification therefore reports pre-existing missing-class errors. `STRIP_SAFE` also triggers a Morphe 1.12.0 concurrent-modification defect on Nuvio's primary DEX. The automated application path pins `STRIP_FAST`, then verifies the manifest and injected DEX descriptors and requires a successful Android install/launch with no `VerifyError` or fatal log entry.

## Signature/install failure

Patched and official NuvioTV signatures differ. Use the dedicated test profile. Preserve `local/keystore`, uninstall the official package once on that profile, and reuse the same key. Real-device data removal requires explicit `-ReplaceOfficial`.

## ADB or emulator failure

Run `bootstrap.ps1`, then verify `adb devices`, `emulator -list-avds`, and `emulator -accel-check`. The scripts identify AVDs by reported AVD name, not whichever emulator starts first.

## Patch source failure

Confirm the public repository is reachable, the release contains a compatible `.mpp` and patch list, and Manager is using the intended prerelease/stable channel. A PAT is not required for this source.

## SDH mode does not update playback

Confirm playback uses Media3/ExoPlayer, not MPV/libass. Check manifest metadata, the `morphe_patches` preference key, cue-hook inspection, and logcat. Each new `CueGroup` reads the current cached state; a restart should not be required.
