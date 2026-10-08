# Local Android runtime testing

Static patch gates are not sufficient for release approval. Every candidate APK must pass a local launch smoke test before its versionCode is removed from `ci/runtime-quarantine.json`.

## Test lab

- SDK root: `C:\AndroidLab\Sdk`
- AVD root: `C:\AndroidLab\Avd`
- JDK 21: `C:\AndroidLab\Jdk21`
- Candidate APKs: `C:\AndroidLab\APKs`
- Release-gate emulator profile: `VKVideo_API35_Play`

The SDK and AVD paths intentionally contain ASCII only because QEMU on Windows can corrupt Cyrillic paths before starting the guest.

## Required smoke test

Start the emulator, wait for `sys.boot_completed=1`, then run:

```powershell
.\scripts\android-smoke-test.ps1 -ApkPath C:\AndroidLab\APKs\candidate.apk
```

The test installs the APK, clears logcat, cold-starts the launcher activity, observes the process for 15 seconds, saves the complete log, and fails if the process dies or Android reports a fatal exception.

The project release gate covers Android 13 and newer. The current automated profile is Android 15; Android 13 and 14 profiles are tracked in the roadmap.

To run the release-gate emulator matrix:

```powershell
.\scripts\android-smoke-matrix.ps1 -ApkPath C:\AndroidLab\APKs\candidate.apk
```

The upstream app still declares `minSdk 28`, but project runtime support and release qualification begin at Android 13.

## Release policy

1. Keep a new or previously crashing versionCode in runtime quarantine.
2. Let GitHub Actions produce the signed diagnostic artifact without publishing a Release.
3. Download the signed candidate to `C:\AndroidLab\APKs`.
4. Run the emulator matrix and, when available, a physical ARM64 device on Android 13 or newer.
5. Exercise Home, Clips, ordinary video playback, profile, rotation, and background/foreground transitions.
6. Remove quarantine only after the recorded tests pass; the next workflow run may then publish the immutable release.
