# Random Episode test plan

## NuvioTV 0.8.11-beta port evidence — 2026-08-29

- [x] The clean rerun completed 239 extension tests and 543 passing patcher tests out of 544, with zero failures or errors and one intentional patcher skip; debug lint completed with zero errors.
- [x] Random Episode applied alone to all four official ABI assets with exact fingerprints and passed in each final seven-patch build.
- [x] The exact final x86_64 APK rendered the Detail Page category and `Show Random Episode Button` switch on the API 36 `Television_4K` AVD without a fatal exception.
- [ ] Live-catalog selection, playback, history/scrobble isolation, persistence, and real Android TV acceptance remain manual release gates.

- [x] Unit tests cover fresh-default On, stored Off persistence, eligible filtering, future and malformed dates, current-episode exclusion, route immutability and random-session clearing.
- [x] Every fingerprint matches exactly once on universal, x86_64, arm64-v8a and armeabi-v7a 0.8.4 APKs.
- [x] Exclusive patch application and manifest/DEX inspection pass on all declared assets.
- [x] Combined application passes with Remove SDH Annotations and Mark SDH Subtitles.
- [ ] TV AVD verifies the Detail Page and Subtitles categories in all collapsed/expanded combinations.
- [ ] TV AVD verifies OFF/ON series appearance, D-pad order, click, long press, source selection, H.264/AVC playback, seeking and error return; unit tests verify movie, special and future-episode exclusion.
- [ ] TV AVD verifies random Next Episode does not repeat the current episode when alternatives exist.
- [ ] TV AVD verifies no local progress write, remote progress mutation, tracking scrobble or resume seek during random playback.
- [ ] TV AVD verifies normal playback immediately before and after random playback remains unchanged.
- [ ] Toggle persistence passes after force-stop and reboot.
- [ ] Real Android TV acceptance evidence is recorded before stable release.

## 2026-08-07 AVD evidence

- Final combined x86_64 build includes Random Episode, Remove SDH Annotations and Mark SDH Subtitles.
- Twenty consecutive `Friends` selections produced twenty distinct episodes across seasons 2, 3, 4, 6, 7, 8, 9 and 10, with no season-zero selection.
- The long-press dialog displayed `S3 E6`; source requests used `tt0108778:3:6`.
- `Friends` `S3 E6` played and sought successfully with an AVC source. Simkl diagnostics retained `media=none` and skipped start/pause scrobbles.
- Natural completion proposed random `S7 E24` instead of sequential `S3 E7`; confirmation requested `tt0108778:7:24`.
- Returning home did not add `Friends` to Continue Watching and preserved the existing Cape Fear entry at `55m Left`.
- Recomposition stress covered 50 horizontal focus changes, eight long-press open/dismiss cycles and repeated vertical detail-page focus changes without a crash.
- Full emulator reboot preserved the enabled setting and the series shuffle action.

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

## 2026-08-22 NuvioTV 0.8.7-beta port evidence

- [x] The final 195-test extension suite and three patcher manifest tests passed with zero failures, errors, or skips.
- [x] This patch applied alone on the official x86_64, arm64-v8a, armeabi-v7a, and universal APKs with no fingerprint, rebuild, signing, manifest, injected-class, or forbidden-type inspection failure.
- [x] The final combined x86_64 build applied all nine retained patches with zero failures and passed APK alignment plus signature verification.
- [x] The final x86_64 side-by-side build installed on `Television_4K`; Morphe Settings opened, native category and switch rows rendered, and the Local Downloads slider rendered with no app fatal, `VerifyError`, or reflection failure.
- [ ] Patch-specific playback, network, storage, subtitle-content, source-selection, D-pad, and real-TV behavior remains manual unless separately recorded above.

## 2026-08-23 0.8.7 runtime evidence

- A 0.8.7 series detail page rendered the injected `Play random episode` action alongside Nuvio's native actions. Activating the focused action entered the native playback route and produced no fatal, verifier, missing-method, or missing-class error.
- Deterministic season/episode candidate selection remains covered by focused unit tests; addon-backed stream resolution was not available in the guest emulator profile.
