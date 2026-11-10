# v1.10.6-dev.7 — Release-readiness validation (development only)

- Remove the extra “現在：XXX”/“Current: XXX” line from the combined tab-bar button setting; preserve its one-paragraph explanation and the selected checkboxes in the dialog
- Preserve the v1.10.6-dev.6 in-place ranking period refresh and the v1.10.6-dev.5 tab-management/popup-playback changes
- Re-run the complete GitHub Actions build/test matrix: ranking identity, popup tap/seek/drag, gestures, cache, playlists, comments, audio focus, download, UI text/setting order, Android manifest, workflow lockfile, and final MPP/DEX/source parity
- Add a release-readiness audit on the 30 current helper Java sources: network destination/cleartext/unsafe execution checks; activity lifecycle and pending-job guards; tab management, ranking, popup and gesture regression invariants
- Analyze code and logs for build deprecations, thread races and security/performance risks. This is a bounded static analysis, not an emulator test or formal security proof
- User has confirmed the previous dev.6 build works on their test device; Android 9/14/16 multi-device testing is not yet demonstrated for this build
- No changes to `main`, tags, release notes or GitHub Issues without separate release approval
