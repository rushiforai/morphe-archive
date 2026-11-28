package com.waze.gw;

import android.media.audiofx.LoudnessEnhancer;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import java.lang.reflect.Method;

/**
 * Tweaks of Waze's navigation voice. Waze plays every prompt (recorded voices and synthesized TTS) through one
 * ExoPlayer whose volume tops out at 1.0, so a quiet voice cannot be raised in Waze itself:
 * <ul>
 *   <li>{@code voice_boost_db}: a LoudnessEnhancer on that player's audio session adds gain on top;</li>
 *   <li>{@code voice_stream}: 1 plays the voice as music/media (follows the media volume) instead of as navigation
 *       guidance, 0 keeps what Waze set.</li>
 * </ul>
 * Public because the smali hook in Waze's sound package calls it.
 */
public final class VoiceBoost {
    private static final String TAG = "WazeGW-VoiceBoost";
    private static final String PREF_GAIN = "voice_boost_db";
    private static final String PREF_STREAM = "voice_stream";
    private static final String EXO = "androidx.media3.exoplayer.ExoPlayer";
    private static final String ATTRS = "androidx.media3.common.AudioAttributes";

    private static Object player;
    private static int session;
    private static Object originalAttributes;   // what Waze built the player with
    private static boolean attributesChanged;
    private static LoudnessEnhancer enhancer;
    private static int enhancerSession;

    private VoiceBoost() { }

    /** Called once when Waze builds its prompt player, on the thread that built it. */
    public static synchronized void attach(Object exoPlayer) {
        player = exoPlayer;
        try {
            Class<?> exo = Class.forName(EXO);
            Object id = exo.getMethod("getAudioSessionId").invoke(exoPlayer);
            session = id instanceof Integer ? ((Integer) id).intValue() : 0;
            originalAttributes = exo.getMethod("getAudioAttributes").invoke(exoPlayer);
        } catch (Throwable t) {
            Log.w(TAG, "cannot read the prompt player", t);
        }
        refresh();
    }

    /** Applies the current settings; safe to call at any time (settings change, player rebuilt). */
    public static synchronized void refresh() {
        applyGain();
        applyStream();
    }

    private static void applyGain() {
        try {
            int gainDb = Gateway.modEnabled() ? Math.max(0, Math.min(12, Gateway.prefInt(PREF_GAIN, 0))) : 0;
            if (gainDb == 0 && enhancer == null) return;
            if (session <= 0) return;
            if (enhancer != null && enhancerSession != session) release();
            if (enhancer == null) {
                if (gainDb == 0) return;
                enhancer = new LoudnessEnhancer(session);
                enhancerSession = session;
            }
            enhancer.setTargetGain(gainDb * 100);
            enhancer.setEnabled(gainDb > 0);
            Log.i(TAG, "voice boost " + gainDb + " dB (session " + session + ")");
        } catch (Throwable t) {
            Log.w(TAG, "voice boost failed", t);
            release();
        }
    }

    private static void applyStream() {
        try {
            final boolean music = Gateway.modEnabled() && Gateway.prefInt(PREF_STREAM, 0) == 1;
            if (player == null || (!music && !attributesChanged)) return;
            final Object attributes = music ? musicAttributes() : originalAttributes;
            if (attributes == null) return;
            final Object target = player;
            onPlayerThread(target, new Runnable() {
                @Override public void run() {
                    try {
                        Class<?> attrs = Class.forName(ATTRS);
                        Method set = Class.forName(EXO).getMethod("setAudioAttributes", attrs, boolean.class);
                        set.invoke(target, attributes, Boolean.FALSE);   // Waze handles audio focus itself
                        attributesChanged = music;
                        Log.i(TAG, "voice plays as " + (music ? "music" : "navigation guidance"));
                    } catch (Throwable t) {
                        Log.w(TAG, "voice stream change failed", t);
                    }
                }
            });
        } catch (Throwable t) {
            Log.w(TAG, "voice stream change failed", t);
        }
    }

    /** USAGE_MEDIA + AUDIO_CONTENT_TYPE_MUSIC, in media3's own AudioAttributes. */
    private static Object musicAttributes() throws Exception {
        Class<?> builderType = Class.forName(ATTRS + "$Builder");
        Object builder = builderType.getConstructor().newInstance();
        builderType.getMethod("setUsage", int.class).invoke(builder, 1);
        builderType.getMethod("setContentType", int.class).invoke(builder, 2);
        return builderType.getMethod("build").invoke(builder);
    }

    /** ExoPlayer must be called on its application thread. */
    private static void onPlayerThread(Object exoPlayer, Runnable task) throws Exception {
        Object looper = Class.forName(EXO).getMethod("getApplicationLooper").invoke(exoPlayer);
        if (!(looper instanceof Looper) || looper == Looper.myLooper()) task.run();
        else new Handler((Looper) looper).post(task);
    }

    private static void release() {
        try { if (enhancer != null) enhancer.release(); } catch (Throwable ignored) { }
        enhancer = null;
    }
}
