# Release notes

## v0.18.3: the other device's place waits for you

- **Changed: *Another device is at …* no longer disappears after 15 seconds.** It stays at the bottom until you tap
  **Jump** or its new close button, so stepping away for a moment doesn't lose it. It goes by itself only if you
  switch to another book (Jump would move the wrong one) or another message takes its place.

## v0.18.2: a transcript file from the PC is picked up without a restart

- **Fixed: a `.transcript.json` that arrived while its book was open wasn't imported.** eppy looked for transcript
  files only when it loaded the book's document, so a file synced from the PC after that stayed unread until the app
  restarted or you switched books, and the Read tab kept saying "Estimated". Opening the Read along tab now looks for
  new transcript files too (only a file newer than the last import is read).

## v0.18.1: hidden folders are never books

- **Fixed: old copies kept by Syncthing showed up as duplicate books.** With File Versioning on, Syncthing keeps
  replaced and deleted files in a hidden `.stversions` folder inside the shared folder, and SABP's scan listed every
  folder, hidden or not. SABP's folder scan now skips folders whose name starts with a dot (`.stversions`,
  `.stfolder`, a file manager's `.trash`), the way eppy's own Refresh already did. Run **Rebuild library** once to
  drop the duplicates.

## v0.18.0: Rebuild library, and the library's own scan works again

- **Fixed: books added or moved in the library folder didn't show, or showed up broken, even after SABP's Full scan.**
  SABP's player keeps its own copy of the book list while it runs. Its classic player stops it before the library
  opens; eppy didn't, so the running player later saved its old list over the scan's. eppy now does what the classic
  player does: opening SABP's library manager pauses playback, saves and stops the player first.
- **Rebuild library** (Settings → Smart AudioBook Player, and on the Library tab when Refresh finds missing or moved
  books): clears SABP's book list and runs its Full scan, for a library folder that was reorganised. Positions come
  back from each book's `position.sabp.dat`; bookmarks, characters and all settings stay. Lost: each book's own speed,
  equalizer, volume boost, skip start/end, repeat, date added and finished mark. It always asks first.
- **Fixed: a book with a complete transcript (imported from the PC) asked for the speech model.** The model is only
  for transcribing on the phone; such a book now says *The whole book is transcribed* and shows no download button.

## v0.17.0: the PC joins sync between devices

- **The PC's position is offered too** (Sync between devices patch). The PC read-along userscript for Audiobookshelf
  (a separate project) saves where the PC is as `position.pc.json` in the book's folder. When you open a book, eppy
  offers whichever other device played it most recently, the PC or the other phone or tablet, as *The PC is at …* or
  *Another device is at …*. It still never jumps without asking. SABP's own position file is never written by the PC.
- Under the hood: the EPUB reader and the transcript matching no longer depend on Android, so the PC builds the very
  same code (docs/adr/0003). Nothing changes on the phone.

## v0.16.3: the other device's position now shows up

- **Fixed: the offer never appeared.** SABP marks a book as "played now" the moment it's opened, so eppy always
  thought this device had the newest position, and opening a book in eppy also starts it, which skipped the check.
  eppy now records each position SABP saves on this device (a small hook in the Sync between devices patch), so any
  other position in the book's folder is the other device's, whatever the two devices' clocks say. The check also
  runs while the book is playing, and Jump keeps it playing.

## v0.16.2: a sync screen and "Check the other device"

- **Settings → Sync between devices** (with the Sync between devices patch): shows whether Syncthing is installed,
  the position saved in the playing book's folder and whether it's newer than this device's, the setup steps, and
  **Open Syncthing** (or **Get Syncthing-Fork** when it isn't installed). Pairing the devices happens in Syncthing.
- **Check the other device** (on that screen and in the player's More menu) looks for the other device's position
  right away and offers the jump, even one you already let go. It always says what it found: no saved position yet,
  this device is up to date, both at the same place, or the other device is in a file this book doesn't have.
- **Paired with:** paste Syncthing's API key once on the Sync screen and it shows which devices Syncthing is paired
  with (connected now, or when last seen), which shared folder holds the playing book, whether it's up to date, and
  who it's shared with. eppy asks only Syncthing on the same device (127.0.0.1), pins Syncthing's certificate the first
  time, and keeps the key out of settings backups.

## v0.16.1: read along leaves out picture descriptions

- **Maps and illustrations no longer leave text behind in read along.** Many EPUBs (Gollancz, Orbit, Tor and others)
  put a written description under each map or picture for screen readers ("Expand / collapse Extended Description").
  The narrator never reads it, so eppy now leaves it out, and part openings go straight from the title into the
  story. Books you already paired keep their text until you remove the pairing and pick the document again.

## v0.16.0: sync between your phone and tablet

- **New separate patch, Sync between devices** (off by default). Keep your library folder the same on both devices
  with a folder-sync app such as Syncthing (setup in the README: home Wi-Fi only, nothing through outside servers).
  When you open a book the other device played further, eppy shows "Another device is at 3:12:40, 2 hours ago" with
  **Jump**. It never jumps by itself. Bookmarks and character notes already travel with the book folder. eppy has no
  network code for this.
- **Read along pairs the book's document by itself** when the book folder holds exactly one EPUB or PDF. After you
  remove a pairing, that book is left alone until you pick a document again.
- Diagnostics shows whether the Sync between devices patch is applied.

## v0.15.3: tidier read-along menu for finished books

- **Once a book is fully transcribed**, the Read tab's ⋮ menu no longer offers "Speed up for 30 minutes" or "Stop
  transcribing this book". There's nothing left to do, and stopping would also stop read-along from matching the text
  against the transcript. "Delete the transcript" is still there.

## v0.15.2: characters without leaving the book

- **Characters open over the player:** Details → Characters, the Read tab's ⋮ menu → Characters, and More →
  Characters (while the player is open) show the list in a sheet over the book instead of switching to another
  screen. Tap a character to edit it (with the suggest buttons, if on) or delete it with Undo, or add one.

## v0.15.1: typing in sheets, web search on a free key

- **The keyboard no longer covers what you type:** the character editor (and every other sheet with a text field)
  moves up above the keyboard and scrolls if needed.
- **Search the web works on a free Gemini key:** Google's free tier has no web search on its newest models, which
  showed "free limit is used up" at once. eppy now uses Gemini 2.5 Flash-Lite for web search when that happens. If
  Google offers no free web search at all, the message says so, and Diagnostics shows Google's own wording.

## v0.15.0: block Google billing logging

- **New separate patch, Block Google billing logging:** the Google Play billing library inside SABP no longer sends
  usage reports to Google. A scan of SABP 11.7.8 found no analytics, ads or crash reporters; this was the only report.
- **Nothing personal in the public repository:** tests and docs use invented book and character names, and the issue
  tracker stays on the developer's PC.

## v0.14.1: book lookups don't identify you

- **Open Library lookups** name eppy with a generic app name instead of the GitHub repository's address.

## v0.14.0: suggested character notes

- **Suggest a character's note with Gemini** (Settings → AI character notes, off by default, your own free Google key).
  In the character editor, *Suggest from the book* writes one line from what the book has said about the name so far,
  only up to where you're listening, so it can't spoil. *Search the web (may spoil)* writes one line from a Google
  Search. A suggestion never replaces your note: it fills an empty one or goes on a new line.
- **Free in practice:** within Google's free tier there's no charge; past it a note costs a fraction of a cent.
- **The key stays on the device:** it isn't part of settings backups and never appears in the log.

## v0.13.1: Read tab opens at your place

- **No more scrolling from the top:** full-screen reading, and the Read tab after coming back to eppy, open right at
  the paragraph being read instead of scrolling there from the start of the book.
- **Mini player in full screen goes to the player:** tapping it leaves full screen and shows the player itself, with
  the sheet folded away, instead of the Read tab.

## v0.13.0: reading without losing your place

- **Tapping the text no longer moves the audio.** Long-press a word instead for a menu: Play from here (from that
  word), Add to characters (name filled in, e.g. "Mara Rising Dawn"), Translate the word or the sentence (Google
  Translate's popup, or another translator app), Bookmark here, Copy paragraph, Share quote, and I'm hearing this now.
- **Read chip first:** the Read chip leads the row under the player controls, larger and in the accent colour.
  Long-press it for full-screen reading.
- **Full-screen reading:** the text over the whole screen with a mini player (rewind, play/pause, forward). The screen
  stays on; Back leaves it.
- **Skipped passages while listening:** reaching one shows a bar with Pause for 8 seconds (then a Play button to carry
  on after reading it); elsewhere in eppy a short notice with a Read action. Seeking over one doesn't count.

## v0.12.0: transcripts made on the PC

- **Transcribe on the PC, read along on the phone:** `tools/pc-transcribe` turns an audiobook into a
  `<audio name>.transcript.json` file on a PC with an NVIDIA GPU (faster-whisper large-v3; a 57-hour volume takes under
  40 minutes on an RTX 4090, and it's more accurate than the phone's models). Copy the file into the book's folder on
  the phone. The next time eppy opens the book (with its EPUB or text PDF paired), it imports the file: transcription
  shows 100%, matching and skipped passages run on it, and "Transcribe the whole book" has nothing left to do.
  Everything stays local.
- **Checked before import:** the file must name one of the book's audio files, match its length within 2 seconds, be
  complete, and be in the current format. Anything else is ignored and noted in Diagnostics. A newer copy of the file
  is imported again; the same one isn't.
- **The phone's transcriber can't overwrite an import:** a piece it was transcribing when the import happened is
  dropped.
- **Fewer false "Not in the audiobook" marks:** a passage whose words were mostly heard in that gap, just in another
  order or slightly edited by the narrator, is no longer marked. The PC tool also redoes stretches of narration Whisper
  left out, which on the phone showed up as passages marked skipped although the narrator reads them.
- **Skipped passages are tighter:** a hyphenated word the recogniser writes as one word ("door-nail" as "doornail") no
  longer stops the narrated words next to a skip from being recognised, which could mark a few narrated words red.

## v0.11.3: whole-book transcription keeps going on its own

- **Doesn't stop when SABP closes its player:** the book's files and chapters are remembered while it's loaded, so
  "Transcribe the whole book" carries on after nothing has played for a while. It still waits while another book is
  loaded.
- **Stays awake through short pauses:** while paused because the phone is warm, or after an error, the phone is kept
  awake so the retry actually happens with the screen off. Paused for low battery, it lets the phone sleep.
- **Watchdog:** every minute the background service checks the transcriber. A worker that ended is started again; one
  that finished nothing for 10 minutes is replaced. If the crash guard switches transcription off, the notification
  says so and has a **Try again** button.

## v0.11.2: clearer whole-book notification

- **Shows what's being transcribed:** the notification's title is the chapter being transcribed, the line below
  gives progress and speed ("Transcribing · 2% · 4.1× real time"), and the book name sits in the header.
- **Book name fixed:** folders whose address ends in `/children` showed the word "children" instead of the book
  (notification, sharing). The name is now taken from before that part.
- **Same percentage everywhere, with one decimal:** the notification cut 1.6% to 1% while the Read tab rounded it
  to 2%. Both now show "1.6%", and the notification's bar moves in tenths of a percent.

## v0.11.1: steady whole-book notification

- **Fixed the flashing progress bar** in the "Transcribe the whole book" notification. The background service and the
  transcriber kept restarting each other, and every restart re-posted the notification without its bar. The service
  now starts once and keeps its last notification.

## v0.11.0: skipped passages, whole-book transcription (sabp-eppy-feng fork)

- **Renamed fork:** this repository is now `USFHunTer/sabp-eppy-feng`, shown in Morphe Manager as **SABP Eppy Feng**.

- **Skipped passages in red:** with a book paired and the audiobook transcribed, text the narrator never
  reads (30+ words, with transcribed audio on both sides) gets a light red tint and a "Not in the audiobook"
  label. The text keeps its normal colour so you can read it. The highlight jumps over it instead of
  sweeping through, and tapping it plays from where the narration continues. Text not transcribed yet is
  never marked.
- **Transcribe the whole book** (Read along ⋮ menu): keeps going until 100%, at full speed (two threads
  while you're listening), even in the background: a notification shows progress and has a Stop button.
  It still pauses below 20% battery or when the phone is warm, waits while another book is loaded, and
  switches itself off when the book is done. Adds a foreground service (special use, so no daily time
  cap), the wake-lock permission and, on Android 13+, asks for notifications.
- **More accurate speech model:** Whisper small.en (190 MB, about 3× slower) next to Standard and Small.
  Read along ⋮ → **Speech model** switches between downloaded models or downloads another.

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


## v0.8.1: fixes from the first on-device test (Android 16 phone)

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
