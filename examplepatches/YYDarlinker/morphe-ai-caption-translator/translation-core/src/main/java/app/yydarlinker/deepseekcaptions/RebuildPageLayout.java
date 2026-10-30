package app.yydarlinker.deepseekcaptions;

import java.util.ArrayList;
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
            String text, long start, long end, TranslationBudget budget, CaptionRenderSpec spec) {
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
            TranslationBudget budget,
            CaptionRenderSpec spec,
            long[] sourceAnchors) {
        if (budget == null || spec == null || text == null || text.isEmpty() || end <= start)
            return Collections.emptyList();
        TranslationBudget measured = budget.withSpec(spec);
        // One planner for every target language. The old Chinese-only `legacy` fork made Japanese,
        // Korean, Arabic and every unlisted language take a different algorithm; script facts now
        // live in CaptionScript and the page planner itself is language-neutral.
        return CaptionLanguagePager.plan(text, start, end, measured, spec, sourceAnchors);
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
            String text, long start, long end, TranslationBudget budget, CaptionRenderSpec spec) {
        return unitPages(text, start, end, budget, spec, null);
    }

    static List<Page> unitPages(
            String text,
            long start,
            long end,
            TranslationBudget budget,
            CaptionRenderSpec spec,
            long[] sourceAnchors) {
        if (!CaptionLanguagePager.wellFormed(text, spec)) return null;
        return unitPages(
                text,
                start,
                end,
                value -> spec.fits(value, budget.preferredPx, budget.width, 1),
                value -> spec.fits(value, budget.preferredPx, budget.width, 2),
                spec,
                sourceAnchors);
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
        if (!CaptionLanguagePager.wellFormed(text, spec)) return null;
        boolean twoLines = fitsTwo.test(text);
        List<Integer> cuts = pageCuts(text);
        if (!cuts.isEmpty() && cuts.get(cuts.size() - 1) == text.length())
            cuts.remove(cuts.size() - 1);
        // An authored cue is followed as written while it fits the two lines the box shows; only
        // a cue that overflows gets the local clause rules. This is the one place where cue
        // atomicity overrides pacing.
        if (spec.authored && twoLines)
            return Collections.singletonList(
                    new Page(text, start, end, "AUTHORED_CUE"));
        if (twoLines && (cuts.isEmpty() || !timeSplitWanted(text, start, end, spec)))
            return Collections.singletonList(
                    new Page(text, start, end, spec.authored ? "AUTHORED_CUE" : "SOURCE_EVENT"));
        if (twoLines) {
            // Prefer comfortable pages before relaxing to the shared minimum. A shorter page is
            // useful only when no comfortable partition exists; it must still carry real content.
            for (long minimum : new long[] {PREFERRED_TIMED_PAGE_MS, MIN_PAGE_MS}) {
                for (int pages = targetPages(text, start, end, spec, cuts.size()); pages > 1; pages--) {
                    java.util.List<String> balanced =
                            balancedPages(text, cuts, fitsOne, fitsTwo, spec, start, end, pages, minimum);
                    if (balanced != null && balanced.size() > 1) {
                        for (String part : balanced) if (!fitsTwo.test(part)) return null;
                        return allocate(
                                balanced,
                                start,
                                end,
                                spec,
                                sourceAnchors,
                                spec.authored ? "AUTHORED_OVERFLOW" : null);
                    }
                }
            }
            return Collections.singletonList(
                    new Page(text, start, end, spec.authored ? "AUTHORED_CUE" : "SOURCE_EVENT"));
        }
        // The text needs more than two lines: pack whole clauses, one measured line per page.
        if (cuts.isEmpty())
            // One clause and no place to turn a page: the two-line exception, or the fallback.
            return null;
        cuts.add(text.length());
        java.util.Map<String, Boolean> measured = new java.util.HashMap<>();
        int leadLimit = Math.max(4, spec.profile.referenceCpl / 2);
        List<String> parts = pack(text, cuts, fitsOne, fitsTwo, measured, leadLimit, spec.compactScript);
        if (parts == null) return null;
        parts = foldTinyOrLeadPages(parts, fitsTwo, leadLimit);
        for (String part : parts) if (!fitsTwo.test(part)) return null;
        return allocate(
                parts,
                start,
                end,
                spec,
                sourceAnchors,
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
}
