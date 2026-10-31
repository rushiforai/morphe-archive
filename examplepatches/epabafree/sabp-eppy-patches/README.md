# eppy

**eppy** is a set of [Morphe](https://morphe.software) patches that give **Smart AudioBook Player** (SABP) a modern
Material 3 player. SABP's own playback engine, library, bookmarks and settings stay underneath.

> **Best used with [Hooman's Morphe Patches](https://github.com/arandomhooman/hoomans-morphe-patches) for SABP.**
> Add both patch sources in Morphe Manager and apply Hooman's SABP patch together with eppy. eppy was patch-tested on
> Hooman's SABP 11.7.8 build. (Not affiliated with or endorsed by Hooman.)

| | |
|---|---|
| Supported app | Smart AudioBook Player **11.7.8** (`ak.alizandro.smartaudiobookplayer`). Other versions fail at patch time with a clear message instead of producing a broken app. |
| Patcher | Morphe (patcher 1.5.x; tested with morphe-cli 1.9.1) |
| Android | SABP's minimum (Android 11) and up. Speech matching needs Android 13+. PDF text needs Android 15+. |
| Tested on devices | **None yet by the developer.** See [docs/TESTING.md](docs/TESTING.md) for exactly what was and wasn't tested. |

## Patches

<!-- PATCHES_START EXPANDED -->
### eppy

The new player: a Home screen with Continue Listening and shelves, a cover-grid Library, and a Now Playing screen with a
circular play button, an Add/Remove bookmark chip, and a drag-up sheet. The sheet holds native **Chapters**, **Read along**,
**Bookmarks**, **Details** and **Up next**. You also get six styles based on the reference designs, a floating
mini-player, adaptive navigation (bar, floating pill, rail, two-pane), TalkBack support and keyboard shortcuts.

| Option | Default | What it does |
|---|---|---|
| Use eppy as the player | on | The default **Player interface**. Can be changed any time in eppy Settings. |
| Style | Material You | Material You, Ember, Midnight, Lavender, Paper or Mono. Also switchable in Settings. |
| Read-along speech matching | **off** | Opt-in. Adds the microphone permission that Android's speech service requires (see Privacy). |
| Default theme / accent / custom accent | system / wallpaper / `#E8735A` | For the Material You style. |

### Material You theme

Recolours and rounds the **classic** SABP screens (wallpaper or custom accent, tinted backgrounds, rounded dialogs and progress bars).

### Modern font

Uses the Outfit font across the classic SABP screens.
<!-- PATCHES_END -->

## Player interface: one switch

eppy → **Settings → Player interface** offers **eppy** or **Classic SABP player**. It's the only thing that switches
between them, and the choice persists.

- **With eppy selected:** the app icon, the playback notification, home-screen widgets, the library's "open book" and
  voice search all open eppy. A hook at the start of SABP's classic `PlayerActivity` routes every one of those paths
  centrally, including Android restoring the app after it was closed in the background.
- **When eppy opens the classic player on purpose** (setup, the equalizer, the full speed dialog), it marks the request
  so the router lets it through. That's labelled "Classic player" wherever it appears.
- **With Classic selected:** everything opens SABP's original player. To come back, **long-press the app icon → eppy**.
- **Background playback:** play, pause, skip and seek from the notification, a headset, Bluetooth, the lock screen,
  Android Auto, Cast and Wear OS all talk to SABP's single `PlayerService` and media session. eppy only observes that
  session, so it's never out of step and never starts a second one.

The full audit of entry points is in [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md#navigation-audit-sabp-1178).

## Read along (prototype)

Pair an EPUB or PDF with an audiobook (player sheet → **Read along** → *Choose EPUB or PDF*). The pairing is saved per audiobook.

| Stage | What happens | Needs |
|---|---|---|
| 1. Extract | Text, headings and paragraphs are pulled from the EPUB spine or PDF text, on the phone. Cached. | Nothing |
| 2. Prepare | Words are indexed per paragraph. Chapters/sections come from headings or heading-like lines. | Nothing |
| 3. Chapter alignment | Audiobook chapter titles (from SABP) are matched to document headings in order: "Chapter 12" = "12." = "XII" = "Twelve". Gives approximate positions for the whole book at once. | Nothing |
| 4. Listening (optional) | "Match by listening" transcribes 10 s of the audiobook file with Android's **on-device** recogniser. The words are searched for in a window around the current estimate (whole book only if there's no estimate). | Patch option on, Android 13+, on-device speech model, microphone permission |
| 5. Save | Every accepted match is saved immediately, tied to the document (URI + size) and the audiobook length. If either changes, old matches are discarded. | Nothing |

- **Highlighting tells you how reliable it is:**
  - *Exact* (book timings): sentence highlight.
  - *Confirmed by listening* or *Manually corrected* (near a match): sentence highlight.
  - *Approximate* or *Estimated*: paragraph highlight only.
- **Tap** a paragraph to play from there.
- **Long-press** a paragraph and choose "I'm hearing this now" to correct the position. Corrections are kept and outrank automatic matches.
- **Exact sync:** EPUBs with EPUB 3 Media Overlays (e.g. [Storyteller](https://gitlab.com/storyteller-platform/storyteller) "readaloud" books) use their own timings.
- **No guessed jumps:** a phrase found in more than one place, or a low-confidence match, is rejected, and the status says so.

**Formats:**
- EPUB 2/3 without DRM.
- Text PDFs on Android 15+.
- Other PDFs, and scanned PDFs, show page images that follow by estimate. OCR isn't built in.

**Errors are named:** *Text extraction failed*, *Lost access to the file*, *Low memory*, *PDF contains scanned pages*,
*No matching passage found*, *Match confidence too low*, *Language model unavailable*, *Speech recognition unavailable*.
Each comes with Retry / Choose another file / Remove pairing.

## Privacy and permissions

- **The microphone permission is only added if you turn on "Read-along speech matching"** in the patch options, and
  it's only requested when you tap *Match by listening* or enable automatic matching. Why it's needed: Android's
  `RecognitionService` checks the caller's microphone permission even when the app supplies its own audio
  (verified in AOSP source; see [docs/TESTING.md](docs/TESTING.md)). eppy feeds it decoded audiobook audio and never
  opens the microphone, but Android may still show its microphone indicator while recognition runs.
- **Read along never uploads** documents or audio.
- **Book information lookups are off by default.** When on, only the title and author of the book you look up go to the
  providers you enabled.

## Book information sources

eppy Settings → **Book information sources**:
- a master switch (off by default)
- automatic or manual lookup (manual by default; automatic only accepts a single exact-title match)
- per-provider on/off, order and a **Test** button
- API keys where needed
- clearing the cache

| Provider | Account | Sends | Notes |
|---|---|---|---|
| [Open Library](https://openlibrary.org/developers/api) | none | title, author | Identified by User-Agent as Open Library asks (about 3 requests/s). Licence of the data not verified; it's cached on your phone only. |
| [Google Books](https://developers.google.com/books/docs/v1/using) | **your own API key** (Google's docs require one) | title, author, your key | Off until a key is entered. |

- **Results:** you pick from a list of candidates, and each shown field names its source. Results are cached for 90 days.
- **Characters:** spoiler protection is on, and no character information is shown. None of the providers offers verified
  spoiler-free character data. Wikipedia, Wikidata and fan wikis were evaluated and left out because they routinely reveal
  plot. ISFDB and publisher feeds weren't integrated (no suitable open API was verified).

## Troubleshooting

- **The app opens the classic player:** check Settings → Player interface. If it still happens, use Settings →
  Diagnostics → *Copy log* and open an issue. The log records every routing decision.
- **Read along stopped or crashed:**
  - eppy records any crash (Diagnostics → *Copy crash report*).
  - If the app died during a read-along step, the next start turns automatic matching **off** and shows a notice
    instead of repeating the step. Nothing needs reinstalling.
  - Use *Rebuild from scratch* or *Remove pairing* in Read along's ⋮ menu.
- **"Language model unavailable":** install the offline speech model for the book's language in Android's speech or
  voice-input settings.
- **Diagnostics → Run checks** calls every bridge into SABP on your device and reports what works.

## Upgrading from v0.3.0

- **Kept:** bookmarks (they live in SABP's own `bookmarks.sabp.xml`), selected style and theme, playback progress, and
  document pairings.
- **Read-along cache:** cached text is reused. Saved matches from v0.3.0 are checked against the document and audiobook
  and discarded if they don't fit, with a message saying so.
- **Patch name:** the patch is now called **eppy** in Morphe Manager (it was "Eppy UI"). Select it again. Option keys
  are unchanged.
- **Speech matching** is now off by default. Turn the patch option on if you want it.
- **Unchanged internal identifiers:** the extension package `app.morphe.extension.sabp`, class names `Eppy*`,
  preference files `eppy_ui` / `eppy_readalong` and option keys keep their old names. Renaming them would lose saved
  settings and pairings.

## Status and deferred work

v0.4.0 is a stability release: Rounds 6–9 (routing, notification, read-along crash and engine, alignment), plus Round 10
(book information, without character data). Not done yet:
- a full EPUB/PDF reader with word-level sync
- a speech engine that accepts audio directly without the microphone permission (e.g. Vosk, Apache-2.0, needs native
  libraries and a ~40 MB model)
- OCR
- duplicate detection
- chapter-name and spoken-content search
- playback profiles
- a Wear OS app
- cloud backup and sync
- bookmark and notes export
- running eppy without adding a new activity (needed for root/mount installs)

Integration research and why each was deferred: [CREDITS.md](CREDITS.md#evaluated-and-not-used-yet).

## Using the patches

1. Install **Morphe Manager**.
2. Add the patch sources `https://github.com/epabafree/sabp-eppy-patches` and
   [Hooman's](https://github.com/arandomhooman/hoomans-morphe-patches).
3. Pick the SABP 11.7.8 APK, select **eppy** (plus Hooman's SABP patch, and optionally Material You theme or Modern font),
   then patch.

The patched app is signed with your key, so it can't install over the Play Store copy. Back up in SABP first, then
uninstall, install and restore.

## Building

GitHub Actions builds everything on every push to `main` and publishes `patches-<version>.mpp` as a release. To release,
raise `version` in `gradle.properties`.

Building locally: `./gradlew :patches:buildAndroid` (JDK 21 + Android SDK, GitHub Packages token for Morphe's Gradle plugin).

## Documentation

- [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md): Morphe patch comparative analysis and the navigation audit
- [docs/TESTING.md](docs/TESTING.md): the honest test record
- [CHANGELOG.md](CHANGELOG.md): release notes
- [CREDITS.md](CREDITS.md): credits and open-source licences

## Licence

GPLv3, with the Morphe template [NOTICE](NOTICE). Outfit and Plus Jakarta Sans fonts are under the SIL OFL 1.1 ([licenses/](licenses/)).
