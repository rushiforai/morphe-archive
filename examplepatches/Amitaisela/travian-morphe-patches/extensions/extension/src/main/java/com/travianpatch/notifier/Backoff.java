package com.travianpatch.notifier;

/**
 * How long an automatic action waits after the game refused it: 30 min after the first refusal, doubling
 * each time, never more than 6 hours. Stops a refused build from being re-sent every check. Pure logic.
 */
final class Backoff {

    static final long FIRST_MS = 30 * 60_000L;
    static final long MAX_MS = 6 * 3_600_000L;

    private Backoff() {
    }

    static long delayMs(int failures) {
        if (failures <= 0) {
            return 0;
        }
        long d = FIRST_MS;
        for (int i = 1; i < failures && d < MAX_MS; i++) {
            d *= 2;
        }
        return Math.min(d, MAX_MS);
    }
}
