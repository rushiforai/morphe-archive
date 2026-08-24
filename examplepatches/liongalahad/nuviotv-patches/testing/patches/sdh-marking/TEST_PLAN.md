# Test plan

1. Run extension tests covering fresh-default On, stored Off behavior, explicit metadata in any language, English-only content scanning, repeated content evidence, isolated false positives, local `file:` sampling, and suffix idempotence.
2. Apply only `Mark SDH Subtitles` to the hash-pinned x86_64 and universal APKs.
3. Confirm all three structural fingerprints match exactly once and inspect the manifest, injected runtime, preference key, and title hooks.
4. On `Television_4K`, verify the native switch, D-pad navigation, persistence, metadata-based embedded/addon marking, delayed background addon marking, and unchanged playback startup.
5. Confirm non-English tracks without explicit markers remain untouched, explicit non-English SDH labels are marked, 19 bracketed annotations remain non-SDH, and music-note lyrics without brackets remain non-SDH.
6. Test marking, removal, and Allow Importing Subs from Local Storage together. Verify a private English local source can be marked and its cues can be stripped while the original file remains unchanged.
7. Before stable release, repeat persistence, network timeout, subtitle selection, and playback checks on a real Android TV and commit a validation report.

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

- Morphe > Subtitles rendered `Mark SDH subtitles` beside the cleanup selector. The switch toggled twice and returned to its initial state without a fatal or reflection error.
- The patch-owned refresh state now resolves Nuvio's mutable-state factory by signature, matching the verified 0.8.7 Compose runtime shape.
