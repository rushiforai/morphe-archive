package com.travianpatch.notifier;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

/**
 * The build order the user set for one village: an ordered list of "upgrade this building to this
 * level" entries. Nothing here fires an action; a later step reads this list and decides when to.
 * Pure logic (no Android APIs) so the list encoding can be checked against sample data off-device;
 * BuildOrderActivity does the actual SharedPreferences reads and writes using these constants and
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

        Entry(int buildingTypeId, int targetLevel) {
            this.buildingTypeId = buildingTypeId;
            this.targetLevel = targetLevel;
        }

        String label() {
            return GameData.buildingName(buildingTypeId) + " to level " + targetLevel;
        }
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
                result.add(new Entry(o.getInt("buildingTypeId"), o.getInt("targetLevel")));
            }
        } catch (Exception e) {
            return new ArrayList<Entry>();
        }
        return result;
    }
}
