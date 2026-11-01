# YT-Music personal patches 0.6.1-beta.1

Fix the Library/Search crash in 0.6.0-beta.1 and the unsafe teardown found while investigating the supplied closing-crash logs.

**Library/Search:** generated playlist row adapters now use direct invocation for private native methods. Android had rejected the entire presenter class before lists could render. The expanded compiled audit checks invocation/access rules in injected Google-owned bridges as well as personal classes, and rejects both defective bridges in the unchanged old APK.

**Closing and detach:** effect/browser removal and destruction now run after the current framework traversal. Resource shutdown starts immediately; weak, idempotent disposal preserves native siblings and newly created replacement surfaces. Exact 0.5 and 0.6 source snapshots reproduce the null-child failure in the same modeled traversal; the corrected actual binding passes it. Lyrics and verification WebView cleanup use the shared helper too.

Supports exact original arm64 YouTube Music **9.42.52 / 94252240** and **9.43.51 / 94351240**. Use this Full Collection alone; Shaders and Download playlist remain optional. Jam stays 9.42.52-only. Enable Pre-release patches and Experimental app versions, refresh, review selections and repatch an original APK.

Build/JVM/lint, fourteen two-target APK combinations, two missing-Downloads rejections, catalog/Jam target guards, fourteen expanded compiled feature/access/reference audits and eight native Lyrics audits pass. There are 383 source/harness checks: 23 fresh teardown/old-source checks and 360 retained checks revalidated against unchanged source hashes. The old compiled APK must fail the new access regression; corrected targets must pass. Browser/provider evidence is inherited with matching executable/style/transport sources; only the notice version line changed in web assets.

Phone Library/Search, playlist row updates and closing/reopening/rotation/dialogs still need acceptance. The traversal fixtures simulate Android/WebView/media boundaries; the access audit is structural, not a complete ART verifier. No phone zero-stutter or Samsung appearance claim. No device/MuMu/sign/install/uninstall or real media-download operations.

Existing preferences, source credentials, permanent lyric library, chosen YTDLnis folder and playlist indexes retain their namespaces. Use **Morphe > Miscellaneous > Debugging > Enable debug logging / Export debug logs** for further crashes. No timed capture. Offline playback still uses the separate service; native main-player/Lyrics integration remains unestablished. Raw crash logs and vendor APKs are private and excluded from delivery.
