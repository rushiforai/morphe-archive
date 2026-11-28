# eppy test record — v0.4.0

**Nothing in this release has been run on an Android device or emulator by the developer.** The build
environment has no Android runtime. Below is what was actually done, what it shows, and what still needs a phone.

## Automated / performed (no device)

| Check | How | Result |
|---|---|---|
| Patches apply to SABP 11.7.8 together with Hooman's "Unlock Full" | morphe-cli 1.9.1 on Hooman's patched 11.7.8 APK | eppy, Material You theme, Modern font all **Applied** |
| CI build (R8-optimised extension) applies the same way | GitHub Actions bundle → morphe-cli | see release run |
| Router hook present | Decompiled `PlayerActivity.onCreate` | starts with `if (EppyRoute.shouldRedirect(this)) { super.onCreate; EppyRoute.redirect(this); return; }` |
| Crash recorder hook | Decompiled `SABPApplication.onCreate` | `EppyDiag.install(this)` first |
| Bridge targets | Decompiled `EppyBridge` | `E0`, `N0`, `k8.m`, `s0`, `r0`, `d1`, `x0`, `Bookmark.f/g` resolved; package-private ones made public |
| Patch options | Patched with option variations, decoded manifest/strings | Speech off by default ⇒ **no RECORD_AUDIO**; on ⇒ permission + recogniser query; "Use eppy as the player" off ⇒ default interface `classic` |
| Microphone requirement of Android's speech service | Read AOSP `RecognitionService.java` (main branch, GitHub mirror) | `checkPermissionAndStartDataDelivery(RECORD_AUDIO)` runs even when `EXTRA_AUDIO_SOURCE` is supplied → permission genuinely required for that API |
| v0.3.0 matching failure | Read AOSP `SpeechRecognizerImpl.java` | Request is sent later from a handler; v0.3.0 closed the audio pipe right after `startListening` ⇒ every request failed (`ERROR_CLIENT`). Fixed. |
| Large-book matcher (simulation) | JVM, *War and Peace* (570,035 words, 12,170 paragraphs, 760 detected sections); simulated 26-word transcripts with ~22% dropped/misheard words, estimate off by up to ±1,500 words | windowed search: 196 correct / **1 wrong** / 3 rejected of 200, 0.4 ms each; whole-book scan: 191 / **1 wrong** / 8, 12 ms each |
| Text memory (simulation) | same, JVM heap | +42 MB for the whole extracted book, index 0.4 s |
| Chapter-title alignment (simulation) | same book; audio titles reworded ("Chapter IV" → "Chapter 4"), every 17th missing, every 23rd renamed "Track n" | 684 of 716 paired, **684 correct**, 56 ms |
| Repeated passage | Same sentence placed twice | rejected as ambiguous (no jump) |
| EPUB XHTML parsing | Synthetic chapter with entities, comments, scripts, `<br/>`, ids | correct paragraphs, headings, anchors |

The simulation numbers measure the *matcher*, not speech recognition. Real accuracy depends on the
recogniser's transcript quality, the edition, and the narration — **not measured**.

## Needs a real device (not done)

- **Player and navigation:**
  - notification tap
  - widgets
  - opening a book from the library
  - voice search
  - Back from SABP settings
  - switching apps and returning
  - "Don't keep activities"
  - process death
  - switching Player interface back and forth (and the long-press shortcut)
- **Bookmarks:**
  - add, remove, Undo
  - duplicate window
  - persistence across restarts
  - before and after the bookmark file loads
- **Read along:**
  - the 33-hour book and its EPUB
  - a large text PDF
  - a scanned PDF
  - a corrupt or DRM file
  - stopping, cancelling and resuming
  - seeking while matching
  - forcing a crash to confirm the crash-loop breaker
- **Every style, light and dark, several font scales, and phone/tablet widths,** checked against the reference images.
- **Notification and headset controls** while eppy is visible and while it's in the background.

To help: Settings → Diagnostics → **Run checks** and **Copy log / Copy crash report**. Paste them into an issue.

## Automated UI tests (from v0.6.0)

`ui-tests/` renders eppy's views on the JVM with Paparazzi (layoutlib) in GitHub Actions on every
change, and publishes images, test XML and the Gradle log to the `ui-results` branch.

- **ComponentShots:** navigation (bar, rail, floating dock), transport controls, chips and settings
  rows in all six styles, light and dark, at 100 % and 200 % font. Asserts icon-in-indicator and
  icon-over-label centring (±1 px), unclipped labels, ≥48 dp targets, and that selecting a tab changes
  no geometry.
- **SheetTest:** the player sheet driven with real touch events: slow drag rests half open, fling up
  expands, a scrolled list scrolls before the sheet moves, a list at its top lets a fling move the
  sheet, sideways swipe changes tab without moving the sheet, Back collapses, tabs keep scroll.

These are real layout and touch checks, but on layoutlib, not a phone: they don't replace the device
checklist (spec section 18), which still hasn't been run by the developer.

Read-along logic tests in `ui-tests/src/test/kotlin/.../read/` (JVM, no rendering):

- **WholeBookTest:** the remembered whole-book book and the progress label.
- **XhtmlTest** (v0.16.1): an image's long description in `<details>` (the narrator never reads it) is left out of the
  EPUB text; the part title after it stays.
- **SkippedPassageTest:** `TranscriptSync.skipped` around a jump, including a hyphenated word heard as one word and a
  passage narrated in another order (not marked).
- **SkipAuditTest:** not a regular test (runs only with `EPPY_AUDIT_DIR`): eppy's matching on a real book folder's PC
  transcript and EPUB, for `tools/pc-transcribe/audit_skips.py` to check every passage it would mark.
- **PcImportTest** (v0.12.0): importing a transcript file made on the PC gives 100%; a wrong name, a length more than
  2 s off, format version 2, an incomplete file and broken JSON aren't imported; a partial phone transcript is
  replaced; only a newer file is imported again.
- **PcImportMatchTest:** the imported fixture matched to its text finds exactly one skipped passage, the one left out
  of the audio. The fixture (`ui-tests/src/test/resources/pc-transcribe/`) is real output of `tools/pc-transcribe` on
  the opening of *A Christmas Carol* spoken by Windows' speech synthesizer, with 63 words left out.
- **LargeTranscriptTest:** a made-up 500k-word, 57-hour transcript: 19.5 MB, cold load 246 ms and +50 MB heap, one
  full match 3.1 s on a desktop PC. Reports only.

The PC tool has its own self-check without a GPU: `uv run python -m unittest` in `tools/pc-transcribe`.

## Device session 1 (2026-10-24, an Android 16 / API 36 phone, SABP 11.7.8 Hooman build, eppy 0.7.0)

Driven through scrcpy.

| Check | Result |
|---|---|
| eppy opens from the SABP icon, Library tab with filters/sort | pass |
| Mini-player sits above the bottom bar; Settings scrolls fully clear of it | pass |
| Diagnostics opens from Settings and by tapping the version line 5 times | pass |
| All 16 patch hooks found; runtime check: service running, position, library, book layout (1 file, 113 chapters), bookmarks file | pass |
| Player sheet: drag from tab strip rests half open; drag up expands; list then scrolls (nested) | pass |
| Back collapses the sheet | pass |
| Player title / chapter line | **fail** → fixed in 0.8.1 (author shown as title) |
| Seek bar on a 33 h single-file book | **fail** → fixed in 0.8.1 (now per chapter) |


## Device checklist: Rebuild library (v0.18.0, not yet on a device)

Checked without a device: both targets resolve uniquely in SABP 11.7.8's dex (`PlayerService.o0`: the only
`()V` with `ExitIntent` + `stopSelf`; `LibraryActivity.m0`: the call after `menu_full_scan` in
`onOptionsItemSelected`); `LibraryRebuildTest` (only `BooksDatabase_v6` and its copy are deleted).

On a device whose library folder was reorganised (the tablet, 2026-11-27):
- Settings → Diagnostics → Patch hooks lists `exitService=ok` and `fullScan=ok`.
- Settings → Smart AudioBook Player → **Rebuild library** → Rebuild: playback pauses, SABP's library opens and its
  Full scan runs by itself. Back in eppy, the Library tab lists every book with its new folder name, and none twice.
- A book with a `position.sabp.dat` opens at that position; bookmarks show.
- Rotating the phone during the scan doesn't start a second scan.
- Without the speech model downloaded, a book with a complete PC transcript (Shadow Slave 9) says *The whole book is
  transcribed* in Read along, with no **Download speech model** button.
- v0.18.1: with a `.stversions` folder holding old book copies (the tablet), Rebuild library lists each book once;
  Diagnostics → Patch hooks lists `skipHiddenFolders=ok`.
- Library manager (no rebuild): add a book folder, Full scan there, back to eppy: the book is listed and stays
  listed after playing and pausing another book (the old list no longer overwrites it).

## Device checklist: Block Google billing logging (v0.15.0, not yet on a device)

Verified without a device: SABP 11.7.8's APK has one `backend:` entry for Google's data transport (CCT), used by the
Play billing library (log source `PLAY_BILLING_LIBRARY`); no analytics, ads or crash-reporting libraries.

On the tablet, with the patch applied:
1. SABP and eppy start and play normally; Settings → About / full-version state unchanged.
2. Optional, with a computer: `adb shell dumpsys package ak.alizandro.smartaudiobookplayer` still lists the transport
   service, and `adb logcat | grep -i TRuntime` shows events being dropped ("Unknown backend"), not uploaded.

## Device checklist: AI character notes (v0.14.0, not yet on a device)

Verified without a device: `CharacterExcerptsTest` (only paragraphs before the listening position, first 4 + latest 8,
3,000-word cap, possessives, multi-word names), `GeminiTest` (request bodies, one-line answers, error messages, picking
the newest stable model from canned JSON; no live calls) and `AiKeyBackupTest` (the key isn't in a settings backup).

On the tablet:
1. Settings → AI character notes: Get a free key opens AI Studio; paste the key; Test says "Works · gemini-…".
   A wrong key says it isn't valid.
2. Characters → Add: with the switch on, the two buttons show under the note; off, they don't.
3. Early in a volume, Suggest from the book for a character who appears later says there's no mention yet.
4. For Tobin, a one-line note appears in the note field; with a note already typed it's added on a new line.
5. Search the web for a character gives a general line (may spoil). On a free key it works through Gemini 2.5
   Flash-Lite; Diagnostics shows the first refusal (429 on the newest model) and nothing secret.
5b. Typing a name or note: the keyboard pushes the editor up; the field stays visible.
6. Read tab → long-press a name → Add to characters: same buttons.
6b. Read tab ⋮ → Characters, and Details → Characters: the list opens over the player; edit, delete (Undo), add;
    closing it leaves you in the book.
7. Settings → Back up: the saved file doesn't contain the key.

## Device checklist: Read tab actions and full-screen reading (v0.13.0, not yet on a device)

Verified without a device: `WordsTest` (word under the finger, names, sentences), `SkipWatcherTest` (only normal
playback across a passage counts), and the Read chip in ComponentShots. The Read tab, the skipped-passage bar and full
screen need a real player, so they have no snapshots.

On the phone, with a book that has a paired EPUB and a transcript:
1. Tapping text doesn't move the audio. Long-press a word: the menu is titled with that word.
2. Play from here starts at that word; inside a red passage it reads "Play from where the narration continues".
3. Add to characters on "Rising" in "Mara Rising Dawn" fills in the whole name; saving shows it in Characters
   and in the classic player.
4. Translate a word and a sentence: Google Translate's popup appears over eppy (or the chooser without it).
5. Bookmark here: the bookmark has the chapter name and the paragraph's opening words; Undo removes it.
6. The Read chip is first and filled; long-press opens full-screen reading.
7. Full screen: system bars hidden, screen stays on, mini player works (rewind, play/pause, forward); tap on it shows
   the player; Back leaves full screen.
8. Let playback run into a skipped passage on the Read tab: the bar with Pause shows for 8 s. Pause scrolls to the
   passage; Play continues. Starting playback from the mini player hides the Play bar.
9. Same in full screen. On the home screen: the notice with Read, which opens the passage.
10. Seek over a skipped passage: no bar, no notice.

## Device checklist: transcripts made on the PC (v0.12.0, not yet on a device)

Verified without a device: the tool on an RTX 4090 (one volume of a test book, 56.9 h, in 37 min;
its `dur` equals the container's length to the millisecond), and the import, matching and size tests above.

On the phone, with a test book's volume:
1. `Example Saga Volume 9 The Long Road.transcript.json` copied into the book's folder.
2. Opening the book (EPUB paired), or the Read tab if the book was already open, shows "Imported transcript for 1 file(s)"
   once, and the Read tab's transcription progress shows 100%. Opening the Read tab again doesn't import again.
3. "Transcribe the whole book" for this book is off and its notification is gone.
4. The highlight follows the narration; skipped passages are marked.
5. No crash or ANR while loading; note how long the first match takes.
6. Copying a newer transcript file imports it again the next time the book or the Read tab is opened.

## Device checklist: built-in transcription (dev, not yet on a device)

Verified without a device: whisper.cpp JNI transcribes `jfk.wav` correctly on CI with word timings
(base.en: 11 s of audio in 1.9 s on 2 threads); both arm64 builds link and export the JNI symbols; a
dev bundle patches SABP 11.7.8 with the libraries present, `extractNativeLibs="true"` and the classes
in the dex.

On the phone:
1. Settings → Diagnostics: "Speech engine" line names `eppywhisper_v82` (or `eppywhisper`), no load error.
2. Read tab on a book with no pairing → "Make a read-along?" → Start → download sheet → Standard.
   Progress shows in the status line; cancel and restart resumes.
3. Play: within a minute the first paragraphs appear; the highlighted word follows the narration.
   Tap a paragraph → playback jumps there.
4. On battery: status says "Ahead of you" after ~10 min ahead; playback never stutters.
5. Charging: keeps going past the 10-minute mark; Diagnostics speed ≥ 3× real time.
6. `<file>.transcript.srt` appears in the book folder; SABP's own subtitles unaffected.
7. Pair the EPUB: status shows "N passages matched to the transcript"; highlight stays right across
   the book's front matter and chapter breaks.
8. Pause/resume, switch books, kill the app mid-transcription: no crash loop; it continues.

## Device checklist: Sync between devices (v0.16.0, not yet on a device)

Verified without a device: `OtherDevicePositionTest` reads a serialized `BookDataBackup` stand-in, refuses classes
outside SABP's package and plain Java values, and offers only a newer position in another file or more than 30 s away;
`AutoPairTest` pairs only a folder's single EPUB/PDF. SABP 11.7.8's read/write paths for `position.sabp.dat` were
traced in its `classes.dex` (see `docs/inventory.md`). The patch module wasn't built locally (the patcher comes from
GitHub Packages); CI builds it.

On two devices with Syncthing-Fork sharing the library folder (README setup) and the patch applied on both:
1. Diagnostics shows "Sync between devices patch: on".
2. Play a book on the tablet, pause, wait a minute. Open eppy on the phone: "Another device is at …" with Jump appears
   once and stays until Jump or ✕ (or another book); Jump moves to the tablet's place, paused, with the phone's own speed.
3. Leave eppy and come back: the same offer doesn't appear again. Play on the tablet again: a new offer appears.
4. Play on the phone instead of jumping: the tablet then gets the phone's position as an offer.
5. Within 30 s of each other: no offer. Without the patch: no offer and no file read.
6. A new book folder synced to both devices: SABP's library scan adds it at the other device's position.
7. A book folder with one EPUB and no pairing: Read along pairs it when the book opens; Remove pairing, reopen the
   book: it stays unpaired.

v0.16.2 additions (not yet on a device):
8. Settings shows a "Sync between devices" group only with the patch; its summary says whether Syncthing is installed.
9. The Sync screen shows the saved position of the playing book's folder; **Open Syncthing** opens Syncthing-Fork
   (or **Get Syncthing-Fork** opens the store when it isn't installed).
10. **Check the other device** (Sync screen and More menu) shows the offer even after it was let go, and otherwise
    one of: no saved position yet / this device is up to date / same place / a file this book doesn't have.
11. Paste Syncthing's API key on the Sync screen → Connect: "Paired with" lists the other device (connected now / last
    seen), and the folder holding the playing book with its state and who it's shared with. A wrong key says Syncthing
    refused it; Syncthing stopped says it isn't running; Refresh updates it.

v0.16.3 (fix, not yet on a device): the offer never appeared in v0.16.0–v0.16.2 because SABP stamps a book as played
"now" when it's opened (`BookData.P0`, found in `classes.dex`). After re-patching both devices: play and pause on one
device; open the book (or More → Check the other device) on the other: the offer appears, also while it plays. Note:
the first save on each device after updating is what teaches eppy which file is its own.

v0.17.0 (not yet on a device): `OtherDevicePositionTest` also reads the PC's `position.pc.json` (refusing another
format version or a missing file name) and picks the most recently played other position: the PC's when it's newer than
the other device's, never the PC's when this device saved after it. The EPUB reader moved from `DocExtractor` into the
plain-Java `Epub` and `TranscriptSync` now takes a plain file list (docs/adr/0003); the read-along tests pass
unchanged. On a device: pause on the PC (Audiobookshelf with the PC read-along userscript), open the book on the
phone: *The PC is at …* with Jump; play on the phone, then reopen: no PC offer until the PC plays again.

**On a device (2026-11-26, v0.16.3):** with Syncthing-Fork sharing the library folder between a tablet and a phone,
playing and pausing on the tablet made the phone offer "Another device is at …" when the book was opened. The
other direction, Jump itself and "Paired with" were set up but not reported on separately.
