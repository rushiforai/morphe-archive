package dev.materialtidal.extension.tidal.player.waveform;

import android.os.SystemClock;

import java.lang.reflect.Field;
import java.nio.ByteBuffer;

import dev.materialtidal.extension.tidal.theme.MaterialYouConfig;

/**
 * Runtime bridge hooked into ExoPlayer's DefaultAudioSink and TIDAL's obfuscated
 * playback / auth classes by {@code WaveformSeekbarPatch}.
 */
public final class SongWaveformBridge {

    private static volatile float liveAudioLevel = 0f;
    private static volatile long lastLiveSampleMs = 0L;

    private static volatile boolean reflectionTried;
    private static volatile Field sinkConfigField;
    private static volatile Field configEncodingField;

    private SongWaveformBridge() {}

    /**
     * Invoked at entry of DefaultAudioSink.handleBuffer(ByteBuffer, long, int)Z.
     * Throttled to ~40 Hz and non-destructive to buffer position/limit/order.
     */
    public static void onAudioSinkBuffer(Object audioSink, ByteBuffer buffer) {
        if (buffer == null || buffer.remaining() <= 0) {
            return;
        }
        if (!MaterialYouConfig.isPlayerWaveformSeekbarEnabled()
                || !MaterialYouConfig.isPlayerWaveformLiveReactiveEnabled()) {
            return;
        }
        long now = SystemClock.uptimeMillis();
        if (now - lastLiveSampleMs < 24L) {
            return;
        }
        lastLiveSampleMs = now;
        try {
            int encoding = resolvePcmEncoding(audioSink);
            float sample = SongWaveformAnalyzer.analyzeLiveBuffer(buffer, encoding);
            liveAudioLevel = sample;
        } catch (Throwable ignored) {}
    }

    /**
     * Returns latest live PCM amplitude [0..1], decaying to 0f when no local audio
     * frames were processed within the last 280 ms (paused, Cast, or Linn playback).
     */
    public static float getLiveAudioLevel() {
        if (!MaterialYouConfig.isPlayerWaveformSeekbarEnabled()
                || !MaterialYouConfig.isPlayerWaveformLiveReactiveEnabled()) {
            return 0f;
        }
        long age = SystemClock.uptimeMillis() - lastLiveSampleMs;
        if (age < 0L || age > 280L) {
            return 0f;
        }
        return liveAudioLevel;
    }

    private static int resolvePcmEncoding(Object audioSink) {
        if (audioSink == null) {
            return SongWaveformAnalyzer.ENCODING_PCM_16BIT;
        }
        try {
            if (!reflectionTried) {
                reflectionTried = true;
                Field cfgF = audioSink.getClass().getDeclaredField("configuration");
                cfgF.setAccessible(true);
                sinkConfigField = cfgF;
            }
            Field cfgField = sinkConfigField;
            if (cfgField != null) {
                Object cfg = cfgField.get(audioSink);
                if (cfg != null) {
                    Field encField = configEncodingField;
                    if (encField == null) {
                        encField = cfg.getClass().getDeclaredField("outputEncoding");
                        encField.setAccessible(true);
                        configEncodingField = encField;
                    }
                    return encField.getInt(cfg);
                }
            }
        } catch (Throwable ignored) {}
        return SongWaveformAnalyzer.ENCODING_PCM_16BIT;
    }

    public static String fetchActiveTrackId() {
        try {
            return nativeGetActiveTrackId();
        } catch (Throwable t) {
            return null;
        }
    }

    public static String[] fetchAuthSnapshot() {
        try {
            String access = nativeGetAccessToken();
            if (access == null || access.isEmpty()) {
                return null;
            }
            String client = nativeGetClientToken();
            String cc = nativeGetCountryCode();
            return new String[]{access, client, (cc != null && !cc.isEmpty()) ? cc : "US"};
        } catch (Throwable t) {
            return null;
        }
    }

    /** Replaced by WaveformSeekbarPatch with active queue item media ID lookup. */
    public static String nativeGetActiveTrackId() {
        return null;
    }

    /** Replaced by WaveformSeekbarPatch with TIDAL OAuth access token lookup. */
    public static String nativeGetAccessToken() {
        return null;
    }

    /** Replaced by WaveformSeekbarPatch with TIDAL OAuth client token lookup. */
    public static String nativeGetClientToken() {
        return null;
    }

    /** Replaced by WaveformSeekbarPatch with TIDAL Session country code lookup. */
    public static String nativeGetCountryCode() {
        return "US";
    }
}
