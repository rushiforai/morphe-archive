package dev.jason.gboardpatches.extension.clipboard;

import android.content.Context;

final class GboardClipboardColumnCountHookAdapter {
    private final GboardClipboardColumnCountFeature columnCountFeature;

    GboardClipboardColumnCountHookAdapter(GboardClipboardColumnCountFeature columnCountFeature) {
        this.columnCountFeature = columnCountFeature;
    }

    Integer resolveColumnCountOverride(Object receiver) {
        return columnCountFeature.resolveOverride(receiver);
    }
}
