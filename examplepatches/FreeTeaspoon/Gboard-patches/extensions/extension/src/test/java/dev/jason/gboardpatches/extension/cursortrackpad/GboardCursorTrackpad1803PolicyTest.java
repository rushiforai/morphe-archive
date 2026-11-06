package dev.jason.gboardpatches.extension.cursortrackpad;

import org.junit.Assert;
import org.junit.Test;

public final class GboardCursorTrackpad1803PolicyTest {
    @Test
    public void enabledForcesBothFlags() {
        Assert.assertEquals(Boolean.TRUE, GboardCursorTrackpad1803Policy.maybeForceFlag(
                "free_cursor", Boolean.FALSE, true));
        Assert.assertEquals(Boolean.TRUE, GboardCursorTrackpad1803Policy.maybeForceFlag(
                "free_cursor_lock_mode", Boolean.FALSE, true));
    }

    @Test
    public void disabledOrUnrelatedPreservesStock() {
        Assert.assertSame(Boolean.FALSE, GboardCursorTrackpad1803Policy.maybeForceFlag(
                "free_cursor", Boolean.FALSE, false));
    }
}
