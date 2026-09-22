package com.travianpatch.notifier;

import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

/**
 * What the last background check saw, written by the worker and shown on the Travian Tools screen.
 * Pure logic (no Android APIs) so it can be checked against sample data
 * off-device.
 */
final class AlertStatus {

    final long lastCheckMs; // 0 = never
    final String note; // short plain-language result of the last check
    final int builds; // -1 = not checked
    final int trainings;
    final int attacks;
    final int arrivals;

    AlertStatus(long lastCheckMs, String note, int builds, int trainings, int attacks, int arrivals) {
        this.lastCheckMs = lastCheckMs;
        this.note = note == null ? "" : note;
        this.builds = builds;
        this.trainings = trainings;
        this.attacks = attacks;
        this.arrivals = arrivals;
    }

    static AlertStatus empty() {
        return new AlertStatus(0, "", -1, -1, -1, -1);
    }

    String toJson() {
        try {
            JSONObject o = new JSONObject();
            o.put("last", lastCheckMs);
            o.put("note", note);
            o.put("b", builds);
            o.put("t", trainings);
            o.put("a", attacks);
            o.put("m", arrivals);
            return o.toString();
        } catch (Exception e) {
            return "{}";
        }
    }

    static AlertStatus fromJson(String json) {
        if (json == null) {
            return empty();
        }
        try {
            JSONObject o = new JSONObject(json);
            return new AlertStatus(o.optLong("last", 0), o.optString("note", ""),
                    o.optInt("b", -1), o.optInt("t", -1), o.optInt("a", -1), o.optInt("m", -1));
        } catch (Exception e) {
            return empty();
        }
    }

    String lastCheckLine(long nowMs) {
        if (lastCheckMs <= 0) {
            return "Last check: none yet";
        }
        return "Last check: " + duration(nowMs - lastCheckMs) + " ago" + (note.length() > 0 ? " — " + note : "");
    }

    String watchingLine() {
        if (builds < 0 && trainings < 0) {
            return "Watching: nothing checked yet";
        }
        List<String> parts = new ArrayList<String>();
        parts.add(count(builds, "building"));
        parts.add(count(trainings, "training"));
        if (attacks >= 0) {
            parts.add(count(attacks, "incoming attack"));
            parts.add(count(arrivals, "troop movement"));
        }
        StringBuilder sb = new StringBuilder("Watching: ");
        for (int i = 0; i < parts.size(); i++) {
            if (i > 0) {
                sb.append(", ");
            }
            sb.append(parts.get(i));
        }
        return sb.toString();
    }

    private static String count(int n, String noun) {
        return Math.max(n, 0) + " " + noun + (n == 1 ? "" : "s");
    }

    /** "45 s", "3 min 12 s", "1 h 5 min"; never negative. */
    static String duration(long ms) {
        long s = Math.max(ms, 0L) / 1000L;
        if (s < 60) {
            return s + " s";
        }
        long m = s / 60;
        if (m < 60) {
            return m + " min " + (s % 60) + " s";
        }
        return (m / 60) + " h " + (m % 60) + " min";
    }
}
