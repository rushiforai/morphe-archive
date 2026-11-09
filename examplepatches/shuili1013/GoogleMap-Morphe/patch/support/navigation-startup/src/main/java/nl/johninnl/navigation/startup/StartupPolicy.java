package nl.johninnl.navigation.startup;

/** Native engine recovery, deliberately independent of GPS/data freshness. */
public final class StartupPolicy {
    private long nextAttempt, startedAt = -1;
    private int failures;

    public boolean shouldStart(long now, String health) {
        if (!("stopped".equals(health) || "starting".equals(health) || "error".equals(health) || "start_blocked".equals(health))) return false;
        if ("starting".equals(health) && startedAt >= 0 && now - startedAt < 30000) return false;
        return now >= nextAttempt;
    }

    public void attempted(long now) {
        startedAt = now;
        nextAttempt = now + Math.min(60000L, 5000L << Math.min(failures++, 4));
    }

    public void reset() { failures = 0; nextAttempt = 0; startedAt = -1; }
}
