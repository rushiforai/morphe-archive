package com.travianpatch.notifier;

import java.util.Random;

/**
 * A daily "quiet window" (mimicking a human sleep schedule) during which the build queue automation
 * never fires: a start time picked randomly within a configured range, lasting a randomly picked
 * duration within a configured range, re-picked deterministically each calendar day so it looks
 * different night to night without needing to persist anything. Pure logic (no Android APIs, no
 * TimeZone/Calendar calls) so it can be checked against sample data off-device: the caller supplies
 * "now" and "today's local midnight" as plain epoch milliseconds, computed on the Android side.
 */
final class QuietHours {

    private QuietHours() {
    }

    /**
     * The range the start time is picked from, and the range the duration is picked from, all in
     * minutes. startRangeStartMin/startRangeEndMin are minutes after local midnight and may exceed
     * 1440 to express a range that crosses midnight (e.g. 1380..1500 for "23:00 to 01:00").
     */
    static final class Config {
        final int startRangeStartMin;
        final int startRangeEndMin;
        final int minDurationMin;
        final int maxDurationMin;

        Config(int startRangeStartMin, int startRangeEndMin, int minDurationMin, int maxDurationMin) {
            this.startRangeStartMin = startRangeStartMin;
            this.startRangeEndMin = startRangeEndMin;
            this.minDurationMin = minDurationMin;
            this.maxDurationMin = maxDurationMin;
        }
    }

    /** The user's stated example: starts randomly between 23:00 and 01:00, lasts 7 to 8 hours. */
    static final Config DEFAULT = new Config(23 * 60, 25 * 60, 7 * 60, 8 * 60);

    /** One calendar day's quiet window, as epoch milliseconds. */
    static final class Window {
        final long startMs;
        final long endMs;

        Window(long startMs, long endMs) {
            this.startMs = startMs;
            this.endMs = endMs;
        }
    }

    /**
     * The window for the calendar day that starts at localMidnightMs, deterministically picked from a
     * seed derived from that day (same day in, same window out; a different day picks differently).
     */
    static Window windowStartingAt(Config config, long localMidnightMs) {
        Random random = new Random(localMidnightMs / 86_400_000L);
        int startSpan = config.startRangeEndMin - config.startRangeStartMin;
        int startMin = config.startRangeStartMin + (startSpan > 0 ? random.nextInt(startSpan + 1) : 0);
        int durationSpan = config.maxDurationMin - config.minDurationMin;
        int durationMin = config.minDurationMin + (durationSpan > 0 ? random.nextInt(durationSpan + 1) : 0);
        long startMs = localMidnightMs + startMin * 60_000L;
        long endMs = startMs + durationMin * 60_000L;
        return new Window(startMs, endMs);
    }

    /**
     * Whether nowMs falls in the quiet window. Checks both the window starting at
     * todayLocalMidnightMs and the one starting the day before, since a window picked to start near
     * midnight can still be running after today's midnight has passed.
     */
    static boolean isQuiet(Config config, long nowMs, long todayLocalMidnightMs) {
        Window today = windowStartingAt(config, todayLocalMidnightMs);
        Window yesterday = windowStartingAt(config, todayLocalMidnightMs - 86_400_000L);
        return within(today, nowMs) || within(yesterday, nowMs);
    }

    private static boolean within(Window w, long nowMs) {
        return nowMs >= w.startMs && nowMs < w.endMs;
    }
}
