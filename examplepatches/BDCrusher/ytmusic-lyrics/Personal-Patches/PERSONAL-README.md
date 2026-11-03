# Verified correction — 0.8.0-beta.2

Fixes the **Library VerifyError introduced in 0.8.0-beta.1**. The native content bridge now has separate typed ViewGroup and explicit null returns, with safe fallback for missing/non-container content. Existing Audio/Video downloads, playlist routing and native-player integration are retained; files, lyrics, settings, credentials and chosen-folder grants are unchanged.

Exact experimental original arm64-v8a Music **9.42.52/94252240** and **9.43.51/94351240**, minSDK26. Full Collection only; Shaders and Download playlist optional. In-app playlist batching requires Downloads plus Download playlist. Jam remains 9.42.52-only. Do not combine complete collections. MPP SHA256 `4c1c23dcb54be422c31b88cd9b4bcb16664688a98fb86903a47a33f2d6c0fe34`.

Build/JVM/lint, **8 positive configurations**, **2 missing-Downloads rejections**, catalog/Jam guards and **8 compiled audit groups** pass. New control-flow/register-type analysis reproduces beta.1's bad reference return on both targets and checks all selected bridge returns in the corrected outputs. Four actual-DEX content fixtures per output cover absent root, missing/wrong content and valid container. This is scoped desktop analysis, not complete ART verification.

**820 source/harness checks: 39 fresh normal-logger checks, 781 inherited after exact source-hash validation.** Other production files match beta.1 except the bridge, version, logger version and notice version. Existing renderer/retrieval/playback fixture evidence is inherited rather than described as fresh device testing.

Reopening Library on the Samsung phone remains required acceptance. Native playback/decoder/queue, Audio/Video switching, offline actions, sheet/Downloads appearance, Samsung navigation, Shaders and recording-free lyric smoothness remain phone checks. The approved matching-component catalogue stays inside Library Downloads; the stock offline database is untouched. No MuMu/device, signing, installation, actual media downloading or cleanup operations occurred.

Refresh the beta source with Pre-release patches and Experimental app versions enabled and **repatch a supported original APK**. Refreshing the feed alone does not fix an installed APK. The playlist-header download button uses your configured mode: In-app shows one Audio/Video sheet for the batch; External sends the playlist URL to the selected app; Default retains native handling. Enable Download playlist during patch selection for in-app batching, not as an extra per-download menu step. Existing Enable debug logging / Export debug logs remains available without a timer.

GitHub publication is pending. Exact local evidence: Verification/revision45/source-freeze.json, matrix.log, audits.log, released-regression-final.log and dist verification.json. Read Research/LIBRARY-VERIFIER-FIX-0.8.0-BETA.2-2026-11-02.md and Verification/revision45/WORK.md. Existing published source is 8e9fa3a905d34a01dd3adb2cc1e29341fbcbe027; dev feed d8b6e5f7890a4563a40637cf9aad5b2bfa02df43. Preserve that history. Toolkit runs in place. Never rerun completed staging/publication helpers or push private Personal-Patches history. Scratch is retained and regenerable; no cleanup authorized.

## Earlier records

# Published — 0.8.0-beta.1

[0.8.0-beta.1](https://github.com/BDCrusher/ytmusic-lyrics/releases/tag/v0.8.0-beta.1) is the combined native-download update. It fixes the playlist-header receiver and invalid-owner poisoning, adds the YouTube-style Audio/Video quality sheet, preserves separate remembered choices, and routes downloaded entries through the native watch command and player. Shared progress, inline downloaded icons, durable range recovery, atomic metadata/artwork writes and typed batch migration are included. Saved media is preferred while online metadata and native authorization handling remain intact. No user-facing path starts the separate offline player.

Owned downloads appear inside Library > Downloads using the approved matching-component fallback within the native destination. Native provider/catalogue and offline-browse contracts were inspected; the stock offline database is untouched. Existing audio files, artwork, playlists, lyrics, settings, credentials and read-only chosen-folder grants are preserved.

Toolkit verified 11 public assets and 7684 source files. Source `8e9fa3a905d34a01dd3adb2cc1e29341fbcbe027`; dev feed `d8b6e5f7890a4563a40637cf9aad5b2bfa02df43`. MPP SHA256 `295e7be5d92ce91d5064b75d30e9c6cd1067ff5f4fd18c78d872b1fe880d0101`. Publication receipt: Verification/publication/v0.8.0-beta.1/publication-result.json. Release files: Personal-Patches/dist/0.8.0-beta.1. Published history is preserved; shared Toolkit ran in place.

Exact experimental originals: arm64 Music 9.42.52/94252240 and 9.43.51/94351240, minSDK26. Full Collection only; Shaders and Download playlist remain optional. In-app playlist batches require Downloads plus Download playlist. Jam remains 9.42.52-only. Settings: Morphe > Player > Downloads; choose In-app for the quality sheet, or External for the existing selected application. Refresh with Pre-release patches and Experimental app versions enabled, then repatch a supported original APK.

Final build/JVM/lint, 12 positive configurations, 2 missing-Downloads rejections, catalog/Jam guards, payload isolation and all 7 compiled audits pass. 820 source/harness checks comprise 549 fresh checks and 271 inherited checks with matching source hashes. The new receiver audit reproduces the previous release's defect on both targets. Fixtures simulate Android/codec/authenticated transport/launch boundaries; final DEX separately verifies concrete hooks, receiver aliases, references and access. Source freeze r3 and final build r4 are authoritative; earlier candidates are intermediate evidence.

Phone acceptance remains open: actual native playback/decoder/queue, Audio/Video switching, sheet and Downloads appearance/insets, offline action availability, Samsung navigation, Shaders and recording-free Lyrics smoothness. No physical-device verification, universal zero-stutter or pixel-parity claim. MuMu, devices, signing, installation and real media downloads were untouched. Existing Enable debug logging / Export debug logs remains the diagnostics path, without a timer.

Read Research/NATIVE-DOWNLOADS-0.8.0-BETA.1-2026-11-02.md, dist verification.json and Verification/revision44/WORK.md. Scratch is retained and inventoried in Verification/revision44/retained-scratch.json; no cleanup was authorized. Never rerun completed staging/publication or push private Personal-Patches history.

## Earlier records

# Verified source — 0.8.0-beta.1

Combined native-download update is verified locally; GitHub publication is pending. Full Collection only, with optional Shaders and Download playlist. Original arm64 Music 9.42.52/94252240 and 9.43.51/94351240, minSDK26. Jam remains 9.42.52-only. MPP SHA256 `295e7be5d92ce91d5064b75d30e9c6cd1067ff5f4fd18c78d872b1fe880d0101`. Dist: Personal-Patches/dist/0.8.0-beta.1.

Fixes the themed header's clobbered receiver and invalid-owner poisoning. Adds the Audio/Video quality sheet, native-watch playback, owned catalogue inside Library Downloads, shared row/notification progress, durable range recovery, atomic metadata/cover writes and typed batch migration. Saved audio retains online video choices; native authorization rejection is preserved. No separate offline player is started. Native provider/database contracts were inspected; the approved matching-component fallback is used inside the native destination. Existing files, preferences, lyrics, credentials and folder grants remain.

Build/JVM/lint, 12 positive configurations, 2 missing-Downloads rejections, catalog/Jam guards, payload isolation and compiled feature/reference/access/Lyrics/media/settings/context/receiver audits pass. 820 source/harness checks: 549 fresh, 271 inherited after source-hash validation. The receiver audit reproduces the previous release's defect on both targets. Platform, codec, authenticated transport and launch seams are simulated in source fixtures; actual adapters are audited in final DEX.

Phone appearance, actual decoding/Audio-Video switching, native player/queue/insets and offline network-action states remain acceptance checks. Existing Shaders/Samsung navigation and recording-free Lyrics smoothness remain device checks. No universal zero-stutter or pixel-parity claim. No MuMu, signing/install/uninstall, real media downloads or cleanup.

Settings: Morphe > Player > Downloads > In-app for the quality sheet; External uses the existing selected app. Enable Download playlist for batches. Library > Downloads uses the integrated destination. Keep the existing Enable debug logging / Export debug logs; no timer. After publication, refresh with Pre-release patches and Experimental app versions enabled and repatch an original APK.

Authoritative evidence: Verification/revision44/source-freeze-r3.json, matrix-plan-r3.json, matrix-final-r3.log, audits-final-r3.log and dist verification.json. Earlier runs are intermediate only. Read Research/NATIVE-DOWNLOADS-0.8.0-BETA.1-2026-11-02.md and Verification/revision44/WORK.md. Never rerun completed staging/publication helpers or push private Personal-Patches history. Toolkit runs in place; private inputs/raw phone logs stay private. Publication receipt will be Verification/publication/v0.8.0-beta.1/publication-result.json.

## Earlier records

# Published — 0.7.0-beta.5

[0.7.0-beta.5](https://github.com/BDCrusher/ytmusic-lyrics/releases/tag/v0.7.0-beta.5) fixes absent-tag download identity routing. Downloads binds to native action-bar/header roots and current native model identities, decodes escaped playlist entity keys, scopes flyout identity to its window/session and captures immutable click targets before worker dispatch. Delayed clicks retain their item after track/page rebinding. Internal commands from the same menu opener preserve its session; a different main-window control invalidates it. Unsupported/ambiguous identities remain explicit errors. Default preserves native eligibility handling. Existing In-app/External settings and data remain.

Toolkit verified 11 public assets and 7658 source files. Source `b14464781377d34f3d395bee1e330e403d03aa28`; dev feed `22384155595e3145bae2a0d76159bc12530707b1`. MPP SHA256 `47748e5dbcfeefd545823591a93f71dd5cca70ffa8b64c429e4263c534edb7c8`. Receipt Verification/publication/v0.7.0-beta.5/publication-result.json. Published history preserved; shared Toolkit runs in place.

Original arm64 Music 9.42.52/94252240 and 9.43.51/94351240, minSDK26. Full Collection only; Shaders and Download playlist optional. In-app playlist batches require Downloads and Download playlist. External playlist handoff does not require personal Lyrics or the batching patch. Jam stays 9.42.52-only. Settings: Morphe > Player > Downloads. Refresh with Pre-release patches/Experimental app versions enabled, then repatch an original supported APK.

Build/JVM/lint, six final positive selections, two missing-Downloads rejections, catalog/Jam guard, compiled feature/access/reference, native Lyrics, media/settings/tag and new owner/dispatcher audits pass. 656 source/harness checks: 129 fresh, 527 inherited after named source hashes match. Published beta.4 reproduces both no-tag failures. Source fixtures simulate platform/native getter and download/app-launch seams; concrete hooks are separately checked in target DEX. Browser/provider evidence is inherited with unchanged sources.

Phone click ownership and prompt/handoff appearance remain acceptance checks, along with existing native decoder/queue/SAF, graphics/navigation and recording-free lyric behavior. No universal button or zero-stutter claim. No devices/MuMu/sign/install/uninstall, actual media downloads or cleanup. Existing preferences, files, credentials, lyric storage and chosen-folder grants preserved. Existing Enable debug logging / Export debug logs; no timer. Raw phone logs/vendor fixtures remain private.

Final evidence uses source-freeze-r3, matrix-plan-r3, matrix-final-r3, audits-final-r3 and downloads-final-r3. Earlier candidate directories remain intermediate evidence. See Research/DOWNLOAD-OWNER-CONTEXT-0.7.0-BETA.5-2026-11-01.md and dist verification.json. Scratch remains retained and inventoried; no cleanup authorized. Never rerun completed staging/publication or push private Personal-Patches history.

## Earlier records

# Verified source — 0.7.0-beta.5

Download identity correction is complete locally. Native action-bar/header owners, typed playlist entity decoding, scoped popup sessions and immutable pre-worker click identity replace the absent-tag dependency. Row recordings win over associated parent playlists; a verified header owner preserves whole-playlist identity. No global playing-song substitution. Default eligibility behavior, selected downloader modes, preferences and files are preserved.

MPP SHA256 47748e5dbcfeefd545823591a93f71dd5cca70ffa8b64c429e4263c534edb7c8. Dist: Personal-Patches/dist/0.7.0-beta.5. Exact original arm64 Music 9.42.52/94252240 and 9.43.51/94351240. Full Collection only; Shaders/Download playlist optional, In-app playlist batches require Downloads+Download playlist. Jam stays 9.42.52-only.

Build/JVM/lint; six positive/two missing-Downloads selections; catalog/Jam guards; feature/access/reference, Lyrics, media/settings/tag and owner/dispatcher DEX audits PASS. 656 source checks: 129 fresh, 527 inherited by source hashes. Source fixtures simulate Android/native getters/app-launch/download seams. No actual device/real media downloads/sign/install/MuMu/cleanup. Phone identity ownership and prompt/handoff acceptance remain unverified. Existing graphics/navigation/recording-free lyric and offline-codec limitations remain; no universal button or zero-stutter claim.

Use only -r3 final evidence under Verification/revision43. Final staging completed; publication still pending Verification/publication/v0.7.0-beta.5/publication-result.json. Do not rerun completed staging or push private Git history. Toolkit runs in place. Source/archive/release preparation and existing authorized GitHub update follow now. Read Research/DOWNLOAD-OWNER-CONTEXT-0.7.0-BETA.5-2026-11-01.md.

## Earlier records

# Published - 0.7.0-beta.4

[0.7.0-beta.4](https://github.com/BDCrusher/ytmusic-lyrics/releases/tag/v0.7.0-beta.4) adds the missing empty client-generated download-action context path exposed by the phone log. APK-selected native recording/playlist ID getters resolve tagged click objects through two owned adapters, without reflection or Now Playing substitution. External playlist actions preserve folder/batch tracking. Row recordings win over surrounding playlists; explicit raw 11-character recording IDs, including PL-prefixed IDs, remain recordings.

Selected In-app/External mode now reports unresolved identity explicitly with bounded normal-debug mode/tag/sender information instead of silently labeling it a playlist and showing Premium. Default preserves native account/eligibility behavior. Beta.3 quality/storage fixes remain. Existing data, preferences, credentials, offsets, permanent lyrics, downloaded music and chosen-folder grants remain untouched.

Toolkit verified 11 release assets and 7647 source files. Source `ae3558ba88f088df89c052e2eb9c5e5004f43b25`; dev feed `78ced8dfe9192c12730251ff27b70424c9b13f85`. MPP SHA256 `602ba90508e1d520bf79075a4dee62a8fb450efe225a3beffe846022b1538058`. Receipt Verification/publication/v0.7.0-beta.4/publication-result.json. Published history preserved; Toolkit runs in place, no global copies.

Exact original arm64 Music 9.42.52/94252240 and 9.43.51/94351240, minSDK26. Full Collection alone; optional Shaders and Download playlist. In-app playlists require Downloads and Download playlist. Jam remains 9.42.52-only. Enable prerelease/experimental versions, refresh and repatch an original APK. Morphe > Player > Downloads: In-app for the prompt, External for the selected-app review flow. Existing Enable debug logging / Export debug logs, no timer.

Build/JVM/lint, six final positive configurations on both targets, two missing-Downloads rejections, catalog/Jam guards, six feature/access/reference audits, four native Lyrics audits, six media audits, six settings audits and six new native-context audits pass. 615 source/harness checks: 137 fresh, 478 inherited by exact source hashes. Exact previous published source reproduces the empty-action native fallback. The two APK-installed getter bodies are simulated at only those fixture seams, then replaced/access-checked in actual target DEX. Browser/provider evidence inherited with unchanged executable code, NOTICE version separately reviewed.

Real phone tag types, handoff/prompt appearance, native decoder/queue/SAF, Samsung graphics/navigation and recording-free lyrics remain acceptance checks. Unsupported identities report their unresolved state; no all-client-tag or zero-stutter claim. No devices/MuMu/sign/install/uninstall, real media downloads or cleanup. Raw phone logs/vendor inputs remain private. Existing format/metadata/SponsorBlock sidecar limitations remain.

Final evidence is review2 (-r2), source-freeze-r2 and matrix-final-r2; the earlier candidate is intermediate only. Read Research/EMPTY-DOWNLOAD-ACTIONS-0.7.0-BETA.4-2026-11-01.md and dist verification.json. Regenerable scratch retained in Verification/revision42/retained-scratch.json; no cleanup authorized. Never rerun completed staging/publication or push private Personal-Patches history.

## Earlier records

# Verified source - 0.7.0-beta.4

Final local verification complete. Publication pending Verification/publication/v0.7.0-beta.4/publication-result.json. MPP SHA256 602ba90508e1d520bf79075a4dee62a8fb450efe225a3beffe846022b1538058. Prior distributions/history/raw phone inputs preserved.

Exact original arm64-v8a Music **9.42.52/94252240** and **9.43.51/94351240**, minSDK26. Full Collection alone; Shaders and Download playlist optional. In-app playlists require Downloads and Download playlist. Jam remains 9.42.52-only. MPP SHA256 `602ba90508e1d520bf79075a4dee62a8fb450efe225a3beffe846022b1538058`.

Adds the client-generated empty download-action path shown in the phone log. APK-selected native context getters resolve the clicked recording/playlist without reflection or Now Playing substitution. External playlist context retains folder/batch tracking. Selected In-app/External mode gets explicit unresolved-identity feedback and bounded normal-debug diagnostics instead of silent Premium fallthrough. Default account/eligibility behavior stays native. Beta.3 quality/storage fixes remain.

Build/JVM/lint, six positive two-target configurations, two missing-Downloads rejections, catalog/Jam guards, six feature/reference/access audits, four native Lyrics audits, six media audits, six settings audits and six new native-context audits pass. 615 source/harness checks:137 fresh,478 inherited after source-hash validation. The exact previous published source reproduces return-to-native for the empty action; two native getter factory seams are simulated only in the source fixture and replaced/audited in compiled APKs. Browser/provider evidence inherited from unchanged code, NOTICE version reviewed separately.

Actual phone tag types, handoff/prompt appearance, native decoding/queue/SAF, Samsung graphics/navigation and recording-free lyrics remain phone acceptance. Unsupported identities report their unresolved state; no all-client-tag or zero-stutter guarantee. No devices/MuMu/sign/install/uninstall, actual media downloads or cleanup. Existing data/preferences/credentials/permanent lyrics/downloaded music/folder grants preserved.

Refresh with prerelease/experimental versions enabled and repatch an original APK. Morphe > Player > Downloads: choose In-app for the audio prompt or External for the selected app. Existing Enable debug logging / Export debug logs, no timer. Shared Toolkit in place; no global copies. Raw phone logs/vendor inputs remain private.


Read Verification/revision42/WORK.md and Research/EMPTY-DOWNLOAD-ACTIONS-0.7.0-BETA.4-2026-11-01.md. Final evidence is review2 (-r2); the earlier candidate is intermediate only. Never rerun completed staging/publication or push private Personal-Patches history.

## Earlier records

# Published - 0.7.0-beta.3

[0.7.0-beta.3](https://github.com/BDCrusher/ytmusic-lyrics/releases/tag/v0.7.0-beta.3) fixes native song/playlist download commands falling through to the Premium sheet in External/In-app mode, unreadable quality-dialog labels and Downloads storage measurement/bar presentation. The typed route uses the exact encoded identity and existing selected mode/app, consumes duplicates and dispatches UI on the main thread. No Now Playing fallback for playlists. Default native account/eligibility behavior is preserved.

Storage shows actual owned audio, covers, metadata/chapters/preferences, temporary files and available device space, with colored segments, legends and accessible callouts. External files remain read-only and excluded from owned totals. Existing data, source credentials, offsets, permanent lyrics, folder grants and downloaded music remain.

Toolkit verified 11 release assets and 7637 source files. Source `1727b985935ffda89391ab81eef8bb04142db575`; dev feed `d4e586e7795ba91c9deb3cec55a47cd34799432a`. MPP SHA256 `c298383cc34395f32635b5c6be5ef7110f5719e4ab6b404129b7192e3dd9edd3`. Receipt Verification/publication/v0.7.0-beta.3/publication-result.json. Published history retained; shared Toolkit run in place, no global copies.

Exact original arm64 Music 9.42.52/94252240 and 9.43.51/94351240, minSDK26. Full Collection alone; optional Shaders and Download playlist. In-app playlist batches require Downloads and Download playlist. Jam remains 9.42.52-only. Enable Pre-release patches and Experimental app versions, refresh, review selections and repatch an original APK.

Build/JVM/lint, six fresh positive configurations on both targets, two expected missing-Downloads rejections, catalog/Jam guards, six feature/access/reference audits, four native Lyrics audits, six native media audits and six new download/settings audits pass. 578 source/harness checks: 100 fresh, 478 inherited after exact source hashes match. Browser/provider evidence inherited from unchanged sources, NOTICE version separately reviewed. Previous 14-case matrix belongs to beta.2 only.

Actual phone button handoff, native offline decoding/queue/SAF, Samsung appearance, shader/video and recording-free lyric smoothness remain acceptance requirements. No zero-stutter claim. No devices/MuMu/sign/install/uninstall, real media downloads or cleanup. Existing native offline/external format/metadata and SponsorBlock sidecar limitations remain. Settings: Morphe > Player > Downloads; Playlist downloads; Shaders. Existing Enable debug logging / Export debug logs, no timer.

Read Research/DOWNLOAD-ROUTING-AND-SETTINGS-0.7.0-BETA.3-2026-11-01.md, dist verification.json and Verification/revision41/WORK.md. Retained regenerable scratch is inventoried in Verification/revision41/retained-scratch.json; no cleanup authorized. Never rerun completed staging/publication recipes or push private Personal-Patches history.

## Earlier records

# Verified source - 0.7.0-beta.3

Final local verification complete. Publication pending Verification/publication/v0.7.0-beta.3/publication-result.json. MPP SHA256 c298383cc34395f32635b5c6be5ef7110f5719e4ab6b404129b7192e3dd9edd3. Prior distributions and published history remain unchanged.

Exact original arm64-v8a Music **9.42.52/94252240** and **9.43.51/94351240**, minSDK26. Full Collection alone; Shaders and Download playlist optional. In-app playlist batches require Download playlist and Downloads. Jam remains9.42.52-only. MPP SHA256 `c298383cc34395f32635b5c6be5ef7110f5719e4ab6b404129b7192e3dd9edd3`.

Routes the native encoded song/playlist download command through the existing selected In-app/External mode without a label or Now Playing fallback. Default account/eligibility handling remains native. Worker dispatch opens UI on the main thread. Quality choice labels use the host foreground. Storage shows actual owned bytes and free space from an existing volume, with colored segments, legends and accessible callouts. No source credentials, files, permanent lyrics or settings are cleared.

Build/JVM/lint, six positive configurations on both exact targets, two missing-Downloads rejections, catalog/Jam guards, six feature/reference/access audits, four native Lyrics audits, six native media audits and six new download/settings audits pass. 578 source/harness checks:100 fresh,478 inherited only after source-hash validation. Browser/provider evidence is inherited from unchanged code, with NOTICE version reviewed separately. Previous14-case matrix applies only to beta.2.

Real Samsung appearance, actual app handoff, native decoder/queue/SAF, shaders/video, recording-free lyric smoothness and Recents timing remain phone acceptance. No devices, signing/install/uninstall, real media downloads or cleanup. No zero-stutter claim. Existing offline-format/metadata and SponsorBlock sidecar limitations remain in verification.json.

Refresh the existing source with Pre-release patches and Experimental app versions enabled, review selections and repatch an original APK. Settings: Morphe > Player > Downloads; Playlist downloads for batches/folder; Shaders for effects. Existing Enable debug logging / Export debug logs, no timer. Toolkit used in place; no globals copied.


See Verification/revision41/WORK.md and Research/DOWNLOAD-ROUTING-AND-SETTINGS-0.7.0-BETA.3-2026-11-01.md. Never rerun completed staging/publication recipes or push private Personal-Patches history.

## Earlier records

# Published - 0.7.0-beta.2

[0.7.0-beta.2](https://github.com/BDCrusher/ytmusic-lyrics/releases/tag/v0.7.0-beta.2) delivers the themed Opus quality/estimated-size/remember sheet, original-playlist native offline byte/metadata adapters, supported read-only YTDLnis files, native subtitle download states, storage totals and SponsorBlock sidecars. Shaders follow visible main-player and full Lyrics-sheet ownership, preserve header interactions, fit complete animated covers and limit expensive frame readbacks. The actual foreground sheet extends behind transparent navigation. Saved recordings retain native player configuration; closing/detaching the download sheet cancels its preview.

Toolkit verified 11 public assets, 7628 exact source files and dev feed. Source `94c2f909884dc9c9af3034a80efe8661072e7734`; feed `a08cb63079ad8d4f8d84502cc0404eedbfbc1053`. MPP SHA256 `1e18816198dbb6a57257b3cc489b83c13e2205c90c845148ed0b2eaf377abf39`. Receipt Verification/publication/v0.7.0-beta.2/publication-result.json. Published history retained; shared Toolkit run in place, no global copies.

Exact original arm64 Music 9.42.52/94252240 and 9.43.51/94351240, minSDK26. Full Collection alone; Shaders and Download playlist optional. Download playlist requires Downloads. Jam remains 9.42.52-only. Enable Pre-release patches and Experimental app versions, refresh, review selections and repatch an original APK. Existing preferences, source credentials, offsets, permanent lyrics and chosen-folder grants remain.

Build/JVM/lint, 14 positive APK configurations, 2 missing-Downloads rejections, catalog/Jam guards, 14 feature/access/reference audits, 8 native Lyrics audits and 14 native media/download/artwork audits pass. 527 source/harness checks: 320 fresh, 207 inherited only after exact source hashes match. Browser/provider evidence is inherited with unchanged executable sources; NOTICE version separately reviewed. No device/MuMu/sign/install/uninstall, real media downloads or cleanup.

Native decoder/queue/SAF behavior, real Samsung three-button/gesture transparency, visible graphics/video, recording-free stutter and Recents timing remain phone acceptance. External indexing must finish, supported native files are seekable WebM/Opus or M4A/AAC-LC with online-prepared native metadata. Native download states use subtitle symbols/text rather than verified stock circular badges. SponsorBlock sidecars use original timestamps and existing colors/skip policy, without embedded chapter tags or new chapter picker. No universal zero-stutter claim.

Settings: existing Morphe > Player > Downloads for mode/app, quality, Ask each time, chapters and storage; Playlist downloads for batches/chosen folder; Shaders for effects. Existing Enable debug logging / Export debug logs, no timer. Read Research/DOWNLOADS-AND-FOREGROUND-0.7.0-BETA.2-2026-11-01.md and dist verification.json. Retained regenerable revision40 scratch is inventoried in Verification/revision40/retained-scratch.json; no cleanup authorized. Never rerun completed staging/publication or push private Personal-Patches history.

## Earlier records

# Verified source - 0.7.0-beta.2

Final local verification is complete. Publication is pending the verified receipt Verification/publication/v0.7.0-beta.2/publication-result.json. Candidate SHA256 1e18816198dbb6a57257b3cc489b83c13e2205c90c845148ed0b2eaf377abf39. Supersedes the unpublished beta.1 preparation, which must never be published.

Exact original arm64-v8a YouTube Music **9.42.52 / 94252240** and **9.43.51 / 94351240**, minSDK26. Use this Full Collection alone; Shaders and Download playlist are optional. Download playlist requires Downloads. Jam remains 9.42.52-only. Enable Pre-release patches and Experimental app versions, refresh and repatch the original APK. MPP SHA256: `1e18816198dbb6a57257b3cc489b83c13e2205c90c845148ed0b2eaf377abf39`.

Themed Opus quality/size/remember selection, playlist batching and original-playlist native playback adapters, read-only supported YTDLnis files, static artwork routing, storage totals and SponsorBlock sidecars are implemented. Shaders follow visible native player/sheet ownership, restore header/theme paints, fit complete covers and limit expensive readbacks. The foreground Lyrics sheet extends behind transparent system navigation. Existing lyrics engine/recovery/library/settings and normal debug switch/export remain intact.

Build/JVM/lint, 14 positive two-target APK configurations, 2 expected missing-Downloads rejections, catalog/Jam guards, 14 feature/reference/invocation audits, 8 native Lyrics audits and 14 native download/media/artwork audits pass. 527 source/harness checks: 320 fresh, 207 inherited only after exact source hashes match. Changed-source and old-disposal evidence groups are excluded from inheritance. Browser/provider results are explicitly inherited with unchanged source hashes; NOTICE version change reviewed separately.

Phone native decoding/queue behavior, visible Samsung three-button/gesture transparency, shaders/video, recording-free smoothness and Recents behavior still need acceptance. No device/MuMu/sign/install/uninstall or real media download operations. No zero-stutter claim. External files require completed indexing, exact IDs, seekable WebM/Opus or M4A/AAC-LC and online-prepared native metadata. Download status is native subtitle text/symbols. SponsorBlock sidecars retain the original timeline; no embedded chapter tags/new chapter picker.

Settings: existing Morphe > Player > Downloads mode, quality, Ask each time, Save SponsorBlock chapters and storage. Playlist downloads manages batches/chosen folder. Shaders has its own settings. Keep existing preferences, credentials, offsets, permanent lyrics and folder grants. Use the normal Enable debug logging / Export debug logs for further issues, without screen recording; no timer.


See Verification/revision40/WORK.md, source-freeze-r3.json and matrix-final-r3.log. Shared Toolkit runs in place; no globals copied. Preserve old distributions, history and retained scratch. Never rerun completed staging/publication recipes or push private history.

## Earlier records

# Verified source - 0.7.0-beta.1

The Opus download/foreground update is verified locally and staged at Personal-Patches/dist/0.7.0-beta.1. MPP SHA256 `dc454175f6f251eb663ed351947bb090f8b342c9bbbad8808c172eef43ce6b5c`. Publication is pending until Verification/publication/v0.7.0-beta.1/publication-result.json confirms it. Existing source history, preferences, credentials, offsets, permanent lyrics, chosen-folder grants and prior distributions are preserved.

Exact original arm64 Music **9.42.52/94252240** and **9.43.51/94351240**, minSDK26. Full Collection alone; optional Shaders and Download playlist, with Downloads required for playlist downloading. Jam remains 9.42.52-only. Enable Pre-release patches and Experimental app versions, refresh and repatch an original APK.

Themed Opus quality/estimated-size/remember selection, native playlist identity/routing, two-track batches, original-playlist native byte/metadata playback adapters, supported read-only YTDLnis files, static artwork routing, storage totals and SponsorBlock sidecars are implemented. Shared lifecycle/settings are injected once even without personal lyrics. Native cache preserves original errors/cancellation and warms/retries on foreground. Shaders follow the visible native player and full Lyrics sheet, restore header/theme paints, fit the complete cover, and stop repeated slow frame readbacks. The real foreground sheet extends behind transparent navigation.

Build/JVM/lint, fourteen positive APK configurations, two missing-Downloads rejections, catalog/Jam guards, fourteen feature/access/reference audits, eight native Lyrics audits and fourteen native media/download/artwork audits pass. 527 source/harness checks: 320 fresh, 207 inherited after exact source hashes match. Changed-source/old-disposal groups are excluded from inheritance. Browser/provider evidence is explicitly inherited; only the web NOTICE version changed. No devices/MuMu/sign/install/uninstall, real media downloads, cleanup or global-tool copies.

Native decoding/queue/SAF behavior, real Samsung three-button/gesture transparency, shaders/video, recording-free stutter and Recents timing need phone acceptance. External indexing must finish; supported native files are seekable WebM/Opus or M4A/AAC-LC, with online-prepared native metadata. Native row status uses accessible subtitle symbols/text rather than a verified stock circular badge. SponsorBlock chapters are sidecars plus existing colored seekbar/skip policy, not embedded tags/new chapter picker. No universal zero-stutter claim.

Settings: existing Morphe > Player > Downloads mode/quality/Ask each time/chapters/storage; Playlist downloads for batches and chosen folder; Shaders for effects. Existing Enable debug logging / Export debug logs remains the only diagnostics flow, with no timer. Read Research/DOWNLOADS-AND-FOREGROUND-0.7.0-BETA.1-2026-11-01.md, Verification/revision40/WORK.md and the staged verification.json. Never rerun completed old staging/publication, overwrite released bytes or push private Personal-Patches history.

## Earlier records

# Published - 0.6.1-beta.1

[0.6.1-beta.1](https://github.com/BDCrusher/ytmusic-lyrics/releases/tag/v0.6.1-beta.1) fixes the generated native row invocation defect responsible for 0.6 Library/Search VerifyError, and defers effect/browser disposal to remove the reentrant child-array teardown hazard. Existing public history retained. Toolkit verified 11 public assets, 7585 exact source files and dev feed. Source `862705acac5f35442f116efa951556a39b638010`; feed `4090eeac3e970cb7b637b3e4cbb26045c1af65e7`. MPP SHA256 `b12b2d51d5911f2b0926783b28baab8354d2193b673b828e25ab2abe0e7b0633`. Receipt Verification/publication/v0.6.1-beta.1/publication-result.json.

Exact original arm64 Music 9.42.52/94252240 and 9.43.51/94351240, minSDK26. Full Collection alone; Shaders and Download playlist optional. Download playlist requires Downloads. Jam remains 9.42.52-only. Refresh existing source with Pre-release patches/Experimental app versions enabled and repatch an original APK. Preferences, credentials, permanent lyrics, chosen folder and playlist data namespaces remain unchanged.

Private native row/getter calls select direct invocation by access flags; no visibility widening or VerifyError suppression. Expanded audit includes injected native bridge hosts and validates invocation vs access/constructor/static rules. It rejects both old defective compiled row adapters. Common weak/idempotent ViewDisposal hides immediately and removes/releases after the current UI traversal, preserving native sibling order and new replacement surfaces. Apply to shader effects, lyrics browsers and source verification browsers. Exact 0.5 and 0.6 source snapshots reproduce null-child failure under the same modeled traversal; corrected actual binding passes.

Build/JVM/lint, 14 positive APK combinations, 2 missing-Downloads rejections, catalog/Jam guards, 14 feature/access/reference audits and 8 native Lyrics audits pass. 383 source/harness checks: 23 fresh teardown/source regressions and 360 retained by exact source hashes. Web executable/style/host and provider sources unchanged; earlier browser/provider evidence is explicitly inherited, not fresh phone/live testing. NOTICE version line reviewed separately. Structural audits do not replace ART execution.

Real phone Library/Search, playlist status updates, closing/reopening/rotation/dialogs, Samsung appearance, graphics/media and recording-free stutter remain acceptance checks. No zero-stutter claim or device/MuMu/sign/install/uninstall/real media downloads. Native-main-player/Lyrics offline integration remains unestablished; existing separate service unchanged. Use existing Enable debug logging / Export debug logs for further failures, without screen recording; no timed capture.

Read Research/CRASH-FIXES-0.6.1-BETA.1-2026-10-31.md and Personal-Patches/dist/0.6.1-beta.1/verification.json. Raw nine crash reports remain private in Inputs/crashes-2026-10-31; do not export them. Regenerable verification scratch retained in Verification/scratch/revision39-final-r1-* and recorded in Verification/revision39/retained-scratch.json. No cleanup authorized. Never rerun completed staging/publication recipes, overwrite released bytes or push private Personal-Patches history. Shared Toolkit tools run in place, no globals copied.

## Earlier records

# Verified crash-correction source - 0.6.1-beta.1

Current source fixes the private native row invocation responsible for 0.6 Library/Search crashes and the synchronous sibling-removal teardown hazard. Exact original arm64 Music 9.42.52/94252240 and 9.43.51/94351240, minSDK26; Jam 9.42-only. Full Collection alone, optional Shaders and Download playlist. No emulator/MuMu/device/sign/install/uninstall or real downloads.

The old compiled APK fails the new injected-native-bridge access audit for both row adapters. Exact 0.5/0.6 source reproduce null-child detach in the shared modeled traversal; corrected actual bindings pass. Build/JVM/lint, 14 positive APK combinations, 2 missing-Downloads rejections, catalog/Jam guards, 14 feature/access/disposal/reference audits and 8 native Lyrics audits pass. 383 source/harness checks (23 fresh,360 inherited with exact source hashes). Earlier unchanged web/provider evidence is explicitly inherited; NOTICE version change reviewed separately.

Staged artifact: Personal-Patches/dist/0.6.1-beta.1, MPP SHA256 b12b2d51d5911f2b0926783b28baab8354d2193b673b828e25ab2abe0e7b0633. Check Verification/publication/v0.6.1-beta.1/publication-result.json before claiming publication. Read Research/CRASH-FIXES-0.6.1-BETA.1-2026-10-31.md and Verification/revision39/WORK.md. Actual Samsung Library/Search/closing and other device behaviors remain phone acceptance; no zero-stutter claim. Existing data/credentials/folder/cache namespaces preserved. Separate offline service/native-player integration limitation unchanged. 3.12GiB fresh regenerable verification scratch retained; no cleanup authorized. Never rerun completed staging/publication recipes, overwrite released bytes or push private source history. Shared Toolkit tools remain in place.

## Earlier records

# Published - 0.6.0-beta.1

[0.6.0-beta.1](https://github.com/BDCrusher/ytmusic-lyrics/releases/tag/v0.6.0-beta.1) is published. Toolkit verified 11 public assets, 7575 exact source files and the dev feed. Source `728eca82bff5c98d343d67ef8fa887198e76d05f`; feed `07d24be62a4eb2db1f50982da85a9cc02a0839bf`. MPP SHA256 `54788eb202030bca9ca8cf2677a928313465a848568e749ea0079ebcf08ff27e`. Receipt: Verification/publication/v0.6.0-beta.1/publication-result.json. Public history preserved; no global tools copied.

Full Collection only, optional Shaders and Download playlist. Exact original arm64 Music 9.42.52/94252240 and 9.43.51/94351240, minSDK26. Jam remains 9.42.52-only. Use this source alone; enable Pre-release patches/Experimental app versions, refresh, review selections and repatch an original APK.

Recording-scoped discovery, early exact-ID Unison/saved lyrics, native model replay and generation-safe panel callbacks prevent previous/native lyrics from taking over. Native Lyrics remains second while pending/available. Retain Braccato state/motion; reduce host layout/retry fanout. Reattach native shader/player/Lyrics surfaces and extend actual foreground backgrounds behind transparent navigation. Personal settings use themed native cards, switches, choices, sliders and readable spacing.

Both playlist download actions use the displayed playlist, not Now Playing. External mode sends one canonical URL through the existing selected app review flow. Morphe > Playlist downloads > Choose download folder grants read-only access to YTDLnis files; exact recording IDs in filenames are required. Only actual indexed playable files count as available. Native page caching preserves playlist identity/order/continuations/static covers; native row text shows real download states. No copied external audio or permanent animated-cover files.

Offline playback still uses the existing separate offline service; native-main-player/Lyrics integration is not established. Do not claim a complete native offline player. Real folder/download/playback behavior remains a phone check. Permanent one-best lyric storage is retained and can be prefetched independently of audio completion.

Build/JVM/lint, fourteen two-target APK combinations, two missing-Downloads rejections, catalog/Jam target guards, fourteen compiled feature/reference audits, eight native Lyrics audits and 360 actual-source checks pass (299 fresh;61 inherited after exact hash validation). Browser16-format/reference animations/follow/seek/dock/status/cadence/Kawarp/fallback and three live public Java lyric lookups pass. Native/SAF/media/transport boundaries are explicitly simulated in harnesses. Existing service access restrictions and combined verification timeout remain reported.

Use existing Morphe > Miscellaneous > Debugging > Enable debug logging and Export debug logs. No timer/separate report. For stutter include song/time/Native or Fallback/Shaders state without screen recording; note if logging hides it too. Frame deadlines, line/clock/source context and cadence are recorded, bounded and redacted. Review native song/UI details before sharing. Desktop old/current traces had no reverse steps or long tasks, not a phone speedup verdict.

Recording-free smoothness, Samsung navigation, native panel/graphics/video, streamed cover and Recents stop timing remain device acceptance. No zero-stutter claim, device/MuMu/sign/install/uninstall or actual playlist downloads. Read Research/FIXES-0.6.0-BETA.1-2026-10-30.md and Personal-Patches/dist/0.6.0-beta.1/verification.json. Retained regenerable scratch is recorded in Verification/revision38/retained-scratch.json; no cleanup authorized. Never rerun completed publication/staging recipes or push private Personal-Patches history.

## Earlier records

# Verified source - 0.6.0-beta.1

The October29 feedback implementation is staged at Personal-Patches/dist/0.6.0-beta.1. Exact MPP SHA256 54788eb202030bca9ca8cf2677a928313465a848568e749ea0079ebcf08ff27e. Both original arm64 Music 9.42.52/94252240 and 9.43.51/94351240, minSDK26; Jam 9.42-only. Full Collection alone, optional Shaders and Download playlist. No add-on delivery.

Recording-scoped discovery/native model replay/panel ownership/generation guards, native shader/root lifecycle and foreground navigation extension, themed preference cards, displayed-playlist routing, read-only chosen YTDLnis folder, native cached pages/static artwork/status rows and background one-best lyric prefetch are implemented. Existing normal Enable debug logging/export retained. External filenames need exact recording IDs. Offline playback uses the existing separate service; native-main-player/Lyrics integration is not established.

Build/JVM/lint, 14 two-target positive APK combinations, 2 missing-Downloads rejections, catalog/Jam guard, 14 compiled feature/reference audits, 8 native Lyrics audits and 360 actual-source checks pass (299 fresh;61 inherited by hashes). Browser 16 variants/reference line motion/follow/seek/dock/status/cadence/Kawarp/fallback and 3 public Java lyric lookups pass. Phone smoothness/Samsung appearance/graphics/media/real downloads remain unverified; no zero-stutter claim. No device/MuMu/sign/install/uninstall or real media-download operations. 6.82GiB retained regenerable revision38 scratch; no cleanup authorized. See Research/FIXES-0.6.0-BETA.1-2026-10-30.md and staged verification.json. Publication complete only when the new Toolkit publication-result.json exists. Never rerun completed staging/publication or push private source history.

## Earlier records

# Published - 0.5.0-beta.1

[0.5.0-beta.1](https://github.com/BDCrusher/ytmusic-lyrics/releases/tag/v0.5.0-beta.1) is published. Toolkit verified 11 public assets, 7542 exact source files and the dev feed. Source `fecdcc1390fa0c8d7639c3bc64b9adbc81be0e4c`; feed `7496611463fbc3fb9fee39e8685ba02031633172`. MPP SHA256 `3c53b25d3015848a68edf13181daea8a6c2db8cc698bcf284998999a134b7d4b`. Receipt: `Verification/publication/v0.5.0-beta.1/publication-result.json`. Existing public history preserved; no shared/global tools copied.

Both exact original arm64 targets: YouTube Music 9.42.52/94252240 and 9.43.51/94351240, minSDK26. Full Collection only, optional Shaders and Download playlist. Jam queue sharing remains 9.42.52-only; disable an old saved Jam selection on 9.43.51. Use this source alone. Enable Pre-release patches and Experimental app versions, refresh, review saved selections and repatch the original APK.

Use the EXISTING Enable debug logging switch and Export debug logs in Morphe > Miscellaneous > Debugging. No timed capture/separate report. Normal logs add exact app/WebView/entry, source/recording, clock/line and actual platform frame-deadline/cadence evidence, with bounded/redacted entries, throttled component dumps and fewer routine stacks. If native Debugging is absent the fallback page uses the same switch/export. Inspect native song/UI details before sharing.

Fix stale metadata/recording binding and lookup restarts during harmless refinements. Handle the complete verified native Lyrics action state enum, retaining second position while pending/available. Reduce hidden hierarchy work and request a local animation frame rate on Android 35+ while preserving user settings, pause and reduced motion. Keep Braccato as the single text-motion engine. Dedupe artwork network/ledger work; request own-session Recents pause/stop before effects cleanup. Retain only artwork lookup/availability records, no permanent animation-file library.

Build/JVM/lint, fourteen two-target APK combinations, missing-Downloads rejection on both targets and catalog/target validation pass with exact Patcher 2.1.0-dev.4. Fourteen compiled feature/reference audits, eight native Lyrics audits, 286 actual-source checks (192 fresh; 94 inherited after hashes match), browser 16-format/reference motion/UI/cadence/Kawarp/fallback checks pass. Fresh public Java lyric retrieval passed for all three supplied recordings. The cover's direct Better Lyrics401 remains a real access rejection while exact-ID Unison succeeded. Prior combined-service browser challenge timeout remains a limitation.

Phone acceptance remains: recording-free smoothness, Samsung navigation, native panel/graphics/video and streamed-cover behavior, Recents stop timing and real playlist/offline downloads. Desktop old/current fixtures both had no reverse scroll steps; they do not establish a phone speedup. No universal zero-stutter claim. No device, MuMu, signing, installation/uninstallation or real playlist download operations. All edits, scratch and evidence remain in YT-Music.

Read Research/FIXES-0.5.0-BETA.1-2026-10-29.md and Personal-Patches/dist/0.5.0-beta.1/verification.json. Generated compatibility scratch remains under Verification/scratch/revision37-r4-*; see Verification/revision37/retained-scratch.json for size. Reports/originals/source/previous releases are preserved; no cleanup authorized. Never rerun completed staging/publication recipes, overwrite releases or push private development history.

## Earlier records

# Published - 0.4.0-beta.1

[0.4.0-beta.1](https://github.com/BDCrusher/ytmusic-lyrics/releases/tag/v0.4.0-beta.1) is published. Toolkit verified 11 public assets, 7514 source files and the dev feed. Source `f5c4ba71a77f0b82d40fea8bd9e92c88347f5dbd`; feed `ed38b470671fdb07cc97d5691e3f0a206a7dcda3`. MPP SHA256 `28a30d73090e6e6fbbc4cfcad40bf1c1f4410a219400e95c88e97b7b09ec0456`. Exact receipt: `Verification/publication/v0.4.0-beta.1/publication-result.json`. Existing public history is preserved; no global tools were copied.

Full Collection only, with optional Shaders and Playlist downloads. Review saved selections and use the collection alone; the old Lyrics-only Add-on is retired from new delivery. Original 9.42.52 / 94252240 arm64-v8a remains the exact experimental target. Enable Pre-release patches and Experimental app versions, refresh the source and repatch the original APK.

Correct Lyrics inset ownership/panel settling, moving resume-follow action and inline translucent source status. Keep Braccato as the text-motion engine. Shaders waits for valid images, keeps native fallbacks and streams cover URLs while retaining only lookup/availability records. Recognized old animation-file cache is removed on initialization; permanent lyrics/preferences/credentials remain. Recents swipe requests own-session pause/stop; Home/Back keep background playback.

Morphe Debugging adds opt-in 60-second capture of Native/Fallback entry, source outcomes, renderer gaps/ticks, Android Window FrameMetrics and shader/media failures. One bounded redacted private last report; no lyric text, credentials or automatic uploads. Open Morphe > Miscellaneous > Debugging, or the personal Debugging page when native debugging is absent. Capture, reproduce without screen recording, then copy Lyrics and Shaders report. Lyrics settings also opens the report.

Build/JVM/lint, nine catalog/application/invalid-selection cases, seven compiled feature audits, four native Lyrics audits and 226 actual-source checks pass (92 fresh; 134 inherited after exact source hashes match). Current browser provider/reference-motion/UI/Kawarp/fallback checks pass. Ordinary artwork verification and metadata lookup succeeded. Failed raw fragmented-MP4 browser loop observation is retained and is not a native streaming verdict. Prior combined-source verification timeout remains a limitation.

Phone smoothness, Samsung navigation, native panel/graphics/video behavior, streamed-cover looping, Recents audio-stop timing and real playlist downloads remain unverified. No zero-stutter claim; no device, MuMu, signing, install/uninstall or real playlist download operations occurred.

Read Research/IMPLEMENTATION-0.4.0-BETA.1-2026-10-28.md and dist/0.4.0-beta.1/verification.json. About 5.0 GiB / 141,513 files of regenerable revision34 scratch remain (Verification/revision34-retained-scratch.json). Regenerable generated compatibility scratch remains in Verification/scratch/revision34-accepted-* and earlier preflight directories; no cleanup was authorized. Source, private inputs and immutable deliveries are preserved. Never rerun completed staging/publication recipes.

## Earlier records

# Published - 0.3.0-beta.2

[0.3.0-beta.2](https://github.com/BDCrusher/ytmusic-lyrics/releases/tag/v0.3.0-beta.2) is published. Toolkit verified all 11 public assets, 7493 exact source files and the dev feed. Source `a4375a1229aea422a5a9eb62ed8dca3c12522906`; feed `66456c4465c7abff2f404c928e9a641189cc9724`. MPP SHA256 `0e989f6f66d2c0995361c4122bb4a7e347501e041483552c7a672dd65807f89c`. Exact receipt: `Verification/publication/v0.3.0-beta.2/publication-result.json`. Shared tools ran in place; private history was not pushed.

Fixes: one native silent looping cover decoder, complete-frame fitting and atomic fragmented-MP4 timeline finalization, including local repair of existing cache entries. Backgrounds use still artwork/first-frame fallback with actual Kawarp, no competing HTML video decoders and a 960-pixel cap. Native settings root is opaque; the verified Lyrics body extends behind transparent navigation with one safe inset. Collapsed opener is at the bottom; expanded collapse stays above controls. The compact status popup stays above the dock. Braccato remains the only text-motion engine.

Build/JVM/lint, 23 catalog/application/conflict cases, 16 compiled feature audits, 12 native Lyrics audits and 220 actual-source checks pass (86 fresh, 134 inherited after exact source hashes match). Current browser 16-format/reference-motion/dock/Kawarp/high-DPI/fallback checks pass. Ordinary artwork verification/lookup succeeded for MAMMAMIA. Its reference-normalized service frames play and loop on desktop. Production Android muxing/hardware playback, recording-free smoothness and actual Samsung navigation remain unverified. Earlier raw fragmented-file loop failures are retained. No universal zero-stutter claim; prior combined-source challenge timeout remains a limitation.

Refresh the existing Morphe source with Pre-release patches and Experimental app versions, then repatch original 9.42.52 / 94252240 arm64-v8a. Four categories and edition rules remain: Full alone OR every Full patch OFF plus Lyrics-only with official 1.48.0 and official Third-party lyrics OFF. Optional Shaders/downloads allow official lyrics without personal lyrics; Download playlist requires Downloads. Settings: Morphe > Lyrics / Shaders / Playlist downloads. Existing private preferences/credentials/lyrics remain.

Read `Research/PLAYBACK-UI-0.3.0-BETA.2-2026-10-28.md`, `Personal-Patches/dist/0.3.0-beta.2/verification.json` and COMPATIBILITY.md. Retained generated compatibility scratch: `Verification/scratch/revision33-final-*` (23 cases), alongside prior revision32 scratch. Reports are small; unsigned inspection APKs/decoded scratch are regenerable from the retained exact inputs. No cleanup was authorized. Never rerun completed staging/publication generators, overwrite releases or push private source history.

No device, MuMu, signing, installation/uninstallation or real playlist download operations occurred. Only the isolated task browser and loopback fixture server were opened; both are closed. Native graphics/panel/video transitions, Samsung three-button/gesture/keyboard/dialog/orientation behavior and real playlist/offline playback remain phone acceptance checks.

## Earlier records

# Published - 0.3.0-beta.1

[0.3.0-beta.1](https://github.com/BDCrusher/ytmusic-lyrics/releases/tag/v0.3.0-beta.1) is published. Toolkit verified all11 public assets,7473 exact source files and the dev feed. Source `eec35588e9fad485c66af88566c2f9e6b9d4de68`; feed `3759aef9f41eef1f5f4c371c1369ccb373a7a1a7`. MPP SHA256 `30439704544ef0ab5c87b57f295c8e0c88d01478491f770fbd599bde3c42ae96`. Exact receipt: `Verification/publication/v0.3.0-beta.1/publication-result.json`. Shared tools ran in place; private Git history was never pushed.

Four expandable categories: Full Collection, Lyrics-only Add-on, Shaders and Playlist downloads. New patches are optional and independent. Use Full alone OR deselect every Full patch and use personal lyrics with official1.48.0 defaults, official Third-party lyrics OFF. Shaders/downloads alone permit official lyrics; Download playlist requires Downloads. Enable Pre-release patches and Experimental app versions, refresh the existing root source and repatch original9.42.52 /94252240 arm64-v8a. Settings: Morphe > Lyrics, Shaders and Playlist downloads.

Implemented: actual Kawarp/native artwork surfaces and Wi-Fi MP4 cache; durable best-lyric library from all sources; six-attempt scheduled retries plus three recovery checks; native settings/storage/quality controls; shared transparent navigation; native playlist-header action, existing mode routing, authenticated pagination, typed completion, persistent batches and ordered offline playlists. Both Lyrics paths retain native shell and Braccato motion. Read `Research/FEATURES-0.3.0-2026-10-26.md` and `Personal-Patches/dist/0.3.0-beta.1/COMPATIBILITY.md`.

Final build/JVM/lint,23 catalog/application/conflict cases,16 compiled reference/independence audits,12 native Lyrics audits and197 deterministic actual-source checks passed. Browser16-format/reference-motion/Kawarp/generated-MP4/fallback checks and three live direct song lookups passed. Normal artwork verification/mint/lookup passed. The combined lyrics-service normal challenge timed out in the fresh browser test; it was not bypassed. Public export normalizes newlines/private home prefixes; implementation changes match the tested canonical source. Source archive matches the complete public Git tree.

Phone acceptance remains: recording-free smoothness, native panel interactions, Samsung three-button/gesture navigation across screens/dialogs/keyboard/orientation, WebView/GPU/MP4/video transitions, normal source verification on the phone and actual playlist downloading/offline playback. No universal zero-stutter claim. No device, MuMu, signing, installation/uninstallation or real automated media downloads. Isolated browser/loopback fixture server are closed.

Retained revision32 compatibility scratch is11.27 GiB across67 generated run directories; small reports and outputs remain inside this app home. No cleanup was authorized. Current successful matrix prefix is `revision32-finalrelease`; earlier failed candidates are not delivery evidence. Never rerun completed staging/publication generators, rebuild immutable releases or push the private checkout. Future changes need new versions/fresh output paths.

## Earlier records (historical)

# Current candidate - 0.3.0-beta.1

This revision implements independently selectable Shaders and Download playlist, durable best-lyric storage, scheduled source recovery, native settings/storage cards and app-wide transparent navigation. The exact target remains original YouTube Music 9.42.52 / 94252240 arm64-v8a with official Morphe 1.48.0. Use Full Collection alone OR deselect every Full patch and use Lyrics-only Add-on with official Third-party lyrics disabled. Shaders and Download playlist are optional; either can be used with official patches and official lyrics. Download playlist requires Downloads. One root source has four native categories.

Settings: Morphe > Lyrics, Morphe > Shaders, Morphe > Playlist downloads. The playlist patch reads the existing Downloads mode/app at click time. Global transparent navigation is shared infrastructure, installed once with a personal feature. Existing private preferences and credentials are retained. Lyrics never expire automatically; cover media uses an adjustable 512 MiB LRU cache and only downloads new loops on unmetered Wi-Fi.

Read [the implementation report](../Research/FEATURES-0.3.0-2026-10-26.md), `dist/0.3.0-beta.1/verification.json` and the compatibility report for exact checks and limitations. Publication is complete only when `Verification/publication/v0.3.0-beta.1/publication-result.json` says published. Never rerun completed staging/publication generators or push the private checkout. Shared Toolkit stays in place. No MuMu/device/sign/install operations. Real phone smoothness, native presentation, Samsung navigation and Android graphics/download acceptance remain separate from compiled/simulated checks.

## Earlier records (historical)

# Published - 0.2.11-beta.1

[0.2.11-beta.1](https://github.com/BDCrusher/ytmusic-lyrics/releases/tag/v0.2.11-beta.1) is published. Public source, all 10 assets and the dev feed were verified against the preparation; 7421 source files matched. Source `577aeaff26e4fc11a6c22537130a086a7ddc02c6`, feed `bb1b4cb3b19b6d8dad9fe92a858e3213d3973a93`. MPP SHA256 `9d050a85ebcdec12f089f04754814448c249638dd0ab3d3d41c5546d3d0d746a`. Exact receipt: Verification/publication/v0.2.11-beta.1/publication-result.json. Shared Toolkit ran in place; private history was not pushed.

Lyrics system navigation is always transparent. The matching-color preference, background sampling and protection overlays are removed. Native icons and content insets are preserved, and previous native bar state is restored on close. Old private preferences are retained but cannot disable transparency. Both editions share this behavior.

Fresh build, patch tests, music lint, 47 navigation checks, four final APK combinations including both source orders, five conflicting-selection checks and compiled native/SDK/isolation audits passed. Unchanged source/renderer evidence is reused only with exact source hashes; see the compatibility report for provenance. These are compiled and simulated checks. Actual Samsung/OneUI transparency and phone smoothness remain unverified. No device, MuMu, signing, installation or uninstallation operations were performed.

Refresh the existing Morphe source with Pre-release patches and Experimental app versions enabled, then repatch original 9.42.52/94252240 arm64. Use Full alone OR deselect every Full patch and use Lyrics-only with official 1.48.0 defaults, official Third-party lyrics OFF. Settings remain Morphe > Lyrics. No copied globals.

## Build and prior records

# Current build - 0.2.11-beta.1

Lyrics system navigation is always transparent. Remove the matching toggle, color sampling and opaque protection overlays; ignore saved transparentNavigation=false. Preserve native navigation icons/insets and restore native window state on close. Source/renderer/timing/status-dot assets and other personal logic are unchanged from0.2.10.

47 fresh actual-helper window-state checks, four exact APK combinations/both source orders, five conflicts, compiled native/SDK/isolation audits, JVM/lint pass. The compiled audit requires the transparent-only two-argument API and rejects helper overlay/Bitmap/icon overrides. Prior browser/clock/source/service evidence is reused only after exact source and asset hashes match. Real Samsung/One UI transparency remains unverified; no new performance/provider acceptance claim. No device/MuMu/sign/install/uninstall operations or copied globals.

Read [TRANSPARENT-NAVIGATION-2026-10-25.md](../Research/TRANSPARENT-NAVIGATION-2026-10-25.md) and app-home Personal-Patches/dist/0.2.11-beta.1/verification.json. MPP SHA256 9d050a85ebcdec12f089f04754814448c249638dd0ab3d3d41c5546d3d0d746a. Current helpers: Verification/check_revision31_navigation.py, verify_revision31.ps1, stage_revision31.py; use fresh outputs and never rerun completed generators. Publication receipts, once complete: Verification/publication/v0.2.11-beta.1/publication-result.json. Shared Toolkit runs in place; never push private Personal-Patches history.

Exact target stays original9.42.52/94252240 arm64, official1.48.0, engine2.0.0/inherited1.15.1 matching semantics. Use Full alone OR deselect all Full patches and use add-on with official defaults, official Third-party lyrics OFF. Same root feed/categories; enable Pre-release patches/Experimental app versions, refresh and repatch original APK. Settings: Morphe > Lyrics. Previous phone-performance/WebView/cold-panel/timeline limits remain. Scratch is retained/regenerable; cleanup was not authorized.

## Historical record

# Published - 0.2.10-beta.1

[0.2.10-beta.1](https://github.com/BDCrusher/ytmusic-lyrics/releases/tag/v0.2.10-beta.1) is published. Public source, all 10 assets and the dev feed were verified against the preparation; 7418 source files matched. Source `2fcfbf6095c68a27dbd81d0ab8fc3c6d8549f478`, feed `4d93cecd2a7859b0d61eeae2c92d86de974fdb65`. MPP SHA256 `ebeb65e0016c61271c8346b295366e03e42225c30dacd171c449f56118790533`. Exact receipt: Verification/publication/v0.2.10-beta.1/publication-result.json. Shared Toolkit ran in place; private history was not pushed.

Quiet typed source dot, timestamp-aware continuous timing, retained parsing/DOM/follow state, normal verification callback and bounded recording-free frame diagnostics are shared by both editions. Four final APK combinations/both orders, five conflicts, native hook/SDK/isolation audits, JVM/lint,143 fresh Java/81 JS checks and fresh16-format/browser checks pass. Actual Java HTTP with normal verification returned all six backends and9 positive payloads. No credentials persisted. All performance runs are retained, including concurrent-load variability; no universal zero-stutter or phone/WebView acceptance claim.

Refresh the existing source with Pre-release patches and Experimental app versions enabled, then repatch original9.42.52/94252240 arm64. Use Full alone OR deselect every Full patch and use add-on with official1.48.0 defaults, official Third-party lyrics OFF. Settings: Morphe > Lyrics; Frame-timing summaries appear in Source diagnostics without recording. No device/MuMu/sign/install/uninstall operations or copied globals.

## Build and prior records

# Current build - 0.2.10-beta.1

Replace automatic source banners with a typed green/orange/red dot right of delay; tap for details. Use a separate timestamp-aware native renderer clock and continuous bridge clock, retain actual Braccato curves, reduce native polling/window work, avoid repeated parsing/DOM resets and premature noLyrics hides, reset follow on tracks and respect hidden windows. Normal verification supports the service's message callback and Retry-After. Bounded Frame-timing summaries are in existing Source diagnostics without recording.

Exact original9.42.52/94252240 arm64, official1.48.0, engine2.0.0/inherited1.15.1 semantics. Four final APK combinations/both source orders, five conflicts, native hook/SDK/isolation audits, JVM/lint,143 fresh Java and81 JS checks pass. Each edition has exactly one timestamped clock hook;113 owned add-on classes, no foreign/duplicate definitions. All16 formats and fresh renderer/dock/selection/seek checks pass. Actual Java HTTP plus normal verification returned all six backends,9 positive payloads and healthy completed state; no credentials persisted. Desktop rich/clock stress evidence is retained, including an84ms concurrent-load case and later uncontended0-long-task cases. **No universal zero-stutter or Android phone/WebView acceptance claim.**

Read [QUIET-SOURCE-STATUS-AND-TIMING-2026-10-25.md](../Research/QUIET-SOURCE-STATUS-AND-TIMING-2026-10-25.md) and app-home Personal-Patches/dist/0.2.10-beta.1/verification.json. MPP SHA256 ebeb65e0016c61271c8346b295366e03e42225c30dacd171c449f56118790533. Authoritative application evidence uses revision30-delivery; earlier revision30 scratch/candidate MPP is not delivery. Current checks: verify_revision30_delivery.ps1, check_revision30_*.py/js and web/revision30-*.js; use new output paths, not completed generators. Existing public history is reviewed/exported with Toolkit in place; never push private Personal-Patches. Publication receipts, once complete: Verification/publication/v0.2.10-beta.1/publication-result.json.

Use Full alone OR deselect every Full patch and use Lyrics-only Add-on with official defaults, official Third-party lyrics OFF. Same root source/categories; enable Pre-release patches/Experimental app versions, refresh and repatch original APK. Settings: Morphe > Lyrics. Existing cold native presentation/alternate timeline limits remain. MuMu/devices/sign/install untouched, no copied globals. Two bounded matrices/CPU artifacts remain retained and regenerable; cleanup was not authorized.

## Historical record

# Published - 0.2.9-beta.1

[0.2.9-beta.1](https://github.com/BDCrusher/ytmusic-lyrics/releases/tag/v0.2.9-beta.1) is published and the public assets/source/dev feed were verified. Source `0f9e028862f517b8580be981f4525691ec60d0de`, feed `08082caa55aa5d698c5ceba12ee191d4f321e25b`. All 10 release assets and 7396 source files match the reviewed preparation. MPP SHA256 `623e9a05734145b9f948e74df4ecd9227a453cd16bd469d48aa322afcec243ce`. Exact receipt: Verification/publication/v0.2.9-beta.1/publication-result.json.

Automatic source verification, one-hour renewal, retained lyrics/selection and bounded retries are shared by both editions. Four APK combinations and five rejected conflicts, native/SDK/payload audits, JVM/lint,114 fresh simulated Java checks,11 verification-script checks and three live song lookups pass. Inherited browser/native-host/navigation evidence is explicitly tied to unchanged source hashes. **Live Android verification and phone stutter remain unverified.** No device/MuMu/sign/install operations or copied globals. Refresh the existing Morphe source with Pre-release patches and Experimental app versions enabled, then repatch the original APK. Settings: Morphe > Lyrics.

## Build and prior records

# Current build - 0.2.9-beta.1

Additional sources verify quietly during active foreground playback UI, before opening Lyrics. Tokens renew with one hour left while keeping the valid token. The normal same-origin browser exchange preserves cookies and browser identity without a native JS bridge. Connect sources reveals the same challenge when requested. Renewal adds broker results without clearing lyrics, resetting selection or rebuilding the native entry. Temporary failures have up to three attempts with Retry-After; malformed stream events cannot block later providers and duplicate results are suppressed.

Exact target: original9.42.52/94252240 arm64, official1.48.0, engine2.0.0 with inherited1.15.1 semantics. Four APK combinations, both source orders, five conflict rejections, compiled native/SDK/isolation audits, JVM/lint,114 fresh simulated Java checks and11 verification-script checks pass. Three fresh live song lookups pass. Unchanged renderer/browser and70 native-host/navigation checks are inherited by exact source hashes. **No live WebView verification or phone performance acceptance.** Screen recording reportedly suppresses stutter; no stutter fix is claimed. This is active-app background work, not a persistent Android service. Manual verification may still be needed.

Read [AUTOMATIC-SOURCES-2026-10-25.md](../Research/AUTOMATIC-SOURCES-2026-10-25.md) and app-home Personal-Patches/dist/0.2.9-beta.1/verification.json. MPP SHA256 623e9a05734145b9f948e74df4ecd9227a453cd16bd469d48aa322afcec243ce. Current helpers: Verification/verify_revision29.ps1; check_revision29_connection.py, check_revision29_catalog.py, check_revision29_lifecycle.py, check_revision29_probe.js and live transport helpers. Use new output paths; do not rerun completed generators. Publication receipts, once complete: Verification/publication/v0.2.9-beta.1/publication-result.json. Never push private Personal-Patches history. Shared Toolkit runs in place; no globals copied.

Use Full alone OR deselect every Full patch and use Lyrics-only Add-on with official defaults, official Third-party lyrics OFF. Settings: Morphe > Lyrics. Enable Pre-release patches/Experimental app versions, refresh source and repatch original APK. MuMu/devices/sign/install/uninstall untouched. Retained scratch is bounded and regenerable; cleanup was not authorized.

## Historical record

# Current correction - 0.2.8-beta.1

Published [0.2.8-beta.1](https://github.com/BDCrusher/ytmusic-lyrics/releases/tag/v0.2.8-beta.1). Native Lyrics factory defaults replace cold Related cloning; supplied native definitions remain byte-for-byte intact and late native registrations are captured. Restore actual extension per-line motion/stagger/easing; remove the0.2.7 custom viewport path. Native Lyrics is second before metadata/lookup and explicitly last on confirmed empty. Conservative metadata cleanup and exact-matched LRCLib search strengthen retrieval. Native settings/dialog explain additional-source verification; working public lyrics do not hide connection status.

Exact target remains original9.42.52/94252240 arm64, official1.48.0 and stable patcher2.0.0 with inherited1.15.1 matching semantics. Four APK combinations, five invalid selections, compiled/SDK/isolation/JVM/lint,95 source Java checks plus unchanged31-check navigation evidence and browser comparison pass. **No phone/pixel-parity/performance acceptance.** Cold fallback reproduces the APK built-in profile rather than a captured online definition; alternate video/audio timing and Shaders remain absent. MuMu/devices/sign/install/uninstall untouched; no copied globals.

Read [NATIVE-LYRICS-AND-EXTENSION-SCROLL-2026-10-25.md](../Research/NATIVE-LYRICS-AND-EXTENSION-SCROLL-2026-10-25.md), app-home Personal-Patches/dist/0.2.8-beta.1/verification.json and Verification/publication/v0.2.8-beta.1/publication-result.json. MPP `f938863a742cc77af0c14a59b9982fde391752b81d7aeed289544d41719bc29d`; source `aceee259761d4a3ebff47a9159df2e21aab03aea`, feed `ce9eeaa808a9fe2995e78cc4a4b0380e80fb0046`. Settings: Morphe > Lyrics. Refresh the existing source with Pre-release patches/Experimental app versions, then repatch original APK. Use Full alone OR deselect every Full patch and use add-on with official defaults, official Third-party lyrics OFF. JDK25.0.5.0.2 replaces the removed25.0.4.1 path in app-owned wrappers. Current helpers use revision28-delivery and fresh outputs; do not rerun completed generators or push private history. Shared Toolkit stays in place. Candidate/final scratch is bounded and regenerable; cleanup was not authorized.

## Historical record

# Current correction - 0.2.7-beta.1

Published [0.2.7-beta.1](https://github.com/BDCrusher/ytmusic-lyrics/releases/tag/v0.2.7-beta.1). One timed host viewport animation, late rich-result preservation, bounded Better Lyrics404/empty-metadata retry, manual candidate retention, native Lyrics second while pending, and transparent system navigation (default on; native matching remains selectable). Braccato highlighting/vocals/agents/letter wave remain. Source `a9fdb450c2632b8278d34ebb72e03a28aa1ce2d3`; dev feed `533a39fc18be1407a16212ec3b7bf75bf4c11968`. Bundle `88b11336f38ec163e6cbf03e8d2de34be39db6420aa836808dc716bc6201d255`.

Four exact original9.42.52/94252240 arm64 APK combinations and five invalid selections passed, with compiled/SDK/duplicate-class/asset audits.111 actual-source simulated Java checks, live Java transport and final browser regressions passed. **Phone jitter/native panel/navigation acceptance remains pending.** Cold Related-derived fallback and alternate video/audio timing limits remain. No device/MuMu/sign/install/uninstall operations or global tool copies. Shaders is research only.

Read [LYRICS-RETRIEVAL-AND-MOTION-2026-10-23.md](../Research/LYRICS-RETRIEVAL-AND-MOTION-2026-10-23.md), app-home Personal-Patches/dist/0.2.7-beta.1/verification.json and Verification/publication/v0.2.7-beta.1/publication-result.json. Settings: Morphe > Lyrics, including Transparent system navigation. Refresh the existing root source with Pre-release patches and Experimental app versions enabled; repatch original APK. Use Full alone OR deselect every Full patch and use add-on with official1.48.0 defaults, official Third-party lyrics OFF. Current verification/staging helpers use revision27 names and fresh outputs. Do not rerun completed publication scripts or push private Personal-Patches history. Shared tools stay in Toolkit. All scratch remains retained in bounded revision27 output folders; cleanup was not authorized.

## Historical record

# Current scroll/presentation correction - 0.2.6-beta.1

Published [0.2.6-beta.1](https://github.com/BDCrusher/ytmusic-lyrics/releases/tag/v0.2.6-beta.1). Hide native/Web scrollbars, deduplicate visibility/layout work, settle dock clearance, reuse navigation sampling and prefer genuine native Lyrics presentation (including unloaded definitions). Cold fallback still needs Related if no real native Lyrics definition is available. **Phone jitter/panel feel remain unverified.** Four exact APK combinations, five rejected invalid selections, compiled/SDK/isolation audits,29 native-host Java checks,24 simulated navigation checks and browser regressions passed. Original target remains9.42.52/94252240 arm64-v8a. No signing, installation or MuMu access.

Use Full alone OR deselect all Full patches and use add-on with official1.48.0 defaults, official Third-party lyrics OFF. Enable prerelease/experimental source settings, refresh and repatch. Settings remain Morphe > Lyrics. Bundle SHA256 06df4eb3a6b76bfeccf2c3a0871f408ea27ecd48f812b4ccfccfaf3f6529c756; source 061ddfe37fc390c181e71e67668a6cce9178c853; dev feed 8a2a0446f03a4ca2ae8ccd9151b2b75a24abe1af. Artifacts remain in app-home Personal-Patches/dist/0.2.6-beta.1. Read [LYRICS-SCROLL-AND-PRESENTATION-2026-10-23.md](../Research/LYRICS-SCROLL-AND-PRESENTATION-2026-10-23.md) and ../Verification/publication/v0.2.6-beta.1/publication-result.json before future work. Current helpers: Verification/verify_follow.ps1 and stage_follow.py; older generators below are historical. Shared tools remain in Toolkit. Never rerun completed publication helpers or push private history.

## Historical record

# Current native-entry correction - 0.2.5-beta.1

Published [0.2.5-beta.1](https://github.com/BDCrusher/ytmusic-lyrics/releases/tag/v0.2.5-beta.1): native client/server video identity and original-model replay replace optional-response/panel-ready availability gates. Native Lyrics VM is enabled/reordered immediately after Like/Dislike when valid current lyrics arrive. System navigation color follows the visible native Lyrics panel and restores on close; window-token scoped. Source completion, four exact APK applications, five rejected invalid selections, compiled/SDK/payload audits,24 Java entry checks and22 simulated Android-navigation checks passed. **Phone acceptance pending.** No signing, installation or MuMu access.

One root source retains Full Collection and Lyrics-only Add-on categories. Use Full alone OR uncheck every Full patch and select add-on plus official1.48.0 defaults, official Third-party lyrics OFF. Enable Pre-release patches and Experimental app versions, update source and repatch original9.42.52/94252240 arm64. Settings: Morphe > Lyrics. Bundle SHA256 7657adb5984ff9e6f8a12024f94f07ef79d7bf281db27d813d5aee433b0892c6. Artifacts: ../Personal-Patches/dist/0.2.5-beta.1 (from app home). Source 792832d76a32b7c8939961f45706ba1f04ff83e1; feed ee2ccbf52ff1a0e3ff4922a29fe76a77c12b100a.

Read [NATIVE-ENTRY-AND-NAVIGATION-2026-10-23.md](../Research/NATIVE-ENTRY-AND-NAVIGATION-2026-10-23.md) and exact ../Verification/publication/v0.2.5-beta.1/publication-result.json. Current build target remains :lyrics-collection:buildAndroid; staging/verification helpers for this revision are Verification/stage_native_replay.py and verify_entry_replay.ps1. Completed generators must not be rerun; future outputs require fresh directories. Canonical private source/history is preserved; publish only reviewed snapshots. Shared tools remain in Toolkit, with no copied globals. Earlier records below are historical.

## Historical record

# BDCrusher YT-Music Lyrics

Published [0.2.4-beta.1](https://github.com/BDCrusher/ytmusic-lyrics/releases/tag/v0.2.4-beta.1). [Add one source to Morphe](https://morphe.software/add-source?github=BDCrusher%2Fytmusic-lyrics&name=BDCrusher%20YT-Music%20Lyrics&app=com.google.android.apps.youtube.music) for expandable **Full Collection** and **Lyrics-only Add-on** groups. Enable Expert mode, Pre-release patches and Experimental app versions, then refresh. Reuse an existing root source; disable the old separate Full source.

Full is used alone. For Lyrics-only, deselect every Full patch and use the add-on with official Morphe1.48.0 defaults, official Third-party lyrics OFF. The add-on defaults to unchecked, but saved selections may persist. Collapsing a category does not deselect it. Both personal editions cannot be selected together.

Exact original target:9.42.52/94252240 arm64-v8a, experimental. [Bundle/checksums](dist/0.2.4-beta.1) | [Build](BUILDING.md) | [Compatibility](COMPATIBILITY.md) | [Evidence](../Research/CATEGORIES-2026-10-22.md). SDK/compiled selection checks passed; phone and actual Manager UI acceptance remain pending. Lyrics runtime/renderer bytes are unchanged from0.2.3-beta.3. Settings: YouTube Music > Settings > Morphe > Lyrics.
