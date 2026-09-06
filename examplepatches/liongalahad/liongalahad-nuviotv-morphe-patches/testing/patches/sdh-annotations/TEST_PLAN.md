# Test plan

Current port results: [0.9.0-beta validation](VALIDATION_0.9.0-beta.md). The historical results below retain their original version scope.

## NuvioTV 0.8.11-beta port evidence — 2026-08-29

- [x] The clean rerun completed 239 extension tests and 543 passing patcher tests out of 544, with zero failures or errors and one intentional patcher skip; debug lint completed with zero errors.
- [x] Remove SDH Annotations applied alone to all four official ABI assets with exact fingerprints and passed in each final seven-patch build.
- [x] The exact final x86_64 APK rendered the `SDH subtitle processing` selector in Morphe Settings on the API 36 `Television_4K` AVD without a fatal exception.
- [ ] Visual cue transformation during real Media3 playback and real Android TV acceptance remain manual release gates.

1. Run extension unit tests covering the fresh normalize-only default, true-Off identity, normalize-only behavior, multiline delimiters, repeated inferred markers, retained spans, cleanup modes, and build the bundle.
2. Apply only `Remove SDH Annotations` independently to the hash-pinned x86_64 and universal APKs.
3. Confirm every structural fingerprint matches exactly once.
4. Inspect the patched manifest for the initialization provider and metadata, and DEX for the injected runtime, native Compose action, and transformer.
5. On `Television_4K`, install the universal-derived output and execute every acceptance item in `patch.json`, including an in-pane visual comparison with Layout/Playback, D-pad navigation, and Media3 playback using an emulator-compatible H.264 source.
6. Verify unknown boundary-token learning with a multiline first block and a one-line second consecutive block, three non-consecutive total blocks, mixed case, straight/curly quote variants, and all four cleanup modes.
7. On `Pixel_10`, validate public-source import, prerelease selection, and exclusive patch selection.
8. Before stable release, repeat installation, persistence, playback, and SDH behavior on a real Android TV and commit a report under `validation/`.

MPV/libass is outside this patch's compatibility claim.

## NuvioTV 0.8.5-beta automated port evidence

- [x] The 198-test extension suite passed with zero failures, errors, or skips.
- [x] This patch applied alone with an exact single match on x86_64, arm64-v8a, armeabi-v7a, and universal official APKs.
- [x] Each isolated output passed SHA-256 input verification plus post-patch manifest, injected-class, and forbidden-type inspection.
- [x] The combined ten-patch x86_64 and universal builds applied without a failed patch and passed APK signature and alignment verification.
- [x] The combined x86_64 side-by-side build installed and launched on `Television_4K`; its process remained alive with no startup `FATAL EXCEPTION`, `VerifyError`, or package ANR.
- [ ] Patch-specific D-pad, persistence, navigation, playback, and media behavior remains manual and is not marked passed by this automated port.
- [ ] Real Android TV acceptance remains pending.

## 2026-08-18 NuvioTV 0.8.5-beta playback regression evidence

- Starting Media3 playback in the first combined port exposed a `VerifyError` in Nuvio's `oa.ac.onCues(CueGroup)` callback. The injected direct-forward cleanup overwrote registers still required by Nuvio's conditional cue reconstruction.
- The hook now rebuilds the direct-forward `CueGroup` only inside the branch where `v0` and `v2..v4` are dead, while the conditional branch continues to clean its reconstructed cue list separately. DEX inspection confirms the two paths no longer share corrupted register types.
- The corrected patch applied alone on x86_64, arm64-v8a, armeabi-v7a and universal. In the final ten-patch x86_64 build, both local H.264 samples entered Media3 playback and kept the process alive with no fatal, `VerifyError` or playback exception.
- The final automated run passed 198 extension tests plus 3 patch tests with zero failures, errors or skips. Real Android TV SDH behavior acceptance remains pending.

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

## 2026-08-23 native-filter arbitration evidence

- The first arbitration hook matched Nuvio's unrelated overlapping-cue merger (`qa.mb.d(List): List`) because the 0.8.7 native SDH filter had changed to a concrete `ArrayList` return. Final-APK DEX inspection located the three native regexes and actual filter at `qa.bd.a(List): ArrayList`; the corrected fingerprint requires that complete structure.
- The bypass now preserves an incoming `ArrayList` or returns a type-safe copy, and its unit test covers both input forms. Final-APK DEX inspection confirms the bypass call is at the actual native filter entry.
- A controlled local H.264/SRT run with Nuvio's `Strip SDH subtitles` enabled and Morphe set to `Normalize music symbols only` rendered `[door closes] Hello.` unchanged. This proves Nuvio's destructive bracket pass is bypassed while Morphe owns processing; the earlier incorrect build rendered `Hello.` for the same combination.
- Nuvio native Off with Morphe Off preserved `[door closes] Hello.`, while Nuvio native On with Morphe Off rendered `Hello.`. MPV/libass remains intentionally owned by Nuvio's switch.
- The Local Storage sidecar row, `Unknown` group, and selected SRT track rendered in the same combined nine-patch run. No app fatal, `VerifyError`, `NoSuchMethodException`, or `ClassNotFoundException` was recorded.
