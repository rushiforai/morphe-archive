# Release notes

## v0.10.1: crash fix and read-along polish (from the first device test)

- **Fixed a crash when the classic player hands over to eppy** (notification tap, launcher, task restore):
  SABP's PlayerActivity tried to unregister a receiver it never registered, and Android 16 ended the whole
  app. This was also what stopped background transcription ("process ended during …" in the log).
- **Invisible "Start read-along" button fixed**; the prompt's buttons are full width now.
- **Transcript matches survive a restart:** after the app restarted, the EPUB view fell back to
  "Estimated"; matching now waits for the player and re-runs. The status says "Matched to the transcript".
- **Progress you can read:** "41 min of 33 h 46 min transcribed (2%)", in the transcript and EPUB views.
- **"You're here"**: in a part not transcribed yet, the placeholder says it's being worked on from there.
- **Speed up for 30 minutes**: works like while charging (more cores, no rests); chip and menu.
- **Long-press a transcript paragraph:** play from here, copy, share.
- Java crashes no longer count against the speech engine or skip pieces of the transcript.

## v0.10.0: built-in read-along transcription

- **Read along without fixing it by hand:** tap Read along → "Make a read-along?". eppy transcribes
  the audiobook on the phone with Whisper (whisper.cpp, MIT), keeping the time of every word. It runs in
  the background in small 30-second pieces: a few minutes ahead of where you're listening on battery
  (two low-priority threads, resting as long as it works), the whole book while the phone charges, and
  it pauses below 20% battery or when the phone is warm. Progress is saved after every piece.
- **Works without a book file:** the Read tab shows the transcript of the file you're hearing, with
  the spoken word highlighted; parts not done yet are marked.
- **EPUB/PDF as a reference, not a copy:** with a book paired, every ~14 transcribed words are found in
  the book's text and the matches are chained in order. Skipped front matter, footnotes and appendices
  no longer pull the highlight off (the old rules rejected every match after a skip). Names from the
  book are given to Whisper so it spells them the book's way.
- **Files in the book folder:** `<file>.transcript.srt` next to each audio file.
- **Speech model:** downloaded once, only after you agree (Standard 60 MB, or Small 32 MB), from
  whisper.cpp's model page on Hugging Face; resumable. Audio never leaves the phone.
- **Safety:** if the app ends during a piece, that piece is skipped next time; after three such ends
  within half an hour, transcription switches itself off and the Read tab offers "Try again".
- Diagnostics shows which speech engine loaded (fast armv8.2 build or baseline), the model and speed.
- The patch adds about 1.4 MB to the APK (two builds of the engine) and sets `extractNativeLibs`.

## v0.9.2: fixes the read-along crash loop (root cause found in the device log)

- **Cause:** pairing an EPUB/PDF made eppy keep a persistent permission to that one file. Smart
  AudioBook Player treats every persisted permission as a library *folder* and calls
  `DocumentsContract.getTreeDocumentId()` on it when its PlayerService starts and in its statistics
  task; for a single file that throws `IllegalArgumentException: Invalid URI`, so the service crashed on
  every start. Clearing the app's data "fixed" it only because it also dropped the permission.
- **Fix:** eppy now copies the paired document into its own storage and never keeps a permission to it.
- **Self-repair:** at start-up (before SABP's service runs) eppy removes any such permission left by
  older versions, keeping the pairing by copying the file first. Phones stuck in the crash loop recover
  after updating, without clearing data.


## v0.9.1

- **Crash reports you can reach without opening the app:** every crash is now also saved to
  `Downloads/eppy/eppy-crash-<date-time>.txt` (in addition to Settings → Diagnostics), so a crash that
  keeps the app from opening can still be sent.


## v0.9.0: classic-player features in eppy

Every control of the classic player now exists in eppy, using SABP's own engine and data:

- **Equalizer** (5 bands, balance, mono, pitch, noise reduction), **volume boost** (tap to cycle,
  hold for levels incl. quieter), **repeat** (file or book, 2–5 times or endless), **skip start and
  end** of files, **ID3 titles** on/off, **rotate to control** on/off: new chips and More items, each
  calling the same PlayerService setter the classic button uses (new patch hooks; see Diagnostics).
- **Long skips:** hold rewind / fast forward for SABP's long skip (captions show both lengths).
  Previous / next buttons go by chapter.
- **Lock** the player controls (top bar), press and hold to unlock.
- **Audio output / cast** (top bar): Android's output switcher.
- **Subtitles:** the current .srt line shows under the title; tap it (or More → Subtitles) for the list.
- **Files** list, **open a text/PDF file** from the book folder, **Exit**.
- **Cover tap** plays/pauses, like the classic cover.
- **Native screens instead of classic ones:** Bookmarks (all books, rename/note, delete with Undo,
  share), History (recent books + this book's position history, tap to undo a jump), Listening
  statistics (from SABP's statistics file: total, this month, last 12 months, per book), Characters
  (add/edit/delete with Undo, saved in SABP's characters file).
- Still in the classic player (labelled, one tap): change cover, delete files, Chromecast button,
  MP3→Opus converter, help.

Fixes: sheet tabs scroll to the selected tab; the Undo action is readable in dark themes; settings rows
without icons line up; the Player settings page has the right title.


## v0.8.1: fixes from the first on-device test (Xiaomi, Android 16)

- **Book and chapter names were swapped or wrong** when SABP's notification is set to "author and book
  title" (the player showed the author as the title). Titles now come from the library and the book's
  chapter list instead of the media-session fields, whose meaning depends on that SABP setting.
- **The seek bar covered the whole 33-hour book** for single-file books with embedded chapters, so it
  barely moved. The seek bar, times and mini-player progress now follow the current chapter; seeking
  stays within it and keeps play/pause.


## v0.8.0: v2 spec round E (speed, sleep timer, double-tap seek)

### Speed
- **Tap the speed chip** to step to the next speed, wrapping around (0.5× … 3×, SABP's engine range;
  0.25× isn't supported by it). With two or more **favourite speeds** (long-press a speed in the panel),
  tapping cycles only those.
- **Long-press for the speed panel:** a large readout, a slider in 0.05× steps with − / + buttons,
  presets, reset to 1×, SABP's skip-silence levels, and "use for books you haven't started". Shows
  the time left at the chosen speed. Changes go straight to SABP's engine (the same call its own dialog
  makes); pitch is kept natural by the engine.
- **Time left** under the seek bar and on the book line is now real time at the current speed.
- Keyboard: `[` and `]` for slower / faster.

### Sleep timer
- **Tap the moon chip** to start or stop SABP's own timer; the chip counts down (`9:58`).
- **Long-press for the timer panel:** 5–60 min presets, end of chapter, custom length, +5 min,
  restart and turn off. The timer runs in SABP's service, so it works with the screen off, in the
  background and in the classic player, and SABP's fade-out and shake-to-restart still apply.
  Extending restarts SABP's timer with the time left + 5 and puts your usual length back afterwards.
- Keyboard: `S` toggles the timer.

### Double-tap seek on the cover
- Double-tap the left half of the cover to go back, the right half to go forward; keep tapping to
  add more (−10, −20, −30 s…), with a label on that side. A tap on the other side starts over.
  Single taps wait out the double-tap window, so a double-tap never also does the single-tap action.
- Step length: same as SABP's rewind button (default) or 5–60 s, or off (Settings → Cover gestures).
  Uses SABP's own skip when the lengths match, so it crosses files natively.

### Not possible on SABP's engine (stated rather than faked)
- A configurable fade-out length and "end of N chapters": SABP's timer has no fade-out length setting, and it stops
  at the end of the current file/chapter only.

### Tests
- `CoverGesturesTest`: single taps never seek, double-tap = one step, further taps accumulate, the other
  side restarts the count, slow taps aren't a double-tap.


## v0.7.0: v2 spec round D (player sheet)

- **Real draggable sheet** with three resting states: collapsed (tab strip peeking), half and fully open.
  Drag from the handle, the tab strip or any non-scrolling part; flings move one state in their
  direction, slow releases snap to the nearest. Tap the handle or the new chevron to toggle.
- **Nested scrolling:** dragging up on a half sheet opens it first, then the list scrolls; dragging down
  scrolls the list until it's at the top, then moves the sheet.
- **Swipe sideways** on the sheet content to change tab (not near the screen edges, which belong to the
  system back gesture). Each tab keeps its scroll position.
- **Back collapses the sheet**; on Android 14+ the predictive back gesture previews the collapse.
  Sheet state (tab and half/full) survives rotation. TalkBack gets Expand/Collapse actions.
- **Gesture tests in CI:** the sheet is driven with real touch events (drag, fling, nested scroll, tab
  swipe, Back, scroll memory) and must settle in the right state.


## v0.6.0: v2 spec rounds B and C (layout foundation, settings, library)

### Layout
- **One icon set:** Google's Material Symbols (Rounded, 24 dp grid, Apache 2.0) drawn as vectors, with
  filled variants for selected navigation items. Replaces the hand-drawn icons.
- **Navigation items are one component** (icon + label in a single container) used by the bottom bar,
  rail and floating dock. Selecting a tab only changes colours, never sizes. Navigation labels scale with
  the font setting up to 130 % so four tabs fit at 200 %.
- **Mini-player has its own slot above the navigation.** Lists get a bottom inset equal to the dock's
  measured height, so the last item is always reachable. Gesture and 3-button navigation are handled;
  the dock steps aside while the keyboard is open; sheets keep their content above the navigation bar.
- **Mini-player gestures:** swipe up opens the player, swipe down pauses and hides it (with Undo),
  sideways changes chapter (or pauses, or nothing: Settings → Mini-player). TalkBack actions for all.

### Settings
- **Player settings in eppy's design** (Settings → Player settings): auto-rewind, short/long skip
  intervals, headset and interruption behaviour, sleep-timer length, shake to extend, statistics. Each
  row uses SABP's own key, so the classic screens show the same values and changes apply immediately.
- **Back up, restore and reset eppy settings** (JSON file). SABP's data is never touched. eppy settings
  now carry a schema version; updates never overwrite your choices.

### Library
- **Pull to refresh** (or the refresh button): reloads progress and states from SABP and checks your
  library folders in the background for new, missing and moved books, with a summary you can dismiss
  or stop. Adding the new books is SABP's own Full scan, one tap away.
- **Sort** by recently played, title, progress, date added or length; **filter** all / in progress /
  not started / finished; **grid or list** view with progress bars and time left. Choices are remembered.

### Quality
- **UI tests in CI:** every shared component is rendered on the JVM (Paparazzi) in all six styles, light
  and dark, at 100 % and 200 % font, with automatic checks that icons sit centred on their labels and
  indicators, labels aren't clipped, targets are at least 48 dp, and selection doesn't change layout.


## v0.5.0: v2 spec round A (inventory, diagnostics, safe patching)

### Added
- **Switch to eppy inside Classic SABP**: in the classic player's ⋮ menu and at the top of SABP's Settings.
  Playback isn't touched: it lives in SABP's service, not in either screen.
- **Diagnostics page** (Settings → Help and bug reports → Diagnostics, or tap the version line five times):
  versions, which SABP targets the patch found, a runtime check, feature switches, storage used by eppy,
  recent errors, the last crash, and a log you can view, copy or export.
- **Feature switches**: Read along, online book information, listening log, blur, term lookup and cover
  gestures can each be turned off from Diagnostics, without re-patching.
- **Native page back stack**: eppy screens open over the current tab and Back returns to where you were.
- **docs/inventory.md**: every SABP setting (key, type, default, screen, status), the data model, the
  navigation map, the hook list with fallbacks, and the compatibility matrix.

### Changed
- **The patch can no longer half-apply.** It resolves every SABP target before changing anything. A missing
  required target stops the patch with a clear message; a missing optional target leaves a safe stub, and
  Diagnostics names the hidden feature.
- New optional hooks for later rounds: speed setter, sleep-timer countdown, character list.


## v0.4.0: stability release (renamed to eppy)

### Fixed
- **Unexpected returns to the classic player.** v0.3.0 added a new screen but left SABP's `PlayerActivity`
  reachable from the notification, widgets, the library's "open book", voice search and Android's task restore. A
  single hook at the start of `PlayerActivity.onCreate` now routes all of them to the chosen player.
- **Notification tap** now opens eppy's player. Playback controls keep using SABP's single playback service and session.
- **Read-along could never match (v0.3.0 defect).** The audio pipe was closed before Android delivered the
  recognition request, so every request failed. The pipe now stays open for the whole session.
- **Read-along crash loop:**
  - Whole-book indexing ran on the main thread, and automatic matching restarted within seconds of every launch.
  - Heavy work now runs on a background thread, automatic matching never starts at launch, and every stage is wrapped
    in a crash marker. After an abnormal exit, read-along turns automatic work off and explains, instead of repeating it.
- **Icon and label misalignment:**
  - Removed a line-spacing multiplier that lifted every label above its icon.
  - Re-centred the Rewind, Fast forward, Speed and Bookmark-add icons and removed a double offset on the play icon.
  - Tab and navigation labels no longer change weight (and width) when selected.
  - The bookmark chip reserves the width of "Remove bookmark", so it doesn't shift its neighbours.

### Added
- **Player interface** setting (eppy / Classic SABP player), plus a long-press app shortcut back to eppy.
- **Read along rebuilt as stages:** extract → prepare → **chapter-title alignment** (no permission needed) → optional
  listening matches → incremental, versioned saving. It also gets Stop, Rebuild and Remove pairing, named error messages,
  ambiguity rejection, and highlighting that reflects how reliable the position is.
- **Book information sources:** Open Library (no account) and Google Books (your API key), with candidate review,
  source labels, cache, Test buttons and conservative spoiler protection.
- **Diagnostics:** an operation log, a crash recorder (copyable report) and a runtime self-check of every bridge into SABP.
- **Documentation:** Morphe comparative analysis, navigation audit, test record (docs/).

### Changed
- **Speech matching** is now **opt-in** (patch option off by default; no microphone permission unless enabled).
- **Naming:** user-facing name is now **eppy**, and the patch is called "eppy" in Morphe Manager. Internal identifiers are unchanged.

### Not verified
No on-device testing has been done by the developer for this release. See docs/TESTING.md.

## v0.3.0
Player sheet (Chapters, Read along, Bookmarks, Details, Up next), circular play button, bookmark toggle, six styles, read-along prototype, credits.

## v0.2.0
First Eppy UI: Home, Library, Now Playing, mini-player, adaptive navigation, Modern font.

## v0.1.0
Material You theme for the classic screens.
