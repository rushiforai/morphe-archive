package com.waze.gw;

import android.media.AudioManager;
import android.media.ToneGenerator;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;

/**
 * Edge effect and sound for "too close to the vehicle ahead". Runs on the main looper while the
 * xADAS link is switched on, independent of which surface (map, bubble, HUD) is on screen. The
 * widget's own pulse is drawn by the widget and is not controlled here.
 */
final class XadasAlerts {
    private static final String TAG = "WazeModXadas";
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final long TICK_MS = 250L;
    private static final long REPEAT_MS = 12000L;

    private static boolean running;
    private static long lastSoundAt;
    private static ToneGenerator tone;

    private static final Runnable TICK = new Runnable() {
        @Override public void run() {
            boolean again;
            synchronized (XadasAlerts.class) { again = running; }
            if (!again) return;
            try {
                step();
            } catch (Throwable error) {
                Log.w(TAG, "alert step failed: " + error.getClass().getSimpleName());
            }
            MAIN.postDelayed(this, TICK_MS);
        }
    };

    private XadasAlerts() { }

    static synchronized void ensureRunning() {
        if (running) return;
        running = true;
        MAIN.post(TICK);
    }

    static synchronized void stop() {
        if (!running) return;
        running = false;
        MAIN.removeCallbacks(TICK);
        Gateway.setXadasEdge(false, 0);
        releaseTone();
    }

    private static void step() {
        XadasGapPolicy.State state = Gateway.xadasGapState();
        boolean alert = state.visible && state.alert;
        int effect = Gateway.xadasPrefInt("xadas_effect", XadasGapPolicy.EFFECT_LIGHT);
        int mode = effect == XadasGapPolicy.EFFECT_STRONG ? Vignette.MODE_STRONG
                : effect == XadasGapPolicy.EFFECT_LIGHT ? Vignette.MODE_WEAK : Vignette.MODE_NONE;
        Gateway.setXadasEdge(alert, mode);

        long now = SystemClock.elapsedRealtime();
        // One cooldown for everything: a new alert right after the last one stays quiet, and a long
        // one repeats at most every REPEAT_MS, so a borderline gap can never make it chatter.
        if (alert && (lastSoundAt == 0L || now - lastSoundAt >= REPEAT_MS)) {
            lastSoundAt = now;
            playSound(Gateway.xadasPrefInt("xadas_sound", XadasGapPolicy.SOUND_OFF));
        }
    }

    private static void playSound(int mode) {
        if (mode == XadasGapPolicy.SOUND_OFF) return;
        // Waze's own sound mode still wins: silent / beeps-only modes keep this quiet too.
        if (!WazeSoundMode.allowsClip("xadas_gap")) return;
        if (mode == XadasGapPolicy.SOUND_VOICE) {
            WazeTtsBridge.speak("tts.watch_your_distance_to_the_vehicle");
            return;
        }
        try {
            if (tone == null) tone = new ToneGenerator(AudioManager.STREAM_NOTIFICATION, 90);
            tone.startTone(ToneGenerator.TONE_PROP_BEEP2, 350);
        } catch (Throwable error) {
            releaseTone();
        }
    }

    private static void releaseTone() {
        ToneGenerator old = tone;
        tone = null;
        if (old != null) {
            try { old.release(); } catch (Throwable ignored) { }
        }
    }
}
