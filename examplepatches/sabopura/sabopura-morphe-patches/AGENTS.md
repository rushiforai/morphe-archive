# Notes for contributors and coding agents

## Safety boundaries

- Never commit downloaded or patched app packages (APK/APKS/APKM/XAPK/AAB), patch bundles
  (MPP), signing material, credentials, device logs, screenshots of personal data, or
  decompiler output. Keep test inputs outside the repository and do not redistribute them.
- Do not put GitHub tokens in Gradle files; use the `GITHUB_ACTOR`/`GITHUB_TOKEN`
  environment variables or local-only Gradle properties.

## Build

Use JDK 21.

```sh
./gradlew :patches:test :extensions:twitch:testDebugUnitTest :extensions:youtube:testDebugUnitTest :extensions:smartnews:testDebugUnitTest
./gradlew :patches:buildAndroid :patches:generatePatchesList
```

`buildAndroid` is required so the MPP contains Android-compatible bytecode. Never edit the
generated `patches-list.json` by hand.

## Adding a new app version

- Keep the supported versions short: the newest version and the one before it. YouTube and
  Reddit support the official Morphe patches' stable and newest targets plus the newest store
  version instead. Twitch also keeps 30.7.2 for Android 12 and older. Remove a version only
  after the versions that replace it are verified.
- Add a target to the app's `Constants.kt` only after the new version has been verified; never
  widen compatibility speculatively.
- Validate the official input first: package name, version, version code, signer
  certificate (must be in the target's `signatures`), minimum SDK and ABI.
- Apply the patches with `--force` to probe the new version, then without `--force` after
  the target is added. A patch run must fail rather than silently match nothing.
- Prefer stable strings, descriptors, resource names and data-class `toString()` anchors
  over obfuscated class or member names. If an update breaks a patch, add focused matching
  for the new version and keep the old path working.
- Verify behaviour on an Android API 36 emulator before adding the target: launch, the
  patched feature, and a process log without fatal errors. Record anything that could not
  be checked (for example screens behind a sign-in) in `docs/apps.md`.
- Twitch has extra requirements; see `docs/twitch-maintenance.md` and
  `tests/twitch-compatibility/README.md`.

## Settings storage

Never derive preference file names or other lookups from the package name; other patches
can rename the package. Use the fixed names in the extensions.
