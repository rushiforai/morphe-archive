package com.travianpatch.notifier;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Adds up what a village's saved build order will cost, using only the exact per-level costs the game's
 * own rules table lists. An item the table has no cost for (unknown building type, or a level the table
 * doesn't list) is counted as unknown, never as free. Build time is not estimated here: the game gives no
 * per-level time, so no time is shown until one can be worked out from the game's own numbers. Pure logic
 * (no Android APIs) so it can be checked off-device.
 */
final class QueueEstimate {

    private QueueEstimate() {
    }

    static final class Result {
        final BuildQueueAutomation.Resources totalCost;
        /** How many order items have no cost in the game's table (left out of totalCost). */
        final int unknownCount;
        /** How many order items ask for a level the village already has or has queued (they cost nothing). */
        final int alreadyReachedCount;

        Result(BuildQueueAutomation.Resources totalCost, int unknownCount, int alreadyReachedCount) {
            this.totalCost = totalCost;
            this.unknownCount = unknownCount;
            this.alreadyReachedCount = alreadyReachedCount;
        }
    }

    /**
     * Every level between what the village already has (built or queued) and each item's target is paid
     * for, in order, so two items for the same building add up the way the game would charge them.
     * rules or village may be null (not read yet): then every item is unknown.
     */
    static Result totalCost(BuildingRules rules, PlayerBuildings.Village village, List<BuildOrderStore.Entry> order) {
        long lumber = 0, clay = 0, iron = 0, crop = 0;
        int unknown = 0;
        int reachedCount = 0;
        Map<String, Integer> reached = new HashMap<String, Integer>();
        for (BuildOrderStore.Entry entry : order) {
            BuildingRules.Rule rule = rules == null ? null : rules.find(entry.buildingTypeId);
            if (rule == null || village == null) {
                unknown++;
                continue;
            }
            String key = entry.slotId > 0 ? "slot" + entry.slotId : "type" + entry.buildingTypeId;
            Integer known = reached.get(key);
            int from = known != null ? known : entry.slotId > 0 ? slotLevel(village, entry.slotId)
                    : reachedLevel(village, entry.buildingTypeId);
            if (entry.targetLevel <= from) {
                reachedCount++;
                continue;
            }
            long l = 0, c = 0, i = 0, cr = 0;
            boolean complete = true;
            for (int level = from + 1; level <= entry.targetLevel; level++) {
                BuildingRules.Level data = rule.levelData(level);
                if (data == null) {
                    complete = false;
                    break;
                }
                l += data.lumber;
                c += data.clay;
                i += data.iron;
                cr += data.crop;
            }
            reached.put(key, entry.targetLevel);
            if (!complete) {
                unknown++;
                continue;
            }
            lumber += l;
            clay += c;
            iron += i;
            crop += cr;
        }
        return new Result(new BuildQueueAutomation.Resources(lumber, clay, iron, crop), unknown, reachedCount);
    }

    /** The level of the building on this slot, counting an upgrade queued in the game; 0 if empty. */
    static int slotLevel(PlayerBuildings.Village village, int slotId) {
        int level = 0;
        for (PlayerBuildings.Slot s : village.slots) {
            if (s.slotId == slotId) {
                level = s.level;
            }
        }
        return Math.max(level, village.queuedLevel(slotId));
    }

    /** The highest level of this building type the village has built or has queued in the game. */
    static int reachedLevel(PlayerBuildings.Village village, int typeId) {
        int level = village.levelOf(typeId);
        for (PlayerBuildings.Pending p : village.pending) {
            if (p.typeId == typeId && p.aspiredLevel > level) {
                level = p.aspiredLevel;
            }
        }
        return level;
    }
}
