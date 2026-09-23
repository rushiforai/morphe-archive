/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 */
package app.morphe.extension.shared.diagnostics;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import app.morphe.extension.tiktok.blockauthor.VideoAuthor;

import org.junit.Test;

/**
 * A creator's name has no shape a pattern can find, and the toast that carries it is written to
 * the buffer in whichever language the phone speaks. The bundle marks the name instead, with the
 * isolate pair {@code VideoAuthor.label()} wraps it in, and the redactor finds the marks.
 */
public class DiagnosticRedactorTest {

    private static final String FSI = "⁨";
    private static final String PDI = "⁩";

    @Test public void theToastLineLosesTheNameAndKeepsTheAction() {
        String line = DiagnosticRedactor.redact("Showing toast: Blocked " + FSI + "Dana Q" + PDI);

        assertEquals("Showing toast: Blocked [name omitted]", line);
    }

    @Test public void theNameIsFoundByItsMarksInAnyLanguage() {
        String german = DiagnosticRedactor.redact(
                "Showing toast: " + FSI + "Dana Q" + PDI + " wird nicht mehr angezeigt");

        assertFalse("a name in a translated toast survived: " + german, german.contains("Dana Q"));
        assertTrue("the words around the name were lost: " + german,
                german.contains("[name omitted] wird nicht mehr angezeigt"));
    }

    @Test public void aHandleOrAnIdInsideTheMarksGoesWithThem() {
        String handle = DiagnosticRedactor.redact("Hidden " + FSI + "@dana.q" + PDI + " locally");
        String secUid = DiagnosticRedactor.redact(
                "Unblocked " + FSI + "MS4wLjABAAAA_ynkoP2m" + PDI);

        assertEquals("Hidden [name omitted] locally", handle);
        assertEquals("Unblocked [name omitted]", secUid);
    }

    @Test public void aNameThatLostItsClosingMarkIsCutToTheEndOfItsLine() {
        String text = DiagnosticRedactor.redact("Hidden " + FSI + "Dana Q locally\nnext line");

        assertEquals("Hidden [name omitted]\nnext line", text);
    }

    /**
     * A display name is whatever the account chose, so it can carry a line break or a copy of
     * the marks themselves. Either one used to split the run and leave the rest of the name in
     * the report. The label takes both out, so what arrives here is one run.
     */
    @Test public void aNameCarryingABreakOrTheMarksThemselvesIsStillOneRun() {
        String broken = new VideoAuthor(null, null, "Dana\nSecretHandle", null).label();
        String nested = new VideoAuthor(null, null, "A" + PDI + "B" + FSI + "C", null).label();

        assertEquals("Showing toast: Blocked [name omitted]",
                DiagnosticRedactor.redact("Showing toast: Blocked " + broken));
        assertEquals("Showing toast: Blocked [name omitted]",
                DiagnosticRedactor.redact("Showing toast: Blocked " + nested));
        assertFalse("half the name survived the break: " + broken,
                DiagnosticRedactor.redact(broken).contains("SecretHandle"));
        assertFalse("the middle of the name survived its own marks: " + nested,
                DiagnosticRedactor.redact(nested).contains("B"));
    }

    /**
     * The control for the pair above. Without the flattening the same two names leak, which is
     * what makes the flattening the thing being tested rather than the pattern.
     */
    @Test public void theSameTwoNamesLeakWhenTheyAreNotFlattenedFirst() {
        String rawBreak = FSI + "Dana\nSecretHandle" + PDI;
        String rawNested = FSI + "A" + PDI + "B" + FSI + "C" + PDI;

        assertTrue(DiagnosticRedactor.redact(rawBreak).contains("SecretHandle"));
        assertTrue(DiagnosticRedactor.redact(rawNested).contains("B"));
    }

    @Test public void anAccountWithNothingToNameIsNotHiddenAtAll() {
        // "this creator" names nobody, so hiding it says less than the truth.
        assertEquals("Blocked this creator",
                DiagnosticRedactor.redact("Blocked "
                        + new VideoAuthor(null, null, null, null).label()));
    }

    @Test public void aHandleOnItsOwnGoesWhileAnEmailAndAnObjectHashStay() {
        String text = DiagnosticRedactor.redact(
                "@dana.q wrote to dana@example.com from Foo@1a2b3c and mentioned @dana_q2");

        assertEquals("[handle omitted] wrote to dana@example.com from Foo@1a2b3c"
                + " and mentioned [handle omitted]", text);
    }

    @Test public void theCreatorReferenceLineKeepsThePseudonymAndDropsTheVideoId() {
        String line = DiagnosticRedactor.redact(
                "Current video: creator 3f9a2c1b0e7d aweme=7012345678901234567");

        assertTrue("the pseudonym is what makes two lines comparable: " + line,
                line.contains("creator 3f9a2c1b0e7d"));
        assertFalse("the video id names what was watched: " + line,
                line.contains("7012345678901234567"));
    }

    /** The mutation control: a line with no name, handle or id is returned as it came. */
    @Test public void aLineWithNothingToHideIsLeftAlone() {
        String line = "Sending block_type=1 for creator 3f9a2c1b0e7d";

        assertEquals(line, DiagnosticRedactor.redact(line));
    }
}
