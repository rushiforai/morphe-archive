package com.travianpatch.notifier;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

/**
 * The last poll's real resource stock and hourly production per village, so screens other than the
 * storage alert (which only derives a "how close to full" boolean) can use the raw numbers - currently
 * the Build order screen's queue-time estimate. Pure logic (no Android APIs) so it can be checked
 * against sample data off-device.
 */
final class VillageResources {

    private VillageResources() {
    }

    static final class Entry {
        final String villageId;
        final long lumberStock, clayStock, ironStock, cropStock;
        final long lumberPerHour, clayPerHour, ironPerHour, cropPerHour;

        Entry(String villageId, long lumberStock, long clayStock, long ironStock, long cropStock,
              long lumberPerHour, long clayPerHour, long ironPerHour, long cropPerHour) {
            this.villageId = villageId;
            this.lumberStock = lumberStock;
            this.clayStock = clayStock;
            this.ironStock = ironStock;
            this.cropStock = cropStock;
            this.lumberPerHour = lumberPerHour;
            this.clayPerHour = clayPerHour;
            this.ironPerHour = ironPerHour;
            this.cropPerHour = cropPerHour;
        }
    }

    /** Reads id + resources out of the poll's village array; skips any entry with no id or no resources block. */
    static List<Entry> compute(JSONArray villages) {
        List<Entry> out = new ArrayList<Entry>();
        if (villages == null) {
            return out;
        }
        for (int i = 0; i < villages.length(); i++) {
            JSONObject v = villages.optJSONObject(i);
            if (v == null || v.isNull("id") || !v.has("id")) {
                continue;
            }
            JSONObject r = v.optJSONObject("resources");
            if (r == null) {
                continue;
            }
            out.add(new Entry(String.valueOf(v.opt("id")),
                    r.optLong("lumberStock", 0), r.optLong("clayStock", 0),
                    r.optLong("ironStock", 0), r.optLong("cropStock", 0),
                    r.optLong("lumberProduction", 0), r.optLong("clayProduction", 0),
                    r.optLong("ironProduction", 0), r.optLong("netCropProduction", 0)));
        }
        return out;
    }

    static String toJson(List<Entry> entries) {
        try {
            JSONArray array = new JSONArray();
            for (Entry e : entries) {
                JSONObject o = new JSONObject();
                o.put("villageId", e.villageId);
                o.put("lumberStock", e.lumberStock);
                o.put("clayStock", e.clayStock);
                o.put("ironStock", e.ironStock);
                o.put("cropStock", e.cropStock);
                o.put("lumberPerHour", e.lumberPerHour);
                o.put("clayPerHour", e.clayPerHour);
                o.put("ironPerHour", e.ironPerHour);
                o.put("cropPerHour", e.cropPerHour);
                array.put(o);
            }
            return array.toString();
        } catch (Exception e) {
            return "[]";
        }
    }

    /** Reads the stored resources back; empty list for null or unreadable input. */
    static List<Entry> fromJson(String json) {
        List<Entry> result = new ArrayList<Entry>();
        if (json == null) {
            return result;
        }
        try {
            JSONArray array = new JSONArray(json);
            for (int i = 0; i < array.length(); i++) {
                JSONObject o = array.getJSONObject(i);
                result.add(new Entry(o.getString("villageId"),
                        o.getLong("lumberStock"), o.getLong("clayStock"), o.getLong("ironStock"), o.getLong("cropStock"),
                        o.getLong("lumberPerHour"), o.getLong("clayPerHour"), o.getLong("ironPerHour"), o.getLong("cropPerHour")));
            }
        } catch (Exception e) {
            return new ArrayList<Entry>();
        }
        return result;
    }

    /** The entry for one village id, or null if not present. */
    static Entry find(List<Entry> entries, String villageId) {
        for (Entry e : entries) {
            if (e.villageId.equals(villageId)) {
                return e;
            }
        }
        return null;
    }
}
