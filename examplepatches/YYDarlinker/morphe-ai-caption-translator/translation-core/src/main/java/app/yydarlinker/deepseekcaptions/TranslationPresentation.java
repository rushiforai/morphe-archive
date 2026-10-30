package app.yydarlinker.deepseekcaptions;

import android.text.StaticLayout;

import java.util.*;

/** Projects accepted upstream events into immutable pages without application/UI dependencies. */
final class TranslationPresentation {
    static List<CaptionDisplayPage> pages(
            String text,
            long start,
            long end,
            CaptionPresentationBudget geometry,
            CaptionRenderSpec spec) {
        return pages(text, start, end, geometry, spec, null);
    }

    static List<CaptionDisplayPage> pages(
            String text,
            long start,
            long end,
            CaptionPresentationBudget geometry,
            CaptionRenderSpec spec,
            CaptionEventTimeline sourceTimeline) {
        if (text == null || text.isEmpty() || start < 0 || end <= start) {
            return Collections.emptyList();
        }
        TranslationBudget budget =
                new TranslationBudget(
                        geometry.width, geometry.minimumPx, geometry.preferredPx, spec);
        List<RebuildPageLayout.Page> planned;
        try {
            planned = RebuildPageLayout.plan(text, start, end, budget, spec,
                    sourceTimeline == null ? null : sourceTimeline.pauses());
        } catch (RuntimeException unplannable) {
            // A malformed or provider-supplied edge case must not turn into a blank caption.
            return Collections.singletonList(fullPage(text, start, end, budget, spec));
        }
        planned = eventTimes(planned, text, start, end, spec, sourceTimeline);
        if (planned.isEmpty()) {
            return Collections.singletonList(fullPage(text, start, end, budget, spec));
        }
        List<CaptionDisplayPage> result = new ArrayList<>();
        int from = 0;
        for (RebuildPageLayout.Page page : planned) {
            if (!text.startsWith(page.text, from)) {
                // The planner must be a contiguous partition. If it is not, show the complete
                // translation rather than hiding the caption.
                return Collections.singletonList(fullPage(text, start, end, budget, spec));
            }
            int to = from + page.text.length();
            CaptionLinePlan line = linePlan(text, page.text, from, to, budget, spec);
            result.add(
                    new CaptionDisplayPage(
                            line.displayText,
                            page.start,
                            page.end,
                            from,
                            to,
                            page.timingBasis,
                            line));
            from = to;
        }
        if (from != text.length())
            return Collections.singletonList(fullPage(text, start, end, budget, spec));
        return Collections.unmodifiableList(result);
    }

    /** Preserve the chosen text pages; never redistribute one event's time across its neighbours. */
    private static List<RebuildPageLayout.Page> eventTimes(
            List<RebuildPageLayout.Page> pages, String text, long start, long end,
            CaptionRenderSpec spec, CaptionEventTimeline timeline) {
        if (timeline == null || spec.authored || !timeline.covers(text) || pages.size() < 2)
            return pages;
        long[] cuts = new long[pages.size() + 1];
        cuts[0] = start;
        cuts[pages.size()] = end;
        int[] offsets = new int[pages.size()];
        int offset = 0;
        for (int i = 1; i < pages.size(); i++) {
            offset += pages.get(i - 1).text.length();
            offsets[i] = offset;
            cuts[i] = timeline.at(text, offset, spec);
        }
        // Do not further shorten an already short page when its own event still has room.
        // Exact event seams take precedence; a fast source event cannot gain invented time.
        for (int i = 1; i < pages.size(); i++) {
            long eventEnd = timeline.interiorEnd(offsets[i]);
            long floor = Math.min(RebuildPageLayout.MIN_PAGE_MS,
                    pages.get(i - 1).end - pages.get(i - 1).start);
            long wanted = Math.max(cuts[i], cuts[i - 1] + floor);
            long nextFloor = Math.min(RebuildPageLayout.MIN_PAGE_MS,
                    pages.get(i).end - pages.get(i).start);
            if (eventEnd > wanted && wanted <= cuts[i + 1] - nextFloor) cuts[i] = wanted;
        }
        for (int i = 1; i < cuts.length; i++)
            if (cuts[i] <= cuts[i - 1]) return pages;
        List<RebuildPageLayout.Page> result = new ArrayList<>(pages.size());
        for (int i = 0; i < pages.size(); i++)
            result.add(new RebuildPageLayout.Page(pages.get(i).text, cuts[i], cuts[i + 1],
                    "ESTIMATED_EVENT_TIMING"));
        return result;
    }

    /** Last-resort single page: full text, measured only to keep the box from failing. */
    private static CaptionDisplayPage fullPage(
            String text,
            long start,
            long end,
            TranslationBudget budget,
            CaptionRenderSpec spec) {
        return new CaptionDisplayPage(
                text,
                start,
                end,
                0,
                text.length(),
                "SOURCE_EVENT",
                linePlan(text, text, 0, text.length(), budget, spec));
    }

    private static CaptionLinePlan linePlan(
            String canonical,
            String pageText,
            int from,
            int to,
            TranslationBudget budget,
            CaptionRenderSpec spec) {
        try {
            StaticLayout layout = spec.layout(pageText, budget.preferredPx, budget.width);
            int cut = layout.getLineCount() > 1 ? from + layout.getLineEnd(0) : to;
            return new CaptionLinePlan(
                    canonical,
                    from,
                    to,
                    cut,
                    layout.getLineMax(0),
                    layout.getLineCount() > 1 ? layout.getLineMax(1) : 0,
                    CaptionLinePlan.CutClass.LANGUAGE_BOUNDARY);
        } catch (RuntimeException unmeasurable) {
            // No newline means the overlay still gets the complete text; its TextView will
            // perform the final visual clamp.
            return new CaptionLinePlan(
                    canonical,
                    from,
                    to,
                    to,
                    0,
                    0,
                    CaptionLinePlan.CutClass.EMERGENCY);
        }
    }
}
