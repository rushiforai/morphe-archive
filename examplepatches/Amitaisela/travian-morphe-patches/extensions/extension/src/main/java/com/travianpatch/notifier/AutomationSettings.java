package com.travianpatch.notifier;

import org.json.JSONObject;

/**
 * The user-adjustable automation knobs: how much resource safety buffer to require, how long to wait
 * after a build slot is ready before firing, the daily quiet window, and the game world's server speed
 * (which scales every build time). Pure logic (no Android APIs) so the JSON encoding can be checked
 * off-device; the settings screen does the actual SharedPreferences reads and writes using these
 * constants and (de)serializers.
 */
final class AutomationSettings {

    /** SharedPreferences file name these settings are stored in. */
    static final String PREFS = "travian_automation_settings";
    /** The SharedPreferences key the whole settings blob is stored under. */
    static final String KEY = "settings_json";

    static final class Config {
        final int bufferPercent;
        final long minDelayMs;
        final long maxDelayMs;
        final QuietHours.Config quietHours;
        final double serverSpeed;

        Config(int bufferPercent, long minDelayMs, long maxDelayMs, QuietHours.Config quietHours, double serverSpeed) {
            this.bufferPercent = bufferPercent;
            this.minDelayMs = minDelayMs;
            this.maxDelayMs = maxDelayMs;
            this.quietHours = quietHours;
            this.serverSpeed = serverSpeed;
        }
    }

    /** 10% buffer, a 5-60 minute random delay, the user's stated 23:00-01:00 / 7-8h quiet example, 1x speed. */
    static final Config DEFAULT = new Config(10, 5 * 60_000L, 60 * 60_000L, QuietHours.DEFAULT, 1.0);

    private AutomationSettings() {
    }

    static String toJson(Config c) {
        try {
            JSONObject o = new JSONObject();
            o.put("bufferPercent", c.bufferPercent);
            o.put("minDelayMs", c.minDelayMs);
            o.put("maxDelayMs", c.maxDelayMs);
            o.put("quietStartRangeStartMin", c.quietHours.startRangeStartMin);
            o.put("quietStartRangeEndMin", c.quietHours.startRangeEndMin);
            o.put("quietMinDurationMin", c.quietHours.minDurationMin);
            o.put("quietMaxDurationMin", c.quietHours.maxDurationMin);
            o.put("serverSpeed", c.serverSpeed);
            return o.toString();
        } catch (Exception e) {
            return "{}";
        }
    }

    /** Falls back to DEFAULT for null or unreadable input. */
    static Config fromJson(String json) {
        if (json == null) {
            return DEFAULT;
        }
        try {
            JSONObject o = new JSONObject(json);
            QuietHours.Config quiet = new QuietHours.Config(
                    o.getInt("quietStartRangeStartMin"), o.getInt("quietStartRangeEndMin"),
                    o.getInt("quietMinDurationMin"), o.getInt("quietMaxDurationMin"));
            return new Config(o.getInt("bufferPercent"), o.getLong("minDelayMs"), o.getLong("maxDelayMs"),
                    quiet, o.getDouble("serverSpeed"));
        } catch (Exception e) {
            return DEFAULT;
        }
    }
}
