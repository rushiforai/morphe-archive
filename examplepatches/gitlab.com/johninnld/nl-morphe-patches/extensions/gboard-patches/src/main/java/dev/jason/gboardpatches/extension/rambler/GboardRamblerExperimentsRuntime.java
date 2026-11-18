package dev.jason.gboardpatches.extension.rambler;

/**
 * Supplies the server flags behind Rambler features Gboard 18.6.3 ships but keeps switched off.
 *
 * <p>Each of these Rambler patches selects one of these hooks, so a feature only changes when
 * its patch is applied. Every hook keeps Gboard's own value for any other flag or value type.
 */
public final class GboardRamblerExperimentsRuntime {
    /** Sends the text saved under Rambler's custom instructions with every dictation. */
    public static final String CUSTOM_INSTRUCTION_FLAG = "agentic_dictation_enable_custom_instruction";
    /** Sends the text after the cursor too, not only the text before it. */
    public static final String CURSOR_AWARENESS_FLAG = "jetson_enable_cursor_awareness";
    /** With text selected, sends only the selection, so spoken edits apply to it. */
    public static final String SELECTED_TEXT_ONLY_FLAG = "jetson_send_only_selected_text_if_present";
    /** Selects the edited text again after a spoken edit. */
    public static final String RESELECT_AFTER_EDIT_FLAG = "jetson_reselect_after_edit";
    /** Sends the app's name, package, input type, action and field hint as context. */
    public static final String APP_CONTEXT_FLAG = "agentic_dictation_enable_app_info_context";

    private GboardRamblerExperimentsRuntime() {
    }

    /** Flag-family hook for Rambler custom instructions. */
    public static Object applyCustomInstructionFlag(String flagName, Object originalResult) {
        return CUSTOM_INSTRUCTION_FLAG.equals(flagName) ? enabled(originalResult) : originalResult;
    }

    /** Flag-family hook for Rambler cursor-aware editing. */
    public static Object applyCursorEditingFlag(String flagName, Object originalResult) {
        if (CURSOR_AWARENESS_FLAG.equals(flagName) || SELECTED_TEXT_ONLY_FLAG.equals(flagName)
                || RESELECT_AFTER_EDIT_FLAG.equals(flagName)) {
            return enabled(originalResult);
        }
        return originalResult;
    }

    /** Flag-family hook for Rambler app context. */
    public static Object applyAppContextFlag(String flagName, Object originalResult) {
        return APP_CONTEXT_FLAG.equals(flagName) ? enabled(originalResult) : originalResult;
    }

    private static Object enabled(Object originalResult) {
        return originalResult instanceof Boolean ? Boolean.TRUE : originalResult;
    }
}
