# Startup boundary validation — 2026-09-06

The 2 explicit startup patches accept only exact 2.0.20/5001712, 2.0.20/5001740 and 2.0.22/5002244, 5002296, 5002313, 5002318. Both are absent from the 5002322 recommendation and guarded before mutation when reached as dependencies. Older bundles select them directly. Shared splash/permission flags default off.

## Verification

- All production Kotlin compiled with Kotlin 2.3.21; all 3 production helper DEX selections assembled.
- 95/95 JUnit tests passed, including exact-pair compatibility, independent default-off startup flags and battery-only helper boundaries.
- Morphe decoded-fixture patching and output audits passed for all 4 bundles: 5001712, 5002244, 5002318, 5002322.
- Standalone permissions and splash patches each passed on 5001712; emitted DEX flags prove independent selection. All 5 Android runtime permission declarations are present in the permissions-only output.
- Standalone high-resolution audits passed on 5001712 and 5002322: original DEX/native library bytes and startup markers preserved.
- Forced transitive execution of both excluded startup patches on 5002322 passed: original DEX contents and native library remained byte-identical (DEX filenames may be renumbered); no replacement launcher or XR start-mode property; both startup flags remained false. Audit wrapper supplies an empty ids.xml required by Morphe's resource compiler.
- Latest bundle output retains stock launcher and XR start-mode behavior; its only additional SteamLink method call is GxrBatterySettings.request after SDL onCreate. Native permission code remains original.
- All 4 catalogs regenerated from compiled metadata, preserving version 1.14.1 and the selected stable channel; both startup patches exclude 5002322.
- git diff --check passed.

## Toolchain and limits

Normal Gradle execution was blocked before compilation because app.morphe.patches 1.3.3 could not resolve. Validation used the local Kotlin 2.3.21 compiler and Morphe patcher 1.9.0 from the official morphe-desktop 1.13.1 all.jar, plus JUnit Platform 1.12.2. This does not claim a successful Gradle build against the declared patcher 1.9.0-dev.1.

Inputs below are APKs rebuilt from decoded fixtures, not pristine distribution APKs. No install, ADB, permission grant, headset or SteamVR operation was performed. New startup/battery behavior and high-resolution runtime behavior with the stock XR launch mode remain untested on a headset. Earlier render validation predates this startup separation.

Outputs: build/startup-boundary-audit. Local compiled patch archive: build/startup-boundary-tools/catalog-work/build/libs/startup-boundary.mpp. This is a validation build, not a published release.

| Decoded fixture | SHA-256 |
|---|---|
| decoded-apk-android-steamlinkvr-release-base-2.0.20-5001712.apk | `02f87bb8c599de003f49bb95a7b1cdd65e52557c2e76279865ac252e87686e09` |
| decoded-apk-android-steamlinkvr-release-base-2.0.22-5002244.apk | `b1be6f92cb8258963ee6790463c6cf77e181729e1c3498021d86e25d2eac6df8` |
| decoded-apk-android-steamlinkvr-release-base-2.0.22-5002318.apk | `80d1cdadccca07ebc61df483cf5be579c41b7f6913c7bbe714763002595bb21b` |
| decoded-apk-android-steamlinkvr-release-base-2.0.22-5002322.apk | `2271c654a354e782021aaa0a2690832a6cc0e7e22853cc74c8206dce42836d95` |
