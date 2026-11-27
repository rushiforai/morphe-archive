# Lyrics: timing, layout and sources

What a lyrics display does with a song's lyrics once they are found, and where they are found. The PC extension's lyrics panel, BitChord's lyrics and the phone's one-line strip follow these rules.

Cases: `lyrics-cases.json` (inputs and expected outputs, synthetic). `node scripts/lyrics_cases_tests.mjs` checks them against a port of Metrolist's functions kept in that script, and against the PC's own code once it has pure functions for them; the phone and BitChord read the same file from their tests.

## How to read this

- Each rule says where it applies:
  - **[view]**: a full lyrics view, many lines on screen (the PC's panel, BitChord's lyrics). On the phone the full view is Morphe's, not ours, so the phone builds none of these.
  - **[strip]**: a one-line strip, one line at a time under the art (the phone's).
  - **[view, strip]**: both.
  - On the phone, lyrics parsing, the lyrics cache and the full view are Morphe's own, so the rules on them (§1.5, §3.5, §3.6, §5.6, §11.8 and every [view] rule) differ there by design: a base app's feature wins (`spec/README.md`). The phone's part is only the strip's timing.
- The original is the rule: Metrolist unless a rule names BitChord. Where the PC or the phone differs today, §12 says so.
- Paths:
  - Metrolist (v14.0.1): `ML/` = `Metrolist/shared/src/commonMain/kotlin/com/metrolist/shared/`.
  - BitChord: `BC/` = `BitChord/sharedUi/src/jvmSharedMain/kotlin/com/music/bitchord/ui/player/`, `BCA/` = `BitChord/app/src/main/java/com/music/bitchord/`.
  - Phone strip: `FEAT/` = `yt music patches/bundle/extensions/extension/src/main/java/app/ayham/extension/music/features/` (`LyricTiming.java`, `PlayerScreen.java`).
  - PC: `src/` in this repo (`lyrics.js` finds, `lyrics-ui.js` shows).
- Times are in ms. "The position" is the player's position plus the offset (§3).

## 1. The clock

1. **[view, strip]** The lyrics run on a smooth clock, not on the player's raw position: between two readings of the player it runs on at the playback speed, and it never goes backwards except on a seek. `ML/ui/components/lyrics/LyricsDeadlinePosition.kt:133-139`, `ML/ui/components/lyrics/LyricsSmoothPosition.kt:81, 203-245, 290-297`.
2. **[view, strip]** A seek: a reading more than 80 ms behind the clock, or more than 300 ms away from where the clock expected it (1500 ms while casting). The clock jumps to it and every line state is rebuilt. A reading 1 to 250 ms behind that isn't a seek is jitter: the clock keeps its value. `LyricsDeadlinePosition.kt:101-120`, `LyricsSmoothPosition.kt:299-312`.
3. **[view, strip]** Paused or buffering: no running on, the readings as they come. The playback speed comes from the player (casting: 1.0). `LyricsDeadlinePosition.kt:80, 83, 130`.
4. **[view, strip]** Hidden: the clock stops (no work while nothing is shown). `LyricsDeadlinePosition.kt:85-95`.
5. **[view]** Drawn ahead of the sound. A frame reaches the screen about two refresh intervals after it is drawn, so playing lyrics (the line change and the word sweep) are drawn for the position plus 2 refresh intervals, kept to 8-40 ms (60 Hz: 33 ms), times the playback speed. Paused, loading, seeking or scrubbing: the exact position. A view without a refresh rate takes 60 Hz. It isn't one of §2's leads: "lyrics by real timing" keeps it. Mornye a422ffd1 (`lyricsDisplayLead`).

## 2. Early highlight

The lines change ahead of the voice, so the change has finished when the line is sung.

1. **[view]** A line becomes active when the position plus 660 ms reaches its start (`DEFAULT_SUGGESTED_LINE_OFFSET_MS` = −(500 + 160)). It stops being active at its end; when the next line is already active by the same rule, it stops then. `ML/ui/components/lyrics/LyricsRetiming.kt:31, 397-452`.
2. **[view]** A line that starts while another is still active (a duet, §5) uses a shorter lead: the position plus max(250, 660 − 150) for word-synced lyrics, max(250, 660 − 250) for line-synced. Both lines are active together. An overlap under 250 ms is timing noise, not two voices: it is trimmed. `LyricsRetiming.kt:39, 164-165, 401-403`.
3. **[view, strip]** The word sweep (the fill across each word) runs on the clock with no lead. Only line changes lead. BitChord `BC/PlayerLyrics.kt:1825-1826` (the same).
4. **[strip]** One line at a time: the line shown is the last line whose start is less than the position plus the strip's lead. The lead is the strip's change animation, so the change ends on the line's start (the phone's slide: 340 ms, `FEAT/LyricTiming.java:390, 406-409`). Seeking by lyrics (a tap on a line) and "which line is now" outside the view use Metrolist's 100 ms: line i is current while the next line's start is at or after the position plus 100. `ML/api/lyrics/LyricsUtils.kt:111-121`.
5. **[view]** The scroll to the next line starts ahead of it too: clamp(the next line's start − this line's end, 350, 500) ms, never more than 450 ms of animation. `LyricsRetiming.kt:15-17`, `ML/ui/components/lyrics/LyricsView.kt` (scroll), BitChord `BC/PlayerLyrics.kt:425-426, 470-484`.
6. **[view, strip]** A setting "lyrics by real timing" turns all leads off (default off). `ML/settings/Settings.kt:469`, `LyricsRetiming.kt:330-331`.

7. **[view]** Which lines are active is a function of the position alone (`activeLines`): Metrolist's engine also remembers the lines active a moment ago (it keeps one through a short blank and keeps a duet line it already lit), which a port may add; the cases hold the stateless reading. `LyricsRetiming.kt:362-460`.

Cases: `currentLine`, `activeLines`.

## 3. Offsets

1. **[view, strip]** Two offsets, added: a global one (default 0) and one per song (default 0). `ML/api/lyrics/LyricsUtils.kt:94-97`, `ML/settings/Settings.kt:460`.
2. **[view, strip]** Sign: the lyrics position is the player's position plus the offset, so a positive offset shows the lyrics earlier. Seeking by lyrics goes the other way: the player is sent to the lyric's time minus the offset, never below 0. `LyricsUtils.kt:99-107`. (BitChord's offset has the opposite sign, `BCA/data/settings/AppSettings.kt:521`; a port reading BitChord's setting turns it around.)
3. **[view, strip]** The editor: steps of 50 ms, a slider over ±3000 ms, a field for any value, and a reset to 0. `ML/ui/components/lyrics/LyricsOffsetEditor.kt:80-81, 119-122, 137, 272-281`.
4. **[view, strip]** The song's offset is saved by video id (Metrolist: the song's row, `ML/db/entities/SongEntity.kt:49`), the global one as a setting. **(ours)** Both apply as they are changed, with no Save step.
5. **[view, strip]** An LRC file's own offset. The last `[offset:N]` tag on a line of its own (N in ms, an optional sign) is taken from every line and word time of that file, none below 0, when it is parsed. **(ours)** The LRC standard: a positive N shows the lyrics earlier, as Morphe's parser reads it (`LRCParser.java:719`, `-N`). This is the reverse of Metrolist on purpose (`ML/api/lyrics/LrcTiming.kt:25-30` adds N; checked 2026-11-24 at af3d05339): the files are written to the standard (the user, 2026-11-24). The listener's offsets (rule 1) come on top. Cases: `lrcOffset`.
6. **[view, strip]** A file that carries its own translation or romanization lines (Metrolist's lyrics files: a `translatedlyrics` or `romanlyrics` section) pairs them with the main lines **before** the file's offset is applied, by the file's own timestamps. Exact timestamps first, each used once; then, for a main line whose time no auxiliary line has, the auxiliary line at the same position if no exact match took it. Metrolist 3ba42678a, 8b6c3e1a4 (`MlxParser.matchAuxiliaryLyrics`).

Cases: `offset`.

## 4. Auto-scroll

1. **[view]** On by default (`lyricsAutoScroll`), with a setting. The active line is centred in the view. `ML/settings/Settings.kt:475`, `LyricsView.kt:156, 682`.
2. **[view]** A drag (a touch or mouse drag, a wheel or a trackpad scroll) of more than 0.5 px stops following. The view then stays where the listener left it while the song plays on. `LyricsView.kt:614-640`.
3. **[view]** Following comes back on a "follow lyrics" button shown while it is off, on a tap on a line (which seeks there), or when the lyrics are shown again. Not on a timer. `LyricsView.kt:278-284, 1460-1463, 1666-1680`.
4. **[strip]** Not applicable: the strip has one line.

## 5. Duets

1. **[view, strip]** TTML's singers: `head/metadata/ttm:agent` (`xml:id`, `type`), inherited from a `div`, overridden on a `p`. `role="x-bg"` on a `p` or a span is a background vocal. Spans with `x-translation` or `x-roman` are not sung text. `ML/api/lyrics/BetterLyricsProvider.kt:133-135, 462, 496-521`.
2. **[view]** Sides (`ML/api/lyrics/LyricsUtils.kt:160-235`):
   - an agent's type is its `type`; without one, `v1000` and ids starting with `g` are a group, `v2000` and ids starting with `o` are "other", the rest a person;
   - a group's line is centred;
   - a person or other: the first such line goes left (right if its singer is "other"); after that the side changes each time the singer changes;
   - a line with no singer keeps the view's alignment (centre by default);
   - when 85% or more of the sided lines are on the right, all sides are swapped;
   - a setting turns sides off (default on), `Settings.kt:551`.
3. **[view]** Lines that overlap are active together (§2.2), each on its side.
4. **[view]** Background vocals: smaller and dimmer, under their line (BitChord: 23 sp at alpha 0.72; open 250 ms before the first word, over 400 ms; close over 450 ms, `BC/PlayerLyrics.kt:257-280`).
5. **[strip]** **(ours)** One line: the strip shows the line that started last; a background vocal never replaces the main line.
6. **[view, strip]** Enhanced LRC writes a line's background vocal inline, at the line's end: `[bg: <mm:ss.xx>word <mm:ss.xx>word]`. Its words are background words of that line, with their own leading text (as rule 4 shows them). Metrolist 0bc6ec068 (`EnhancedLrcPrefixTest.inlineBackgroundKeepsItsOwnLeadingText`). Cases: `parse`.

Cases: `sides`.

## 6. Instrumental gaps

1. **[view, strip]** A gap is 7000 ms or more without a line (`LYRICS_GAP_MIN_MS`). The intro counts: when the first line starts at 7000 or later, a gap runs from 0 to the first line's start − 800. Between lines, a gap runs from the end of the lines so far (the latest end, not the last line's) + 310 to the next line's start − 800. `ML/ui/components/lyrics/LyricsListIndexing.kt:28-53`.
   - A line's start here is the earlier of its tag and its first timed word's start (a word whose end is after its start), so a countdown ends when the voice comes in, not at a later line tag. Metrolist 5f58b4081 (`LyricsRetiming.kt` `timelineStartMs`).
2. **[view, strip]** It is shown while the position plus 190 ms is inside it (`HIGHLIGHT_LOOK_AHEAD_MS`). `LyricsView.kt:1353-1357`, `LyricsRetiming.kt:19`.
3. **[view]** What it shows: an indicator that fills with the gap's progress (Metrolist: a 36 dp wavy ring; BitChord: 3 dots). It appears 300 ms after the gap starts showing, fading in over 200 ms, and leaves over 800 ms (grows to 1.2 at 35%, then shrinks away). `ML/ui/components/lyrics/IntervalIndicator.kt:37-42, 65-94, 130-149`.
4. **[strip]** **(ours)** The strip shows its own gap mark (the phone: a note) in place of a line over the same gaps.

Cases: `gaps`.

## 7. Music videos

1. **[view, strip]** Lyrics show on music videos as on songs, with no switch to hide them. A video's lyrics can come from sources keyed by the video (SimpMusic, YouTube's captions, §11). `ML/repository/LyricsRepository.kt:328, 368`.

## 8. Text size and line spacing

1. **[view]** Text size: 10 to 40, default 36, steps of 1 (Metrolist's sp; the PC reads it as px at the same numbers). `ML/settings/Settings.kt:462`, `ML/ui/settings/LyricsSettingsRegistration.kt:158-166`.
2. **[view]** Line spacing: 1.0 to 2.5 times the text size, default 1.3, steps of 0.1. `Settings.kt:463`, `LyricsSettingsRegistration.kt:167-175`.
3. **[strip]** Not applicable: the strip's size is its layout's.

## 9. Romanization

1. **[view, strip]** Off by default. When on, for the languages switched on (Japanese, Korean, Chinese, Arabic, Hindi, Punjabi, Thai, Russian, Ukrainian, Serbian, Bulgarian, Belarusian, Kyrgyz, Macedonian; all on by default). `ML/settings/Settings.kt:540, 547-549`.
2. **[view]** Layout: the romanized line sits under the original at 0.64 of its size, 4 dp below it, at 0.8 of its opacity. "Romanized as main" swaps the two, with a switch to keep the original under it. `ML/ui/components/lyrics/Lines.kt:517-559, 640-659`, `Settings.kt:541-542`.
3. **[strip]** **(ours)** One line: the strip shows the original, or the romanized line when "romanized as main" is on.

## 10. Translation

1. **[view, strip]** Off by default, a switch in the lyrics menu. `ML/settings/Settings.kt:481`, `ML/ui/menu/LyricsMenu.kt:239-244`.
2. **[view, strip]** Source: Google's keyless endpoint (`translate.googleapis.com/translate_a/single`), into the app's language. BitChord `BCA/data/lyrics/LyricsTranslation.kt:68`. Metrolist's AI and DeepL providers need a key and are not ported.
3. **[view]** Layout: under the line, at 0.64 of its size, opacity 0.7 on the active line and 0.3 on the others. `ML/ui/components/lyrics/Lines.kt:561-583`.
4. **[strip]** Not applicable on one line, unless the strip has a second line.

## 11. Sources

1. **[view, strip]** **SimpMusic**: `GET https://api-lyrics.simpmusic.org/v1/{videoId}` with User-Agent `SimpMusicLyrics/1.0`. Of its tracks, the one closest to the song's length within ±10 s; its `richSyncLyrics` first, then `syncedLyrics`. `ML/api/lyrics/SimpMusicLyricsProvider.kt:22, 35-68`, BitChord `BCA/data/lyrics/SimpMusicLyrics.kt:24-47`.
2. **[view, strip]** **YouTube captions**: the player response's `captions.playerCaptionsTracklistRenderer.captionTracks`; the track in the app's language first, else the first; read with `fmt=json3`; at most 8 tracks looked at. Line-synced only. `ML/api/lyrics/YouTubeSubtitleLyricsProvider.kt:36-102, 188, 204-218`.
3. **[view, strip]** Both come after the listener's ordered providers (Metrolist puts YouTube's sources last, `ML/model/Models.kt:510, 522, 595-598`). For a music video, SimpMusic is asked as well.
4. **[view, strip]** Choosing between answers: the listener's own lyrics first; synced over unsynced; then the provider order; then the finer timing (word over line). With "prefer word-synced" on (default off), the finer timing comes first. `ML/repository/LyricsRepository.kt:99-117, 411-459`.
5. **[view, strip]** An accepted answer's ISRC (lrc.red's document, a BiniLyrics hit) is kept for the addon matcher. `spec/addons/protocol.md` §7, ISRC first.
6. **[view, strip]** **YouTube Music's own lyrics**, line-synced. The song's Lyrics tab: the `MPLY…` browse id from `next`, then `browse` with it asked as the Android Music client (`ANDROID_MUSIC` 7.21.50, client id 21), anonymously: only the mobile clients get `timedLyricsData`, one `{ lyricLine, cueRange: { startTimeMilliseconds, endTimeMilliseconds } }` per line; the web client gets the untimed description shelf. A line without text or start is dropped. Asked with YouTube's sources, before the captions (rule 2). BitChord eba87458 (`YouTubeLyrics.kt` `timedLyrics`). Checked 2026-11-24: Poker Face, 53 timed lines to the Android client, none to the web one.
7. **[view, strip]** **Offline**, no provider request and no translation request is made, and no miss is kept: the lyrics saved for the song (if any) show, and the next lookup online asks the providers again. A translation endpoint on the listener's own machine (Metrolist's local AI) is still asked. Metrolist 22ea8ee6e.
8. **[view, strip]** **Clear fetched lyrics**, an action in the lyrics settings with a confirmation: drops every fetched lyrics document and its translation and cached miss, so they are fetched again. It keeps the listener's own lyrics (imported, edited or drafts), their picks of a provider and their offsets (a song with an offset keeps it, with no lyrics, until the next fetch). Metrolist 709a8a61b (`CacheDao.clearFetchedLyrics`).

Cases: `parse` (text before the first word tag, a BOM before the first tag (Metrolist 459059bb2), background vocals in enhanced LRC), `lrcOffset`.

## 12. Where the apps differ

### PC against the original (as of 917f33f)

- Early highlight: built 2026-11-20 (`src/plus/lyrics-rules.js` `activeLines`, through the hook in `src/lyrics-ui.js` tick, `src/plus/lyrics-ui-plus.js` `activeLine`), the stateless reading (§2.7); "lyrics by real timing" is storage.local `lyricsRealTiming`. The scroll still follows the active line (no clamp(350..500) look-ahead of §2.5); the Fluid style scrolls 540 ms early (`:819, 1421-1427`).
- Duets: both voices are active together (§2.2), but only the first active line's words fill; the other is lit as a whole.
- Offset: built 2026-11-20 (`src/plus/lyrics-ui-plus.js`: storage.local `viviLyricsOffsetGlobal` and `viviLyricsOffsetById`, 3000 songs; hooks in `src/lyrics-ui.js`; `lyrics-rules.js` `offsetOf`, checked by the `offset` cases): steps of 50, a slider over ±3000 per row ("This song", "All songs"), the field, Reset, no Save. The editor sits in the lyrics panel's "i" (both offsets there; no global one in the popup). A song with no offset under its video id still reads the older per-provider one (`vivi_lyrics_offset_` + artist, title, provider). Same sign as the rule.
- Auto-scroll: built 2026-11-20 (`src/plus/lyrics-ui-plus.js` `followPaused`, a hook in `scrollToActive`; storage.local `lyricsAutoScroll`, a popup switch): a wheel or trackpad scroll, a touch drag or a scrollbar drag over the lyrics stops following; a mouse press-and-move on the text doesn't (it selects text on the PC). A "Follow lyrics" button at the panel's foot, a click on a line, or new lyrics bring it back. The Fluid style parks the line at 37% of the panel, not the centre.
- Duets: built 2026-11-20: `ttm:agent` is read for TTML (`src/plus/lyrics-plus.js` `agentOf`, hooks in `src/lyrics.js` parseTTML), sides from `lyrics-rules.js` `sides` (checked by the `sides` cases), set on each line (`lyrics-ui-plus.js` `side`; setting storage.local `lyricsDuetSides`, a popup switch). Only TTML names singers; a song from an LRC source has none. Background vocals are read (`src/lyrics.js:290, 306-307`) but not drawn smaller or dimmer (§5.4).
- Gaps: built 2026-11-20 (`lyrics-rules.js` `gaps`, checked by the `gaps` cases; `lyrics-ui-plus.js` `addGaps`, hook in the line render): BitChord's 3 dots, filling in thirds of the gap, before the line after it; aligned as the line after it. The mark takes its own small row in the list, shown or not.
- Music videos: on since 2026-11-20 for everyone, once (`src/plus/bg-plus.js`, flag `vivi_video_lyrics_on_2026_11`); the PC keeps upstream's switch "Show lyrics for video songs" (the rule has none).
- Text size and spacing: built 2026-11-20 as popup sliders (storage.local `lyricsTextSize` 10-40, `lyricsLineSpacing` 1.0-2.5, `src/plus/lyrics-ui-plus.js` `applySize`), but the default is the style's own sizes (22-36 px, `src/canvas.css:158-171, 342, 361`), not 36 and 1.3: a set size applies to every line, so the styles' larger active line is lost. The popup also has switches for §2.6 (real timing), §4.1 (auto-scroll) and §5.2 (sides).
- Romanization: off / only / both (`lyricsRoman`), the romanized line under the original at 0.62 em (`src/canvas.css:1311`); a language picker.
- Translation: built 2026-11-20 (`src/plus/lyrics-ui-plus.js` `translate`, through the line-render hook; storage.local `lyricsTranslate`, a popup switch, not a lyrics-menu one), into the browser's language, fetched by the background (`src/plus/bg-plus.js` `VIVI_TRANSLATE`: a content script's own request didn't get through in Firefox). Kept in memory for the last 20 songs, not on disk. No Latin-script retry through Input Tools (BitChord's).
- Drawn ahead (§1.5): built 2026-11-24 (`src/plus/lyrics-ui-plus.js` `displayLead`, hook in `src/lyrics-ui.js` tick): the refresh interval is measured from the tick's own frames (an average of the intervals of 4-34 ms), 60 Hz until then. Paused, seeking or not yet playable (`readyState` under 3): 0.
- The file's offset (§3.5): built 2026-11-24 (`lyrics-rules.js` `withLrcOffset`, hooked at the end of `parseLRC` and `parseEnhancedLRC` in `src/lyrics.js`, checked by the `lrcOffset` cases). Until then the PC dropped `[offset:]` as a metadata tag. §3.6 doesn't apply: no PC source carries translation or romanization lines (the PC translates through Google, §10, and romanizes itself, §9).
- Enhanced LRC (§5.6, §11 cases): built 2026-11-24 in `parseEnhancedLRC`: the inline `[bg: …]` part is read as background words (the line's text joins them, as for TTML); text before the first word tag starts at the line tag, or at that first tag when the line tag is later. A row without a line tag (`First <00:01.50>word`) is still skipped (Metrolist reads it as a line at its first word). A BOM was already ignored (JavaScript's `\s` includes U+FEFF). Checked by the `parse` cases, which load `src/lyrics.js` in a sandbox. A word with no end tag runs to the next word of its own voice (main or background), else to the line's end: the inline background part, written after the main words, no longer cuts the last main word to 1 ms (audit 2026-11-24; `repairTimings`; checked in `lyrics_cases_tests.mjs`).
- Gaps (§6.1, the first word's start): built 2026-11-24 in `lyrics-rules.js` `gaps`.
- YouTube Music's lyrics (§11.6): built 2026-11-24 (`src/plus/video-canvas-page.js` op `ytlyrics`, `src/plus/lyrics-plus.js` `fromYtMusic`; the page asks `next` as the web client with the listener's visitor id and no cookies, then `browse` as the Android client). Asked after every other source, before YouTube's captions; a popup provider switch "YouTube Music", on by default.
- Offline (§11.7): built 2026-11-24 (`src/lyrics.js` `fetchBestLyrics`, `lyrics-ui-plus.js` `translate`): with `navigator.onLine` false nothing is asked; the PC keeps no miss in any case.
- Clear fetched lyrics (§11.8): nothing to build. The PC saves no fetched lyrics: they are kept in memory for the page (60 songs, an hour), never on disk, and a page reload clears them; it has no lyrics of the listener's own. Its offsets live apart (§3) and nothing clears them.
- Sources: built 2026-11-20. SimpMusic (`src/plus/lyrics-plus.js` `fromSimpMusic`, fetched by `src/plus/bg-plus.js`) joins the race, not after it: the PC races its providers (`src/lyrics.js:1050-1119`). Its answer is `{ type: "success", data: [{ durationSeconds, … }] }`, not BitChord's `success` and `duration` (BitChord's fork reads none of it). YouTube captions (`fromYtCaptions`, read by the page in `src/plus/video-canvas-page.js` op `captions`) are asked only when nothing else answered; read from the track's own www.youtube.com URL (music.youtube.com's `/api/timedtext` answers with the app's page), ♪ marks taken out. Both are popup provider switches, on by default.

### Phone strip against the original

- Lead: the slide's 340 ms (`FEAT/LyricTiming.java:604`); the word fill has no lead (`FILL_LEAD_MS` = 0, `:292, 609`), as the rule (§2.3) and the PC (no fill lead; the PC's only lead on the clock is the display delay of §1.5, `src/lyrics-ui.js:1387`).
- Gaps: a note on the intro and on gaps of 7000 ms or more (`GAP_MIN_MS`, `FEAT/LyricTiming.java:25, 350-360`), as the rule (§6.1) and the PC (`src/plus/lyrics-rules.js:86` `GAP_MIN_MS`).
- Offsets: none.
