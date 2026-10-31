# eppy reverse-engineering inventory

Phase 0 of the v2 spec. Everything below was read from the decompiled Smart AudioBook Player
**11.7.8** (versionCode 301178), the only version eppy patches. Obfuscated names (`k8`, `n2`, ...)
are given only to help a reader find the code; the patch never uses them, it finds each target by
structure (see [Hook list](#hook-list)).

Status words used throughout:

- **shared**: stored once, in SABP's own store; eppy reads/writes the same key or file.
- **eppy-only**: eppy's own setting (stored in `eppy_*` preferences), no SABP equivalent.
- **classic-only**: deliberately left in SABP's screens; eppy opens them with a labelled transition.
- **internal**: SABP bookkeeping, not a user setting.

Device verification: none of this has been checked on a device by the developer yet; see
[TESTING.md](TESTING.md).

## Data model map

| Data | Where SABP keeps it | Format | How eppy reaches it |
|---|---|---|---|
| Library (all books, state, progress) | `files/BooksDatabase_v6` | Java serialization of `BookData` list | `PlayerService` book-list method (from the Android Auto browser), then `BookData` fields by name (Serializable keeps them) |
| Playback position | `BookData.mFileName`, `mFilePosition`, `mCurrentPlaybackTimeCache`; per-book backup `position.sabp.dat` in the book folder | serialization | media session + `filePosition` hook |
| Speed, skip silence | `BookData.mPlaybackSpeed`, `mSkipSilence`; default for new books in pref `defaultPlaybackSpeed`, `defaultSkipSilence_v2` | float / int 0–5 | read: `BookData` fields; write: `speed` hook (`PlayerService (FI)V`) |
| Bookmarks | `bookmarks.sabp.xml` in the book folder | XML | `bookmarksLoad` / `bookmarksSave` hooks (SABP's own reader/writer) |
| Characters | `characters.sabp.xml` in the book folder | XML `<root><character><name/><description/></character>` | `charactersLoad` / `charactersSave` hooks |
| Position history (undo jumps) | transient `ArrayList` of `BookHistoryNode` (action, file, position) on `BookData`: in memory only, cleared when the app restarts | memory | the book's only transient `ArrayList` field (by type) |
| Last played time | `BookData.mLastPlaybackTime` | epoch ms | `BookData` field by name |
| Listening statistics | `!Smart AudioBook Player Statistics/statistics.xml` under the library root | XML | read directly (round F) |
| Cover | `EmbeddedCover.jpg` / chosen image in the book folder, cached by SABP | image | `covers` + `coverLoader` hooks |
| Chapters | `MetadataHolder.mFileInfo[].mChapters` (from file tags, M4B atoms, cue files) | serialization | `BookData` fields by name |
| Subtitles / timed text | `.srt` files next to the audio (`Srt`: start, end, title) | SRT | read directly (read-along timing source, round I) |
| Companion text file | `BookData.mLastOpenedTextFile` (the classic "Open PDF file" menu) | file name | field by name |
| Settings | default `SharedPreferences` (`PreferenceManager.getDefaultSharedPreferences`) | prefs | table below |
| Sleep timer state | prefs `sleepActivated2`, `sleepTime` (minutes; `-1` = end of file); countdown in `PlayerService` | prefs + memory | intent actions `ActionEnable/DisableSleepTimer`, `sleepRemaining` hook |
| eppy settings | `shared_prefs/eppy_ui.xml`, `eppy_readalong`, `eppy_bookinfo`, `eppy_flags`, `eppy_diag` | prefs | eppy |
| eppy read-along data | `files/eppy_readalong/` | JSON / text cache | eppy |

## Navigation map

What each SABP screen does while eppy is the chosen player interface.

| SABP screen / entry | Opened from | Under eppy |
|---|---|---|
| `PlayerActivity` (classic player) | notification, widgets, library, voice search, task restore, Android Auto "open app" | **routed to eppy** by the `router` hook before any UI is built. Opened on purpose (eppy → More → Classic player) it shows normally, with **Switch to eppy** in its ⋮ menu |
| `LibraryActivity` | classic player → Library | classic-only for folder management and full rescan; eppy has its own Library tab |
| `BookmarksActivity` | classic player | classic (native eppy screen planned in round F) |
| `CharactersActivity` | classic player | classic (native screen planned in round F) |
| `HistoryActivity` | classic ⋮ → History | classic (native screen planned in round F) |
| `PlaybackStatisticsActivity`, `…ForBookActivity` | library ⋮ | classic (native screen planned in round F) |
| `BookQueueActivity` | library ⋮ | classic (native screen planned in round F) |
| `PlayerSettingsActivity` and its Playback / Sleep / Advanced / Full version / Troubleshooting sub-screens | ⋮ → Settings | classic-only screens, all keys shared; **Switch to eppy** row added at the top |
| `LibrarySettingsActivity` | library ⋮ → Settings | classic-only, keys shared |
| `SubtitlesActivity` | classic ⋮ → Subtitles | classic-only |
| `SearchCoverActivity`, `SearchDescriptionActivity` | classic ⋮ | classic-only |
| `ConvertMp3ToOpusActivity` | settings | classic-only |
| `HelpActivity` | ⋮ → Help | classic-only |
| Classic ⋮ menu items | Select chapter, Select file, Delete files, Select/Search cover, Open PDF, Exit | classic-only |

eppy's own screens: Home, Library, Settings tabs; the player (full screen on phones, side pane on
wide windows) with its drag-up sheet (Chapters, Read along, Bookmarks, Details, Up next); pushed
pages (Diagnostics so far) on one back stack.

## Hook list

Each hook is found by structure at patch time. Required hooks stop the patch **before any class
is changed**, so it never half-applies. Optional hooks that aren't found leave a safe stub and are
listed in eppy → Settings → Diagnostics → Patch hooks with the feature that's hidden as a result.

| Hook | Kind | How it's found | Used for | If missing |
|---|---|---|---|---|
| `router` | required | `PlayerActivity.onCreate(Bundle)` (framework name) | send every classic-player launch to the chosen interface | patch fails cleanly |
| service lifecycle | required | `PlayerService.onCreate()` / `onDestroy()` | know when SABP's engine runs | patch fails cleanly |
| app start | required | `SABPApplication.onCreate()` | crash recorder, activity tracking | patch fails cleanly |
| `library` | required | the `(BookData$BookState) → ArrayList` call inside `MyMediaBrowserService`'s Android Auto list method | book lists | patch fails cleanly |
| `covers`, `coverLoader` | optional | the other two calls in that same method | covers | grey placeholders |
| `seekTracking`, `seek` | optional | `PlayerService` calls in `PlayerActivity.onStartTrackingTouch` / `onProgressChanged` | seek bar | seek bar read-only |
| `filePosition` | optional | first `()I` `PlayerService` getter called by the method that puts `android.media.metadata.DURATION` | live position | media-session position |
| `jump` | optional | the only `PlayerService (String, int, boolean) → void` | chapters, bookmarks, read-along taps | those jumps hidden |
| `bookmarksLoad/Save` | optional | the static `(Context, String) → ArrayList` and `(Context, ArrayList, String) → void` on `Bookmark` | bookmarks | classic bookmarks screen |
| `charactersLoad/Save` | optional | same shapes on `CharacterDescription` | characters | classic characters screen |
| `speed` | optional | the only **public** `PlayerService (float, int) → void` | speed panel, tap cycle, `[`/`]` keys | SABP's speed toggle only |
| `sleepRemaining` | optional | the `PlayerService () → String` that calls `PlayerSettingsSleepActivity` and `PlayerActivity`'s formatter | sleep countdown | no countdown |
| `classicMenu` | optional | the `PlayerActivity` method that inflates and shows a `PopupMenu` | **Switch to eppy** in the classic ⋮ menu | app-icon shortcut only |
| `classicSettings` | optional | `PlayerSettingsActivity.onCreate`, after its first own-class call (the screen builder) | **Switch to eppy** row | app-icon shortcut only |

Public, unobfuscated interfaces eppy also uses: PlayerService intent actions
(`ak.alizandro.smartaudiobookplayer.Action*`, the same ones SABP's notification, widgets and Wear OS
use), its `MediaSessionCompat` token, and its local broadcasts (`BookChangedIntent`,
`FileChangedIntent`, `UpdateSleepViewIntent`).

Patch-time techniques adapted from Morphe's YouTube / YouTube Music patches (GPL-3.0, see
[CREDITS.md](../CREDITS.md)): an extension module with a stable bridge class whose stub bodies the
patch replaces; settings/activity takeover by `invoke-super` → extension → `return-void`; and
resolving obfuscated targets from framework-named call sites.

## Compatibility matrix

| SABP version | Patch applies | Device-tested |
|---|---|---|
| 11.7.8 (Play build and Hooman's patched build) | yes, CI checks every release | not yet |
| any other | refused by Morphe (`compatibleWith 11.7.8`) | — |

| Android | eppy | Notes |
|---|---|---|
| 16–17 (API 36–37) | supported | target of SABP 11.7.8 |
| 13–15 (API 33–35) | supported | predictive back on 14+; PDF text on 15+ until round I |
| 11–12 (API 30–32) | supported | no Material You on 11; blur falls back below 12 |
| < 11 | not supported | SABP 11.7.8 itself needs Android 11 |

Device classes to cover when testing: small phone, large phone, tablet / foldable, gesture and
3-button navigation, font scale up to 200 %.

## eppy settings

| Key (file) | Meaning | Default |
|---|---|---|
| `interface` (eppy_ui) | Player interface: `eppy` / `classic` | patch option "Use eppy as the player" |
| `skin`, `mode`, `accent`, `seed`, `highContrast`, `waveform`, `reduceMotion`, `haptics`, `name` (eppy_ui) | appearance | patch options / system |
| `readSize` (eppy_ui) | read-along text size | 18 sp |
| `autoSync` (eppy_readalong) | automatic speech matching | off |
| `online`, `auto`, `order`, provider switches, Google Books key (eppy_bookinfo) | book information | online off |
| feature switches (eppy_flags) | kill switches | all on |
| `errors`, `job`, crash flags (eppy_diag) | diagnostics | — |

## SABP settings

Generated from every `getDefaultSharedPreferences` read/write in the decompiled app.
"Exposed by" is the SABP screen that edits the key; "Read in" is where it's read (obfuscated class
names). eppy never keeps its own copy of any of these.

| Key | Type | Default | Exposed by (SABP screen) | Read in | Status |
|---|---|---|---|---|---|
| `LNMessageIsShown` | Boolean | false | — | PlayerSettingsActivity | internal state (not a user setting) |
| `askForReviewTime` | Long | System.currentTimeMillis( | — | PlayerSettingsActivity | internal state (not a user setting) |
| `autoRewind` | String | "Medium" | PlayerSettingsPlaybackActivity | PlayerSettingsPlaybackActivity | shared · **native in eppy** (Player settings, speed panel or sleep panel) and in SABP's screen |
| `backButton_v2` | String | "Minimize" | PlayerSettingsFullVersionSettingsActivity | PlayerSettingsFullVersionSettingsActivity | shared · edited in SABP's screen, opened from eppy |
| `bigRewindIndex` | Int | 3 | — | ie | shared · **native in eppy** (Player settings, speed panel or sleep panel) and in SABP's screen |
| `bookSorting` | Int | 0 | — | LibrarySettingsActivity | shared · edited in SABP's screen, opened from eppy |
| `convertMp3ToOpusActivated` | Boolean | false | — | PlayerSettingsFullVersionSettingsActivity | classic-only (MP3→Opus converter) |
| `convertMp3ToOpusCurrentFileIndex` | Int | 0 | — | PlayerSettingsFullVersionSettingsActivity | internal state (not a user setting) |
| `convertMp3ToOpusCurrentFolderIndex` | Int | 0 | — | PlayerSettingsFullVersionSettingsActivity | internal state (not a user setting) |
| `convertMp3ToOpusMinimumBatteryLevel` | Int | 80 | — | PlayerSettingsFullVersionSettingsActivity | classic-only (MP3→Opus converter) |
| `convertMp3ToOpusRootFolders` | StringSet | new HashSet( | — | PlayerSettingsFullVersionSettingsActivity | classic-only (MP3→Opus converter) |
| `convertMp3ToOpusSavedSpace` | Long | 0L | — | PlayerSettingsFullVersionSettingsActivity | internal state (not a user setting) |
| `convertMp3ToOpusStatus` | String | "" | — | PlayerSettingsFullVersionSettingsActivity | internal state (not a user setting) |
| `convertMp3ToOpusWithEmbeddedCover` | Boolean | true | — | PlayerSettingsFullVersionSettingsActivity | classic-only (MP3→Opus converter) |
| `decoder_v12` | String | "App 1" | PlayerSettingsTroubleshootingActivity | PlayerSettingsTroubleshootingActivity | shared · edited in SABP's screen, opened from eppy |
| `defaultNotification_v2` | Boolean | true | PlayerSettingsTroubleshootingActivity | PlayerSettingsTroubleshootingActivity | shared · edited in SABP's screen, opened from eppy |
| `defaultPlaybackSpeed` | Float | 1.0f | — | PlayerSettingsFullVersionSettingsActivity | shared · **native in eppy** (Player settings, speed panel or sleep panel) and in SABP's screen |
| `defaultShowId3Titles` | Boolean | false | — | PlayerSettingsFullVersionSettingsActivity | shared · edited in SABP's screen, opened from eppy |
| `defaultSkipSilence_v2` | Int | 0 | — | PlayerSettingsFullVersionSettingsActivity | shared · **native in eppy** (Player settings, speed panel or sleep panel) and in SABP's screen |
| `endOfBookAction` | String | "ShowListOfNewBooks" | — | cu | shared · edited in SABP's screen, opened from eppy |
| `fadeoutNotificationVolume` | String | "0" | PlayerSettingsSleepActivity | PlayerSettingsSleepActivity | shared · edited in SABP's screen, opened from eppy |
| `fixHeadsetControl` | Boolean | false | PlayerSettingsTroubleshootingActivity | PlayerSettingsTroubleshootingActivity | shared · edited in SABP's screen, opened from eppy |
| `fixWearOSControl` | Boolean | false | PlayerSettingsTroubleshootingActivity | PlayerSettingsTroubleshootingActivity | shared · edited in SABP's screen, opened from eppy |
| `forceExit` | String | "0" | PlayerSettingsPlaybackActivity | PlayerSettingsPlaybackActivity | shared · edited in SABP's screen, opened from eppy |
| `forceStop` | String | "2" | PlayerSettingsPlaybackActivity | PlayerSettingsPlaybackActivity | shared · edited in SABP's screen, opened from eppy |
| `headsetConnectPlay` | Boolean | false | PlayerSettingsPlaybackActivity | PlayerSettingsPlaybackActivity | shared · **native in eppy** (Player settings, speed panel or sleep panel) and in SABP's screen |
| `headsetDoublePress_v4` | Int | 0 | — | yo1 | shared · edited in SABP's screen, opened from eppy |
| `headsetNextFile_v5` | Int | 1 | — | gd | shared · edited in SABP's screen, opened from eppy |
| `headsetPreviousFile_v6` | Int | 2 | — | gd | shared · edited in SABP's screen, opened from eppy |
| `headsetQuadruplePress_v4` | Int | 0 | — | yo1 | shared · edited in SABP's screen, opened from eppy |
| `headsetSwapButtons` | Boolean | false | — | gd | shared · edited in SABP's screen, opened from eppy |
| `headsetTriplePress_v4` | Int | 0 | — | yo1 | shared · edited in SABP's screen, opened from eppy |
| `keepScreenOnWhileCharging` | Boolean | false | PlayerSettingsAdvancedActivity | PlayerSettingsAdvancedActivity | shared · edited in SABP's screen, opened from eppy |
| `libraryLayout` | Int | 0 | — | LibrarySettingsActivity | shared · edited in SABP's screen, opened from eppy |
| `lockPortraitOrientation` | Boolean | false | PlayerSettingsAdvancedActivity | PlayerSettingsAdvancedActivity | shared · edited in SABP's screen, opened from eppy |
| `locked` | Boolean | false | — | PlayerSettingsActivity | internal state (not a user setting) |
| `notificationAuthorNameAndBookTitle` | Boolean | e.booleanValue( | — | kj0 | shared · edited in SABP's screen, opened from eppy |
| `notificationPositionInFile` | Boolean | f.booleanValue( | — | kj0 | shared · edited in SABP's screen, opened from eppy |
| `openLibraryInAllBooksTab` | Boolean | true | — | LibrarySettingsActivity | shared · edited in SABP's screen, opened from eppy |
| `pauseOnMessage` | Boolean | true | PlayerSettingsPlaybackActivity | PlayerSettingsPlaybackActivity | shared · **native in eppy** (Player settings, speed panel or sleep panel) and in SABP's screen |
| `playbackStatisticsEnabled` | Boolean | true | LibrarySettingsActivity | LibrarySettingsActivity | shared · **native in eppy** (Player settings, speed panel or sleep panel) and in SABP's screen |
| `preventWordClippingLevel` | String | "0" | PlayerSettingsTroubleshootingActivity | PlayerSettingsTroubleshootingActivity | shared · edited in SABP's screen, opened from eppy |
| `progressFormat` | String | "TimePercentLeft" | PlayerSettingsFullVersionSettingsActivity | PlayerSettingsFullVersionSettingsActivity | shared · edited in SABP's screen, opened from eppy |
| `quickScroll` | Boolean | false | LibrarySettingsActivity | LibrarySettingsActivity | shared · edited in SABP's screen, opened from eppy |
| `resetNotificationVolume` | String | "50" | PlayerSettingsSleepActivity | PlayerSettingsSleepActivity | shared · edited in SABP's screen, opened from eppy |
| `resumePlaybackAtEndOfCall` | Boolean | true | PlayerSettingsPlaybackActivity | PlayerSettingsPlaybackActivity | shared · **native in eppy** (Player settings, speed panel or sleep panel) and in SABP's screen |
| `rewindButtonsPosition_v3` | Int | 5 | — | ie | shared · edited in SABP's screen, opened from eppy |
| `rootCachePath` | String | "" | — | LibrarySettingsActivity | shared · edited in SABP's screen, opened from eppy |
| `rotateActivated` | Boolean | false | — | PlayerSettingsFullVersionSettingsActivity | shared · edited in SABP's screen, opened from eppy |
| `rotateLeft_v2` | Int | 0 | — | f01 | shared · edited in SABP's screen, opened from eppy |
| `rotateRight_v2` | Int | 0 | — | f01 | shared · edited in SABP's screen, opened from eppy |
| `selectChapterDialogFragmentCheckboxesState` | Int | 0 | — | c51 | internal state (not a user setting) |
| `selectFileDialogFragmentCheckboxesState` | Int | 0 | — | r51 | internal state (not a user setting) |
| `shakeForce_v2` | String | "6" | PlayerSettingsSleepActivity | PlayerSettingsSleepActivity | shared · **native in eppy** (Player settings, speed panel or sleep panel) and in SABP's screen |
| `showBookQueueButton` | Boolean | false | LibrarySettingsActivity | LibrarySettingsActivity | shared · edited in SABP's screen, opened from eppy |
| `showBookmarksButton` | Boolean | true | PlayerSettingsFullVersionSettingsActivity | PlayerSettingsFullVersionSettingsActivity | shared · edited in SABP's screen, opened from eppy |
| `showBoostVolumeButton` | Boolean | true | PlayerSettingsFullVersionSettingsActivity | PlayerSettingsFullVersionSettingsActivity | shared · edited in SABP's screen, opened from eppy |
| `showChapters` | Boolean | true | PlayerSettingsFullVersionSettingsActivity | PlayerSettingsFullVersionSettingsActivity | shared · edited in SABP's screen, opened from eppy |
| `showCharacterListButton` | Boolean | true | PlayerSettingsFullVersionSettingsActivity | PlayerSettingsFullVersionSettingsActivity | shared · edited in SABP's screen, opened from eppy |
| `showChromecastButton` | Boolean | true | PlayerSettingsFullVersionSettingsActivity | PlayerSettingsFullVersionSettingsActivity | shared · edited in SABP's screen, opened from eppy |
| `showConvertMp3ToOpusButton_v2` | Boolean | true | PlayerSettingsFullVersionSettingsActivity | PlayerSettingsFullVersionSettingsActivity | shared · edited in SABP's screen, opened from eppy |
| `showCoverOnLockScreen` | Boolean | true | PlayerSettingsAdvancedActivity | PlayerSettingsAdvancedActivity | shared · **native in eppy** (Player settings, speed panel or sleep panel) and in SABP's screen |
| `showEqualizerButton` | Boolean | true | PlayerSettingsFullVersionSettingsActivity | PlayerSettingsFullVersionSettingsActivity | shared · edited in SABP's screen, opened from eppy |
| `showFolderViewButton_v2` | Boolean | true | LibrarySettingsActivity | LibrarySettingsActivity | shared · edited in SABP's screen, opened from eppy |
| `showId3TitlesButton` | Boolean | true | PlayerSettingsFullVersionSettingsActivity | PlayerSettingsFullVersionSettingsActivity | shared · edited in SABP's screen, opened from eppy |
| `showPlaybackSpeedButton_v2` | Boolean | true | PlayerSettingsFullVersionSettingsActivity | PlayerSettingsFullVersionSettingsActivity | shared · edited in SABP's screen, opened from eppy |
| `showPrevNextFileButtons` | Boolean | true | — | ie | shared · edited in SABP's screen, opened from eppy |
| `showRepeatButton` | Boolean | false | PlayerSettingsFullVersionSettingsActivity | PlayerSettingsFullVersionSettingsActivity | shared · edited in SABP's screen, opened from eppy |
| `showRotateButton` | Boolean | true | PlayerSettingsFullVersionSettingsActivity | PlayerSettingsFullVersionSettingsActivity | shared · edited in SABP's screen, opened from eppy |
| `showSearchButton` | Boolean | false | LibrarySettingsActivity | LibrarySettingsActivity | shared · edited in SABP's screen, opened from eppy |
| `showSkipStartAndEndButton` | Boolean | false | PlayerSettingsFullVersionSettingsActivity | PlayerSettingsFullVersionSettingsActivity | shared · edited in SABP's screen, opened from eppy |
| `showSortButton` | Boolean | false | LibrarySettingsActivity | LibrarySettingsActivity | shared · edited in SABP's screen, opened from eppy |
| `showSrts` | Boolean | true | PlayerSettingsFullVersionSettingsActivity | PlayerSettingsFullVersionSettingsActivity | shared · edited in SABP's screen, opened from eppy |
| `sleepActivated2` | Boolean | false | — | PlayerSettingsSleepActivity | shared · **native in eppy** (Player settings, speed panel or sleep panel) and in SABP's screen |
| `sleepScheduleDisabledUntilTime` | Long | 0L | — | m81 | internal state (not a user setting) |
| `sleepScheduleEnabled` | Boolean | false | — | m81 | shared · edited in SABP's screen, opened from eppy |
| `sleepScheduleTurningOff` | String | "06:00" | — | m81 | shared · edited in SABP's screen, opened from eppy |
| `sleepScheduleTurningOn` | String | "22:00" | — | m81 | shared · edited in SABP's screen, opened from eppy |
| `sleepTime` | String | "10" | PlayerSettingsSleepActivity | PlayerSettingsSleepActivity | shared · **native in eppy** (Player settings, speed panel or sleep panel) and in SABP's screen |
| `smallRewindIndex` | Int | 2 | — | ie | shared · **native in eppy** (Player settings, speed panel or sleep panel) and in SABP's screen |
| `sortStartedBooksByPath` | Boolean | true | — | h91 | shared · edited in SABP's screen, opened from eppy |
| `stopWhenOthersPlaying` | Boolean | true | PlayerSettingsPlaybackActivity | PlayerSettingsPlaybackActivity | shared · **native in eppy** (Player settings, speed panel or sleep panel) and in SABP's screen |
| `theme_v3` | String | "light" | — | PlayerSettingsAdvancedActivity | shared · edited in SABP's screen, opened from eppy |
| `trackMotion` | String | "0" | PlayerSettingsSleepActivity | PlayerSettingsSleepActivity | shared · **native in eppy** (Player settings, speed panel or sleep panel) and in SABP's screen |
| `trialStartTime` | Long | new Date( | — | PlayerSettingsActivity | internal state (not a user setting) |
| `turnOffSleepTimerInAndroidAuto` | Boolean | true | PlayerSettingsSleepActivity | PlayerSettingsSleepActivity | shared · **native in eppy** (Player settings, speed panel or sleep panel) and in SABP's screen |
| `wmaFilesSupport` | Int | -1 | — | PlayerSettingsActivity | internal state (not a user setting) |
