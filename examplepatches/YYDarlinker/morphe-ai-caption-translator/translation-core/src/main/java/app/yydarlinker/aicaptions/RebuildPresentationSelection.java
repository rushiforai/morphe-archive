package app.yydarlinker.aicaptions;

import java.util.List;
import java.util.function.Predicate;

/** Session-local content selection. The controller serializes every mutation with its session lock.
 * It supplies the current source facts and one read-only block, and keeps all transaction and
 * output authority. The selected result is reused and must not escape into an asynchronous guard.
 */
final class RebuildPresentationSelection {
    interface BlockView {
        RebuildProtocol.Plan accepted();
        RebuildProtocol.Plan pending();
        RebuildProtocol.Plan provisional();
        int state();
        String reason();
    }

    static final class Selected {
        String text, fallbackReason, displayEmptyReason, eventId, gapGate;
        long eventStart, eventEnd;
        CaptionEventTimeline timeline;
        int index;
        boolean status, inBlock, provisional, clearUncovered, repairPage;

        private void clear() {
            text = fallbackReason = displayEmptyReason = gapGate = "";
            eventId = "none";
            eventStart = eventEnd = -1;
            timeline = null;
            index = -1;
            status = inBlock = provisional = clearUncovered = repairPage = false;
        }
    }

    private static final long DISPLAY_HOLD_MS = 4000, DISPLAY_QUANTUM_MS = 500;
    private static final String UNAVAILABLE_MARKER = "\u2026";
    private final RebuildDisplayGroups.Cursor cursor = new RebuildDisplayGroups.Cursor();
    private final Selected selected = new Selected();
    private RebuildSource source;
    private List<RebuildPlanner.Block> blocks;
    private CaptionLanguageContext languageContext;
    private Layout[] layouts;
    private List<RebuildSource.TimedWindow> readingPages;
    private RebuildSource readingFor;

    void configure(RebuildSource source, List<RebuildPlanner.Block> blocks,
            CaptionLanguageContext language) {
        this.source = source;
        this.blocks = blocks;
        this.languageContext = language;
        this.layouts = new Layout[blocks.size()];
    }

    void reset() { cursor.reset(); }
    boolean shownIn(int index) { return cursor.shownIn(index); }

    boolean canAdopt(int index, BlockView view, long position) {
        RebuildProtocol.Plan pending = view == null ? null : view.pending();
        return cursor.canAdopt(index, pending, position);
    }

    static int blockAt(List<RebuildPlanner.Block> blocks, long time) {
        if (blocks == null) return -1;
        int lo = 0, hi = blocks.size() - 1;
        while (lo <= hi) {
            int m = (lo + hi) >>> 1;
            if (blocks.get(m).start <= time) lo = m + 1;
            else hi = m - 1;
        }
        return hi;
    }

    static boolean covers(RebuildPlanner.Block block, long time) {
        return time >= block.start && time < block.end;
    }

    long[] anchors(RebuildSource source, RebuildDisplayGroups.Unit unit) {
        return source == null ? null : anchors(unit);
    }

    /** First phase selects raw/source/status or establishes the one block to inspect. */
    Selected begin(TranslationSourceAccess.Source raw, RebuildSource source,
            List<RebuildPlanner.Block> blocks, CaptionLanguageContext language,
            boolean sourceOnly, boolean terminal, String status, boolean machineMade,
            String translating, long time, int index, BlockView view) {
        selected.clear();
        if (source == null && !status.isEmpty()) {
            selected.text = status;
            selected.status = true;
        } else if (sourceOnly) {
            CaptionDocument.Cue cue = sourceCue(raw, source, language, machineMade, time);
            if (cue != null) {
                selected.text = cue.text;
                selected.eventId = "source:" + cue.startMs + "_" + cue.endMs;
            }
        } else if (source == null && raw != null && !terminal) {
            CaptionDocument.Cue cue = originalCue(raw, source, time);
            if (cue != null) {
                selected.text = translating;
                selected.eventId = "source:raw:" + cue.startMs + "_" + cue.endMs;
                selected.eventStart = cue.startMs;
                selected.eventEnd = cue.endMs;
                selected.fallbackReason = "pending_engine";
            }
        } else if (source == null) {
            selected.text = status.isEmpty() ? translating : status;
            selected.status = true;
        } else if (terminal && (index < 0 || view.accepted() == null
                || view.accepted().events.isEmpty())) {
            selected.text = status;
            selected.status = true;
        } else {
            selected.index = index;
            selected.inBlock = index >= 0
                    && (covers(blocks.get(index), time) || cursor.onScreen(index, time));
        }
        return selected;
    }

    /** Called only after the controller has performed any allowed adoption under the same lock. */
    RebuildProtocol.Plan plan(BlockView view) {
        RebuildProtocol.Plan plan = view.accepted();
        selected.provisional = plan == null && view.provisional() != null;
        return selected.provisional ? view.provisional() : plan;
    }

    void selectBlock(TranslationSourceAccess.Source raw, RebuildSource source,
            RebuildPlanner.Block block, BlockView view, RebuildProtocol.Plan plan,
            List<RebuildDisplayGroups.Unit> units, long time, String translating) {
        int index = selected.index;
        RebuildDisplayGroups.Unit unit = plan == null ? null : cursor.select(index, plan.events, units, time);
        if (unit != null && selected.provisional && view.state() == RebuildController.RUNNING
                && unit.to == plan.events.get(plan.events.size() - 1).to
                && awaitingContinuation(unit, block)) {
            selected.text = translating;
            selected.status = true;
            selected.fallbackReason = "pending_continuation";
            return;
        }
        if (unit != null) {
            selected.eventId = unit.id();
            selected.eventStart = unit.start;
            selected.eventEnd = unit.end;
            selected.timeline = timeline(unit);
            selected.text = unit.text;
            if (selected.text.isEmpty()) selected.displayEmptyReason = "non_speech";
            if (!selected.text.isEmpty()) {
                cursor.shown(unit);
                selected.clearUncovered = true;
            }
        } else if (plan == null || selected.provisional) {
            selected.fallbackReason = unresolvedPhase(view.state(), view.reason());
            CaptionDocument.Cue cue = originalCue(raw, source, time);
            if (selected.fallbackReason.equals("pending_translation") && cue != null
                    && cue.startMs < block.end && cue.endMs > block.start) {
                selected.eventStart = Math.max(cue.startMs, block.start);
                selected.eventEnd = Math.min(cue.endMs, block.end);
                if (selected.eventStart <= time && time < selected.eventEnd) {
                    selected.text = translating;
                    selected.eventId = "waiting:" + index + ":" + selected.eventStart + "_" + selected.eventEnd;
                }
            }
            if (selected.text.isEmpty() && view.state() == RebuildController.FAILED && cue != null
                    && cue.startMs < block.end && cue.endMs > block.start) {
                selected.eventStart = Math.max(cue.startMs, block.start);
                selected.eventEnd = Math.min(cue.endMs, block.end);
                if (selected.eventStart <= time && time < selected.eventEnd) {
                    selected.text = UNAVAILABLE_MARKER;
                    selected.eventId = "unavailable:failed:" + index + ":"
                            + selected.eventStart + "_" + selected.eventEnd;
                }
            }
        } else {
            long[] hole = holeWindow(source, plan, time);
            if (hole != null) {
                selected.eventStart = hole[0];
                selected.eventEnd = hole[1];
                selected.text = UNAVAILABLE_MARKER;
                selected.eventId = "unavailable:" + index + ":" + selected.eventStart + "_" + selected.eventEnd;
            }
            selected.fallbackReason = "";
        }
    }

    boolean needsGuarantee(RebuildSource source, boolean sourceOnly, long time) {
        if (selected.status || sourceOnly || !(selected.text.isEmpty()
                || UNAVAILABLE_MARKER.equals(selected.text)
                || selected.fallbackReason.equals("pending_translation")) || source == null) return false;
        RebuildSource.TimedWindow window = source.windowAt(time);
        return window != null && !RebuildSource.nonSpeech(source.text(window.from, window.to));
    }

    /** Caller has recorded the uncovered time before applying this fallback. */
    void guarantee(RebuildSource source, long time, String translating) {
        selected.repairPage = selected.index >= 0;
        boolean uncovered = selected.text.isEmpty() || UNAVAILABLE_MARKER.equals(selected.text);
        RebuildDisplayGroups.Unit held = cursor.shown();
        boolean holdable = held != null && !held.text.trim().isEmpty()
                && time < held.end + DISPLAY_HOLD_MS;
        if (!uncovered) return;
        if (holdable) {
            long until = Math.max(time + DISPLAY_QUANTUM_MS,
                    ((time / DISPLAY_QUANTUM_MS) + 1) * DISPLAY_QUANTUM_MS);
            selected.text = held.text;
            selected.eventStart = held.start;
            selected.eventEnd = Math.max(until, held.end);
            selected.eventId = "hold:" + selected.index + ":" + held.from + "-" + held.to
                    + ":" + (selected.eventEnd / DISPLAY_QUANTUM_MS);
            selected.fallbackReason = selected.displayEmptyReason = "";
            selected.gapGate = "hold";
        } else if (selected.text.isEmpty()) {
            RebuildSource.TimedWindow window = source.windowAt(time);
            selected.eventStart = window == null ? time : Math.max(window.start, time);
            selected.eventEnd = window == null ? time + DISPLAY_QUANTUM_MS : window.end;
            if (selected.eventEnd <= selected.eventStart) selected.eventEnd = selected.eventStart + DISPLAY_QUANTUM_MS;
            selected.text = translating;
            selected.fallbackReason = "pending_translation";
            selected.eventId = "ensure:" + selected.index + ":" + (time / DISPLAY_QUANTUM_MS);
            selected.gapGate = "placeholder";
        } else selected.gapGate = "marker";
    }

    private static String unresolvedPhase(int state, String reason) {
        if (state == RebuildController.READY) return "";
        return state == RebuildController.FAILED ? "failed:" + reason : "pending_translation";
    }

    private static long[] holeWindow(RebuildSource source, RebuildProtocol.Plan plan, long time) {
        if (source == null || plan == null || !plan.partial || plan.holes.isEmpty()) return null;
        int size = source.words.size();
        for (int[] hole : plan.holes) {
            int from = Math.max(0, Math.min(hole[0], size - 1));
            int to = Math.max(0, Math.min(hole[1], size - 1));
            if (to < from) continue;
            long start = source.words.get(from).start, end = source.words.get(to).end;
            if (time >= start && time < end) return new long[] {start, end};
        }
        return null;
    }

    private static CaptionDocument.Cue originalCue(TranslationSourceAccess.Source raw,
            RebuildSource source, long time) {
        if (source != null) {
            RebuildSource.TimedWindow window = source.windowAt(time);
            if (window != null) return new CaptionDocument.Cue(window.start, window.end,
                    source.text(window.from, window.to));
        }
        if (raw == null) return null;
        CaptionDocument.Cue latest = null;
        for (CaptionDocument.Cue cue : raw.document.cues())
            if (time >= cue.startMs && time < cue.endMs
                    && (latest == null || cue.startMs >= latest.startMs)) latest = cue;
        return latest;
    }

    private static CaptionDocument.Cue authoredCue(TranslationSourceAccess.Source raw,
            RebuildSource source, long time) {
        if (raw == null) return originalCue(raw, source, time);
        CaptionDocument.Cue current = null, next = null;
        for (CaptionDocument.Cue cue : raw.document.cues()) {
            if (time >= cue.startMs && time < cue.endMs) {
                if (current == null || cue.startMs >= current.startMs) current = cue;
            } else if (cue.startMs > time && (next == null || cue.startMs < next.startMs)) next = cue;
        }
        CaptionDocument.Cue shown = current;
        if (shown == null && next != null) {
            CaptionDocument.Cue before = null;
            for (CaptionDocument.Cue cue : raw.document.cues())
                if (cue.endMs <= time && (before == null || cue.endMs > before.endMs)) before = cue;
            if (before != null && next.startMs - before.endMs < RebuildDisplayGroups.HOLD_MS) shown = before;
        }
        if (shown == null) return null;
        String text = shown.text.replaceAll("[\u200B\u2060\uFEFF]", "").trim();
        return text.isEmpty() ? null : new CaptionDocument.Cue(shown.startMs, shown.endMs, text);
    }

    private CaptionDocument.Cue sourceCue(TranslationSourceAccess.Source raw, RebuildSource source,
            CaptionLanguageContext language, boolean machineMade, long time) {
        if (source == null) return originalCue(raw, source, time);
        if (!machineMade) return authoredCue(raw, source, time);
        if (readingPages == null || readingFor != source) {
            readingPages = SourceReadingWindows.build(source, language.renderSpec, language);
            readingFor = source;
        }
        RebuildSource.TimedWindow page = SourceReadingWindows.at(readingPages, time);
        if (page == null) {
            RebuildSource.TimedWindow before = SourceReadingWindows.before(readingPages, time);
            RebuildSource.TimedWindow next = SourceReadingWindows.after(readingPages, time);
            if (before != null && next != null && next.start - before.end < RebuildDisplayGroups.HOLD_MS) page = before;
        }
        return page == null ? null : new CaptionDocument.Cue(page.start, page.end,
                source.text(page.from, page.to));
    }

    private record Layout(RebuildProtocol.Plan plan, String geometry,
            List<RebuildDisplayGroups.Unit> units) {}

    /** Project each plan once for this geometry; notify the caller only on a cache miss. */
    List<RebuildDisplayGroups.Unit> units(int index, RebuildProtocol.Plan plan,
            CaptionPresentationBudget budget, java.util.function.Consumer<RebuildCueProjection.Result> onMiss) {
        CaptionRenderSpec spec = languageContext.renderSpec;
        CaptionRenderSpec measured = budget != null && budget.renderSpec != null
                && budget.renderSpec.targetCode.equals(spec.targetCode) ? budget.renderSpec : spec;
        String geometry = budget == null ? "" : budget.width + ":"
                + Float.floatToIntBits(budget.preferredPx) + ":" + measured.measurementKey();
        Layout cached = layouts[index];
        if (cached != null && cached.plan == plan && cached.geometry.equals(geometry))
            return cached.units;

        RebuildPlanner.Block block = blocks.get(index);
        if (block.authored) {
            RebuildCueProjection.Result projection =
                    RebuildCueProjection.project(index, source, block, plan.events, languageContext);
            onMiss.accept(projection);
            if (!projection.units.isEmpty())
                layouts[index] = new Layout(plan, geometry, projection.units);
            return projection.units;
        }
        onMiss.accept(null);
        Predicate<String> fits = budget == null ? null
                : value -> measured.fits(value, budget.preferredPx, budget.width, 2);
        List<RebuildDisplayGroups.Unit> units =
                RebuildDisplayGroups.partition(index, plan.events, source, languageContext, fits, null);
        layouts[index] = new Layout(plan, geometry, units);
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
