# Test plan

1. Run extension tests covering off/default behavior, English gating, explicit metadata, repeated content evidence, isolated false positives, and suffix idempotence.
2. Apply only `Mark SDH Subtitles` to the hash-pinned x86_64 and universal APKs.
3. Confirm both structural fingerprints match exactly once and inspect the manifest, injected runtime, preference key, and title hooks.
4. On `Television_4K`, verify the native switch, D-pad navigation, persistence, metadata-based embedded/addon marking, delayed background addon marking, and unchanged playback startup.
5. Confirm non-English tracks remain untouched, 19 bracketed annotations remain non-SDH, and music-note lyrics without brackets remain non-SDH.
6. Test the marking and removal patches together and verify both controls appear under one Subtitles compartment.
7. Before stable release, repeat persistence, network timeout, subtitle selection, and playback checks on a real Android TV and commit a validation report.
