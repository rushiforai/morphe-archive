package app.yydarlinker.deepseekcaptions;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/** Reproducible JVM golden harness for the deterministic unit builder. */
public final class TranslationUnitTimelineHarness {
    public static void main(String[] args) {
        testManualCrossCueSentence();
        testLongUnpunctuatedAsr();
        testUnsafeHardLimit();
        testSpeakerBoundary();
        testRollupIdentity();
        testUnfinishedTail();
        testReportingVerbInfinitive();
        testNumericExpression();
        testNumberUnitOwnership();
        testPredicateComplementOwnership();
        testRelativeClauseOwnership();
        System.out.println("TranslationUnitTimelineHarness: OK");
    }

    private static void testManualCrossCueSentence() {
        List<SourceAtomTimeline.Atom> atoms = atoms(
                "And", "this", "is", "probably", "the", "biggest", "upgrade", "we've", "seen", "this", "year."
        );
        for (int i = 0; i < atoms.size(); i++) {
            SourceAtomTimeline.Atom atom = atoms.get(i);
            atoms.set(i, new SourceAtomTimeline.Atom(
                    atom.startMs, atom.endMs, atom.text, i / 4, false
            ));
        }
        TranslationUnitTimeline.Result result = build(atoms, null, false);
        assertEquals(1, result.units.size(), "manual sentence should remain whole");
        assertEquals("And this is probably the biggest upgrade we've seen this year.",
                result.units.get(0).sourceText, "manual source text");
        assertTimeline(result, atoms.size());
    }

    private static void testLongUnpunctuatedAsr() {
        List<SourceAtomTimeline.Atom> atoms = new ArrayList<>();
        for (int i = 0; i < 60; i++) {
            atoms.add(new SourceAtomTimeline.Atom(
                    i * 300L, i * 300L + 280L, "word" + i, i / 3, false
            ));
        }
        String asrUrl = "https://www.youtube.com/api/timedtext?v=test&kind=asr&lang=en";
        TranslationUnitTimeline.Result first = build(atoms, asrUrl, false);
        TranslationUnitTimeline.Result second = build(atoms, asrUrl, false);
        if (first.units.size() < 3) throw new AssertionError("long ASR was not bounded");
        assertTimeline(first, atoms.size());
        assertEquals(first.units.size(), second.units.size(), "deterministic unit count");
        for (int i = 0; i < first.units.size(); i++) {
            assertEquals(first.units.get(i).id, second.units.get(i).id, "deterministic unit id");
        }
    }

    private static void testUnsafeHardLimit() {
        List<SourceAtomTimeline.Atom> atoms = new ArrayList<>();
        for (int i = 0; i < 35; i++) {
            String text = i == 27 ? "because" : i == 34 ? "to" : "token" + i;
            atoms.add(new SourceAtomTimeline.Atom(
                    i * 310L, i * 310L + 290L, text, i / 3, false
            ));
        }
        TranslationUnitTimeline.Result result = build(atoms, null, false);
        assertTimeline(result, atoms.size());
        boolean low = false;
        for (TranslationUnitTimeline.Unit unit : result.units) {
            if (unit.confidence == TranslationUnitTimeline.Confidence.LOW) low = true;
        }
        if (!low) throw new AssertionError("unsafe hard limit should be diagnosable as LOW");
    }

    private static void testSpeakerBoundary() {
        List<SourceAtomTimeline.Atom> atoms = new ArrayList<>();
        atoms.add(new SourceAtomTimeline.Atom(0, 400, "We", 0, false));
        atoms.add(new SourceAtomTimeline.Atom(400, 900, "agree", 0, false));
        atoms.add(new SourceAtomTimeline.Atom(900, 1200, "-No", 1, false));
        atoms.add(new SourceAtomTimeline.Atom(1200, 1600, "we", 1, false));
        atoms.add(new SourceAtomTimeline.Atom(1600, 2100, "don't.", 1, false));
        TranslationUnitTimeline.Result result = build(atoms, null, false);
        assertEquals(2, result.units.size(), "speaker boundary");
        assertTimeline(result, atoms.size());
    }

    private static void testRollupIdentity() {
        List<SourceAtomTimeline.Atom> atoms = atoms("rolling", "caption", "text.");
        TranslationUnitTimeline.Result result = build(atoms, null, true);
        assertEquals("rollup", result.sourceKind, "rollup source kind");
        assertTimeline(result, atoms.size());
    }

    private static void testUnfinishedTail() {
        List<SourceAtomTimeline.Atom> atoms = atoms("and", "the");
        TranslationUnitTimeline.Result result = build(atoms, null, false);
        assertEquals(1, result.units.size(), "unfinished tail retained");
        assertEquals(TranslationUnitTimeline.Confidence.LOW,
                result.units.get(0).confidence, "unfinished tail confidence");
        assertTimeline(result, atoms.size());
    }

    private static void testReportingVerbInfinitive() {
        List<SourceAtomTimeline.Atom> values = atoms(
                "After", "a", "long", "public", "meeting", "the", "committee", "claimed,",
                "to", "introduce", "a", "broader", "policy", "after", "the", "independent",
                "review", "was", "complete."
        );
        TranslationUnitTimeline.Result result = build(values, null, false);
        for (TranslationUnitTimeline.Unit unit : result.units) {
            if (unit.sourceText.endsWith("claimed,")) {
                throw new AssertionError("reporting verb was split from infinitive: " + unit.sourceText);
            }
        }
        assertTimeline(result, values.size());
    }

    private static void testNumericExpression() {
        List<SourceAtomTimeline.Atom> values = atoms(
                "The", "extended", "regional", "programme", "now", "covers", "6,", "800,",
                "000", "people", "across", "several", "districts", "and", "continues", "through",
                "the", "end", "of", "this", "year."
        );
        TranslationUnitTimeline.Result result = build(values, null, false);
        for (TranslationUnitTimeline.Unit unit : result.units) {
            if (unit.sourceText.endsWith("6,") || unit.sourceText.endsWith("800,")) {
                throw new AssertionError("numeric expression was split: " + unit.sourceText);
            }
        }
        assertTimeline(result, values.size());
    }

    private static void testNumberUnitOwnership() {
        List<SourceAtomTimeline.Atom> values = atomsWithStep(330L,
                "The", "entire", "emergency", "evacuation", "operation", "was", "planned",
                "and", "completed", "under", "extreme", "pressure", "in", "only", "just", "ten", "days."
        );
        TranslationUnitTimeline.Result result = build(values, asrUrl(), false);
        assertNoBoundary(result, "ten", "days.", "number must remain with its quantity unit");
        assertContains(result.rejectionSummary(), "numeric_span", "numeric rejection diagnostics");
        assertTimeline(result, values.size());
    }

    private static void testPredicateComplementOwnership() {
        List<SourceAtomTimeline.Atom> values = atomsWithStep(330L,
                "The", "widespread", "fear", "about", "what", "would", "happen", "next", "was",
                "plain", "to", "see", "and", "eventually", "ultimately", "led", "to", "chaos", "at", "airports."
        );
        TranslationUnitTimeline.Result result = build(values, asrUrl(), false);
        assertNoBoundary(result, "led", "to", "predicate must retain its complement");
        assertContains(result.rejectionSummary(), "prepositional_complement",
                "predicate complement rejection diagnostics");
        assertTimeline(result, values.size());
    }

    private static void testRelativeClauseOwnership() {
        List<SourceAtomTimeline.Atom> values = atomsWithStep(330L,
                "Governments", "were", "doing", "everything", "possible", "to", "evacuate", "people",
                "from", "the", "increasingly", "unstable", "and", "very", "isolated", "country", "that", "was",
                "falling", "apart."
        );
        TranslationUnitTimeline.Result result = build(values, asrUrl(), false);
        assertNoBoundary(result, "country", "that", "relative clause retains its antecedent");
        assertContains(result.rejectionSummary(), "relative_clause",
                "relative-clause rejection diagnostics");
        assertTimeline(result, values.size());
    }

    private static void assertNoBoundary(
            TranslationUnitTimeline.Result result,
            String left,
            String right,
            String label
    ) {
        for (int i = 0; i + 1 < result.units.size(); i++) {
            if (result.units.get(i).sourceText.endsWith(left) &&
                    result.units.get(i + 1).sourceText.startsWith(right)) {
                throw new AssertionError(label + ": " +
                        result.units.get(i).sourceText + " | " + result.units.get(i + 1).sourceText);
            }
        }
    }

    private static void assertContains(String value, String expected, String label) {
        if (value == null || !value.contains(expected)) {
            throw new AssertionError(label + ": expected " + expected + " in " + value);
        }
    }

    private static String asrUrl() {
        return "https://www.youtube.com/api/timedtext?v=test&kind=asr&lang=en";
    }

    private static TranslationUnitTimeline.Result build(
            List<SourceAtomTimeline.Atom> atoms,
            String sourceUrl,
            boolean rollup
    ) {
        SourceAtomTimeline.Result source = new SourceAtomTimeline.Result(
                Collections.unmodifiableList(new ArrayList<>(atoms)),
                atoms.size(), 0, atoms.size(), false, rollup
        );
        return TranslationUnitTimeline.build(source, sourceUrl);
    }

    private static List<SourceAtomTimeline.Atom> atoms(String... values) {
        return atomsWithStep(420L, values);
    }

    private static List<SourceAtomTimeline.Atom> atomsWithStep(long stepMs, String... values) {
        List<SourceAtomTimeline.Atom> atoms = new ArrayList<>();
        for (int i = 0; i < values.length; i++) {
            atoms.add(new SourceAtomTimeline.Atom(
                    i * stepMs, i * stepMs + Math.max(1L, stepMs - 20L), values[i], i, false
            ));
        }
        return atoms;
    }

    private static void assertTimeline(TranslationUnitTimeline.Result result, int atomCount) {
        int expectedFrom = 0;
        long previousStart = -1L;
        for (TranslationUnitTimeline.Unit unit : result.units) {
            assertEquals(expectedFrom, unit.fromAtom, "unit coverage gap/overlap");
            if (unit.toAtom < unit.fromAtom) throw new AssertionError("negative unit range");
            if (unit.startMs < previousStart) throw new AssertionError("non-monotonic unit timing");
            if (unit.endMs <= unit.startMs) throw new AssertionError("non-positive unit duration");
            if (unit.sourceText.trim().isEmpty()) throw new AssertionError("empty source unit");
            expectedFrom = unit.toAtom + 1;
            previousStart = unit.startMs;
        }
        assertEquals(atomCount, expectedFrom, "source atoms not covered exactly once");
    }

    private static void assertEquals(Object expected, Object actual, String label) {
        if (expected == null ? actual != null : !expected.equals(actual)) {
            throw new AssertionError(label + ": expected=" + expected + " actual=" + actual);
        }
    }
}
