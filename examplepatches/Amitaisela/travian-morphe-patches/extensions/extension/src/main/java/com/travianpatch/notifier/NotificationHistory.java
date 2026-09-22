package com.travianpatch.notifier;

import org.json.JSONArray;
import org.json.JSONObject;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

/**
 * The last notifications the notifier produced (shown or muted), kept as a small JSON string so
 * the Travian Tools screens can list and count them. Pure logic (no Android APIs) so it can be checked against
 * sample data off-device.
 */
final class NotificationHistory {

    static final int MAX_ENTRIES = 200;
    private static final long DAY_MS = 24L * 60 * 60 * 1000;

    static final class Entry {
        final long timeMs;
        final String kindId;
        final String title;
        final String text;
        /** True if the user's switch for this type was off, so nothing was shown. */
        final boolean muted;

        Entry(long timeMs, String kindId, String title, String text, boolean muted) {
            this.timeMs = timeMs;
            this.kindId = kindId;
            this.title = title;
            this.text = text;
            this.muted = muted;
        }
    }

    private NotificationHistory() {
    }

    /** Returns the stored JSON with this entry added first, oldest entries dropped past the cap. */
    static String add(String json, Entry entry) {
        List<Entry> all = read(json);
        all.add(0, entry);
        while (all.size() > MAX_ENTRIES) {
            all.remove(all.size() - 1);
        }
        return toJson(all);
    }

    /** Newest first; empty for null or unreadable input. */
    static List<Entry> read(String json) {
        List<Entry> out = new ArrayList<Entry>();
        if (json == null) {
            return out;
        }
        try {
            JSONArray array = new JSONArray(json);
            for (int i = 0; i < array.length(); i++) {
                JSONObject o = array.optJSONObject(i);
                if (o == null) {
                    continue;
                }
                out.add(new Entry(o.optLong("t", 0), o.optString("k", ""), o.optString("title", ""),
                        o.optString("text", ""), o.optBoolean("muted", false)));
            }
        } catch (Exception e) {
            out.clear(); // unreadable: start over rather than show half of it
        }
        return out;
    }

    /** How many notifications of this kind happened in the 24 hours before nowMs, muted ones included. */
    static int countLast24h(String json, String kindId, long nowMs) {
        int count = 0;
        for (Entry e : read(json)) {
            if (e.kindId.equals(kindId) && e.timeMs > nowMs - DAY_MS) {
                count++;
            }
        }
        return count;
    }

    static String countLabel(int count) {
        return count == 0 ? "none in the last 24 h" : count + " in the last 24 h";
    }

    static String time(long timeMs) {
        return new SimpleDateFormat("HH:mm:ss", Locale.US).format(new Date(timeMs));
    }

    static String line(Entry e) {
        String time = time(e.timeMs);
        return time + "  " + e.title + (e.muted ? "  (muted)" : "") + "\n" + e.text;
    }

    private static String toJson(List<Entry> all) {
        JSONArray array = new JSONArray();
        try {
            for (Entry e : all) {
                JSONObject o = new JSONObject();
                o.put("t", e.timeMs);
                o.put("k", e.kindId);
                o.put("title", e.title);
                o.put("text", e.text);
                o.put("muted", e.muted);
                array.put(o);
            }
        } catch (Exception ex) {
            // nothing to do: an entry that can't be written is simply left out
        }
        return array.toString();
    }
}
