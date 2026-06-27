package dev.jason.gboardpatches.extension.toprowswipe;

import android.content.Context;

import dev.jason.gboardpatches.extension.R;
import dev.jason.gboardpatches.extension.settings.GboardSettingsText;

final class GboardTopRowSwipeStrings {
    private static final int SCRIPT_PREVIEW_MAX_LENGTH = 80;

    final String headerBadge;
    final String entryTitle;
    final String entrySummary;
    final String headerSummary;
    final String errorTitle;
    final String errorSummary;
    final String sectionBehavior;
    final String sectionLayouts;
    final String sectionJavaScript;
    final String sectionSlots;
    final String sectionTransfer;
    final String sectionAdvanced;
    final String sectionJavaScriptGuide;
    final String enabledTitle;
    final String enabledSummary;
    final String zhuyinLayoutTitle;
    final String zhuyinLayoutSummary;
    final String englishQwertyLayoutTitle;
    final String englishQwertyLayoutSummary;
    final String globalJavaScriptTitle;
    final String globalJavaScriptSummary;
    final String globalJavaScriptEmptySummary;
    final String globalJavaScriptConfiguredSummary;
    final String globalJavaScriptHint;
    final String javaScriptRuntimeLimitsTitle;
    final String javaScriptRuntimeLimitsSummary;
    final String javaScriptRuntimeLimitsValueFormat;
    final String javaScriptRuntimeLimitsDialogTitle;
    final String javaScriptRuntimeResponseBodyLimitLabel;
    final String javaScriptRuntimeResponseBodyLimitHint;
    final String javaScriptRuntimeTimeoutMaxLabel;
    final String javaScriptRuntimeTimeoutMaxHint;
    final String javaScriptRuntimeMemoryLimitLabel;
    final String javaScriptRuntimeMemoryLimitHint;
    final String javaScriptRuntimeMaxStackLabel;
    final String javaScriptRuntimeMaxStackHint;
    final String javaScriptRuntimeDialogError;
    final String exportTitle;
    final String exportSummary;
    final String importTitle;
    final String importSummary;
    final String exportDoneMessage;
    final String importDoneMessage;
    final String importFailedTitle;
    final String importFailedSummary;
    final String importInvalidSummary;
    final String resetTitle;
    final String resetSummary;
    final String resetConfirmTitle;
    final String resetConfirmMessage;
    final String slotTitleFormat;
    final String slotSummaryPlainFormat;
    final String slotSummaryJavaScriptFormat;
    final String editorDisplayLabel;
    final String editorDisplayHint;
    final String editorCommitLabel;
    final String editorCommitHint;
    final String editorUseJavaScriptLabel;
    final String editorScriptLabel;
    final String editorScriptHint;
    final String editorTimeoutLabel;
    final String editorTimeoutHint;
    final String editorTestInputHint;
    final String editorTestButton;
    final String editorTestRunning;
    final String editorDisplayBlankError;
    final String editorLockedState;
    final String editorUnlockedState;
    final String saveButton;
    final String cancelButton;
    final String closeButton;
    final String clearButton;
    final String resetButton;
    final String testResultTimedOut;
    final String testResultFailedFormat;
    final String testResultFailedGeneric;
    final String testResultOutputFormat;
    final String testResultFinishedNoOutput;
    final String javaScriptGuideExecutionTitle;
    final String javaScriptGuideExecutionSummary;
    final String javaScriptGuideExecutionDialogMessage;
    final String javaScriptGuideReturnTitle;
    final String javaScriptGuideReturnSummary;
    final String javaScriptGuideReturnDialogMessage;
    final String javaScriptGuideHttpTitle;
    final String javaScriptGuideHttpSummary;
    final String javaScriptGuideHttpDialogMessage;
    final String javaScriptGuideLimitsTitle;
    final String javaScriptGuideLimitsSummary;
    final String javaScriptGuideLimitsDialogMessage;
    final String javaScriptGuideExamplesTitle;
    final String javaScriptGuideExamplesSummary;
    final String javaScriptGuideExamplesDialogTitle;
    final String javaScriptGuideExamplesCopyButton;
    final String javaScriptGuideExamplesExpandButton;
    final String javaScriptGuideExamplesCollapseButton;
    final String javaScriptGuideExamplesCopiedFormat;
    final String javaScriptGuideExamplesClipboardUnavailable;
    final String javaScriptExampleHelloWorldTitle;
    final String javaScriptExampleHelloWorldSummary;
    final String javaScriptExampleReturnInputTitle;
    final String javaScriptExampleReturnInputSummary;
    final String javaScriptExampleIpTitle;
    final String javaScriptExampleIpSummary;
    final String javaScriptExampleOpenAiTitle;
    final String javaScriptExampleOpenAiSummary;
    final String javaScriptExampleTimestampTitle;
    final String javaScriptExampleTimestampSummary;
    final String javaScriptExampleUkTimeTitle;
    final String javaScriptExampleUkTimeSummary;
    final String javaScriptExampleUnitConvertTitle;
    final String javaScriptExampleUnitConvertSummary;

    private GboardTopRowSwipeStrings(Context context) {
        headerBadge = GboardSettingsText.get(context,
                R.string.gboard_patches_header_badge,
                "Gboard");
        entryTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_title,
                "Custom Top Row");
        entrySummary = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_summary,
                "Swipe the top row horizontally to open custom text and JavaScript slots.");
        headerSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_header_summary,
                "Controls the custom first-row page opened by horizontal top-row swipe.");
        errorTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_error_title,
                "Custom Top Row settings unavailable");
        errorSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_error_summary,
                "The Custom Top Row settings screen failed to load. Reopen Gboard settings and "
                        + "try again.");
        sectionBehavior = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_section_behavior,
                "Behavior");
        sectionLayouts = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_section_layouts,
                "Supported layouts");
        sectionJavaScript = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_section_javascript,
                "JavaScript");
        sectionSlots = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_section_slots,
                "Slots");
        sectionTransfer = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_section_transfer,
                "Transfer");
        sectionAdvanced = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_section_advanced,
                "Advanced");
        sectionJavaScriptGuide = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_section_javascript_guide,
                "JavaScript Guide");
        enabledTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_enabled_title,
                "Enabled");
        enabledSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_enabled_summary,
                "Enable the custom first-row page opened by horizontal top-row swipe.");
        zhuyinLayoutTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_layout_zhuyin_title,
                "Zhuyin");
        zhuyinLayoutSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_layout_zhuyin_summary,
                "Enable horizontal swipe on the Zhuyin top row.");
        englishQwertyLayoutTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_layout_english_qwerty_title,
                "English QWERTY");
        englishQwertyLayoutSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_layout_english_qwerty_summary,
                "Enable horizontal swipe on the English q-p top row.");
        globalJavaScriptTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_global_javascript_title,
                "Global JavaScript");
        globalJavaScriptSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_global_javascript_summary,
                "Define helper functions available to every JavaScript slot.");
        globalJavaScriptEmptySummary = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_global_javascript_empty_summary,
                "No shared helpers configured.");
        globalJavaScriptConfiguredSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_global_javascript_configured_summary,
                "Script: %1$s");
        globalJavaScriptHint = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_global_javascript_hint,
                "function helper(input) {\n  return input;\n}");
        javaScriptRuntimeLimitsTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_runtime_limits_title,
                "JavaScript Runtime Limits");
        javaScriptRuntimeLimitsSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_runtime_limits_summary,
                "Configure the global response, timeout, memory, and stack limits used by JavaScript slots.");
        javaScriptRuntimeLimitsValueFormat = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_runtime_limits_value,
                "%1$s • %2$s • %3$s • %4$s");
        javaScriptRuntimeLimitsDialogTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_runtime_limits_dialog_title,
                "JavaScript Runtime Limits");
        javaScriptRuntimeResponseBodyLimitLabel = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_runtime_limits_response_body_label,
                "Response body limit (KiB)");
        javaScriptRuntimeResponseBodyLimitHint = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_runtime_limits_response_body_hint,
                "1024");
        javaScriptRuntimeTimeoutMaxLabel = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_runtime_limits_timeout_max_label,
                "Maximum timeout (ms)");
        javaScriptRuntimeTimeoutMaxHint = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_runtime_limits_timeout_max_hint,
                "30000");
        javaScriptRuntimeMemoryLimitLabel = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_runtime_limits_memory_label,
                "Memory limit (MiB)");
        javaScriptRuntimeMemoryLimitHint = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_runtime_limits_memory_hint,
                "8");
        javaScriptRuntimeMaxStackLabel = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_runtime_limits_stack_label,
                "Max stack (KiB)");
        javaScriptRuntimeMaxStackHint = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_runtime_limits_stack_hint,
                "512");
        javaScriptRuntimeDialogError = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_runtime_limits_dialog_error,
                "Enter valid values for all JavaScript runtime limits.");
        exportTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_export_title,
                "Export settings");
        exportSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_export_summary,
                "Save Global JavaScript, runtime limits, and all 10 slot mappings as a JSON file.");
        importTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_import_title,
                "Import settings");
        importSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_import_summary,
                "Open a JSON file and replace Global JavaScript, runtime limits, and all 10 slots.");
        exportDoneMessage = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_export_done,
                "Exported settings");
        importDoneMessage = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_import_done,
                "Imported settings");
        importFailedTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_import_failed_title,
                "Import failed");
        importFailedSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_import_failed_summary,
                "The selected file could not be imported.");
        importInvalidSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_import_invalid_summary,
                "The selected file is not valid.");
        resetTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_reset_title,
                "Reset slots");
        resetSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_reset_summary,
                "Restore all 10 slots to the default emoji row.");
        resetConfirmTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_reset_confirm_title,
                "Reset all slots?");
        resetConfirmMessage = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_reset_confirm_message,
                "This restores all 10 display/input mappings to the default emoji row.");
        slotTitleFormat = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_slot_title,
                "Slot %1$d");
        slotSummaryPlainFormat = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_slot_summary_plain,
                "Display: %1$s\nInput: %2$s");
        slotSummaryJavaScriptFormat = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_slot_summary_javascript,
                "Display: %1$s\nJavaScript\nTimeout: %2$d ms\nScript: %3$s");
        editorDisplayLabel = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_editor_display_label,
                "Display text");
        editorDisplayHint = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_editor_display_hint,
                "Display text");
        editorCommitLabel = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_editor_commit_label,
                "Input text");
        editorCommitHint = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_editor_commit_hint,
                "Input text");
        editorUseJavaScriptLabel = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_editor_use_javascript,
                "Use JavaScript");
        editorScriptLabel = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_editor_script_label,
                "JavaScript");
        editorScriptHint = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_editor_script_hint,
                "JavaScript");
        editorTimeoutLabel = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_editor_timeout_label,
                "Timeout (ms)");
        editorTimeoutHint = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_editor_timeout_hint,
                "Timeout (ms)");
        editorTestInputHint = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_editor_test_input_hint,
                "Test input (select text for input)");
        editorTestButton = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_editor_test_button,
                "Test");
        editorTestRunning = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_editor_test_running,
                "Running...");
        editorDisplayBlankError = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_editor_display_blank_error,
                "Display text cannot be blank");
        editorLockedState = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_editor_locked_state,
                "Locked");
        editorUnlockedState = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_editor_unlocked_state,
                "Unlocked");
        saveButton = GboardSettingsText.get(context,
                R.string.gboard_patches_dialog_save,
                "Save");
        cancelButton = GboardSettingsText.get(context,
                R.string.gboard_patches_dialog_cancel,
                "Cancel");
        closeButton = GboardSettingsText.get(context,
                R.string.gboard_patches_dialog_close,
                "Close");
        clearButton = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_clear_button,
                "Clear");
        resetButton = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_reset_button,
                "Reset");
        testResultTimedOut = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_test_result_timed_out,
                "Timed out");
        testResultFailedFormat = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_test_result_failed,
                "Failed: %1$s");
        testResultFailedGeneric = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_test_result_failed_generic,
                "QuickJS test failed");
        testResultOutputFormat = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_test_result_output,
                "Output: %1$s");
        testResultFinishedNoOutput = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_test_result_finished_no_output,
                "Finished: no output");
        javaScriptGuideExecutionTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_guide_execution_title,
                "Execution Model");
        javaScriptGuideExecutionSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_guide_execution_summary,
                "Use input for selected text. Return a string to commit it. Each tap starts a fresh QuickJS runtime.");
        javaScriptGuideExecutionDialogMessage = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_guide_execution_dialog_message,
                "Use input to read the current selection. If nothing is selected, input is an empty string.\n\n"
                        + "Return a string to commit it to the editor. Returning null, undefined, or nothing finishes without commit.\n\n"
                        + "Global JavaScript runs before the slot body on every key press.\n\n"
                        + "The slot body and Global JavaScript share the same execution, but every tap creates a fresh QuickJS runtime and context. Do not rely on state from an earlier run.\n\n"
                        + "If Global JavaScript needs input, define a helper there and pass input into it from the slot body.\n\n"
                        + "This environment is synchronous-only. DOM, Node.js APIs, fetch, and async request pipelines are not available.");
        javaScriptGuideReturnTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_guide_return_title,
                "Return & Commit");
        javaScriptGuideReturnSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_guide_return_summary,
                "Only non-null return values commit text, and commit is skipped if InputConnection changed during execution.");
        javaScriptGuideReturnDialogMessage = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_guide_return_dialog_message,
                "Return contract:\n"
                        + "- return a non-null and non-undefined value to commit it as text\n"
                        + "- return null, return undefined, or omit return to finish without commit\n\n"
                        + "Even after a successful run, text only commits when the InputConnection at the end is still the same object captured at the start. Focus changes or editor switches fail closed.");
        javaScriptGuideHttpTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_guide_http_title,
                "Host APIs");
        javaScriptGuideHttpSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_guide_http_summary,
                "Beyond standard QuickJS features, this patch also provides input, httpRequest(options), httpGet(url), and httpPost(url, body).");
        javaScriptGuideHttpDialogMessage = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_guide_http_dialog_message,
                "Beyond standard QuickJS features, this patch provides these extra host APIs:\n"
                        + "- input\n"
                        + "- httpRequest(options)\n"
                        + "- httpGet(url)\n"
                        + "- httpPost(url, body)\n\n"
                        + "httpRequest only accepts GET, POST, PUT, PATCH, and DELETE. Only http:// and https:// URLs are allowed. headers must be a plain object, and body is sent as UTF-8.\n\n"
                        + "Non-2xx status, invalid method, invalid URL scheme, timeout, invalid headers, transport errors, and response bodies over the configured limit all throw script errors.");
        javaScriptGuideLimitsTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_guide_limits_title,
                "Limits & Fail-Closed");
        javaScriptGuideLimitsSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_guide_limits_summary,
                "Slots are clamped by global timeout, response, memory, and stack limits; syntax and runtime errors fail only that run.");
        javaScriptGuideLimitsDialogMessage = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_guide_limits_dialog_message,
                "Runtime limits:\n"
                        + "- slot timeoutMs input must stay within 0..global timeoutMaxMs; after sanitize the runtime minimum is 1 ms\n"
                        + "- response body limit, memory limit, and max stack come from JavaScript Runtime Limits\n\n"
                        + "Defaults:\n"
                        + "- timeoutMaxMs: 30000 ms\n"
                        + "- response body: 1 MiB\n"
                        + "- memory: 8 MiB\n"
                        + "- max stack: 512 KiB\n\n"
                        + "Syntax errors, runtime errors, timeouts, HTTP failures, oversized responses, and InputConnection changes fail closed for the current run only. They do not disable the whole Custom Top Row feature.");
        javaScriptGuideExamplesTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_guide_examples_title,
                "Examples");
        javaScriptGuideExamplesSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_guide_examples_summary,
                "Copy ready-to-use snippets, from basic return examples to IP lookup, OpenAI calls, timestamps, UK time, and unit conversion.");
        javaScriptGuideExamplesDialogTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_guide_examples_dialog_title,
                "JavaScript Examples");
        javaScriptGuideExamplesCopyButton = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_guide_examples_copy_button,
                "Copy to clipboard");
        javaScriptGuideExamplesExpandButton = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_guide_examples_expand_button,
                "Expand");
        javaScriptGuideExamplesCollapseButton = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_guide_examples_collapse_button,
                "Collapse");
        javaScriptGuideExamplesCopiedFormat = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_guide_examples_copied_format,
                "Copied example: %1$s");
        javaScriptGuideExamplesClipboardUnavailable = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_guide_examples_clipboard_unavailable,
                "Clipboard unavailable");
        javaScriptExampleHelloWorldTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_example_hello_world_title,
                "Hello World");
        javaScriptExampleHelloWorldSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_example_hello_world_summary,
                "Returns a fixed string literal to the editor.");
        javaScriptExampleReturnInputTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_example_return_input_title,
                "Return Input");
        javaScriptExampleReturnInputSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_example_return_input_summary,
                "Commits the current input string unchanged.");
        javaScriptExampleIpTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_example_ip_title,
                "Current IP");
        javaScriptExampleIpSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_example_ip_summary,
                "Gets the current public IP address with a simple GET request.");
        javaScriptExampleOpenAiTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_example_openai_title,
                "OpenAI via HTTP");
        javaScriptExampleOpenAiSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_example_openai_summary,
                "Calls the OpenAI Responses API with gpt-5.5 using httpRequest.");
        javaScriptExampleTimestampTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_example_timestamp_title,
                "Current Timestamp");
        javaScriptExampleTimestampSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_example_timestamp_summary,
                "Returns the current Unix timestamp in milliseconds.");
        javaScriptExampleUkTimeTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_example_uk_time_title,
                "UK Time");
        javaScriptExampleUkTimeSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_example_uk_time_summary,
                "Fetches the current London time and formats it as a local timestamp string.");
        javaScriptExampleUnitConvertTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_example_unit_convert_title,
                "Unit Auto Conversion");
        javaScriptExampleUnitConvertSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_example_unit_convert_summary,
                "Converts inputs like 10lbs, 40kg, 100F, or 40C in both directions.");
    }

    static GboardTopRowSwipeStrings from(Context context) {
        return new GboardTopRowSwipeStrings(context);
    }

    String slotTitle(int index) {
        return String.format(slotTitleFormat, index + 1);
    }

    String slotSummary(GboardTopRowSwipeSettings.SlotText slot) {
        if (slot == null) {
            return "";
        }
        if (slot.isJavaScript) {
            return String.format(slotSummaryJavaScriptFormat,
                    slot.displayText,
                    slot.timeoutMs,
                    scriptPreview(slot.scriptText));
        }
        return String.format(slotSummaryPlainFormat, slot.displayText, slot.commitText);
    }

    String globalJavaScriptSummary(String globalJavaScript) {
        String preview = scriptPreview(globalJavaScript);
        if (preview.isEmpty()) {
            return globalJavaScriptSummary + "\n" + globalJavaScriptEmptySummary;
        }
        return globalJavaScriptSummary + "\n"
                + String.format(globalJavaScriptConfiguredSummary, preview);
    }

    String javaScriptRuntimeLimitsCurrentValue(
            GboardTopRowSwipeSettings.JavaScriptRuntimeLimits javaScriptRuntimeLimits) {
        GboardTopRowSwipeSettings.JavaScriptRuntimeLimits limits =
                javaScriptRuntimeLimits != null ? javaScriptRuntimeLimits
                        : GboardTopRowSwipeSettings.defaultJavaScriptRuntimeLimits();
        return String.format(javaScriptRuntimeLimitsValueFormat,
                formatKiB(limits.responseBodyLimitBytes),
                formatMs(limits.timeoutMaxMs),
                formatMiB(limits.memoryLimitBytes),
                formatKiB(limits.maxStackBytes));
    }

    String testResultMessage(boolean success, boolean timedOut, boolean shouldCommit,
            String committedText, String errorMessage) {
        if (timedOut) {
            return testResultTimedOut;
        }
        if (!success || errorMessage != null) {
            String message = errorMessage != null && !errorMessage.isBlank()
                    ? errorMessage : testResultFailedGeneric;
            return String.format(testResultFailedFormat, message);
        }
        if (shouldCommit && committedText != null) {
            return String.format(testResultOutputFormat, committedText);
        }
        return testResultFinishedNoOutput;
    }

    private static String scriptPreview(String script) {
        String preview = script != null ? script.trim() : "";
        preview = preview.replace('\r', ' ').replace('\n', ' ');
        while (preview.contains("  ")) {
            preview = preview.replace("  ", " ");
        }
        if (preview.length() <= SCRIPT_PREVIEW_MAX_LENGTH) {
            return preview;
        }
        return preview.substring(0, SCRIPT_PREVIEW_MAX_LENGTH - 3) + "...";
    }

    private static String formatKiB(int bytes) {
        return (bytes / 1024) + " KiB";
    }

    private static String formatMiB(int bytes) {
        return (bytes / (1024 * 1024)) + " MiB";
    }

    private static String formatMs(int value) {
        return value + " ms";
    }
}

