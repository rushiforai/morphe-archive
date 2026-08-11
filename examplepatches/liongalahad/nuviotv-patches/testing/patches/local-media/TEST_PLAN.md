# Local Media test plan

- [x] Unit tests cover disabled-by-default persistence, idempotent nested default-folder creation, picker-handler filtering, file classification, exact sidecar matching, and immutable Player-route construction.
- [x] Every fingerprint matches exactly once on universal, x86_64, arm64-v8a, and armeabi-v7a NuvioTV 0.8.3-beta APKs.
- [x] Isolated patch application and manifest/DEX inspection pass on all declared assets.
- [x] Combined x86_64 and universal builds apply all seven current patches without a fingerprint, resource, or DEX conflict.
- [x] Turning Local Storage on without access opens Android's storage-access consent automatically, creates `Movies/Nuvio` immediately after the grant, and exposes no separate permission setting.
- [x] `Folder location` is the only folder action; the manifest makes `OPEN_DOCUMENT_TREE` handlers package-visible, enumerates real handlers, and never accepts Android TV's stub as the final answer.
- [x] If no real folder-tree handler exists, a patch-owned D-pad folder browser opens and persists the selected path instead of reporting that no picker is installed.
- [x] TV AVD grants `Movies/Nuvio`, lists an H.264 MKV, and reports its exact-basename SRT.
- [x] TV AVD verifies video, audio, seek, subtitle discovery/selection, folder navigation, search/filtering, refresh, back navigation, and relaunch persistence.
- [x] TV AVD verifies the Storage search placeholder, focus state and typed text use the native Cloud search field's size, colors and behavior.
- [x] TV AVD verifies exiting an ended local file restores the Storage selection view rather than navigating to catalogue details.
- [x] TV AVD verifies Saved, Cloud, streaming playback, and the separate Local Storage subtitle importer remain intact.
- [x] Force-stop, full emulator reboot, and malformed or missing folder access produce no crash, ANR, `VerifyError`, or fatal app log.
- [ ] Real Android TV acceptance evidence is recorded before stable release.

## 2026-08-10 evidence

- Extension tests and the Morphe bundle build passed before the final runtime builds.
- Final isolated 0.8.3-beta runs: `20260810-183547-x86_64`, `20260810-183611-universal`, `20260810-183651-arm64-v8a`, and `20260810-183713-armeabi-v7a`.
- Final six-patch builds: `all-patches-20260810-185049-x86_64` and `all-patches-20260810-185217-universal`; both reports contain six applied patches and no failed patches.
- The combined x86_64 APK installed on `Television_4K`, launched `com.nuvio.tv/.MainActivity`, retained a running app process, and produced no app crash or bytecode verification error.
- `Television_4K` listed `Nuvio.Local.Media.Sample.mkv` (H.264/AVC, Vorbis audio) and one exact-basename SRT, played through ExoPlayer, exposed and selected `Nuvio.Local.Media.Sample.srt`, displayed its cues, and retained access after a full reboot.
- The TV firmware exposes only a stub for `OPEN_DOCUMENT_TREE`. AnExplorer 6.0.6 registers file-document actions but not the folder-tree action, and forcing its activity into tree mode produces an empty root list. The fallback opens Android TV's `Allow access to manage all files` screen and then the patch-owned D-pad folder browser.
- Saved and Cloud rendered and switched normally. A regular AIOStreams H.264 MKV stream reached ExoPlayer `isPlaying=true`. The independent subtitle importer's `Local Storage` row remained present in the combined playback menu.
- Missing access rendered the access/fallback state without a fatal log. Runtime logs contained no app crash, ANR, `VerifyError`, or `NoWhenBranchMatchedException`.
- The earlier combined universal and side-by-side builds were superseded after the picker, end-of-playback, and subtitle fixes; final artifact evidence is recorded below.
- The patched manifest contains an `OPEN_DOCUMENT_TREE` visibility query, the two Local Media proxy activities, the internal folder-browser activity, and the required version-scoped storage declarations.
- On the Android 36 TV AVD, `Movies/Nuvio` was moved to a recoverable validation backup. Disabling and re-enabling Local Storage recreated the missing directory immediately; the original MKV/SRT tree was then restored unchanged.
- The 46.6-second local MKV reached ExoPlayer `isPlaying=true` and `STATE_ENDED`. Exiting the ended player returned to the same Library `Storage` grid with `Nuvio.Local.Media.Sample.mkv` visible and no metadata-details error or fatal log.

## 2026-08-11 evidence

- With official AnExplorer TV 6.0.6 installed, `Folder location` fell through the unusable Android TV stub to the built-in D-pad browser. Selecting `Download/NuvioAlternate` immediately replaced the previous `Movies/Nuvio` scan with only `Alternate.Sample.mkv`, retained its exact-basename SRT, and survived force-stop/relaunch.
- The Storage header rendered `STORAGE`; the search control rendered `Search storage library` through the native Cloud search component.
- Saved, Cloud, and Storage each returned focus to their own active mode after Down then Up.
- The imported-subtitle rail retained a count of exactly one after repeated Local Storage/None focus changes. The picker action remained unticked, the active imported row held the sole tick, and one manual selection produced one media refresh followed by normal track updates.
- Final changed-compartment applications passed on x86_64 and universal for `local-media`, `local-storage-subtitles`, and `library-mode-focus-fix` under run stamp `20260811-005652`.
- Final combined builds applied exactly seven patches with no failed patch: x86_64 `20260811-005958` (`7506d48fab66ee2a400adbaaf59ec3388e9fcf5c5e2fe4a3e86d051cfdda4066`) and universal `20260811-011419` (`8e3e0cf6f1e45b59f7ec57d35dd8c4067207581e6dbe43f167e23fca9951794b`).
- On the final combined x86_64 build, `Alternate.Sample.mkv` reached ExoPlayer Playing with one internal sidecar track, naturally reached playback state 4, and returned automatically to the same `STORAGE` grid without a black paused player or catalogue metadata screen.
- The final universal side-by-side repackage uses package `com.nuvio.morphe`, has seven unique `com.nuvio.morphe` provider authorities, retains the internal folder picker, verifies under APK Signature Schemes v2 and v3, and installs and launches beside `com.nuvio.tv` without a fatal startup log. SHA-256: `ecc89a5f14b412de7fee3d36cf8529ab57b6b162459d5203c59e2a51f25047b3`.
