# Penguin Patches

- Independent GPL-3.0 patch collection compatible with Morphe; preserve LICENSE, NOTICE and source attribution.
- Put app patches under `patches/src/main/kotlin/io/github/pengusto/patches/<app>/` and runtime extensions under `extensions/extension/src/main/java/io/github/pengusto/patches/extension/<app>/`.
- Use official Morphe APIs and existing Gradle tooling. No embedded APKs, signing keys or tokens in Git.
- Work on dev. Publish only patches tested against specified original APK versions, including signature/package identity, install, UI and save/data regression checks. Document original APK provenance and checksum.
- Do not claim compatibility with untested versions or silently rewrite stored app data. Fail clearly on unsupported bytecode.
- Keep release workflow manual until the first patch is verified. Use the template semantic release pipeline; do not manually edit generated patch metadata.
- Local build: Java 21, Android SDK, `./gradlew :patches:buildAndroid`. GitHub Packages needs read:packages; pass credentials via environment, never store them in project files.
- Calendar's existing fork is the reference implementation, not an already converted Morphe patch. Preserve exact HTML on unrelated event edits.
- Before Android setup, inspect existing ignored local setup notes (especially `.scratch/android-tests/README.md` and `env.sh`, if present) and verify their tools before downloading a second SDK/emulator environment.
- Bundle repeatable emulator acceptance in scripts with explicit APK paths, serial and disposable-fixture checks, so required sandbox approvals cover a coherent test run. Reject stale UI dumps and distinguish setup failures from actual product regressions.
- Isolate app-specific Kotlin/Compose extensions from the shared Fossify runtime. Compile-only app signatures do not establish runtime compatibility: verify extension references against the actual R8-shrunk target APK and run real UI acceptance; shrinking may remove Kotlin assertions, facades and Compose compiler helpers.
- For Java-only MPEs, exclude the Gradle plugin's implicit Kotlin stdlib runtime dependency. Inspect the packaged DEX classes to reject bundled app stubs or unrelated runtime libraries, and compare existing MPE payloads when adding an app module.
- Validate bounded Morphe options inside patch execution. Morphe Desktop 1.18.1 silently falls back to the default when a patch option validator rejects an explicit value; an execution-time check makes invalid input fail visibly.
- Android UIAutomator can expose controls behind bottom sheets or the keyboard. Confirm the visible surface and IME state, and disambiguate identical labels before tapping; accessibility bounds alone do not establish that a control is reachable.
- R8 can reuse parameter registers for unrelated types inside a method. Verify live register types at every hook site; capture parameters at entry when necessary. When independent patches touch one class, normalize debug items in bytecode guards, since Morphe's mutable conversion can strip them from otherwise unchanged methods.
