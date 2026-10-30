package app.yydarlinker.deepseekcaptions;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.JSONTokener;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Partial-plan salvage for a reply that fails the strict full-block parse.
 *
 * <p>A block is a batch of segments; a single unusable event must not withhold the rest. Every
 * event is checked on its own: structurally invalid, echoed, wrong-script, empty-for-speech,
 * overlapping, contradictory source-owned or collapsed events are dropped and become explicit holes; quality observations
 * (numbers, semantic anchors, sentence ends, marked pauses) are recorded but never suppress the
 * event. The returned plan is marked partial and carries the untranslated token ranges, so the
 * display can show a neutral marker over those ranges instead of an unexplained blank.
 *
 * <p>Authored tracks are salvaged like automatic ones: an event that leaves its cue is kept,
 * because {@link RebuildCueProjection} can publish it as an event page. Cue alignment never
 * decides whether a translated event is usable.
 */
final class RebuildSalvage {
    /** Issue code for a numeric mismatch: advisory, the translation is still published. */
    static final String NUMERIC_OBSERVATION = "numeric_observation";
    /** Suffix of the numeric observation detail, shared with the strict path. */
    static final String NUMERIC_ADVISORY = "; advisory, translation kept";

    private RebuildSalvage() {}

    /**
     * Returns null when no event is usable or the usable events cover less than a third of the
     * block (a likely truncated reply should be retried, not displayed as a fragment).
     */
    static RebuildProtocol.Plan parse(
            String content,
            RebuildSource s,
            RebuildPlanner.Block b,
            CaptionLanguageContext context)
            throws Exception {
        String raw = content == null ? "" : content.trim();
        if (raw.startsWith("```json\n") && raw.endsWith("```"))
            raw = raw.substring(8, raw.length() - 3).trim();
        JSONObject root;
        try {
            raw = RebuildProtocol.stripProviderEnvelope(raw);
            JSONTokener tok = new JSONTokener(raw);
            Object x = tok.nextValue();
            if (!(x instanceof JSONObject) || tok.nextClean() != 0)
                throw new RebuildProtocol.Invalid("json");
            root = (JSONObject) x;
        } catch (Exception malformed) {
            throw new RebuildProtocol.Invalid("json");
        }
        if (!b.id().equals(root.optString("block")))
            throw new RebuildProtocol.Invalid("block_identity");
        JSONArray rows = root.optJSONArray("events");
        if (rows == null || rows.length() == 0 || rows.length() > b.to - b.from + 1)
            throw new RebuildProtocol.Invalid("event_count");
        RebuildProtocol.bindQuotedEvents(root, s, b);
        List<RebuildProtocol.Event> accepted = new ArrayList<>();
        List<RebuildReview.Issue> issues = new ArrayList<>();
        List<int[]> holes = new ArrayList<>();
        int next = b.from;
        long previousEnd = Long.MIN_VALUE;
        for (int i = 0; i < rows.length(); i++) {
            JSONObject e = rows.optJSONObject(i);
            if (e == null) {
                issues.add(issue(b.from, b.to, "salvage_event_shape", "event " + i + " is not an object; dropped"));
                continue;
            }
            int from, to;
            try {
                from = RebuildProtocol.integer(e.opt("from"));
                to = RebuildProtocol.integer(e.opt("to"));
            } catch (RebuildProtocol.Invalid malformed) {
                issues.add(issue(b.from, b.to, "salvage_index_type", "event " + i + "; dropped"));
                continue;
            }
            // Overlap, reversed or out-of-block IDs cannot define an owned range; a forward jump
            // is an explicit hole and is allowed.
            if (to < from || from < b.from || to > b.to || from < next) {
                issues.add(
                        issue(
                                Math.max(b.from, Math.min(from, b.to)),
                                Math.max(b.from, Math.min(to, b.to)),
                                "salvage_source_coverage",
                                "range=" + from + "-" + to + "; expected >=" + next + "; dropped"));
                continue;
            }
            Object textValue = e.opt("text");
            if (!(textValue instanceof String)) {
                issues.add(issue(from, to, "salvage_text_type", "text is not a string; dropped"));
                holes.add(new int[] {from, to});
                next = to + 1;
                continue;
            }
            String text = normalizeText((String) textValue);
            String source = s.text(from, to);
            if (from > next) holes.add(new int[] {next, from - 1});
            next = to + 1;
            if (e.opt("source") instanceof String
                    && RebuildProtocol.quoteOverclaims(s, b, from, to, e.getString("source"))) {
                // The text may translate either the IDs or the wider quote. Keeping it under
                // the shorter time range can rush a whole paragraph, then repeat it in repair.
                issues.add(issue(from, to, "salvage_source_ownership", "wider exact quote contradicts IDs; dropped"));
                holes.add(new int[] {from, to});
                continue;
            }
            if (text.isEmpty()) {
                if (RebuildSource.nonSpeech(source)) {
                    accepted.add(
                            new RebuildProtocol.Event(
                                    from, to, s.words.get(from).start, s.words.get(to).end, ""));
                } else {
                    issues.add(
                            issue(from, to, "salvage_empty_translation", "empty text for speech; dropped"));
                    holes.add(new int[] {from, to});
                }
                continue;
            }
            if (text.contains("\"events\"") || text.startsWith("```")) {
                issues.add(issue(from, to, "salvage_protocol_leak", "reply text leaked; dropped"));
                holes.add(new int[] {from, to});
                continue;
            }
            try {
                RebuildSemantics.validateTarget(source, text, context);
            } catch (RebuildProtocol.Invalid unusable) {
                issues.add(
                        issue(
                                from,
                                to,
                                "salvage_" + unusable.code,
                                unusable.detail + "; dropped"));
                holes.add(new int[] {from, to});
                continue;
            }
            int visible = (int) text.codePoints().filter(c -> !Character.isWhitespace(c)).count();
            if (to - from >= 8 && visible <= 1) {
                issues.add(issue(from, to, "salvage_information_collapse", "too little text; dropped"));
                holes.add(new int[] {from, to});
                continue;
            }
            long a = s.words.get(from).start, z = s.words.get(to).end;
            if (z <= a || a < previousEnd) {
                issues.add(
                        issue(from, to, "salvage_time_order", "overlapping or empty window; dropped"));
                holes.add(new int[] {from, to});
                continue;
            }
            // Quality observations: never suppress the event.
            RebuildNumbers.Result numeric = RebuildNumbers.compare(source, text, context);
            if (numeric == RebuildNumbers.Result.CONTRADICTED)
                issues.add(
                        issue(
                                from,
                                to,
                                NUMERIC_OBSERVATION,
                                RebuildNumbers.detail(from, to, source, text)
                                        + NUMERIC_ADVISORY));
            else if (!context.canApplyEnglishToChinese
                    && numeric == RebuildNumbers.Result.UNKNOWN
                    && (RebuildNumbers.hasDigits(source) || RebuildNumbers.hasDigits(text)))
                issues.add(
                        issue(
                                from,
                                to,
                                "numeric_unknown",
                                "Numeric equivalence unverified for this notation; advisory only."));
            if (e.has("source")
                    && (!(e.opt("source") instanceof String)
                            || !RebuildProtocol.sameSource(source, e.getString("source"))))
                issues.add(
                        issue(
                                from,
                                to,
                                "source_quote_hint",
                                "quoted source differs; IDs are authoritative; translation kept"));
            RebuildProtocol.Event event = new RebuildProtocol.Event(from, to, a, z, text);
            try {
                RebuildSemantics.validatePlan(s, b, Collections.singletonList(event));
            } catch (RebuildProtocol.Invalid advisory) {
                issues.add(issue(from, to, "advisory_" + advisory.code, advisory.detail));
            }
            if (RebuildPlanner.strongDependentEnding(s, to, context))
                issues.add(
                        issue(
                                from,
                                to,
                                "dependent_source_end",
                                "event ends on a dependent source word; advisory only"));
            for (int k = from + 1; k <= to; k++)
                if (s.words.get(k).start - s.words.get(k - 1).end >= 650
                        || s.words.get(k).text.startsWith(">>"))
                    issues.add(
                            issue(
                                    from,
                                    to,
                                    "source_break_inside_event",
                                    "event spans a marked pause/speaker change; advisory only"));
            accepted.add(event);
            previousEnd = z;
        }
        if (accepted.isEmpty()) {
            // The reply was well formed but carried no usable translation (empty text, echo, wrong
            // script, bad timing). Do not fail the whole block: publish every token as an explicit
            // hole so the display can keep the last page and request only the current page.
            return new RebuildProtocol.Plan(
                    Collections.emptyList(),
                    root.toString(),
                    issues,
                    0,
                    true,
                    Collections.singletonList(new int[] {b.from, b.to}));
        }
        if (next <= b.to) holes.add(new int[] {next, b.to});
        List<int[]> merged = mergeHoles(holes);
        issues.addAll(RebuildReview.inspect(s, b, accepted, context));
        // Always marked salvaged, even when every token was recovered: the reply failed the strict
        // parse, so it must not be cached or displace a complete plan.
        return new RebuildProtocol.Plan(accepted, root.toString(), issues, 0, true, merged);
    }

    private static RebuildReview.Issue issue(int from, int to, String code, String detail) {
        return new RebuildReview.Issue(from, to, code, detail, false);
    }

    private static String normalizeText(String raw) {
        return raw.replace('\r', ' ').replace('\n', ' ').replaceAll("[\\t ]+", " ").trim();
    }

    /** Stable ascending, non-overlapping hole ranges. */
    private static List<int[]> mergeHoles(List<int[]> holes) {
        List<int[]> sorted = new ArrayList<>(holes);
        sorted.sort((left, right) -> Integer.compare(left[0], right[0]));
        List<int[]> out = new ArrayList<>();
        for (int[] range : sorted) {
            if (range[1] < range[0]) continue;
            if (!out.isEmpty() && range[0] <= out.get(out.size() - 1)[1] + 1) {
                int[] last = out.get(out.size() - 1);
                last[1] = Math.max(last[1], range[1]);
            } else out.add(new int[] {range[0], range[1]});
        }
        return out;
    }
}
