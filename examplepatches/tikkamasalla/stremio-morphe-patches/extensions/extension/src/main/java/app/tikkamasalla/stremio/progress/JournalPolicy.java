package app.tikkamasalla.stremio.progress;

/**
 * Pure decision logic for the Vimu progress journal (no android classes), unit tested in
 * a standalone test. Watched threshold: 90% of the duration, or a real completion.
 */
final class JournalPolicy {
    /**
     * The only threshold readable in the Stremio app is the stock external handler's intended
     * rule, progress greater than 0.7 (inverted by getProgress, so it fired on every exit); the
     * core's native rule is not readable here. 90% follows the progress contract.
     */
    static final double WATCHED_RATIO = 0.9;
    static final long EARLY_BACK_MS = 30000L;

    private JournalPolicy() {
    }

    /** One row of the Vimu journal (columns as in the contract). */
    static final class Row {
        String launchId, videoUrl, stremioVideoId, state, endBy;
        long positionMs, durationMs, updatedAt;
    }

    /** An activity result with data wins over the journal when its moment is not older. */
    static boolean resultWins(boolean hasData, long resultMomentMs, long journalUpdatedAt) {
        return hasData && resultMomentMs >= journalUpdatedAt;
    }

    /** null when the row is usable for this launch, else the reason it is not. */
    static String reject(Row row, String launchId, long appliedAt) {
        if (row == null) return "empty";
        if (row.launchId == null || row.launchId.length() == 0 || !row.launchId.equals(launchId)) {
            return "launch-mismatch";
        }
        if (row.positionMs <= 0L || row.durationMs <= 0L) return "no-position";
        if (row.updatedAt <= appliedAt) return "stale";
        return null;
    }

    /** A position below the resume point after a very short session must not overwrite it. */
    static boolean earlyBack(long position, long startMs, long playedMs) {
        return startMs > 0L && position > 0L && position < startMs && playedMs < EARLY_BACK_MS;
    }

    static boolean isFinal(String state) {
        return "exited".equals(state) || "ended".equals(state);
    }

    /** Natural end of the file (row state ended) with the position near the end (R2). */
    static boolean rowCompleted(Row row) {
        return row != null && "ended".equals(row.state)
                && ExternalProgress.Gate.nearEnd(row.positionMs, row.durationMs);
    }

    static final class Outcome {
        long position, duration;
        String watchedReason;
        boolean keptStart;
    }

    /** Early-Back guard plus the watched rule for a position that is about to be stored. */
    static Outcome finish(long position, long duration, boolean completedLike, long startMs,
                          long playedMs) {
        Outcome out = new Outcome();
        out.position = position;
        out.duration = duration;
        if (!completedLike && earlyBack(position, startMs, playedMs)) {
            out.keptStart = true;
            out.position = 0L;
            out.duration = 0L;
        } else if (completedLike) {
            out.watchedReason = "completion";
        } else if (duration > 0L && position > 0L && position >= (long) (duration * WATCHED_RATIO)) {
            out.watchedReason = "ratio>=0.90";
        }
        return out;
    }
}
