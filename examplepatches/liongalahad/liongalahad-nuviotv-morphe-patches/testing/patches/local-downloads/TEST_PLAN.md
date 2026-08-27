# Test plan

- [x] Run all extension unit tests, including fresh-default On, stored Off, autoplay, percentage arithmetic, route identity, source eligibility, player-route persistence and Local Media tagged sidecars.
- [x] Verify generic storage consumers require write access only while an enabled writer is registered; Local Media-only read access remains valid.
- [x] Verify raw write selection uses a real create/delete probe with no lasting file, rejects missing/non-directory paths, and SAF selection requires both read and write grants for an enabled writer.
- [x] On a Fire TV AFTKA running Fire OS 9 with removable SanDisk USB storage, enter the drive without a root write precheck, choose a child folder, and verify the visible create/write/read/delete diagnostic reports the exact `CREATE_FAILED` permission-denied stage.
- [x] On the reporter's Fire TV, verify an actual download succeeds in Nuvio Morphe's app-owned folder on the removable drive.
- [x] On the Android TV API 36 AVD with emulated removable `SDCARD`, deny broad raw storage access, verify the framework document stub is rejected, select the explicit private-app-folder fallback entirely by D-pad, accept the uninstall warning, and verify its write/read/delete probe passes, leaves no test-file residue, and saves `SDCARD/Nuvio Morphe/Downloads`.
- [ ] On Android TV, revoke All files access or remount the selected drive read-only; verify Download reports that the path is not writable and opens write-capable folder selection before source resolution.
- [x] Confirm launch and toggling Local Downloads never opens a permission screen; the first Download action requests access when needed, denial reports a retryable access requirement, and a selected path suppresses the request.
- [x] Match every fingerprint exactly once on every declared Nuvio 0.8.4-beta APK asset.
- [x] Apply and inspect Local Downloads alone.
- [x] Apply and inspect Local Media alone after the shared-path compatibility change.
- [x] Apply and inspect Local Downloads plus Local Media; confirm one Local storage path row and correct settings order.
- [x] Apply the complete optional-patch set to detect hook or manifest conflicts.
- [x] Install on the Television_4K AVD and verify settings navigation, OFF behavior and persistence.
- [x] Enable downloads, long-press a TV episode, select Download to storage and choose a small direct source.
- [x] Verify the preflight size, live progress, Hide continuation, completion popup and title-folder output.
- [x] Verify a series episode is stored in `Title - Season n` and a movie remains in `Title`.
- [x] Set distinct primary and secondary subtitle languages; verify only those language sidecars are downloaded and exposed to Media3.
- [x] Repeat while another title is playing and confirm hidden completion remains silent.
- [x] Start a second small transfer and Cancel; verify its `.partial` file is gone.
- [x] Cancel during a source check that has not returned yet; verify the active connection is disconnected and the popup closes instead of remaining on Cancelling.
- [x] Set a deliberately low storage percentage and verify the file-too-large guidance.
- [x] Verify `Maximum usable selected storage` uses the native slider, maps 1, 5, 10 ... 95, 100, defaults to 80, and updates at the native control speed.
- [x] Verify the settings row and progress popup both show one-decimal used/total selected-volume GB and parenthesized percent full.
- [x] On the TV AVD, select the emulated removable volume with only a D-pad; verify its path label and capacity persist after force-stop/relaunch.
- [x] Download a small AVC TV episode to the emulated removable volume and verify its video and preferred-language subtitle sidecars are stored there.
- [x] Unmount the selected removable volume; verify unavailable status and safe download failure, then remount it and verify automatic recovery.
- [x] Cancel or fail one source, select a second source without leaving the picker, and verify it still downloads; leave the picker and verify Play manually starts ordinary playback.
- [x] Open Downloads, verify row separation and a visible TV focus outline, press an entry to play it, then hold an entry until one Play/Delete action popup appears; press Back once and verify it returns immediately to the list. Cancel deletion and verify Delete all downloads confirmation never targets manual files.
- [x] Hide an active transfer, return to its exact movie or episode, and verify every former Download to storage action reads Download in progress... and restores the same progress popup; verify a different episode retains Download to storage.
- [x] Start an episode transfer and verify its notification and every progress-state popup use `Title · SnnEnn`; verify movies remain title-only.
- [x] Long-press the downloaded episode and play the local copy; then enable autoplay-local and verify normal Play chooses it.
- [x] Verify a different episode never reuses the downloaded file.
- [x] Verify downloaded addon subtitle sidecars are selectable in Media3.
- [x] Verify the downloaded badge mirrors the watched tick inset, coexists with watched state, updates without leaving the detail page, and appears only on exact downloaded episodes.
- [x] Verify Delete local file confirmation, cancel, video/sidecar removal, index removal, immediate badge removal, empty-folder cleanup, and preservation of a non-empty sibling episode folder.
- [x] Open an undownloaded movie detail page and verify the arrow-down action is immediately right of Watched, matches native size/spacing/colours, enlarges with D-pad focus, opens its popup, dismisses on one Back, and hands `Download to storage` to the existing source picker.
- [x] Verify stable content-id movie lookup when the detail video id differs from the downloaded source id, including the legacy title fallback; confirm the downloaded detail action and Play long-press expose Play/Delete instead of Download.
- [x] Inspect logcat for crash, ANR, VerifyError, foreground-service and storage-provider failures.

## 2026-08-24 issue 12 storage-write evidence

- The final extension suite passed 202 tests and the patcher suite passed three tests, with zero failures, errors or skips. New coverage verifies enabled writer capability, legacy read/write permission separation, SAF grant requirements, create/delete probing without residue, rejection of missing saved folders, and first-use creation of only the default download directory.
- Final isolated applications passed for Local Downloads and Local Media on x86_64, universal, arm64-v8a and armeabi-v7a. The Local Downloads runs are `20260824-144802-x86_64`, `20260824-144830-universal`, `20260824-144922-arm64-v8a` and `20260824-144951-armeabi-v7a`; the Local Media runs are `20260824-145024-x86_64`, `20260824-145058-universal`, `20260824-145152-arm64-v8a` and `20260824-145225-armeabi-v7a`.
- Final combined x86_64 `20260824-145316-all-nine-x86_64` and universal `20260824-145409-all-nine-universal` applications each applied all nine patches with zero failed patch, valid ZIP alignment and a valid APK signature. Final bundle SHA-256: `97B0B1EA65DB5DB5BA2016AB3597CA101AD4EA6DD7A72ACBCF49750E9D8B3E8F`.
- On the Android 36 `Television_4K` AVD, the write-capable TV picker accepted writable internal storage, persisted its label, and left no `.morphe-write-*` probe file. After revoking All files access, reopening Local storage path did not accept the raw selection and instead opened Android's All files access screen. Access was restored after the check.
- The final isolated universal APK installed and cold-launched on the same AVD with a live process and no startup fatal exception, ANR or `VerifyError`; no write-probe residue was present. A real Download action after revocation/read-only remount remains the unchecked manual acceptance item above and is not claimed by this evidence.
- The later crash-regression pass resolved the existing lint errors with scoped API guards and exact suppressions. Final lint evidence is recorded in the 2026-08-25 section below.

## 2026-08-25 crash regression and final-candidate evidence

- The exact final source passed 202 extension tests and three patcher tests with zero failures, errors, or skips. `lintRelease` completed successfully with zero errors, and a fresh Android patch bundle build completed in the same Gradle invocation.
- The episode-card hook now preserves Nuvio's live Compose registers and calls `renderDownloadedEpisodeBadge(Object, Object, Object)` with the original composer/data-flow values. The patch requires the expected `p2` composer flow and refuses to apply if that invariant changes.
- Local download source resolution now uses the verified Nuvio 0.8.7 contracts `c0.u.a` and `w.n.g`. Post-patch Smali gates require both target contracts and the corrected episode-card call before an APK is accepted.
- The final isolated matrix at `local/verification/final-isolated-20260824-232038` passed all 36 combinations: nine optional patches applied independently to x86_64, arm64-v8a, armeabi-v7a, and universal official APKs. Every result contains one successful patch, no failed patch, and all configured manifest, DEX, and Smali inspections passed.
- The final combined candidates at `local/verification/final-all-nine-20260824-233810` applied all nine patches with zero failures for all four inputs. Each APK has a valid signature, side-by-side package `com.nuvio.morphe`, and the exact expected native ABI set. Universal SHA-256: `27A890D6A5234C44F8CB8C63069FA966B29A6051213BFE1AA77A301BCCCAD431`.
- On fresh Android TV API 28 and API 36 AVDs, Reacher detail loaded, episodes rendered, S1E1 long-press opened the native options list, and `Download to storage` entered the permission/source flow. Jack Reacher movie detail also opened the patch popup and entered Nuvio's movie source flow. The app process remained alive with no package fatal exception or `VerifyError`.
- On the preserved Android TV API 30 AVD, the exact non-debuggable final universal APK downloaded the controlled Reacher S1E1 direct progressive source. The pulled 20,804-byte file exactly matched the source SHA-256 `67B5004CE3B676CBDF2857D831633BE16C156D33556C3F866982DE7303DB0BD6`.
- The same final APK immediately rendered the episode download badge, exposed `Play local file` and `Delete local file`, and played the downloaded file through ExoPlayer as H.264 640x360 to end of stream without a fatal exception or playback failure.

## 2026-08-15 evidence

- Android 36's virtual-disk mode exposed `public:253,80` as mounted volume `0000-0000`. The patch-owned TV picker listed both Internal storage and SDCARD, accepted `SDCARD/Movies` using only D-pad input, and retained that path after force-stop/relaunch.
- The selected removable volume reported `0.0 GB used / 0.5 GB total`, while the same settings screen had reported the internal volume as `4.9 GB used / 5.8 GB total` before selection. The selected-volume caption persisted independently of whether Local Media was enabled.
- A controlled progressive H.264/AVC Bluey S01E02 source transferred exactly 279,826,407 bytes to `SDCARD/Movies/Bluey - Season 1/Bluey.S01E02.Storage.Test.mkv`. Preflight used the removable volume's 534,706,176 free bytes and 427,764,940-byte 80% allowance. The live and completion popups identified `Bluey · S01E02` and showed the removable volume's 0.5 GB total.
- Subtitle retrieval resolved four current preferred-language `[en]` addon candidates and saved four `.eng.srt` sidecars with the video stem on the removable volume. The separate primary-English/secondary-Italian acceptance run remains recorded in the 2026-08-13 evidence.
- Unmounting the selected drive changed settings to `Selected storage usage unavailable`, hid the temporarily unreadable indexed item, and made a new transfer fail with reconnection guidance instead of falling back to internal storage. Remounting restored the same files, `0.3 GB used / 0.5 GB total`, and one Downloads item without reselecting a path.
- Local Media's Storage library found `Bluey - Season 1`, reported one playable file, and short-pressing the folder opened the file picker without a crash. Runtime logs contained no Nuvio fatal exception, ANR, `VerifyError`, or missing extension class.
- The extension suite passed 162 tests with zero failures, errors, or skips. Local Downloads and Local Media each applied alone on universal, x86_64, arm64-v8a, and armeabi-v7a; their combined x86_64 and universal applications also passed with no failed patch.
- The complete universal application applied all nine patches with no failure. Its side-by-side artifact is package `com.nuvio.morphe`, label `Nuvio Morphe`, version `0.8.4-beta`, contains arm64-v8a, armeabi-v7a, x86, and x86_64 plus seven unique renamed authorities, is zip-aligned and v2/v3 signed, and installed and launched beside `com.nuvio.tv`. It was copied byte-for-byte to `G:\My Drive\NuvioTV-0.8.4-beta-Morphe-all-9-patches-SIDE-BY-SIDE-universal-20260815.apk`. SHA-256: `448218C9AA1BDD8090F9BBF964D01E4A14D7DDE5654B063A62585B98DB8C23B4`.

## 2026-08-16 Android TV compatibility evidence

- Manual downloaded-entry playback and automatic downloaded-file route rewriting now use Android's API-1 `URLEncoder.encode(String, String)` overload instead of the API-33 `Charset` overload that could fail before Nuvio received the local player route on Android TV 11 and older.
- Manual playback arms diagnostics before route construction and reports URI or navigation-handoff failures. Automatic local playback reports the same class of failure and safely retains the original streaming route.
- Robolectric downloaded-route tests passed on API 28, API 30 and API 35 with UTF-8 paths. Built DEX inspection confirmed that both runtime paths call the compatible string overload and do not retain the incompatible signature.
- The exact signed all-nine side-by-side APK completed actual local ExoPlayer playback on Android TV API 28, API 30 Shield-like and API 36 headless profiles without a fatal exception, `NoSuchMethodError`, unable-to-play toast or diagnostic failure popup.
- The complete extension suite passed 168 tests with zero failures, errors or skips; the universal build applied all nine patches with no failed patch, while the diagnostic popup and same-folder log export remain included.
- The zip-aligned, v2/v3-signed universal APK contains all four native ABIs and was copied byte-for-byte to `G:\My Drive\NuvioTV-0.8.4-beta-Morphe-all-9-patches-SIDE-BY-SIDE-universal-20260815.apk`. SHA-256: `A82A89010645BCEA1CD49AB739C9E4B2B1698B4104B3DEA90E0F61D4719369A5`.

## 2026-08-16 hidden-progress restoration evidence

- A controlled 48 MB Bluey S01E02 transfer ran in the exact signed all-nine APK on the headless Android TV API 30 Shield-like profile. The popup was hidden at 1.1 MB, the episode detail page remained usable, and holding S01E02 changed only its final action from `Download to storage` to `Download in progress...`.
- Selecting `Download in progress...` restored the existing Bluey S01E02 popup at 15.4 MB without opening the source picker or creating a second transfer. While that transfer remained active, holding S01E03 still showed `Download to storage`.
- Cancelling from the restored popup reported `Download cancelled`, removed the partial transfer, and immediately returned S01E02's underlying action to `Download to storage`. Runtime logs contained no Nuvio fatal exception, ANR, `VerifyError` or missing extension class.
- Robolectric covers the matching movie popup, exact-episode match, different-episode exclusion, hidden-state clearing and progress-activity launch. The complete extension suite passed 170 tests with zero failures, errors, skips or regressions.
- The all-nine universal patch application completed with no failed patch. Its side-by-side APK is package `com.nuvio.morphe`, label `Nuvio Morphe`, version `0.8.4-beta`, contains all four native ABIs, is zip-aligned and v2/v3 signed. It was copied byte-for-byte over `G:\My Drive\NuvioTV-0.8.4-beta-Morphe-all-9-patches-SIDE-BY-SIDE-universal-20260815.apk`. SHA-256: `88EC0FB3E35FA7DB8719D783E7CC840EBCE077E844EADF14D808ED8B99CD68E9`.

## 2026-08-12 evidence

- The final movie-detail side-by-side universal APK retains package `com.nuvio.morphe`, label `Nuvio Morphe`, all four native ABIs and seven unique renamed authorities. It is zip-aligned, v2/v3 signed, installs and launches beside `com.nuvio.tv`, and was copied byte-for-byte to `G:\My Drive`. SHA-256: `07615894CAB2719FE7429C30436EC2EEC44C92A1FBC5E9D3B086AFD58D72B69E`.
- The final Local Downloads-only x86_64 application is `movie-detail-isolated-20260812-235000-x86_64`; its result contains exactly one applied patch, no failed patch, and both the movie action activity manifest entry and DEX class. The final patch-bundle SHA-256 is `D1D8B957ADB51926F985D7EB44473BBBB77D6D71892A57E9D7B8ACF88C0DBE0F`.
- A controlled readable movie entry used `contentId=tt37287335` with a deliberately different source-specific video id. Obsession detail rendered the selected white Downloaded action, its popup showed `Play local file` / `Delete local file`, and Play long-press showed those same local actions instead of `Download to storage`. The temporary entry was removed and the normal signed runtime build restored afterward.
- The movie-detail follow-up suite passed 137 tests with zero failures, errors or skips. Its x86_64 all-eight runtime build is `movie-detail-20260812-230717-x86_64`.
- On the TV AVD, the new movie arrow action rendered directly to the right of Watched at the same 96 px native action size. D-pad focus enlarged it to 106 px and changed it to the native white selected surface. The popup matched the app's TV card style, one Back dismissed it, and `Download to storage` opened the existing Obsession source picker without a crash.
- The final follow-up suite passed 133 tests with zero failures, errors or skips. The last x86_64 runtime build before universal packaging is `final-all-20260812-223352-x86_64`.
- The duplicate TV long-press callbacks are now coalesced into one Downloads action activity. A real emulator hold produced one `Play local file` / `Delete local file` popup, and one Back press returned directly to the Downloads list.
- The combined follow-up suite passed 131 tests with zero failures, errors or skips. The final x86_64 all-eight build is `final-all-20260812-145952-x86_64`; the universal build is `final-all-20260812-151403-universal`.
- The refreshed side-by-side universal APK was installed successfully and copied byte-for-byte to `G:\My Drive`. SHA-256: `D154BE9F294B82691E43684C808739A339EF309F83A812B434F6B3DBCB4692C9`.
- The follow-up extension suite passed 129 tests with zero failures, errors or skips. New coverage verifies episode-aware transfer labels, indexed-entry playback, Downloads focus/list setup, and the two-action entry menu.
- On the TV AVD, the Downloads list showed 12 dp separation between four rows and a high-contrast outline on the selected row. Short press routed `Silo · S03E05` into Nuvio's local player; long press showed equally weighted, independently focusable `Play local file` and `Delete local file` buttons.
- A real Bluey S1E3 source attempt displayed `Bluey · S01E03` in the progress activity. The external source reset the connection before transferring data; the failure popup retained the exact episode label and no episode 3 partial or index entry remained. The preserved S1E2 folder remained at nine files.
- The follow-up isolated x86_64 build is `final-local-downloads-followup-20260812-101837-x86_64`; the fresh all-eight builds are `final-all-20260812-100407-x86_64` and `final-all-20260812-101910-universal`. All reports contain the expected applied patches and no failed patch.
- The final side-by-side universal APK retained package `com.nuvio.morphe`, label `Nuvio Morphe`, all four native ABIs and seven unique renamed authorities. It is zip-aligned, v2/v3 signed, installed over the existing emulator copy without a crash, and was copied byte-for-byte to `G:\My Drive`. SHA-256: `678D6D42D83316AEB8FC1CC4C234F69F0FD6D625AD6D37D95AA7FE365C61257E`.
- The final extension suite passed 125 tests with zero failures, errors or skips. The final patch-bundle SHA-256 is `c58d07e147d7bdc420aac25c63c888c9f9c4e91f321dd12e28d3d45a4bbc7783`.
- Fresh isolated applications passed on all four declared architectures for Local Downloads under `20260812-015847` and Local Media under `20260812-020054`. Isolated runtime checks confirmed that either patch shows only its own section plus the shared path.
- Fresh Local Downloads + Local Media builds passed on x86_64 `final-storage-20260812-020359-x86_64` and universal `final-storage-20260812-020453-universal`. Fresh all-eight builds passed with no failed patch; the final caption-adjusted builds are `final-all-20260812-021337-x86_64` and `final-all-20260812-021417-universal`.
- On the TV AVD, the earlier internal-volume test rendered the native slider at 80%, moved 80 -> 75 -> 80 with one D-pad step, and showed `4.9 GB used / 5.8 GB total (85% full)`. The same storage caption was verified in the download progress popup.
- Holding a Downloads-list entry opened its one-option action card during the hold. Delete-all confirmation described the Nuvio-owned scope and was cancelled without deleting anything.
- Holding a Library > Storage root folder opened `Delete Folder`; holding the episode file opened `Delete File`. Backing out cleared pending state, and no deletion occurred.
- A temporary manual folder appeared after fully leaving Library and returning to Storage without pressing Refresh, then was removed by an exact non-recursive cleanup. The preserved Bluey S1E2 folder remained intact with its 90,294,283-byte MKV and eight English sidecars.
- After a cancelled/failed episode 3 source, selecting another source within the same picker reopened Local Downloads. Leaving the picker cleared download mode; a subsequent Play manually source launched ExoPlayer directly and created no episode 3 file.
- Cancelling a transfer blocked in source checking returned to the picker rather than remaining on `Cancelling...`; no partial or episode 3 file remained.
- The final all-eight x86_64 build installed over the emulator app, launched normally, retained four indexed downloads and all nine Bluey S1E2 files, and produced no app crash, ANR, VerifyError or missing-class failure.
- The external-deletion follow-up adds readable-file reconciliation to the Downloads setting count and manager list. Unit coverage deletes and recreates an indexed file to confirm it disappears while absent and recovers after a simulated removable-drive reconnection; the raw private index remains intact during temporary unavailability. The full extension suite passed 140 tests with zero failures, errors or skips.
- The final all-eight universal side-by-side APK is package `com.nuvio.morphe`, label `Nuvio Morphe`, contains all four declared native ABIs and seven unique renamed authorities, is zip-aligned and v2/v3 signed, installs and opens Morphe settings beside `com.nuvio.tv`, and was copied byte-for-byte to `G:\My Drive`. SHA-256: `0630F2A9BBEDDBA587E84291C06F4994A6B4C7A71AA231392095A291D48F08A2`.

## 2026-08-11 evidence

- The extension unit suite and final bundle build passed. Final bundle SHA-256: `9afaa064cb8e15e216167bcf7d1a969599b0e859a09655bc3ff75cbf91ddec97`.
- Final Local Downloads-only builds passed on universal `final-local-downloads-20260811-232146-universal`, x86_64 `final-local-downloads-20260811-232241-x86_64`, arm64-v8a `final-local-downloads-20260811-232318-arm64-v8a`, and armeabi-v7a `final-local-downloads-20260811-232356-armeabi-v7a`.
- Final Local Downloads + Local Media builds passed on x86_64 `final-local-storage-combined-20260811-232430-x86_64` and universal `final-local-storage-combined-20260811-232518-universal`.
- Final all-eight builds passed on x86_64 `final-all-eight-20260811-232612-x86_64` and universal `final-all-eight-20260811-232706-universal`; both reports contain eight applied patches and no failed patch.
- On the TV AVD, an arbitrary `73%` value persisted and the default was restored to `80%`. At `1%`, a 2.5 GB direct source was rejected before transfer with smaller-source guidance and no partial file.
- A real Bluey S1E3 progressive H.264 source transferred 274,177,720 bytes, used `Bluey - Season 1`, and saved eight English preferred-language sidecars with the exact video stem. A malformed source name containing URL text was truncated at the real video extension by the final filename sanitizer.
- Hiding the progress popup kept the transfer running. It completed while full-screen playback remained `PLAYING`, stayed silent, and did not bring the progress activity to the foreground.
- Cancelling a second real transfer removed its `.partial` file and displayed `Download cancelled`.
- `Play local file` and autoplay-local both routed the exact indexed episode file. The AVD's HEVC decoder could not decode the preserved S1E2 source, but the local URI, episode identity and Media3 handoff were exact; H.264 streaming and download playback infrastructure was separately verified.
- The downloaded badge appeared only on exact downloaded cards at the top-right inset mirroring the watched tick. Deleting S1E3 removed its video, eight sidecars, index entry and badge immediately while preserving downloaded S1E2 and its eight sidecars.
- The final downloaded-item menu renders `Play local file` and `Delete local file` side by side with native button height, equal weight and an 8 dp gap. Both actions are reachable independently by D-pad; the delete confirmation matches the app's dialog and button styling.
- Runtime log inspection after the final x86_64 build found no app crash, ANR, `VerifyError`, Compose imbalance, foreground-service failure or storage-provider failure.
- The final all-eight universal side-by-side APK is package `com.nuvio.morphe`, label `Nuvio Morphe`, contains seven unique renamed authorities, is zip-aligned and v2/v3 signed, installs and launches beside `com.nuvio.tv`, and was copied byte-for-byte to `G:\My Drive`. SHA-256: `fbbbed862566098d5bfb2cc455cefcf9d2ba00cdbbb9481a1e3912dba698fd80`.

## 2026-08-13 evidence

- A retained pre-fix Bluey S01E04 runtime run with primary English and secondary Italian logged `Subtitle repository is unavailable for this APK architecture` and created no subtitle sidecars. The cause was the extension's architecture-specific obfuscated worker-name lookup, not the preferred-language filter.
- `SubtitleWorkerFingerprint` now resolves Nuvio 0.8.4-beta's exact subtitle coroutine (`x9.n3` on the x86_64 TV asset), and the extension resolved repository `x9.o3` directly from the stream view model. The fix is confined to Local Downloads and retains legacy worker names only as compatibility fallbacks.
- A post-fix Bluey S01E04 transfer fetched 22 addon candidates and resolved seven preferred-language candidates for `[en, it]`; all seven were English because that episode's live addons returned no Italian candidates.
- The conclusive TV AVD run used Nuvio's visible primary English and secondary Italian settings and a real direct Silo S03E05 episode transfer. Four subtitle addons returned 125 candidates; Local Downloads resolved 12 matches for `[en, it]` and saved ten `.eng.srt` plus two `.ita.srt` sidecars beside the 1,117,002,438-byte MKV in `Silo - Season 3`. No other language suffix was saved.
- The generated Silo test folder was removed after evidence capture. Three other emulator videos temporarily moved to create safe capacity and the pre-existing Silo test video were restored; all four restored SHA-256 hashes match their host backups exactly.
- The post-fix extension suite executed 158 tests with zero failures, errors or skips; `LocalDownloadsRuntimeTest` executed 38. Local Downloads applied in isolation to x86_64, arm64-v8a, armeabi-v7a and universal 0.8.4-beta assets with no failed patch. The universal all-eight build applied every intended patch with no failure.
- The final side-by-side universal APK is package `com.nuvio.morphe`, version `0.8.4-beta`, contains arm64-v8a, armeabi-v7a, x86 and x86_64 plus seven unique renamed authorities, is zip-aligned and v2/v3 signed, installed and launched without a fatal or verification error, and was copied byte-for-byte to `G:\My Drive`. SHA-256: `4F0439CC42B52DECA2E7BD2338B77C7FFF326E2E0D4F782F998607A09F2E4670`.
- The Library > Storage hold fix remains entirely in the Local Media patch. Fresh Local Media-only and all-eight applications passed on x86_64 and universal, while Downloads retained its existing working long-press path.
- External-deletion reconciliation remains covered in the 141-test extension suite: a missing indexed video is excluded from the Downloads count/list without erasing its index record, and becomes visible again when the same storage item is readable after reconnection.
- The final all-eight universal side-by-side APK was copied byte-for-byte to `G:\My Drive`. SHA-256: `10A1F072BEE21F8127DA1031BEB002C0D6D8940CE45294D02B4CDDA9A055C62C`.

## NuvioTV 0.8.5-beta automated port evidence

- [x] The 198-test extension suite passed with zero failures, errors, or skips.
- [x] This patch applied alone with an exact single match on x86_64, arm64-v8a, armeabi-v7a, and universal official APKs.
- [x] Each isolated output passed SHA-256 input verification plus post-patch manifest, injected-class, and forbidden-type inspection.
- [x] The combined ten-patch x86_64 and universal builds applied without a failed patch and passed APK signature and alignment verification.
- [x] The combined x86_64 side-by-side build installed and launched on `Television_4K`; its process remained alive with no startup `FATAL EXCEPTION`, `VerifyError`, or package ANR.
- [ ] Patch-specific D-pad, persistence, navigation, playback, and media behavior remains manual and is not marked passed by this automated port.
- [ ] Real Android TV acceptance remains pending.

## 2026-08-18 NuvioTV 0.8.5-beta settings regression evidence

- Expanding Morphe > Playback in the first combined port crashed because Nuvio 0.8.5 moved the native Timer icon factory from `x0.e.v()` to `x0.d.v()`. The Local Downloads settings compartment now discovers the static zero-argument Timer-icon factory from the supported native icon owners.
- The final ten-patch x86_64 build expanded Playback, rendered Restore source selection, Local Downloads and Allow local downloads, and retained a live process with no slider-render failure, `NoSuchMethodException` or fatal exception.
- Local Downloads was reapplied alone after the fix on x86_64, arm64-v8a, armeabi-v7a and universal. The complete x86_64 and universal outputs applied all ten patches with no failure and passed alignment/signature verification.
- Live source discovery and a new network download were not repeated in this emulator pass; those behaviors remain covered by the existing unit and prior Android TV evidence. Real Android TV acceptance remains pending.

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

- Morphe > Playback rendered Restore source selection, Local Downloads, Allow local downloads, path and storage controls after the 0.8.7 Compose helper moves. Restore Source Selection toggled twice and returned to its original state without a fatal or reflection error.
- A live addon-backed download was not started in this guest emulator run; network transfer behavior remains covered by focused unit tests and prior Android TV evidence.
