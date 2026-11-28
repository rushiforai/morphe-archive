package com.waze.gw;

import android.app.Application;
import android.content.Context;
import android.os.SystemClock;
import android.util.Log;

import java.lang.reflect.Method;
import java.util.concurrent.atomic.AtomicLong;

/**
 * Controls whether Waze/Mod guidance is mixed with music or requests ducking focus.
 *
 * <p>Pre-recorded Mod prompts can simply avoid requesting focus. Waze TTS is asynchronous and
 * requests focus inside Waze's own sound pipeline, so a short-lived, single-use token is armed
 * immediately before invoking playTts(). The Waze audio-focus hook consumes that token once. This
 * keeps native navigation guidance on Waze's normal focus policy.</p>
 */
public final class AudioMixPolicy {
    private static final String TAG = "WazeGW-AudioMix";
    private static final String PREFS = "waze_hud_gw";
    private static final String KEY = "mix_mod_audio";
    private static final String MODE_KEY = "audio_mix_mode";
    private static final long TTS_ARM_WINDOW_MS = 3_000L;

    private static final AtomicLong ttsBypassDeadlineMs = new AtomicLong();
    private static volatile Context appContext;

    private AudioMixPolicy() { }

    static boolean isMixEnabled(Context context) {
        Context safe = context != null ? context.getApplicationContext() : applicationContext();
        if (safe == null) return false;
        try {
            android.content.SharedPreferences prefs =
                    safe.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
            if (prefs.contains(MODE_KEY)) {
                return prefs.getInt(MODE_KEY, 1) == 0;
            }
            // Compatibility with builds before the selection control existed.
            return prefs.getBoolean(KEY, false);
        } catch (Throwable ignored) {
            return false;
        }
    }

    static boolean armForModTts() {
        if (!isMixEnabled(null)) return false;
        long deadline = SystemClock.elapsedRealtime() + TTS_ARM_WINDOW_MS;
        ttsBypassDeadlineMs.set(deadline);
        Log.i(TAG, "Armed one-shot Waze TTS focus bypass");
        return true;
    }

    static void cancelModTtsArm() {
        ttsBypassDeadlineMs.set(0L);
    }

    /**
     * Called from Waze's audio-focus coordinator. Public because the caller lives in
     * {@code com.waze.sound}; the token is consumed atomically so unrelated guidance cannot reuse it.
     */
    public static boolean consumeWazeTtsFocusBypass() {
        long deadline = ttsBypassDeadlineMs.getAndSet(0L);
        boolean bypass = deadline >= SystemClock.elapsedRealtime();
        if (bypass) Log.i(TAG, "Bypassing audio focus for one Mod TTS prompt");
        return bypass;
    }

    /**
     * Read by Waze's ExoPlayer audio-focus coordinator. In "Trộn âm thanh" mode the
     * player already uses setAudioAttributes(..., false), so returning true here is
     * sufficient to skip Waze's separate AUDIOFOCUS_GAIN_TRANSIENT_MAY_DUCK request.
     */
    public static boolean shouldBypassWazeAudioFocus() {
        boolean bypass = isMixEnabled(null);
        if (bypass) Log.i(TAG, "Mix mode active; skipping Waze ExoPlayer ducking focus");
        return bypass;
    }

    private static Context applicationContext() {
        Context cached = appContext;
        if (cached != null) return cached;
        try {
            Class<?> activityThread = Class.forName("android.app.ActivityThread");
            Method currentApplication = activityThread.getMethod("currentApplication");
            Application application = (Application) currentApplication.invoke(null);
            if (application != null) {
                cached = application.getApplicationContext();
                appContext = cached;
            }
        } catch (Throwable ignored) { }
        return cached;
    }
}
