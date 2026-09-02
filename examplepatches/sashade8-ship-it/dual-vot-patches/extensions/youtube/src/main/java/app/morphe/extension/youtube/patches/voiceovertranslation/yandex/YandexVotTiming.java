/*
 * Copyright (C) 2026 Dual VoT contributors
 *
 * Licensed under the GNU General Public License v3.0.
 */

package app.morphe.extension.youtube.patches.voiceovertranslation.yandex;

/** Pure timing policy shared by the Yandex request UI and polling loop. */
public final class YandexVotTiming {
    static final int DEFAULT_POLL_DELAY_SECONDS = 10;
    static final int MAX_POLL_DELAY_SECONDS = 15;

    private YandexVotTiming() {
    }

    /** Keeps server ETA presentation independent from how often readiness is checked. */
    static int pollDelaySeconds(int serverRemainingSeconds) {
        if (serverRemainingSeconds <= 0) return DEFAULT_POLL_DELAY_SECONDS;
        return Math.max(1, Math.min(serverRemainingSeconds, MAX_POLL_DELAY_SECONDS));
    }

    static int estimateOrDefault(int serverRemainingSeconds, int fallbackSeconds) {
        return serverRemainingSeconds > 0
                ? serverRemainingSeconds
                : Math.max(1, fallbackSeconds);
    }

    /**
     * Accepts a more optimistic server ETA but never moves an active countdown backwards.
     * Once a countdown expires it therefore stays in the generic waiting state instead of
     * repeatedly restarting at a few seconds.
     */
    static long tightenDeadlineMs(long nowMs, long currentDeadlineMs, int estimateSeconds) {
        long candidateDeadlineMs = nowMs + Math.max(1, estimateSeconds) * 1000L;
        return currentDeadlineMs < 0
                ? candidateDeadlineMs
                : Math.min(currentDeadlineMs, candidateDeadlineMs);
    }

    /** Uses the same ceiling rule everywhere a compact whole-minute ETA is shown. */
    public static int roundedDisplayMinutes(int seconds) {
        return Math.max(1, (Math.max(1, seconds) + 59) / 60);
    }
}
