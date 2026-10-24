package app.yydarlinker.deepseekcaptions;

import org.json.JSONArray;
import org.json.JSONObject;

import java.nio.charset.StandardCharsets;
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.function.Consumer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Immutable evidence, not subtitles. Native segment bounds are never inferred from target text. */
final class RebuildSource {
    enum Precision {
        NATIVE,
        ESTIMATED,
        ALIGNED
    }

    enum AnchorKind {
        WORD_ONSET,
        SEGMENT_ONSET,
        CUE_ONSET,
        CUE_END_BOUND
    }

    /** A time the track itself states for a word boundary, kept to retime another track later. */
    static final class TimeAnchor {
        final int boundary;
        final long timeMs;
        final AnchorKind kind;

        TimeAnchor(int boundary, long timeMs, AnchorKind kind) {
            this.boundary = boundary;
            this.timeMs = timeMs;
            this.kind = kind;
        }
    }

    static final class TimedWindow {
        final int from, to;
        final long start, end;

        TimedWindow(int from, int to, long start, long end) {
            this.from = from;
            this.to = to;
            this.start = start;
            this.end = end;
        }

        boolean contains(long time) {
            return start <= time && time < end;
        }
    }

    static final class Word {
        final String text, key;
        final long start, end;
        final int cue;
        final Precision precision;

        Word(String text, long start, long end, int cue, Precision precision) {
            this.text = text;
            key = key(text);
            this.start = start;
            this.end = end;
            this.cue = cue;
            this.precision = precision;
        }
    }

    /** Coarse spans are ordered BEFORE interpolation; never sort invented word onsets. */
    private static final class Span {
        final String text;
        final long start, end;
        final int cue;
        final boolean nativeOffset, speakerBreak;
        final List<Integer> speakerOffsets;

        Span(String text, long start, long end, int cue, boolean nativeOffset) {
            this(text, start, end, cue, nativeOffset, false, Collections.emptyList());
        }

        Span(
                String text,
                long start,
                long end,
                int cue,
                boolean nativeOffset,
                boolean speakerBreak,
                List<Integer> speakerOffsets) {
            this.text = text;
            this.start = start;
            this.end = end;
            this.cue = cue;
            this.nativeOffset = nativeOffset;
            this.speakerBreak = speakerBreak;
            this.speakerOffsets = speakerOffsets;
        }

        Span withText(String value) {
            return new Span(value, start, end, cue, nativeOffset, speakerBreak, speakerOffsets);
        }

        Span withEnd(long value) {
            return new Span(text, start, value, cue, nativeOffset, speakerBreak, speakerOffsets);
        }
    }

    /** Two words further apart than this are a hard source break. */
    static final long HARD_GAP_MS = 650;

    final List<Word> words;
    final List<TimeAnchor> anchors;
    final boolean coarseCueReconstructed;
    final int coarseCueCount;
    final String formatEvidence;
    private List<TimedWindow> windows;

    RebuildSource(List<Word> values) {
        this(values, Collections.emptyList(), false, 0, "");
    }

    private RebuildSource(
            List<Word> values,
            List<TimeAnchor> anchors,
            boolean reconstructed,
            int count,
            String evidence) {
        words = Collections.unmodifiableList(new ArrayList<>(values));
        this.anchors = Collections.unmodifiableList(new ArrayList<>(anchors));
        coarseCueReconstructed = reconstructed;
        coarseCueCount = count;
        formatEvidence = evidence;
    }

    /** The same evidence with other word times. */
    private RebuildSource retimed(List<Word> values) {
        return new RebuildSource(
                values, anchors, coarseCueReconstructed, coarseCueCount, formatEvidence);
    }

    // ---- Tokens ----

    static final Pattern TOKEN =
            Pattern.compile(
                    "[\\p{IsHan}\\p{IsHiragana}\\p{IsKatakana}\\p{IsHangul}]"
                            + "|[+-]?\\p{N}+(?:[.,:/-]\\p{N}+)*(?:[a-zA-Z]+)?(?:%|％)?"
                            + "|[\\p{L}\\p{M}]+(?:[.'’_\\-][\\p{L}\\p{M}\\p{N}]+)*|[^\\s]");

    static List<String> tokens(String text) {
        List<String> result = new ArrayList<>();
        Matcher m = TOKEN.matcher(text == null ? "" : text);
        while (m.find()) {
            String t = m.group();
            if (!lexical(t) && !result.isEmpty() && !opening(t))
                result.set(result.size() - 1, result.get(result.size() - 1) + t);
            else result.add(t);
        }
        return result;
    }

    static boolean lexical(String s) {
        return s.codePoints().anyMatch(Character::isLetterOrDigit);
    }

    private static boolean opening(String s) {
        return "([{（【《“‘\"".contains(s);
    }

    private static final Pattern KEY_EDGE =
            Pattern.compile("^[^\\p{L}\\p{N}+\\-]+|[^\\p{L}\\p{N}%]+$");

    static String key(String s) {
        String ascii = asciiKey(s);
        if (ascii != null) return ascii;
        String folded =
                Normalizer.normalize(s, Normalizer.Form.NFKC)
                        .toLowerCase(Locale.ROOT)
                        .replace('’', '\'')
                        .replace('−', '-');
        return KEY_EDGE.matcher(folded).replaceAll("");
    }

    /** Printable ASCII with alphanumeric edges: NFKC, both replacements and KEY_EDGE are no-ops. */
    private static String asciiKey(String s) {
        int n = s.length();
        if (n == 0) return null;
        for (int i = 0; i < n; i++) if (s.charAt(i) < 0x20 || s.charAt(i) > 0x7e) return null;
        String lower = s.toLowerCase(Locale.ROOT);
        char first = lower.charAt(0), last = lower.charAt(n - 1);
        boolean head = Character.isLetterOrDigit(first) || first == '+' || first == '-';
        boolean tail = Character.isLetterOrDigit(last) || last == '%';
        return head && tail ? lower : null;
    }

    static boolean cjk(int c) {
        Character.UnicodeScript s = Character.UnicodeScript.of(c);
        return s == Character.UnicodeScript.HAN
                || s == Character.UnicodeScript.HIRAGANA
                || s == Character.UnicodeScript.KATAKANA
                || s == Character.UnicodeScript.HANGUL;
    }

    static String join(List<Word> w, int from, int to) {
        StringBuilder b = new StringBuilder();
        for (int i = from; i <= to; i++) {
            String s = w.get(i).text;
            if (b.length() > 0 && !s.isEmpty() && needsSpace(b, s)) b.append(' ');
            b.append(s);
        }
        return b.toString();
    }

    /**
     * A space belongs between two spaced-script words, never after CJK punctuation: 「, 、 and 。
     * are set tight against a following Latin word. The injected space used to make every quote
     * the model was asked to copy differ from the text it actually read.
     */
    private static boolean needsSpace(StringBuilder prior, String next) {
        int left = prior.codePointBefore(prior.length()), right = next.codePointAt(0);
        if (cjk(left) || cjk(right) || compactPunctuation(left)) return false;
        if (!Character.isLetterOrDigit(right)) return false;
        return "([{（【《“‘".indexOf(new String(Character.toChars(left))) < 0;
    }

    /** Punctuation that CJK typography sets tight against what follows it. */
    private static boolean compactPunctuation(int cp) {
        return cp >= 0x3000 && cp <= 0x303F
                || cp >= 0xFF00 && cp <= 0xFFEF
                || cp == 0x2018
                || cp == 0x2019
                || cp == 0x201C
                || cp == 0x201D
                || cp == 0x2026
                || cp == 0x2014;
    }

    String text(int from, int to) {
        return join(words, from, to);
    }

    // ---- Timing evidence ----

    int nativeWordCount() {
        int count = 0;
        for (Word word : words) if (word.precision == Precision.NATIVE) count++;
        return count;
    }

    private int anchorCount(AnchorKind... kinds) {
        int count = 0;
        for (TimeAnchor anchor : anchors)
            for (AnchorKind kind : kinds)
                if (anchor.kind == kind) {
                    count++;
                    break;
                }
        return count;
    }

    private int segmentAnchorCount() {
        return anchorCount(AnchorKind.SEGMENT_ONSET);
    }

    private int cueAnchorCount() {
        return anchorCount(AnchorKind.CUE_ONSET, AnchorKind.CUE_END_BOUND);
    }

    boolean hasPartialTiming() {
        return segmentAnchorCount() > 0 || cueAnchorCount() > 0;
    }

    int matchedWordCount(RebuildSource reference) {
        return reference == null ? 0 : uniqueWordMatches(words, reference.words).size();
    }

    /**
     * How much this track can teach {@code primary} about timing: 0 (nothing) to 3 (word times).
     */
    int timingQualityAgainst(RebuildSource primary) {
        int matched = primary == null ? 6 : primary.matchedWordCount(this);
        if (matched < 6) return 0;
        if (nativeWordCount() > 0) return 3;
        if (segmentAnchorCount() > 0) return 2;
        if (cueAnchorCount() > 0) return 1;
        return 0;
    }

    String timingCapabilities() {
        return "word_direct="
                + nativeWordCount()
                + ";segment_anchors="
                + segmentAnchorCount()
                + ";cue_anchors="
                + cueAnchorCount()
                + ";words="
                + words.size()
                + ";format="
                + (formatEvidence.isEmpty() ? "unknown" : formatEvidence);
    }

    String precisionEvidence() {
        int nativeWords = 0, alignedWords = 0;
        for (Word word : words) {
            if (word.precision == Precision.NATIVE) nativeWords++;
            else if (word.precision == Precision.ALIGNED) alignedWords++;
        }
        return "native="
                + nativeWords
                + ";estimated="
                + (words.size() - nativeWords - alignedWords)
                + ";aligned="
                + alignedWords
                + ";segment_anchors="
                + segmentAnchorCount()
                + ";cue_anchors="
                + cueAnchorCount()
                + (formatEvidence.isEmpty() ? "" : ";" + formatEvidence);
    }

    /** The speech runs of this source: a new run starts at a new cue, a hard gap or a speaker. */
    List<TimedWindow> windows() {
        if (windows == null) windows = computeWindows();
        return windows;
    }

    private List<TimedWindow> computeWindows() {
        if (words.isEmpty()) return Collections.emptyList();
        List<TimedWindow> result = new ArrayList<>();
        int from = 0, cue = words.get(0).cue;
        long start = words.get(0).start, end = words.get(0).end;
        for (int i = 1; i < words.size(); i++) {
            Word prior = words.get(i - 1), now = words.get(i);
            if (now.cue != cue
                    || now.start - prior.end >= HARD_GAP_MS
                    || now.text.startsWith(">>")) {
                if (end > start) result.add(new TimedWindow(from, i - 1, start, end));
                from = i;
                start = now.start;
                cue = now.cue;
            }
            end = Math.max(end, now.end);
        }
        if (end > start) result.add(new TimedWindow(from, words.size() - 1, start, end));
        return Collections.unmodifiableList(result);
    }

    TimedWindow windowAt(long time) {
        for (TimedWindow window : windows()) if (window.contains(time)) return window;
        return null;
    }

    // ---- Word classes ----

    // Compiled once: terminal() runs for every source word while request blocks are planned.
    private static final Pattern TERMINAL =
                    Pattern.compile("(?s).*[.!?。！？؟۔।॥׃።][\\\"'”’）)]*$"),
            ABBREVIATION = Pattern.compile("(?i).*(?:\\bMr|\\bMrs|\\bDr|\\bProf|\\bvs|\\betc)\\."),
            MUSIC = Pattern.compile("[♪♫\\s]+"),
            NON_SPEECH =
                    Pattern.compile("[\\[（(【]\\s*(music|applause|laughter|音乐|掌声|笑声)\\s*[\\]）)】]");

    static boolean terminal(String s) {
        // Necessary condition for TERMINAL; unpunctuated ASR words never reach the pattern.
        boolean candidate = false;
        for (int i = 0; i < s.length() && !candidate; i++)
            candidate = ".!?。！？؟۔।॥׃።".indexOf(s.charAt(i)) >= 0;
        return candidate && TERMINAL.matcher(s).matches() && !ABBREVIATION.matcher(s).matches();
    }

    static boolean nonSpeech(String s) {
        String t = s.trim().toLowerCase(Locale.ROOT);
        return MUSIC.matcher(t).matches() || NON_SPEECH.matcher(t).matches();
    }

    // ---- Reading a track ----

    /**
     * Zero-width spaces (U+200B, U+2060, U+FEFF) pad the cues of some tracks. They are not speech,
     * but each one becomes a token whose exact count a model cannot reproduce when it must quote
     * the source, so every such block was rejected.
     */
    private static final Pattern ZERO_WIDTH_SPACES = Pattern.compile("[\u200B\u2060\uFEFF]");

    private static List<Span> withoutZeroWidthSpaces(List<Span> spans) {
        List<Span> out = new ArrayList<>(spans.size());
        for (Span span : spans)
            out.add(
                    span.speakerOffsets.isEmpty()
                            ? span.withText(ZERO_WIDTH_SPACES.matcher(span.text).replaceAll(""))
                            : span);
        return out;
    }

    /**
     * Some tracks carry every coarse cue twice (an overlapping second display window, or a pop-on
     * line shown again as it moves up). Repetition alone is not evidence, so this applies only when
     * the repetition is systematic over the whole track: an isolated repeated sentence is real
     * speech and stays. The second copy only extends the first copy's display time.
     */
    private static final long DOUBLED_CUE_GAP_MS = 600;

    private static final int DOUBLED_CUE_MIN_REPEATS = 6;

    private static boolean sameCoarseText(Span a, Span b) {
        if (a.nativeOffset || b.nativeOffset) return false;
        // Zero-width padding around a cue is not text: the copy may carry different padding.
        List<String> x = tokens(visibleText(a.text)), y = tokens(visibleText(b.text));
        if (x.isEmpty() || x.size() != y.size()) return false;
        for (int i = 0; i < x.size(); i++) if (!key(x.get(i)).equals(key(y.get(i)))) return false;
        return true;
    }

    private static String visibleText(String text) {
        return text == null ? "" : text.replaceAll("[\u200B-\u200F\u2060\uFEFF]", "");
    }

    private static boolean repeatedBlock(List<Span> spans, int at, int size) {
        // The copy begins right after the block it repeats (or while it is still shown).
        if (spans.get(at + size).start > spans.get(at + size - 1).end + DOUBLED_CUE_GAP_MS)
            return false;
        for (int j = 0; j < size; j++) {
            Span first = spans.get(at + j), copy = spans.get(at + size + j);
            if (copy.start < first.start || !sameCoarseText(first, copy)) return false;
        }
        return true;
    }

    /**
     * A karaoke track advances the highlight by showing the same line again in a new, very short
     * cue/event: every step carries the whole sentence and only its highlight position differs.
     * Read as independent cues, one spoken sentence enters the token stream once per highlight.
     *
     * <p>A spoken sentence cannot be delivered inside {@link #DISPLAY_STEP_MAX_MS}; a line that is
     * shown again immediately after a line with the same tokens is a display step, not new speech.
     * The merge is deliberately local: two consecutive lines with the same tokens, a window that
     * touches (gap no larger than {@link #DISPLAY_STEP_GAP_MS}), each window short enough to be a
     * display step, and each window fast enough (at least {@link #DISPLAY_STEP_MIN_RATE} tokens per
     * second) that it cannot be ordinary slow speech. There is no whole-track repetition threshold,
     * and genuine repeated speech is left untouched. The first line keeps its word timing; its last
     * word is extended to the end of the last display window.
     */
    private static final long DISPLAY_STEP_MAX_MS = 400;

    private static final long DISPLAY_STEP_GAP_MS = 600;

    /** A display step shows a dense line; slower repeated words are real speech. */
    private static final int DISPLAY_STEP_MIN_RATE = 12;

    /** One displayed line: every span a single cue/event emitted, in onset order. */
    private static final class DisplayLine {
        final int from, to;
        final List<String> tokens;
        final long start, end;

        DisplayLine(List<Span> spans, int from, int to) {
            this.from = from;
            this.to = to;
            long first = spans.get(from).start, last = spans.get(from).end;
            StringBuilder text = new StringBuilder();
            for (int i = from; i < to; i++) {
                Span span = spans.get(i);
                first = Math.min(first, span.start);
                last = Math.max(last, span.end);
                text.append(span.text);
            }
            start = first;
            end = last;
            tokens = tokens(visibleText(text.toString()));
        }

        boolean mergeableWith(DisplayLine next) {
            // "The same line" means the same token sequence after zero-width padding was removed.
            if (tokens.isEmpty() || tokens.size() != next.tokens.size()) return false;
            if (end <= start || next.end <= next.start) return false;
            if (end - start > DISPLAY_STEP_MAX_MS || next.end - next.start > DISPLAY_STEP_MAX_MS)
                return false;
            // Implied speech rate: a 200 ms cue with one word is 5 tokens/second, i.e. real speech,
            // not a highlight step. A dense karaoke line is far above this floor.
            if (tokens.size() * 1000L < DISPLAY_STEP_MIN_RATE * (end - start)) return false;
            if (next.tokens.size() * 1000L < DISPLAY_STEP_MIN_RATE * (next.end - next.start))
                return false;
            if (next.start - end > DISPLAY_STEP_GAP_MS) return false;
            for (int i = 0; i < tokens.size(); i++)
                if (!tokens.get(i).equals(next.tokens.get(i))) return false;
            return true;
        }
    }

    /**
     * Merges consecutive display steps before the word stream is built. This is the cue/event
     * layer: a line is every contiguous span carrying one cue id, so a multi-segment JSON3 event
     * (word offsets) and a multi-range VTT cue are both one line. The pass has its own contract and
     * runs before {@link #collapseDoubledCues(List)}, which still handles whole-track equivalent
     * copies with its original systematic threshold.
     */
    private static List<Span> mergeDisplaySteps(List<Span> spans) {
        List<DisplayLine> lines = displayLines(spans);
        if (lines.size() < 2) return spans;
        List<Span> out = new ArrayList<>(spans.size());
        for (int at = 0; at < lines.size(); ) {
            int last = at;
            while (last + 1 < lines.size()
                    && lines.get(last).mergeableWith(lines.get(last + 1))) last++;
            DisplayLine first = lines.get(at);
            if (last == at) {
                for (int i = first.from; i < first.to; i++) out.add(spans.get(i));
            } else {
                DisplayLine ending = lines.get(last);
                for (int i = first.from; i < first.to; i++) {
                    Span span = spans.get(i);
                    // Word-level timing belongs to the first display step; only the last word
                    // reaches the end of the last step, so the merged line keeps its whole window.
                    if (i + 1 == first.to && ending.end > span.end)
                        span = span.withEnd(ending.end);
                    out.add(span);
                }
            }
            at = last + 1;
        }
        return out;
    }

    /** Contiguous spans of one cue/event; a sorted stream keeps every cue's spans together. */
    private static List<DisplayLine> displayLines(List<Span> spans) {
        List<DisplayLine> lines = new ArrayList<>();
        int from = 0;
        for (int i = 1; i <= spans.size(); i++)
            if (i == spans.size() || spans.get(i).cue != spans.get(from).cue) {
                lines.add(new DisplayLine(spans, from, i));
                from = i;
            }
        return lines;
    }

    private static List<Span> collapseDoubledCues(List<Span> spans) {
        int n = spans.size();
        List<int[]> blocks = new ArrayList<>();
        int repeated = 0;
        for (int i = 0; i < n; ) {
            int advance = 1;
            for (int size = 1; size <= 3 && i + 2 * size <= n; size++) {
                if (!repeatedBlock(spans, i, size)) continue;
                blocks.add(new int[] {i, size});
                repeated += size;
                advance = 2 * size;
                break;
            }
            i += advance;
        }
        if (repeated < DOUBLED_CUE_MIN_REPEATS || repeated * 5 < n) return spans;
        Span[] result = spans.toArray(new Span[0]);
        boolean[] dropped = new boolean[n];
        for (int[] block : blocks)
            for (int j = 0; j < block[1]; j++) {
                Span first = result[block[0] + j], copy = spans.get(block[0] + block[1] + j);
                if (copy.end > first.end) result[block[0] + j] = first.withEnd(copy.end);
                dropped[block[0] + block[1] + j] = true;
            }
        List<Span> out = new ArrayList<>(n - repeated);
        for (int i = 0; i < n; i++) if (!dropped[i]) out.add(result[i]);
        return out;
    }

    /**
     * Uploaders write ruby (furigana) into YouTube's own format as base text followed by the
     * reading in brackets: 漢字(かんじ). YouTube draws the reading above the text; read as plain text it
     * is a second copy of the sentence that translations would then repeat. A track that does this
     * systematically is read as its base text; one stray bracket is real text.
     */
    private static final Pattern RUBY = Pattern.compile("([㐀-鿿々〆ヶ]+)[（(]([぀-ゟ゠-ヿー]+)[）)]");

    private static List<Span> withoutRuby(List<Span> spans) {
        int found = 0;
        for (Span span : spans) {
            if (span.nativeOffset) continue;
            Matcher m = RUBY.matcher(span.text);
            while (m.find()) found++;
        }
        if (found < 3) return spans;
        List<Span> out = new ArrayList<>(spans.size());
        for (Span span : spans)
            out.add(
                    span.nativeOffset || !RUBY.matcher(span.text).find()
                            ? span
                            : span.withText(RUBY.matcher(span.text).replaceAll("$1")));
        return out;
    }

    static RebuildSource read(byte[] body, CaptionDocument.Parsed parsed) throws Exception {
        return read(body, parsed, false);
    }

    static RebuildSource read(byte[] body, CaptionDocument.Parsed parsed, boolean translating)
            throws Exception {
        String raw = new String(body, StandardCharsets.UTF_8).trim();
        if (raw.startsWith("\uFEFF")) raw = raw.substring(1).trim();
        boolean webVtt = raw.startsWith("WEBVTT"), json3 = raw.startsWith("{");
        boolean xml = raw.startsWith("<?xml")
                || raw.startsWith("<transcript")
                || raw.startsWith("<timedtext");
        // Record the parsed format for every input, not only VTT/XML. A coarse JSON3/SRT body
        // must be distinguishable in diagnostics from an XML/VTT body with native offsets.
        String formatEvidence = parsed == null ? "" : parsed.timingCapabilities();
        List<Span> spans = new ArrayList<>();
        if (webVtt) {
            WebVttSourceReader.Result vtt = WebVttSourceReader.read(raw);
            formatEvidence = vtt.evidence();
            for (WebVttSourceReader.Range range : vtt.ranges)
                spans.add(
                        new Span(
                                range.text,
                                range.start,
                                range.end,
                                range.cue,
                                range.nativeStart,
                                range.speakerBreak,
                                range.speakerOffsets));
        }
        if (json3) json3Spans(new JSONObject(raw).optJSONArray("events"), spans);
        // XML/srv3 already gives CaptionDocument per-<s> onsets. The old generic fallback read
        // only whole <p> cues, throwing those onsets away before the planner saw them. Use the
        // parsed fragments whenever they carry native offsets (or whenever the payload is XML);
        // text-only formats keep the cue fallback.
        boolean nativeXml = false;
        for (CaptionDocument.RawFragment fragment : parsed.rawFragments())
            if (fragment.nativeOffset) {
                nativeXml = true;
                break;
            }
        if (spans.isEmpty() && (xml || nativeXml)) {
            for (CaptionDocument.RawFragment fragment : parsed.rawFragments()) {
                if (fragment.raw == null || fragment.raw.trim().isEmpty()) continue;
                spans.add(
                        new Span(
                                fragment.raw,
                                fragment.startMs,
                                fragment.endMs,
                                fragment.cue,
                                fragment.nativeOffset,
                                false,
                                Collections.emptyList()));
            }
            formatEvidence = parsed.timingCapabilities();
        }
        if (spans.isEmpty() && !webVtt) {
            int i = 0;
            for (CaptionDocument.Cue c : parsed.cues())
                spans.add(new Span(c.text, c.startMs, c.endMs, i++, false));
        }
        // Ordering comes from real cue/segment onsets. A multiword coarse span remains
        // indivisible during ordering. Equal real native onsets may be repeated by an overlapping
        // JSON3 window.
        spans.sort(Comparator.comparingLong((Span v) -> v.start));
        spans = withoutZeroWidthSpaces(spans);
        // Display steps are a property of the cue/event stream, not of the whole track: merge them
        // before the systematic doubled-copy pass, whose contract (repeated >= 6 and a large share
        // of the track) must stay exactly as it was.
        spans = mergeDisplaySteps(spans);
        spans = collapseDoubledCues(spans);
        if (translating) spans = withoutRuby(spans);
        List<Span> ordered = orderedSpans(spans, webVtt);

        List<Word> out = new ArrayList<>();
        List<TimeAnchor> observed = new ArrayList<>();
        boolean repaired = false;
        int coarse = 0;
        for (int i = 0; i < ordered.size(); i++) {
            Span span = ordered.get(i);
            List<String> spanTokens = tokens(span.text);
            boolean estimated = !span.nativeOffset || spanTokens.size() != 1;
            if (estimated) coarse++;
            long end = span.end;
            if (i + 1 < ordered.size() && ordered.get(i + 1).start < end) {
                end = ordered.get(i + 1).start;
                repaired |= estimated;
            }
            int first = out.size();
            AnchorKind onset =
                    span.nativeOffset && spanTokens.size() == 1
                            ? AnchorKind.WORD_ONSET
                            : span.nativeOffset ? AnchorKind.SEGMENT_ONSET : AnchorKind.CUE_ONSET;
            if (!spanTokens.isEmpty()) observed.add(new TimeAnchor(first, span.start, onset));
            Set<Integer> speakerWords = new HashSet<>();
            if (span.speakerBreak) speakerWords.add(0);
            // XML/srv3 carries a segment onset but no inner word offsets. Claim the first token at
            // that onset; JSON3/VTT already have their own word-level spans and keep the old rule.
            boolean claimFirst = xml && span.nativeOffset;
            if (span.speakerOffsets.isEmpty())
                addTokens(
                        out,
                        tokens(span.text.replace(' ', ' ')),
                        span.text,
                        span.start,
                        end,
                        span.cue,
                        span.nativeOffset,
                        claimFirst);
            else {
                List<String> speech = new ArrayList<>();
                int from = 0;
                for (int mark : span.speakerOffsets)
                    if (mark >= from && mark < span.text.length()) {
                        speech.addAll(tokens(span.text.substring(from, mark).replace(' ', ' ')));
                        speakerWords.add(speech.size());
                        from = mark;
                    }
                speech.addAll(tokens(span.text.substring(from).replace(' ', ' ')));
                if (end - span.start < speech.size())
                    throw new IllegalArgumentException("vtt_voice_time_capacity");
                addTokens(
                        out, speech, span.text, span.start, end, span.cue, span.nativeOffset, claimFirst);
            }
            if (!spanTokens.isEmpty())
                observed.add(new TimeAnchor(out.size(), end, AnchorKind.CUE_END_BOUND));
            for (int index : speakerWords)
                if (first + index < out.size()) {
                    Word word = out.get(first + index);
                    out.set(
                            first + index,
                            new Word(
                                    ">>" + word.text,
                                    word.start,
                                    word.end,
                                    word.cue,
                                    word.precision));
                }
        }
        if (out.isEmpty()) throw new IllegalArgumentException("source_empty");
        for (int i = 1; i < out.size(); i++)
            if (out.get(i).start < out.get(i - 1).end)
                throw new IllegalArgumentException("source_time_order");
        return new RebuildSource(out, observed, repaired, coarse, formatEvidence);
    }

    /**
     * The spans that carry words, in onset order. Simultaneous coarse observations have no
     * word-order timing proof, so they are kept as one span holding both texts.
     */
    private static List<Span> orderedSpans(List<Span> spans, boolean webVtt) {
        List<Span> ordered = new ArrayList<>();
        Set<String> nativeSeen = new HashSet<>();
        for (Span span : spans) {
            List<String> ts = tokens(span.text);
            if (ts.isEmpty() || span.end <= span.start) continue;
            if (!webVtt
                    && span.nativeOffset
                    && ts.size() == 1
                    && !nativeSeen.add(span.start + "|" + key(ts.get(0)))) continue;
            Span last = ordered.isEmpty() ? null : ordered.get(ordered.size() - 1);
            if (last != null && last.start == span.start)
                ordered.set(
                        ordered.size() - 1,
                        new Span(
                                last.text.trim() + " " + span.text.trim(),
                                last.start,
                                Math.max(last.end, span.end),
                                last.cue,
                                false));
            else ordered.add(span);
        }
        return ordered;
    }

    /** The spans of a JSON3 track: whole events, or runs between explicit segment offsets. */
    private static void json3Spans(JSONArray events, List<Span> spans) {
        if (events == null) return;
        Map<String, CoarseFrame> frames = new HashMap<>();
        Map<String, KaraokeLine> lines = new HashMap<>();
        List<KaraokeLine> completed = new ArrayList<>();
        for (int i = 0; i < events.length(); i++) {
            JSONObject event = events.optJSONObject(i);
            if (event == null) continue;
            JSONArray segs = event.optJSONArray("segs");
            if (segs == null) continue;
            long start = event.optLong("tStartMs", -1), duration = event.optLong("dDurationMs", -1);
            if (start < 0) continue;
            long next = Long.MAX_VALUE;
            for (int j = i + 1; j < events.length(); j++) {
                JSONObject later = events.optJSONObject(j);
                if (later != null
                        && later.optLong("tStartMs", -1) > start
                        && later.optJSONArray("segs") != null) {
                    next = later.optLong("tStartMs");
                    break;
                }
            }
            long end =
                    duration > 0 ? start + duration : next == Long.MAX_VALUE ? start + 2000 : next;
            if (end <= start) continue;
            boolean offsets = false;
            for (int j = 0; j < segs.length(); j++) {
                JSONObject part = segs.optJSONObject(j);
                offsets |= part != null && part.has("tOffsetMs");
            }
            if (offsets) {
                offsetSpans(segs, start, end, i, spans);
                continue;
            }
            StringBuilder text = new StringBuilder();
            for (int j = 0; j < segs.length(); j++) {
                JSONObject part = segs.optJSONObject(j);
                if (part != null) text.append(part.optString("utf8", ""));
            }
            if (event.has("wpWinPosId")) {
                // A word-level track repeats the whole line as a snapshot at every highlight step.
                // Build one line per window episode and read only the words already spoken.
                karaokeEvent(lines, completed, event, text.toString(), start, end, i);
            } else if (event.has("wWinId")) {
                String window = "w" + event.optInt("wWinId");
                frames.put(
                        window,
                        appendFrame(
                                spans,
                                text.toString(),
                                start,
                                end,
                                i,
                                event.optInt("aAppend", 0) == 1,
                                frames.get(window)));
            } else spans.add(new Span(text.toString(), start, end, i, false));
        }
        completed.addAll(lines.values());
        flushKaraoke(completed, spans);
    }

    /**
     * One displayed line of a word-level JSON3 track: the words spoken so far, not the dim tail the
     * same snapshot already shows. Kept whole so simultaneous speaker windows never interleave
     * word by word in the source stream.
     */
    private static final class KaraokeLine {
        List<String> tokens;
        String text;
        final long start;
        long end;
        final int cue;

        KaraokeLine(List<String> tokens, String text, long start, long end, int cue) {
            this.tokens = tokens;
            this.text = text;
            this.start = start;
            this.end = end;
            this.cue = cue;
        }
    }

    /** Spoken-line clusters whose first windows are this close are one simultaneous caption. */
    private static final long KARAOKE_SIMULTANEOUS_MS = 250;

    private static void karaokeEvent(
            Map<String, KaraokeLine> lines,
            List<KaraokeLine> completed,
            JSONObject event,
            String text,
            long start,
            long end,
            int cue) {
        String speech = hasKaraokePens(event) ? karaokeSpeech(event, text) : text;
        List<String> now = tokens(speech);
        String window = "p" + event.optInt("wpWinPosId");
        KaraokeLine line = lines.get(window);
        if (now.isEmpty()) {
            if (line != null) line.end = Math.max(line.end, end);
            return;
        }
        if (line == null) {
            lines.put(window, new KaraokeLine(now, speech.trim(), start, end, cue));
            return;
        }
        if (prefixOf(line.tokens, now)) {
            line.tokens = now;
            line.text = speech.trim();
            line.end = Math.max(line.end, end);
            return;
        }
        // A roll-up window drops its top line: the remaining words are a suffix of the same line,
        // not a new spoken sentence.
        if (now.size() < line.tokens.size() && suffixOf(line.tokens, now)) {
            line.end = Math.max(line.end, end);
            return;
        }
        completed.add(line);
        lines.put(window, new KaraokeLine(now, speech.trim(), start, end, cue));
    }

    private static void flushKaraoke(Collection<KaraokeLine> lines, List<Span> out) {
        if (lines.isEmpty()) return;
        List<Span> spans = new ArrayList<>(lines.size());
        for (KaraokeLine line : lines) {
            if (line.tokens.isEmpty() || line.text.isEmpty()) continue;
            spans.add(new Span(line.text, line.start, line.end, line.cue, false));
        }
        spans.sort(Comparator.comparingLong(span -> span.start));
        // Two speaker windows that start together are one simultaneous caption; a line that merely
        // overlaps a long hold is a later caption, not a second copy of this one.
        List<Span> clusters = new ArrayList<>(spans.size());
        for (Span span : spans) {
            Span previous = clusters.isEmpty() ? null : clusters.get(clusters.size() - 1);
            if (previous != null && span.start - previous.start <= KARAOKE_SIMULTANEOUS_MS) {
                clusters.set(
                        clusters.size() - 1,
                        new Span(
                                joinKaraoke(previous.text, span.text),
                                previous.start,
                                Math.max(previous.end, span.end),
                                previous.cue,
                                false));
            } else clusters.add(span);
        }
        out.addAll(clusters);
    }

    private static String joinKaraoke(String left, String right) {
        if (left.isEmpty()) return right;
        if (right.isEmpty()) return left;
        return left + " " + right;
    }

    private static boolean prefixOf(List<String> prefix, List<String> value) {
        if (prefix.size() > value.size()) return false;
        return sameRange(prefix, 0, value, 0, prefix.size());
    }

    private static boolean suffixOf(List<String> value, List<String> suffix) {
        if (suffix.size() > value.size()) return false;
        return sameRange(value, value.size() - suffix.size(), suffix, 0, suffix.size());
    }

    private static boolean hasKaraokePens(JSONObject event) {
        JSONArray segs = event.optJSONArray("segs");
        if (segs == null) return false;
        for (int i = 0; i < segs.length(); i++) {
            JSONObject part = segs.optJSONObject(i);
            if (part != null && part.has("pPenId")) return true;
        }
        return false;
    }

    /**
     * The text up to the last segment that does not carry a dimmed pen. A karaoke line shows the
     * whole sentence from its first word, but only the unstyled prefix has actually been spoken;
     * the styled suffix is the future part of the same line and is not new speech.
     */
    private static String karaokeSpeech(JSONObject event, String text) {
        JSONArray segs = event.optJSONArray("segs");
        if (segs == null || !event.has("pPenId")) return text;
        int pen = event.optInt("pPenId", Integer.MIN_VALUE);
        int at = 0, end = 0;
        boolean spoken = false, styled = false;
        for (int i = 0; i < segs.length(); i++) {
            JSONObject part = segs.optJSONObject(i);
            if (part == null) continue;
            at += part.optString("utf8", "").length();
            int partPen =
                    part.has("pPenId")
                            ? part.optInt("pPenId", Integer.MIN_VALUE)
                            : Integer.MIN_VALUE;
            boolean dim = partPen != Integer.MIN_VALUE && partPen != pen;
            if (dim) styled = true;
            else {
                spoken = true;
                end = at;
            }
        }
        if (!styled) return text;
        if (!spoken) return "";
        return text.substring(0, Math.min(end, text.length())).trim();
    }

    /** Merges runs with no independent onset instead of inventing simultaneous word order. */
    private static void offsetSpans(
            JSONArray segs, long start, long end, int cue, List<Span> spans) {
        long offset = 0;
        StringBuilder text = new StringBuilder();
        boolean nativeStart = true;
        for (int j = 0; j < segs.length(); j++) {
            JSONObject part = segs.optJSONObject(j);
            if (part == null) continue;
            if (part.has("tOffsetMs")) {
                long value = part.optLong("tOffsetMs", -1);
                if (value < offset || value < 0 || start + value >= end)
                    throw new IllegalArgumentException("source_offset_order");
                if (value > offset) {
                    if (text.length() > 0)
                        spans.add(
                                new Span(
                                        text.toString(),
                                        start + offset,
                                        start + value,
                                        cue,
                                        nativeStart));
                    text.setLength(0);
                    offset = value;
                    nativeStart = true;
                }
            }
            text.append(part.optString("utf8", ""));
        }
        if (text.length() > 0)
            spans.add(new Span(text.toString(), start + offset, end, cue, nativeStart));
    }

    /**
     * Only explicit, overlapping display windows may carry earlier text. Repetition alone is not
     * evidence.
     */
    private static final class CoarseFrame {
        final List<String> tokens;
        final long end;
        final boolean rolling;
        /** The span this window last emitted, so a display hold can extend it instead of repeat it. */
        final int span;

        CoarseFrame(List<String> tokens, long end, boolean rolling, int span) {
            this.tokens = tokens;
            this.end = end;
            this.rolling = rolling;
            this.span = span;
        }
    }

    private static CoarseFrame appendFrame(
            List<Span> out,
            String text,
            long start,
            long end,
            int cue,
            boolean append,
            CoarseFrame previous) {
        List<String> now = tokens(text);
        if (now.isEmpty()) return previous;
        int carry = 0;
        boolean rolling = false;
        long windowEnd = end;
        boolean continuous = previous != null && !append && start < previous.end;
        if (continuous) {
            boolean grows =
                    now.size() > previous.tokens.size()
                            && sameRange(previous.tokens, 0, now, 0, previous.tokens.size());
            boolean same =
                    now.size() == previous.tokens.size()
                            && sameRange(previous.tokens, 0, now, 0, now.size());
            if (grows) {
                carry = previous.tokens.size();
                rolling = true;
                windowEnd = Math.max(previous.end, end);
            } else if (same && previous.rolling) {
                // The line was shown again with the same words: a highlight step or the final hold.
                // The words are not spoken twice; only this line's display window grows.
                extendLast(out, previous, end);
                return new CoarseFrame(now, Math.max(previous.end, end), true, previous.span);
            } else if (previous.rolling) {
                for (int n = Math.min(previous.tokens.size(), now.size()); n > 0; n--)
                    if (sameRange(previous.tokens, previous.tokens.size() - n, now, 0, n)) {
                        carry = n;
                        rolling = true;
                        windowEnd = Math.max(previous.end, end);
                        break;
                    }
            }
        }
        int span = previous == null ? -1 : previous.span;
        if (carry < now.size()) {
            StringBuilder fresh = new StringBuilder();
            for (int n = carry; n < now.size(); n++) {
                String value = now.get(n);
                if (fresh.length() > 0
                        && !value.isEmpty()
                        && !cjk(fresh.codePointBefore(fresh.length()))
                        && !cjk(value.codePointAt(0))) fresh.append(' ');
                fresh.append(value);
            }
            span = out.size();
            out.add(new Span(fresh.toString(), start, end, cue, false));
        }
        return new CoarseFrame(now, windowEnd, rolling, span);
    }

    /** Extends the last span this window emitted; a hold never creates a second copy of it. */
    private static void extendLast(List<Span> out, CoarseFrame previous, long end) {
        if (previous.span < 0 || previous.span >= out.size()) return;
        Span last = out.get(previous.span);
        if (end > last.end) out.set(previous.span, last.withEnd(end));
    }

    private static boolean sameRange(List<String> a, int x, List<String> b, int y, int count) {
        for (int k = 0; k < count; k++)
            if (!key(a.get(x + k)).equals(key(b.get(y + k)))) return false;
        return count > 0;
    }

    /** Spreads the tokens uniformly over the span: explicitly estimated, never length-weighted. */
    private static void addTokens(
            List<Word> out,
            List<String> ts,
            String text,
            long start,
            long end,
            int cue,
            boolean nativeOffset,
            boolean claimFirst) {
        if (ts.isEmpty() || end <= start) return;
        if (end - start < ts.size()) {
            if (claimFirst)
                out.add(new Word(text.trim(), start, end, cue, Precision.NATIVE));
            else out.add(new Word(text.trim(), start, end, cue, Precision.ESTIMATED));
            return;
        }
        for (int i = 0; i < ts.size(); i++) {
            long a = start + (end - start) * i / ts.size();
            long b = start + (end - start) * (i + 1) / ts.size();
            if (b > a)
                out.add(
                        new Word(
                                ts.get(i),
                                a,
                                b,
                                cue,
                                nativeOffset && ts.size() == 1
                                                || claimFirst && i == 0
                                        ? Precision.NATIVE
                                        : Precision.ESTIMATED));
        }
    }

    // ---- Aligning to a reference track ----

    /**
     * Local evidence alignment, not a global shift. Ambiguous words are deliberately left alone.
     */
    RebuildSource align(RebuildSource reference) {
        return align(reference, null);
    }

    RebuildSource align(RebuildSource reference, Consumer<String> report) {
        RebuildSource direct = alignNativeOnly(reference, report);
        return direct != this ? direct : direct.alignPartial(reference, report);
    }

    private RebuildSource alignNativeOnly(RebuildSource reference, Consumer<String> report) {
        if (reference == null) {
            report(report, "reason=missing_reference;adopted_segments=0");
            return this;
        }
        Map<String, Integer> left = ngrams(words), right = ngrams(reference.words);
        Map<Integer, Integer> matches = new TreeMap<>();
        Set<Integer> triples = new HashSet<>();
        int last = -1;
        for (int i = 0; i + 2 < words.size(); i++) {
            String key = gram(words, i);
            Integer a = left.get(key), j = right.get(key);
            if (a == null || a != i || j == null || j < 0 || j <= last) continue;
            boolean valid = true;
            for (int n = 0; n < 3; n++)
                if (Math.abs(words.get(i + n).start - reference.words.get(j + n).start) > 10000)
                    valid = false;
            if (valid) {
                for (int n = 0; n < 3; n++) matches.put(i + n, j + n);
                triples.add(i);
                last = j + 2;
                i += 2;
            }
        }
        if (matches.size() < 6) {
            report(
                    report,
                    "reason=insufficient_unique_anchors;matched_words="
                            + matches.size()
                            + ";adopted_segments=0");
            return this;
        }
        List<Word> proposed = new ArrayList<>(words);
        int adopted = 0, skipped = 0, aligned = 0;
        StringBuilder evidence = new StringBuilder();
        List<Integer> eligible = new ArrayList<>();
        for (Map.Entry<Integer, Integer> e : matches.entrySet()) {
            Word a = words.get(e.getKey()), b = reference.words.get(e.getValue());
            if (a.precision == Precision.ESTIMATED
                    && b.precision == Precision.NATIVE
                    && b.start < b.end) eligible.add(e.getKey());
        }
        for (int at = 0; at < eligible.size(); ) {
            int from = eligible.get(at), to = from, referenceFrom = matches.get(from);
            at++;
            while (at < eligible.size()) {
                int next = eligible.get(at);
                if (next != to + 1
                        || matches.get(next) != matches.get(to) + 1
                        || RebuildPlanner.hardBreakBefore(this, next)
                        || RebuildPlanner.hardBreakBefore(reference, matches.get(next))) break;
                to = next;
                at++;
            }
            String reason = segmentConflict(reference, matches, triples, proposed, from, to);
            if (reason.isEmpty()) {
                for (int i = from; i <= to; i++) {
                    Word a = words.get(i), b = reference.words.get(matches.get(i));
                    proposed.set(i, new Word(a.text, b.start, b.end, a.cue, Precision.ALIGNED));
                    aligned++;
                }
                adopted++;
                reason = "adopted";
            } else skipped++;
            if (adopted + skipped <= 16) {
                if (evidence.length() > 0) evidence.append(',');
                evidence.append(from)
                        .append('-')
                        .append(to)
                        .append('@')
                        .append(referenceFrom)
                        .append(':')
                        .append(reason);
            }
        }
        int hardBreakRestored = restoreHardBreaks(proposed);
        int effective = 0;
        for (int i = 0; i < proposed.size(); i++) if (proposed.get(i) != words.get(i)) effective++;
        report(
                report,
                "matched_words="
                        + matches.size()
                        + ";native_candidates="
                        + eligible.size()
                        + ";adopted_segments="
                        + adopted
                        + ";skipped_segments="
                        + skipped
                        + ";aligned_words="
                        + aligned
                        + ";hard_break_restored="
                        + hardBreakRestored
                        + ";segments_bounded="
                        + evidence
                        + ";segments_omitted="
                        + Math.max(0, adopted + skipped - 16));
        return effective == 0 ? this : retimed(proposed);
    }

    /** Why the run {@code from..to} must not take the reference's times; empty when it may. */
    private String segmentConflict(
            RebuildSource reference,
            Map<Integer, Integer> matches,
            Set<Integer> triples,
            List<Word> proposed,
            int from,
            int to) {
        boolean complete = false;
        for (int anchor : triples)
            if (anchor >= from && anchor + 2 <= to) {
                complete = true;
                break;
            }
        if (!complete) return "incomplete_native_anchor";
        long prior = from == 0 ? -1 : proposed.get(from - 1).end;
        for (int i = from; i <= to; i++) {
            Word b = reference.words.get(matches.get(i));
            if (b.start < 0 || b.start >= b.end || b.start < prior)
                return "segment_time_or_boundary_conflict";
            prior = b.end;
        }
        if (to + 1 < words.size() && prior > proposed.get(to + 1).start)
            return "segment_time_or_boundary_conflict";
        for (int cut = Math.max(1, from); cut <= Math.min(words.size() - 1, to + 1); cut++) {
            Word oldLeft = words.get(cut - 1), oldRight = words.get(cut);
            Word newLeft =
                    cut - 1 >= from && cut - 1 <= to
                            ? reference.words.get(matches.get(cut - 1))
                            : proposed.get(cut - 1);
            Word newRight =
                    cut >= from && cut <= to
                            ? reference.words.get(matches.get(cut))
                            : proposed.get(cut);
            if (!oldRight.text.startsWith(">>")
                    && (oldRight.start - oldLeft.end >= HARD_GAP_MS)
                            != (newRight.start - newLeft.end >= HARD_GAP_MS))
                return "hard_source_gap_changed";
        }
        return "";
    }

    /**
     * Puts back the original words around a boundary whose hard-gap status the retiming changed.
     */
    private int restoreHardBreaks(List<Word> proposed) {
        int restored = 0;
        boolean changed = true;
        for (int pass = 0; changed && pass < 3; pass++) {
            changed = false;
            for (int i = 1; i < proposed.size(); i++) {
                boolean before = words.get(i).start - words.get(i - 1).end >= HARD_GAP_MS;
                boolean after = proposed.get(i).start - proposed.get(i - 1).end >= HARD_GAP_MS;
                if (before == after) continue;
                if (proposed.get(i) != words.get(i)) {
                    proposed.set(i, words.get(i));
                    changed = true;
                }
                if (proposed.get(i - 1) != words.get(i - 1)) {
                    proposed.set(i - 1, words.get(i - 1));
                    changed = true;
                }
                restored++;
            }
        }
        return restored;
    }

    /**
     * Consumes segment/cue boundaries even when the reference has no word-level offsets. This is a
     * local, bounded affine remap: source shape between two observed boundaries is preserved,
     * native words and hard gaps are immutable constraints, and a tail without a right boundary is
     * never extrapolated.
     */
    private RebuildSource alignPartial(RebuildSource reference, Consumer<String> report) {
        if (reference == null || reference.anchors.isEmpty()) return this;
        Map<Integer, Integer> refToPrimary = uniqueWordMatches(words, reference.words);
        if (refToPrimary.size() < 6) {
            report(
                    report,
                    "partial_reason=insufficient_unique_context;matched_words="
                            + refToPrimary.size()
                            + ";anchors_adopted=0;actual_retimed=0");
            return this;
        }
        List<TimeAnchor> pairs = new ArrayList<>();
        for (TimeAnchor anchor : reference.anchors) {
            int primary =
                    mapBoundary(
                            anchor.boundary, refToPrimary, reference.words.size(), words.size());
            if (primary < 0 || primary > words.size()) continue;
            if (anchor.kind == AnchorKind.CUE_END_BOUND && anchor.boundary == 0) continue;
            pairs.add(new TimeAnchor(primary, anchor.timeMs, anchor.kind));
        }
        int mapped = pairs.size();
        pairs.sort(Comparator.comparingInt(p -> p.boundary));
        // One anchor per boundary: the most specific kind wins.
        List<TimeAnchor> unique = new ArrayList<>();
        for (TimeAnchor pair : pairs) {
            TimeAnchor prior = unique.isEmpty() ? null : unique.get(unique.size() - 1);
            if (prior == null || prior.boundary != pair.boundary) unique.add(pair);
            else if (anchorRank(pair.kind) > anchorRank(prior.kind))
                unique.set(unique.size() - 1, pair);
        }
        if (unique.size() < 2) {
            report(
                    report,
                    "partial_reason=unmapped_boundaries;matched_words="
                            + refToPrimary.size()
                            + ";anchors_seen="
                            + reference.anchors.size()
                            + ";anchors_mapped="
                            + mapped
                            + ";anchors_adopted=0;actual_retimed=0");
            return this;
        }
        List<Word> proposed = new ArrayList<>(words);
        int adopted = 0, retimed = 0, skipped = 0;
        StringBuilder components = new StringBuilder();
        for (int n = 0; n + 1 < unique.size(); n++) {
            TimeAnchor left = unique.get(n), right = unique.get(n + 1);
            if (right.boundary <= left.boundary || right.timeMs <= left.timeMs) continue;
            long oldLeft = boundaryTime(words, left.boundary);
            long oldRight = boundaryTime(words, right.boundary);
            if (oldRight <= oldLeft) continue;
            String reason = "";
            for (int i = left.boundary; i < right.boundary; i++) {
                if (i >= words.size()) {
                    reason = "boundary_out_of_range";
                    break;
                }
                if (RebuildPlanner.hardBreakBefore(this, i)) {
                    reason = "hard_source_gap";
                    break;
                }
            }
            List<Word> candidate = new ArrayList<>(proposed);
            int local = 0;
            if (reason.isEmpty())
                for (int i = left.boundary; i < right.boundary; i++) {
                    Word old = words.get(i);
                    if (old.precision != Precision.ESTIMATED) continue;
                    long a = mapTime(old.start, oldLeft, oldRight, left.timeMs, right.timeMs);
                    long b = mapTime(old.end, oldLeft, oldRight, left.timeMs, right.timeMs);
                    if (b <= a) {
                        reason = "non_monotone";
                        break;
                    }
                    candidate.set(i, new Word(old.text, a, b, old.cue, Precision.ESTIMATED));
                    local++;
                }
            if (reason.isEmpty()) {
                if (left.boundary > 0
                        && candidate.get(left.boundary - 1).end
                                > candidate.get(left.boundary).start) reason = "left_constraint";
                else if (right.boundary < words.size()
                        && candidate.get(right.boundary - 1).end
                                > candidate.get(right.boundary).start) reason = "right_constraint";
            }
            if (reason.isEmpty() && local > 0) {
                for (int i = left.boundary; i < right.boundary; i++)
                    if (candidate.get(i).precision == Precision.ESTIMATED
                            && (candidate.get(i).start != words.get(i).start
                                    || candidate.get(i).end != words.get(i).end)) retimed++;
                proposed = candidate;
                adopted++;
                if (components.length() > 0) components.append(',');
                components
                        .append(left.boundary)
                        .append('-')
                        .append(right.boundary)
                        .append('@')
                        .append(left.timeMs)
                        .append('-')
                        .append(right.timeMs)
                        .append(":adopted");
            } else if (!reason.isEmpty()) {
                skipped++;
                if (components.length() < 900) {
                    if (components.length() > 0) components.append(',');
                    components
                            .append(left.boundary)
                            .append('-')
                            .append(right.boundary)
                            .append(':')
                            .append(reason);
                }
            }
        }
        report(
                report,
                "partial_matched_words="
                        + refToPrimary.size()
                        + ";anchors_seen="
                        + reference.anchors.size()
                        + ";anchors_mapped="
                        + mapped
                        + ";anchors_adopted="
                        + adopted * 2
                        + ";partial_components="
                        + adopted
                        + ";partial_skipped="
                        + skipped
                        + ";actual_retimed="
                        + retimed
                        + ";partial_components_detail="
                        + components);
        return retimed == 0 ? this : retimed(proposed);
    }

    private static void report(Consumer<String> report, String detail) {
        if (report != null) report.accept(detail);
    }

    private static int anchorRank(AnchorKind kind) {
        switch (kind) {
            case WORD_ONSET:
                return 4;
            case SEGMENT_ONSET:
                return 3;
            case CUE_ONSET:
                return 2;
            default:
                return 1;
        }
    }

    private static int mapBoundary(
            int boundary, Map<Integer, Integer> matches, int refSize, int primarySize) {
        if (boundary <= 0) return 0;
        if (boundary >= refSize) return primarySize;
        Integer exact = matches.get(boundary);
        if (exact != null) return exact;
        Integer prior = matches.get(boundary - 1);
        return prior == null ? -1 : prior + 1;
    }

    private static long boundaryTime(List<Word> values, int boundary) {
        if (values.isEmpty()) return 0;
        if (boundary <= 0) return values.get(0).start;
        if (boundary >= values.size()) return values.get(values.size() - 1).end;
        return values.get(boundary).start;
    }

    private static long mapTime(long value, long oldA, long oldB, long newA, long newB) {
        return newA
                + Math.round((double) ((value - oldA) * (newB - newA)) / (double) (oldB - oldA));
    }

    /** Reference word index to primary word index for every word of a unique three-word run. */
    private static Map<Integer, Integer> uniqueWordMatches(
            List<Word> primary, List<Word> reference) {
        Map<String, Integer> left = ngrams(primary), right = ngrams(reference);
        Map<Integer, Integer> out = new TreeMap<>();
        int last = -1;
        for (int i = 0; i + 2 < primary.size(); i++) {
            String gram = gram(primary, i);
            Integer a = left.get(gram), j = right.get(gram);
            if (a == null || a != i || j == null || j < 0 || j <= last) continue;
            for (int n = 0; n < 3; n++) out.put(j + n, i + n);
            last = j + 2;
            i += 2;
        }
        return out;
    }

    private static String gram(List<Word> w, int i) {
        return key(w.get(i).text) + "|" + key(w.get(i + 1).text) + "|" + key(w.get(i + 2).text);
    }

    /** Index of each three-word run's first word, or -1 when the run occurs more than once. */
    private static Map<String, Integer> ngrams(List<Word> w) {
        Map<String, Integer> m = new HashMap<>();
        for (int i = 0; i + 2 < w.size(); i++) {
            String k = gram(w, i);
            m.put(k, m.containsKey(k) ? -1 : i);
        }
        return m;
    }
}
