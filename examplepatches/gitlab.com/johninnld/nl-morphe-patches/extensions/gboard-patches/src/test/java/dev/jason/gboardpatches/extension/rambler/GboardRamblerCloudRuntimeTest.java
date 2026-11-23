package dev.jason.gboardpatches.extension.rambler;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertSame;

import org.junit.Test;

public class GboardRamblerCloudRuntimeTest {
    @Test
    public void enablesAgenticDictationAndRamblerToolbars() {
        assertEquals(Boolean.TRUE, GboardRamblerCloudRuntime.applyFlagValue("enable_agentic_dictation", Boolean.FALSE));
        assertEquals(Boolean.TRUE, GboardRamblerCloudRuntime.applyFlagValue("enable_rambler_al_toolbar", Boolean.FALSE));
        assertEquals(Boolean.TRUE, GboardRamblerCloudRuntime.applyFlagValue(
                "enable_rambler_toolbar_at_cursor_position", Boolean.FALSE));
    }

    @Test
    public void selectsTheAgenticActivationType() {
        assertEquals(Long.valueOf(2L), GboardRamblerCloudRuntime.applyFlagValue("ad_activation_type", Long.valueOf(1L)));
    }

    @Test
    public void extrasAreForcedOnlyWithTheMarker() {
        assertEquals(Boolean.TRUE, GboardRamblerCloudRuntime.applyFlagValue(
                "enable_rambler_al_toolbar_overflow_menu", Boolean.FALSE, true));
        assertEquals(Boolean.TRUE, GboardRamblerCloudRuntime.applyFlagValue(
                "rambler_preserve_rewritten_text_on_revert", Boolean.FALSE, true));
        assertEquals(Boolean.TRUE, GboardRamblerCloudRuntime.applyFlagValue(
                "jetson_lite_enable_edit_history", Boolean.FALSE, true));
        Object stock = Boolean.FALSE;
        assertSame(stock, GboardRamblerCloudRuntime.applyFlagValue(
                "rambler_preserve_rewritten_text_on_revert", stock, false));
    }

    @Test
    public void automaticRetryRequiresItsOwnMarkerAndABooleanFlag() {
        assertSame(Boolean.FALSE, GboardRamblerCloudRuntime.applyAutomaticRetryFlag(Boolean.FALSE, false));
        assertSame(Boolean.TRUE, GboardRamblerCloudRuntime.applyAutomaticRetryFlag(Boolean.FALSE, true));
        assertSame(Boolean.TRUE, GboardRamblerCloudRuntime.applyAutomaticRetryFlag(Boolean.TRUE, false));
        Object stock = Long.valueOf(1L);
        assertSame(stock, GboardRamblerCloudRuntime.applyAutomaticRetryFlag(stock, true));
        assertSame(Boolean.FALSE, GboardRamblerCloudRuntime.applyFlagValue(
                "agentic_dictation_enable_auto_parallel_retry", Boolean.FALSE, true));
    }

    @Test
    public void leavesOtherFlagsAndUnexpectedTypesAlone() {
        Object stock = Boolean.FALSE;
        assertSame(stock, GboardRamblerCloudRuntime.applyFlagValue("enable_jetson_s3_quota_experiment_override", stock));
        Object text = "1";
        assertSame(text, GboardRamblerCloudRuntime.applyFlagValue("ad_activation_type", text));
        assertSame(text, GboardRamblerCloudRuntime.applyFlagValue("enable_agentic_dictation", text));
        assertSame(stock, GboardRamblerCloudRuntime.applyFlagValue(null, stock));
    }
}
