# Local Media test plan

- [x] Unit tests cover fresh-default On and stored Off persistence, idempotent nested default-folder creation, picker-handler filtering, file classification, exact sidecar matching, and immutable Player-route construction.
- [ ] Confirm launch and toggling Local Media never opens a permission screen; first entry into Library > Storage requests access once when needed, denial shows a retry action, and a selected path suppresses the request.
- [x] Every fingerprint matches exactly once on universal, x86_64, arm64-v8a, and armeabi-v7a NuvioTV 0.8.4-beta APKs.
- [x] Isolated patch application and manifest/DEX inspection pass on all declared assets.
- [x] Combined x86_64 and universal builds apply all eight current patches without a fingerprint, resource, or DEX conflict.
- [x] Turning Local Storage on without access opens Android's storage-access consent automatically, creates `Movies/Nuvio` immediately after the grant, and exposes no separate permission setting.
- [x] `Folder location` is the only folder action; the manifest makes `OPEN_DOCUMENT_TREE` handlers package-visible, enumerates real handlers, and never accepts Android TV's stub as the final answer.
- [x] If no real folder-tree handler exists, a patch-owned D-pad folder browser opens and persists the selected path instead of reporting that no picker is installed.
- [x] With direct access, verify the D-pad browser lists and opens an emulated removable volume using Android's mounted-volume inventory rather than direct `/storage` directory scanning.
- [x] TV AVD grants `Movies/Nuvio`, lists an H.264 MKV, and reports its exact-basename SRT.
- [x] TV AVD verifies video, audio, seek, subtitle discovery/selection, folder navigation, search/filtering, refresh, back navigation, and relaunch persistence.
- [x] TV AVD verifies the Storage search placeholder, focus state and typed text use the native Cloud search field's size, colors and behavior.
- [x] TV AVD verifies exiting an ended local file restores the Storage selection view rather than navigating to catalogue details.
- [x] TV AVD verifies Saved, Cloud, streaming playback, and the separate Local Storage subtitle importer remain intact.
- [x] Force-stop, full emulator reboot, and malformed or missing folder access produce no crash, ANR, `VerifyError`, or fatal app log.
- [x] TV AVD long-presses a root folder, cancels once, then confirms Delete Folder and verifies only that folder is removed.
- [x] TV AVD long-presses a file, verifies matching sidecars are removed, verifies a sibling-video folder remains, and verifies a no-playable-files folder is removed.
- [x] Verify the one-option folder/file action popup opens during the remote hold using Android's native long-press timeout, not after button release.
- [x] Fully leave Library, mutate the selected folder, return to Storage, and verify the grid automatically rescans without pressing Refresh.
- [ ] Real Android TV acceptance evidence is recorded before stable release.

## Shared path compatibility

- [x] Local Media alone shows `Local Media`, then one unsectioned `Local storage path` row at the bottom of Playback.
- [x] Local Downloads plus Local Media shows one shared path row, ordered after both feature sections.
- [x] The path is greyed and skipped by D-pad focus when both features are off, and enabled when either feature is on.
- [x] A saved `playback.local_media.tree_uri` value migrates to `playback.local_storage.path` without losing the selected folder.

## 2026-08-15 evidence

- Android 36's emulated public volume appeared beside Internal storage in the patch-owned D-pad picker through `StorageManager`, accepted `SDCARD/Movies`, and survived force-stop/relaunch and an unmount/remount cycle.
- With Local Media enabled, Library > Storage scanned the selected removable volume, displayed `Bluey - Season 1` with its downloaded MKV, and short-pressing the folder opened its file picker without the earlier `VerifyError` or a crash.
- Local Media applied alone on all four declared assets. Local Media plus Local Downloads applied together on x86_64 and universal, and the complete nine-patch universal application applied with no failed patch.

## 2026-08-16 Android TV compatibility evidence

- Local player-route encoding now uses Android's API-1 `URLEncoder.encode(String, String)` overload instead of the API-33 `Charset` overload that caused `NoSuchMethodError` on Android TV 11 and older devices such as NVIDIA Shield.
- Route construction is inside the existing diagnostic guard, so any future URI-construction or Nuvio-navigation failure produces the retained Save log file popup instead of escaping without evidence.
- Robolectric route tests passed on API 28, API 30 and API 35, including a UTF-8 path, and the built DEX was inspected to confirm the compatible string overload.
- The exact signed side-by-side universal APK played the same local H.264/AAC file from Library > Storage through ExoPlayer on headless Android TV API 28 (x86), API 30 (x86, Shield-like profile) and API 36 (x86_64). Every run reached `isPlaying=true`, naturally ended, released the player, and contained no app fatal exception, `NoSuchMethodError`, unable-to-play toast or diagnostic failure popup.
- The complete extension suite passed 168 tests with zero failures, errors or skips; the universal bundle applied all nine patches with no failed patch.
- The all-nine side-by-side universal APK is zip-aligned, v2/v3 signed, contains all four native ABIs, and was copied byte-for-byte over the existing Google Drive filename. SHA-256: `A82A89010645BCEA1CD49AB739C9E4B2B1698B4104B3DEA90E0F61D4719369A5`.

## 2026-08-10 evidence

- Extension tests and the Morphe bundle build passed before the final runtime builds.
- Prior isolated 0.8.3-beta runs: `20260810-183547-x86_64`, `20260810-183611-universal`, `20260810-183651-arm64-v8a`, and `20260810-183713-armeabi-v7a`.
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
- Earlier combined builds applied the then-current seven patches with no failed patch: x86_64 `20260811-005958` (`7506d48fab66ee2a400adbaaf59ec3388e9fcf5c5e2fe4a3e86d051cfdda4066`) and universal `20260811-011419` (`8e3e0cf6f1e45b59f7ec57d35dd8c4067207581e6dbe43f167e23fca9951794b`).
- On the final combined x86_64 build, `Alternate.Sample.mkv` reached ExoPlayer Playing with one internal sidecar track, naturally reached playback state 4, and returned automatically to the same `STORAGE` grid without a black paused player or catalogue metadata screen.
- The final universal side-by-side repackage uses package `com.nuvio.morphe`, has seven unique `com.nuvio.morphe` provider authorities, retains the internal folder picker, verifies under APK Signature Schemes v2 and v3, and installs and launches beside `com.nuvio.tv` without a fatal startup log. SHA-256: `fbbbed862566098d5bfb2cc455cefcf9d2ba00cdbbb9481a1e3912dba698fd80`.
- Final shared-storage builds applied Local Downloads + Local Media on x86_64 `final-local-storage-combined-20260811-232430-x86_64` and universal `final-local-storage-combined-20260811-232518-universal`; the all-eight builds passed on x86_64 `final-all-eight-20260811-232612-x86_64` and universal `final-all-eight-20260811-232706-universal`.
- With both feature toggles off, `Local storage path` rendered disabled and D-pad focus skipped it. Either Local Downloads or Local Media enabled the same single bottom row; an arbitrary path selection remained shared across both patches.
- Deleting the direct file in `QA Final File` removed the matching subtitle sidecar and then removed the containing folder because no playable file remained, including unrelated non-playable notes. Deleting `QA Final Folder` removed its nested contents recursively. A separate sibling episode folder and the preserved Bluey S1E2 media remained untouched.

## 2026-08-12 evidence

- Fresh isolated Local Media applications passed on x86_64, universal, arm64-v8a and armeabi-v7a under `20260812-020054`; the isolated TV runtime showed Local Media and the shared path without Local Downloads controls.
- Holding a Storage root folder opened its `Delete Folder` action card during the native hold interval. After backing out, opening the folder and holding the MKV opened `Delete File`; pending state did not leak between menus.
- A temporary `MorpheRefreshProbe/refresh-probe.mp4` appeared automatically after completely leaving Library and returning to Storage. The exact temporary file and then-empty folder were removed afterward; the Bluey S1E2 MKV and eight sidecars remained intact.
- The final all-eight x86_64 build `final-all-20260812-021337-x86_64` launched with Storage, Saved and Cloud available and no crash, ANR, VerifyError or missing-class failure.
- The final follow-up build `final-all-20260812-223352-x86_64` resolved the active key window for both the Storage grid and the folder file-picker dialog. A held Select showed `Delete Folder` and `Delete File` before key-up; file Back restored the file picker once, and folder Back returned to the grid once.
- The zero-repeat hold follow-up anchors Storage's long-press timer to the first select-key down. The full extension suite passed 140 tests with zero failures, errors or skips; fresh isolated Local Downloads and all-eight x86_64 applications applied with no failed patches. On the TV AVD, timed two-second holds showed both `Delete Folder` and `Delete File` with their action activities already top-resumed at the 750 ms pre-release capture.
- A 30-second Select stress hold left the one-option action open without activating it. A later deliberate Select opened confirmation, proving held-key repeats are isolated from the new activity. No delete was confirmed; Bluey S1E2 remained at one MKV plus eight sidecars.
- The final extension suite passed 133 tests with zero failures, errors, or skips.

## 2026-08-13 evidence

- Storage folder and native file-row buttons receive an exact row-owned preview-key target before entering Nuvio's TV Button; short presses and native focus rendering remain owned by the original button.
- The emulator hold is launched as a background input process and sampled independently, avoiding the invalid `input --async` assumption that had sampled only after key-up. At 750 ms the three-second input process was still running, `LocalMediaActionActivity` was already top-resumed, and the visible action was `Delete Folder` for the focused `Fist of the North Star` card.
- Runtime logs independently recorded `Storage row key down target=Fist of the North Star` followed by `Storage direct long-press timeout target=Fist of the North Star` before the held input process exited.
- The final extension suite passed 141 tests with zero failures, errors or skips. Fresh Local Media-only and all-eight patch applications succeeded on x86_64 and universal inputs with no failed patch.
- On the freshly installed all-eight x86_64 build, a focused `Silo` Storage folder opened the native-styled `Delete Folder` action at the 750 ms sample while the three-second Select process was still active; one Back closed the action and restored `MainActivity`.
- The final all-eight universal side-by-side APK is package `com.nuvio.morphe`, label `Nuvio Morphe`, contains all four native ABIs and seven unique renamed authorities, is zip-aligned and v2/v3 signed, installs beside `com.nuvio.tv`, and was copied byte-for-byte to `G:\My Drive`. SHA-256: `10A1F072BEE21F8127DA1031BEB002C0D6D8940CE45294D02B4CDDA9A055C62C`.
- Follow-up short-press testing found that the file-row hook had been inserted after its model register was reused as an integer key, causing Android to reject `na.y` with a `VerifyError` when a folder opened. The hook now captures the exact `y8.a` model immediately after its checked cast, before any register reuse.
- On the corrected all-eight x86_64 build, short-pressing `Fist of the North Star` opened its native file dialog and one Back restored the Storage grid. Timed three-second holds still opened `Delete Folder` and `Delete File` at the 750 ms sample before release, and one Back dismissed each action. The complete run contained no app fatal exception or `VerifyError`.

## NuvioTV 0.8.5-beta automated port evidence

- [x] The 198-test extension suite passed with zero failures, errors, or skips.
- [x] This patch applied alone with an exact single match on x86_64, arm64-v8a, armeabi-v7a, and universal official APKs.
- [x] Each isolated output passed SHA-256 input verification plus post-patch manifest, injected-class, and forbidden-type inspection.
- [x] The combined ten-patch x86_64 and universal builds applied without a failed patch and passed APK signature and alignment verification.
- [x] The combined x86_64 side-by-side build installed and launched on `Television_4K`; its process remained alive with no startup `FATAL EXCEPTION`, `VerifyError`, or package ANR.
- [ ] Patch-specific D-pad, persistence, navigation, playback, and media behavior remains manual and is not marked passed by this automated port.
- [ ] Real Android TV acceptance remains pending.

## 2026-08-18 NuvioTV 0.8.5-beta runtime regression evidence

- The original port crashed when Library opened because it still constructed 0.8.4-obfuscated Compose and library model types. The patch now discovers the target's native button, text, search, card, dialog, empty-state, icon, cloud-item and file-model owners before configuring the isolated Local Media runtime.
- On `Television_4K`, the final ten-patch x86_64 build opened Library Saved, Cloud and Storage, rendered the storage search and folder/file rows, opened `Movies`, and displayed its native file-choice dialog without a fatal exception or `NoWhenBranchMatchedException`.
- `Storage.Movie.Sample.mkv` and `Nuvio.Local.Media.Sample.mkv` both reached visible H.264 playback. The final playback logs contain no app fatal, `VerifyError`, `PlaybackException` or `ExoPlaybackException`.
- The final 0.8.5-beta Local Media patch applied alone on x86_64, arm64-v8a, armeabi-v7a and universal. The complete ten-patch x86_64 and universal outputs applied all ten patches with no failure and passed alignment/signature verification.
- Real Android TV acceptance remains pending because no physical TV was connected to this workspace.

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

- Opening Library > Storage initially exposed two R8 moves: the mutable-state factory changed from `e1.j.q(Object)` to `e1.j.s(Object)`, and the grid-span packer moved from `t6.a.c(int)` to `k6.g.b(int)`. Both lookups now use verified signatures rather than method names.
- The corrected combined nine-patch x86_64 build rendered Saved, Cloud and Storage, discovered four local fixtures, launched the focused H.264 file through Nuvio's player route, attached its same-basename SRT, and returned to the Storage grid without a fatal or reflection error.

## 2026-08-25 dialog-dispatch regression evidence

- The combined nine-patch episode-options crash was a verifier failure in Nuvio's Compose dialog wrapper: the injected `dispatchKeyEvent` called an obfuscated non-super owner. The patch now derives the dispatch owner from the target's original `onTouchEvent` super call and requires it to be `android.app.Dialog`.
- Post-patch Smali inspection requires `invoke-super {p0, p1}, Landroid/app/Dialog;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z` and rejects the former `Lc/o;` call.
- The final isolated Local Media applications passed on x86_64, arm64-v8a, armeabi-v7a, and universal. The final all-nine candidates passed on all four inputs, and episode options opened on Android TV API 28, 30, and 36 without a package fatal exception or `VerifyError`.
