# Restore Source Selection test plan

## Unit

- [x] Fresh-default On, stored Off, and disabled behavior are covered; Off delegates the player callback and never arms restoration.
- [x] Enabled behavior arms, survives forward-transition recomposition, confirms player entry and consumes one non-first restoration only after normal or error Back.
- [x] The queued viewport request positions the selected row before Nuvio's focus effect and is cleared by its completion callback.
- [x] Player activity without a manual source selection cannot create a restoration.
- [x] First, negative and already-consumed indexes cannot leave stale state.
- [x] Nuvio's native restore flag remains authoritative.
- [x] Malformed preference values fail closed to OFF.
- [x] Labels, Playback category order and synchronous persistence remain patch-owned.

## Isolated application and inspection

- [x] Build the extension and patch bundle with no test failures or TODO markers.
- [x] All three structural fingerprints match exactly once on universal, x86_64, arm64-v8a and armeabi-v7a 0.8.4-beta assets.
- [x] Apply only Restore Source Selection and verify the provider, metadata, runtime classes, preference key and injected methods.
- [x] Confirm the patch adds no permission, activity, service, receiver or source-data persistence.

## TV AVD

1. Install the isolated x86_64 APK and enable Morphe > Playback > Restore source selection.
2. Use an H.264/AVC source. Test a source at index 0, a middle visible row, the last visible row and a row reached after a long scroll.
3. For each, enter the internal player, press Back, and verify the same row is focused and its viewport is visible.
4. Repeat through Ask every time > Internal.
5. Disable the setting and verify Nuvio's original return-to-top behavior.
6. Test addon filters, source reload, a list that grows while loading, an empty/error result, cancelled P2P consent and failed resolution.
7. Open another movie and another episode and verify no restore leaks between routes.
8. Check Settings category bounds, focus rings, text clipping and D-pad order with every Playback patch combination.
9. Check logcat for crashes, ANRs, verifier errors and `SourceSelectionRestore` failures.

## Combined

- [x] Apply all patches to the official universal asset.
- [x] Repeat the internal-player return case with Local Downloads enabled in the same build.
- [ ] Verify Random Episode manual selection, local-file playback, subtitle patches, native ratings controls, and Library focus still behave as documented.
- [x] Inspect package, signature, alignment, manifest, DEX and all universal native ABIs.

## Real Android TV

- [ ] Repeat the enabled and disabled internal-player paths on a real TV.
- [ ] Verify setting persistence after force-stop and reboot.
- [ ] Commit a completed device report before any stable release; unchecked manual items are not passed automatically.

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

- Morphe > Playback rendered `Restore source selection`; its switch toggled twice and returned to its initial state with every other Playback contribution still present.
- A full source-return cycle was not available in the guest profile without a stream addon and remains a separate live-addon acceptance gate.
