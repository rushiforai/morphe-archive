package com.travianpatch.notifier;

import java.util.ArrayList;
import java.util.List;

/**
 * Decides what a village's saved build queue should start next, using only the game's data: entries
 * already reached (built or queued in the game) are dropped; nothing starts while the game is already
 * building; entries the game would refuse (or that can't be checked yet) are skipped with a note, and the
 * first allowed one starts once resources (plus the buffer), the random delay and quiet hours allow it.
 * An entry "type T to level L" works on the slot of that type with the highest level (the same one the
 * cost totals count), one level at a time; if the village has none, it is built new. Pure logic.
 */
final class BuildQueueStep {

    private BuildQueueStep() {
    }

    static final class Outcome {
        /** What to start now, or null. */
        final BuildChoices.Row fire;
        /** The queue after dropping reached entries (the fired entry stays until the game shows it). */
        final List<BuildOrderStore.Entry> queue;
        final List<String> notes;

        Outcome(BuildChoices.Row fire, List<BuildOrderStore.Entry> queue, List<String> notes) {
            this.fire = fire;
            this.queue = queue;
            this.notes = notes;
        }
    }

    static Outcome next(BuildingRules rules, int tribeId, PlayerBuildings.Village village, VillageResources.Entry stock,
                        List<BuildOrderStore.Entry> queue, AutomationSettings.Config cfg, boolean quiet, long nowMs,
                        long idleSinceMs) {
        return next(rules, tribeId, village, stock, queue, cfg, quiet, nowMs, false, idleSinceMs, idleSinceMs);
    }

    /**
     * parallel: a field and a building may be built at the same time (Romans). Each line (fields, buildings)
     * then starts its own first allowed entry; a line that is busy or waiting doesn't hold up the other one.
     * fieldIdleSinceMs / buildingIdleSinceMs: when each line went idle (both the same when not parallel).
     */
    static Outcome next(BuildingRules rules, int tribeId, PlayerBuildings.Village village, VillageResources.Entry stock,
                        List<BuildOrderStore.Entry> queue, AutomationSettings.Config cfg, boolean quiet, long nowMs,
                        boolean parallel, long fieldIdleSinceMs, long buildingIdleSinceMs) {
        List<String> notes = new ArrayList<String>();
        List<BuildOrderStore.Entry> left = new ArrayList<BuildOrderStore.Entry>();
        if (rules == null || village == null) {
            notes.add("the game's data isn't read yet");
            return new Outcome(null, new ArrayList<BuildOrderStore.Entry>(queue), notes);
        }
        for (BuildOrderStore.Entry e : queue) {
            int reached = e.slotId > 0 ? QueueEstimate.slotLevel(village, e.slotId)
                    : QueueEstimate.reachedLevel(village, e.buildingTypeId);
            if (reached >= e.targetLevel) {
                notes.add(GameData.buildingName(e.buildingTypeId) + " " + e.targetLevel + " reached");
            } else {
                left.add(e);
            }
        }
        boolean fieldBlocked = parallel && laneBusy(village, true);
        boolean buildingBlocked = parallel && laneBusy(village, false);
        if (!parallel && !village.pending.isEmpty()) {
            notes.add("the game is already building here");
            return new Outcome(null, left, notes);
        }
        if (fieldBlocked && buildingBlocked) {
            notes.add("the game is already building a field and a building here");
            return new Outcome(null, left, notes);
        }
        if (fieldBlocked) {
            notes.add("fields: one is already building");
        }
        if (buildingBlocked) {
            notes.add("buildings: one is already building");
        }
        for (BuildOrderStore.Entry e : left) {
            boolean field = BuildChoices.isField(e.buildingTypeId);
            if (field ? fieldBlocked : buildingBlocked) {
                continue;
            }
            BuildChoices.Row row = e.slotId > 0 ? rowForSlot(rules, tribeId, village, e.slotId, e.buildingTypeId)
                    : rowFor(rules, tribeId, village, e.buildingTypeId);
            String name = GameData.buildingName(e.buildingTypeId);
            if (row == null) {
                notes.add(name + ": not in the game's rules");
                continue;
            }
            if (row.verdict.answer != BuildOptions.Answer.YES) {
                notes.add(name + ": skipped (" + row.verdict.reason + ")");
                continue;
            }
            if (row.next == null) {
                notes.add(name + ": the game's table has no cost for level " + row.toLevel);
                continue;
            }
            if (stock == null) {
                notes.add("current stock isn't known yet");
                return new Outcome(null, left, notes);
            }
            BuildQueueAutomation.Resources cost = new BuildQueueAutomation.Resources(row.next.lumber, row.next.clay,
                    row.next.iron, row.next.crop);
            BuildQueueAutomation.Resources have = new BuildQueueAutomation.Resources(stock.lumberStock, stock.clayStock,
                    stock.ironStock, stock.cropStock);
            if (quiet) {
                notes.add("quiet hours");
                return new Outcome(null, left, notes);
            }
            String wait = null;
            if (!BuildQueueAutomation.affordable(have, cost, cfg.bufferPercent)) {
                wait = name + " " + row.toLevel + ": waiting, " + Costs.missing(have.lumber, have.clay, have.iron,
                        have.crop, cost.lumber, cost.clay, cost.iron, cost.crop, cfg.bufferPercent);
            } else {
                List<BuildOrderStore.Entry> one = new ArrayList<BuildOrderStore.Entry>();
                one.add(e);
                long idleSince = field ? fieldIdleSinceMs : buildingIdleSinceMs;
                BuildQueueAutomation.VillageState state = new BuildQueueAutomation.VillageState(true, idleSince, have);
                if (BuildQueueAutomation.decide(village.id, state, one, cost, cfg.bufferPercent, cfg.minDelayMs,
                        cfg.maxDelayMs, false, nowMs) == null) {
                    wait = name + " " + row.toLevel + ": waiting a little before starting";
                }
            }
            if (wait == null) {
                return new Outcome(row, left, notes);
            }
            notes.add(wait);
            if (!parallel) {
                return new Outcome(null, left, notes);
            }
            // This line waits; the other line may still start its own first entry.
            if (field) {
                fieldBlocked = true;
            } else {
                buildingBlocked = true;
            }
        }
        if (left.isEmpty()) {
            notes.add("queue finished");
        }
        return new Outcome(null, left, notes);
    }

    /** True when the game is building something in this line (fields = slots 1-18, buildings = the rest). */
    static boolean laneBusy(PlayerBuildings.Village village, boolean fields) {
        for (PlayerBuildings.Pending p : village.pending) {
            boolean fieldSlot = p.slotId >= 1 && p.slotId <= 18;
            if (fieldSlot == fields) {
                return true;
            }
        }
        return false;
    }

    /** The row for one exact slot: upgrade the building there, or build this type on it if it is empty. */
    static BuildChoices.Row rowForSlot(BuildingRules rules, int tribeId, PlayerBuildings.Village village, int slotId,
                                       int typeId) {
        BuildingRules.Rule rule = rules.find(typeId);
        if (rule == null) {
            return null;
        }
        for (PlayerBuildings.Slot s : village.slots) {
            if (s.slotId != slotId) {
                continue;
            }
            if (!s.isEmpty() && s.typeId != typeId) {
                return null; // something else stands there now
            }
            if (!s.isEmpty()) {
                int level = Math.max(s.level, village.queuedLevel(slotId));
                return new BuildChoices.Row(slotId, typeId, level, level + 1, BuildOptions.canUpgrade(rule, village, s),
                        rule.levelData(level + 1));
            }
        }
        if (!BuildChoices.fitsSlot(rule, slotId)) {
            return null; // e.g. a wall anywhere but the wall slot
        }
        BuildOptions.Verdict verdict = BuildChoices.free(village, slotId)
                ? BuildOptions.canBuildNew(rule, tribeId, village)
                : new BuildOptions.Verdict(BuildOptions.Answer.NO, "Slot " + slotId + " is taken");
        return new BuildChoices.Row(slotId, typeId, 0, 1, verdict, rule.levelData(1));
    }

    /** The row that would move this building type up: its highest existing slot, or a new building. */
    static BuildChoices.Row rowFor(BuildingRules rules, int tribeId, PlayerBuildings.Village village, int typeId) {
        BuildingRules.Rule rule = rules.find(typeId);
        if (rule == null) {
            return null;
        }
        PlayerBuildings.Slot best = null;
        int bestLevel = -1;
        for (PlayerBuildings.Slot s : village.slots) {
            if (s.typeId == typeId && !s.isEmpty()) {
                int level = Math.max(s.level, village.queuedLevel(s.slotId));
                if (level > bestLevel) {
                    best = s;
                    bestLevel = level;
                }
            }
        }
        if (best != null) {
            return new BuildChoices.Row(best.slotId, typeId, bestLevel, bestLevel + 1,
                    BuildOptions.canUpgrade(rule, village, best), rule.levelData(bestLevel + 1));
        }
        int slot = BuildChoices.slotForNew(rule, village);
        BuildOptions.Verdict verdict = BuildOptions.canBuildNew(rule, tribeId, village);
        if (slot == 0 && verdict.answer != BuildOptions.Answer.NO) {
            verdict = new BuildOptions.Verdict(BuildOptions.Answer.NO, rule.hasExtension
                    ? "The wall slot is taken" : "No free slot for it");
        }
        return new BuildChoices.Row(slot, typeId, 0, 1, verdict, rule.levelData(1));
    }
}
