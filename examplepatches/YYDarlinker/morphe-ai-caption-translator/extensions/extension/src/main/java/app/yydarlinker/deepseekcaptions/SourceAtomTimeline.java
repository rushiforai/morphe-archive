package app.yydarlinker.deepseekcaptions;

import org.json.JSONArray;
import org.json.JSONObject;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

/**
 * Builds a fine-grained source timeline for semantic subtitle planning.
 *
 * <p>YouTube cue/event boundaries are transport timing, not language boundaries. JSON3 segment
 * offsets are preserved when present. When the source does not expose word/segment timing, a cue is
 * split into lexical atoms and timing is conservatively interpolated inside that cue. Interpolated
 * boundaries are marked as estimated so diagnostics can distinguish them from native offsets.</p>
 *
 * <p>Some broadcast/news tracks use YouTube roll-up captions: neighboring cues repeat most of the
 * previous line and append only a few new words. Strong roll-up tracks are de-rolled into
 * first-appearance lexical atoms. Crucially, new text keeps the interval beginning at the update in
 * which it first appears and ending at the next update that contributes genuinely new text. This
 * removes display-only duplicates without back-projecting an entire future sentence into the
 * previous update interval, which compresses the timeline and makes realtime translation chase the
 * play head forever.</p>
 */
final class SourceAtomTimeline {
    private static final int MAX_CJK_TOKEN_CHARS = 4;
    private static final java.util.regex.Pattern LATIN_WEIGHT = java.util.regex.Pattern.compile("[A-Za-z0-9'’.,!?;:-]+");
    private static final long ROLLING_BRIDGE_MAX_MS = 100L;
    private static final long ROLLING_CHUNK_MAX_MS = 4_500L;

    private SourceAtomTimeline() {}

    static int countAppendEvents(byte[] sourceBody) {
        if (sourceBody == null || sourceBody.length == 0) return 0;
        try {
            String content = new String(sourceBody, StandardCharsets.UTF_8).trim();
            if (!content.startsWith("{") || !content.contains("\"events\"")) return 0;
            JSONArray events = new JSONObject(content).optJSONArray("events");
            if (events == null) return 0;
            int count = 0;
            for (int i = 0; i < events.length(); i++) {
                JSONObject event = events.optJSONObject(i);
                if (event != null && event.optInt("aAppend", 0) == 1) count++;
            }
            return count;
        } catch (Throwable ignored) {
            return 0;
        }
    }

    static Result build(byte[] sourceBody, CaptionDocument.Parsed document) {
        if (document == null || document.cues().isEmpty()) return Result.EMPTY;
        List<CaptionDocument.Cue> cues = document.cues();
        Result json = parseJson3(sourceBody, cues);
        // Native JSON3 word offsets outrank text repetition heuristics (speech can repeat).
        if (!json.atoms.isEmpty() && json.nativeTimedAtoms > 0) return json;
        if (looksLikeRollingCaptions(cues)) return fromRollingCues(cues);
        if (!json.atoms.isEmpty()) return json;
        return fromCues(cues);
    }

    private static Result parseJson3(byte[] body, List<CaptionDocument.Cue> parsedCues) {
        if (body == null || body.length == 0) return Result.EMPTY;
        try {
            String content = new String(body, StandardCharsets.UTF_8).trim();
            if (!content.startsWith("{") || !content.contains("\"events\"")) return Result.EMPTY;
            JSONArray events = new JSONObject(content).optJSONArray("events");
            if (events == null) return Result.EMPTY;

            List<Atom> atoms = new ArrayList<>();
            int cueIndex = 0;
            int nativeTimed = 0;
            int estimated = 0;
            for (int eventIndex = 0; eventIndex < events.length(); eventIndex++) {
                JSONObject event = events.optJSONObject(eventIndex);
                if (event == null) continue;
                JSONArray segs = event.optJSONArray("segs");
                if (segs == null || segs.length() == 0) continue;
                long eventStart = event.optLong("tStartMs", -1L);
                if (eventStart < 0L) continue;

                StringBuilder full = new StringBuilder();
                List<Segment> segments = new ArrayList<>();
                for (int j = 0; j < segs.length(); j++) {
                    JSONObject seg = segs.optJSONObject(j);
                    if (seg == null) continue;
                    String value = seg.optString("utf8", "").replace('\u00A0', ' ').replace("\r", "");
                    int from = full.length();
                    full.append(value);
                    int to = full.length();
                    if (to <= from) continue;
                    long offset = seg.has("tOffsetMs")
                            ? seg.optLong("tOffsetMs", Long.MIN_VALUE)
                            : Long.MIN_VALUE;
                    segments.add(new Segment(value, offset));
                }
                String normalized = full.toString().trim();
                if (normalized.isEmpty()) continue;
                if (cueIndex >= parsedCues.size()) break;

                CaptionDocument.Cue cue = parsedCues.get(cueIndex);
                long cueStart = cue.startMs;
                long cueEnd = effectiveCueEnd(parsedCues, cueIndex);
                long duration = Math.max(1L, cueEnd - cueStart);
                int eventTextWeight = Math.max(1, lexicalWeight(full.toString()));
                int runningWeight = 0;

                for (int j = 0; j < segments.size(); j++) {
                    Segment segment = segments.get(j);
                    String segmentText = segment.text;
                    if (segmentText.trim().isEmpty()) {
                        runningWeight += lexicalWeight(segmentText);
                        continue;
                    }
                    int segmentWeight = Math.max(1, lexicalWeight(segmentText));
                    long segmentStart;
                    long segmentEnd;
                    boolean nativeBoundary = segment.offset != Long.MIN_VALUE;
                    if(j==0 && !nativeBoundary) for(Segment other:segments) if(other.offset!=Long.MIN_VALUE){nativeBoundary=true;break;}
                    if (nativeBoundary) {
                        segmentStart = eventStart + (segment.offset==Long.MIN_VALUE ? 0L : Math.max(0L, segment.offset));
                        segmentEnd = nextNativeSegmentTime(segments, j + 1, eventStart, cueEnd);
                        if (segmentEnd <= segmentStart) segmentEnd = cueEnd;
                        segmentStart = clamp(segmentStart, cueStart, Math.max(cueStart, cueEnd - 1L));
                        segmentEnd = clamp(segmentEnd, segmentStart + 1L, Math.max(segmentStart + 1L, cueEnd));
                    } else {
                        segmentStart = cueStart + Math.round(duration * (runningWeight / (double) eventTextWeight));
                        segmentEnd = cueStart + Math.round(duration * ((runningWeight + segmentWeight) / (double) eventTextWeight));
                        segmentEnd = Math.max(segmentStart + 1L, Math.min(cueEnd, segmentEnd));
                    }

                    List<String> lexical = tokenize(segmentText);
                    if (lexical.isEmpty()) lexical = Collections.singletonList(segmentText.trim());
                    int total = 0;
                    for (String token : lexical) total += estimatedWordWeight(token);
                    int consumed = 0;
                    for (String rawToken : lexical) {
                        String token = rawToken.trim();
                        if (token.isEmpty()) continue;
                        int weight = estimatedWordWeight(token);
                        long atomStart;
                        long atomEnd;
                        boolean precise = nativeBoundary && lexical.size() == 1;
                        if (lexical.size() == 1) {
                            atomStart = segmentStart;
                            atomEnd = segmentEnd;
                        } else {
                            long span = Math.max(1L, segmentEnd - segmentStart);
                            atomStart = segmentStart + Math.round(span * (consumed / (double) total));
                            atomEnd = segmentStart + Math.round(span * ((consumed + weight) / (double) total));
                            atomEnd = Math.max(atomStart + 1L, Math.min(segmentEnd, atomEnd));
                        }
                        atoms.add(new Atom(atomStart, atomEnd, token, cueIndex, precise));
                        if (precise) nativeTimed++; else estimated++;
                        consumed += weight;
                    }
                    runningWeight += segmentWeight;
                }
                cueIndex++;
            }

            if (atoms.isEmpty()) return Result.EMPTY;
            return new Result(normalize(atoms), parsedCues.size(), nativeTimed, estimated, true, false);
        } catch (Throwable ignored) {
            return Result.EMPTY;
        }
    }

    private static Result fromCues(List<CaptionDocument.Cue> cues) {
        List<Atom> atoms = new ArrayList<>();
        int estimated = 0;
        for (int cueIndex = 0; cueIndex < cues.size(); cueIndex++) {
            CaptionDocument.Cue cue = cues.get(cueIndex);
            List<String> tokens = tokenize(cue.text == null ? "" : cue.text);
            if (tokens.isEmpty()) continue;
            long cueEnd = effectiveCueEnd(cues, cueIndex);
            long duration = Math.max(1L, cueEnd - cue.startMs);
            int total = 0;
            for (String token : tokens) total += estimatedWordWeight(token);
            int consumed = 0;
            for (String token : tokens) {
                int weight = estimatedWordWeight(token);
                long start = cue.startMs + Math.round(duration * (consumed / (double) total));
                long end = cue.startMs + Math.round(duration * ((consumed + weight) / (double) total));
                end = Math.max(start + 1L, Math.min(cueEnd, end));
                atoms.add(new Atom(start, end, token, cueIndex, false));
                estimated++;
                consumed += weight;
            }
        }
        if (atoms.isEmpty()) return Result.EMPTY;
        return new Result(normalize(atoms), cues.size(), 0, estimated, false, false);
    }

    /**
     * De-rolls display-only repetition while preserving the actual first-appearance interval.
     *
     * <p>A downloaded YouTube roll-up track frequently looks like A, A+B, B, B+C. The B-only rows
     * are display bridges, not new speech. We therefore keep only the novel suffix contributed by a
     * cue. A novel chunk starts exactly when that cue first appears. Its end is the start of the next
     * cue that contributes genuinely new text (not the next duplicate bridge), capped to avoid
     * stretching a subtitle through a long silence. This keeps the timeline at real playback scale
     * and gives the semantic prefetcher enough actual seconds of inventory.</p>
     */
    private static Result fromRollingCues(List<CaptionDocument.Cue> cues) {
        List<NovelChunk> chunks = new ArrayList<>();
        List<String> previous = Collections.emptyList();

        for (int cueIndex = 0; cueIndex < cues.size(); cueIndex++) {
            CaptionDocument.Cue cue = cues.get(cueIndex);
            List<String> current = tokenize(cue.text == null ? "" : cue.text);
            if (current.isEmpty()) {
                previous = Collections.emptyList();
                continue;
            }

            int novelFrom = 0;
            if (!previous.isEmpty()) {
                if (containsTokenSequence(previous, current)) {
                    novelFrom = current.size();
                } else {
                    novelFrom = suffixPrefixOverlap(previous, current);
                }
            }

            if (novelFrom < current.size()) {
                chunks.add(new NovelChunk(
                        cueIndex,
                        cue.startMs,
                        effectiveCueEnd(cues, cueIndex),
                        new ArrayList<>(current.subList(novelFrom, current.size()))
                ));
            }
            previous = current;
        }

        if (chunks.size() < 2) return fromCues(cues);

        List<Atom> atoms = new ArrayList<>();
        int estimated = 0;
        for (int i = 0; i < chunks.size(); i++) {
            NovelChunk chunk = chunks.get(i);
            long speechStart = chunk.cueStartMs;
            long nextNovelStart = i + 1 < chunks.size()
                    ? chunks.get(i + 1).cueStartMs
                    : Math.max(chunk.cueStartMs + 1L, chunk.cueEndMs);
            long speechEnd = Math.max(speechStart + 1L, nextNovelStart);
            speechEnd = Math.min(speechEnd, speechStart + ROLLING_CHUNK_MAX_MS);
            if (speechEnd <= speechStart) speechEnd = speechStart + 1L;

            long duration = speechEnd - speechStart;
            int total = 0;
            for (String token : chunk.tokens) total += estimatedWordWeight(token);
            int consumed = 0;
            for (String token : chunk.tokens) {
                int weight = estimatedWordWeight(token);
                long start = speechStart + Math.round(duration * (consumed / (double) total));
                long end = speechStart + Math.round(duration * ((consumed + weight) / (double) total));
                end = Math.max(start + 1L, Math.min(speechEnd, end));
                atoms.add(new Atom(start, end, token, chunk.cueIndex, false));
                estimated++;
                consumed += weight;
            }
        }

        if (atoms.isEmpty()) return fromCues(cues);
        return new Result(normalize(atoms), cues.size(), 0, estimated, false, true);
    }

    /**
     * Detect roll-up by repeated adjacent text itself. Tiny bridge cues are useful corroboration but
     * are not mandatory: some YouTube parsers collapse those bridges, which made the dev17 detector
     * miss genuine NBC-style tracks.
     */
    private static boolean looksLikeRollingCaptions(List<CaptionDocument.Cue> cues) {
        if (cues == null || cues.size() < 12) return false;
        int bridges = 0;
        int strongPairs = 0;
        int containedPairs = 0;
        int usablePairs = 0;
        List<String> previous = Collections.emptyList();

        for (CaptionDocument.Cue cue : cues) {
            if (cue == null) continue;
            long duration = Math.max(1L, cue.endMs - cue.startMs);
            if (duration <= ROLLING_BRIDGE_MAX_MS) bridges++;

            List<String> current = tokenize(cue.text == null ? "" : cue.text);
            if (!previous.isEmpty() && !current.isEmpty()) {
                usablePairs++;
                int overlap = suffixPrefixOverlap(previous, current);
                boolean currentInsidePrevious = containsTokenSequence(previous, current);
                boolean previousInsideCurrent = containsTokenSequence(current, previous);
                boolean contained = currentInsidePrevious || previousInsideCurrent;
                if (contained) containedPairs++;

                int smaller = Math.min(previous.size(), current.size());
                int novel = Math.max(0, current.size() - overlap);
                boolean strongOverlap = overlap >= 2 &&
                        (overlap * 2 >= smaller || novel <= 4);
                if (contained || strongOverlap) strongPairs++;
            }
            if (!current.isEmpty()) previous = current;
        }

        if (usablePairs < 8) return false;
        int minStrong = Math.max(8, usablePairs / 12);
        int minContained = Math.max(5, usablePairs / 30);
        boolean repeatedTextSignature = strongPairs >= minStrong && strongPairs * 8 >= usablePairs;
        boolean containmentSignature = containedPairs >= minContained && containedPairs * 14 >= usablePairs;
        boolean bridgeSignature = bridges >= Math.max(6, cues.size() / 20) &&
                strongPairs >= Math.max(6, usablePairs / 20);
        return repeatedTextSignature || containmentSignature || bridgeSignature;
    }

    private static int suffixPrefixOverlap(List<String> previous, List<String> current) {
        int max = Math.min(previous.size(), current.size());
        for (int size = max; size >= 1; size--) {
            boolean same = true;
            int previousStart = previous.size() - size;
            for (int i = 0; i < size; i++) {
                if (!sameToken(previous.get(previousStart + i), current.get(i))) {
                    same = false;
                    break;
                }
            }
            if (same) return size;
        }
        return 0;
    }

    private static boolean containsTokenSequence(List<String> haystack, List<String> needle) {
        if (needle.isEmpty() || haystack.size() < needle.size()) return false;
        for (int from = 0; from + needle.size() <= haystack.size(); from++) {
            boolean same = true;
            for (int i = 0; i < needle.size(); i++) {
                if (!sameToken(haystack.get(from + i), needle.get(i))) {
                    same = false;
                    break;
                }
            }
            if (same) return true;
        }
        return false;
    }

    private static boolean sameToken(String left, String right) {
        return canonicalToken(left).equals(canonicalToken(right));
    }

    private static String canonicalToken(String value) {
        if (value == null) return "";
        String lower = value.trim().toLowerCase(Locale.ROOT);
        if (lower.isEmpty()) return "";
        StringBuilder lexical = new StringBuilder(lower.length());
        for (int i = 0; i < lower.length(); i++) {
            char c = lower.charAt(i);
            if (Character.isLetterOrDigit(c) || isCjk(c)) lexical.append(c);
        }
        return lexical.length() > 0 ? lexical.toString() : lower;
    }

    private static long effectiveCueEnd(List<CaptionDocument.Cue> cues, int index) {
        CaptionDocument.Cue cue = cues.get(index);
        long end = Math.max(cue.startMs + 1L, cue.endMs);
        if (index + 1 < cues.size()) {
            long nextStart = cues.get(index + 1).startMs;
            if (nextStart > cue.startMs && end > nextStart) end = nextStart;
        }
        return Math.max(cue.startMs + 1L, end);
    }

    private static long nextNativeSegmentTime(
            List<Segment> segments,
            int from,
            long eventStart,
            long fallbackEnd
    ) {
        for (int i = from; i < segments.size(); i++) {
            long offset = segments.get(i).offset;
            if (offset != Long.MIN_VALUE) return eventStart + Math.max(0L, offset);
        }
        return fallbackEnd;
    }

    private static List<Atom> normalize(List<Atom> input) {
        if(input.isEmpty()) return Collections.emptyList();
        List<Atom> out=new ArrayList<>();
        for(Atom atom:input) {
            if(out.isEmpty()) {out.add(atom);continue;}
            Atom previous=out.get(out.size()-1);
            if(atom.startMs<=previous.startMs) {
                // Co-timed text has no defensible internal boundary. Keep it as one anchored span
                // rather than creating overlapping 1ms tokens later rejected as invalid output.
                String text=previous.text+(needsSpace(previous.text,atom.text) ? " " : "")+atom.text;
                out.set(out.size()-1,new Atom(previous.startMs,Math.max(previous.endMs,atom.endMs),
                    text,previous.cueIndex,previous.precise && atom.precise));
            } else {
                if(previous.endMs>atom.startMs) out.set(out.size()-1,new Atom(previous.startMs,
                    atom.startMs,previous.text,previous.cueIndex,previous.precise));
                out.add(atom);
            }
        }
        return Collections.unmodifiableList(out);
    }

    private static List<String> tokenize(String value) {
        if (value == null) return Collections.emptyList();
        String text = value.replace('\u00A0', ' ').replace("\r", "").trim();
        if (text.isEmpty()) return Collections.emptyList();
        List<String> out = new ArrayList<>();
        StringBuilder current = new StringBuilder();
        int cjkRun = 0;
        for (int i = 0; i < text.length(); i++) {
            char c = text.charAt(i);
            if (Character.isWhitespace(c)) {
                flush(out, current);
                cjkRun = 0;
                continue;
            }
            if ((c == '\'' || c == '’') && i > 0 && i + 1 < text.length() &&
                    Character.isLetterOrDigit(text.charAt(i - 1)) &&
                    Character.isLetterOrDigit(text.charAt(i + 1))) {
                current.append(c);
                continue;
            }
            if(c=='.' && i>0 && i+1<text.length() && Character.isDigit(text.charAt(i-1)) && Character.isDigit(text.charAt(i+1))) {
                current.append(c);continue;
            }
            if(c=='.' && i+1<text.length() && text.charAt(i+1)=='.'){
                current.append(c);while(i+1<text.length()&&text.charAt(i+1)=='.')current.append(text.charAt(++i));
                flush(out,current);cjkRun=0;continue; // Hesitation, not three sentence boundaries.
            }
            if (isPunctuation(c)) {
                current.append(c);
                flush(out, current);
                cjkRun = 0;
                continue;
            }
            if (isCjk(c)) {
                if (current.length() > 0 && cjkRun == 0) flush(out, current);
                current.append(c);
                cjkRun++;
                if (cjkRun >= MAX_CJK_TOKEN_CHARS) {
                    flush(out, current);
                    cjkRun = 0;
                }
                continue;
            }
            if (cjkRun > 0) {
                flush(out, current);
                cjkRun = 0;
            }
            current.append(c);
        }
        flush(out, current);
        return out;
    }

    private static void flush(List<String> out, StringBuilder current) {
        if (current.length() == 0) return;
        String token = current.toString().trim();
        if (!token.isEmpty()) out.add(token);
        current.setLength(0);
    }

    private static boolean isPunctuation(char c) {
        int type = Character.getType(c);
        return type == Character.CONNECTOR_PUNCTUATION ||
                type == Character.DASH_PUNCTUATION ||
                type == Character.START_PUNCTUATION ||
                type == Character.END_PUNCTUATION ||
                type == Character.INITIAL_QUOTE_PUNCTUATION ||
                type == Character.FINAL_QUOTE_PUNCTUATION ||
                type == Character.OTHER_PUNCTUATION;
    }

    private static boolean isCjk(char c) {
        Character.UnicodeScript script = Character.UnicodeScript.of(c);
        return script == Character.UnicodeScript.HAN ||
                script == Character.UnicodeScript.HIRAGANA ||
                script == Character.UnicodeScript.KATAKANA ||
                script == Character.UnicodeScript.HANGUL;
    }

    // Fallback only: limit the influence of long English spellings/model names within a known cue.
    // This is an estimate, not measured speech. Native boundaries and cue duration never change.
    static int estimatedWordWeight(String token) {
        if(token!=null && LATIN_WEIGHT.matcher(token).matches()) {
            int length=SourcePhraseAlignment.timingLexical(token).length();
            return Math.max(1,Math.min(5,(length+3)/4));
        }
        return Math.max(1,lexicalWeight(token));
    }
    private static int lexicalWeight(String value) {
        if (value == null || value.isEmpty()) return 0;
        int weight = 0;
        for (int i = 0; i < value.length(); i++) {
            char c = value.charAt(i);
            if (Character.isLetterOrDigit(c) || isCjk(c)) weight += 2;
            else if (!Character.isWhitespace(c)) weight += 1;
        }
        return Math.max(1, weight);
    }

    private static long clamp(long value, long min, long max) {
        return Math.max(min, Math.min(max, value));
    }

    static List<CaptionDocument.Cue> asCues(List<Atom> atoms) {
        if (atoms == null || atoms.isEmpty()) return Collections.emptyList();
        List<CaptionDocument.Cue> out = new ArrayList<>(atoms.size());
        for (Atom atom : atoms) out.add(new CaptionDocument.Cue(atom.startMs, atom.endMs, atom.text));
        return Collections.unmodifiableList(out);
    }

    static String join(List<Atom> atoms, int from, int toInclusive) {
        if (atoms == null || atoms.isEmpty() || from < 0 || toInclusive < from) return "";
        int end = Math.min(atoms.size() - 1, toInclusive);
        StringBuilder out = new StringBuilder();
        String previous = "";
        for (int i = from; i <= end; i++) {
            String token = atoms.get(i).text == null ? "" : atoms.get(i).text.trim();
            if (token.isEmpty()) continue;
            if (out.length() > 0 && needsSpace(previous, token)) out.append(' ');
            out.append(token);
            previous = token;
        }
        return out.toString().trim();
    }

    private static boolean needsSpace(String left, String right) {
        if (left.isEmpty() || right.isEmpty()) return false;
        char l = left.charAt(left.length() - 1);
        char r = right.charAt(0);
        if (isCjk(l) || isCjk(r)) return false;
        if (isPunctuation(r) && !isOpening(r)) return false;
        if (isOpening(l)) return false;
        if (isPunctuation(l) && !isOpening(l) && Character.isLetterOrDigit(r)) return true;
        return (Character.isLetterOrDigit(l) && Character.isLetterOrDigit(r)) ||
                (l == '\'' && Character.isLetterOrDigit(r)) ||
                (Character.isLetterOrDigit(l) && r == '\'');
    }

    private static boolean isOpening(char c) {
        return c == '(' || c == '[' || c == '{' || c == '“' || c == '‘' || c == '«' || c == '‹';
    }

    static final class Atom {
        final long startMs;
        final long endMs;
        final String text;
        final int cueIndex;
        final boolean precise;

        Atom(long startMs, long endMs, String text, int cueIndex, boolean precise) {
            this.startMs = Math.max(0L, startMs);
            this.endMs = Math.max(this.startMs + 1L, endMs);
            this.text = text == null ? "" : text;
            this.cueIndex = cueIndex;
            this.precise = precise;
        }
    }

    static final class Result {
        static final Result EMPTY = new Result(Collections.emptyList(), 0, 0, 0, false, false);
        final List<Atom> atoms;
        final int rawCueCount;
        final int nativeTimedAtoms;
        final int estimatedAtoms;
        final boolean json3;
        final boolean rollupNormalized;
        final int asrMatchedAtoms;

        Result(
                List<Atom> atoms,
                int rawCueCount,
                int nativeTimedAtoms,
                int estimatedAtoms,
                boolean json3,
                boolean rollupNormalized
        ) {
            this(atoms,rawCueCount,nativeTimedAtoms,estimatedAtoms,json3,rollupNormalized,0);
        }

        Result(List<Atom> atoms,int rawCueCount,int nativeTimedAtoms,int estimatedAtoms,boolean json3,boolean rollupNormalized,int asrMatchedAtoms) {
            this.asrMatchedAtoms=asrMatchedAtoms;
            this.atoms = atoms;
            this.rawCueCount = rawCueCount;
            this.nativeTimedAtoms = nativeTimedAtoms;
            this.estimatedAtoms = estimatedAtoms;
            this.json3 = json3;
            this.rollupNormalized = rollupNormalized;
        }

        double preciseRatio() {
            int total = nativeTimedAtoms + estimatedAtoms;
            return total <= 0 ? 0d : nativeTimedAtoms / (double) total;
        }
    }

    private static final class NovelChunk {
        final int cueIndex;
        final long cueStartMs;
        final long cueEndMs;
        final List<String> tokens;

        NovelChunk(int cueIndex, long cueStartMs, long cueEndMs, List<String> tokens) {
            this.cueIndex = cueIndex;
            this.cueStartMs = Math.max(0L, cueStartMs);
            this.cueEndMs = Math.max(this.cueStartMs + 1L, cueEndMs);
            this.tokens = tokens;
        }
    }

    private static final class Segment {
        final String text;
        final long offset;

        Segment(String text, long offset) {
            this.text = text;
            this.offset = offset;
        }
    }
}
