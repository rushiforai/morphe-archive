package com.travianpatch.notifier;

import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

/**
 * Warns when a village's warehouse (wood, clay, iron) or granary (crop) is about to fill up, using the
 * stock, capacity and production per hour the game reports for each village. Pure logic (no Android
 * APIs) so it can be checked against sample data off-device.
 */
final class ResourceAlerts {

    static final String TITLE = "Storage almost full";

    /** GraphQL selection added to each village of the resources request. */
    static final String SELECTION = "resources { lumberProduction clayProduction ironProduction cropProduction "
            + "netCropProduction lumberStock clayStock ironStock cropStock maxStorageCapacity "
            + "maxCropStorageCapacity }";

    /** Warn once a store is due to be full within this long. */
    static final long WARN_WITHIN_MS = 30L * 60 * 1000;
    /**
     * An alert is only re-armed once the store is clearly not close any more (not filling, or more than
     * this far away), so a production change around the edge doesn't repeat it.
     */
    static final long CLEAR_BEYOND_MS = 60L * 60 * 1000;

    /** One resource of one village. */
    static final class Reading {
        final String key; // "res:<villageId>:<resource>"
        final String label; // "wood", "clay", "iron" or "crop"
        final boolean granary; // crop is kept in the granary, the rest in the warehouse
        /** Time until the store is full: 0 if it already is, -1 if it is not filling. */
        final long etaMs;

        Reading(String key, String label, boolean granary, long etaMs) {
            this.key = key;
            this.label = label;
            this.granary = granary;
            this.etaMs = etaMs;
        }
    }

    private ResourceAlerts() {
    }

    /** The four resources of one village of the response; empty if the village has no resource data. */
    static List<Reading> read(JSONObject village) {
        List<Reading> out = new ArrayList<Reading>();
        JSONObject r = village.optJSONObject("resources");
        if (r == null) {
            return out;
        }
        String id = String.valueOf(village.opt("id"));
        double warehouse = r.optDouble("maxStorageCapacity", 0);
        double granary = r.optDouble("maxCropStorageCapacity", 0);
        out.add(reading(id, "wood", false, r.optDouble("lumberStock", 0), warehouse, r.optDouble("lumberProduction", 0)));
        out.add(reading(id, "clay", false, r.optDouble("clayStock", 0), warehouse, r.optDouble("clayProduction", 0)));
        out.add(reading(id, "iron", false, r.optDouble("ironStock", 0), warehouse, r.optDouble("ironProduction", 0)));
        // crop is eaten by the troops, so what fills the granary is the net production
        out.add(reading(id, "crop", true, r.optDouble("cropStock", 0), granary, r.optDouble("netCropProduction", 0)));
        return out;
    }

    private static Reading reading(String villageId, String label, boolean granary,
                                   double stock, double capacity, double perHour) {
        long eta;
        if (capacity <= 0) {
            eta = -1; // no capacity reported: nothing to judge
        } else if (stock >= capacity) {
            eta = 0;
        } else if (perHour <= 0) {
            eta = -1;
        } else {
            eta = Math.round((capacity - stock) / perHour * 3_600_000d);
        }
        return new Reading("res:" + villageId + ":" + label, label, granary, eta);
    }

    /** True if this store is full or will be within the warning time. */
    static boolean atRisk(Reading r) {
        return r.etaMs >= 0 && r.etaMs <= WARN_WITHIN_MS;
    }

    /** True once this store is clearly not close to full, so its alert may fire again later. */
    static boolean clear(Reading r) {
        return r.etaMs < 0 || r.etaMs > CLEAR_BEYOND_MS;
    }

    /** "Home (1|2) — Warehouse: wood full in 20 min, clay is full. Granary: crop full in 30 min." */
    static String text(String villageName, int x, int y, List<Reading> risky) {
        StringBuilder warehouse = new StringBuilder();
        StringBuilder granary = new StringBuilder();
        for (Reading r : risky) {
            StringBuilder target = r.granary ? granary : warehouse;
            if (target.length() > 0) {
                target.append(", ");
            }
            target.append(r.label).append(r.etaMs == 0 ? " is full" : " full in " + minutes(r.etaMs) + " min");
        }
        StringBuilder sb = new StringBuilder(villageName + " (" + x + "|" + y + ") — ");
        if (warehouse.length() > 0) {
            sb.append("Warehouse: ").append(warehouse).append('.');
        }
        if (granary.length() > 0) {
            if (warehouse.length() > 0) {
                sb.append(' ');
            }
            sb.append("Granary: ").append(granary).append('.');
        }
        return sb.toString();
    }

    /** Whole minutes, rounded up, at least 1. */
    private static long minutes(long ms) {
        return Math.max(1L, (ms + 59_999L) / 60_000L);
    }
}
