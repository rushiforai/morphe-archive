package com.travianpatch.notifier;

import java.util.HashMap;
import java.util.Map;

/**
 * Real cost, build-time and effect data for the building types this app knows enough about to model,
 * ported from the open-source Travian calculator at github.com/kirilloid/travian
 * (src/model/base/buildings.ts, fetched 2026-09-23), whose "Legends" ruleset group is the current
 * T4.5/T4.6 line this game (Travian: Legends) runs. Not every building type is covered yet - has()
 * says which are. Pure logic (no Android APIs, no network) so it can be checked against known values
 * off-device.
 */
final class BuildingCostTable {

    /** Resource-field production per level (index = level), the base table before the Legends bonus. */
    private static final int[] PRODUCTION = {
            2, 5, 9, 15, 22, 33, 50, 70, 100, 145, 200, 280, 375, 495, 635, 800, 1000, 1300, 1600, 2000, 2450, 3050
    };
    /** Travian: Legends applies this multiplier on top of the base production table. */
    private static final double LEGENDS_PRODUCTION_MULTIPLIER = 1.4;

    private static final class Entry {
        final long[] baseCost;
        final double costGrowth;
        final int maxLevel;
        final double timeBase;
        final double timeGrowth;
        final double timeOffset;
        final int effectKind; // 0 = none modeled, 1 = resource production, 2 = storage capacity

        Entry(long[] baseCost, double costGrowth, int maxLevel,
              double timeBase, double timeGrowth, double timeOffset, int effectKind) {
            this.baseCost = baseCost;
            this.costGrowth = costGrowth;
            this.maxLevel = maxLevel;
            this.timeBase = timeBase;
            this.timeGrowth = timeGrowth;
            this.timeOffset = timeOffset;
            this.effectKind = effectKind;
        }
    }

    private static final int EFFECT_NONE = 0;
    private static final int EFFECT_PRODUCTION = 1;
    private static final int EFFECT_CAPACITY = 2;

    private static final Map<Integer, Entry> TABLE = new HashMap<Integer, Entry>();

    static {
        TABLE.put(1, new Entry(new long[]{40, 100, 50, 60}, 1.67, 20, 1780.0 / 3, 1.6, 1000.0 / 3, EFFECT_PRODUCTION));
        TABLE.put(2, new Entry(new long[]{80, 40, 80, 50}, 1.67, 21, 1660.0 / 3, 1.6, 1000.0 / 3, EFFECT_PRODUCTION));
        TABLE.put(3, new Entry(new long[]{100, 80, 30, 60}, 1.67, 20, 2350.0 / 3, 1.6, 1000.0 / 3, EFFECT_PRODUCTION));
        TABLE.put(4, new Entry(new long[]{70, 90, 70, 20}, 1.67, 21, 1450.0 / 3, 1.6, 1000.0 / 3, EFFECT_PRODUCTION));
        TABLE.put(10, new Entry(new long[]{130, 160, 90, 40}, 1.28, 20, 3875, 1.16, 1875, EFFECT_CAPACITY));
        TABLE.put(11, new Entry(new long[]{80, 100, 70, 20}, 1.28, 20, 3475, 1.16, 1875, EFFECT_CAPACITY));
        TABLE.put(15, new Entry(new long[]{70, 40, 60, 20}, 1.28, 20, 3875, 1.16, 1875, EFFECT_NONE));
    }

    private BuildingCostTable() {
    }

    static boolean has(int buildingTypeId) {
        return TABLE.containsKey(buildingTypeId);
    }

    /** -1 if this building type has no static data yet. */
    static int maxLevel(int buildingTypeId) {
        Entry e = TABLE.get(buildingTypeId);
        return e == null ? -1 : e.maxLevel;
    }

    /** Throws IllegalArgumentException for a building type with no static data - callers check has() first. */
    static BuildQueueAutomation.Resources cost(int buildingTypeId, int level) {
        Entry e = require(buildingTypeId);
        double factor = Math.pow(e.costGrowth, level - 1);
        return new BuildQueueAutomation.Resources(
                round5(e.baseCost[0] * factor),
                round5(e.baseCost[1] * factor),
                round5(e.baseCost[2] * factor),
                round5(e.baseCost[3] * factor));
    }

    /** Build time in seconds at the given server speed (2.0 = twice as fast as a 1x world). */
    static double buildTimeSeconds(int buildingTypeId, int level, double serverSpeed) {
        Entry e = require(buildingTypeId);
        double seconds = e.timeBase * Math.pow(e.timeGrowth, level - 1) - e.timeOffset;
        return seconds / serverSpeed;
    }

    /** A short plain-English description of what this level gives, or a "not modeled" fallback. */
    static String effectDescription(int buildingTypeId, int level) {
        Entry e = TABLE.get(buildingTypeId);
        if (e == null) {
            return "Not known for this building yet";
        }
        switch (e.effectKind) {
            case EFFECT_PRODUCTION:
                return "Produces about " + productionPerHour(level) + " per hour";
            case EFFECT_CAPACITY:
                return "Holds up to " + capacity(level);
            default:
                return "Effect not modeled yet";
        }
    }

    private static long productionPerHour(int level) {
        int base = level >= 0 && level < PRODUCTION.length ? PRODUCTION[level] : PRODUCTION[PRODUCTION.length - 1];
        return Math.round(base * LEGENDS_PRODUCTION_MULTIPLIER);
    }

    private static long capacity(int level) {
        return Math.round(round100(2120 * Math.pow(1.2, level) - 1320));
    }

    private static long round5(double value) {
        return Math.round(value / 5.0) * 5;
    }

    private static double round100(double value) {
        return Math.round(value / 100.0) * 100.0;
    }

    private static Entry require(int buildingTypeId) {
        Entry e = TABLE.get(buildingTypeId);
        if (e == null) {
            throw new IllegalArgumentException("No static data for building type " + buildingTypeId);
        }
        return e;
    }
}
