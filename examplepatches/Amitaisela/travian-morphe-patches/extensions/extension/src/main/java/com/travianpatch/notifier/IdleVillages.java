package com.travianpatch.notifier;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;

/**
 * Which villages have nothing building and nothing training, from the same village list and tracked
 * queue state the Queues screen reads. Pure logic (no Android APIs) so it can be checked against sample
 * data off-device.
 */
final class IdleVillages {

    private IdleVillages() {
    }

    /** Villages from the poll's village list with no key in busyVillageKeys, "name (x|y)", alphabetical. */
    static List<String> compute(JSONArray villages, Set<String> busyVillageKeys) {
        List<String> idle = new ArrayList<String>();
        if (villages == null) {
            return idle;
        }
        for (int i = 0; i < villages.length(); i++) {
            JSONObject v = villages.optJSONObject(i);
            if (v == null) {
                continue;
            }
            String name = v.optString("name", "your village");
            int x = v.optInt("x", 0);
            int y = v.optInt("y", 0);
            if (!busyVillageKeys.contains(key(name, x, y))) {
                idle.add(name + " (" + x + "|" + y + ")");
            }
        }
        Collections.sort(idle);
        return idle;
    }

    /** Identifies a village the same way across a poll: by name and coordinates (no numeric id is tracked). */
    static String key(String name, int x, int y) {
        return name + "|" + x + "|" + y;
    }

    /** What the Alerts screen shows. */
    static String summary(List<String> idle) {
        if (idle.isEmpty()) {
            return "All villages have something building or training.";
        }
        StringBuilder sb = new StringBuilder("Nothing building or training in: ");
        for (int i = 0; i < idle.size(); i++) {
            if (i > 0) {
                sb.append(", ");
            }
            sb.append(idle.get(i));
        }
        return sb.toString();
    }

    /** Serializes the idle-village labels for SharedPreferences storage. */
    static String toJson(List<String> idle) {
        JSONArray array = new JSONArray();
        for (String label : idle) {
            array.put(label);
        }
        return array.toString();
    }

    /** Reads the stored labels back; empty list for null or unreadable input. */
    static List<String> fromJson(String json) {
        List<String> result = new ArrayList<String>();
        if (json == null) {
            return result;
        }
        try {
            JSONArray array = new JSONArray(json);
            for (int i = 0; i < array.length(); i++) {
                result.add(array.getString(i));
            }
        } catch (Exception e) {
            return new ArrayList<String>();
        }
        return result;
    }
}
