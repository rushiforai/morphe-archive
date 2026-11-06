/*
 * Timing policy shared by the Yandex VoT request loop, the bottom sheet and the player button.
 */

package app.morphe.extension.youtube.patches.yandexvot;

/**
 * Keeps how often the readiness of a translation is checked independent from the estimate that
 * is shown to the user: Yandex can report ten minutes of remaining work, and the audio is often
 * ready long before that, so the countdown shows the server estimate while the polling stays
 * frequent enough to start playback as soon as the translation appears.
 */
public final class YandexVotTiming {

    /** Poll delay used when the server reports no estimate at all. */
    private static final int DEFAULT_POLL_DELAY_SECONDS = 10;

    /** Upper bound of a poll delay, no matter how long the server estimate is. */
    private static final int MAX_POLL_DELAY_SECONDS = 15;

    /** @return How long to wait before the next readiness check. */
    static int pollDelaySeconds(int serverRemainingSeconds) {
        if (serverRemainingSeconds <= 0) return DEFAULT_POLL_DELAY_SECONDS;
        return Math.min(serverRemainingSeconds, MAX_POLL_DELAY_SECONDS);
    }

    /** @return The server estimate, or {@code fallbackSeconds} if the server did not give one. */
    static int estimateOrDefault(int serverRemainingSeconds, int fallbackSeconds) {
        return serverRemainingSeconds > 0
                ? serverRemainingSeconds
                : Math.max(1, fallbackSeconds);
    }

    /**
     * An active deadline can only move earlier, including after it has expired, so the countdown
     * ring of the player button can advance but never refill.
     */
    static long tightenDeadlineMs(long nowMs, long currentDeadlineMs, int estimateSeconds) {
        final long candidateDeadlineMs = nowMs + Math.max(1, estimateSeconds) * 1000L;
        return currentDeadlineMs < 0
                ? candidateDeadlineMs
                : Math.min(currentDeadlineMs, candidateDeadlineMs);
    }

    /**
     * @return The remaining minutes, rounded up so that the countdown never shows a value the
     * translation cannot still be waiting for. Used everywhere a whole-minute estimate is shown.
     */
    public static int roundedDisplayMinutes(int seconds) {
        return Math.max(1, (Math.max(1, seconds) + 59) / 60);
    }

    private YandexVotTiming() {
    }
}
