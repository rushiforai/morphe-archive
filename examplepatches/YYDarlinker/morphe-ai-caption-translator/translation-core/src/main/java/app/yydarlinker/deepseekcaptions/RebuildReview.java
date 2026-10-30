package app.yydarlinker.deepseekcaptions;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.function.Predicate;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Bounded, advisory fidelity review with targeted repair candidates. */
final class RebuildReview {
    static final int MAX_SESSION_REPAIRS = 6;
    static final int MAX_SEMANTIC_ATTEMPTS = 3; // Initial translation plus two repairs.

    static final class Issue {
        final int from, to;
        final String code, detail;
        final boolean repair;

        Issue(int f, int t, String c, String d, boolean r) {
            from = f;
            to = t;
            code = c;
            detail = d;
            repair = r;
        }

        String describe() {
            return code + " range=" + from + "-" + to + ": " + detail;
        }
    }

    static List<Issue> inspect(
            RebuildSource s, RebuildPlanner.Block b, List<RebuildProtocol.Event> events) {
        return inspect(s, b, events, CaptionLanguageContext.LEGACY);
    }

    static List<Issue> inspect(
            RebuildSource s,
            RebuildPlanner.Block b,
            List<RebuildProtocol.Event> events,
            CaptionLanguageContext context) {
        List<Issue> out = new ArrayList<>();
        int shortEvents = 0, fragmentaryRepairEvents = 0;
        for (RebuildProtocol.Event e : events) {
            String source = s.text(e.from, e.to), text = e.text;
            boolean zh = context.canApplyEnglishToChinese && RebuildSemantics.chinese(text);
            int words = source.split("\\s+").length;
            long han =
                    text.codePoints()
                            .filter(
                                    c ->
                                            Character.UnicodeScript.of(c)
                                                    == Character.UnicodeScript.HAN)
                            .count();
            int visible = (int) text.codePoints().filter(c -> !Character.isWhitespace(c)).count();
            boolean english = context.englishSource;
            if (words <= 6 || han <= 7) shortEvents++;
            boolean compressed = english && zh && words >= 24 && han < words * .8;
            boolean negative =
                    RebuildSemantics.has("\\b(?:cannot|can't|couldn't|won't|never)\\b", source);
            boolean translatedNegative = RebuildSemantics.has("不|没|未|无|難|难|非|勿|否|休想|别想", text);
            if (compressed && negative && !translatedNegative)
                out.add(
                        new Issue(
                                e.from,
                                e.to,
                                "possible_omission",
                                "Source contains a negative conclusion but this short translation"
                                    + " may omit it. Re-read every predicate, object, condition and"
                                    + " modality; retain the conclusion without summarizing.",
                                true));
            else if (compressed)
                out.add(
                        new Issue(
                                e.from,
                                e.to,
                                "compression_watch",
                                "Unusually short translation for this source; not proof of"
                                    + " omission.",
                                false));
            if (english
                    && zh
                    && RebuildSemantics.has("(?i)(?:aren't|isn't|not) always", source)
                    && RebuildSemantics.has("通常不|一般不|往往不", text))
                out.add(
                        new Issue(
                                e.from,
                                e.to,
                                "possible_polarity_change",
                                "Not always means not in every case, not usually not. Preserve the"
                                    + " quantifier scope.",
                                true));
            boolean likelyIncomplete = english && incompleteSourceEnd(source);
            boolean connectorFragment =
                    english
                            && source.trim()
                                    .toLowerCase(Locale.ROOT)
                                    .matches("(?:and|but|then|well)\\b.*")
                            && (han <= 6 || visible <= 8);
            if (english
                    && zh
                    && words >= 3
                    && e.end - e.start < 1800
                    && han <= 4
                    && (likelyIncomplete || connectorFragment)) {
                out.add(
                        new Issue(
                                e.from,
                                e.to,
                                "fragmentary_translation",
                                "Source ends or begins at a grammatical dependency, while the"
                                    + " translation is too short to carry the predicate and its"
                                    + " argument. Join it with a coherent neighboring source range;"
                                    + " do not split target text to create times.",
                                true));
                fragmentaryRepairEvents++;
            } else if (english && zh && han <= 2 && words >= 3 && e.end - e.start < 1800)
                out.add(
                        new Issue(
                                e.from,
                                e.to,
                                "fragmentary_translation",
                                "Very short translation for multiple source words. Check that the"
                                    + " predicate and its argument have not been lost; join only by"
                                    + " reassigning coherent source ranges.",
                                false));
            else if (english && zh && han <= 2 && words >= 2 && e.end - e.start < 1000)
                out.add(
                        new Issue(
                                e.from,
                                e.to,
                                "micro_event_watch",
                                "Sub-second isolated discourse marker; inspect neighboring"
                                    + " source/target continuity without assuming omission.",
                                false));
            if (english && zh && words >= 25 && han >= 32 && e.end - e.start >= 8000)
                out.add(
                        new Issue(
                                e.from,
                                e.to,
                                "dense_long_event_watch",
                                "Long multi-clause caption; verify readable timing and coherent"
                                    + " source boundaries at the preferred font.",
                                false));
            if (e.to < b.to && RebuildPlanner.protectedCut(s, e.to, context))
                out.add(
                        new Issue(
                                e.from,
                                e.to,
                                "dependent_boundary",
                                "Boundary may split a noun phrase, comparison or subject+verb."
                                    + " Reassign coherent SOURCE ranges, then translate each whole"
                                    + " range; never divide target text to create times.",
                                true));
            // The translation closes a sentence the source has not finished: this is how a long
            // comparison loses its second half and comes out ungrammatical. Advisory only: the
            // prompt now states the same rule, and a repair request costs a full block of tokens.
            if (e.to < b.to && !RebuildSource.terminal(s.words.get(e.to).text)
                    && endsSentence(text)
                    && (continuesAfter(s, e.to)
                            || RebuildPlanner.dependentEnding(s, e.to, context)
                            || RebuildPlanner.protectedCut(s, e.to, context)))
                out.add(
                        new Issue(
                                e.from,
                                e.to,
                                "invented_sentence_end",
                                "The source sentence continues past this range, but the translation"
                                    + " ends it here. Keep one event per complete source sentence,"
                                    + " or split where each side keeps its subject and predicate.",
                                false));

            Matcher adjacent = Pattern.compile("\\b(\\d{1,3}) (\\d{1,2})\\b").matcher(source);
            if (adjacent.find()) {
                out.add(
                        new Issue(
                                e.from,
                                e.to,
                                "source_number_ambiguity",
                                "Adjacent source numbers; do not silently invent a range or model"
                                    + " identifier.",
                                false));
            }
            if (out.size() >= 16) break;
        }
        int totalWords = Math.max(1, b.to - b.from + 1);
        double average = (double) totalWords / Math.max(1, events.size());
        if (out.size() < 16
                && events.size() >= 9
                && average < 9.0
                && shortEvents * 100 >= events.size() * 60) {
            boolean repair = fragmentaryRepairEvents > 0 || events.size() >= 14;
            out.add(
                    new Issue(
                            b.from,
                            b.to,
                            "fragmented_plan",
                            "The block is over-segmented into many short events. Prefer fewer"
                                + " clause-complete events; never split discourse markers,"
                                + " auxiliaries, or complements merely to follow estimated word"
                                + " times.",
                            repair));
        }
        return Collections.unmodifiableList(out);
    }

    private static boolean incompleteSourceEnd(String source) {
        String t = source.trim().toLowerCase(Locale.ROOT);
        return t.matches(
                "(?s).*\\b(?:have|has|had|is|are|was|were|be|been|being|will|would|can|could|should|might|must|and|or|but|because|if|while|that|which|who|than|then|with|of|to|for|from|in|on|at|by|as|after|before|every|a|an|the|more|less|not)\\b");
    }

    static RebuildProtocol.Plan withLayoutReview(
            RebuildProtocol.Plan plan, Predicate<String> fits) {
        if (fits == null) return plan;
        List<Issue> all = new ArrayList<>(plan.issues);
        for (RebuildProtocol.Event e : plan.events)
            if (!fits.test(e.text)) {
                all.add(
                        new Issue(
                                e.from,
                                e.to,
                                "layout_overflow",
                                "This event does not fit the current measured caption budget; keep"
                                    + " the complete event as an advisory; no paid semantic"
                                    + " repair.",
                                false));
            }
        return all.size() == plan.issues.size()
                ? plan
                : new RebuildProtocol.Plan(
                        plan.events, plan.json, all, plan.reboundEvents, plan.partial, plan.holes);
    }

    static RebuildProtocol.Plan withLayoutReview(
            RebuildProtocol.Plan plan, TranslationBudget budget) {
        if (budget == null) return plan;
        List<Issue> all = new ArrayList<>(plan.issues);
        for (RebuildProtocol.Event e : plan.events)
            if (!budget.canPresent(e))
                all.add(
                        new Issue(
                                e.from,
                                e.to,
                                "layout_overflow",
                                "The complete event exceeds the bounded page/time budget at the"
                                    + " preferred font; retain its source and text; advisory only,"
                                    + " no paid repair.",
                                false));
        return all.size() == plan.issues.size()
                ? plan
                : new RebuildProtocol.Plan(
                        plan.events, plan.json, all, plan.reboundEvents, plan.partial, plan.holes);
    }

    static RebuildProtocol.Plan withLayoutReview(
            RebuildProtocol.Plan plan, TranslationBudget budget, CaptionLanguageContext context) {
        if (budget == null) return plan;
        List<Issue> all = new ArrayList<>(plan.issues);
        for (RebuildProtocol.Event e : plan.events)
            if (!budget.canPresent(e, context.renderSpec))
                all.add(
                        new Issue(
                                e.from,
                                e.to,
                                "presentation_geometry_observation",
                                "Preferred-font geometry is unresolved; retain accepted source/text,"
                                    + " no paid repair; remeasure at presentation.",
                                false));
        return new RebuildProtocol.Plan(
                plan.events,
                plan.json,
                Collections.unmodifiableList(all),
                plan.reboundEvents,
                plan.partial,
                plan.holes);
    }

    /**
     * The controller's acceptance rule. A complete plan always wins; two partial plans are merged
     * by their disjoint events, so a hole-filling retry adds text without replacing what is
     * already on screen. A partial plan that adds nothing is not adopted.
     */
    static RebuildProtocol.Plan accept(
            RebuildProtocol.Plan previous,
            RebuildProtocol.Plan candidate,
            RebuildPlanner.Block block) {
        if (previous != null && candidate != null && previous.partial && candidate.partial) {
            return mergeInto(previous, candidate, block);
        }
        return prefer(previous, candidate);
    }

    /**
     * Union of an accepted partial plan and any plan's disjoint events, including a complete plan
     * that covers only a missing token range (the hole-filling sub-request). Events that overlap an
     * already published range are ignored, so nothing on screen is replaced or shown twice.
     * Returns [previous] when the union covers no additional token.
     */
    static RebuildProtocol.Plan mergeInto(
            RebuildProtocol.Plan previous,
            RebuildProtocol.Plan candidate,
            RebuildPlanner.Block block) {
        if (previous == null) return candidate;
        if (candidate == null || previous.holes.isEmpty()) return previous;
        List<RebuildProtocol.Event> events = new ArrayList<>(previous.events);
        boolean added = false;
        for (RebuildProtocol.Event e : candidate.events) {
            boolean overlap = false;
            for (RebuildProtocol.Event p : events)
                if (e.from <= p.to && p.from <= e.to) {
                    overlap = true;
                    break;
                }
            if (overlap) continue;
            events.add(e);
            added = true;
        }
        if (!added) return previous;
        events.sort((left, right) -> Integer.compare(left.from, right.from));
        List<int[]> holes = new ArrayList<>();
        int next = block.from;
        for (RebuildProtocol.Event e : events) {
            if (e.from > next) holes.add(new int[] {next, e.from - 1});
            next = e.to + 1;
        }
        if (next <= block.to) holes.add(new int[] {next, block.to});
        if (holeTokens(holes) >= holeTokens(previous.holes)) return previous;
        List<Issue> issues = new ArrayList<>(previous.issues);
        java.util.Set<String> seen = new java.util.HashSet<>();
        for (Issue issue : issues) seen.add(issueKey(issue));
        for (Issue issue : candidate.issues)
            if (seen.add(issueKey(issue))) issues.add(issue);
        return new RebuildProtocol.Plan(events, candidate.json, issues, 0, true, holes);
    }

    private static int holeTokens(List<int[]> holes) {
        int n = 0;
        for (int[] hole : holes) n += Math.max(0, hole[1] - hole[0] + 1);
        return n;
    }

    private static String issueKey(Issue issue) {
        return issue.code + ':' + issue.from + ':' + issue.to;
    }

    private static boolean endsSentence(String text) {
        String value = text.trim();
        int end = value.length();
        while (end > 0 && "\"'”’」』）)]》".indexOf(value.charAt(end - 1)) >= 0) end--;
        return end > 0 && "。！？!?؛؟۔।॥׃።.".indexOf(value.charAt(end - 1)) >= 0;
    }

    /** Source words that open a continuation rather than a sentence of their own. */
    private static final java.util.Set<String> CONTINUATIONS =
            new java.util.HashSet<>(
                    java.util.Arrays.asList(
                            "than", "then", "and", "but", "that", "which", "who", "whom", "whose",
                            "where", "when", "while", "whereas", "because", "so", "as", "to", "of",
                            "for", "with", "from", "by", "on", "in", "at", "if", "unless",
                            "although", "though", "or", "nor", "yet", "despite", "during", "after",
                            "before", "since", "until", "whether", "not", "also"));

    private static boolean continuesAfter(RebuildSource source, int to) {
        if (to + 1 >= source.words.size()) return false;
        String next = source.words.get(to + 1).text.trim().toLowerCase(java.util.Locale.ROOT);
        return CONTINUATIONS.contains(next);
    }

    static int score(List<Issue> issues) {
        int n = 0;
        for (Issue i : issues) if (i.repair && !i.code.equals("layout_overflow")) n++;
        return n;
    }

    static String repair(List<Issue> issues) {
        StringBuilder out =
                new StringBuilder(
                        "Advisory fidelity review, not a proven error. Check these ranges against"
                            + " source and context; preserve already correct meanings. ");
        for (Issue i : issues)
            if (i.repair && !i.code.equals("layout_overflow")) {
                if (out.length() + i.describe().length() > 1200) break;
                out.append(i.describe()).append(' ');
            }
        return out.toString();
    }

    private static int semanticScore(RebuildProtocol.Plan p) {
        int n = 0;
        for (Issue i : p.issues)
            if (i.repair
                    && !i.code.equals("layout_overflow")
                    && !i.code.equals("paragraph")
                    && !i.code.equals("fragmented_plan")
                    && !i.code.equals("fragmentary_translation")) {
                n++;
            }
        return n;
    }

    static boolean hasSemanticRepairRisk(RebuildProtocol.Plan p) {
        return p != null && semanticScore(p) > 0;
    }

    private static int segmentationPenalty(RebuildProtocol.Plan p) {
        int n = 0;
        for (Issue i : p.issues) {
            if (i.code.equals("fragmented_plan")) n += 3;
            else if (i.code.equals("fragmentary_translation")) n += 2;
            else if (i.code.equals("micro_event_watch")) n++;
        }
        return n;
    }

    static RebuildProtocol.Plan prefer(
            RebuildProtocol.Plan previous, RebuildProtocol.Plan candidate) {
        if (previous == null) return candidate;
        // A complete plan always beats a salvaged one; the salvaged plan only exists to keep the
        // screen populated while a complete reply cannot be parsed.
        if (previous.partial != candidate.partial)
            return previous.partial ? candidate : previous;
        int oldSemantic = semanticScore(previous), newSemantic = semanticScore(candidate);
        if (oldSemantic != newSemantic) return oldSemantic < newSemantic ? previous : candidate;
        int oldSeg = segmentationPenalty(previous), newSeg = segmentationPenalty(candidate);
        if (oldSeg != newSeg) return newSeg < oldSeg ? candidate : previous;
        if (score(candidate.issues) == score(previous.issues)) return previous;
        return score(candidate.issues) < score(previous.issues) ? candidate : previous;
    }

    static boolean structuralRetry(String reason) {
        if (reason == null) return false;
        String code = reason;
        int cut = code.indexOf(';');
        if (cut >= 0) code = code.substring(0, cut);
        return code.equals("source_quote_mismatch")
                || code.equals("source_coverage")
                || code.equals("missing_source")
                || code.equals("crosses_source_break")
                || code.equals("block_identity")
                || code.equals("source_quote_required");
    }

    static boolean shouldRepair(
            RebuildProtocol.Plan p, int attempts, int repairs, long position, long end) {
        int maxAttempts = hasSemanticRepairRisk(p) ? MAX_SEMANTIC_ATTEMPTS : 2;
        return score(p.issues) > 0
                && attempts < maxAttempts
                && repairs < MAX_SESSION_REPAIRS
                && position < end;
    }
}

