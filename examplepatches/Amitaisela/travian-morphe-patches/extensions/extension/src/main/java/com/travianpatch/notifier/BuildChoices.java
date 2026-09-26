package com.travianpatch.notifier;

import java.util.ArrayList;
import java.util.List;

/**
 * Everything a village could build next, one row per slot: the next level of each existing building
 * (several woodcutters are separate rows) and each building type that could go on a free slot. Each row
 * carries the game's own verdict (BuildOptions) and the game's cost/effect for the next level. Pure logic.
 */
final class BuildChoices {

    /** Slot the game uses for the Rally Point (seen in live data: Rally Point on slot 39). */
    static final int RALLY_POINT_SLOT = 39;
    static final int RALLY_POINT_TYPE = 16;

    private BuildChoices() {
    }

    static final class Row {
        /** The slot to send the build to; 0 means "a new building", the slot is chosen with slotForNew. */
        final int slotId;
        final int typeId;
        final int fromLevel;
        final int toLevel;
        final BuildOptions.Verdict verdict;
        /** The game's cost/effect for toLevel, or null if its table has none. */
        final BuildingRules.Level next;

        Row(int slotId, int typeId, int fromLevel, int toLevel, BuildOptions.Verdict verdict, BuildingRules.Level next) {
            this.slotId = slotId;
            this.typeId = typeId;
            this.fromLevel = fromLevel;
            this.toLevel = toLevel;
            this.verdict = verdict;
            this.next = next;
        }
    }

    static List<Row> list(BuildingRules rules, int tribeId, PlayerBuildings.Village village) {
        List<Row> rows = new ArrayList<Row>();
        if (rules == null || village == null) {
            return rows;
        }
        for (PlayerBuildings.Slot slot : village.slots) {
            if (slot.isEmpty()) {
                continue;
            }
            BuildingRules.Rule rule = rules.find(slot.typeId);
            if (rule == null) {
                continue;
            }
            int from = Math.max(slot.level, village.queuedLevel(slot.slotId));
            rows.add(new Row(slot.slotId, slot.typeId, from, from + 1, BuildOptions.canUpgrade(rule, village, slot),
                    rule.levelData(from + 1)));
        }
        for (BuildingRules.Rule rule : rules.rules) {
            if (rule.type >= 1 && rule.type <= 4) {
                continue; // resource fields only exist on their own slots; they are upgraded, never built new
            }
            BuildOptions.Verdict verdict = BuildOptions.canBuildNew(rule, tribeId, village);
            if (verdict.answer != BuildOptions.Answer.NO && rule.hasExtension) {
                verdict = new BuildOptions.Verdict(BuildOptions.Answer.UNKNOWN, "Where the game puts a wall isn't confirmed yet");
            } else if (verdict.answer != BuildOptions.Answer.NO && slotForNew(rule.type, village) == 0) {
                verdict = new BuildOptions.Verdict(BuildOptions.Answer.NO, "No free slot for it");
            }
            rows.add(new Row(0, rule.type, 0, 1, verdict, rule.levelData(1)));
        }
        return rows;
    }

    /** The slot a new building of this type goes on, or 0 if none is free (a slot with a queued build is taken). */
    static int slotForNew(int typeId, PlayerBuildings.Village village) {
        if (typeId == RALLY_POINT_TYPE) {
            return free(village, RALLY_POINT_SLOT) ? RALLY_POINT_SLOT : 0;
        }
        for (int s = 19; s <= 38; s++) {
            if (free(village, s)) {
                return s;
            }
        }
        return 0;
    }

    private static boolean free(PlayerBuildings.Village village, int slotId) {
        boolean seen = false;
        for (PlayerBuildings.Slot slot : village.slots) {
            if (slot.slotId == slotId) {
                if (!slot.isEmpty()) {
                    return false;
                }
                seen = true;
            }
        }
        for (PlayerBuildings.Pending p : village.pending) {
            if (p.slotId == slotId) {
                return false;
            }
        }
        return seen;
    }
}
