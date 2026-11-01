package dev.jason.gboardpatches.extension.cursortrackpad;

import org.junit.Assert;
import org.junit.Test;

public final class GboardCursorTrackpadPolicyTest {
    @Test
    public void enabledForcesBothFlags() {
        Assert.assertEquals(Boolean.TRUE, GboardCursorTrackpadPolicy.maybeForceFlag(
                "free_cursor", Boolean.FALSE, true));
        Assert.assertEquals(Boolean.TRUE, GboardCursorTrackpadPolicy.maybeForceFlag(
                "free_cursor_lock_mode", Boolean.FALSE, true));
    }

    @Test
    public void disabledOrUnrelatedPreservesStock() {
        Assert.assertSame(Boolean.FALSE, GboardCursorTrackpadPolicy.maybeForceFlag(
                "free_cursor", Boolean.FALSE, false));
        Assert.assertNull(GboardCursorTrackpadPolicy.maybeForceFlag(
                "free_cursor", null, false));
        Assert.assertSame(Boolean.FALSE, GboardCursorTrackpadPolicy.maybeForceFlag(
                "unrelated_flag", Boolean.FALSE, true));
        Assert.assertNull(GboardCursorTrackpadPolicy.maybeForceFlag(
                "unrelated_flag", null, true));
    }

    @Test
    public void enabledForcesFlagsPermanentlyEvenWhenStockResultIsNull() {
        Assert.assertEquals(Boolean.TRUE, GboardCursorTrackpadPolicy.maybeForceFlag(
                "free_cursor", null, true));
        Assert.assertEquals(Boolean.TRUE, GboardCursorTrackpadPolicy.maybeForceFlag(
                "free_cursor_lock_mode", null, true));
    }

    @Test
    public void recognizesCursorTrackpadFlags() {
        Assert.assertTrue(GboardCursorTrackpadPolicy.isCursorTrackpadFlag("free_cursor"));
        Assert.assertTrue(GboardCursorTrackpadPolicy.isCursorTrackpadFlag("free_cursor_lock_mode"));
        Assert.assertFalse(GboardCursorTrackpadPolicy.isCursorTrackpadFlag("unrelated_flag"));
    }

    @Test
    public void defaultEnabledIsTrueAndResilientToNullPreferences() {
        Assert.assertTrue(GboardCursorTrackpadSettings.DEFAULT_ENABLED);
        Assert.assertTrue(GboardCursorTrackpadSettings.isCachedEnabled());
        Assert.assertTrue(GboardCursorTrackpadSettings.readEnabled(null));
        Assert.assertEquals(Boolean.TRUE, GboardCursorTrackpadRuntime.applyOverriddenFlagValue("free_cursor", Boolean.FALSE));
        Assert.assertEquals(Boolean.TRUE, GboardCursorTrackpadRuntime.applyOverriddenFlagValue("free_cursor_lock_mode", null));
    }
}
