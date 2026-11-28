package com.waze.gw;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

/**
 * "Take a break" reminder after long continuous driving. Fed from every speedometer update, so it
 * does nothing unless the switch is on. Shown as Mod's own map banner plus a spoken line; it never
 * touches Waze's native alert repository.
 */
final class DrivingBreakReminder {
    private static final String TAG = "WazeGW-Break";
    private static final String PREFS = "waze_hud_gw";
    static final String PREF_ENABLED = "break_reminder";
    static final String PREF_MINUTES = "break_reminder_minutes";
    private static final String PREF_SESSION_START = "break_session_start";
    private static final String PREF_LAST_MOVING = "break_last_moving";
    private static final String PREF_LAST_REMINDER = "break_last_reminder";
    static final int DEFAULT_MINUTES = 120;
    private static final long SAVE_INTERVAL_MS = 30_000L;
    private static final int BANNER_SECONDS = 15;

    private static final DrivingBreakPolicy.State STATE = new DrivingBreakPolicy.State();
    private static boolean loaded;
    private static long lastSavedAt;

    private DrivingBreakReminder() { }

    /** Called for every speed frame; {@code speed} is in {@code units} ("km/h" or "mph"). */
    static synchronized void onSpeed(Context context, int speed, String units) {
        Context app = context == null ? null : context.getApplicationContext();
        if (app == null) return;
        SharedPreferences prefs = app.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        if (!prefs.getBoolean(PREF_ENABLED, false)) return;
        if (!loaded) load(prefs);

        int kmh = units != null && units.toLowerCase(java.util.Locale.US).contains("mph")
                ? (int) Math.round(speed * 1.609344) : speed;
        long now = System.currentTimeMillis();
        long thresholdMs = thresholdMinutes(prefs) * 60_000L;
        long before = STATE.lastMoving;
        long driven = DrivingBreakPolicy.update(STATE, now, kmh, thresholdMs);
        if (driven >= 0L) {
            deliver(app, driven);
            save(prefs, now);
        } else if (STATE.lastMoving != before && now - lastSavedAt >= SAVE_INTERVAL_MS) {
            save(prefs, now);
        }
    }

    /** Settings changed (switch or duration): evaluate again from the next speed frame. */
    static synchronized void onSettingChanged(Context context) {
        Context app = context == null ? null : context.getApplicationContext();
        if (app == null) return;
        SharedPreferences prefs = app.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        if (!loaded) load(prefs);
        STATE.lastReminder = 0L;
        save(prefs, System.currentTimeMillis());
    }

    private static int thresholdMinutes(SharedPreferences prefs) {
        return Math.max(30, Math.min(480, prefs.getInt(PREF_MINUTES, DEFAULT_MINUTES)));
    }

    private static void deliver(Context app, long drivenMs) {
        String duration = DrivingBreakPolicy.describe(drivenMs);
        Log.i(TAG, "break reminder after " + duration);
        String title = I18n.tr("core.time_for_a_break");
        String detail = I18n.f("core.youve_been_driving_for_0_take",
                DrivingBreakPolicy.describeLocalized(drivenMs, false));
        CustomAlertBanner.show(title, detail, BANNER_SECONDS, "icon_alerter_break_coffee");
        if (WazeSoundMode.allowsClip("break_reminder")) {
            String spokenDuration = DrivingBreakPolicy.describeLocalized(drivenMs, true);
            if (spokenDuration != null) {
                WazeTtsBridge.speak("tts.youve_been_driving_for_0_without", spokenDuration);
            }
        }
    }

    private static void load(SharedPreferences prefs) {
        STATE.sessionStart = prefs.getLong(PREF_SESSION_START, 0L);
        STATE.lastMoving = prefs.getLong(PREF_LAST_MOVING, 0L);
        STATE.lastReminder = prefs.getLong(PREF_LAST_REMINDER, 0L);
        loaded = true;
    }

    private static void save(SharedPreferences prefs, long now) {
        lastSavedAt = now;
        prefs.edit().putLong(PREF_SESSION_START, STATE.sessionStart)
                .putLong(PREF_LAST_MOVING, STATE.lastMoving)
                .putLong(PREF_LAST_REMINDER, STATE.lastReminder).apply();
    }
}
