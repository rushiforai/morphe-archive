package com.travianpatch.notifier;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

/**
 * Friendly troop arrivals: reinforcements coming to one of your villages and your own troops
 * returning home. Reported when they arrive, with where they came from and how many. Pure logic
 * (no Android APIs) so it can be checked against sample data off-device.
 *
 * Reads the aliased movement lists from AttackAlerts.MOVEMENTS_SELECTION:
 * troops.reinforcements and troops.returning, each edges[].node { troopEvent {...}, units {...} }.
 */
final class ArrivalAlerts {

    /** A movement that ended this long ago is stale and ignored. */
    private static final long STALE_MS = 60_000L;

    static final class Arrival {
        final String key;
        final long arrivalMs;
        /** Full notification text, written for the moment of arrival. */
        final String text;

        Arrival(String key, long arrivalMs, String text) {
            this.key = key;
            this.arrivalMs = arrivalMs;
            this.text = text;
        }
    }

    private ArrivalAlerts() {
    }

    static List<Arrival> parse(JSONObject village, long nowMs) {
        List<Arrival> out = new ArrayList<Arrival>();
        JSONObject troops = village.optJSONObject("troops");
        if (troops == null) {
            return out;
        }
        String villageId = String.valueOf(village.opt("id"));
        String target = village.optString("name", "your village")
                + " (" + village.optInt("x", 0) + "|" + village.optInt("y", 0) + ")";
        read(troops.optJSONObject("reinforcements"), "reinforcement", villageId, target, nowMs, out);
        read(troops.optJSONObject("returning"), "return", villageId, target, nowMs, out);
        return out;
    }

    private static void read(JSONObject list, String kind, String villageId, String target,
                             long nowMs, List<Arrival> out) {
        JSONArray edges = list != null ? list.optJSONArray("edges") : null;
        if (edges == null) {
            return;
        }
        for (int i = 0; i < edges.length(); i++) {
            JSONObject node = edges.optJSONObject(i) != null ? edges.optJSONObject(i).optJSONObject("node") : null;
            JSONObject ev = node != null ? node.optJSONObject("troopEvent") : null;
            if (ev == null) {
                continue;
            }
            long arrivalSec = ev.optLong("arrivalTime", 0);
            long arrivalMs = AttackAlerts.toMillis(arrivalSec);
            if (arrivalMs <= 0 || arrivalMs < nowMs - STALE_MS) {
                continue;
            }
            JSONObject from = ev.optJSONObject("cellFrom");
            JSONObject fromVillage = from != null ? from.optJSONObject("village") : null;
            JSONObject fromPlayer = fromVillage != null ? fromVillage.optJSONObject("player") : null;
            String originId = from != null ? String.valueOf(from.opt("id")) : "?";
            String key = kind + ":" + villageId + ":" + arrivalSec + ":" + originId;
            out.add(new Arrival(key, arrivalMs, describe(kind, target,
                    fromVillage != null ? fromVillage.optString("name", "") : "",
                    fromPlayer != null ? fromPlayer.optString("name", "") : "",
                    from != null ? from.optInt("x", 0) : 0,
                    from != null ? from.optInt("y", 0) : 0,
                    totalUnits(node.optJSONObject("units")))));
        }
    }

    static String describe(String kind, String target, String originVillage, String originPlayer,
                           int originX, int originY, long units) {
        String origin = (originVillage.length() > 0 ? originVillage + " " : "") + "(" + originX + "|" + originY + ")";
        String count = units > 0 ? " — " + units + (units == 1 ? " troop" : " troops") : "";
        if ("return".equals(kind)) {
            return "Your troops are back at " + target + ", returning from " + origin + count;
        }
        String from = originPlayer.length() > 0 ? originPlayer + ", " + origin : origin;
        return "Reinforcements from " + from + " arrived at " + target + count;
    }

    /** Sum of t1..t11; 0 if the counts are hidden or missing. */
    static long totalUnits(JSONObject units) {
        if (units == null) {
            return 0;
        }
        long total = 0;
        for (int i = 1; i <= 11; i++) {
            total += Math.max(0L, units.optLong("t" + i, 0));
        }
        return total;
    }
}
