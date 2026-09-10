# Local validation — 2026-09-07

**Historical, retired:** the user subsequently reported "It's not working" on
2026-09-07. Offline checks below did not establish runtime success. Referenced
experiment scripts and generated packages have since been removed; this is not
a current rebuild or testing guide. The failure mechanism remains unknown.

Retirement checks: 100 remaining Kotlin/JUnit tests passed; generated catalogs
contain no selectable fovea experiment. Both production helper SHA-256 hashes
are unchanged. Fovea identifiers remain only for stale-resource removal and
regression checks. No headset or user capture files were modified.

This records offline evidence, not a headset result.

- New Android ARM64 helper compiled with NDK r27c, Android API 29, Release,
  OpenXR headers 1.1.43. Native review checked source ownership before release,
  required Android Surface creation fields, EGL/GL validation and continued
  submission when Valve reuses an image.
- `libgxr_asf.so` SHA-256:
  `64cb72dee9ee0906d72578c388a119ac6e599f89bd4f5ac729a604214181f21c`.
- All 104 Kotlin/JUnit tests passed, including exact experimental compatibility,
  renderer guards, helper packaging and mutual exclusion.
- 4 decoded APK audits passed on 5002322: experiment alone; production/experiment
  conflict in both orders; experiment with OLED `srgb8-highp`. Standalone audit
  preserves Valve scene bytes, DEX and startup boundaries.
- Generated package contains `classes.dex`, both required extension resources,
  the new native helper and its manifest. Stable catalog and recommended bundles
  remain unchanged; only all/experimental catalogs gain the new option.
- Capture script syntax and extracted parser checks passed offline for success,
  fallback, permission contamination and missing transfer. Argument forwarding
  was checked with quoted shell arguments. No device was used for these checks.

The normal Gradle plugin `app.morphe.patches:1.3.3` could not resolve in this
workspace. The separately named local test package was built from all current
sources using cached Kotlin 2.3.21/JDK 21, Morphe Desktop 1.13.1's bundled patcher
1.9.0, and Google Maven R8 9.4.17. The older local D8 rejected newer Kotlin
metadata; the final build used R8 9.4.17 without those warnings. This fallback
does not prove compatibility with a particular installed Morphe Manager version.

Artifact: `build/surface-fovea-package/patches-1.14.2-fovea-test.1.mpp`.
Build output: `build/surface-fovea-package/validation.log`.
Rebuild entry point: `extensions/resolution-trace-layer/Build-FoveaTestPackage.ps1`
with `-JavaHome`, optional `-DependencyDirectory` and `-D8Jar`. It expects the
listed local tools, current native resource and decoded fixture APKs; it does not
download dependencies, install APKs or operate a headset.

No APK was installed. Resolution parity, Surface projection acceptance, alpha
seams, orientation, pose/content timing and performance remain unverified.
The subsequent user-run A/B was reported unsuccessful; the capture script is now removed.
