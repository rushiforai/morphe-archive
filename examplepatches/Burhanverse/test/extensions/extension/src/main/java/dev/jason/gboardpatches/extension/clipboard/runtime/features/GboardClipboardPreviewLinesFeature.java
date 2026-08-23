package dev.jason.gboardpatches.extension.clipboard;

import android.widget.TextView;

final class GboardClipboardPreviewLinesFeature {
    private final GboardClipboardRuntimeSupport support;

    GboardClipboardPreviewLinesFeature(GboardClipboardRuntimeSupport support) {
        this.support = support;
    }

    void applyConfiguredMaxLines(TextView textView, int position,
            GboardClipboardRuntimeSupport.RuntimeSettings settings) {
        support.runSafely("apply clipboard preview lines override", () -> {
            if (textView == null || settings == null) {
                return;
            }
            int configuredMaxLines = settings.clipboardContentMaxLines;
            int before = textView.getMaxLines();
            Integer previousOverride = support.activeMaxLinesOverrideByTextView.get(textView);
            if (before == configuredMaxLines) {
                support.activeMaxLinesOverrideByTextView.put(
                        textView,
                        Integer.valueOf(configuredMaxLines));
                return;
            }
            if (before != GboardClipboardRuntimeSupport.STOCK_CLIPBOARD_CONTENT_MAX_LINES
                    && (previousOverride == null || before != previousOverride.intValue())) {
                return;
            }

            textView.setMaxLines(configuredMaxLines);
            support.activeMaxLinesOverrideByTextView.put(
                    textView,
                    Integer.valueOf(configuredMaxLines));
            int after = textView.getMaxLines();
            support.logLimited(support.textMaxLinesPatchCount, 20,
                    GboardClipboardRuntimeSupport.LOG_PREFIX
                            + " clipboard text maxLines override applied"
                            + " position=" + position
                            + ", configured=" + configuredMaxLines
                            + ", before=" + before
                            + ", after=" + after
                            + ", view=" + Integer.toHexString(System.identityHashCode(textView)));
        });
    }

    void restoreStockMaxLines(TextView textView) {
        support.runSafely("restore clipboard preview lines override", () -> {
            if (textView == null) {
                return;
            }
            Integer previousOverride = support.activeMaxLinesOverrideByTextView.remove(textView);
            if (previousOverride != null
                    && textView.getMaxLines() == previousOverride.intValue()) {
                textView.setMaxLines(GboardClipboardRuntimeSupport.STOCK_CLIPBOARD_CONTENT_MAX_LINES);
            }
        });
    }
}
