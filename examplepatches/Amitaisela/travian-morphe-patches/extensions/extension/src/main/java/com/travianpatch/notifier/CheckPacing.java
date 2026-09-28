package com.travianpatch.notifier;

import java.util.Random;

/**
 * When the next background check runs. A regular check every 4-7 minutes (a random pick each time, never a
 * fixed beat), every 20-40 minutes during quiet hours. Earlier only for something the user is told about: a
 * build, training or troop arrival finishing (a few random seconds after it, and never sooner than
 * MIN_GAP_MS from now, so many finishes close together can't cause a burst of checks), or an attack
 * reminder / troop escape moment (on time, at most every ATTACK_MIN_GAP_MS). In quiet hours only the attack
 * moments wake the chain early. Pure logic (no Android APIs).
 */
final class CheckPacing {

    static final long AWAKE_MIN_MS = 4 * 60_000L;
    static final long AWAKE_MAX_MS = 7 * 60_000L;
    static final long QUIET_MIN_MS = 20 * 60_000L;
    static final long QUIET_MAX_MS = 40 * 60_000L;
    /** Soonest next check for a finish time. */
    static final long MIN_GAP_MS = 90_000L;
    /** Soonest next check for an attack reminder or escape moment. */
    static final long ATTACK_MIN_GAP_MS = 30_000L;
    /** A finish is looked at this long after it (random), so the server has processed it. */
    static final long SETTLE_MIN_MS = 3_000L;
    static final long SETTLE_MAX_MS = 20_000L;
    /** A just-passed finish that is still listed (server lag) is looked at again once, after this long. */
    static final long LAG_RETRY_MS = 60_000L;
    static final int MAX_LAG_RETRIES = 2;
    /** Finish times further ahead than this don't shorten the wait. */
    static final long MAX_AHEAD_MS = 2 * 86_400_000L;
    /** A check started this soon after the last one finished is skipped (the chain, the 15-minute job and
     * the screens' "check now" can otherwise run back to back). */
    static final long RECENT_MS = 60_000L;

    /** No wake time: Long.MAX_VALUE. */
    static final long NONE = Long.MAX_VALUE;

    private CheckPacing() {
    }

    static long nextDelayMs(long nowMs, long finishWakeMs, long attackWakeMs, boolean lagging, int lagRetries,
                            boolean quiet, Random random) {
        long delay = quiet ? between(random, QUIET_MIN_MS, QUIET_MAX_MS) : between(random, AWAKE_MIN_MS, AWAKE_MAX_MS);
        if (!quiet && finishWakeMs != NONE && finishWakeMs - nowMs <= MAX_AHEAD_MS) {
            long untilFinish = Math.max(finishWakeMs - nowMs, 0L) + between(random, SETTLE_MIN_MS, SETTLE_MAX_MS);
            delay = Math.min(delay, Math.max(untilFinish, MIN_GAP_MS));
        }
        if (!quiet && lagging && lagRetries < MAX_LAG_RETRIES) {
            delay = Math.min(delay, Math.max(LAG_RETRY_MS, MIN_GAP_MS));
        }
        if (attackWakeMs != NONE && attackWakeMs - nowMs <= MAX_AHEAD_MS) {
            delay = Math.min(delay, Math.max(attackWakeMs - nowMs, ATTACK_MIN_GAP_MS));
        }
        return delay;
    }

    /**
     * The wait after failures in a row (refused, "too many requests", maintenance, no network): 5 minutes
     * after the first, doubling up to an hour, give or take a fifth. In quiet hours never less than the
     * quiet interval.
     */
    static long failureDelayMs(int failures, boolean quiet, Random random) {
        long d = 5 * 60_000L;
        for (int i = 1; i < failures && d < 60 * 60_000L; i++) {
            d *= 2;
        }
        d = Math.min(d, 60 * 60_000L);
        d = between(random, d * 4 / 5, d * 6 / 5);
        return quiet ? Math.max(d, between(random, QUIET_MIN_MS, QUIET_MAX_MS)) : d;
    }

    /** A scheduled check this late (Android deferring work) still counts as the chain being alive. */
    static final long CHAIN_LATE_MS = 20 * 60_000L;

    /**
     * True when the chain's next check is scheduled (not yet due, or due only a little while ago), so the
     * 15-minute safety job has nothing to restart.
     */
    static boolean chainAlive(long nowMs, long nextCheckAtMs) {
        return nextCheckAtMs > 0 && nowMs < nextCheckAtMs + CHAIN_LATE_MS;
    }

    /** True when the last check finished so recently that this one should do nothing. */
    static boolean tooSoon(long nowMs, long lastCheckEndMs) {
        return lastCheckEndMs > 0 && nowMs >= lastCheckEndMs && nowMs - lastCheckEndMs < RECENT_MS;
    }

    static long between(Random random, long min, long max) {
        return max <= min ? min : min + (long) (random.nextDouble() * (max - min));
    }
}
