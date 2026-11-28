package app.yydarlinker.aicaptions;

import android.text.StaticLayout;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Deque;
import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

/** Presentation-only pages inside one accepted event; never changes source ownership. */
final class RebuildPageLayout {
    static final long MIN_PAGE_MS = 1200;
    private static final long PREFERRED_TIMED_PAGE_MS = 2200;

    static final class Page {
        final String text;
        final long start, end;
        final String timingBasis;

        Page(String text, long start, long end) {
            this(text, start, end, "ESTIMATED_PAGE_TIMING");
        }

        Page(String text, long start, long end, String timingBasis) {
            this.text = text;
            this.start = start;
            this.end = end;
            this.timingBasis = timingBasis;
        }
    }
    /** Target-aware entry: one measured page planner for every target script. */
    static List<Page> plan(
            String text, long start, long end, CaptionPresentationBudget budget, CaptionRenderSpec spec) {
        return plan(text, start, end, budget, spec, null);
    }

    /**
     * [sourceAnchors] are real speech boundaries (word ends before a pause or a clause mark) inside
     * this unit, ascending. They let a page turn land on the pause the speaker actually made instead
     * of a character-count estimate. Null/empty keeps the reading-weight fallback.
     */
    static List<Page> plan(
            String text,
            long start,
            long end,
            CaptionPresentationBudget budget,
            CaptionRenderSpec spec,
            long[] sourceAnchors) {
        if (budget == null || spec == null || text == null || text.isEmpty() || end <= start)
            return Collections.emptyList();
        if (!wellFormed(text, spec))
            return Collections.emptyList();
        // A unit that already reads as one subtitle keeps its exact source window; only a unit
        // holding several complete sentences is divided, and only between them.
        Measurements measures = new Measurements(budget, spec);
        List<Page> unit = unitPages(text, start, end, measures, sourceAnchors);
        if (unit != null) return authoredLabel(unit, spec);
        // Keeping the whole text is one of the candidates the search weighs: it is not granted for
        // free, and no fixed duration forces a split. A plan only has to stay inside one clause at
        // a time and remain comfortable to read.
        Seams seams = seams(text, measures);
        List<Page> pages = choose(text, start, end, seams, measures);
        if (!pages.isEmpty()) return authoredLabel(pages, spec);
        // Time shortage or an indivisible long unit is not a reason to hide captions. Split by
        // measured line capacity and keep the whole translation visible.
        return authoredLabel(fallback(text, start, end, seams, measures), spec);
    }

    /**
     * Page one display unit. A unit is the translation's own semantic span (one event, or a
     * fragment joined to its continuation). Pages are built from <em>clauses</em> — the stretch
     * between two punctuation marks — and packed to one measured line each:
     *
     * <ul>
     *   <li>a page holds one or several complete clauses, never the first characters of a clause;
     *   <li>a clause that is longer than one line gets the two-line exception; only a clause longer
     *       than two lines is ever cut inside, by the measured fallback;
     *   <li>a missing final full stop is not a problem: clause marks alone drive the packing, so an
     *       unterminated tail is simply the last clause;
     *   <li>an automatic unit whose text fits but whose window is much longer than its reading time
     *       may be split on whole clauses, so a 5–7 s static page becomes two readable pages;
     *   <li>an authored cue that fits two lines is one page; a cue that overflows is projected as
     *       explicit {@code AUTHORED_OVERFLOW} sub-pages.
     * </ul>
     *
     * <p>The unit's first and last page keep its exact source window; only the pages in between are
     * placed by reading weight. Returns null when the unit needs the measured fallback.
     */
    static List<Page> unitPages(
            String text, long start, long end, CaptionPresentationBudget budget, CaptionRenderSpec spec) {
        return unitPages(text, start, end, budget, spec, null);
    }

    static List<Page> unitPages(
            String text,
            long start,
            long end,
            CaptionPresentationBudget budget,
            CaptionRenderSpec spec,
            long[] sourceAnchors) {
        return wellFormed(text, spec)
                ? unitPages(text, start, end, new Measurements(budget, spec), sourceAnchors) : null;
    }

    private static List<Page> unitPages(String text, long start, long end,
            Measurements measures, long[] sourceAnchors) {
        return packUnit(text, start, end, value -> measures.fits(value, 1),
                value -> measures.fits(value, 2), measures.spec, sourceAnchors);
    }

    /** Testable core: the two line fits are predicates, so packing is independent of a real font. */
    static List<Page> unitPages(
            String text,
            long start,
            long end,
            java.util.function.Predicate<String> fitsOne,
            java.util.function.Predicate<String> fitsTwo,
            CaptionRenderSpec spec) {
        return unitPages(text, start, end, fitsOne, fitsTwo, spec, null);
    }

    static List<Page> unitPages(
            String text,
            long start,
            long end,
            java.util.function.Predicate<String> fitsOne,
            java.util.function.Predicate<String> fitsTwo,
            CaptionRenderSpec spec,
            long[] sourceAnchors) {
        return wellFormed(text, spec)
                ? packUnit(text, start, end, fitsOne, fitsTwo, spec, sourceAnchors) : null;
    }

    private static List<Page> packUnit(String text, long start, long end,
            java.util.function.Predicate<String> fitsOne, java.util.function.Predicate<String> fitsTwo,
            CaptionRenderSpec spec, long[] sourceAnchors) {
        boolean twoLines = fitsTwo.test(text);
        List<Integer> cuts = pageCuts(text);
        if (!cuts.isEmpty() && cuts.get(cuts.size() - 1) == text.length())
            cuts.remove(cuts.size() - 1);
        // An authored cue is followed as written while it fits the two lines the box shows; only
        // a cue that overflows gets the local clause rules. This is the one place where cue
        // atomicity overrides pacing.
        if (twoLines && !spec.authored && !cuts.isEmpty() && timeSplitWanted(text, start, end, spec)) {
            // Prefer comfortable pages before relaxing to the shared minimum. A shorter page is
            // useful only when no comfortable partition exists; it must still carry real content.
            for (long minimum : new long[] {PREFERRED_TIMED_PAGE_MS, MIN_PAGE_MS}) {
                for (int pages = targetPages(text, start, end, spec, cuts.size()); pages > 1; pages--) {
                    java.util.List<String> balanced =
                            balancedPages(text, cuts, fitsOne, fitsTwo, spec, start, end, pages, minimum);
                    if (balanced != null && balanced.size() > 1)
                        return allocateUnit(balanced, start, end, fitsTwo, spec, sourceAnchors);
                }
            }
        }
        if (twoLines)
            return Collections.singletonList(
                    new Page(text, start, end, spec.authored ? "AUTHORED_CUE" : "SOURCE_EVENT"));
        // The text needs more than two lines: pack whole clauses, one measured line per page.
        if (cuts.isEmpty())
            // One clause and no place to turn a page: the two-line exception, or the fallback.
            return null;
        cuts.add(text.length());
        java.util.Map<String, Boolean> measured = new java.util.HashMap<>();
        int leadLimit = Math.max(4, spec.profile.referenceCpl / 2);
        List<String> parts = pack(text, cuts, fitsOne, fitsTwo, measured, leadLimit, spec.compactScript);
        if (parts == null) return null;
        return allocateUnit(foldTinyOrLeadPages(parts, fitsTwo, leadLimit), start, end,
                fitsTwo, spec, sourceAnchors);
    }

    private static List<Page> allocateUnit(List<String> parts, long start, long end,
            java.util.function.Predicate<String> fitsTwo, CaptionRenderSpec spec, long[] sourceAnchors) {
        for (String part : parts) if (!fitsTwo.test(part)) return null;
        return allocate(parts, start, end, spec, sourceAnchors,
                spec.authored ? "AUTHORED_OVERFLOW" : null);
    }

    /**
     * The page planner used to stop as soon as a translation fitted one/two lines, so a 32-character
     * sentence spoken over 7.4 s stayed one static page. The standard is not punctuation alone:
     * semantic completeness, line fit, sentence length and the time the page is on screen all
     * matter. Split a fitting page only when it would sit much longer than its reading time.
     */
    private static boolean timeSplitWanted(String text, long start, long end, CaptionRenderSpec spec) {
        if (spec.authored) return false;
        long duration = end - start;
        if (duration < 2 * MIN_PAGE_MS) return false;
        // A short translation over a long source window is already easy to read; splitting it
        // would create two very long pages with almost no text, not a better page turn.
        long reading = Math.max(1, spec.readingUnits(text)) * 1000L
                / Math.max(1, spec.profile.referenceCps);
        if (reading < 2000) return false;
        return duration > comfortMs(text, spec);
    }

    private static long comfortMs(String text, CaptionRenderSpec spec) {
        int units = Math.max(1, spec.readingUnits(text));
        int cps = Math.max(1, spec.profile.referenceCps);
        long reading = units * 1000L / cps;
        // Allow a page to stay a little past its reading time, but not several seconds past it.
        return Math.max(3000, Math.min(5000, reading * 3 / 2));
    }

    private static int targetPages(
            String text, long start, long end, CaptionRenderSpec spec, int cuts) {
        long duration = end - start;
        long comfort = comfortMs(text, spec);
        int maxPages = cuts + 1;
        int pages = (int) Math.min(maxPages, (duration + comfort - 1) / comfort);
        int byMinimum = (int) Math.max(1, duration / MIN_PAGE_MS);
        return Math.max(1, Math.min(pages, byMinimum));
    }

    /**
     * A small balanced partition: each page is a run of whole clauses, fits the measured two
     * lines, and carries roughly its share of the window's reading weight. A candidate that fits
     * one line is preferred; a lead-in or a tiny tail is penalised, matching the clause packer.
     */
    private static List<String> balancedPages(
            String text,
            List<Integer> cuts,
            java.util.function.Predicate<String> fitsOne,
            java.util.function.Predicate<String> fitsTwo,
            CaptionRenderSpec spec,
            long start,
            long end,
            int pages,
            long minimum) {
        if (pages < 2 || cuts.isEmpty()) return null;
        List<String> parts = new ArrayList<>(pages);
        int from = 0;
        int leadLimit = Math.max(4, spec.profile.referenceCpl / 2);
        for (int page = 0; page < pages; page++) {
            int remainingPages = pages - page;
            if (remainingPages == 1) {
                String tail = text.substring(from);
                if (!fitsTwo.test(tail)) return null;
                parts.add(tail);
                break;
            }
            int first = -1;
            for (int i = 0; i < cuts.size(); i++)
                if (cuts.get(i) > from) {
                    first = i;
                    break;
                }
            if (first < 0) return null;
            int lastAllowed = cuts.size() - (remainingPages - 1);
            if (lastAllowed < first) return null;
            double remainingWeight = Math.max(1, weight(text.substring(from)));
            double target = remainingWeight / remainingPages;
            int best = -1;
            double bestCost = Double.MAX_VALUE;
            for (int i = first; i <= lastAllowed; i++) {
                String part = text.substring(from, cuts.get(i));
                if (!fitsTwo.test(part)) continue;
                int lastClause = i == first ? from : cuts.get(i - 1);
                // Capacity/weight cannot borrow a bare introduction from the next clause.
                String lastPart = text.substring(lastClause, cuts.get(i)).trim();
                if (leadClause(lastPart, leadLimit)
                        || minimum < PREFERRED_TIMED_PAGE_MS && lastPart.endsWith("、")) continue;
                double partWeight = Math.max(1, weight(part));
                double cost = Math.abs(partWeight - target);
                if (!fitsOne.test(part)) cost += target * 0.3;
                if (leadClause(part, leadLimit)) cost += target * 0.6;
                if (i == cuts.size() - 1) cost += target * 0.2;
                if (cost < bestCost) {
                    bestCost = cost;
                    best = i;
                }
            }
            if (best < 0) return null;
            parts.add(text.substring(from, cuts.get(best)));
            from = cuts.get(best);
        }
        if (parts.isEmpty() || parts.get(parts.size() - 1).length() == 0) return null;
        if (minimum < PREFERRED_TIMED_PAGE_MS) {
            parts = foldTinyOrLeadPages(parts, fitsTwo, leadLimit);
            if (parts.size() < 2) return null;
        }
        // The relaxed pass reuses the capacity planner's fragment protection. A page below the
        // preferred duration must contain more than the existing short-introduction allowance.
        int totalWeight = 0;
        int[] partWeights = new int[parts.size()];
        for (int i = 0; i < parts.size(); i++) {
            partWeights[i] = weight(parts.get(i));
            totalWeight += partWeights[i];
        }
        long duration = end - start;
        for (int i = 0; i < parts.size(); i++) {
            long estimated = duration * partWeights[i] / Math.max(1, totalWeight);
            if (estimated < minimum
                    || minimum < PREFERRED_TIMED_PAGE_MS && estimated < PREFERRED_TIMED_PAGE_MS
                            && visible(parts.get(i)) <= leadLimit) return null;
        }
        return parts;
    }

    /**
     * Ends of the clause spans a page may end on: every Unicode clause mark (CJK, Arabic,
     * Devanagari, Latin) and the invisible join between two merged events (a zero-width space)
     * when the model itself supplied no mark.
     */
    private static List<Integer> pageCuts(String text) {
        CaptionClauses clauses = CaptionClauses.of(text);
        int[] ends = clauses.ends();
        Set<Integer> cuts = new TreeSet<>();
        for (int end : ends)
            if (end > 0 && end < text.length() && !clauses.insideQuoted(end)) cuts.add(end);
        for (int at = 0; at < text.length(); ) {
            int cp = text.codePointAt(at);
            at += Character.charCount(cp);
            if (cp != 0x200b) continue;
            int cut = at;
            while (cut < text.length()
                    && (Character.isWhitespace(text.codePointAt(cut))
                            || text.codePointAt(cut) == 0x200b))
                cut += Character.charCount(text.codePointAt(cut));
            if (cut < text.length() && !clauses.insideQuoted(cut)) cuts.add(cut);
        }
        return new ArrayList<>(cuts);
    }

    /** Greedy clause packing: the longest run of whole clauses that still fits one line. */
    private static List<String> pack(
            String text,
            List<Integer> cuts,
            java.util.function.Predicate<String> fitsOne,
            java.util.function.Predicate<String> fitsTwo,
            java.util.Map<String, Boolean> measured,
            int leadLimit,
            boolean compactScript) {
        List<String> parts = new ArrayList<>();
        int from = 0;
        while (from < text.length()) {
            int first = -1;
            for (int i = 0; i < cuts.size(); i++)
                if (cuts.get(i) > from) {
                    first = i;
                    break;
                }
            if (first < 0) {
                parts.add(text.substring(from));
                break;
            }
            int best = -1;
            for (int i = first; i < cuts.size(); i++) {
                if (!oneLine(text.substring(from, cuts.get(i)), fitsOne, measured)) break;
                best = i;
            }
            if (best < 0) {
                // The first clause is wider than one line: it gets the two-line exception. If it is
                // wider than two lines as well, split it at glyph boundaries instead of blanking
                // the caption; this is the overflow fallback for a cue or clause with no clause
                // break wide enough to help.
                String clause = text.substring(from, cuts.get(first));
                if (!fitsTwo.test(clause)) {
                    // Spaced scripts need the existing word-aware search and duration floor.
                    // A glyph-only prefix can otherwise leave half a word as a flashing tail.
                    if (!compactScript) return null;
                    List<String> emergency = splitToFit(clause, fitsTwo);
                    if (emergency == null) return null;
                    parts.addAll(emergency);
                    from = cuts.get(first);
                    continue;
                }
                parts.add(clause);
                from = cuts.get(first);
                continue;
            }
            // Never end a page on a clause that introduces what follows: step back to the last
            // boundary that closes a thought, as long as the page keeps at least one clause.
            int chosen = first;
            for (int i = best; i >= first; i--) {
                int start = i == first ? from : cuts.get(i - 1);
                if (!leadClause(text.substring(start, cuts.get(i)), leadLimit)) {
                    chosen = i;
                    break;
                }
            }
            parts.add(text.substring(from, cuts.get(chosen)));
            from = cuts.get(chosen);
        }
        return parts;
    }

    /**
     * Ends with a colon, or is a short clause ending on a comma ("当然，", "正如其名所示，"): it
     * introduces the clause that follows rather than completing the one before.
     */
    static boolean trailingIntroduction(String text, CaptionRenderSpec spec) {
        if (text == null || text.isEmpty()) return false;
        int[] ends = CaptionClauses.of(text).ends();
        int from = ends.length < 2 ? 0 : ends[ends.length - 2];
        return leadClause(text.substring(from), Math.max(4, spec.profile.referenceCpl / 2));
    }

    private static boolean leadClause(String clause, int limit) {
        String value = clause.replace("\u200b", "").trim();
        if (value.isEmpty()) return false;
        int last = value.codePointBefore(value.length());
        if (last == '：' || last == ':') return true;
        if (last != '，' && last != ',' && last != '、' && last != '،' && last != '؛') return false;
        return visible(value) <= limit;
    }

    /** Longest glyph-boundary prefix per page; used only when a clause exceeds two lines. */
    private static List<String> splitToFit(
            String clause, java.util.function.Predicate<String> fitsTwo) {
        List<String> out = new ArrayList<>();
        int from = 0, length = clause.length();
        while (from < length) {
            int best = -1;
            for (int at = from; at < length; ) {
                int cp = clause.codePointAt(at);
                at += Character.charCount(cp);
                if (fitsTwo.test(clause.substring(from, at))) best = at;
                else break;
            }
            if (best <= from) {
                // A single grapheme wider than the box cannot be shown by any page planner.
                return null;
            }
            out.add(clause.substring(from, best));
            from = best;
        }
        return out;
    }

    private static boolean oneLine(
            String text,
            java.util.function.Predicate<String> fitsOne,
            java.util.Map<String, Boolean> measured) {
        Boolean known = measured.get(text);
        if (known == null) {
            known = fitsOne.test(text);
            measured.put(text, known);
        }
        return known;
    }

    /**
     * Safety net for what the packer could not rebalance: a page that is a bare lead ("当然，",
     * "本质上，") or a page of two or three characters folds into its neighbour when the pair still
     * fits two lines. A page that would otherwise show one word alone is the worse trade.
     */
    private static List<String> foldTinyOrLeadPages(
            List<String> parts,
            java.util.function.Predicate<String> fitsTwo,
            int leadLimit) {
        boolean changed = true;
        while (changed && parts.size() > 1) {
            changed = false;
            for (int i = 0; i < parts.size(); i++) {
                String part = parts.get(i).trim();
                boolean lead = leadClause(part, leadLimit);
                boolean tiny = visible(part) < 6;
                // A unit that ends mid-clause leaves its tail as a flash of two or three words.
                boolean tail = i == parts.size() - 1 && !endsClause(part) && visible(part) < 10;
                if (!lead && !tiny && !tail) continue;
                int other = i + 1 < parts.size() ? i + 1 : i - 1;
                if (other < 0) break;
                String merged =
                        other > i ? parts.get(i) + parts.get(other) : parts.get(other) + parts.get(i);
                if (!fitsTwo.test(merged)) continue;
                int keep = Math.min(i, other);
                parts.set(keep, merged);
                parts.remove(Math.max(i, other));
                changed = true;
                break;
            }
        }
        return parts;
    }

    private static boolean endsClause(String text) {
        String value = text.replace("\u200b", "").trim();
        return !value.isEmpty() && CaptionClauses.mark(value.codePointBefore(value.length()));
    }

    private static int visible(String text) {
        int count = 0;
        for (int at = 0; at < text.length(); ) {
            int cp = text.codePointAt(at);
            at += Character.charCount(cp);
            if (Character.isWhitespace(cp) || cp == 0x200b || cp == 0xfeff) continue;
            if (Character.getType(cp) == Character.FORMAT) continue;
            count++;
        }
        return count;
    }

    /**
     * Time inside one unit's exact window: a clause's own length plus the pause its punctuation
     * implies, so page turns land near the pauses in the voice. The outer bounds never move.
     */
    private static List<Page> allocate(
            List<String> parts, long start, long end, CaptionRenderSpec spec) {
        return allocate(parts, start, end, spec, null, null);
    }

    private static List<Page> allocate(
            List<String> parts,
            long start,
            long end,
            CaptionRenderSpec spec,
            long[] sourceAnchors) {
        return allocate(parts, start, end, spec, sourceAnchors, null);
    }

    private static List<Page> allocate(
            List<String> parts,
            long start,
            long end,
            CaptionRenderSpec spec,
            long[] sourceAnchors,
            String forcedBasis) {
        if (parts.size() == 1)
            return Collections.singletonList(
                    new Page(
                            parts.get(0),
                            start,
                            end,
                            forcedBasis == null ? "SOURCE_EVENT" : forcedBasis));
        long[] anchored = pageAnchorTimes(sourceAnchors, parts.size(), start, end);
        int total = 0;
        int[] weights = new int[parts.size()];
        for (int i = 0; i < parts.size(); i++) {
            weights[i] = weight(parts.get(i));
            total += weights[i];
        }
        List<Page> pages = new ArrayList<>(parts.size());
        long at = start;
        int remaining = total;
        String basis =
                forcedBasis != null
                        ? forcedBasis
                        : anchored == null ? "ESTIMATED_PAGE_TIMING" : "SOURCE_PAUSE_ANCHOR";
        for (int i = 0; i < parts.size(); i++) {
            if (i == parts.size() - 1) {
                pages.add(new Page(parts.get(i), at, end, basis));
                break;
            }
            long next;
            if (anchored != null) {
                next = anchored[i];
            } else {
                long span = Math.max(1, (end - at) * weights[i] / Math.max(1, remaining));
                next = Math.min(end - 1, at + span);
            }
            pages.add(new Page(parts.get(i), at, next, basis));
            at = next;
            remaining -= weights[i];
        }
        return Collections.unmodifiableList(pages);
    }

    /**
     * One real source boundary per page turn, or null when the anchors cannot cover the pages
     * monotonically. A page turn on an actual pause/word end is better than a character-count guess.
     */
    private static long[] pageAnchorTimes(
            long[] anchors, int pages, long start, long end) {
        if (anchors == null || anchors.length < pages - 1 || pages <= 1) return null;
        long[] result = new long[pages - 1];
        long prior = start;
        for (int i = 1; i < pages; i++) {
            int index;
            if (pages == 2) {
                index = (int) Math.round(anchors.length / 2.0);
            } else {
                index =
                        1
                                + (int)
                                        Math.round(
                                                (double) (i - 1)
                                                        * (anchors.length - 1)
                                                        / (pages - 2));
            }
            index = Math.min(anchors.length, Math.max(1, index));
            long at = anchors[index - 1];
            if (at <= prior || at >= end) return null;
            result[i - 1] = at;
            prior = at;
        }
        return result;
    }

    /** Reading weight of one clause: its visible characters plus the pause its mark implies. */
    private static int weight(String part) {
        int units = 0;
        for (int at = 0; at < part.length(); ) {
            int cp = part.codePointAt(at);
            at += Character.charCount(cp);
            if (Character.isWhitespace(cp)) continue;
            units++;
            if ("。！？!?；;؟۔।॥׃።".indexOf(cp) >= 0) units += 3;
            else if ("，、：,:،؛".indexOf(cp) >= 0) units += 1;
        }
        return Math.max(1, units);
    } 

    /** Approximate display width in half-CJK cells, without rounding up short pages. */
    static int displayHalfCells(String text) {
        int whole = 0, half = 0;
        for (int at = 0; at < text.length(); ) {
            int cp = text.codePointAt(at);
            if (cp >= 0x20 && cp <= 0x7e) half++;
            else whole++;
            at += Character.charCount(cp);
        }
        return whole * 2 + half;
    }

    /** An authored cue that cannot fit the two-line box is an explicit overflow projection. */
    private static List<Page> authoredLabel(
            List<Page> pages, CaptionRenderSpec spec) {
        if (!spec.authored || pages.size() <= 1) return pages;
        List<Page> out = new ArrayList<>(pages.size());
        for (Page page : pages)
            out.add(
                    new Page(
                            page.text, page.start, page.end, "AUTHORED_OVERFLOW"));
        return Collections.unmodifiableList(out);
    }

    /** Last-resort pages: longest measured prefix per page, proportional reading time. */
    private static List<Page> fallback(
            String text,
            long start,
            long end,
            Seams seams, Measurements measures) {
        CaptionRenderSpec spec = measures.spec;
        CaptionClauses clauses = CaptionClauses.of(text);
        List<String> parts = new ArrayList<>();
        int from = 0;
        while (from < text.length()) {
            int best = -1, firstAllowed = -1;
            for (int cut : seams.cuts) {
                if (cut <= from) continue;
                if (clauses.allows(from, cut)) {
                    if (firstAllowed < 0) firstAllowed = cut;
                    if (measures.fits(text.substring(from, cut), 2))
                        best = cut;
                }
            }
            if (best < 0) {
                // A single clause (or an unpunctuated cue) can exceed the two-line box. The
                // semantic cut is impossible, so take the longest measured prefix that still
                // shows complete glyph clusters; blanking the page is never the fallback.
                best = measuredPrefix(text, from, seams.graphemes, measures);
            }
            if (best < 0) best = firstAllowed;
            if (best <= from) best = from + Character.charCount(text.codePointAt(from));
            parts.add(text.substring(from, best));
            from = best;
        }
        long[] weights = new long[parts.size()];
        long total = 0;
        for (int i = 0; i < parts.size(); i++) {
            weights[i] = Math.max(1, spec.readingUnits(parts.get(i)));
            total += weights[i];
        }
        List<Page> result = new ArrayList<>(parts.size());
        long at = start, remainingWeight = total;
        for (int i = 0; i < parts.size(); i++) {
            if (i + 1 == parts.size()) {
                result.add(new Page(parts.get(i), at, end));
                break;
            }
            long remaining = end - at;
            if (remaining <= parts.size() - i) {
                // Less than one millisecond per remaining part: show the remainder as one page
                // rather than dropping text or creating an invalid window.
                StringBuilder merged = new StringBuilder();
                for (int k = i; k < parts.size(); k++) merged.append(parts.get(k));
                result.add(new Page(merged.toString(), at, end));
                break;
            }
            long span = Math.max(1, remaining * weights[i] / remainingWeight);
            long next = Math.min(end - 1, at + span);
            result.add(new Page(parts.get(i), at, next));
            at = next;
            remainingWeight -= weights[i];
        }
        return Collections.unmodifiableList(result);
    }

    /** Longest prefix from {@code from} that still fits the two-line box, on glyph boundaries. */
    private static int measuredPrefix(
            String text, int from, int[] boundaries, Measurements measures) {
        int best = -1;
        for (int boundary : boundaries) {
            if (boundary <= from) continue;
            if (measures.fits(text.substring(from, boundary), 2))
                best = boundary;
            else break;
        }
        return best;
    }

    static boolean wellFormed(String text, CaptionRenderSpec spec) {
        for (int n = 0; n < text.length(); n++) {
            char c = text.charAt(n);
            if (Character.isHighSurrogate(c)) {
                if (n + 1 >= text.length() || !Character.isLowSurrogate(text.charAt(++n)))
                    return false;
            } else if (Character.isLowSurrogate(c)) return false;
        }
        int[] cuts = CaptionUnicode.characterBoundaries(text, spec.locale);
        for (int i = 1; i < cuts.length; i++) {
            int cp = text.codePointAt(cuts[i - 1]), type = Character.getType(cp);
            if (type == Character.NON_SPACING_MARK
                    || type == Character.COMBINING_SPACING_MARK
                    || type == Character.ENCLOSING_MARK) return false;
        }
        return true;
    }

    static final int SENTENCE = 0, CLAUSE = 1, WORD = 2, EMERGENCY = 3;

    private record Seams(int[] cuts, int[] kinds, int[] graphemes) {}

    private static final java.util.regex.Pattern UNICODE_NUMBER =
            java.util.regex.Pattern.compile("[\\p{Nd}]+(?:[.,\\u066b\\u066c][\\p{Nd}]+)*");

    private static boolean unitLetter(int cp) {
        int type = Character.getType(cp);
        return Character.isLetterOrDigit(cp)
                || type == Character.NON_SPACING_MARK
                || type == Character.COMBINING_SPACING_MARK
                || type == Character.ENCLOSING_MARK;
    }

    static boolean[] protectedOffsets(String text) {
        boolean[] blocked = new boolean[text.length() + 1];
        for (int n = 1; n < text.length(); n++)
            blocked[n] = text.charAt(n - 1) == '\u00a0' || text.charAt(n) == '\u00a0';
        for (java.util.regex.Pattern pattern :
                Arrays.asList(RebuildNumbers.NUMBER, UNICODE_NUMBER)) {
            java.util.regex.Matcher m = pattern.matcher(text);
            while (m.find()) Arrays.fill(blocked, m.start() + 1, m.end(), true);
        }
        // Scan compound identifiers once. Avoid repeated regex backtracking on long unspaced
        // scripts.
        for (int at = 0; at < text.length(); ) {
            int cp = text.codePointAt(at);
            if (!unitLetter(cp)) {
                at += Character.charCount(cp);
                continue;
            }
            int from = at;
            boolean compound = false;
            while (at < text.length()) {
                cp = text.codePointAt(at);
                if (unitLetter(cp)) {
                    at += Character.charCount(cp);
                    continue;
                }
                if ("-./_".indexOf(cp) >= 0
                        && at + Character.charCount(cp) < text.length()
                        && unitLetter(text.codePointAt(at + Character.charCount(cp)))) {
                    compound = true;
                    at += Character.charCount(cp);
                    continue;
                }
                break;
            }
            if (compound) Arrays.fill(blocked, from + 1, at, true);
        }
        return blocked;
    }

    private static int left(String text, int n) {
        while (n > 0 && Character.isWhitespace(text.codePointBefore(n)))
            n -= Character.charCount(text.codePointBefore(n));
        return n;
    }

    private static int right(String text, int n) {
        while (n < text.length() && Character.isWhitespace(text.codePointAt(n)))
            n += Character.charCount(text.codePointAt(n));
        return n;
    }

    static boolean opening(int cp) {
        int t = Character.getType(cp);
        return t == Character.START_PUNCTUATION || t == Character.INITIAL_QUOTE_PUNCTUATION;
    }

    static boolean closing(int cp) {
        int t = Character.getType(cp);
        return t == Character.END_PUNCTUATION || t == Character.FINAL_QUOTE_PUNCTUATION;
    }

    private static boolean legal(String text, int n, boolean[] blocked) {
        if (n == 0 || n == text.length()) return true;
        if (blocked[n]) return false;
        int l = left(text, n), r = right(text, n);
        if (l == 0 || r == text.length()) return false; // No whitespace/punctuation-only page.
        int before = text.codePointBefore(l), after = text.codePointAt(r);
        return !opening(before)
                && !closing(after)
                && ".,!?;:，。！？；：、\u060c\u061b\u061f\u0964\u0965".indexOf(after) < 0;
    }

    private static int evidence(String text, int n) {
        int at = left(text, n);
        while (at > 0
                && (closing(text.codePointBefore(at))
                        || text.codePointBefore(at) == '"'
                        || text.codePointBefore(at) == '\''))
            at = left(text, at - Character.charCount(text.codePointBefore(at)));
        if (at == 0) return WORD;
        int cp = text.codePointBefore(at);
        if (cp == '.') {
            int start = at - 1;
            while (start > 0
                    && (Character.isLetterOrDigit(text.codePointBefore(start))
                            || text.codePointBefore(start) == '.'))
                start -= Character.charCount(text.codePointBefore(start));
            String unit = text.substring(start, at - 1);
            // Decimal, model and short/dotted abbreviation evidence is not a definite sentence.
            if (unit.length() <= 3
                    || unit.indexOf('.') >= 0
                    || RebuildNumbers.hasDigits(unit)
                    || !unit.isEmpty() && Character.isUpperCase(unit.codePointAt(0))) return WORD;
            return SENTENCE;
        }
        if ("!?。！？\u061f\u0964\u0965".indexOf(cp) >= 0) return SENTENCE;
        if (",;:，；：、\u060c\u061b".indexOf(cp) >= 0) return CLAUSE;
        return WORD;
    }

    private static Seams seams(String text, Measurements measures) {
        CaptionRenderSpec spec = measures.spec;
        int[] graphemes = CaptionUnicode.characterBoundaries(text, spec.locale);
        int[] words = CaptionUnicode.wordBoundaries(text, spec.locale);
        int[] lines = CaptionUnicode.lineBoundaries(text, spec.locale);
        int[] sentences = CaptionUnicode.sentenceBoundaries(text, spec.locale);
        boolean[] blocked = protectedOffsets(text);
        TreeMap<Integer, Integer> ordinary = new TreeMap<>();
        ordinary.put(0, SENTENCE);
        ordinary.put(text.length(), SENTENCE);
        int lastSeam = 0;
        for (int n : graphemes) {
            if (n == 0 || n == text.length() || !legal(text, n, blocked)) continue;
            int kind = evidence(text, n);
            boolean word = Arrays.binarySearch(words, n) >= 0 && Arrays.binarySearch(lines, n) >= 0;
            boolean sentence = Arrays.binarySearch(sentences, n) >= 0;
            int punctuation = left(text, n);
            while (punctuation > 0
                    && (closing(text.codePointBefore(punctuation))
                            || text.codePointBefore(punctuation) == '"'
                            || text.codePointBefore(punctuation) == '\''))
                punctuation =
                        left(
                                text,
                                punctuation
                                        - Character.charCount(text.codePointBefore(punctuation)));
            if (kind == SENTENCE
                    && punctuation > 0
                    && text.codePointBefore(punctuation) == '.'
                    && !sentence) kind = WORD;
            int mark = punctuation > 0 ? text.codePointBefore(punctuation) : -1;
            // A colon introduces what follows, and a bare discourse marker ("当然，") belongs to
            // the clause it introduces: neither may end a page.
            if (mark == '：' || mark == ':') continue;
            if (kind == CLAUSE && n - lastSeam <= 4) continue;
            if (word || kind < WORD || sentence && kind == SENTENCE) {
                ordinary.put(n, kind);
                lastSeam = n;
            }
        }
        TreeMap<Integer, Integer> all = new TreeMap<>(ordinary);
        List<Integer> units = new ArrayList<>(ordinary.keySet());
        for (int i = 1; i < units.size(); i++) {
            int from = units.get(i - 1), to = units.get(i);
            // Only an indivisible ordinary unit itself exceeding two-line geometry may split.
            // A shortage of event time is never permission to cut a normally fitting word.
            if (measures.fits(text.substring(from, to), 2)) continue;
            for (int n : graphemes)
                if (n > from
                        && n < to
                        && text.charAt(n - 1) != '\u00a0'
                        && text.charAt(n) != '\u00a0') {
                    int l = left(text, n), r = right(text, n);
                    if (l > from
                            && r < to
                            && !opening(text.codePointBefore(l))
                            && !closing(text.codePointAt(r))) all.putIfAbsent(n, EMERGENCY);
                }
        }
        int[] cuts = new int[all.size()], kinds = new int[all.size()];
        int i = 0;
        for (Map.Entry<Integer, Integer> e : all.entrySet()) {
            cuts[i] = e.getKey();
            kinds[i++] = e.getValue();
        }
        return new Seams(cuts, kinds, graphemes);
    }

    private record Measured(int lines, boolean fits, int units, double width, double lineUnits) {}

    private static final class Measurements {
        final CaptionPresentationBudget budget;
        final CaptionRenderSpec spec;
        final Map<String, Measured> parts = new HashMap<>();

        Measurements(CaptionPresentationBudget budget, CaptionRenderSpec spec) {
            this.budget = budget;
            this.spec = spec;
        }

        boolean fits(String text, int lines) {
            Measured part = measure(text);
            return part.fits && part.lines <= lines;
        }

        Measured measure(String text) {
            return parts.computeIfAbsent(text, value -> {
                StaticLayout layout = spec.layout(value, budget.preferredPx, budget.width);
                int lines = layout.getLineCount();
                boolean accepted = lines <= Math.max(2, spec.maxLines)
                        && spec.fits(value, layout, budget.width, lines);
                return new Measured(lines, accepted, accepted ? Math.max(1, spec.readingUnits(value)) : 0,
                        accepted ? spec.actualWidth(layout) : 0,
                        accepted ? spec.lineUnits(value, layout) : 0);
            });
        }
    }

    private record Score(int emergency, int weak, int longPages, int pages, int clauses, double balance)
            implements Comparable<Score> {
        @Override
        public int compareTo(Score o) {
            // Meaning first: an emergency cut (inside a word) or a weak one is worse than any
            // pacing preference. Then a page held past the recommended wall time, then whether the
            // cut landed on a clause instead of a sentence, then how many pages, then balance.
            int n = Integer.compare(emergency, o.emergency);
            if (n != 0) return n;
            n = Integer.compare(weak, o.weak);
            if (n != 0) return n;
            n = Integer.compare(longPages, o.longPages);
            if (n != 0) return n;
            n = Integer.compare(clauses, o.clauses);
            if (n != 0) return n;
            n = Integer.compare(pages, o.pages);
            return n != 0 ? n : Double.compare(balance, o.balance);
        }
    }

    private static List<Page> choose(
            String text, long start, long end, Seams seams, Measurements measures) {
        int[] cuts = seams.cuts, kinds = seams.kinds;
        CaptionRenderSpec spec = measures.spec;
        int n = cuts.length;
        long duration = end - start;
        int capacity = (int) Math.min(n - 1, duration / MIN_PAGE_MS);
        if (capacity < 1) return Collections.emptyList();
        CaptionClauses clauses = CaptionClauses.of(text);
        Score[][] cost = new Score[capacity + 1][n];
        int[][] previous = new int[capacity + 1][n];
        for (int p = 0; p <= capacity; p++) Arrays.fill(previous[p], -1);
        cost[0][0] = new Score(0, 0, 0, 0, 0, 0);
        int total = Math.max(1, spec.readingUnits(text));
        for (int count = 0; count < capacity; count++)
            for (int from = 0; from < n - 1; from++) {
                Score prior = cost[count][from];
                if (prior == null) continue;
                for (int to = from + 1; to < n; to++) {
                    // A page may hold several complete clauses, or one long clause split on its
                    // own; it never starts before a clause and ends inside it.
                    if (!clauses.allows(cuts[from], cuts[to])) continue;
                    // Within this event/spec/geometry, identical complete parts have identical
                    // native layout.
                    String part = text.substring(cuts[from], cuts[to]);
                    Measured measured = measures.measure(part);
                    if (measured.lines > spec.maxLines) break;
                    if (!measured.fits) continue;
                    double ms = duration * measured.units / (double) total;
                    double lineUnits = measured.lineUnits,
                            cpl = Math.max(0, lineUnits - spec.profile.referenceCpl);
                    int kind = to == n - 1 ? SENTENCE : kinds[to];
                    Score score =
                            new Score(
                                    prior.emergency + (kind == EMERGENCY ? 1 : 0),
                                    prior.weak + (kind == WORD ? 1 : 0),
                                    prior.longPages
                                            + (ms > spec.profile.softPageDurationMs ? 1 : 0),
                                    count + 1,
                                    prior.clauses + (kind == CLAUSE ? 1 : 0),
                                    prior.balance
                                            + cpl * cpl
                                            + Math.max(0, ms - spec.profile.softPageDurationMs) / 20
                                            + Math.pow(
                                                    measured.width / Math.max(1, measures.budget.width) - .8,
                                                    2));
                    if (cost[count + 1][to] == null || score.compareTo(cost[count + 1][to]) < 0) {
                        cost[count + 1][to] = score;
                        previous[count + 1][to] = from;
                    }
                }
            }
        int count = -1;
        Score best = null;
        for (int p = 1; p <= capacity; p++)
            if (cost[p][n - 1] != null && (best == null || cost[p][n - 1].compareTo(best) < 0)) {
                best = cost[p][n - 1];
                count = p;
            }
        if (count < 0) return Collections.emptyList();
        Deque<String> chosen = new ArrayDeque<>();
        for (int to = n - 1; to > 0; count--) {
            int from = previous[count][to];
            chosen.addFirst(text.substring(cuts[from], cuts[to]));
            to = from;
        }
        List<String> parts = new ArrayList<>(chosen);
        long[] weights = new long[parts.size()];
        long sum = 0;
        for (int i = 0; i < parts.size(); i++) {
            weights[i] = Math.max(1, spec.readingUnits(parts.get(i)));
            sum += weights[i];
        }
        List<Page> result = new ArrayList<>();
        long at = start, used = 0, cumulative = 0;
        long extra = duration - parts.size() * MIN_PAGE_MS;
        for (int i = 0; i < parts.size(); i++) {
            cumulative += weights[i];
            long distributed = (extra / sum) * cumulative + (extra % sum) * cumulative / sum;
            long next = i == parts.size() - 1 ? end : at + MIN_PAGE_MS + distributed - used;
            result.add(new Page(parts.get(i), at, next));
            at = next;
            used = distributed;
        }
        return Collections.unmodifiableList(result);
    }
}
