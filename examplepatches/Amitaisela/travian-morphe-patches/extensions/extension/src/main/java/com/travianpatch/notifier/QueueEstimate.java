package com.travianpatch.notifier;

import java.util.List;

/**
 * Simulates running a village's saved build order unattended, to show a total material cost and an
 * approximate finish time. This is a projection, not a promise: it assumes nothing else changes (no
 * manual taps, no attacks, no server lag), and the per-item delay it adds is the average of the
 * configured range, not a real random draw (true randomness can't be pre-computed for an event that
 * hasn't happened yet). Pure logic (no Android APIs) so it can be checked against known values
 * off-device.
 */
final class QueueEstimate {

    private QueueEstimate() {
    }

    static final class Result {
        final BuildQueueAutomation.Resources totalCost;
        final long estimatedMs;
        /** False if any queued entry's building type has no BuildingCostTable data (excluded from totals). */
        final boolean allKnown;

        Result(BuildQueueAutomation.Resources totalCost, long estimatedMs, boolean allKnown) {
            this.totalCost = totalCost;
            this.estimatedMs = estimatedMs;
            this.allKnown = allKnown;
        }
    }

    static Result estimate(List<BuildOrderStore.Entry> order, BuildQueueAutomation.Resources currentStock,
            BuildQueueAutomation.Resources hourlyProduction, AutomationSettings.Config settings,
            long nowMs, long todayLocalMidnightMs) {
        long totalLumber = 0, totalClay = 0, totalIron = 0, totalCrop = 0;
        boolean allKnown = true;

        long lumberStock = currentStock.lumber, clayStock = currentStock.clay,
                ironStock = currentStock.iron, cropStock = currentStock.crop;
        long time = nowMs;
        long avgDelay = (settings.minDelayMs + settings.maxDelayMs) / 2;

        for (BuildOrderStore.Entry entry : order) {
            if (!BuildingCostTable.has(entry.buildingTypeId)) {
                allKnown = false;
                continue;
            }
            BuildQueueAutomation.Resources cost = BuildingCostTable.cost(entry.buildingTypeId, entry.targetLevel);
            totalLumber += cost.lumber;
            totalClay += cost.clay;
            totalIron += cost.iron;
            totalCrop += cost.crop;

            long needLumber = withBuffer(cost.lumber, settings.bufferPercent);
            long needClay = withBuffer(cost.clay, settings.bufferPercent);
            long needIron = withBuffer(cost.iron, settings.bufferPercent);
            long needCrop = withBuffer(cost.crop, settings.bufferPercent);

            long waitMs = Math.max(
                    Math.max(waitForMs(lumberStock, needLumber, hourlyProduction.lumber),
                            waitForMs(clayStock, needClay, hourlyProduction.clay)),
                    Math.max(waitForMs(ironStock, needIron, hourlyProduction.iron),
                            waitForMs(cropStock, needCrop, hourlyProduction.crop)));
            time += waitMs;
            lumberStock += (long) (hourlyProduction.lumber * (waitMs / 3_600_000.0));
            clayStock += (long) (hourlyProduction.clay * (waitMs / 3_600_000.0));
            ironStock += (long) (hourlyProduction.iron * (waitMs / 3_600_000.0));
            cropStock += (long) (hourlyProduction.crop * (waitMs / 3_600_000.0));

            time += avgDelay;
            time = skipQuietHours(settings.quietHours, time, todayLocalMidnightMs);

            time += Math.round(BuildingCostTable.buildTimeSeconds(
                    entry.buildingTypeId, entry.targetLevel, settings.serverSpeed) * 1000);

            lumberStock -= cost.lumber;
            clayStock -= cost.clay;
            ironStock -= cost.iron;
            cropStock -= cost.crop;
        }

        return new Result(new BuildQueueAutomation.Resources(totalLumber, totalClay, totalIron, totalCrop),
                time - nowMs, allKnown);
    }

    private static long withBuffer(long cost, int bufferPercent) {
        return cost + (cost * bufferPercent) / 100;
    }

    /** How long until stock reaches need, given hourly production; 0 if already there, 0 if it will never arrive. */
    private static long waitForMs(long stock, long need, long perHour) {
        if (stock >= need) {
            return 0;
        }
        if (perHour <= 0) {
            return 0; // can't project an infinite wait; treat as "ready now" rather than never
        }
        double hours = (need - stock) / (double) perHour;
        return Math.round(hours * 3_600_000.0);
    }

    /** Advances time past any quiet window it currently falls inside; loops in case a boundary lands on another. */
    private static long skipQuietHours(QuietHours.Config config, long time, long todayLocalMidnightMs) {
        for (int i = 0; i < 10; i++) {
            long midnightForTime = todayLocalMidnightMs
                    + floorDiv(time - todayLocalMidnightMs, 86_400_000L) * 86_400_000L;
            QuietHours.Window today = QuietHours.windowStartingAt(config, midnightForTime);
            QuietHours.Window yesterday = QuietHours.windowStartingAt(config, midnightForTime - 86_400_000L);
            if (time >= today.startMs && time < today.endMs) {
                time = today.endMs;
            } else if (time >= yesterday.startMs && time < yesterday.endMs) {
                time = yesterday.endMs;
            } else {
                break;
            }
        }
        return time;
    }

    private static long floorDiv(long x, long y) {
        long q = x / y;
        return (x % y != 0 && (x < 0) != (y < 0)) ? q - 1 : q;
    }
}
