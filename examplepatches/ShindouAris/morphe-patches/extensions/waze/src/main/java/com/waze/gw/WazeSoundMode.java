package com.waze.gw;

import android.content.Context;
import android.util.Log;

import java.util.Locale;

/**
 * Waze's voice guidance mode, checked before Mod clips enter the shared sound queue.
 *
 * Waze stores the mode in the string config {@code NAVIGATION_GUIDANCE_MODE}; the values come from
 * its {@code com.waze.sound.bs} enum: {@code yes} (voice), {@code brief}, {@code smart} (smart
 * mute), {@code beep}, {@code alerts} (alerts only) and {@code no} (off).
 *
 * TTS the mod speaks goes through {@code SoundNativeManager.playTts}, so Waze already applies its
 * own mute rules to it. Mod clips (current limit, speed change ahead, over-speed) are also
 * gated here so alerts-only can suppress routine limit announcements independently of warnings.
 */
final class WazeSoundMode {
    static final int VOICE = 0;
    static final int ALERTS_ONLY = 1;
    static final int SILENT = 2;
    static final String PREF_RESPECT = "respect_waze_sound";

    private static final String TAG = "WazeGW-SoundMode";
    private static final String PREFS = "waze_hud_gw";
    private static final String KEY = "CONFIG_VALUE_NAVIGATION_GUIDANCE_MODE";
    private static String lastRaw;

    private WazeSoundMode() { }

    /**
     * May a mod clip for {@code slot} ("overspeed", "next_60", "current_60"…) sound now?
     *
     * Off and beeps-only silence every clip. Alerts-only keeps the warnings (over-speed, speed change
     * ahead) but drops the routine "current limit" announcement. Any doubt (mode unreadable, unknown
     * value, feature switched off in Settings) allows the clip, so a wrong guess never mutes it.
     */
    static boolean allowsClip(String slot) {
        try {
            if (!respectSetting()) return true;
            int mode = current();
            if (mode == SILENT) return false;
            if (mode == ALERTS_ONLY) return slot == null || !slot.startsWith("current_");
            return true;
        } catch (Throwable error) {
            return true;
        }
    }

    /** Current mode; logs the raw value whenever it changes. */
    static int current() {
        String raw = Gateway.cfgString(KEY);
        raw = raw == null ? "" : raw.trim().toLowerCase(Locale.ROOT);
        int mode;
        if ("no".equals(raw) || "beep".equals(raw)) mode = SILENT;
        else if ("alerts".equals(raw)) mode = ALERTS_ONLY;
        else mode = VOICE;               // yes, brief, smart, or unreadable
        if (!raw.equals(lastRaw)) {
            lastRaw = raw;
            Log.i(TAG, "Waze voice mode raw=[" + raw + "] -> "
                    + (mode == SILENT ? "silent" : mode == ALERTS_ONLY ? "alerts only" : "voice"));
        }
        return mode;
    }

    private static boolean respectSetting() {
        try {
            Context app = (Context) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication").invoke((Object) null);
            return app == null || app.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                    .getBoolean(PREF_RESPECT, true);
        } catch (Throwable error) {
            return true;
        }
    }
}
