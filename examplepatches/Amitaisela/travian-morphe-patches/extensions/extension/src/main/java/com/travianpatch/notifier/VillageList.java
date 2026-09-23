package com.travianpatch.notifier;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

/**
 * The villages the last poll saw, with their real ids, so other screens can key stored data (like a
 * per-village build order) by something that survives a village rename. Pure logic (no Android APIs)
 * so it can be checked against sample data off-device.
 */
final class VillageList {

    private VillageList() {
    }

    /** One village as the last poll reported it. */
    static final class Entry {
        final String id;
        final String name;
        final int x;
        final int y;

        Entry(String id, String name, int x, int y) {
            this.id = id;
            this.name = name;
            this.x = x;
            this.y = y;
        }

        String label() {
            return name + " (" + x + "|" + y + ")";
        }
    }

    /** Reads id/name/x/y out of the poll's village array; skips any entry with no id. */
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
            out.add(new Entry(String.valueOf(v.opt("id")), v.optString("name", "your village"),
                    v.optInt("x", 0), v.optInt("y", 0)));
        }
        return out;
    }

    static String toJson(List<Entry> villages) {
        try {
            JSONArray array = new JSONArray();
            for (Entry e : villages) {
                JSONObject o = new JSONObject();
                o.put("id", e.id);
                o.put("name", e.name);
                o.put("x", e.x);
                o.put("y", e.y);
                array.put(o);
            }
            return array.toString();
        } catch (Exception e) {
            return "[]";
        }
    }

    /** Reads the stored villages back; empty list for null or unreadable input. */
    static List<Entry> fromJson(String json) {
        List<Entry> result = new ArrayList<Entry>();
        if (json == null) {
            return result;
        }
        try {
            JSONArray array = new JSONArray(json);
            for (int i = 0; i < array.length(); i++) {
                JSONObject o = array.getJSONObject(i);
                result.add(new Entry(o.getString("id"), o.getString("name"), o.getInt("x"), o.getInt("y")));
            }
        } catch (Exception e) {
            return new ArrayList<Entry>();
        }
        return result;
    }
}
