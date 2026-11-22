package dev.freeteaspoon.wisprflowbridge;

import org.junit.Test;

import static org.junit.Assert.*;

public final class InlineSubmissionTest {
    @Test public void normalSubmissionCapturesTheFirstInsertion() {
        var submission = new InlineSubmission();
        submission.capture("first result");
        submission.capture("duplicate");
        assertEquals("first result", submission.transcript());
    }

    @Test public void abandonedSubmissionClearsExistingTextAndDropsLateResults() {
        var submission = new InlineSubmission();
        submission.capture("unclaimed text");
        submission.discard();
        assertTrue(submission.isDiscarded());
        assertNull(submission.transcript());
        submission.capture("late text");
        assertNull(submission.transcript());
    }
}
