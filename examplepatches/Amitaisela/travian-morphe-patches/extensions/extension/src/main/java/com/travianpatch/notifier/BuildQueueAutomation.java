package com.travianpatch.notifier;

import java.util.List;
import java.util.Random;

/**
 * Decides whether to auto-fire the next entry in a village's build order right now. Does not decide
 * WHAT to build (that is the user's saved BuildOrderStore list); this only decides WHEN, given the
 * village's current state, so a human tap is no longer needed. Pure logic (no Android APIs, no network
 * calls) so it can be checked against sample data off-device; the worker supplies real resource stock
 * and cost figures once the real fields are confirmed (see the discovery diagnostic).
 */
final class BuildQueueAutomation {

    private BuildQueueAutomation() {
    }

    /** Wood/clay/iron/crop amounts: used both for a building's cost and a village's current stock. */
    static final class Resources {
        final long lumber;
        final long clay;
        final long iron;
        final long crop;

        Resources(long lumber, long clay, long iron, long crop) {
            this.lumber = lumber;
            this.clay = clay;
            this.iron = iron;
            this.crop = crop;
        }
    }

    /** A village's automation-relevant state as of the last check. */
    static final class VillageState {
        final boolean buildSlotIdle;
        /** When the build slot became idle; ignored when buildSlotIdle is false. */
        final long idleSinceMs;
        final Resources stock;

        VillageState(boolean buildSlotIdle, long idleSinceMs, Resources stock) {
            this.buildSlotIdle = buildSlotIdle;
            this.idleSinceMs = idleSinceMs;
            this.stock = stock;
        }
    }

    /** True if stock covers cost plus a percentage safety buffer (e.g. bufferPercent 10 means 10% extra). */
    static boolean affordable(Resources stock, Resources cost, int bufferPercent) {
        return covers(stock.lumber, cost.lumber, bufferPercent)
                && covers(stock.clay, cost.clay, bufferPercent)
                && covers(stock.iron, cost.iron, bufferPercent)
                && covers(stock.crop, cost.crop, bufferPercent);
    }

    private static boolean covers(long stock, long cost, int bufferPercent) {
        long needed = cost + (cost * bufferPercent) / 100;
        return stock >= needed;
    }

    /**
     * A randomized delay in [minDelayMs, maxDelayMs], deterministically derived from the village and
     * the moment its slot went idle, so repeated checks during the same idle stretch agree on the same
     * delay without needing to persist it separately.
     */
    static long pickDelayMs(String villageId, long idleSinceMs, long minDelayMs, long maxDelayMs) {
        if (maxDelayMs <= minDelayMs) {
            return minDelayMs;
        }
        long seed = villageId.hashCode() * 31L ^ idleSinceMs;
        Random random = new Random(seed);
        return minDelayMs + (long) (random.nextDouble() * (maxDelayMs - minDelayMs));
    }

    /**
     * Decides whether to fire the next entry of order for this village right now. Returns the entry to
     * fire, or null to do nothing this check. Never mutates order; advancing the list on a real fire is
     * the caller's job.
     */
    static BuildOrderStore.Entry decide(String villageId, VillageState state, List<BuildOrderStore.Entry> order,
            Resources nextCost, int bufferPercent, long minDelayMs, long maxDelayMs, boolean quiet, long nowMs) {
        if (quiet || !state.buildSlotIdle || order.isEmpty()) {
            return null;
        }
        long delay = pickDelayMs(villageId, state.idleSinceMs, minDelayMs, maxDelayMs);
        if (nowMs - state.idleSinceMs < delay) {
            return null;
        }
        if (!affordable(state.stock, nextCost, bufferPercent)) {
            return null;
        }
        return order.get(0);
    }
}
