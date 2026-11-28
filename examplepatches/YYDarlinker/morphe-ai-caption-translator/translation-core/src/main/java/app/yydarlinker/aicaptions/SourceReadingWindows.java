package app.yydarlinker.aicaptions;

import java.util.*;

/**
 * Reading pages for captions shown as they are (the video's own track, or original-only mode).
 * Machine-made tracks cut where the recogniser ran out of room, not where the speech does: a clause
 * is split across two pages, or two half-second fragments flash one after another. Pages are
 * rebuilt from the same words and times: a sentence end or a clear pause closes a page, short
 * fragments of one sentence share a page, and a run too long for the box is cut at its best
 * boundary. No word is added, dropped or moved, and nothing is sent anywhere.
 */
final class SourceReadingWindows {
    private SourceReadingWindows() {}

    /** A page is never held longer than this; a longer run is cut at its best boundary. */
    static final long MAX_PAGE_MS = 5000;

    private static final long CLEAR_PAUSE_MS = 250, LONG_PAUSE_MS = 400;
    /** Clause marks of the scripts the app can target, not only the CJK/Latin ones. */
    private static final String CLAUSE = ",;:，、；：…،؛।॥؟۔׃።";

    /** Pages in source order, each a contiguous word range; covers every word of the source. */
    static List<RebuildSource.TimedWindow> build(
            RebuildSource source, CaptionRenderSpec spec, CaptionLanguageContext context) {
        List<RebuildSource.Word> words = source.words;
        int n = words.size();
        if (n == 0) return Collections.emptyList();
        // Sized by the script of the captions themselves (Chinese, Japanese, Korean read in far
        // fewer characters per line than spaced scripts), not by the target language.
        boolean wide = wideScript(words);
        int maxUnits = wide ? 40 : 84;
        int minUnits = wide ? 10 : 21;
        int[] prefix = new int[n + 1];
        for (int i = 0; i < n; i++) prefix[i + 1] = prefix[i] + units(words.get(i).text);
        List<RebuildSource.TimedWindow> pages = new ArrayList<>();
        int from = 0;
        while (from < n) {
            // A hard break (pause or speaker change) always ends the run; pages never span one.
            int limit = from;
            while (limit + 1 < n && !RebuildPlanner.hardBreakBefore(source, limit + 1)) limit++;
            int start = from;
            while (start <= limit) {
                int end = pageEnd(source, prefix, context, start, limit, maxUnits, minUnits);
                pages.add(window(words, start, end));
                start = end + 1;
            }
            from = limit + 1;
        }
        return Collections.unmodifiableList(mergeTail(source, spec, prefix, pages, maxUnits));
    }

    private static int pageEnd(
            RebuildSource source,
            int[] prefix,
            CaptionLanguageContext context,
            int start,
            int limit,
            int maxUnits,
            int minUnits) {
        List<RebuildSource.Word> words = source.words;
        int best = -1, bestScore = Integer.MIN_VALUE;
        for (int i = start; i <= limit; i++) {
            long duration = words.get(i).end - words.get(start).start;
            int units = prefix[i + 1] - prefix[start];
            if (i > start && (units > maxUnits || duration > MAX_PAGE_MS)) break;
            if (i == limit) return i;
            boolean sentence = RebuildSource.terminal(words.get(i).text);
            if (sentence && (units >= minUnits || duration >= 1500)) return i;
            if (units < minUnits && duration < 1500) continue;
            int score = score(source, context, i);
            if (score >= bestScore) {
                best = i;
                bestScore = score;
            }
        }
        if (best >= 0) return best;
        // Nothing reached a reasonable size before the limit: take the last word that fits.
        int end = start;
        while (end + 1 <= limit) {
            long duration = words.get(end + 1).end - words.get(start).start;
            if (prefix[end + 2] - prefix[start] > maxUnits || duration > MAX_PAGE_MS) break;
            end++;
        }
        return end;
    }

    /** How good a place to end a page the boundary after word {@code i} is. */
    private static int score(RebuildSource source, CaptionLanguageContext context, int i) {
        List<RebuildSource.Word> words = source.words;
        String text = words.get(i).text.trim();
        int score = RebuildPlanner.resourceScore(source, i, context);
        if (RebuildSource.terminal(text)) score = Math.max(score, 100);
        else if (!text.isEmpty() && CLAUSE.indexOf(text.charAt(text.length() - 1)) >= 0)
            score = Math.max(score, 30);
        long gap = words.get(i + 1).start - words.get(i).end;
        if (gap >= LONG_PAUSE_MS) score += 35;
        else if (gap >= CLEAR_PAUSE_MS) score += 20;
        // A cut inside a protected phrase or after a dependent ending is the last resort.
        if (!RebuildPlanner.safeCut(source, i, context)) score -= 100;
        return score;
    }

    /**
     * A page of a few words left over after a cut joins the page before it when that still fits.
     */
    private static List<RebuildSource.TimedWindow> mergeTail(
            RebuildSource source,
            CaptionRenderSpec spec,
            int[] prefix,
            List<RebuildSource.TimedWindow> pages,
            int maxUnits) {
        List<RebuildSource.TimedWindow> out = new ArrayList<>(pages.size());
        int small = Math.max(2, spec.profile.referenceCpl / 4);
        for (RebuildSource.TimedWindow page : pages) {
            if (!out.isEmpty()) {
                RebuildSource.TimedWindow prior = out.get(out.size() - 1);
                boolean contiguous =
                        prior.to + 1 == page.from
                                && !RebuildPlanner.hardBreakBefore(source, page.from);
                if (contiguous
                        && prefix[page.to + 1] - prefix[page.from] <= small
                        && !RebuildSource.terminal(source.words.get(prior.to).text)
                        && prefix[page.to + 1] - prefix[prior.from] <= maxUnits * 5 / 4
                        && page.end - prior.start <= MAX_PAGE_MS * 3 / 2) {
                    out.set(out.size() - 1, window(source.words, prior.from, page.to));
                    continue;
                }
            }
            out.add(page);
        }
        return out;
    }

    private static boolean wideScript(List<RebuildSource.Word> words) {
        int wide = 0, all = 0;
        for (int i = 0; i < words.size() && all < 400; i++) {
            String text = words.get(i).text;
            for (int k = 0; k < text.length(); ) {
                int cp = text.codePointAt(k);
                k += Character.charCount(cp);
                if (!Character.isLetter(cp)) continue;
                all++;
                Character.UnicodeScript script = Character.UnicodeScript.of(cp);
                if (script == Character.UnicodeScript.HAN
                        || script == Character.UnicodeScript.HIRAGANA
                        || script == Character.UnicodeScript.KATAKANA
                        || script == Character.UnicodeScript.HANGUL
                        || script == Character.UnicodeScript.THAI
                        || script == Character.UnicodeScript.LAO
                        || script == Character.UnicodeScript.KHMER
                        || script == Character.UnicodeScript.MYANMAR) wide++;
            }
        }
        return all > 0 && wide * 2 > all;
    }

    /** Visible characters of a word: what the reader counts, without a text-break library. */
    static int units(String text) {
        int count = 0;
        for (int i = 0; i < text.length(); ) {
            int cp = text.codePointAt(i);
            i += Character.charCount(cp);
            int type = Character.getType(cp);
            if (Character.isWhitespace(cp)
                    || type == Character.FORMAT
                    || type == Character.NON_SPACING_MARK
                    || type == Character.ENCLOSING_MARK
                    || type == Character.CONTROL) continue;
            count++;
        }
        return count;
    }

    private static RebuildSource.TimedWindow window(
            List<RebuildSource.Word> words, int from, int to) {
        long end = words.get(from).end;
        for (int i = from; i <= to; i++) end = Math.max(end, words.get(i).end);
        return new RebuildSource.TimedWindow(from, to, words.get(from).start, end);
    }

    /** The page speaking at {@code time}, or null; {@code pages} is in source order. */
    static RebuildSource.TimedWindow at(List<RebuildSource.TimedWindow> pages, long time) {
        int low = 0, high = pages.size() - 1;
        while (low <= high) {
            int mid = (low + high) >>> 1;
            RebuildSource.TimedWindow page = pages.get(mid);
            if (time < page.start) high = mid - 1;
            else if (time >= page.end) low = mid + 1;
            else return page;
        }
        return null;
    }

    /** The page that starts first after {@code time}, or null. */
    static RebuildSource.TimedWindow after(List<RebuildSource.TimedWindow> pages, long time) {
        int low = 0, high = pages.size() - 1, found = -1;
        while (low <= high) {
            int mid = (low + high) >>> 1;
            if (pages.get(mid).start > time) {
                found = mid;
                high = mid - 1;
            } else low = mid + 1;
        }
        return found < 0 ? null : pages.get(found);
    }

    static RebuildSource.TimedWindow before(List<RebuildSource.TimedWindow> pages, long time) {
        RebuildSource.TimedWindow next = after(pages, time);
        int index = next == null ? pages.size() : pages.indexOf(next);
        return index > 0 ? pages.get(index - 1) : null;
    }
}
