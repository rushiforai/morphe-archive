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

## Device session 1 (2026-10-24, Xiaomi 24129PN74I, Android 16 / API 36, SABP 11.7.8 Hooman build, eppy 0.7.0)

Driven by the developer through scrcpy on the user's phone.

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
