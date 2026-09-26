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
        List<String> notes = new ArrayList<String>();
        List<BuildOrderStore.Entry> left = new ArrayList<BuildOrderStore.Entry>();
        if (rules == null || village == null) {
            notes.add("the game's data isn't read yet");
            return new Outcome(null, new ArrayList<BuildOrderStore.Entry>(queue), notes);
        }
        for (BuildOrderStore.Entry e : queue) {
            if (QueueEstimate.reachedLevel(village, e.buildingTypeId) >= e.targetLevel) {
                notes.add(GameData.buildingName(e.buildingTypeId) + " " + e.targetLevel + " reached");
            } else {
                left.add(e);
            }
        }
        if (!village.pending.isEmpty()) {
            notes.add("the game is already building here");
            return new Outcome(null, left, notes);
        }
        for (BuildOrderStore.Entry e : left) {
            BuildChoices.Row row = rowFor(rules, tribeId, village, e.buildingTypeId);
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
            if (!BuildQueueAutomation.affordable(have, cost, cfg.bufferPercent)) {
                notes.add(name + " " + row.toLevel + ": waiting for resources");
                return new Outcome(null, left, notes);
            }
            List<BuildOrderStore.Entry> one = new ArrayList<BuildOrderStore.Entry>();
            one.add(e);
            BuildQueueAutomation.VillageState state = new BuildQueueAutomation.VillageState(true, idleSinceMs, have);
            if (BuildQueueAutomation.decide(village.id, state, one, cost, cfg.bufferPercent, cfg.minDelayMs,
                    cfg.maxDelayMs, false, nowMs) == null) {
                notes.add(name + " " + row.toLevel + ": waiting a little before starting");
                return new Outcome(null, left, notes);
            }
            return new Outcome(row, left, notes);
        }
        if (left.isEmpty()) {
            notes.add("queue finished");
        }
        return new Outcome(null, left, notes);
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
        int slot = BuildChoices.slotForNew(typeId, village);
        BuildOptions.Verdict verdict = BuildOptions.canBuildNew(rule, tribeId, village);
        if (rule.hasExtension && verdict.answer != BuildOptions.Answer.NO) {
            verdict = new BuildOptions.Verdict(BuildOptions.Answer.UNKNOWN, "Where the game puts a wall isn't confirmed yet");
            slot = 0;
        } else if (slot == 0 && verdict.answer != BuildOptions.Answer.NO) {
            verdict = new BuildOptions.Verdict(BuildOptions.Answer.NO, "No free slot for it");
        }
        return new BuildChoices.Row(slot, typeId, 0, 1, verdict, rule.levelData(1));
    }
}
