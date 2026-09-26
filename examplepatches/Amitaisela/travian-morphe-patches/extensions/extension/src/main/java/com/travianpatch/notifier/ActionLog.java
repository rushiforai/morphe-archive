package com.travianpatch.notifier;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

/**
 * What the app did (or would have done) in the game, newest first, capped. Stored as JSON text in
 * preferences, same idea as NotificationHistory. Pure logic (no Android APIs).
 */
final class ActionLog {

    static final String PREFS = "travian_action_log";
    static final String KEY = "entries";
    static final int CAP = 300;

    private ActionLog() {
    }

    static final class Entry {
        final long atMs;
        final String kind;
        final String label;
        /** SENT, DRY_RUN, REFUSED or FAILED. */
        final String outcome;
        final String detail;

        Entry(long atMs, String kind, String label, String outcome, String detail) {
            this.atMs = atMs;
            this.kind = kind;
            this.label = label;
            this.outcome = outcome;
            this.detail = detail;
        }
    }

    /** Returns the JSON text with e added at the front and the list trimmed to cap. */
    static String add(String json, Entry e, int cap) {
        JSONArray out = new JSONArray();
        try {
            out.put(new JSONObject().put("at", e.atMs).put("kind", e.kind).put("label", e.label)
                    .put("outcome", e.outcome).put("detail", e.detail == null ? "" : e.detail));
            JSONArray old = json == null ? new JSONArray() : new JSONArray(json);
            for (int i = 0; i < old.length() && out.length() < cap; i++) {
                out.put(old.get(i));
            }
        } catch (Exception ignored) {
            // A corrupt old log is dropped; the new entry is kept.
        }
        return out.toString();
    }

    /** True when the newest entry has the same label and outcome and is younger than windowMs (skip logging it). */
    static boolean isRepeat(String json, String label, String outcome, long nowMs, long windowMs) {
        List<Entry> entries = read(json);
        if (entries.isEmpty()) {
            return false;
        }
        Entry last = entries.get(0);
        return last.label.equals(label) && last.outcome.equals(outcome) && nowMs - last.atMs < windowMs;
    }

    /** Newest first; never throws (a corrupt log reads as empty). */
    static List<Entry> read(String json) {
        List<Entry> out = new ArrayList<Entry>();
        if (json == null) {
            return out;
        }
        try {
            JSONArray a = new JSONArray(json);
            for (int i = 0; i < a.length(); i++) {
                JSONObject o = a.optJSONObject(i);
                if (o != null) {
                    out.add(new Entry(o.optLong("at"), o.optString("kind"), o.optString("label"),
                            o.optString("outcome"), o.optString("detail")));
                }
            }
        } catch (Exception e) {
            return new ArrayList<Entry>();
        }
        return out;
    }
}
