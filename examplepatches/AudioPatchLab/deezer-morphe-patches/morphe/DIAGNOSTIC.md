# Technical diagnostics

## Deezer 9.0.27.3 compatibility

The bundle port targets the original Android 8+ multi-architecture APKM from APKMirror (arm64-v8a, x86, and x86_64). The input archive SHA-256 is `ca4c9662e18f49d11b234c1c21437767d7afe1551aa28abf9dbabdaa1be7d83e`. Other archive variants have not been validated and may be rejected. Older app versions require their matching earlier bundle.

All eight public patches apply together, rebuild, and sign successfully. Comparing the patched DEX against the original finds no newly unresolved types, methods, or fields.

This version adds protected startup code. `StartupCompatibilityPatch.kt` restores Deezer's Application lifecycle, 1,560 static application strings, 20 extracted lifecycle methods, and 20 receiver/background callbacks. The callback implementations preserve media-button handling, Cast, shortcuts, and SDK dispatch; an obsolete SDK logging-only lambda is omitted. The encoded DEX data contains only the restored methods, not the complete application or account data.

Three native libraries also acquire protection: `libflacJNI.so`, `libquickjs.so`, and `libACRCloudUniversalEngine.so`. Their build IDs match the unprotected builds from the preceding app version for each supported ABI. `StartupNativeLibraries.kt` applies compressed byte-range deltas and checks both input and output SHA-256. Unsupported architectures or changed input files fail patching instead of producing an unchecked APK. The bundle does not contain complete native libraries.

The first authenticated Home screen can remain on its loading row. A delayed check runs after the Home fragment resumes. If that row is still the only item, the activity is recreated once per process to reset the stalled state. The check uses the loading-row type rather than the child position of its progress bar, and the process-wide guard prevents repeated recreation.

Runtime checks use an Android 14 x86_64 emulator with host GPU acceleration and all eight patches enabled together:

- Existing app-data upgrade and a fresh sign-in; automatic Home recovery confirmed.
- Album playback beyond 30 seconds, selection from library favorites, and opening lyrics.
- A profile recommendation played beyond 30 seconds with its full duration.
- Recently Played rows are selectable; the selected title played beyond 30 seconds.
- Player pause/resume through Android media controls, seeking, queue display, Play next insertion, and Add to queue (19 to 20 items).
- Playlist search filtered to one matching track; alphabetical sorting and restoration of default order.
- Ten consecutive next commands: each started a different track, the session remained authenticated, the playlist button settled on pause, and the crash buffer stayed empty.
- Downloading the test playlist, disabling networking, restarting the app, and playing a downloaded title.
- The downloads page does not show the Premium banner; zero profile counters display as zero.

Native restoration outputs for arm64-v8a and x86 are integrity-checked, but runtime validation does not cover physical ARM devices, Android Auto/Cast hardware, every region, or every advertising format. The server-side limitations documented in the README still apply.

## Disconnection after track changes

The test APK from November 17, 2026, before the fix already applied **Spoof playlog signature**. While playing successive tracks from *Discovery*, the trace recorded several HTTP 200 responses to `log.listen`, followed by an `EXPIRED_SESSION` in that same request. The app then received its invalid-credentials event and called its logout procedure. HTTP 200 alone is therefore insufficient to validate a sequence of playback requests.

The **Keep session during playback** fix only affects the class that builds listening-log requests (`LIIIlIllllIIllII;`). Methods containing the `log.listen` and `log.batch_listen` constants now return the null value already handled by the dispatcher. This covers both immediate track changes and resubmission of a batch cached by an earlier version. Sign-in, session renewal, and logout paths retain their original code. This fix replaces the previous signature patch.

To continue the investigation, see the [session patch](src/PlaybackSessionPatch.kt) and [verification script](verify-playback.py). On the development machine, `.local/test/logout-baseline.log` contains the sequence before the fix, `.local/test/logout-fixed.log` contains the new test trace, and `tools/trace-playback-session.js` provides the Frida script, which records only method names, error types, and the logout stack. Reproduction uses Android 14 with the original input APK and the existing test account.

## Audio ads before a track

Before the fix, a playlist test opened `AudioAdsActivity` despite the pre-roll interstitial patch. The audio controller `LIIIIlllIllllIlI;` retrieves ads through `mobile_getAudioBreak` or `mobile_getAudioBreakMultiple`. Depending on the response, it can insert an item into the queue. `src/AudioAdsPatch.kt` resumes playback through its continuation before the ad is scheduled. This path also handles the call without a continuation used to preload ads.

## Track display and selection

The original row model grays out tracks without on-demand playback rights (`NO_MOD`). The patches convert this state for display while preserving unavailable states. Albums use their native track number in the title text so that the artwork slot remains available. Artist rankings use the position in the list, including in “See all”. `src/NumberedTrackRows.kt` shares the “number. title” formatting. Tap handlers pass the track ID to the playback action.

On an artist page, the three visible tracks and the “See all” list use two separate calls to the same row converter. The fix applies the same display conversion to both calls. The presentation copy preserves other track states and leaves the model used by the player intact.

A Deezer recommendation such as *French Pop* opens in `SmartTrackListActivity`. The expanded list combines an account permission with track checks before selecting the display state. `src/SmartTrackListSelectionPatch.kt` changes the account-related decision in this constructor. It also uses the direct playback path that passes the selected track’s ID. An action from the shuffle button still follows its native path. `src/TrackCellDisplayRights.kt` shares the conversion for rows using the same data format, including on profiles.

In “Their music, meant for you”, the trace on the test profile confirms that “Comme Caroline”, “Ma sœur”, and “Mauvais Garçon” have the `NO_MOD` state in the grayed-out rows. The component then creates rows disabled for touch and accessibility. The profile path also produces intermediate `READABLE` rows for the same tracks. The final row state explains the visible graying. This observation concerns Deezer’s local decision and does not measure server-side stream availability.

`src/CollectionButtonsPatch.kt` handles playback started through an album or playlist button. The playlist model supplies the same mode to the button renderer and its action. `src/UnlimitedSkipsPatch.kt` changes the navigation mask and the targets following the start-of-queue and end-of-queue checks. ART can reject a method if an added instruction overwrites a parameter register used by the original path. After compilation, review registers around branches and open the affected flow in the emulator.

## Premium offer in the track menu

The three-dot menu uses the `CONTEXTUAL_MENU_ADS_FREE` key to display “Listen without ads”. `src/PremiumTabPatch.kt` filters this key while reading the local offer registry. Filtering by campaign key covers different languages as well as both the player menu and the list menu. Other actions continue along their original paths.

## Queue insertion from a track menu

The menu distinguishes between `ADD_TRACK_TO_QUEUE` and `ADD_TRACK_AFTER_CURRENT`. The two components of **Manage the playback queue** each restore their action in the main menu and add it to the full-screen player’s actions. Both actions share queue handling and filtering for the `try_to_edit_queue_list` and `TRY_TO_EDIT_QUEUE_LIST` offers. The first check can open a screen by itself, so the patch skips its call. Deezer still handles insertions, and unavailable tracks are checked through the native path.

On Android with the fourteen patches enabled, adding *Instant Crush* from Daft Punk’s list increased the queue from 14 to 15 tracks. Requesting “Play Next” for *Around the World* brought it to 16 tracks. The displayed order was *One More Time*, *Around the World*, *Instant Crush*, followed by the remaining tracks from *Discovery*. Both insertions from the full-screen player also increased a queue from 14 to 16 tracks without a Premium prompt.

## Modified APK supplied as a reference

The archive `.local/apks/reference/Deezer_9.0.25.4_9012504_bee119.apk` declares package `com.deezer.pro` and version **9.0.25.4**. Its manifest points to `com.sagittarius.v6.StubApplication`, and the archive contains `libbaiduprotect.so` and `assets/origin359.apk`. The latter declares package `deezer.android.app`, version **9.0.11.4** (`9001104`). Signature integrity verification fails for the embedded APK. The wrapper contains only ARM libraries, whereas the development emulator provides only `x86_64`, with no ARM bridge.

Comparison with the original **9.0.11.4** confirms that the twelve embedded DEX files and six libraries from the ARM64 split are byte-for-byte identical. The comparison APK’s certificate was verified and matches the certificate of the supplied 9.0.26.3 archive. Of the 4,105 files common to the base split and the embedded APK, only the manifest and resource table differ. The `music_on_demand` and `disable_lyrics_feature` checks visible in this APK are part of the original 9.0.11.4 code. Attributing functional changes to the repack requires observing the DEX files and libraries actually loaded by the wrapper on an ARM device. The comparison copy and analysis notes are in `.local/analysis/`. [9.0.11.4 archive used for comparison](https://apkpure.net/deezer-people-android-music/deezer.android.app/download/9.0.11.4)

`SORT_PLAYLIST` is in `classes6.dex` of the embedded APK, identical to the official 9.0.11.4 DEX. The DEX files visible at the wrapper’s root contain neither that label nor `sortPlaylistCallback`. The sixteen `baiduprotect*.i.dex` archives contain filler DEX files with no classes, and the `baiduprotect*.jar` files have a JAR extension but cannot be read as ZIP archives. The wrapper’s signature differs from those of both official versions compared.

For “Their music, meant for you”, comparison of the embedded APK with the original 9.0.11.4 found the same default values for all 117 shared profile and musical-compatibility resources. The label and subtitle exist in both APKs. The reported behavior still needs to be attributed at runtime. The wrapper’s ABI prevents verification on the x86_64 emulator used for the patches.

## Sorting tracks in a playlist

In `src/PlaylistSortPatch.kt`, the sorting component of **Search and sort playlists** restores the `SORT_PLAYLIST` menu entry. It targets only that entry’s on-demand playback check. The app retains its list of criteria and its sorting handler, which stores the display preference in `plst.sorter`.

## Premium prompt reported around a mix

In historical version 1.0.3, inspection of the visible window identified `WebViewDialogActivity`, the `/premiumtab` path, and the `origin=try_to_play_mod` parameter. Version 1.0.4 adds this case to **Hide offer pop-ups** and uses the native close path before WebView initialization. Instrumented replay confirmed closure before display, and the filter allows the other tested origins through. With all fifteen patches enabled, the *Aerodynamic* mix reached `PLAYING`. The *One More Time* mix remained loading during another test.

## Player seek bar

In historical version 1.0.4, the player could temporarily move the seek thumb even though the music-action mask lacked the `0x100` bit used by Deezer for seeking within a track. The media session retained its position, and the UI returned to the actual playback time. **Enable seeking in music tracks** restores this bit in the controller’s three music contexts. The playback engine then applies the position through the native path.

## Tools for quick iteration

- **APK Analyzer** and **apksigner** identify each layer’s package, version, and signature. Compare them before decompiling a large APK or attributing differences to a patch. [Android APK Analyzer](https://developer.android.com/tools/apkanalyzer) · [Android apksigner](https://developer.android.com/tools/apksigner)
- **JADX** helps find method usages and stable strings despite obfuscated names. For a poorly reconstructed coroutine, read the instructions directly with `tools/DexInspect.java`, which uses dexlib2 supplied by Morphe Desktop. [JADX](https://github.com/skylot/jadx)
- **ADB** checks playing tracks through `dumpsys media_session`, **scrcpy** provides emulator control, and **Frida** confirms which path runs and where an error occurs. These three tools cover the current playback test loop. [ADB](https://developer.android.com/tools/adb) · [scrcpy](https://github.com/Genymobile/scrcpy) · [Frida for Android](https://frida.re/docs/android/)
- **Maestro** can replay UI flows in YAML and locate elements by their labels. **Frida-DexDump** can help recover DEX files loaded into memory when the reference archive runs on a compatible architecture. Both tools were reviewed for future work. [Maestro Android](https://docs.maestro.dev/get-started/supported-platform/android) · [Frida-DexDump](https://github.com/hluwa/frida-dexdump)
