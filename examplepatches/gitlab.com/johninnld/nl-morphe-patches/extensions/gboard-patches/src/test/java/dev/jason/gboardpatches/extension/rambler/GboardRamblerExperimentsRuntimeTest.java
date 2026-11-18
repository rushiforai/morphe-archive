package dev.jason.gboardpatches.extension.rambler;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class GboardRamblerExperimentsRuntimeTest {
    @Test
    public void eachHookOnlyTurnsOnItsOwnFlags() {
        assertEquals(Boolean.TRUE, GboardRamblerExperimentsRuntime.applyCustomInstructionFlag(
                "agentic_dictation_enable_custom_instruction", Boolean.FALSE));
        for (String flag : new String[] {"jetson_enable_cursor_awareness",
                "jetson_send_only_selected_text_if_present", "jetson_reselect_after_edit"}) {
            assertEquals(flag, Boolean.TRUE, GboardRamblerExperimentsRuntime.applyCursorEditingFlag(flag, Boolean.FALSE));
        }
        assertEquals(Boolean.TRUE, GboardRamblerExperimentsRuntime.applyAppContextFlag(
                "agentic_dictation_enable_app_info_context", Boolean.FALSE));

        Object stock = Boolean.FALSE;
        assertSame(stock, GboardRamblerExperimentsRuntime.applyCustomInstructionFlag(
                "agentic_dictation_enable_app_info_context", stock));
        assertSame(stock, GboardRamblerExperimentsRuntime.applyAppContextFlag(
                "agentic_dictation_enable_custom_instruction", stock));
        assertSame(stock, GboardRamblerExperimentsRuntime.applyCursorEditingFlag(
                "agentic_dictation_enable_auto_parallel_retry", stock));
        Object text = "false";
        assertSame(text, GboardRamblerExperimentsRuntime.applyAppContextFlag(
                "agentic_dictation_enable_app_info_context", text));
    }
}
