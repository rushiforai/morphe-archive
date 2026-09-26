package com.travianpatch.notifier;

import java.util.List;

/**
 * Decides, from the game's own rules table and a village's real buildings, whether a building can be
 * built on an empty slot or upgraded right now, and if not why. Answers are YES, NO, or UNKNOWN when the
 * game's rule for that building is one this app can't check yet (never a silent yes). Pure logic (no
 * Android APIs) so it can be checked against real sample data off-device.
 */
final class BuildOptions {

    private BuildOptions() {
    }

    enum Answer {
        YES, NO, UNKNOWN
    }

    static final class Verdict {
        final Answer answer;
        final String reason;

        Verdict(Answer answer, String reason) {
            this.answer = answer;
            this.reason = reason;
        }
    }

    /** Can this building type be put on an empty slot of this village right now? */
    static Verdict canBuildNew(BuildingRules.Rule rule, int tribeId, PlayerBuildings.Village village) {
        if (!rule.validTribes.contains(tribeId)) {
            return no("Not available for your tribe");
        }
        if (!rule.validVillageTypes.contains(village.type)) {
            return no("Not available in this kind of village");
        }
        if (rule.maxPerVillage > 0 && village.countOf(rule.type) >= rule.maxPerVillage) {
            return no("Already built (only " + rule.maxPerVillage + " allowed per village)");
        }
        if (!village.hasEmptySlot()) {
            return no("No free building slot");
        }
        for (List<BuildingRules.Requirement> group : rule.requirements) {
            if (group.isEmpty()) {
                continue;
            }
            if (!anyMet(group, village)) {
                return no(reasonFor(group.get(0)));
            }
        }
        for (String restriction : rule.restrictions) {
            if (!"NONE".equals(restriction) && !"NOT_CAPITAL".equals(restriction)
                    && !"ONLY_CAPITAL".equals(restriction)) {
                return new Verdict(Answer.UNKNOWN, "The game's rule (" + restriction + ") can't be checked yet");
            }
        }
        if (rule.maxPerVillage == 0 && village.countOf(rule.type) > 0) {
            // The game allows several, but its data doesn't say when another may be started.
            return new Verdict(Answer.UNKNOWN, "When the game allows another one can't be checked yet");
        }
        return new Verdict(Answer.YES, "");
    }

    /** Can this existing building be upgraded another level right now? Counts a queued upgrade as done. */
    static Verdict canUpgrade(BuildingRules.Rule rule, PlayerBuildings.Village village, PlayerBuildings.Slot slot) {
        int current = Math.max(slot.level, village.queuedLevel(slot.slotId));
        if (current >= rule.maxLevel) {
            return no("Already at the game's maximum level (" + rule.maxLevel + ")");
        }
        return new Verdict(Answer.YES, "");
    }

    private static boolean anyMet(List<BuildingRules.Requirement> group, PlayerBuildings.Village village) {
        for (BuildingRules.Requirement r : group) {
            if (r.buildingTypeId > 0) {
                if (village.levelOf(r.buildingTypeId) >= r.level) {
                    return true;
                }
            } else if (village.countOf(-r.buildingTypeId) == 0) {
                return true;
            }
        }
        return false;
    }

    private static String reasonFor(BuildingRules.Requirement r) {
        if (r.buildingTypeId > 0) {
            return "Needs " + GameData.buildingName(r.buildingTypeId) + " level " + r.level;
        }
        return "Can't be built together with " + GameData.buildingName(-r.buildingTypeId);
    }

    private static Verdict no(String reason) {
        return new Verdict(Answer.NO, reason);
    }
}
