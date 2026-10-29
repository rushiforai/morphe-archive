# Buienalarm Implementation Plan

> Execute inline using the executing-plans skill. User approved the two-patch design and supplied an official template fork and local PAT during implementation.

**Goal:** Build and validate two selectable Morphe patches for the supplied Buienalarm APK.

**Architecture:** A bytecode patch with an internal resource dependency disables ad paths and hides their containers. A separate resource patch hides the Settings promotion while preserving its object. Use the official template on dev in johnneerdael/buienalarm-patches.

**Tech Stack:** Kotlin, Morphe patches Gradle plugin 2.1.0-dev.1 / patcher 2.0.1, Gradle 9.6.1, Android SDK D8, apktool and Python.

- [x] Inventory all seven reference patch repositories and decode a copy of the input APK with leanrea. Record exact APK identity and patch points in docs/INVESTIGATION.md.
- [x] Write tests/verify_decoded.py. Confirm unpatched baseline passes without patch flags and fails when requested patch effects are asserted before implementation.
- [x] Implement patches/src/main/kotlin/patches/buienalarm/BuienalarmPatches.kt with version/signature compatibility, fail-closed fingerprints and independent resource behavior.
- [x] Migrate into the user-created official template fork on dev. Replace example patches/extensions, update metadata/README/issue links and retain upstream release workflows.
- [x] Build with the official buildAndroid task using the local PAT. Keep .pat ignored and credentials out of configuration and logs.
- [x] Apply each selection using the real Desktop patcher with --validate and FULL bytecode mode. Independently decode results and check JSON reports, signatures, resources, ad decisions and unchanged Premium-only DEX.
- [x] Finish emulator Settings comparison, record missing-Google-Play-services/weather/network runtime limits, complete final code review and report built artifacts.
