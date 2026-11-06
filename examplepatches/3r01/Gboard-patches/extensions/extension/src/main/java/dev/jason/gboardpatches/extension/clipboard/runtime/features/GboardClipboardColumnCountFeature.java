package dev.jason.gboardpatches.extension.clipboard;

import android.content.Context;

final class GboardClipboardColumnCountFeature {
    private final GboardClipboardRuntimeSupport support;

    GboardClipboardColumnCountFeature(GboardClipboardRuntimeSupport support) {
        this.support = support;
    }

    Integer resolveOverride(Object receiver) {
        return support.runSafely("resolve clipboard column count override", () -> {
            if (receiver == null) {
                return null;
            }
            Context context = support.runtimeContext(receiver);
            if (context != null) {
                support.registerApplicationContext(context);
            }
            GboardClipboardRuntimeSupport.RuntimeSettings settings = support.runtimeSettings();
            if (!settings.enabled) {
                return null;
            }
            return Integer.valueOf(support.configuredColumnCount());
        }, null);
    }
}
