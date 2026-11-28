package app.yydarlinker.aicaptions;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Display projection for a manually authored track: turn a validated reply into pages.
 *
 * <p>A page is what the viewer sees at one instant. The reply's events are only the transport of
 * translated text over source tokens; their boundaries are decided by the model and are not an
 * identity of the author's cue. This class therefore has two tiers:
 *
 * <ol>
 *   <li><b>Cue pages</b> — for every authored cue group that is exactly tiled by consecutive
 *       events, one page whose window is the cue window. This is the preferred presentation and
 *       keeps the author's paging.
 *   <li><b>Event pages</b> — every event not used by a cue page becomes its own page, with the
 *       event's own source window. Text is never split, duplicated or dropped. This tier is what
 *       makes a complete translation displayable even when the model merged or split a sentence
 *       across the author's cue boundaries.
 * </ol>
 *
 * <p>The two tiers are disjoint by construction: a group that is exactly tiled cannot overlap an
 * event that leaves the group, because events never overlap. Pages are returned in source order,
 * never overlap, and a gap shorter than {@link RebuildDisplayGroups#HOLD_MS} is held by extending
 * the previous page instead of blanking the box.
 */
final class RebuildCueProjection {
    /** The projection result plus the tier counts used by diagnostics. */
    static final class Result {
        final List<RebuildDisplayGroups.Unit> units;
        final int groups;
        final int cuePages;
        final int eventPages;

        Result(List<RebuildDisplayGroups.Unit> units, int groups, int cuePages, int eventPages) {
            this.units = Collections.unmodifiableList(new ArrayList<>(units));
            this.groups = groups;
            this.cuePages = cuePages;
            this.eventPages = eventPages;
        }
    }

    private RebuildCueProjection() {}

    /**
     * Projects a validated reply onto display pages. Never rejects and never returns an empty page
     * for a non-empty event, so a translation that arrived is always displayable.
     */
    static Result project(
            int blockIndex,
            RebuildSource source,
            RebuildPlanner.Block block,
            List<RebuildProtocol.Event> events,
            CaptionLanguageContext context) {
        List<RebuildPlanner.Block.CueRange> groups = RebuildCueContract.groups(source, block);
        if (events.isEmpty()) return new Result(Collections.emptyList(), groups.size(), 0, 0);

        boolean[] used = new boolean[events.size()];
        List<RebuildDisplayGroups.Unit> units = new ArrayList<>();
        int cuePages = 0;
        for (RebuildPlanner.Block.CueRange group : groups) {
            List<Integer> owned = tile(events, group);
            if (owned == null) continue;
            List<RebuildProtocol.Event> page = new ArrayList<>(owned.size());
            for (int index : owned) {
                used[index] = true;
                page.add(events.get(index));
            }
            units.add(RebuildCueContract.unit(blockIndex, group, page, context));
            cuePages++;
        }

        int eventPages = 0;
        for (int i = 0; i < events.size(); i++) {
            if (used[i]) continue;
            RebuildProtocol.Event event = events.get(i);
            units.add(
                    new RebuildDisplayGroups.Unit(
                            blockIndex,
                            Collections.singletonList(event),
                            Collections.singletonList(""),
                            event.end,
                            false));
            eventPages++;
        }

        units.sort(
                Comparator.comparingLong((RebuildDisplayGroups.Unit unit) -> unit.start)
                        .thenComparingInt(unit -> unit.from));
        return new Result(normalize(units), groups.size(), cuePages, eventPages);
    }

    /**
     * The indexes of the consecutive events that exactly tile the group, or null. "Exactly" means
     * the first starts at the group start, every event continues the previous one, and the last
     * ends at the group end. A group covered only partially or contained in a larger event is not
     * a cue page; its text is published by the event pages instead.
     */
    private static List<Integer> tile(
            List<RebuildProtocol.Event> events, RebuildPlanner.Block.CueRange group) {
        List<Integer> owned = new ArrayList<>();
        int next = group.from;
        for (int i = 0; i < events.size(); i++) {
            RebuildProtocol.Event event = events.get(i);
            if (event.from < group.from || event.to > group.to) continue;
            if (event.from != next) return null;
            owned.add(i);
            next = event.to + 1;
        }
        if (owned.isEmpty() || next != group.to + 1) return null;
        return owned;
    }

    /**
     * Source-ordered, non-overlapping pages. A short gap between two pages is filled by extending
     * the earlier page to the next start, so a cue boundary or a fragment join does not blank the
     * box for a few hundred milliseconds.
     */
    private static List<RebuildDisplayGroups.Unit> normalize(
            List<RebuildDisplayGroups.Unit> units) {
        if (units.isEmpty()) return units;
        List<RebuildDisplayGroups.Unit> out = new ArrayList<>(units.size());
        for (int i = 0; i < units.size(); i++) {
            RebuildDisplayGroups.Unit unit = units.get(i);
            long end = unit.end;
            if (i + 1 < units.size()) {
                long next = units.get(i + 1).start;
                if (end > next) end = next;
                else if (next - end < RebuildDisplayGroups.HOLD_MS) end = next;
            }
            out.add(
                    end == unit.end
                            ? unit
                            : new RebuildDisplayGroups.Unit(
                                    unit.block, unit.events, unit.separators, end, unit.blocked));
        }
        return out;
    }
}

/**
 * The authored-cue display contract.
 *
 * <p>A manually authored cue is the preferred display boundary. Translation quality is decided on
 * sentence/clause events by the same protocol and review as an automatic track; the cue contract
 * only decides whether the author's paging can be kept. {@link RebuildCueProjection} uses it as
 * tier 1 and falls back to event pages when the reply does not tile every cue, so an event that
 * leaves its cue is a presentation fact, never a reason to withhold text.
 *
 * <p>This is deliberately separate from {@link RebuildDisplayGroups}: automatic tracks may merge
 * and split events for readability, whereas an authored cue page never leaves its cue; an event
 * that does leave it is published as its own event page instead.
 */
final class RebuildCueContract {
    /**
     * v3: cue pages are the preferred tier and event pages guarantee display, so a cached authored
     * reply may now carry events that leave a cue; the request guidance also changed from "must"
     * to "prefer". The version participates in the cache identity.
     */
    static final String VERSION = "authored-cue-v3";

    /**
     * A cue shorter than this cannot be a page of its own: the author split a conjunction, a
     * particle, or a sentence fragment into a display event that carries no readable content.
     * Such a cue is merged with its continuation before the request is built, so the model is not
     * asked to honour a boundary no reader could follow.
     */
    static final long MIN_GROUP_MS = 1200;

    private RebuildCueContract() {}

    /**
     * The display groups of one authored block: each is either one complete cue or a run of
     * fragment cues that only read together (Japanese 「が」 + 「しかし」, a 425 ms 「另一方面，」,
     * a word split across two upload cues). The author's substantive cues stay one group each.
     */
    static List<RebuildPlanner.Block.CueRange> groups(
            RebuildSource source, RebuildPlanner.Block block) {
        List<RebuildPlanner.Block.CueRange> out = new ArrayList<>();
        for (RebuildPlanner.Block.CueRange cue : block.cues) {
            if (out.isEmpty()) {
                out.add(cue);
                continue;
            }
            RebuildPlanner.Block.CueRange previous = out.get(out.size() - 1);
            if (mergeable(source, previous, cue)) {
                out.set(out.size() - 1, merge(previous, cue));
            } else {
                out.add(cue);
            }
        }
        if (out.size() > 1) {
            RebuildPlanner.Block.CueRange last = out.get(out.size() - 1);
            if (fragment(source, last)) {
                RebuildPlanner.Block.CueRange previous = out.get(out.size() - 2);
                out.set(out.size() - 2, merge(previous, last));
                out.remove(out.size() - 1);
            }
        }
        return Collections.unmodifiableList(out);
    }

    private static boolean mergeable(
            RebuildSource source,
            RebuildPlanner.Block.CueRange previous,
            RebuildPlanner.Block.CueRange next) {
        if (!fragment(source, previous)) return false;
        if (RebuildPlanner.hardBreakBefore(source, next.from)) return false;
        long start = previous.start, end = next.end;
        if (end - start > 20_000) return false;
        if (source.text(previous.from, next.to).length() > 600) return false;
        return true;
    }

    /**
     * A fragment group has no sentence end and is either too short in time or too short in visible
     * characters to stand as a page. It merges forward into its continuation; the last group of a
     * block merges backward.
     */
    private static boolean fragment(
            RebuildSource source, RebuildPlanner.Block.CueRange group) {
        String text = source.text(group.from, group.to);
        if (terminal(text)) return false;
        int visible = visible(text);
        if (visible <= 2) return true;
        if (allFunctionWords(text)) return true;
        return group.end - group.start < MIN_GROUP_MS / 2;
    }

    /** True when every token is a particle/connective, e.g. 「がしかし」. */
    private static boolean allFunctionWords(String text) {
        if (RebuildPlanner.functionWordsOnly(text)) return true;
        java.util.List<String> tokens = RebuildSource.tokens(text);
        if (tokens.isEmpty()) return false;
        for (String token : tokens) if (!RebuildPlanner.functionWord(token)) return false;
        return true;
    }

    private static boolean terminal(String text) {
        String value = text == null ? "" : text.trim();
        int end = value.length();
        while (end > 0 && "”’\"'」』）)]》】".indexOf(value.charAt(end - 1)) >= 0) end--;
        if (end == 0) return false;
        char last = value.charAt(end - 1);
        return "。！？!?；;…".indexOf(last) >= 0
                || RebuildSource.terminal(value.substring(0, end));
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

    private static RebuildPlanner.Block.CueRange merge(
            RebuildPlanner.Block.CueRange previous, RebuildPlanner.Block.CueRange next) {
        return new RebuildPlanner.Block.CueRange(
                previous.index, previous.from, next.to, previous.start, next.end);
    }

    /**
     * The authored part of a translation request. The prompt names the fixed display groups; this
     * data gives their exact token ranges and source text so the model can keep every event inside
     * one group.
     */
    static void addPayload(
            JSONObject payload, RebuildSource source, RebuildPlanner.Block block)
            throws org.json.JSONException {
        JSONArray cues = new JSONArray();
        for (RebuildPlanner.Block.CueRange cue : groups(source, block))
            cues.put(
                    new JSONObject()
                            .put("cue", cue.index)
                            .put("from", cue.from)
                            .put("to", cue.to)
                            .put("start_ms", cue.start)
                            .put("end_ms", cue.end)
                            .put("source", source.text(cue.from, cue.to)));
        payload.put("authored", true).put("display_cues", cues);
        widenContext(payload, source, block);
    }

    private static RebuildPlanner.Block.CueRange groupAt(
            List<RebuildPlanner.Block.CueRange> groups, int token) {
        for (RebuildPlanner.Block.CueRange group : groups)
            if (token >= group.from && token <= group.to) return group;
        return null;
    }

    /** One cue group page: several events concatenated, window = the group's own window. */
    static RebuildDisplayGroups.Unit unit(
            int blockIndex,
            RebuildPlanner.Block.CueRange group,
            List<RebuildProtocol.Event> owned,
            CaptionLanguageContext context) {
        List<String> separators = new ArrayList<>(owned.size());
        separators.add("");
        for (int i = 1; i < owned.size(); i++)
            separators.add(
                    separator(owned.get(i - 1).text, owned.get(i).text, context.renderSpec));
        return new RebuildDisplayGroups.Unit(blockIndex, owned, separators, group.end, false);
    }

    static String summary(
            RebuildSource source, RebuildPlanner.Block block, List<RebuildProtocol.Event> events) {
        if (!block.authored) return "cues=0";
        List<RebuildPlanner.Block.CueRange> groups = groups(source, block);
        Map<Integer, Integer> counts = new LinkedHashMap<>();
        for (RebuildProtocol.Event event : events) {
            RebuildPlanner.Block.CueRange group = groupAt(groups, event.from);
            if (group != null) counts.put(group.index, counts.getOrDefault(group.index, 0) + 1);
        }
        StringBuilder out =
                new StringBuilder("cues=")
                        .append(block.cues.size())
                        .append(";groups=")
                        .append(groups.size())
                        .append(";events_per_group=");
        boolean first = true;
        for (RebuildPlanner.Block.CueRange group : groups) {
            if (!first) out.append(',');
            first = false;
            out.append(group.index).append(':').append(counts.getOrDefault(group.index, 0));
        }
        return out.toString();
    }

    private static String separator(
            String left, String right, CaptionRenderSpec spec) {
        String a = left == null ? "" : left.trim();
        String b = right == null ? "" : right.trim();
        if (a.isEmpty() || b.isEmpty()) return "";
        if (CaptionScript.requiresSpace(a.codePointBefore(a.length()), b.codePointAt(0)))
            return " ";
        // An invisible event join is still a legal page cut for an overflowing cue.
        return spec.compactScript ? "\u200b" : "";
    }

    /** Cue-sized requests need the sentence around them; the cue is the unit, not the context. */
    private static final int CONTEXT_TOKENS = 600;

    /**
     * A manually authored cue is a line of a sentence, so translating it alone loses the references
     * that make it accurate. The reply is still limited to the block's own tokens, but the model
     * gets the surrounding cues as read-only context, which is what a whole-block request used to
     * give.
     */
    static void widenContext(
            org.json.JSONObject payload, RebuildSource source, RebuildPlanner.Block block)
            throws org.json.JSONException {
        int last = source.words.size() - 1;
        payload.put(
                "context_before",
                RebuildPlanner.context(
                        source, Math.max(0, block.from - CONTEXT_TOKENS), block.from - 1));
        payload.put(
                "context_after",
                RebuildPlanner.context(
                        source, block.to + 1, Math.min(last, block.to + CONTEXT_TOKENS)));
    }
}
