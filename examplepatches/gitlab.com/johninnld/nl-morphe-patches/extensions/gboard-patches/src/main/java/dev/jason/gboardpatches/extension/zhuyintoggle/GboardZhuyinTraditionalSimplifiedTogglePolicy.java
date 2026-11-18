package dev.jason.gboardpatches.extension.zhuyintoggle;

public final class GboardZhuyinTraditionalSimplifiedTogglePolicy {
    public static final int TOGGLE_KEY_ID = 0x7f0b28c5;
    public static final String ACTION_SLIDE_UP = "SLIDE_UP";

    private GboardZhuyinTraditionalSimplifiedTogglePolicy() {
    }

    public static boolean shouldHandleKey(int keyId) {
        return keyId == TOGGLE_KEY_ID;
    }

    public static boolean shouldConsume(int keyId, String actionName) {
        return shouldHandleKey(keyId) && ACTION_SLIDE_UP.equals(actionName);
    }

    /** Key-cap label for the toggle; ASCII so the patch is not tied to a Chinese UI. */
    public static String nextLabel(boolean simplifiedEnabled) {
        return simplifiedEnabled ? "T" : "S";
    }
}
