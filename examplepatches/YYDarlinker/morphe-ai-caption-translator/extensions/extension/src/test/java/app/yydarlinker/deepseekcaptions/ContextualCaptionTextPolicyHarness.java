package app.yydarlinker.deepseekcaptions;

/** Pure JVM regression harness for contextual caption quality and roll-up bridge policy. */
public final class ContextualCaptionTextPolicyHarness {
    public static void main(String[] args) {
        assertEquals("give me something",
                ContextualCaptionTextPolicy.sourceForTranslation(">> [Music] give me something"),
                "mixed source keeps spoken lyric");
        assertTrue(ContextualCaptionTextPolicy.suppressWithoutTranslation(">> [Music] ♪"),
                "pure non-speech source suppressed locally");
        assertEquals("请继续",
                ContextualCaptionTextPolicy.translationForDisplay("[请喉咙] >> 请继续"),
                "translated stage annotation removed");
        assertEquals("型号[B-52]继续测试",
                ContextualCaptionTextPolicy.translationForDisplay("型号[B-52]继续测试"),
                "bracketed model identifier preserved");

        assertFalse(ContextualCaptionTextPolicy.adequateTranslation("give me something", "热"),
                "extreme collapse rejected");
        assertTrue(ContextualCaptionTextPolicy.adequateTranslation(
                        "give me something", "给我点什么"),
                "faithful lyric accepted");
        assertTrue(ContextualCaptionTextPolicy.adequateTranslation("hot", "热"),
                "short source remains valid");
        assertTrue(ContextualCaptionTextPolicy.adequateTranslation("yes", "是"),
                "short answer remains valid");

        assertTrue(ContextualCaptionTextPolicy.redundantBridge(
                        "As long as I can walk after work from the International Finance Centre " +
                                "to Pier Two for an overpriced beer",
                        "walk after work from the International Finance Centre to Pier Two " +
                                "for an overpriced beer"),
                "contained roll-up bridge detected");
        assertFalse(ContextualCaptionTextPolicy.redundantBridge(
                        "We walked to Pier Two", "Then the market opened"),
                "novel adjacent caption not suppressed");

        assertTrue(ContextualUnitCorePolicy.shouldRescueBodySentCurrent(
                        10_000L, 10_200L, 1_000L, 2_300L,
                        1_700L, 0, 2),
                "late body-sent background permits bounded rescue");
        assertFalse(ContextualUnitCorePolicy.shouldRescueBodySentCurrent(
                        10_000L, 9_900L, 1_000L, 2_300L,
                        1_700L, 0, 2),
                "future unit is not rescued early");
        assertFalse(ContextualUnitCorePolicy.shouldRescueBodySentCurrent(
                        10_000L, 10_200L, 1_000L, 2_300L,
                        1_700L, 2, 2),
                "rescue attempts remain bounded");

        System.out.println("ContextualCaptionTextPolicyHarness: OK");
    }

    private static void assertTrue(boolean value, String label) {
        if (!value) throw new AssertionError(label);
    }

    private static void assertFalse(boolean value, String label) {
        if (value) throw new AssertionError(label);
    }

    private static void assertEquals(String expected, String actual, String label) {
        if (!expected.equals(actual)) {
            throw new AssertionError(label + ": expected=<" + expected + "> actual=<" + actual + ">");
        }
    }
}
