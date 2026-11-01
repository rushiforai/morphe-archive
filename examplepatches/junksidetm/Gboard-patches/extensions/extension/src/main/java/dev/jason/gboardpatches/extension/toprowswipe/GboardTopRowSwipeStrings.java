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
                R.string.gboard_patches_header_badge);
        entryTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_title);
        entrySummary = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_summary);
        headerSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_header_summary);
        errorTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_error_title);
        errorSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_error_summary);
        sectionBehavior = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_section_behavior);
        sectionLayouts = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_section_layouts);
        sectionJavaScript = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_section_javascript);
        sectionSlots = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_section_slots);
        sectionTransfer = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_section_transfer);
        sectionAdvanced = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_section_advanced);
        sectionJavaScriptGuide = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_section_javascript_guide);
        enabledTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_enabled_title);
        enabledSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_enabled_summary);
        zhuyinLayoutTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_layout_zhuyin_title);
        zhuyinLayoutSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_layout_zhuyin_summary);
        englishQwertyLayoutTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_layout_english_qwerty_title);
        englishQwertyLayoutSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_layout_english_qwerty_summary);
        globalJavaScriptTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_global_javascript_title);
        globalJavaScriptSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_global_javascript_summary);
        globalJavaScriptEmptySummary = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_global_javascript_empty_summary);
        globalJavaScriptConfiguredSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_global_javascript_configured_summary);
        globalJavaScriptHint = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_global_javascript_hint);
        javaScriptRuntimeLimitsTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_runtime_limits_title);
        javaScriptRuntimeLimitsSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_runtime_limits_summary);
        javaScriptRuntimeLimitsValueFormat = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_runtime_limits_value);
        javaScriptRuntimeLimitsDialogTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_runtime_limits_dialog_title);
        javaScriptRuntimeResponseBodyLimitLabel = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_runtime_limits_response_body_label);
        javaScriptRuntimeResponseBodyLimitHint = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_runtime_limits_response_body_hint);
        javaScriptRuntimeTimeoutMaxLabel = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_runtime_limits_timeout_max_label);
        javaScriptRuntimeTimeoutMaxHint = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_runtime_limits_timeout_max_hint);
        javaScriptRuntimeMemoryLimitLabel = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_runtime_limits_memory_label);
        javaScriptRuntimeMemoryLimitHint = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_runtime_limits_memory_hint);
        javaScriptRuntimeMaxStackLabel = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_runtime_limits_stack_label);
        javaScriptRuntimeMaxStackHint = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_runtime_limits_stack_hint);
        javaScriptRuntimeDialogError = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_runtime_limits_dialog_error);
        exportTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_export_title);
        exportSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_export_summary);
        importTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_import_title);
        importSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_import_summary);
        exportDoneMessage = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_export_done);
        importDoneMessage = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_import_done);
        importFailedTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_import_failed_title);
        importFailedSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_import_failed_summary);
        importInvalidSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_import_invalid_summary);
        resetTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_reset_title);
        resetSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_reset_summary);
        resetConfirmTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_reset_confirm_title);
        resetConfirmMessage = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_reset_confirm_message);
        slotTitleFormat = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_slot_title);
        slotSummaryPlainFormat = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_slot_summary_plain);
        slotSummaryJavaScriptFormat = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_slot_summary_javascript);
        editorDisplayLabel = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_editor_display_label);
        editorDisplayHint = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_editor_display_hint);
        editorCommitLabel = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_editor_commit_label);
        editorCommitHint = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_editor_commit_hint);
        editorUseJavaScriptLabel = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_editor_use_javascript);
        editorScriptLabel = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_editor_script_label);
        editorScriptHint = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_editor_script_hint);
        editorTimeoutLabel = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_editor_timeout_label);
        editorTimeoutHint = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_editor_timeout_hint);
        editorTestInputHint = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_editor_test_input_hint);
        editorTestButton = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_editor_test_button);
        editorTestRunning = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_editor_test_running);
        editorDisplayBlankError = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_editor_display_blank_error);
        editorLockedState = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_editor_locked_state);
        editorUnlockedState = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_editor_unlocked_state);
        saveButton = GboardSettingsText.get(context,
                R.string.gboard_patches_dialog_save);
        cancelButton = GboardSettingsText.get(context,
                R.string.gboard_patches_dialog_cancel);
        closeButton = GboardSettingsText.get(context,
                R.string.gboard_patches_dialog_close);
        clearButton = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_clear_button);
        resetButton = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_reset_button);
        testResultTimedOut = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_test_result_timed_out);
        testResultFailedFormat = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_test_result_failed);
        testResultFailedGeneric = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_test_result_failed_generic);
        testResultOutputFormat = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_test_result_output);
        testResultFinishedNoOutput = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_test_result_finished_no_output);
        javaScriptGuideExecutionTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_guide_execution_title);
        javaScriptGuideExecutionSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_guide_execution_summary);
        javaScriptGuideExecutionDialogMessage = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_guide_execution_dialog_message);
        javaScriptGuideReturnTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_guide_return_title);
        javaScriptGuideReturnSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_guide_return_summary);
        javaScriptGuideReturnDialogMessage = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_guide_return_dialog_message);
        javaScriptGuideHttpTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_guide_http_title);
        javaScriptGuideHttpSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_guide_http_summary);
        javaScriptGuideHttpDialogMessage = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_guide_http_dialog_message);
        javaScriptGuideLimitsTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_guide_limits_title);
        javaScriptGuideLimitsSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_guide_limits_summary);
        javaScriptGuideLimitsDialogMessage = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_guide_limits_dialog_message);
        javaScriptGuideExamplesTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_guide_examples_title);
        javaScriptGuideExamplesSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_guide_examples_summary);
        javaScriptGuideExamplesDialogTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_guide_examples_dialog_title);
        javaScriptGuideExamplesCopyButton = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_guide_examples_copy_button);
        javaScriptGuideExamplesExpandButton = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_guide_examples_expand_button);
        javaScriptGuideExamplesCollapseButton = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_guide_examples_collapse_button);
        javaScriptGuideExamplesCopiedFormat = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_guide_examples_copied_format);
        javaScriptGuideExamplesClipboardUnavailable = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_guide_examples_clipboard_unavailable);
        javaScriptExampleHelloWorldTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_example_hello_world_title);
        javaScriptExampleHelloWorldSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_example_hello_world_summary);
        javaScriptExampleReturnInputTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_example_return_input_title);
        javaScriptExampleReturnInputSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_example_return_input_summary);
        javaScriptExampleIpTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_example_ip_title);
        javaScriptExampleIpSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_example_ip_summary);
        javaScriptExampleOpenAiTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_example_openai_title);
        javaScriptExampleOpenAiSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_example_openai_summary);
        javaScriptExampleTimestampTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_example_timestamp_title);
        javaScriptExampleTimestampSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_example_timestamp_summary);
        javaScriptExampleUkTimeTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_example_uk_time_title);
        javaScriptExampleUkTimeSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_example_uk_time_summary);
        javaScriptExampleUnitConvertTitle = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_example_unit_convert_title);
        javaScriptExampleUnitConvertSummary = GboardSettingsText.get(context,
                R.string.gboard_patches_top_row_js_example_unit_convert_summary);
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

