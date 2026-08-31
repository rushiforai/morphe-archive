# Remove SDH Annotations: exact behavior

This page specifies what the production patch does. It provides `Off`, `Normalize music symbols only`, `Remove SDH, keep lyrics`, and `Full cleanup`.

## Scope and runtime flow

The patch supports only the official NuvioTV `0.8.11-beta` Media3/ExoPlayer subtitle paths. MPV/libass subtitles are not processed by Morphe.

NuvioTV 0.8.11 has a separate native `Strip SDH annotations` Boolean setting covering Media3, direct sidecars, and MPV. Morphe arbitrates that setting for Media3 as described below; MPV remains controlled only by Nuvio.

When selected in Morphe, the patch:

1. exposes Nuvio's hidden settings destination as `Settings → Morphe`;
2. renders one native `SDH subtitle processing` selector row showing the current value;
3. opens Nuvio's native choice-modal pattern containing `Off`, `Normalize music symbols only`, `Remove SDH, keep lyrics`, and `Full cleanup`;
4. stores the mode in private `morphe_patches` preferences under `subtitles.sdh_cleanup_mode`, defaulting to `NORMALIZE_MUSIC_SYMBOLS` on a fresh installation;
5. intercepts every outgoing Media3 cue list immediately before Nuvio constructs and forwards its `CueGroup`;
6. returns the original cue list unchanged in `Off`;
7. in `Normalize music symbols only`, replaces supported misdecoded and inferred lyric-boundary tokens without removing text; and
8. in either cleanup mode, cleans text cues, suppresses cues that become empty, normalizes retained lyric markers, and leaves non-text cues unchanged.

The preference is checked for every outgoing cue list, so changes apply to the next subtitle update without restarting playback. The setting persists across process and device restarts and is not synchronized to a Nuvio account or sent to Nuvio's backend. Existing stored mode selections remain unchanged. A legacy dev.7 Boolean value of `true` migrates to `Remove SDH, keep lyrics`; an installation with no old or current SDH preference starts in `Normalize music symbols only`.

NuvioTV 0.8.11 also has a native `Strip SDH annotations` switch. For Media3 embedded and direct sidecar subtitles, the patch permits Nuvio's filter only while Morphe is `Off`; every active Morphe mode bypasses the native pass and processes each cue once. Switching Morphe back to `Off` immediately restores the native Media3 behavior if its switch remains enabled. MPV/libass playback is not processed by Morphe and continues to follow Nuvio's native switch.

## Symbol normalization

All modes except `Off` recognize the normal `♪`/`♫` characters and the common CP1252/UTF-8 mojibake forms represented by `\u00E2\u2122\u00AA` and `\u00E2\u2122\u00AB`. The mojibake forms become `♪` and `♫` respectively when their text survives.

The cleaner also infers an unknown music marker when all of these conditions hold:

- a subtitle block has the form `<token> text <same token>`;
- the token is isolated from the text by whitespace;
- the same case-insensitive token appears at both boundaries;
- the token contains no digit and is no longer than four Unicode code points; and
- the same token combination occurs either three times in total or twice consecutively in the active playback subtitle-callback session.

Every inferred boundary token becomes the canonical `♪` symbol. Matching is case-insensitive. Straight and curly apostrophes match one another, and straight and curly double quotes match one another; an apostrophe combination and a double-quote combination remain distinct tokens. Thus `AB" ... ab”` matches, while `AB" ... ab'` does not.

A wrapped block may occupy one physical line or span several physical lines. `J" word word\nword j"` counts as one occurrence, not two. If the next subtitle block is `J" word word word j"`, the pair counts as two consecutive occurrences. A cue list is scanned before it is transformed, so all qualifying occurrences delivered together are corrected together. Across separately timed callback deliveries, recognition begins on the second consecutive or third total occurrence; earlier cues that have already been displayed cannot be changed retroactively. Re-delivery of an identical cue snapshot and a cue retained while another overlapping cue is introduced do not add evidence.

Evidence is isolated to the active playback subtitle callback and resets when Nuvio creates a new callback instance or the user changes the SDH mode. The Media3 hook does not expose a stable subtitle-track identifier, so a track change that reuses the exact same callback instance can retain evidence until that playback callback is replaced.

Bare quotes, dialogue hyphens, supported brackets/parentheses, digit-containing tokens, empty tokens, and whitespace-only tokens are not learned as markers. Self-evident legacy-glyph wrappers do not require repetition: a matching pair of isolated single ASCII letters other than the valid English words `A` and `I`, including quote variants such as `j'` and `J"`, is normalized immediately. Thus `J" lyrics j"` becomes `♪ lyrics ♪`, and `J Julee Cruise's "Falling" playing j` becomes `♪ Julee Cruise's "Falling" playing ♪`. `I told you I` remains unchanged.

Marker-only lines are handled separately. Repeated copies of the same short legacy glyph, such as `JJJ`, become the same number of `♪` symbols. A single isolated ASCII legacy glyph other than the valid English words `A` and `I`, including an apostrophe variant such as `j'`, becomes one `♪`. Short repeated Unicode symbol glyphs are treated the same way. Ordinary punctuation-only lines are preserved. Cleanup modes suppress a marker-only line after normalization; `Normalize music symbols only` leaves the resulting note symbols visible.

`Normalize music symbols only` applies only these substitutions. It does not remove bracketed text, parentheticals, speaker labels, descriptions, lyrics, blank lines, or cues.

## Exact rules in both cleanup modes

### 1. Complete square-bracket blocks

Every complete balanced block matching either form is removed without inspecting its vocabulary, language, capitalization, punctuation, length, or number of lines:

- ASCII `[text]`;
- full-width `［text］`.

Examples removed:

- `[door closes]`
- `[AN UNKNOWN SOUND!]`
- `[person on PA speaking indistinctly]`
- `[literal spoken content]`
- `[annotation spanning\nmultiple lines]`
- `［dramatic music］`

Multiple blocks in the same cue are removed independently. Nested blocks using the same delimiter are removed as one complete outer block.

### 2. Complete parenthetical blocks

Every complete balanced ASCII `(text)` block is removed without inspecting its contents, length, or number of lines.

Examples removed:

- `(whispering)`
- `(door closes)`
- `(in Italian)`
- `(and I meant it)`
- `(speaking very\nsoftly)`
- the qualifier in `JOHN (ON PHONE): Hello.`

This is intentionally aggressive. Ordinary dialogue written inside parentheses is removed too.

### 3. Leading speaker labels

After bracket/parenthetical removal, a speaker prefix at the beginning of a line is removed when it ends with `:` and looks like a name or role. A leading `-`, `–`, or `—` dialogue marker is retained.

The candidate label may contain letters, numbers, apostrophes, hyphens, and spaces. It is limited to 32 characters and may have a final parenthetical qualifier of up to 24 characters before the earlier parenthetical pass removes that qualifier.

A label is accepted when it is:

- all uppercase after non-letters are ignored;
- one to three Title Case or uppercase words, including hyphenated/apostrophized parts; or
- one of these roles/names, case-insensitively, with an uppercase first character for colon prefixes: `man`, `woman`, `boy`, `girl`, `child`, `narrator`, `announcer`, `tv announcer`, `radio announcer`, `reporter`, `interviewer`, `host`, `operator`, `dispatcher`, `caller`, `spouse`, `husband`, `wife`, `mother`, `father`, `lawyer`, `attorney`, `judge`, `waiter`, `waitress`, `doctor`, `nurse`, `officer`, `detective`, `teacher`, `student`, `crowd`, `all`, `voice`, `voices`, `tom`, `john`, `mike`, or `sarah`.

Examples:

- `JOHN: Where are you?` → `Where are you?`
- `JOHN (ON PHONE): Where are you?` → `Where are you?`
- `- SARAH: Outside.` → `- Outside.`

Speaker-prefix safeguards preserve:

- a colon between digits, such as `10:30` or `16:9`;
- labels containing `://`;
- the exact labels `at`, `chapter`, `http`, `https`, `note`, `ratio`, `rule`, `scene`, `time`, `visit`, and `warning`;
- a label mixing digits with lowercase letters; and
- labels outside the accepted character, length, casing, or word-count shapes.

If a recognized speaker prefix has no dialogue after it, the line is suppressed.

### 4. Music-description cues and likely lyrics

The cleaner evaluates real, normalized mojibake, and evidence-inferred music markers using the same music-description and lyric rules.

Music text is evaluated when:

- a cue or line begins or ends with a recognized music marker; or
- a one-line body of up to 80 characters is enclosed by music markers.

The music vocabulary is:

`music`, `instrumental`, `melody`, `theme`, `score`, `soundtrack`, `song`, `singing`, `sings`, `choir`, `orchestra`, `drum`, `drums`, `guitar`, `piano`, `violin`, `jazz`, `rock`, or `classical`.

A body is treated as a music description when it contains a music word and at least one of these is true:

- the complete body is `music` or `instrumental`;
- it contains `play`, `plays`, `playing`, `continue`, `continues`, `continuing`, `start`, `starts`, `starting`, `stop`, `stops`, `stopping`, `fade`, `fades`, `fading`, `swell`, `swells`, or `swelling`;
- it contains `ominous`, `tense`, `dramatic`, `soft`, `quiet`, `loud`, `upbeat`, `somber`, `sad`, `romantic`, `suspenseful`, `eerie`, `gentle`, `background`, or `sinister`; or
- it contains no more than three whitespace-separated words.

A quoted title of 1–60 characters followed or preceded by one of the action words also counts as a music description. This supports multi-line descriptions such as a music marker, artist name, and `"Song Title" playing`.

An empty body between markers is suppressed. A candidate containing one of these dialogue words is preserved as likely lyrics:

`i`, `i'm`, `i’m`, `me`, `my`, `mine`, `we`, `our`, `ours`, `you`, `your`, `yours`, `he`, `him`, `his`, `she`, `her`, `hers`, `they`, `them`, `their`, `this`, `that`, `who`, `what`, `where`, `when`, `why`, `how`, or `please`.

In `Remove SDH, keep lyrics`, this preserves the tested lyric `♪ Hello darkness, my old friend ♪`. Retained lyrics surrounded by mojibake or inferred markers are normalized to real note symbols, but lyric-versus-description detection remains heuristic.

In `Full cleanup`, any complete cue that begins and ends with recognized normal, mojibake, or inferred music-note markers is suppressed regardless of its contents. Any inline one-line segment of up to 80 characters enclosed by paired recognized markers is also removed regardless of its contents. An unmatched marker is preserved.

Examples unique to `Full cleanup`:

- `♪ when the music's over, turn on the light ♪` is suppressed;
- `â™ª Hello darkness, my old friend â™ª` is suppressed; and
- a recognized `j lyric one j` block is suppressed; and
- `Wait here. ♪ wordless singing ♪ Do not move.` becomes `Wait here. Do not move.`

### 5. Empty-result suppression and spacing

- Text is split at `LF`, `CR`, or `CRLF` boundaries and processed line by line.
- Blank lines are removed.
- When a leading block is followed by `:` or `;`, that separator and adjacent horizontal whitespace are removed with the block.
- Leading/trailing whitespace is removed from changed lines.
- Consecutive spaces/tabs in changed lines are collapsed.
- A line reduced to empty text, only a dialogue marker, or only whitespace/music-marker characters is suppressed.
- If every line in a text cue is suppressed, the cue is removed from the outgoing list.

## What is preserved

- In `Off`, the original cue list and text objects are returned unchanged.
- In `Normalize music symbols only`, all text and cue objects remain unchanged unless a supported marker is replaced.
- In either cleanup mode, text outside the removed ranges remains.
- Android character spans attached to surviving text ranges remain.
- Media3 cue timing, position, alignment, size, window/color data, and other cue properties remain.
- Nuvio's original `CueGroup.presentationTimeUs` remains.
- Bitmap and other non-text cues remain unchanged.
- Times, ratios, URLs, and ordinary colons outside removed blocks remain.

## Remaining gaps and destructive limitations

Supported blocks are removed aggressively, but these forms are not recognized:

- `{text}`, `<text>`, full-width parentheses, and other delimiter styles;
- malformed or unclosed blocks.

Complex speaker labels such as `MRS. BOWDEN:`, `MAN #1:`, labels longer than 32 characters, or labels with more than three words may survive.

The aggressive rule also creates deliberate false positives: ordinary text in a supported complete bracket or parenthetical block is removed. Repeated legitimate blocks using the same short boundary token can also be inferred as lyrics and normalized or removed. Keep the mode `Off` for subtitle tracks where exact source text must be retained. `Full cleanup` deliberately removes lyrics enclosed by supported or inferred note markers.

When reporting a remaining miss, include the exact raw subtitle text, including delimiters, capitalization, punctuation, and line breaks. Also record the subtitle language/track and confirm that playback uses Media3/ExoPlayer.

## Source of truth

- Cleaner: `extensions/extension/src/main/java/io/github/liongalahad/nuviotv/extension/subtitles/sdh/SdhSubtitleCleaner.kt`
- Cue transformation: `extensions/extension/src/main/java/io/github/liongalahad/nuviotv/extension/subtitles/sdh/SdhCueTransformer.kt`
- Runtime preference: `extensions/extension/src/main/java/io/github/liongalahad/nuviotv/extension/settings/MorpheSettingsRuntime.java`
- Injection: `patches/src/main/kotlin/io/github/liongalahad/nuviotv/patches/subtitles/sdh/RemoveSdhAnnotationsPatch.kt`
- Regression tests: `extensions/extension/src/test/java/io/github/liongalahad/nuviotv/extension/subtitles/sdh/SdhSubtitleCleanerTest.kt`
