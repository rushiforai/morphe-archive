package app.tikkamasalla.stremio.progress;

import android.content.Context;
import android.content.SharedPreferences;

/** The outstanding external-player handoff, kept in Stremio's prefs until its progress is applied. */
final class HandoffRecord {
    private static final String PREFS = "introskip_prefs";
    private static final long MAX_AGE_MS = 7L * 24L * 3600L * 1000L;
    private static final String[] ARG_KEYS = {"handoff_arg_stream", "handoff_arg_stream_addon",
            "handoff_arg_meta_addon", "handoff_arg_type", "handoff_arg_id", "handoff_arg_video"};

    final String launchId;
    final String videoId;
    final long startMs;
    final long launchedAt;
    long appliedAt;
    /** The six PlayerFragment args needed to load the Player model again after a cold start, or null. */
    String[] loadArgs;
    /** How often a cold-start load was tried for this record (capped by ColdRecovery.MAX_TRIES). */
    int coldTries;

    HandoffRecord(String launchId, String videoId, long startMs, long launchedAt, long appliedAt) {
        this.launchId = launchId;
        this.videoId = videoId == null ? "" : videoId;
        this.startMs = startMs;
        this.launchedAt = launchedAt;
        this.appliedAt = appliedAt;
    }

    /** The record, or null when absent or older than 7 days. Never throws. */
    static HandoffRecord load(Context context) {
        if (context == null) return null;
        try {
            SharedPreferences prefs = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
            String launchId = prefs.getString("handoff_launch_id", null);
            if (launchId == null || launchId.length() == 0) return null;
            long launchedAt = prefs.getLong("handoff_launched_at", 0L);
            if (System.currentTimeMillis() - launchedAt > MAX_AGE_MS) return null;
            HandoffRecord record = new HandoffRecord(launchId, prefs.getString("handoff_video_id", ""),
                    prefs.getLong("handoff_start_ms", 0L), launchedAt,
                    prefs.getLong("handoff_applied_at", 0L));
            record.coldTries = prefs.getInt("handoff_cold_tries", 0);
            if (prefs.getString(ARG_KEYS[0], null) != null) {
                String[] args = new String[ARG_KEYS.length];
                for (int i = 0; i < args.length; i++) args[i] = prefs.getString(ARG_KEYS[i], null);
                record.loadArgs = args;
            }
            return record;
        } catch (Throwable ignored) {
            return null;
        }
    }

    static void save(Context context, HandoffRecord record) {
        if (context == null || record == null) return;
        try {
            SharedPreferences.Editor edit = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE).edit()
                    .putString("handoff_launch_id", record.launchId)
                    .putString("handoff_video_id", record.videoId)
                    .putLong("handoff_start_ms", record.startMs)
                    .putLong("handoff_launched_at", record.launchedAt)
                    .putLong("handoff_applied_at", record.appliedAt)
                    .putInt("handoff_cold_tries", record.coldTries);
            for (int i = 0; i < ARG_KEYS.length; i++) {
                edit.putString(ARG_KEYS[i], record.loadArgs == null ? null : record.loadArgs[i]);
            }
            edit.apply();
        } catch (Throwable ignored) {
        }
    }

    static void saveApplied(Context context, long appliedAt) {
        if (context == null) return;
        try {
            context.getSharedPreferences(PREFS, Context.MODE_PRIVATE).edit()
                    .putLong("handoff_applied_at", appliedAt).apply();
        } catch (Throwable ignored) {
        }
    }

    static void saveColdTries(Context context, int tries) {
        if (context == null) return;
        try {
            context.getSharedPreferences(PREFS, Context.MODE_PRIVATE).edit()
                    .putInt("handoff_cold_tries", tries).apply();
        } catch (Throwable ignored) {
        }
    }

    static void clear(Context context) {
        if (context == null) return;
        try {
            context.getSharedPreferences(PREFS, Context.MODE_PRIVATE).edit()
                    .remove("handoff_launch_id").remove("handoff_video_id")
                    .remove("handoff_start_ms").remove("handoff_launched_at")
                    .remove("handoff_applied_at").remove("handoff_cold_tries")
                    .remove(ARG_KEYS[0]).remove(ARG_KEYS[1]).remove(ARG_KEYS[2])
                    .remove(ARG_KEYS[3]).remove(ARG_KEYS[4]).remove(ARG_KEYS[5]).apply();
        } catch (Throwable ignored) {
        }
    }
}
