# Test plan

1. Run `LocalSubtitleRuntimeTest` for metadata priority, conservative filename detection, unknown-language fallback, generated row labels, playback language, action-row semantics, and unchanged ordinary addon subtitles.
2. Run the existing SDH removal and marking suites, including local-file content sampling, to prove imported Media3 files preserve both optional patch behaviors.
3. Apply only `Allow Importing Subs from Local Storage` to the hash-pinned x86_64 and universal APKs. Confirm every fingerprint matches exactly once and inspect the provider, picker activity, and injected runtime.
4. Open `Settings > Morphe > Subtitles`. Confirm `Allow Importing Subs from Local Storage` is enabled by default, disabling it removes `Local Storage` from playback, and enabling it restores the section.
5. On `Television_4K`, start an H.264 stream using Media3/ExoPlayer and open the playback subtitle menu. Confirm `Local Storage` appears immediately after `None` and the subtitle style panel remains on the right.
6. Select `Choose subtitle file`; verify Android's document picker opens without a storage-permission prompt and the subtitle overlay remains underneath.
7. Import `Widows.Bay.S01E02.1080p.WEB.h264-GRACE.srt` from device Downloads. Confirm the picker returns to `Local Storage`, immediately inserts and selects the imported row, activates it after playback regains focus, and shows `Unknown language` above the exact filename.
8. Confirm only the imported row has a check mark. `Choose subtitle file` must never have one. Return to video and verify cues render on the first activation while playback position and play state are preserved.
9. Reopen the subtitle overlay. Confirm D-pad focus restores to `Local Storage`, moves normally, and pressing Select does not disable subtitles or jump to `None`. Confirm delay/style controls still work.
10. Exit playback and reopen the same episode. Confirm the local subtitle is restored and selected without importing it again. Open a different episode and confirm it does not inherit that episode-specific selection.
11. Verify selection and import metadata remain in patch-private preferences, not Nuvio sync or its addon-subtitle preference. Simulate seven days of inactivity and confirm a later app start deletes the private file and its selection mapping.
12. With the SDH patches installed, import the `(SDH)` fixture and verify it displays `Unknown language SDH`, not Southern Kurdish. Import the `(eng-hi)` fixture and verify it displays `English SDH`. Confirm enabled removal transforms their cues without changing either source file.
13. Switch to MPV and confirm `Local Storage` is absent. Return to ExoPlayer and confirm it is present.
14. Inspect logs through picker launch, import, first activation, seeking, player exit, and re-entry for crashes, ANRs, verification failures, and fatal exceptions.
15. Before stable release, repeat document-provider compatibility, playback, persistence, and cleanup checks on a real Android TV and commit a validation report.
