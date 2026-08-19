# Test plan

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
