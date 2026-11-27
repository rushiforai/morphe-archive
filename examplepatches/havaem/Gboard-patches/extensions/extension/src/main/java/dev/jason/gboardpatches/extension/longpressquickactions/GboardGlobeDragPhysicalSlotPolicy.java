package dev.jason.gboardpatches.extension.longpressquickactions;

/** Capability-gates canonical alphabet slots without language-specific IDs. */
final class GboardGlobeDragPhysicalSlotPolicy {
    enum ShortcutSlot {
        SELECT_ALL,
        UNDO,
        CUT,
        COPY,
        PASTE,
        REDO
    }

    private GboardGlobeDragPhysicalSlotPolicy() {
    }

    static GboardEditingShortcutPolicy.Shortcut resolve(
            ShortcutSlot slot,
            String pressText,
            int pressCarrierCode,
            int alphabetCarrierCode) {
        if (slot == null || !isAlphabetKey(
                pressText, pressCarrierCode, alphabetCarrierCode)) {
            return null;
        }
        return switch (slot) {
            case SELECT_ALL -> GboardEditingShortcutPolicy.Shortcut.SELECT_ALL;
            case UNDO -> GboardEditingShortcutPolicy.Shortcut.UNDO;
            case CUT -> GboardEditingShortcutPolicy.Shortcut.CUT;
            case COPY -> GboardEditingShortcutPolicy.Shortcut.COPY;
            case PASTE -> GboardEditingShortcutPolicy.Shortcut.PASTE;
            case REDO -> GboardEditingShortcutPolicy.Shortcut.REDO;
        };
    }

    static boolean isAlphabetKey(String pressText, int pressCarrierCode,
            int alphabetCarrierCode) {
        if (pressText == null || pressText.isEmpty()
                || pressText.codePointCount(0, pressText.length()) != 1) {
            return false;
        }
        return Character.isLetter(pressText.codePointAt(0))
                && pressCarrierCode == alphabetCarrierCode;
    }
}
