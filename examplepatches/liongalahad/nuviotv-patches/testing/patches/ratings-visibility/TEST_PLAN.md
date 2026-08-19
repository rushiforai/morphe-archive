# Rating Visibility test plan

- [x] Unit tests cover defaults, all stored modes, malformed values, and watched/unwatched decisions.
- [x] Every fingerprint matches exactly once on every declared official asset.
- [x] Exclusive patch application succeeds for universal, x86_64, arm64-v8a, and armeabi-v7a.
- [x] Post-patch manifest and DEX inspection find only the Ratings category registration and required hooks.
- [ ] TV AVD verifies menu hierarchy, D-pad focus order, selection feedback, force-stop persistence, and reboot persistence.
- [ ] TV AVD verifies Overall Show/Hide on classic, grid, modern, carousel, collection, and Detail surfaces.
- [ ] TV AVD verifies Episode Show/Hide/Hide Unwatched on episode cards and the Ratings tab.
- [ ] TV AVD verifies MDBList provider precedence and checks crash, ANR, VerifyError, and fatal logs.
- [ ] Real Android TV acceptance evidence is committed before a stable release.

## NuvioTV 0.8.5-beta automated port evidence

- [x] The 198-test extension suite passed with zero failures, errors, or skips.
- [x] This patch applied alone with an exact single match on x86_64, arm64-v8a, armeabi-v7a, and universal official APKs.
- [x] Each isolated output passed SHA-256 input verification plus post-patch manifest, injected-class, and forbidden-type inspection.
- [x] The combined ten-patch x86_64 and universal builds applied without a failed patch and passed APK signature and alignment verification.
- [x] The combined x86_64 side-by-side build installed and launched on `Television_4K`; its process remained alive with no startup `FATAL EXCEPTION`, `VerifyError`, or package ANR.
- [ ] Patch-specific D-pad, persistence, navigation, playback, and media behavior remains manual and is not marked passed by this automated port.
- [ ] Real Android TV acceptance remains pending.

## 2026-08-19 NuvioTV 0.8.6-beta port evidence

- [x] The final 198-test extension suite and three patcher manifest tests passed with zero failures, errors, or skips.
- [x] This patch applied alone on the official x86_64, arm64-v8a, armeabi-v7a, and universal APKs with no fingerprint, rebuild, signing, manifest, injected-class, or forbidden-type inspection failure.
- [x] The final combined x86_64 and universal builds applied all ten patches with zero failures and passed APK alignment plus v2/v3 signature verification.
- [x] The final x86_64 side-by-side build installed on `Television_4K`; Morphe settings, Library Saved/Cloud/Storage, H.264 Media3 playback, and end-of-file return to Storage completed without an app fatal, `VerifyError`, or package ANR.
- [ ] Patch-specific external-service, removable-storage, network, source-selection, subtitle-content, and real-TV behavior remains manual unless separately recorded above.
