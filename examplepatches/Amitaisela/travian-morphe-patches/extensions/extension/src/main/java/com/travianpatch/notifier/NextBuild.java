package com.travianpatch.notifier;

import java.util.ArrayList;
import java.util.List;

/**
 * Works out, for the Village tab, which queue entry auto-build starts next and roughly when: after the
 * game's current build in that line finishes, once the stock (plus the buffer) covers the game's cost at
 * the game's own hourly production, plus auto-build's random wait. Also says whether it could be started
 * right now by hand (line free and the stock covers the plain cost). Uses the same rules as
 * BuildQueueStep, so the entry shown is the one the worker will pick. Pure logic.
 */
final class NextBuild {

    private NextBuild() {
    }

    /** Unknown time (no production, or the game gave no finish time). */
    static final long UNKNOWN = -1;

    static final class Estimate {
        final BuildOrderStore.Entry entry;
        final BuildChoices.Row row;
        /** When the game's current build in this line ends: 0 = free now, UNKNOWN = busy but no finish time. */
        final long lineFreeAtMs;
        /** When the stock covers cost plus buffer at the current production: 0 = now, UNKNOWN = not by production. */
        final long resourcesAtMs;
        /** Earliest and latest start, random wait included; both UNKNOWN when either part above is unknown. */
        final long startEarliestMs;
        final long startLatestMs;
        /** True when it can be started by hand right now: line free and the stock covers the plain cost. */
        final boolean canStartNow;

        Estimate(BuildOrderStore.Entry entry, BuildChoices.Row row, long lineFreeAtMs, long resourcesAtMs,
                 long startEarliestMs, long startLatestMs, boolean canStartNow) {
            this.entry = entry;
            this.row = row;
            this.lineFreeAtMs = lineFreeAtMs;
            this.resourcesAtMs = resourcesAtMs;
            this.startEarliestMs = startEarliestMs;
            this.startLatestMs = startLatestMs;
            this.canStartNow = canStartNow;
        }
    }

    /**
     * The next entry per build line: one estimate, or two when a field and a building may be built at the
     * same time (parallel). fieldFreeAtMs / buildingFreeAtMs: when the game's current build in each line
     * ends (0 = nothing building, UNKNOWN = building but no time known); when not parallel both lines are
     * one and the later of the two is used. idleSince values as the worker saved them (0 = not saved).
     */
    static List<Estimate> upcoming(BuildingRules rules, int tribeId, PlayerBuildings.Village village,
                                   VillageResources.Entry stock, List<BuildOrderStore.Entry> queue,
                                   AutomationSettings.Config cfg, boolean parallel, long fieldFreeAtMs,
                                   long buildingFreeAtMs, long fieldIdleSinceMs, long buildingIdleSinceMs, long nowMs) {
        List<Estimate> out = new ArrayList<Estimate>();
        if (rules == null || village == null) {
            return out;
        }
        boolean fieldDone = false, buildingDone = false;
        for (BuildOrderStore.Entry e : queue) {
            int reached = e.slotId > 0 ? QueueEstimate.slotLevel(village, e.slotId)
                    : QueueEstimate.reachedLevel(village, e.buildingTypeId);
            if (reached >= e.targetLevel) {
                continue;
            }
            boolean field = parallel && BuildChoices.isField(e.buildingTypeId);
            if (field ? fieldDone : buildingDone) {
                continue;
            }
            BuildChoices.Row row = e.slotId > 0
                    ? BuildQueueStep.rowForSlot(rules, tribeId, village, e.slotId, e.buildingTypeId)
                    : BuildQueueStep.rowFor(rules, tribeId, village, e.buildingTypeId);
            if (row == null || row.verdict.answer != BuildOptions.Answer.YES || row.next == null) {
                continue; // the worker skips these too
            }
            long freeAt = !parallel ? later(fieldFreeAtMs, buildingFreeAtMs)
                    : field ? fieldFreeAtMs : buildingFreeAtMs;
            long idleSince = !parallel || !field ? buildingIdleSinceMs : fieldIdleSinceMs;
            out.add(estimate(e, row, village.id, stock, cfg, freeAt, idleSince, nowMs));
            if (field) {
                fieldDone = true;
            } else {
                buildingDone = true;
            }
            if (!parallel || (fieldDone && buildingDone)) {
                break;
            }
        }
        return out;
    }

    static Estimate estimate(BuildOrderStore.Entry e, BuildChoices.Row row, String villageId,
                             VillageResources.Entry stock, AutomationSettings.Config cfg, long freeAtMs,
                             long idleSinceMs, long nowMs) {
        long resourcesAt = stock == null ? UNKNOWN : resourcesAt(stock, row.next, cfg.bufferPercent, nowMs);
        boolean covered = stock != null && stock.lumberStock >= row.next.lumber && stock.clayStock >= row.next.clay
                && stock.ironStock >= row.next.iron && stock.cropStock >= row.next.crop;
        boolean lineFree = freeAtMs == 0 || (freeAtMs > 0 && freeAtMs <= nowMs);
        long earliest, latest;
        if (resourcesAt == UNKNOWN || freeAtMs == UNKNOWN) {
            earliest = latest = UNKNOWN;
        } else if (lineFree && idleSinceMs > 0) {
            // The worker already fixed the random wait for this idle stretch.
            long delay = BuildQueueAutomation.pickDelayMs(villageId, idleSinceMs, cfg.minDelayMs, cfg.maxDelayMs);
            earliest = latest = Math.max(nowMs, Math.max(idleSinceMs + delay, resourcesAt));
        } else {
            long idleFrom = lineFree ? nowMs : freeAtMs;
            earliest = Math.max(nowMs, Math.max(idleFrom + cfg.minDelayMs, resourcesAt));
            latest = Math.max(nowMs, Math.max(idleFrom + cfg.maxDelayMs, resourcesAt));
        }
        return new Estimate(e, row, lineFree ? 0 : freeAtMs, resourcesAt, earliest, latest, lineFree && covered);
    }

    /** When stock covers cost plus buffer at the current hourly production: 0 = already, UNKNOWN = never. */
    static long resourcesAt(VillageResources.Entry s, BuildingRules.Level cost, int bufferPercent, long nowMs) {
        long worst = 0;
        long[][] pairs = {
                {s.lumberStock, s.lumberPerHour, cost.lumber},
                {s.clayStock, s.clayPerHour, cost.clay},
                {s.ironStock, s.ironPerHour, cost.iron},
                {s.cropStock, s.cropPerHour, cost.crop},
        };
        for (long[] p : pairs) {
            long need = p[2] + (p[2] * bufferPercent) / 100;
            if (p[0] >= need) {
                continue;
            }
            if (p[1] <= 0) {
                return UNKNOWN;
            }
            long ms = ((need - p[0]) * 3_600_000L + p[1] - 1) / p[1];
            worst = Math.max(worst, ms);
        }
        return worst == 0 ? 0 : nowMs + worst;
    }

    /**
     * When the game's current build in one line ends, for upcoming(): 0 when the game's buildings data shows
     * nothing building in that line, else the latest finish time the background check saved for this village
     * (stateJson = NotifierWorker's queue state, villageTitle = "Name (x|y)"), or UNKNOWN when it has none.
     * parallel false = one line for everything (field ignored).
     */
    static long lineFreeAt(String stateJson, String villageTitle, PlayerBuildings.Village village, boolean parallel,
                           boolean field) {
        boolean busy = parallel ? BuildQueueStep.laneBusy(village, field) : !village.pending.isEmpty();
        if (!busy) {
            return 0;
        }
        long latest = 0;
        try {
            org.json.JSONObject root = new org.json.JSONObject(stateJson);
            java.util.Iterator<String> keys = root.keys();
            while (keys.hasNext()) {
                org.json.JSONObject e = root.getJSONObject(keys.next());
                String title = e.optString("villageName") + " (" + e.optInt("villageX") + "|" + e.optInt("villageY") + ")";
                if (!"build".equals(e.optString("kind")) || !title.equals(villageTitle)) {
                    continue;
                }
                if (parallel && BuildChoices.isField(e.optInt("buildingTypeId", -1)) != field) {
                    continue;
                }
                latest = Math.max(latest, e.optLong("finishMs", 0));
            }
        } catch (Exception ignored) {
            return UNKNOWN;
        }
        return latest > 0 ? latest : UNKNOWN;
    }

    private static long later(long a, long b) {
        if (a == UNKNOWN || b == UNKNOWN) {
            return UNKNOWN;
        }
        return Math.max(a, b);
    }
}
