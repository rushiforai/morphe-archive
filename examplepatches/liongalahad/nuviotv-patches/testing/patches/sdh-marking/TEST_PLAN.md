# Test plan

1. Run extension tests covering fresh-default On, stored Off behavior, explicit metadata in any language, English-only content scanning, repeated content evidence, isolated false positives, local `file:` sampling, and suffix idempotence.
2. Apply only `Mark SDH Subtitles` to the hash-pinned x86_64 and universal APKs.
3. Confirm all three structural fingerprints match exactly once and inspect the manifest, injected runtime, preference key, and title hooks.
4. On `Television_4K`, verify the native switch, D-pad navigation, persistence, metadata-based embedded/addon marking, delayed background addon marking, and unchanged playback startup.
5. Confirm non-English tracks without explicit markers remain untouched, explicit non-English SDH labels are marked, 19 bracketed annotations remain non-SDH, and music-note lyrics without brackets remain non-SDH.
6. Test marking, removal, and Allow Importing Subs from Local Storage together. Verify a private English local source can be marked and its cues can be stripped while the original file remains unchanged.
7. Before stable release, repeat persistence, network timeout, subtitle selection, and playback checks on a real Android TV and commit a validation report.
