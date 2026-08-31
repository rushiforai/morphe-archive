package dev.jason.gboardpatches.extension.longpressquickactions;

import android.view.inputmethod.InputConnection;

/** Stable editor admission rules shared by long-press and globe-drag shortcuts. */
final class GboardEditingShortcutDispatchGuard {
    private GboardEditingShortcutDispatchGuard() {
    }

    static boolean shouldDispatchContextMenuAction(
            InputConnection connection, int actionId) {
        if (connection == null || actionId == 0) {
            return false;
        }
        if (!requiresNonEmptySelection(actionId)) {
            return true;
        }
        try {
            CharSequence selectedText = connection.getSelectedText(0);
            return selectedText != null && selectedText.length() > 0;
        } catch (Throwable ignored) {
            return false;
        }
    }

    static boolean requiresNonEmptySelection(int actionId) {
        return actionId == android.R.id.copy || actionId == android.R.id.cut;
    }
}
