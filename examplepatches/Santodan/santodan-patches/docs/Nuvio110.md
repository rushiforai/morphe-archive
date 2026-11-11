# NuvioTV official 1.1.0

Target: `com.nuvio.tv`, version `1.1.0`, version code `1077`.
Original: `../OriginalApps/NuvioTV-1.1.0.apk`.
SHA-256: `a95f94e0bb7da2d0d72e6c93a8dda34bdb4a8bc46c7fa4234834d4c779de1db6`.
The manifest was inspected with SDK aapt; the hash matches the universal APK
asset digest in the official GitHub release `NuvioMedia/NuvioTV`, tag `1.1.0`.

All sixteen public patches now declare exact compatibility with official 1.1.0.
The active contract points to the release original. The native symbols and all
thirteen centralized guarded method fingerprints are unchanged from beta.13.
The GitHub APK updater has seven additional guarded method fingerprints that
changed with the embedded version string; these were reviewed and refreshed.
Its signature, constant-count, mutation-scope and already-patched rejection
checks remain in place. No runtime feature change was needed.
An independent DEX comparison (`CompareUpdater.java` in the evidence directory)
confirms all 23 native updater bodies are identical after normalizing only
`1.1.0-beta.13` to `1.1.0`, including literals, registers and branch offsets.

Dedicated `VerifyNuvio110*` DEX, player, launcher, runtime and packaged-selection
fixtures drive `verifyNuvioLatest`. Historical beta.13 fixtures remain unchanged.
The release bundle version remains assigned by the release workflow.

## Evidence

Use `../Skills/inspection-evidence/.inspect-nuvio-110/` directly.
The restored beta.13 original matches its recorded SHA-256
`306eb6dcb904677000df18448d5cd6a8b4bc6d436eff5984e6ad25e82b6aeecb`;
all five retained beta.13 DEX files were compared byte-for-byte with that APK.
The 1.1.0 DEX fixtures were extracted directly from the release original.

`migration-report.md` compares both original APKs. `inventory.tsv`,
`comparison.json` and `method-differences.txt` record the release inspection:
no inspected class, field or method definitions were added or removed;
31 inspected method bodies changed. Patch hooks retain their reviewed native
contracts. Subtitle defaults and other unrelated upstream changes are preserved.

## Verification

From the repository root, with Java 21 and SDK platform 36:

```powershell
.\build-local.ps1 :patches:buildAndroid :patches:generatePatchesList :patches:verifyNuvioLatest :patches:verifyAndroidBundle :patches:verifyMorpheDesktopImport '-PmorpheDesktopJar=E:/Morphe/morphe-desktop-2.1.1-all.jar' --continue --offline
```

The first compatibility run correctly rejected the updater's stale beta.13
fingerprints. `final-validation.log` records verification after refreshing them.
The packaged verifier applies ten standalone/combined selections and checks DEX
reload, extension/native resolution and unchanged cross-DEX findings.

The full CLI rebuild uses all sixteen patches and checks exact APK compatibility
without `--force`. Its command, result, log and manifest/native-library/alignment
audit are recorded as `date-opacity-all.*` in the evidence directory.

Validation passed on 2026-11-10: Android bundle build, generated patch metadata,
the complete `verifyNuvioLatest` suite, all ten packaged selections, Android
bundle verification and Desktop 2.1.1 import. Actual-APK playback (17 hooks),
GitHub updater, date-color bindings, settings restart/transfer and IntroDB
(five hooks) checks passed in `apk-validation.log`. Its installer audit initially
expected the obsolete `com.nuvio.santodan` clone authority; the audit now checks
the existing `com.nuviotv.santodan` default, and its rerun passed in
`installer-apk-validation.log`. No production identity change was needed.
Cross-DEX verification adds no findings to the original's 36 optional-library
findings. All 108 original native libraries are unchanged and 16-KB alignment
passes. `git diff --check` passed.

The APK audit tasks are `verifyNuvioPlaybackApk`, `verifyNuvioApkUpdates`,
`verifyNuvioUpdateInstaller`, `verifyNuvioDateColorApk`,
`verifyNuvioSettingsTransferApk` and `verifyNuvioIntroDbApk`. Point their
`nuvioPlaybackApk`, `nuvioUpdatesApk`, `nuvioDateColorApk`, `nuvioSettingsApk`
and `nuvioIntroDbApk` Gradle properties at the combined output below, with
`-PnuvioRequireStability=true`. The logs retain the exact invocations.

Bundle: `patches/build/libs/patches-0.17.0.mpp`.
Combined output: `../Apps/NuvioTV/NuvioTV-1.1.0-patches-0.17.0-all-unsigned.apk`.
Bundle SHA-256: `116c48302e036e3bfac01d436331049897e2b8b524ac911fd3861cbf702b3037`.
APK SHA-256: `96637ffa6f81a0511af2b035ef015b7e56902e28fb13c3277b8b4e80fb679272`.
The output is unsigned. No installation or device testing was performed.
Device checks remain for playback/resume, remote focus, native settings editors,
profiles, settings backup/restore, tracking sync, TV channels and APK installation.
