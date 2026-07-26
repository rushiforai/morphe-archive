package dev.jason.gboardpatches.extension.longpressquickactions;

public final class GboardLongPressQuickActions1777Policy {
    private static final QuickAction SELECT_ALL = new QuickAction(
            -0x2766, 0x7f0804a7, "Select all", 0x102001f);
    private static final QuickAction UNDO = new QuickAction(
            -0x273d, 0x7f0804db, "Undo", 0);
    private static final QuickAction COPY = new QuickAction(
            -0x2767, 0x7f080425, "Copy", 0x1020021);
    private static final QuickAction CUT = new QuickAction(
            -0x2769, 0x7f080426, "Cut", 0x1020020);
    private static final QuickAction PASTE = new QuickAction(
            -0x2768, 0x7f080428, "Paste", 0x1020022);
    private static final QuickAction REDO = new QuickAction(
            -0x27a3, 0x7f0804a3, "Redo", 0);

    private GboardLongPressQuickActions1777Policy() {
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

    private static QuickAction resolve(int keyId, String pressText) {
        if (pressText == null) {
            return null;
        }
        return switch (keyId) {
            case 0x7f0b193c -> "a".equals(pressText) ? SELECT_ALL : null;
            case 0x7f0b185e -> "A".equals(pressText) ? SELECT_ALL : null;
            case 0x7f0b1a75 -> "z".equals(pressText) ? UNDO : null;
            case 0x7f0b1915 -> "Z".equals(pressText) ? UNDO : null;
            case 0x7f0b1951 -> "c".equals(pressText) ? COPY : null;
            case 0x7f0b186f -> "C".equals(pressText) ? COPY : null;
            case 0x7f0b1a6b -> "x".equals(pressText) ? CUT : null;
            case 0x7f0b1910 -> "X".equals(pressText) ? CUT : null;
            case 0x7f0b1a63 -> "v".equals(pressText) ? PASTE : null;
            case 0x7f0b190b -> "V".equals(pressText) ? PASTE : null;
            case 0x7f0b1a6e -> "y".equals(pressText) ? REDO : null;
            case 0x7f0b1911 -> "Y".equals(pressText) ? REDO : null;
            case 0x7f0b28d6 -> "a".equals(pressText) ? SELECT_ALL : null;
            case 0x7f0b28cd -> "z".equals(pressText) ? UNDO : null;
            case 0x7f0b28d0 -> "c".equals(pressText) ? COPY : null;
            case 0x7f0b28d5 -> "x".equals(pressText) ? CUT : null;
            case 0x7f0b28e7 -> "v".equals(pressText) ? PASTE : null;
            case 0x7f0b28e9 -> "y".equals(pressText) ? REDO : null;
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

        private QuickAction(int actionCode, int iconResId, String debugName,
                int contextMenuActionId) {
            this.actionCode = actionCode;
            this.iconResId = iconResId;
            this.debugName = debugName;
            this.contextMenuActionId = contextMenuActionId;
        }
    }
}

