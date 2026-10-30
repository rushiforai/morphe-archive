package app.yydarlinker.deepseekcaptions;

import java.util.*;
import java.util.function.Predicate;

/**
 * Display-only partition of one accepted plan into caption units. Every accepted event belongs to
 * exactly one unit, so a later page never repeats text an earlier page already showed. Source
 * ownership, event times, cache entries and translation requests are unchanged.
 *
 * <p>Replaces the upstream pairwise join (previous lead + current event), which re-showed the lead
 * as part of the next page and slid through runs of short events. Pages are chosen per block with a
 * small cost search: a page should not end in the middle of a clause, flash for under a second, or
 * hold only a short lead. A semantic continuation can span several measured pages; it does not
 * have to fit a single page.
 */
final class RebuildDisplayGroups {
    static final long SHORT_EVENT_MS = 1000;

    /** Nominal page time for a joined unit; a fragment the speaker continues may run past it. */
    static final long MAX_UNIT_MS = 7000;

    /** Ceiling for optional grouping. Explicit semantic dependency chains are paginated afterward. */
    static final long EXTENDED_UNIT_MS = 10500;

    /** Below the planner's hard source break, a pause does not split a joined unit. */
    static final long MAX_BRIDGE_MS = 650;

    /**
     * A caption stays up through a shorter pause until the next speech, so the box does not blink.
     */
    static final long HOLD_MS = 1000;

    private static final int MAX_GROUP = 6;
    private static final String TERMINAL = "。！？!?；;．.؟।॥۔׃።", CLOSING = "\"'”’」』）)]》";

    static final class Unit {
        final int block, from, to;
        final long start, end;
        final String text;
        final boolean blocked;
        final List<RebuildProtocol.Event> events;

        /** The separator written before each event's text; the first is always empty. */
        final List<String> separators;

        Unit(
                int block,
                List<RebuildProtocol.Event> events,
                List<String> separators,
                long end,
                boolean blocked) {
            this.block = block;
            this.events = Collections.unmodifiableList(new ArrayList<>(events));
            this.separators = Collections.unmodifiableList(new ArrayList<>(separators));
            from = events.get(0).from;
            to = events.get(events.size() - 1).to;
            start = events.get(0).start;
            this.end = end;
            this.text = text(events, separators);
            this.blocked = blocked;
        }

        String id() {
            return block + ":" + from + "-" + to;
        }

        boolean covers(long time) {
            return start <= time && time < end;
        }
    }

    private RebuildDisplayGroups() {}

    /**
     * Units in source order. {@code fits} is the measured two-line check; null when not laid out
     * yet.
     */
    static List<Unit> partition(
            int block,
            List<RebuildProtocol.Event> events,
            RebuildSource source,
            CaptionLanguageContext context,
            Predicate<String> fits,
            Predicate<RebuildProtocol.Event> blocked) {
        int n = events.size();
        if (n == 0) return Collections.emptyList();
        CaptionRenderSpec spec = context.renderSpec;
        boolean punctuated = punctuated(source, events.get(0).from, events.get(n - 1).to);
        // Boundary j sits between events j-1 and j: its separator and the cost of ending a page
        // there.
        String[] separator = new String[n];
        double[] breakCost = new double[n];
        boolean[] linked = new boolean[n];
        boolean[] continuation = new boolean[n];
        for (int j = 1; j < n; j++) {
            RebuildProtocol.Event left = events.get(j - 1), right = events.get(j);
            linked[j] =
                    joinable(left, blocked)
                            && joinable(right, blocked)
                            && adjacent(source, left, right);
            boolean clause = clauseEnd(left.text);
            continuation[j] = requiresContinuation(source, context, left);
            boolean continuous = continuation[j]
                    || !clause && continuous(source, context, left.to, punctuated);
            separator[j] = separator(left.text.trim(), right.text.trim(), spec, continuous);
            if (!linked[j]) continue;
            breakCost[j] =
                    clause
                            ? 0
                            : continuous ? 4 : 0;
            // Missing punctuation is not continuation evidence in ASR. Preserve an independently
            // readable event; the existing minimum-page time still protects flashing fragments.
            if (lead(left, spec)
                    && (clause || left.end - left.start < RebuildPageLayout.MIN_PAGE_MS))
                breakCost[j] += 1;
            // "……的人写的，毕竟" must not be a page: a connective that introduces the next
            // clause carries the reader forward.
            if (continuation[j]) breakCost[j] += 40;
            if (!clause && right.end - right.start < RebuildPageLayout.MIN_PAGE_MS
                    && tail(right, j == n - 1, spec)) breakCost[j] += 1;
        }
        double[] best = new double[n + 1];
        int[] cut = new int[n + 1];
        Arrays.fill(best, Double.MAX_VALUE);
        best[0] = 0;
        for (int i = 1; i <= n; i++) {
            boolean continuationChain = true;
            for (int j = i - 1; j >= 0 && i - j <= MAX_GROUP; j--) {
                if (j < i - 1 && !linked[j + 1]) break;
                if (j < i - 1) continuationChain &= continuation[j + 1];
                List<RebuildProtocol.Event> group = events.subList(j, i);
                List<String> separators = separators(separator, j, i);
                // Optional joins retain their measured fit/time limits. A positive dependency
                // chain is one semantic span; its physical pages are planned afterward.
                long limit =
                        completeUtterance(group.get(0).text) || sourceSentenceEnd(source, group.get(0))
                                ? MAX_UNIT_MS
                                : EXTENDED_UNIT_MS;
                if (group.size() > 1 && !continuationChain
                        && !readable(group, separators, spec, fits, limit)) {
                    if (group.get(group.size() - 1).end - group.get(0).start > limit) break;
                    continue;
                }
                double cost = best[j] + pageCost(group) + (i < n ? breakCost[i] : 0);
                if (cost < best[i]) {
                    best[i] = cost;
                    cut[i] = j;
                }
            }
        }
        List<int[]> ranges = new ArrayList<>();
        for (int i = n; i > 0; i = cut[i]) ranges.add(0, new int[] {cut[i], i});
        List<Unit> units = new ArrayList<>(ranges.size());
        for (int g = 0; g < ranges.size(); g++) {
            int from = ranges.get(g)[0], to = ranges.get(g)[1];
            List<RebuildProtocol.Event> group = events.subList(from, to);
            RebuildProtocol.Event last = group.get(group.size() - 1);
            long end = last.end, next = -1;
            if (to < n) next = events.get(to).start;
            else if (last.to + 1 < source.words.size()) next = source.words.get(last.to + 1).start;
            if (next > end && next - end < HOLD_MS) end = next;
            units.add(
                    new Unit(
                            block,
                            group,
                            separators(separator, from, to),
                            end,
                            group.size() == 1 && blocked != null && blocked.test(group.get(0))));
        }
        return Collections.unmodifiableList(units);
    }

    static Unit at(List<Unit> units, long time) {
        for (Unit unit : units) if (unit.covers(time)) return unit;
        return null;
    }

    /**
     * The same unit without the events whose source tokens were already shown; null if none remain.
     */
    static Unit after(Unit unit, int shownTo) {
        int first = 0;
        while (first < unit.events.size() && unit.events.get(first).from <= shownTo) first++;
        if (first == unit.events.size()) return null;
        if (first == 0) return unit;
        List<String> separators =
                new ArrayList<>(unit.separators.subList(first, unit.events.size()));
        separators.set(0, "");
        return new Unit(
                unit.block,
                unit.events.subList(first, unit.events.size()),
                separators,
                unit.end,
                unit.blocked);
    }

    /** A blocked, empty or non-speech event is shown (or withheld) on its own. */
    private static boolean joinable(
            RebuildProtocol.Event event, Predicate<RebuildProtocol.Event> blocked) {
        return !event.text.trim().isEmpty() && (blocked == null || !blocked.test(event));
    }

    static boolean adjacent(
            RebuildSource source, RebuildProtocol.Event left, RebuildProtocol.Event right) {
        return left.to < right.from
                // The reply left at most a particle untranslated between these two events; nothing
                // is displayed for that hole, so the two still read as one page.
                && RebuildProtocol.withinHole(source, left.to + 1, right.from)
                && left.start < left.end
                && right.start < right.end
                && left.end <= right.start
                && right.start - left.end < MAX_BRIDGE_MS
                && !RebuildPlanner.hardBreakBefore(source, right.from);
    }

    /** A page that flashes for under a second; each join costs a little, so ties stay separate. */
    private static double pageCost(List<RebuildProtocol.Event> group) {
        double cost = 0.1 * (group.size() - 1);
        if (group.get(group.size() - 1).end - group.get(0).start < SHORT_EVENT_MS) cost += 3;
        return cost;
    }

    /**
     * A short event without a sentence end; the threshold is three quarters of one reference line.
     */
    static boolean lead(RebuildProtocol.Event event, CaptionRenderSpec spec) {
        String text = event.text.trim();
        return !text.isEmpty()
                && !sentenceEnd(text)
                && spec.readingUnits(text) <= Math.max(1, spec.profile.referenceCpl * 3 / 4);
    }

    private static boolean tail(RebuildProtocol.Event event, boolean last, CaptionRenderSpec spec) {
        String text = event.text.trim();
        return !text.isEmpty()
                && (last || sentenceEnd(text))
                && spec.readingUnits(text) <= Math.max(1, spec.profile.referenceCpl * 3 / 4);
    }

    /**
     * The source runs on through this boundary: no punctuation in punctuated captions, or a
     * dependent ending (article, preposition, protected pair) in unpunctuated ones.
     */
    private static boolean continuous(
            RebuildSource source, CaptionLanguageContext context, int token, boolean punctuated) {
        if (token < 0 || token + 1 >= source.words.size()) return false;
        if (punctuated) return !punctuationEnd(source.words.get(token).text);
        return RebuildPlanner.dependentEnding(source, token, context)
                || RebuildPlanner.protectedCut(source, token, context);
    }

    private static boolean punctuated(RebuildSource source, int from, int to) {
        for (int i = Math.max(0, from); i <= to && i < source.words.size(); i++)
            if (punctuationEnd(source.words.get(i).text)) return true;
        return false;
    }

    private static boolean punctuationEnd(String word) {
        String text = word.trim();
        int end = text.length();
        while (end > 0 && CLOSING.indexOf(text.charAt(end - 1)) >= 0) end--;
        return end > 0 && ".,?!;:。，、？！；：…".indexOf(text.charAt(end - 1)) >= 0;
    }

    private static final String CONNECTIVES =
            "毕竟,所以,而且,以及,但是,然后,因此,同时,另外,不过,并且,何况,况且,也就是说,比如,例如,即,还有";

    /** True when the text stops on a connective that belongs to the clause after it. */
    private static boolean endsWithConnective(String text) {
        String value = text == null ? "" : text.trim();
        while (!value.isEmpty() && "，,、；;：:".indexOf(value.charAt(value.length() - 1)) >= 0)
            value = value.substring(0, value.length() - 1).trim();
        if (value.isEmpty()) return false;
        for (String connective : CONNECTIVES.split(",")) if (value.endsWith(connective)) return true;
        return false;
    }

    private static boolean sentenceEnd(String value) {
        String text = value.trim();
        int end = text.length();
        while (end > 0 && CLOSING.indexOf(text.charAt(end - 1)) >= 0) end--;
        return end > 0 && TERMINAL.indexOf(text.charAt(end - 1)) >= 0;
    }

    /**
     * Can a page stop here without leaving the reader mid-thought? Terminal punctuation, or a
     * sentence-final particle ("我们开始吧", "是这样的呢") closes an utterance; a bare noun or
     * conjunct ("而且", "…关注") does not.
     */
    private static boolean completeUtterance(String value) {
        String text = value.trim();
        if (text.isEmpty() || sentenceEnd(text)) return true;
        return FINAL_PARTICLES.indexOf(text.codePointBefore(text.length())) >= 0;
    }

    private static final String FINAL_PARTICLES =
            "吧呢吗嘛啊呀哦噢啦呗哈哇咯哒嗯诶欸了么ねよなわさぞぜの요다까죠네";

    /**
     * The source ends a sentence here even when the translation has no final mark. A model that
     * omits the full stop must not be mistaken for a sentence that runs on.
     */
    private static boolean sourceSentenceEnd(RebuildSource source, RebuildProtocol.Event event) {
        if (source == null || event.to < 0 || event.to >= source.words.size()) return false;
        return RebuildSource.terminal(source.words.get(event.to).text);
    }

    private static boolean clauseEnd(String value) {
        String text = value.trim();
        return !text.isEmpty() && punctuation(text.codePointBefore(text.length()));
    }

    static boolean requiresContinuation(RebuildSource source, CaptionLanguageContext context,
            RebuildProtocol.Event event) {
        if (sentenceEnd(event.text) || sourceSentenceEnd(source, event)) return false;
        return endsWithConnective(event.text)
                || RebuildPageLayout.trailingIntroduction(event.text, context.renderSpec)
                || !clauseEnd(event.text)
                        && (RebuildPlanner.dependentEnding(source, event.to, context)
                            || RebuildPlanner.protectedCut(source, event.to, context)
                            || RebuildPlanner.complementCut(source, event.to, context));
    }

    private static boolean readable(
            List<RebuildProtocol.Event> group,
            List<String> separators,
            CaptionRenderSpec spec,
            Predicate<String> fits,
            long limit) {
        long duration = group.get(group.size() - 1).end - group.get(0).start;
        String text = text(group, separators);
        int units = spec.readingUnits(text);
        // A joined page has to stay one readable subtitle: it must fit the measured two lines, run
        // no faster than a comfortable reading rate, and finish inside the wall time allowed for
        // this boundary. Nothing else caps it; the page planner decides the final pages.
        return duration > 0
                && duration <= limit
                && units * 3000L <= duration * spec.profile.referenceCps * 4
                && (fits != null
                        ? fits.test(text)
                        : RebuildPageLayout.displayHalfCells(text)
                                <= spec.profile.referenceCpl * 4);
    }

    private static List<String> separators(String[] separator, int from, int to) {
        List<String> out = new ArrayList<>(to - from);
        out.add("");
        for (int j = from + 1; j < to; j++) out.add(separator[j]);
        return out;
    }

    static String text(List<RebuildProtocol.Event> group, List<String> separators) {
        if (group.size() == 1) return group.get(0).text;
        StringBuilder out = new StringBuilder();
        for (int i = 0; i < group.size(); i++) {
            String next = group.get(i).text.trim();
            if (next.isEmpty()) continue;
            if (out.length() > 0) out.append(separators.get(i));
            out.append(next);
        }
        return out.toString();
    }

    /**
     * Chinese and Japanese get a pause separator only where neither side carries punctuation and
     * the source does not run on, so "排在第二位" + "见鬼，" does not read as one phrase while "俄罗斯拥有" +
     * "世界第二强大的军队" stays one sentence. Spaced scripts keep their word space.
     */
    /**
     * Chinese and Japanese need no gap between clauses: the clause join is carried by a zero-width
     * space instead, which stays invisible on screen but tells the page planner where one event's
     * range ends. A visible space there used to read as a hole in the middle of a sentence.
     * Spaced scripts keep their word space.
     */
    private static String separator(
            String left, String right, CaptionRenderSpec spec, boolean continuous) {
        if (left.isEmpty() || right.isEmpty()) return "";
        int before = left.codePointBefore(left.length()), after = right.codePointAt(0);
        boolean leftMark = punctuation(before), rightMark = punctuation(after);
        if (leftMark || rightMark) {
            // A spaced script keeps its word space after a comma; a compact script does not.
            return !leftMark && rightMark ? "" : spec.compactScript ? "" : " ";
        }
        if (CaptionScript.requiresSpace(before, after)) return " ";
        // Compact scripts need no visible gap. A zero-width space still marks the event join as a
        // legal page boundary when the source continues across it; it never reaches the screen.
        if (spec.compactScript && !continuous) return "\u200b";
        return "";
    }

    private static boolean punctuation(int c) {
        switch (Character.getType(c)) {
            case Character.CONNECTOR_PUNCTUATION:
            case Character.DASH_PUNCTUATION:
            case Character.START_PUNCTUATION:
            case Character.END_PUNCTUATION:
            case Character.INITIAL_QUOTE_PUNCTUATION:
            case Character.FINAL_QUOTE_PUNCTUATION:
            case Character.OTHER_PUNCTUATION:
                return true;
            default:
                return Character.isWhitespace(c);
        }
    }

    /**
     * Per-session display memory for one generation. It never re-shows source tokens of a block
     * that already reached the screen, and only lets a replacement plan take over where it
     * continues exactly after the shown text.
     */
    static final class Cursor {
        private Unit shown;
        private int block = -1, shownTo = -1;

        void reset() {
            shown = null;
            block = -1;
            shownTo = -1;
        }

        /** The unit currently on screen in this generation, or null before the first page. */
        Unit shown() {
            return shown;
        }

        Unit select(int index, List<RebuildProtocol.Event> accepted, List<Unit> units, long time) {
            if (shown != null
                    && shown.block == index
                    && shown.covers(time)
                    && contains(accepted, shown)) return shown;
            Unit unit = at(units, time);
            if (unit == null || block != index || unit.from > shownTo) return unit;
            Unit rest = after(unit, shownTo);
            return rest == null ? unit : rest;
        }

        /** Records a unit that actually reached the screen. Withheld units are not recorded. */
        void shown(Unit unit) {
            shown = unit;
            if (block != unit.block) {
                block = unit.block;
                shownTo = -1;
            }
            shownTo = Math.max(shownTo, unit.to);
        }

        boolean shownIn(int index) {
            return block == index && shownTo >= 0;
        }

        boolean onScreen(int index, long time) {
            return shown != null && shown.block == index && shown.covers(time);
        }

        /** A replacement may start only at a shared boundary after everything already shown. */
        boolean continues(int index, RebuildProtocol.Plan candidate) {
            if (!shownIn(index) || candidate.events.isEmpty()) return true;
            if (candidate.events.get(candidate.events.size() - 1).to <= shownTo) return true;
            for (RebuildProtocol.Event event : candidate.events)
                if (event.from == shownTo + 1) return true;
            return false;
        }

        boolean keepsShown(int index, RebuildProtocol.Plan candidate) {
            return shown != null && shown.block == index && contains(candidate.events, shown);
        }

        private static boolean contains(List<RebuildProtocol.Event> accepted, Unit unit) {
            for (RebuildProtocol.Event wanted : unit.events) {
                boolean found = false;
                for (RebuildProtocol.Event event : accepted)
                    if (event.from == wanted.from
                            && event.to == wanted.to
                            && event.text.equals(wanted.text)) {
                        found = true;
                        break;
                    }
                if (!found) return false;
            }
            return true;
        }
    }
}
