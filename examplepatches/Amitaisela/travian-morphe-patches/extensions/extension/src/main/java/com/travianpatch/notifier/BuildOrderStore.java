package com.travianpatch.notifier;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

/**
 * The build order the user set for one village: an ordered list of "upgrade this building to this
 * level" entries. Nothing here fires an action; a later step reads this list and decides when to.
 * Pure logic (no Android APIs) so the list encoding can be checked against sample data off-device;
 * The Village tab and the worker do the actual SharedPreferences reads and writes using these constants and
 * (de)serializers.
 */
final class BuildOrderStore {

    /** SharedPreferences file name the build order is stored in. */
    static final String PREFS = "travian_build_order";

    private BuildOrderStore() {
    }

    /** One entry in a village's build order. */
    static final class Entry {
        final int buildingTypeId;
        final int targetLevel;
        /** The exact slot to upgrade; 0 = "the highest building of this type" (or a new one). */
        final int slotId;

        Entry(int buildingTypeId, int targetLevel) {
            this(buildingTypeId, targetLevel, 0);
        }

        Entry(int buildingTypeId, int targetLevel, int slotId) {
            this.buildingTypeId = buildingTypeId;
            this.targetLevel = targetLevel;
            this.slotId = slotId;
        }

        String label() {
            return GameData.buildingName(buildingTypeId) + (slotId > 0 ? " (slot " + slotId + ")" : "")
                    + " to level " + targetLevel;
        }
    }

    /** The highest level queued for this building (same type and slot; slot 0 = a new one); 0 if none. */
    static int plannedLevel(List<Entry> order, int typeId, int slotId) {
        int best = 0;
        for (Entry e : order) {
            if (e.buildingTypeId == typeId && e.slotId == slotId && e.targetLevel > best) {
                best = e.targetLevel;
            }
        }
        return best;
    }

    /**
     * Takes one level off what is queued for this building: target 3 becomes 2, and the entry goes away
     * once its target is no higher than fromLevel (what the village already has). Returns true if changed.
     */
    static boolean removeOneLevel(List<Entry> order, int typeId, int slotId, int fromLevel) {
        for (int i = order.size() - 1; i >= 0; i--) {
            Entry e = order.get(i);
            if (e.buildingTypeId == typeId && e.slotId == slotId) {
                if (e.targetLevel - 1 <= fromLevel) {
                    order.remove(i);
                } else {
                    order.set(i, new Entry(typeId, e.targetLevel - 1, slotId));
                }
                return true;
            }
        }
        return false;
    }

    /** Per-village "build the queue automatically" switch. */
    static String autoKey(String villageId) {
        return "auto_" + villageId;
    }

    /** Per-village "build a field and a building at the same time" switch (Romans only; on unless turned off). */
    static String parallelKey(String villageId) {
        return "parallel_" + villageId;
    }

    /** The worker's latest status line for a village's queue. */
    static String notesKey(String villageId) {
        return "notes_" + villageId;
    }

    /** The SharedPreferences key a village's order is stored under. */
    static String key(String villageId) {
        return "order_" + villageId;
    }

    static String toJson(List<Entry> entries) {
        try {
            JSONArray array = new JSONArray();
            for (Entry e : entries) {
                JSONObject o = new JSONObject();
                o.put("buildingTypeId", e.buildingTypeId);
                o.put("targetLevel", e.targetLevel);
                if (e.slotId > 0) {
                    o.put("slotId", e.slotId);
                }
                array.put(o);
            }
            return array.toString();
        } catch (Exception e) {
            return "[]";
        }
    }

    /** Reads a stored order back; empty list for null or unreadable input. */
    static List<Entry> fromJson(String json) {
        List<Entry> result = new ArrayList<Entry>();
        if (json == null) {
            return result;
        }
        try {
            JSONArray array = new JSONArray(json);
            for (int i = 0; i < array.length(); i++) {
                JSONObject o = array.getJSONObject(i);
                result.add(new Entry(o.getInt("buildingTypeId"), o.getInt("targetLevel"), o.optInt("slotId", 0)));
            }
        } catch (Exception e) {
            return new ArrayList<Entry>();
        }
        return result;
    }
}
