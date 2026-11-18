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
    public void leavesOtherFlagsAndUnexpectedTypesAlone() {
        Object stock = Boolean.FALSE;
        assertSame(stock, GboardRamblerCloudRuntime.applyFlagValue("enable_jetson_s3_quota_experiment_override", stock));
        Object text = "1";
        assertSame(text, GboardRamblerCloudRuntime.applyFlagValue("ad_activation_type", text));
        assertSame(text, GboardRamblerCloudRuntime.applyFlagValue("enable_agentic_dictation", text));
        assertSame(stock, GboardRamblerCloudRuntime.applyFlagValue(null, stock));
    }
}
