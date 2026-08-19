# Test plan

1. Run `LocalSubtitleRuntimeTest` for metadata priority, conservative filename detection, unknown-language fallback, generated row labels, playback language, action-row semantics, and unchanged ordinary addon subtitles.
2. Run the existing SDH removal and marking suites, including local-file content sampling, to prove imported Media3 files preserve both optional patch behaviors.
3. Apply only `Allow Importing Subs from Local Storage` to the hash-pinned x86_64 and universal APKs. Confirm every fingerprint matches exactly once and inspect the provider, picker activity, and injected runtime.
4. Open `Settings > Morphe > Subtitles`. Confirm `Allow Importing Subs from Local Storage` is enabled by default, disabling it removes `Local Storage` from playback, and enabling it restores the section.
5. On `Television_4K`, start an H.264 stream using Media3/ExoPlayer and open the playback subtitle menu. Confirm `Local Storage` appears immediately after `None` and the subtitle style panel remains on the right.
6. Select `Choose subtitle file`; verify Android's document picker opens without a storage-permission prompt and the subtitle overlay remains underneath.
7. Import `Widows.Bay.S01E02.1080p.WEB.h264-GRACE.srt` from device Downloads. Confirm the picker returns to `Local Storage`, immediately inserts and selects the imported row, activates it after playback regains focus, and shows `Unknown language` above the exact filename.
8. Without selecting any built-in or addon subtitle first, confirm only the imported row has a check mark. Restart playback with the saved local choice and open the menu before manually changing tracks; the stale native-language row must remain unticked while the local row owns the only check mark. `Choose subtitle file` must never have one. Return to video and verify cues render on the first activation while playback position, play state, and existing media buffer are preserved. Logs must show Nuvio's sidecar path and no media-item refresh for the imported SRT.
9. Reopen the subtitle overlay. Confirm D-pad focus restores to `Local Storage`, moves normally, and pressing Select does not disable subtitles or jump to `None`. Confirm delay/style controls still work.
10. Exit playback and reopen the same episode. Confirm the local subtitle remains listed, is restored, and is selected without importing it again.
11. Open another episode of the same series, another season, an unrelated series episode, and a movie. Confirm the imported row is absent from every `Local Storage` list. Return to the owning episode and confirm it is still present and active.
12. Import a file with the same source filename for a different movie. Confirm each private copy appears only for its own video and neither replaces the other.
13. Verify the owning content key, selection, and import metadata remain in patch-private preferences, not Nuvio sync or its addon-subtitle preference. Restart the app and repeat the owner/cross-content checks. Simulate seven days of inactivity and confirm a later app start deletes the private file and its selection mapping.
14. With the SDH patches installed, import the `(SDH)` fixture and verify it displays `Unknown language SDH`, not Southern Kurdish. Import the `(eng-hi)` fixture and verify it displays `English SDH`. Confirm enabled removal transforms their cues without changing either source file.
15. Switch to MPV and confirm `Local Storage` is absent. Return to ExoPlayer and confirm it is present.
16. Inspect logs through picker launch, import, first activation, cross-content navigation, seeking, player exit, app restart, and re-entry for crashes, ANRs, verification failures, and fatal exceptions.
17. Before stable release, repeat document-provider compatibility, playback, persistence, ownership isolation, and cleanup checks on a real Android TV and commit a validation report.

## 2026-08-12 follow-up evidence

- Added a regression test for the exact pre-restoration race: after a replacement playback controller clears transient state, the valid patch-private selection makes the local row own the only tick and suppresses the stale English tick before Media3 restoration runs.
- The same test confirms the local track is still returned to Media3's one-time restore path and becomes actively guarded afterward; menu correctness does not prematurely block playback restoration.
- A follow-up controller-lifecycle regression verifies that a released prior controller does not leave transient local state attached to the next player. A second regression verifies that later native reconciliation remains blocked after the local restore has already been handled.
- On the TV AVD, Widow's Bay S1E2 was launched twice. Each launch loaded saved subtitle `v5`, selected `addon=Local lang=!local`, used the buffer-preserving sidecar path, and reached `Sidecar subtitle ready id=und`; neither launch logged a later English selection or native English fallback.
- The complete extension suite passed 133 tests with zero failures, errors or skips, and the final all-eight x86_64/universal bundles applied every patch with no failed patch.

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
