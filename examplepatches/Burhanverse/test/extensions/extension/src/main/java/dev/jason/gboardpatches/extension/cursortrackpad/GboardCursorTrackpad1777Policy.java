package dev.jason.gboardpatches.extension.cursortrackpad;

public final class GboardCursorTrackpad1777Policy {
    public static final String FREE_CURSOR_FLAG = "free_cursor";
    public static final String FREE_CURSOR_LOCK_MODE_FLAG = "free_cursor_lock_mode";
    public static final String ENABLE_SCRUB_MOVE_PREFERENCE = "enable_scrub_move";
    public static final int ENABLE_SCRUB_MOVE_PREFERENCE_RES_ID = 0x7f140996;

    private GboardCursorTrackpad1777Policy() {
    }

    public static Object maybeForceFlag(
            String flagName,
            Object stockResult,
            boolean enabled) {
        if (!enabled
                || !(FREE_CURSOR_FLAG.equals(flagName)
                        || FREE_CURSOR_LOCK_MODE_FLAG.equals(flagName))
                || !Boolean.FALSE.equals(stockResult)) {
            return stockResult;
        }
        return Boolean.TRUE;
    }

    public static boolean maybeForcePreference(
            String preferenceKey,
            boolean stockResult,
            boolean enabled) {
        return enabled && ENABLE_SCRUB_MOVE_PREFERENCE.equals(preferenceKey)
                ? true
                : stockResult;
    }

    public static boolean maybeForceResourcePreference(
            int preferenceResourceId,
            boolean stockResult,
            boolean enabled) {
        return enabled && preferenceResourceId == ENABLE_SCRUB_MOVE_PREFERENCE_RES_ID
                ? true
                : stockResult;
    }
}
