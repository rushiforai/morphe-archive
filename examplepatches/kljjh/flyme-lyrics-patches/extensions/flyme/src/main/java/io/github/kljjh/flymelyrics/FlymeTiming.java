/* SPDX-License-Identifier: GPL-3.0-only */
package io.github.kljjh.flymelyrics;

import android.content.Context;

public final class FlymeTiming {
    static final String KEY = "flyme_status_lyrics_offset_ms";
    static final String FOLLOW_KEY = "flyme_status_lyrics_follow_mediasession";
    static final int DEFAULT = -800, LIMIT = 2000, STEP = 100;
    static final int FOLLOW = Integer.MIN_VALUE;
    private static final ThreadLocal<Integer> reading = new ThreadLocal<>();

    private static android.content.SharedPreferences prefs(Context c) {
        return c.getSharedPreferences(FlymeController.FILE, Context.MODE_PRIVATE);
    }
    static boolean follows(Context c) {
        android.content.SharedPreferences prefs = prefs(c);
        // No previous choice, or the old dialog's explicit follow sentinel: follow MediaSession.
        // Preserve a manual offset explicitly saved with a previous build, even -800 or zero.
        return prefs.getBoolean(FOLLOW_KEY, prefs.getInt(KEY, FOLLOW) == FOLLOW);
    }
    static int manual(Context c) {
        int value = prefs(c).getInt(KEY, DEFAULT);
        return value == FOLLOW ? DEFAULT : value;
    }
    static void configure(Context c, boolean follow, int value) {
        if (Math.abs((long)value) > LIMIT || value % STEP != 0) throw new IllegalArgumentException("Invalid lyric offset");
        prefs(c).edit().putBoolean(FOLLOW_KEY, follow).putInt(KEY, value).apply();
        FlymeController.refresh();
    }
    static String line(Context c, String[] track, String title) {
        reading.set(follows(c) ? FOLLOW : manual(c));
        try { return FlymeSource.currentLine(track, title); }
        finally { reading.remove(); }
    }
    // Called only for the duration of the synchronous official line lookup.
    public static boolean isStatusRead() { return reading.get() != null; }
    public static int offset(int official) {
        Integer local = reading.get();
        return local == null || local == FOLLOW ? official : local;
    }
    private FlymeTiming() {}
}
