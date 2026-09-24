package app.yydarlinker.deepseekcaptions;

/** Pure decisions shared by the contextual unit controller and its JVM regression harness. */
final class ContextualUnitCorePolicy {
    static final int QUICK_RETRY_LIMIT = 4;
    static final long QUICK_RETRY_BASE_MS = 1_200L;
    static final long QUICK_RETRY_MAX_MS = 10_000L;
    static final long DELAYED_REPAIR_BASE_MS = 30_000L;
    static final long DELAYED_REPAIR_MAX_MS = 120_000L;
    static final long CURRENT_REPAIR_MAX_WAIT_MS = 10_000L;
    static final long STARTUP_DEBOUNCE_WINDOW_MS = 2_200L;
    static final long STARTUP_MAX_CORRECTION_MS = 2_000L;
    static final int STARTUP_UNIT_MARGIN = 1;

    enum FailureKind {
        TRANSIENT,
        RETRYABLE_PROTOCOL,
        PERMANENT
    }

    static final class RetryDecision {
        final boolean permanent;
        final boolean delayedRepair;
        final long delayMs;

        RetryDecision(boolean permanent, boolean delayedRepair, long delayMs) {
            this.permanent = permanent;
            this.delayedRepair = delayedRepair;
            this.delayMs = Math.max(0L, delayMs);
        }
    }

    private ContextualUnitCorePolicy() {}

    static RetryDecision retryDecision(FailureKind kind, int failureCount, boolean priority) {
        FailureKind safeKind = kind == null ? FailureKind.TRANSIENT : kind;
        int failures = Math.max(1, failureCount);
        if (safeKind == FailureKind.PERMANENT) {
            return new RetryDecision(true, false, Long.MAX_VALUE);
        }
        if (failures < QUICK_RETRY_LIMIT) {
            long delay = QUICK_RETRY_BASE_MS * (1L << Math.min(3, failures - 1));
            delay = Math.min(QUICK_RETRY_MAX_MS, delay);
            if (priority) delay = Math.min(delay, CURRENT_REPAIR_MAX_WAIT_MS);
            return new RetryDecision(false, false, delay);
        }
        int delayedRound = Math.max(0, failures - QUICK_RETRY_LIMIT);
        long delay = DELAYED_REPAIR_BASE_MS * (1L << Math.min(2, delayedRound));
        delay = Math.min(DELAYED_REPAIR_MAX_MS, delay);
        if (priority) delay = Math.min(delay, CURRENT_REPAIR_MAX_WAIT_MS);
        return new RetryDecision(false, true, delay);
    }

    static boolean shouldIsolateBatch(boolean providerRejected, int unitCount) {
        return providerRejected && unitCount > 1;
    }

    static int requestUnitLimit(boolean isolatedRetry, int normalMaximum) {
        return isolatedRetry ? 1 : Math.max(1, normalMaximum);
    }

    static long isolatedRetryDelayMs(boolean priorityFocus, int ordinal) {
        if (priorityFocus) return 0L;
        return Math.min(1_200L, Math.max(0, ordinal) * 180L);
    }

    static long promoteCurrentRepairAt(long now, long retryAfterMs, int failureCount) {
        if (failureCount < QUICK_RETRY_LIMIT || retryAfterMs <= now) return retryAfterMs;
        return Math.min(retryAfterMs, now + CURRENT_REPAIR_MAX_WAIT_MS);
    }

    static long promoteDemandedRepairAt(long now, long retryAfterMs, int failureCount) {
        if (retryAfterMs <= now) return retryAfterMs;
        if (failureCount < QUICK_RETRY_LIMIT) return now;
        return promoteCurrentRepairAt(now, retryAfterMs, failureCount);
    }

    static boolean shouldRescueBodySentCurrent(
            long unitStartMs,
            long currentTimeMs,
            long bodySentAtMs,
            long nowMs,
            long recentBackgroundLatencyMs,
            int realtimeAttempts,
            int maximumRealtimeAttempts
    ) {
        if (bodySentAtMs <= 0L || nowMs < bodySentAtMs || currentTimeMs < unitStartMs ||
                realtimeAttempts >= maximumRealtimeAttempts) return false;
        long expectedLeftGuard = Math.max(
                900L,
                Math.min(1_800L, Math.max(0L, recentBackgroundLatencyMs) - 400L)
        );
        return nowMs - bodySentAtMs >= expectedLeftGuard;
    }

    static boolean refillEligible(boolean firstReady, boolean hasReadyInventory) {
        return firstReady || hasReadyInventory;
    }

    static boolean acceptsRequestResult(
            boolean activeSession,
            boolean sessionCancelled,
            boolean requestCancelled,
            long requestGeneration,
            long sessionGeneration
    ) {
        return activeSession && !sessionCancelled && !requestCancelled &&
                requestGeneration == sessionGeneration;
    }

    static boolean mayContinue(
            boolean activeSession,
            boolean cancelled,
            String sessionVideoId,
            String currentVideoId
    ) {
        if (!activeSession || cancelled) return false;
        String owner = cleanVideoId(sessionVideoId);
        String current = cleanVideoId(currentVideoId);
        return !owner.isEmpty() && (current.isEmpty() || owner.equals(current));
    }

    static boolean mayPublish(
            boolean activeSession,
            boolean cancelled,
            String sessionVideoId,
            String currentVideoId
    ) {
        if (!activeSession || cancelled) return false;
        String owner = cleanVideoId(sessionVideoId);
        String current = cleanVideoId(currentVideoId);
        return !owner.isEmpty() && (current.isEmpty() || owner.equals(current));
    }

    static String bindOwnerOnVideoId(
            String verifiedSessionVideoId,
            String newVideoId
    ) {
        String owner = cleanVideoId(verifiedSessionVideoId);
        String next = cleanVideoId(newVideoId);
        if (owner.isEmpty() || next.isEmpty()) return "";
        return owner.equals(next) ? owner : "";
    }

    private static String cleanVideoId(String value) {
        return value == null ? "" : value.trim();
    }

    static boolean shouldPassThroughUnresolvedActivation(
            boolean contextualCore,
            boolean interceptionRequested,
            String urlVideoId,
            String currentVideoId
    ) {
        return contextualCore && interceptionRequested &&
                cleanVideoId(urlVideoId).isEmpty() && cleanVideoId(currentVideoId).isEmpty();
    }

    static boolean shouldReprioritizeSeek(boolean seek, boolean startupDebounced) {
        return seek && !startupDebounced;
    }

    static boolean shouldDebounceStartupSeek(
            boolean alreadyConsumed,
            boolean firstReady,
            boolean timelineReady,
            long timelineStartedAtMs,
            long now,
            long startupAnchorTimeMs,
            long newTimeMs,
            int startupAnchorIndex,
            int newAnchorIndex,
            int requestFromInclusive,
            int requestToExclusive
    ) {
        if (alreadyConsumed || firstReady || !timelineReady || timelineStartedAtMs <= 0L) return false;
        if (now - timelineStartedAtMs < 0L ||
                now - timelineStartedAtMs > STARTUP_DEBOUNCE_WINDOW_MS) return false;
        if (startupAnchorIndex < 0 || newAnchorIndex < 0 || requestFromInclusive < 0 ||
                requestToExclusive <= requestFromInclusive) return false;
        if (Math.abs(newTimeMs - startupAnchorTimeMs) > STARTUP_MAX_CORRECTION_MS) return false;
        if (Math.abs(newAnchorIndex - startupAnchorIndex) > STARTUP_UNIT_MARGIN) return false;
        return newAnchorIndex >= requestFromInclusive && newAnchorIndex < requestToExclusive;
    }
}
