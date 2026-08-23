package dev.jason.gboardpatches.extension.cursortrackpad;

import org.junit.Assert;
import org.junit.Test;

public final class GboardCursorTrackpad1777PolicyTest {
    @Test
    public void enabledForcesBothFlagsAndBothPreferenceReads() {
        Assert.assertEquals(Boolean.TRUE, GboardCursorTrackpad1777Policy.maybeForceFlag(
                "free_cursor", Boolean.FALSE, true));
        Assert.assertEquals(Boolean.TRUE, GboardCursorTrackpad1777Policy.maybeForceFlag(
                "free_cursor_lock_mode", Boolean.FALSE, true));
        Assert.assertTrue(GboardCursorTrackpad1777Policy.maybeForcePreference(
                "enable_scrub_move", false, true));
        Assert.assertTrue(GboardCursorTrackpad1777Policy.maybeForceResourcePreference(
                0x7f140996, false, true));
    }

    @Test
    public void disabledOrUnrelatedPreservesStock() {
        Assert.assertSame(Boolean.FALSE, GboardCursorTrackpad1777Policy.maybeForceFlag(
                "free_cursor", Boolean.FALSE, false));
        Assert.assertFalse(GboardCursorTrackpad1777Policy.maybeForcePreference(
                "enable_scrub_move", false, false));
        Assert.assertFalse(GboardCursorTrackpad1777Policy.maybeForceResourcePreference(
                0x7f140996, false, false));
        Assert.assertFalse(GboardCursorTrackpad1777Policy.maybeForcePreference(
                "unrelated", false, true));
    }
}
