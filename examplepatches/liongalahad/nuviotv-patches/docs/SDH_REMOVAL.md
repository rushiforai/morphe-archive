# Remove SDH Annotations: exact behavior

This page specifies what the production patch does. It provides `Off`, `Remove SDH, keep lyrics`, and `Full cleanup`, matching the updated Nuvio SDH cleaner's `OFF`, `KEEP_LYRICS`, and `REMOVE_LYRICS` behavior.

## Scope and runtime flow

The patch supports only the official NuvioTV `0.8.1-beta` Media3/ExoPlayer subtitle path. MPV/libass subtitles are not processed.

When selected in Morphe, the patch:

1. exposes Nuvio's hidden settings destination as `Settings → Morphe`;
2. renders one native `Remove SDH annotations` selector row showing the current value;
3. opens Nuvio's three-choice modal pattern containing `Off`, `Remove SDH, keep lyrics`, and `Full cleanup`;
4. stores the mode in private `morphe_patches` preferences under `subtitles.sdh_cleanup_mode`, defaulting to `OFF`;
5. intercepts every outgoing Media3 cue list immediately before Nuvio constructs and forwards its `CueGroup`;
6. returns the original cue list unchanged in `Off`; and
7. in either cleanup mode, cleans text cues, suppresses cues that become empty, and leaves non-text cues unchanged.

The preference is checked for every outgoing cue list, so changes apply to the next subtitle update without restarting playback. The setting persists across process and device restarts and is not synchronized to a Nuvio account or sent to Nuvio's backend. A legacy dev.7 Boolean value of `true` migrates to `Remove SDH, keep lyrics`.

## Exact rules in both cleanup modes

### 1. Complete square-bracket blocks

Every complete block matching either form is removed without inspecting its vocabulary, language, capitalization, or punctuation:

- ASCII `[text]`, with a one-line body of 1–80 characters;
- full-width `［text］`, with a one-line body of 1–80 characters.

Examples removed:

- `[door closes]`
- `[AN UNKNOWN SOUND!]`
- `[person on PA speaking indistinctly]`
- `[literal spoken content]`
- `［dramatic music］`

Multiple blocks in the same line are removed independently.

### 2. Complete parenthetical blocks

Every complete non-nested ASCII `(text)` block with a one-line body of 1–60 characters is removed without inspecting its contents.

Examples removed:

- `(whispering)`
- `(door closes)`
- `(in Italian)`
- `(and I meant it)`
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

The cleaner recognizes both real `♪`/`♫` characters and the common CP1252/UTF-8 mojibake forms represented by `\u00E2\u2122\u00AA` or `\u00E2\u2122\u00AB`.

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

In `Remove SDH, keep lyrics`, this preserves the tested lyric `♪ Hello darkness, my old friend ♪`, but lyric-versus-description detection remains heuristic.

In `Full cleanup`, any complete cue that begins and ends with recognised normal or mojibake music-note markers is suppressed regardless of its contents. Any inline one-line segment of up to 80 characters enclosed by paired recognised markers is also removed regardless of its contents. An unmatched marker is preserved.

Examples unique to `Full cleanup`:

- `♪ when the music's over, turn on the light ♪` is suppressed;
- `â™ª Hello darkness, my old friend â™ª` is suppressed; and
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
- In either cleanup mode, text outside the removed ranges remains.
- Android character spans attached to surviving text ranges remain.
- Media3 cue timing, position, alignment, size, window/color data, and other cue properties remain.
- Nuvio's original `CueGroup.presentationTimeUs` remains.
- Bitmap and other non-text cues remain unchanged.
- Times, ratios, URLs, and ordinary colons outside removed blocks remain.

## Remaining gaps and destructive limitations

Supported blocks are removed aggressively, but these forms are not recognized:

- `{text}`, `<text>`, full-width parentheses, and other delimiter styles;
- square-bracket bodies longer than 80 characters;
- parenthetical bodies longer than 60 characters;
- nested blocks;
- malformed or unclosed blocks; and
- content spanning a line break inside one block.

Complex speaker labels such as `MRS. BOWDEN:`, `MAN #1:`, labels longer than 32 characters, or labels with more than three words may survive.

The aggressive rule also creates deliberate false positives: ordinary text in a supported complete bracket or parenthetical block is removed. Keep the mode `Off` for subtitle tracks where brackets or parentheses contain dialogue that must be retained. `Full cleanup` deliberately removes lyrics enclosed by supported note markers.

When reporting a remaining miss, include the exact raw subtitle text, including delimiters, capitalization, punctuation, and line breaks. Also record the subtitle language/track and confirm that playback uses Media3/ExoPlayer.

## Source of truth

- Cleaner: `extensions/extension/src/main/java/io/github/liongalahad/nuviotv/extension/subtitles/sdh/SdhSubtitleCleaner.kt`
- Cue transformation: `extensions/extension/src/main/java/io/github/liongalahad/nuviotv/extension/subtitles/sdh/SdhCueTransformer.kt`
- Runtime preference: `extensions/extension/src/main/java/io/github/liongalahad/nuviotv/extension/settings/MorpheSettingsRuntime.java`
- Injection: `patches/src/main/kotlin/io/github/liongalahad/nuviotv/patches/subtitles/sdh/RemoveSdhAnnotationsPatch.kt`
- Regression tests: `extensions/extension/src/test/java/io/github/liongalahad/nuviotv/extension/subtitles/sdh/SdhSubtitleCleanerTest.kt`
