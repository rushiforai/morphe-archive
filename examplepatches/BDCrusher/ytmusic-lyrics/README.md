# BDCrusher YT-Music personal patches

**[Add to Morphe](https://morphe.software/add-source?github=BDCrusher%2Fytmusic-lyrics&name=BDCrusher%20YT-Music&app=com.google.android.apps.youtube.music)** | [Release 0.8.0-beta.2](https://github.com/BDCrusher/ytmusic-lyrics/releases/tag/v0.8.0-beta.2)

Fixes the **Library VerifyError introduced in 0.8.0-beta.1**. The native content bridge now has separate typed ViewGroup and explicit null returns, with safe fallback for missing/non-container content. Existing Audio/Video downloads, playlist routing and native-player integration are retained; files, lyrics, settings, credentials and chosen-folder grants are unchanged.

Exact experimental original arm64-v8a Music **9.42.52/94252240** and **9.43.51/94351240**, minSDK26. Full Collection only; Shaders and Download playlist optional. In-app playlist batching requires Downloads plus Download playlist. Jam remains 9.42.52-only. Do not combine complete collections. MPP SHA256 `4c1c23dcb54be422c31b88cd9b4bcb16664688a98fb86903a47a33f2d6c0fe34`.

Build/JVM/lint, **8 positive configurations**, **2 missing-Downloads rejections**, catalog/Jam guards and **8 compiled audit groups** pass. New control-flow/register-type analysis reproduces beta.1's bad reference return on both targets and checks all selected bridge returns in the corrected outputs. Four actual-DEX content fixtures per output cover absent root, missing/wrong content and valid container. This is scoped desktop analysis, not complete ART verification.

**820 source/harness checks: 39 fresh normal-logger checks, 781 inherited after exact source-hash validation.** Other production files match beta.1 except the bridge, version, logger version and notice version. Existing renderer/retrieval/playback fixture evidence is inherited rather than described as fresh device testing.

Reopening Library on the Samsung phone remains required acceptance. Native playback/decoder/queue, Audio/Video switching, offline actions, sheet/Downloads appearance, Samsung navigation, Shaders and recording-free lyric smoothness remain phone checks. The approved matching-component catalogue stays inside Library Downloads; the stock offline database is untouched. No MuMu/device, signing, installation, actual media downloading or cleanup operations occurred.

Refresh the beta source with Pre-release patches and Experimental app versions enabled and **repatch a supported original APK**. Refreshing the feed alone does not fix an installed APK. The playlist-header download button uses your configured mode: In-app shows one Audio/Video sheet for the batch; External sends the playlist URL to the selected app; Default retains native handling. Enable Download playlist during patch selection for in-app batching, not as an extra per-download menu step. Existing Enable debug logging / Export debug logs remains available without a timer.

Three categories: Full Collection, Shaders and Playlist downloads. The Lyrics-only Add-on is retired. Do not combine complete collections.

[Build](BUILDING.md) | [Compatibility](COMPATIBILITY.md) | [Implementation](IMPLEMENTATION.md) | [Verification](verification.json) | [Patch metadata](patches-list.json) | [Pins](SOURCE-PINS.json) | [Notices](THIRD-PARTY-NOTICES.txt)
