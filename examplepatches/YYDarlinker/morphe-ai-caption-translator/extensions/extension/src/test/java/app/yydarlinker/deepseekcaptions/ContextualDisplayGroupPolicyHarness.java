package app.yydarlinker.deepseekcaptions;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/** Pure JVM checks for source-only display grouping and its bounded wait state. */
public final class ContextualDisplayGroupPolicyHarness {
    public static void main(String[] args) {
        testCrossUnitClause();
        testPunctuationClosesGroup();
        testDecimalAndAbbreviationStayOpen();
        testSpeakerAndGapStopGrouping();
        testBoundedWait();
        testCanonicalJoin();
        System.out.println("ContextualDisplayGroupPolicyHarness: OK");
    }

    private static void testCrossUnitClause() {
        List<TranslationUnitTimeline.Unit> units = Arrays.asList(
                unit(0, 0, 1_000, "During the latter colonial", "hard_limit"),
                unit(1, 1_000, 2_000, "years, the city expanded", "hard_limit"),
                unit(2, 2_000, 3_000, "rapidly.", "strong_punctuation")
        );
        ContextualDisplayGroupPolicy.Group[] groups =
                ContextualDisplayGroupPolicy.buildByUnit(units, Collections.emptyList());
        assertRange(groups[0], 0, 2, "unfinished clause must include later units");
        assertSame(groups[0], groups[1], "middle unit must resolve to the same group");
        assertSame(groups[0], groups[2], "terminal unit must resolve to the same group");
    }

    private static void testPunctuationClosesGroup() {
        List<TranslationUnitTimeline.Unit> units = Arrays.asList(
                unit(0, 0, 1_000, "The committee continued its investigation,", "weak_punctuation"),
                unit(1, 1_000, 2_000, "despite the delay.", "strong_punctuation")
        );
        ContextualDisplayGroupPolicy.Group[] groups =
                ContextualDisplayGroupPolicy.buildByUnit(units, Collections.emptyList());
        assertRange(groups[0], 0, 0, "comma must close the first display group");
        assertRange(groups[1], 1, 1, "following clause must have its own group");
    }

    private static void testDecimalAndAbbreviationStayOpen() {
        List<TranslationUnitTimeline.Unit> decimal = Arrays.asList(
                unit(0, 0, 800, "The ratio is 3.", "hard_limit"),
                unit(1, 800, 1_600, "14 to one,", "weak_punctuation")
        );
        ContextualDisplayGroupPolicy.Group[] decimalGroups =
                ContextualDisplayGroupPolicy.buildByUnit(decimal, Collections.emptyList());
        assertRange(decimalGroups[0], 0, 1, "decimal point must not close the group");

        List<TranslationUnitTimeline.Unit> abbreviation = Arrays.asList(
                unit(0, 0, 800, "Dr.", "hard_limit"),
                unit(1, 800, 1_600, "Smith agreed.", "strong_punctuation")
        );
        ContextualDisplayGroupPolicy.Group[] abbreviationGroups =
                ContextualDisplayGroupPolicy.buildByUnit(abbreviation, Collections.emptyList());
        assertRange(abbreviationGroups[0], 0, 1, "abbreviation must not close the group");

        List<TranslationUnitTimeline.Unit> dotted = Arrays.asList(
                unit(0, 0, 800, "The U.S.", "hard_limit"),
                unit(1, 800, 1_600, "economy grew.", "strong_punctuation")
        );
        ContextualDisplayGroupPolicy.Group[] dottedGroups =
                ContextualDisplayGroupPolicy.buildByUnit(dotted, Collections.emptyList());
        assertRange(dottedGroups[0], 0, 1, "dotted abbreviation must not close the group");
    }

    private static void testSpeakerAndGapStopGrouping() {
        List<TranslationUnitTimeline.Unit> speaker = Arrays.asList(
                unit(0, 0, 800, "I agree", "hard_limit"),
                unit(1, 800, 1_600, "- No, I do not.", "speaker_boundary")
        );
        ContextualDisplayGroupPolicy.Group[] speakerGroups =
                ContextualDisplayGroupPolicy.buildByUnit(speaker, Collections.emptyList());
        assertRange(speakerGroups[0], 0, 0, "new speaker must stop lookahead grouping");

        List<TranslationUnitTimeline.Unit> gap = Arrays.asList(
                unit(0, 0, 800, "I agree", "hard_limit"),
                unit(1, 1_701, 2_400, "with that.", "strong_punctuation")
        );
        ContextualDisplayGroupPolicy.Group[] gapGroups =
                ContextualDisplayGroupPolicy.buildByUnit(gap, Collections.emptyList());
        assertRange(gapGroups[0], 0, 0, "gap over 900ms must stop grouping");
    }

    private static void testBoundedWait() {
        ContextualDisplayGroupPolicy.Group group = new ContextualDisplayGroupPolicy.Group(
                0, 1, 0, 1, 0, 2_000, "unfinished clause,"
        );
        int[] states = {2, 0};
        if (ContextualDisplayGroupPolicy.allReady(states, group, 2)) {
            throw new AssertionError("partial group reported ready");
        }
        assertDecision(ContextualDisplayGroupPolicy.WaitDecision.WAIT,
                ContextualDisplayGroupPolicy.waitDecision(false, false, 100, 899),
                "799ms remains waiting");
        assertDecision(ContextualDisplayGroupPolicy.WaitDecision.TIMEOUT,
                ContextualDisplayGroupPolicy.waitDecision(false, false, 100, 900),
                "800ms times out");
        states[1] = 5;
        if (!ContextualDisplayGroupPolicy.anyPermanentFailure(states, group, 5)) {
            throw new AssertionError("permanent failure not detected");
        }
        assertDecision(ContextualDisplayGroupPolicy.WaitDecision.PERMANENT_FAILURE,
                ContextualDisplayGroupPolicy.waitDecision(false, true, 100, 101),
                "permanent failure stops waiting immediately");
        states[1] = 2;
        if (!ContextualDisplayGroupPolicy.allReady(states, group, 2)) {
            throw new AssertionError("complete group not reported ready");
        }
    }

    private static void testCanonicalJoin() {
        String joined = ContextualDisplayGroupPolicy.joinCanonical(
                Arrays.asList("在殖民后期", "，城市迅速扩张。"), 0, 1
        );
        if (!"在殖民后期，城市迅速扩张。".equals(joined)) {
            throw new AssertionError("canonical join changed punctuation: " + joined);
        }
    }

    private static TranslationUnitTimeline.Unit unit(
            int index,
            long startMs,
            long endMs,
            String source,
            String reason
    ) {
        return new TranslationUnitTimeline.Unit(
                index,
                "u" + index,
                index,
                index,
                index,
                index,
                startMs,
                endMs,
                source,
                TranslationUnitTimeline.Confidence.MEDIUM,
                reason
        );
    }

    private static void assertRange(
            ContextualDisplayGroupPolicy.Group group,
            int first,
            int last,
            String message
    ) {
        if (group == null || group.firstUnit != first || group.lastUnit != last) {
            throw new AssertionError(message + ": expected=" + first + "-" + last +
                    ";actual=" + (group == null ? "null" : group.firstUnit + "-" + group.lastUnit));
        }
    }

    private static void assertSame(Object expected, Object actual, String message) {
        if (expected != actual) throw new AssertionError(message);
    }

    private static void assertDecision(
            ContextualDisplayGroupPolicy.WaitDecision expected,
            ContextualDisplayGroupPolicy.WaitDecision actual,
            String message
    ) {
        if (expected != actual) {
            throw new AssertionError(message + ": expected=" + expected + ";actual=" + actual);
        }
    }
}