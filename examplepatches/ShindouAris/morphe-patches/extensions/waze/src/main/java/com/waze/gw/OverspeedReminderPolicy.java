package com.waze.gw;

/** Pure policy for the number and spacing of warnings in one overspeed episode. */
final class OverspeedReminderPolicy {
    static final int MODE_ONCE = 0;
    static final int MODE_CONTINUOUS = 1;
    static final int MODE_TWICE = 2;

    private OverspeedReminderPolicy() { }

    static int maxWarnings(int mode) {
        if (mode == MODE_ONCE) return 1;
        if (mode == MODE_TWICE) return 2;
        return Integer.MAX_VALUE;
    }

    static boolean isDue(int warningCount, long lastWarningMs, long nowMs,
                         long repeatIntervalMs) {
        if (warningCount <= 0) return true;
        return nowMs - lastWarningMs > repeatIntervalMs;
    }
}
