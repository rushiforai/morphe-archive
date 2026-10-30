package app.yydarlinker.deepseekcaptions;

import java.util.List;

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
    private RebuildDisplayPlanning planning;
    private List<RebuildSource.TimedWindow> readingPages;
    private RebuildSource readingFor;

    void configure(RebuildSource source, List<RebuildPlanner.Block> blocks,
            CaptionLanguageContext language) {
        planning = new RebuildDisplayPlanning(source, blocks, language);
    }

    void reset() { cursor.reset(); }
    boolean shownIn(int index) { return cursor.shownIn(index); }

    boolean canAdopt(int index, BlockView view, long position) {
        RebuildProtocol.Plan pending = view == null ? null : view.pending();
        return pending != null && !(cursor.onScreen(index, position) && !cursor.keepsShown(index, pending))
                && cursor.continues(index, pending);
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

    RebuildDisplayPlanning.Layout layout(int index, RebuildProtocol.Plan plan, TranslationBudget budget) {
        return planning.layout(index, plan, budget);
    }
    List<RebuildDisplayGroups.Unit> units(RebuildDisplayPlanning.Layout layout) {
        return planning.units(layout);
    }
    long[] anchors(RebuildSource source, RebuildDisplayGroups.Unit unit) {
        return source == null ? null : planning.anchors(unit);
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
                && planning.awaitingContinuation(unit, block)) {
            selected.text = translating;
            selected.status = true;
            selected.fallbackReason = "pending_continuation";
            return;
        }
        if (unit != null) {
            selected.eventId = unit.id();
            selected.eventStart = unit.start;
            selected.eventEnd = unit.end;
            selected.timeline = planning.timeline(unit);
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
}
