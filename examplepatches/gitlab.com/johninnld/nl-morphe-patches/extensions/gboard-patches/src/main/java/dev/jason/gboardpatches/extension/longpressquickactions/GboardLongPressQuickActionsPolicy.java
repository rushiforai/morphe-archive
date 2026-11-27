package dev.jason.gboardpatches.extension.longpressquickactions;

public final class GboardLongPressQuickActionsPolicy {
    private static final QuickAction SELECT_ALL = new QuickAction(
            -0x2766, 0x7f0804d1, GboardEditingShortcutPolicy.Shortcut.SELECT_ALL, true);
    private static final QuickAction UNDO = new QuickAction(
            -0x273d, 0x7f0804fe, GboardEditingShortcutPolicy.Shortcut.UNDO, true);
    private static final QuickAction COPY = new QuickAction(
            -0x2767, 0x7f080435, GboardEditingShortcutPolicy.Shortcut.COPY, true);
    private static final QuickAction CUT = new QuickAction(
            -0x2769, 0x7f080436, GboardEditingShortcutPolicy.Shortcut.CUT, true);
    private static final QuickAction PASTE = new QuickAction(
            -0x2768, 0x7f080438, GboardEditingShortcutPolicy.Shortcut.PASTE, true);
    private static final QuickAction REDO = new QuickAction(
            -0x27a3, 0x7f0804c2, GboardEditingShortcutPolicy.Shortcut.REDO, true);

    private GboardLongPressQuickActionsPolicy() {
    }

    public static QuickAction plan(int keyId, String pressText, int[] existingCodes) {
        QuickAction action = resolve(keyId, pressText);
        if (action == null || contains(existingCodes, action.actionCode)) {
            return null;
        }
        return action;
    }

    public static Integer contextMenuActionFor(int keyId, String pressText,
            String actionTypeName, int selectedCode) {
        if (!isQuickActionEvent(keyId, pressText, actionTypeName, selectedCode)) {
            return null;
        }
        QuickAction action = resolve(keyId, pressText);
        if (action == null || action.contextMenuActionId == 0) {
            return null;
        }
        return Integer.valueOf(action.contextMenuActionId);
    }

    public static boolean isQuickActionEvent(int keyId, String pressText,
            String actionTypeName, int selectedCode) {
        if (!"LONG_PRESS".equals(actionTypeName)) {
            return false;
        }
        QuickAction action = resolve(keyId, pressText);
        return action != null && action.actionCode == selectedCode;
    }

    public static boolean containsAssignedAction(int keyId, String pressText,
            int[] existingCodes) {
        QuickAction action = resolve(keyId, pressText);
        return action != null && contains(existingCodes, action.actionCode);
    }

    public static GboardEditingShortcutPolicy.Shortcut shortcutForChord(
            int keyId, String pressText, int selectedCode, int typingPulseCode,
            int plainTextCode) {
        QuickAction action = resolve(keyId, pressText);
        if (action == null) {
            return null;
        }
        GboardEditingShortcutPolicy.Shortcut latinCarrier =
                GboardEditingShortcutPolicy.resolveLatinChord(
                        pressText, selectedCode, typingPulseCode);
        return selectedCode == action.actionCode
                || selectedCode == plainTextCode
                || latinCarrier == action.shortcut
                ? action.shortcut : null;
    }

    public static GboardEditingShortcutPolicy.Shortcut shortcutForPointerTarget(
            int keyId, String pressText, int pressCarrierCode,
            int typingPulseCode) {
        QuickAction action = resolve(keyId, pressText);
        if (action == null) {
            return null;
        }
        return GboardEditingShortcutPolicy.resolveLatinChord(
                pressText, pressCarrierCode, typingPulseCode) == action.shortcut
                ? action.shortcut : null;
    }

    public static boolean isZhuyinKeyId(int keyId) {
        return keyId >= 0x7f0b289f && keyId <= 0x7f0b28cb;
    }

    private static QuickAction resolve(int keyId, String pressText) {
        if (pressText == null) {
            return null;
        }
        return switch (keyId) {
            case 0x7f0b18bc -> "a".equals(pressText) ? SELECT_ALL : null;
            case 0x7f0b17df -> "A".equals(pressText) ? SELECT_ALL : null;
            case 0x7f0b19f5 -> "z".equals(pressText) ? UNDO : null;
            case 0x7f0b1895 -> "Z".equals(pressText) ? UNDO : null;
            case 0x7f0b18d1 -> "c".equals(pressText) ? COPY : null;
            case 0x7f0b17f0 -> "C".equals(pressText) ? COPY : null;
            case 0x7f0b19eb -> "x".equals(pressText) ? CUT : null;
            case 0x7f0b1890 -> "X".equals(pressText) ? CUT : null;
            case 0x7f0b19e3 -> "v".equals(pressText) ? PASTE : null;
            case 0x7f0b188b -> "V".equals(pressText) ? PASTE : null;
            case 0x7f0b19ee -> "y".equals(pressText) ? REDO : null;
            case 0x7f0b1891 -> "Y".equals(pressText) ? REDO : null;
            case 0x7f0b28b7 -> "a".equals(pressText) ? SELECT_ALL : null;
            case 0x7f0b28ae -> "z".equals(pressText) ? UNDO : null;
            case 0x7f0b28b1 -> "c".equals(pressText) ? COPY : null;
            case 0x7f0b28b6 -> "x".equals(pressText) ? CUT : null;
            case 0x7f0b28c8 -> "v".equals(pressText) ? PASTE : null;
            case 0x7f0b28ca -> "y".equals(pressText) ? REDO : null;
            default -> null;
        };
    }

    private static boolean contains(int[] values, int expected) {
        if (values == null) {
            return false;
        }
        for (int value : values) {
            if (value == expected) {
                return true;
            }
        }
        return false;
    }

    public static final class QuickAction {
        public final int actionCode;
        public final int iconResId;
        public final String debugName;
        public final int contextMenuActionId;
        public final GboardEditingShortcutPolicy.Shortcut shortcut;

        private QuickAction(int actionCode, int iconResId,
                GboardEditingShortcutPolicy.Shortcut shortcut,
                boolean dispatchThroughInputConnection) {
            this.actionCode = actionCode;
            this.iconResId = iconResId;
            this.shortcut = shortcut;
            this.debugName = shortcut.debugName;
            this.contextMenuActionId = dispatchThroughInputConnection
                    ? shortcut.contextMenuActionId : 0;
        }
    }
}
