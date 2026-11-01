package dev.jason.gboardpatches.extension.clipboard;

import android.widget.TextView;

final class GboardClipboardSensitiveContentFeature {
    private final GboardClipboardRuntimeSupport support;

    GboardClipboardSensitiveContentFeature(GboardClipboardRuntimeSupport support) {
        this.support = support;
    }

    void apply(GboardClipboardRuntimeSupport.ReflectionHandles handles, TextView textView,
            Object clip, GboardClipboardRuntimeSupport.RuntimeSettings settings)
            throws Throwable {
        Object sensitiveValue = handles.clipIsSensitiveMethod.invoke(clip);
        if (!(sensitiveValue instanceof Boolean)
                || !((Boolean) sensitiveValue).booleanValue()) {
            return;
        }
        Object model = handles.clipModelField.get(clip);
        if (model == null) {
            return;
        }
        Object rawText = handles.clipModelTextField.get(model);
        if (!(rawText instanceof String)) {
            return;
        }
        String originalText = (String) rawText;
        String resolvedText = resolveSensitiveClipboardText(
                settings.enabled && settings.showSensitiveClipboardContent,
                originalText,
                settings.cardPreviewLimitEnabled);
        textView.setText(resolvedText);
        if (settings.enabled && settings.showSensitiveClipboardContent) {
            support.logLimited(
                    support.sensitiveContentRevealCount,
                    20,
                    GboardClipboardRuntimeSupport.LOG_PREFIX
                            + " sensitive clipboard content revealed length="
                            + resolvedText.length());
        }
    }

    static String resolveSensitiveClipboardText(boolean showSensitiveContent,
            String originalText, boolean cardPreviewLimitEnabled) {
        if (originalText == null) {
            return "";
        }
        String displayText = originalText;
        if (cardPreviewLimitEnabled
                && displayText.length() > GboardClipboardCardPreviewFeature.PREVIEW_CHARACTER_LIMIT) {
            displayText = displayText.substring(
                    0,
                    GboardClipboardCardPreviewFeature.PREVIEW_CHARACTER_LIMIT);
        }
        if (showSensitiveContent) {
            return displayText;
        }
        StringBuilder maskedText = new StringBuilder(displayText.length());
        for (int index = 0; index < displayText.length(); index++) {
            maskedText.append('\u2022');
        }
        return maskedText.toString();
    }
}
