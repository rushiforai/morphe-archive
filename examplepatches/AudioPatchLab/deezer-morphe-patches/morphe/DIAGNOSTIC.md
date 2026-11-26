# Technical diagnostics

## Deezer 9.0.27.4 and bundle 1.2.4

This bundle targets the tested 9.0.27.4 APKMirror archive (Android 8.0+, arm64-v8a/x86/x86_64, version code 9002704). The base APK passed signature verification with Deezer's certificate, SHA-256 `51a891a6c5d17b4e36a6f46bab675c1cae786a5af06f51d0105dab7ec6a94516`. Archive SHA-256: `82a688f3a44fcc6c95855176c06fd058d4a343c57d9f46f2449e0ae43bf0d08f`.

Version 1.2.4 removes **Show audio quality choices**. The native account permissions determine the available qualities; the existing quality upgrade-prompt removal remains part of **Hide Premium offers**. The tested Free account displayed only Standard on Mobile data, WiFi and Google Cast.

The 9.0.27.4 application starts directly with `DZMidlet`, without the 9.0.27.3 PairIP startup wrapper. Obsolete string, lifecycle, callback and native-library restoration code was removed from this version's bundle. Patch targets, member references and resource IDs were adapted to the new build. Earlier app versions remain available through the corresponding earlier bundle releases.

All nine public patches applied, rebuilt, signed, installed and launched together on the Android 14 x86_64 emulator using the AMD RX 6600 host GPU. A second build disabled only **Install alongside official Deezer**, applying the other eight patches. Both outputs passed the DEX comparison audit with zero new unresolved types and zero new unresolved references. Generated metadata confirms the optional package suffix patch is enabled by default.

Actual media-notification card taps reopened the matching package with both installations present: `deezer.android.app.morphe` and `deezer.android.app`. The unsuffixed installation also completed a fresh test-account login and loaded Home. Album selection played Digital Love; seeking moved it to 2:30; starting its mix preserved the track and elapsed time and created an 82-track queue. Next selected Face to Face, and the lyrics view opened without the Premium prompt.

Discovery downloaded all 14 tracks as complete PERMANENT entries, totaling 58,726,171 bytes, all marked MP3_128. With guest WiFi and mobile data disabled, One More Time advanced from 0:06 to 0:15; network settings were restored afterward. Play next inserted the selected track directly after the current item. Adding Paradis to the queue increased its count from 15 to 16 and displayed Paradis in the user queue. Playlist search filtered results for Paradis; alphabetical track sorting showed 1,2,3 Soleil followed by À l'inverse, and Default restored the original order. Physical Android Auto and every possible ad, account, region and server-response scenario are not covered by these emulator checks.

## Historical audio quality request and response verification

Version 1.2.3 removes the Basic bit from the quality picker instead of forcing every quality bit. On the tested account, the menu contains Standard, HQ and HiFi. This changes presentation only; licence parsing and the server's format decision remain native.

With all ten patches enabled on the emulator, the unmodified account-quality model advertised mask 2 (Standard) for mobile, WiFi and Cast. A read-only Frida trace confirmed that choosing HQ saved preference 4 and choosing HiFi saved 8. The app subsequently wrote preference 2 again through native account revalidation. Keeping an unsupported preference selected would not establish higher-quality playback.

Fresh-track request/response checks on November 25, 2026:

| Selection | Track | Requested formats | Parsed media-service response |
| --- | --- | --- | --- |
| HQ | Blue Rondo à la Turk (Album Version), Dave Brubeck | MP3_320, MP3_128 | MP3_128 |
| HiFi | Unsquare Dance, Dave Brubeck | FLAC, MP3_320, MP3_128 | MP3_128 |

The encrypted cache held 6,459,976 bytes for the 404-second HQ test and 1,918,431 bytes for the 120-second HiFi test, approximately 127.9 kbit/s in each case. A separate HiFi request for Take Five produced 5,187,708 bytes over 324 seconds, approximately 128.1 kbit/s. These are average cached-media sizes divided by duration, corroborating the explicit server format; they are not instantaneous network-throughput readings or a decoded elementary-stream probe. FFprobe could not directly parse the encrypted cache.

These observations apply to this account and the tested patched APK. They do not establish what the supplied AndroForever APK receives. Android audio-output sample rates and codec default bitrate fields also must not be mistaken for a measurement of the downloaded source.

## Removal of the preventive user-save guard

Version 1.2.2 removes the empty-user persistence guard added in 1.2.1. The patched user-save method's disassembled instructions match the original APK exactly. All ten public patches applied, rebuilt, signed and installed together. After a force-stop/reopen, **Sounds Like a Melody (2019 Remaster)** remained paused at 50,000 ms with its 31-track queue. The separate queue restoration and startup offer fixes remain enabled.

## Playback continuity and audio preferences

Version 1.2.1 exposed ten public patches. Tests in this section used all ten together on the Android 14 x86_64 emulator, with hardware GPU rendering. The final bundle applied, rebuilt, signed, installed and launched successfully. The DEX audit found zero new unresolved types or references. A final search selected **Défaite de famille** by Orelsan; force-stop/reopen and a subsequent reinstall retained its paused position at 55,000 ms.

`MixContinuityPatch.kt` handles a mix whose seed ID matches the currently playing track. It removes upcoming items through the native queue operation and inserts recommendations after the current item, excluding the seed ID. It does not dispatch a replacement/play action or restart the decoder. The native shuffle replacement can choose another song; the native replacement/play action resets playback. Tests preserved a paused track at 50,000 ms, continued playback beyond that position, kept the seed after repeated mix requests, populated the upcoming queue, and advanced to the next recommendation. Other seed IDs retain native behavior.

`PlaybackRestorePatch.kt` keeps the effective MOD feature consistent with **Choose tracks on demand**. Row selection alone did not cover the native cold-restoration check: a persisted queue remained in the database while the player opened empty. With this feature enabled, force-stopping and reopening restored the same track, its 12,538 ms position, and the queue. Other feature verdicts retain their native behavior. The preventive empty-user persistence guard introduced in 1.2.1 was removed in 1.2.2; user persistence follows the original app code. This is separate from queue restoration and the existing listening-log fix.

**Show audio quality choices** changes the native preferences list builder. Streaming and download preferences use that builder; it does not change the licence parser, format identifiers, or server tokens. The emulator showed the four choices and accepted HQ selection. With WiFi High Fidelity selected, tested cache entries were still named `MP3_128`; these tests do not establish higher-quality delivery.

Static inspection of the supplied AndroForever 9.0.27.2 APK found a changed quality-mask parser: the `standard` branch returns all bits instead of only the Standard bit. That can advertise additional choices locally. Visible request code still uses Deezer's media service and licence/track tokens. The inspected path does not demonstrate a local audio transcoder or an alternate server authorization route. The protected wrapper and ARM-only runtime prevent a complete runtime attribution on this emulator. Earlier aggregate traffic counts are insufficient to prove authentic 320 kbit/s or lossless audio.

The [John NL patches](https://gitlab.com/johninnld/nl-morphe-patches) were reviewed for comparison. Their custom Android Auto host admission and templated car UI are separate from this bundle's native MediaBrowser support. Shell media play/pause/next controls work, but a physical phone/car host remains untested. Sideloaded media apps may need Android Auto's **Allow unknown sources**, as documented in [Google's testing instructions](https://developer.android.com/training/cars/testing).

## Exact track selection from search

The previous search route made rows selectable but still called `song.getSearchTrackMix`. Its result mapper did not carry the selected ID, and subsequent fallback filtering could change the returned queue. In an all-patch emulator test, selecting **C'est dur d'aimer** played **Coeur en or** instead.

`ExactSearchTrackPatch.kt` scopes an exact fetch to the three search listen contexts, including recent searches. It uses Deezer's native `song_getListData` request with the selected ID and its native list/model parsers. The response mapper accepts only the matching ID, preserves the native metadata conversion, and starts a one-track queue without mix fallback filtering. A missing ID fails the action instead of substituting a recommendation. Other listen contexts retain their original fetch behavior.

Search taps also bypass reuse of an equal in-flight dispatcher action. This lets the native dispatcher cancel the previous job when rapidly switching A → B → A. Without this adjustment, two rapid-click trials ended on the penultimate selection; with it, six repeated and four varied rapid-click sequences ended on the expected title.

Validation used all nine public patches together on the Android 14 x86_64 emulator. The bundle applied, rebuilt, signed, installed and launched successfully; the DEX reference audit found zero new unresolved types or references. Android's active media session confirmed the selected titles for **C'est dur d'aimer**, **Dur d'y croire**, **C'est Quoi Ton Délire**, and **Défaite de famille**. The latter continued to 46 seconds without changing title. Selecting **Basique** from Recent searches also started Basique by Orelsan. These runtime checks do not establish availability for every catalogue item or account region.

## Follow-up: search, startup offers and package selection

Recent searches use separate cached-track mappers (`LIlllIllIlllIllI;` and `LIllIlIllll;`). Their account-only on-demand denial is normalized as well. On the emulator, Basique, DFTF, Veridis Quo and One More Time are no longer grey in Recent searches; selecting Basique directly from that list starts Basique by Orelsan, with a full 2:44 duration. This check used the complete nine-patch bundle.

This earlier test stage exposed nine public patches, before audio quality preferences were added. `Install alongside official Deezer` is enabled by default and can be deselected to retain the original package ID. Shared startup restoration remains a dependency in both modes. The renamed manifest matches the media notification action generated from the installed package name.

Search rows retain catalogue availability checks but no longer map the on-demand account denial to a disabled row. Search-origin full-track requests retain the selected track instead of being replaced with a recommendation mix. The scope-policy wrapper preserves the original ID and scope on fallback (the original method has no spare registers).

Startup offer handling skips only variant 8 of the R8 merged no-freemium navigation rule, preserves consent/logout variants, and redirects NativePremiumActivity to Home. The waiting-for-payment UI flag no longer triggers a local subscription redirect. The regional navigation approach was reviewed against [John NL's RemovePaywallsPatch](https://gitlab.com/johninnld/nl-morphe-patches/-/blob/7622f42a0e4a2f843e3b0f7c4598332bac6ffaaa/patches/src/main/kotlin/patches/deezer/RemovePaywallsPatch.kt). These are local navigation changes, not an account-country change or evidence of server-side access in every region.

Checks on Android 14 x86_64 with all nine patches enabled: build/apply/sign succeeded; selecting Basique from search Tracks played Basique by Orelsan with a full 2:44 duration; the Android media card reopened the player; directly opening the native startup offer returned to Home. With only the package patch deselected, the other eight patches applied successfully, installed as deezer.android.app and the original notification action resolved to the app (unauthenticated cold start opened sign-in).

Not verified: a newly created account receiving the welcome offer from the server, a Japanese/non-Free-region account, physical ARM runtime and authenticated notification playback without the suffix. A temporary Frida tracing session crashed in the injected Frida agent; normal UI checks above were repeated without instrumentation. Audio preference testing is covered in the newer section above.

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