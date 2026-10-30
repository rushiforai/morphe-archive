package app.yydarlinker.deepseekcaptions;

import java.util.List;
import java.util.function.Predicate;

/** Display planning context and per-block geometry cache. Called under the session's lock.
 * Has no lifecycle, output, logging or publication authority.
 */
final class RebuildDisplayPlanning {
    private final RebuildSource source;
    private final List<RebuildPlanner.Block> blocks;
    private final CaptionLanguageContext languageContext;
    private final Layout[] layouts;

    RebuildDisplayPlanning(RebuildSource source, List<RebuildPlanner.Block> blocks,
            CaptionLanguageContext languageContext) {
        this.source = source;
        this.blocks = blocks;
        this.languageContext = languageContext;
        this.layouts = new Layout[blocks.size()];
    }

    /** A miss becomes the cache slot after units are consumed; hits reuse this same object.
     * Projection facts are read-only so the caller can preserve its diagnostic ordering.
     */
    static final class Layout {
        private final int index;
        private final RebuildProtocol.Plan plan;
        private final String geometry;
        private final CaptionRenderSpec measured;
        private final TranslationBudget budget;
        final RebuildCueProjection.Result projection;
        private List<RebuildDisplayGroups.Unit> units;

        private Layout(int index, RebuildProtocol.Plan plan, String geometry,
                CaptionRenderSpec measured, TranslationBudget budget,
                RebuildCueProjection.Result projection) {
            this.index = index;
            this.plan = plan;
            this.geometry = geometry;
            this.measured = measured;
            this.budget = budget;
            this.projection = projection;
        }

        List<RebuildDisplayGroups.Unit> cachedUnits() { return units; }
    }

    /** Lookup computes only the original key on hits, with no hit DTO or source/plan copies.
     * Authored projection precedes diagnostics; automatic partition follows diagnostics in units().
     */
    Layout layout(int index, RebuildProtocol.Plan plan, TranslationBudget budget) {
        CaptionRenderSpec spec = languageContext.renderSpec;
        CaptionRenderSpec measured =
                budget != null
                                && budget.renderSpec != null
                                && budget.renderSpec.targetCode.equals(spec.targetCode)
                        ? budget.renderSpec
                        : spec;
        String geometry =
                budget == null
                        ? ""
                        : budget.width
                                + ":"
                                + Float.floatToIntBits(budget.preferredPx)
                                + ":"
                                + measured.measurementKey();
        Layout cached = layouts[index];
        if (cached != null && cached.plan == plan && cached.geometry.equals(geometry))
            return cached;
        RebuildCueProjection.Result projection = blocks.get(index).authored
                ? RebuildCueProjection.project(index, source, blocks.get(index), plan.events,
                        languageContext)
                : null;
        return new Layout(index, plan, geometry, measured, budget, projection);
    }

    /** Complete a miss and publish its single cache slot after the caller's miss diagnostics. */
    List<RebuildDisplayGroups.Unit> units(Layout layout) {
        if (layout.units != null) return layout.units;
        List<RebuildDisplayGroups.Unit> units;
        if (layout.projection != null) {
            units = layout.projection.units;
        } else {
            // A joined unit may use two lines; pagination still prefers one-line clauses.
            TranslationBudget budget = layout.budget;
            Predicate<String> fits = budget == null ? null
                    : value -> layout.measured.fits(value, budget.preferredPx, budget.width, 2);
            units = RebuildDisplayGroups.partition(layout.index, layout.plan.events, source,
                    languageContext, fits, null);
        }
        layout.units = units;
        // Empty authored projections were never cached; automatic empty results still are.
        if (layout.projection == null || !units.isEmpty()) layouts[layout.index] = layout;
        return units;
    }

    /**
     * Real speech boundaries inside one display unit: a word end followed by a pause or a clause
     * mark. Page turns use these instead of character counts when the source has word timing.
     */
    long[] anchors(RebuildDisplayGroups.Unit unit) {
        if (source == null || unit == null || unit.end <= unit.start) return null;
        java.util.List<Long> anchors = new java.util.ArrayList<>();
        int from = Math.max(0, unit.from), to = Math.min(source.words.size() - 1, unit.to);
        long last = -1;
        for (int i = from; i <= to && anchors.size() < 64; i++) {
            RebuildSource.Word word = source.words.get(i);
            boolean pause =
                    i > from && word.start - source.words.get(i - 1).end >= 220;
            boolean clause = word.text != null && endsClauseMark(word.text.trim());
            if (!pause && !clause) continue;
            long at = word.end;
            if (at <= unit.start + RebuildPageLayout.MIN_PAGE_MS
                    || at >= unit.end - RebuildPageLayout.MIN_PAGE_MS
                    || at <= last + 80) continue;
            anchors.add(at);
            last = at;
        }
        if (anchors.isEmpty()) return null;
        long[] out = new long[anchors.size()];
        for (int i = 0; i < out.length; i++) out[i] = anchors.get(i);
        return out;
    }

    private static boolean endsClauseMark(String text) {
        if (text == null || text.isEmpty()) return false;
        char last = text.charAt(text.length() - 1);
        return "，。！？；：,!?;:".indexOf(last) >= 0 || RebuildSource.terminal(text);
    }

    CaptionEventTimeline timeline(RebuildDisplayGroups.Unit unit) {
        // Authored projection has its own cue contract. Single events retain their original pager.
        if (blocks.get(unit.block).authored || unit.events.size() < 2)
            return new CaptionEventTimeline(new int[]{0}, new long[0], new long[0], anchors(unit));
        int count = unit.events.size(), at = 0;
        int[] offsets = new int[count + 1];
        long[] starts = new long[count], ends = new long[count];
        for (int i = 0; i < count; i++) {
            RebuildProtocol.Event event = unit.events.get(i);
            offsets[i] = at;
            at += unit.separators.get(i).length() + event.text.trim().length();
            starts[i] = event.start;
            ends[i] = event.end;
        }
        offsets[count] = at;
        return new CaptionEventTimeline(offsets, starts, ends, anchors(unit));
    }

    boolean awaitingContinuation(RebuildDisplayGroups.Unit unit, RebuildPlanner.Block block) {
        if (block.authored || unit.to >= block.to || unit.events.isEmpty()
                || unit.text.trim().isEmpty()) return false;
        RebuildProtocol.Event last = unit.events.get(unit.events.size() - 1);
        return !RebuildPlanner.hardBreakBefore(source, last.to + 1)
                && source.words.get(last.to + 1).start - last.end < RebuildDisplayGroups.MAX_BRIDGE_MS
                && RebuildDisplayGroups.requiresContinuation(source, languageContext, last);
    }

}
