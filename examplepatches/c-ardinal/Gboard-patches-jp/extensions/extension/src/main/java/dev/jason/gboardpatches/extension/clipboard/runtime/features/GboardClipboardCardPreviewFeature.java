package dev.jason.gboardpatches.extension.clipboard;

import java.lang.reflect.Field;
import java.util.ArrayDeque;
import java.util.List;

final class GboardClipboardCardPreviewFeature {
    static final int PREVIEW_CHARACTER_LIMIT = 1_000;

    private final GboardClipboardRuntimeSupport support;
    private final ThreadLocal<ArrayDeque<PreviewScope>> scopes =
            new ThreadLocal<ArrayDeque<PreviewScope>>();

    GboardClipboardCardPreviewFeature(GboardClipboardRuntimeSupport support) {
        this.support = support;
    }

    void beforeItemBind(Object receiver, int position) {
        PreviewScope scope = new PreviewScope();
        scopes().push(scope);
        support.runSafely("limit clipboard card preview", () -> {
            preparePreview(receiver, position, scope);
        });
    }

    void afterItemBind() {
        ArrayDeque<PreviewScope> stack = scopes.get();
        PreviewScope scope = stack == null ? null : stack.pollFirst();
        if (stack != null && stack.isEmpty()) {
            scopes.remove();
        }
        if (scope == null || !scope.hasMutation()) {
            return;
        }
        support.runSafely("restore full clipboard card text", scope::restore);
    }

    private void preparePreview(Object receiver, int position, PreviewScope scope)
            throws Throwable {
        if (receiver == null) {
            return;
        }
        support.registerContextFromReceiver(receiver);
        GboardClipboardRuntimeSupport.RuntimeSettings settings = support.runtimeSettings();
        if (!settings.enabled || !settings.cardPreviewLimitEnabled) {
            return;
        }
        GboardClipboardRuntimeSupport.ReflectionHandles handles =
                support.reflectionHandles(receiver.getClass().getClassLoader());
        @SuppressWarnings("unchecked")
        List<Object> items = (List<Object>) handles.adapterItemsField.get(receiver);
        if (items == null || position < 0 || position >= items.size()) {
            return;
        }
        Object clip = items.get(position);
        if (clip == null || clip == handles.recentHeader || clip == handles.pinnedHeader
                || clip == handles.specialHeader) {
            return;
        }
        Object model = handles.clipModelField.get(clip);
        if (model == null) {
            return;
        }
        Object rawText = handles.clipModelTextField.get(model);
        if (!(rawText instanceof String originalText)
                || originalText.length() <= PREVIEW_CHARACTER_LIMIT) {
            return;
        }
        scope.capture(handles.clipModelTextField, model, originalText);
        handles.clipModelTextField.set(
                model,
                originalText.substring(0, PREVIEW_CHARACTER_LIMIT));
        support.logLimited(
                support.cardPreviewLimitCount,
                20,
                GboardClipboardRuntimeSupport.LOG_PREFIX
                        + " card preview limited position=" + position
                        + ", originalLength=" + originalText.length()
                        + ", previewLength=" + PREVIEW_CHARACTER_LIMIT);
    }

    private ArrayDeque<PreviewScope> scopes() {
        ArrayDeque<PreviewScope> stack = scopes.get();
        if (stack == null) {
            stack = new ArrayDeque<PreviewScope>();
            scopes.set(stack);
        }
        return stack;
    }

    private static final class PreviewScope {
        private Field textField;
        private Object model;
        private String originalText;

        void capture(Field textField, Object model, String originalText) {
            this.textField = textField;
            this.model = model;
            this.originalText = originalText;
        }

        boolean hasMutation() {
            return textField != null && model != null && originalText != null;
        }

        void restore() throws IllegalAccessException {
            textField.set(model, originalText);
        }
    }
}
