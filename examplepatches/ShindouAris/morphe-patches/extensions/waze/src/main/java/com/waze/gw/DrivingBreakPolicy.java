package com.waze.gw;

/**
 * Pure policy for the "time to take a break" reminder. Times are wall-clock milliseconds so a
 * session survives a restart of Waze. A session starts when the car moves and ends after a stop of
 * {@link #REST_MS}; shorter stops (red lights, a coffee) still count as driving time.
 */
final class DrivingBreakPolicy {
    /** Below this the car counts as stopped. */
    static final int MOVING_KMH = 10;
    /** A stop this long is a real break: the next trip starts a fresh session. */
    static final long REST_MS = 15L * 60_000L;
    /** While the driver keeps going, the reminder repeats this often. */
    static final long REPEAT_MS = 30L * 60_000L;

    static final class State {
        long sessionStart;    // 0 = no session yet
        long lastMoving;
        long lastReminder;    // 0 = none in this session
    }

    private DrivingBreakPolicy() { }

    /** @return milliseconds driven when a reminder is due right now, otherwise -1. */
    static long update(State state, long nowMs, int speedKmh, long thresholdMs) {
        if (speedKmh < MOVING_KMH) return -1L;
        boolean newSession = state.sessionStart == 0L
                || nowMs < state.lastMoving                    // the clock went backwards
                || nowMs - state.lastMoving >= REST_MS;        // a real break in between
        if (newSession) {
            state.sessionStart = nowMs;
            state.lastReminder = 0L;
        }
        state.lastMoving = nowMs;
        long driven = nowMs - state.sessionStart;
        if (driven < thresholdMs) return -1L;
        if (state.lastReminder != 0L && nowMs - state.lastReminder < REPEAT_MS) return -1L;
        state.lastReminder = nowMs;
        return driven;
    }

    /** Same wording as {@link #describe} in the UI language, or (spoken) in the voice's language; null = stay silent. */
    static String describeLocalized(long drivenMs, boolean spoken) {
        long minutes = Math.max(0L, Math.round(drivenMs / 60000.0));
        long hours = minutes / 60L;
        long rest = minutes % 60L;
        if (hours > 0L && rest > 0L) return localize("core.0_hours_1_minutes", spoken, hours, rest);
        if (hours > 0L) return localize("core.0_hours", spoken, hours);
        return localize("core.0_minutes", spoken, minutes);
    }

    private static String localize(String template, boolean spoken, Object... args) {
        return spoken ? I18n.ttsFormat(template, args) : I18n.f(template, args);
    }

    /** "2 giờ", "2 giờ 5 phút" or "40 phút". */
    static String describe(long drivenMs) {
        long minutes = Math.max(0L, Math.round(drivenMs / 60000.0));
        long hours = minutes / 60L;
        long rest = minutes % 60L;
        // i18n:skip - plain Vietnamese wording kept for tests/logs; the UI and TTS use describeLocalized
        if (hours > 0L && rest > 0L) return hours + " giờ " + rest + " phút";
        if (hours > 0L) return hours + " giờ";
        return minutes + " phút";
    }
}
