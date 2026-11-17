/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.media.AudioFormat;
import android.media.AudioRecord;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.PatchFamily;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Voice changer (#79): voice messages you record come out as a baby, a woman, a man, a horror
 * movie voice or a robot, picked on the Playback page. Telegram has two voice recorders, its own
 * and a newer one its server can turn on, and both read the microphone in chunks. The patch has
 * each read go through {@link #read}, which changes the chunk in place before Telegram draws its
 * waveform from it or encodes it, so the message, its waveform and its length all match what
 * was sent. Each recording takes the effect picked when it started. Off by default.
 *
 * <p>The effects are plain sound processing on the phone: a pitch shifter (two read heads moving
 * through a short delay line at the new speed, crossfaded so their jumps never click), an echo
 * and a ring modulator. Nothing is sent anywhere.
 */
public final class VoiceChanger {
    private VoiceChanger() {}

    static final String OFF = "", BABY = "baby", WOMAN = "woman", MAN = "man", HORROR = "horror", ROBOT = "robot";
    /** The choices in the order the list shows them. */
    public static final List<String> PRESETS = Collections.unmodifiableList(Arrays.asList(OFF, BABY, WOMAN, MAN, HORROR, ROBOT));

    /** The effect each recording started with, or null for one recorded as it is. */
    private static final Map<Object, Effect> EFFECTS = new WeakHashMap<>();

    /**
     * Stands in for {@code AudioRecord.read(ByteBuffer, int)} in Telegram's voice recorders: reads
     * as Telegram would, then changes what was read.
     */
    public static int read(AudioRecord record, ByteBuffer buffer, int size) {
        int read = record.read(buffer, size);
        if (read <= 0) return read;
        try {
            Effect effect = effect(record, record.getAudioFormat(), record.getChannelCount(), record.getSampleRate());
            if (effect != null) effect.apply(buffer, read);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.VOICE_ONE_AT_A_TIME, "voice changer", failure);
        }
        return read;
    }

    /**
     * The effect for one recording, chosen the first time it reads. Only 16-bit mono, which is
     * what both of Telegram's recorders ask for, is changed.
     */
    static Effect effect(Object recording, int format, int channels, int rate) {
        synchronized (EFFECTS) {
            if (EFFECTS.containsKey(recording)) return EFFECTS.get(recording);
            Effect effect = null;
            String preset = preset();
            if (format == AudioFormat.ENCODING_PCM_16BIT && channels == 1 && rate > 0) effect = Effect.of(preset, rate);
            EFFECTS.put(recording, effect);
            if (effect != null) HookStatus.counted(FamilyNames.VOICE_ONE_AT_A_TIME, "voice changer " + preset);
            return effect;
        }
    }

    /** The effect picked now, or {@link #OFF} when it's off, paused or not in this build. */
    static String preset() {
        HookStatus.invoked(FamilyNames.VOICE_ONE_AT_A_TIME);
        try {
            if (!Utils.settingsReady() || HushTelegramPause.isPaused() || !PatchFamily.Capability.VOICE_CHANGER.installed()) return OFF;
            return normalized(Settings.VOICE_CHANGER.get());
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.VOICE_ONE_AT_A_TIME, "voice changer choice", failure);
            return OFF;
        }
    }

    /** A saved choice this build knows, or {@link #OFF}. */
    public static String normalized(String saved) {
        return saved != null && PRESETS.contains(saved) ? saved : OFF;
    }

    static void resetForTests() {
        synchronized (EFFECTS) {
            EFFECTS.clear();
        }
    }

    /** One recording's effect, with the state that carries over from one chunk to the next. */
    static final class Effect {
        private final int rate;
        private final PitchShifter pitch;
        private final Echo echo;
        private final double ringHz;
        private final float gain;
        private long sample;

        private Effect(int rate, double ratio, double echoSeconds, double ringHz, float gain) {
            this.rate = rate;
            this.pitch = ratio == 1 ? null : new PitchShifter(ratio, rate);
            this.echo = echoSeconds <= 0 ? null : new Echo((int) Math.round(echoSeconds * rate));
            this.ringHz = ringHz;
            this.gain = gain;
        }

        static Effect of(String preset, int rate) {
            switch (normalized(preset)) {
                case BABY: return new Effect(rate, 1.7, 0, 0, 1f);
                case WOMAN: return new Effect(rate, 1.35, 0, 0, 1f);
                case MAN: return new Effect(rate, 0.75, 0, 0, 1f);
                case HORROR: return new Effect(rate, 0.6, 0.16, 0, 0.8f);
                case ROBOT: return new Effect(rate, 1, 0, 55, 1.4f);
                default: return null;
            }
        }

        /** Changes the first [bytes] of the chunk, 16-bit samples in the phone's own byte order. */
        void apply(ByteBuffer buffer, int bytes) {
            ByteBuffer pcm = buffer.duplicate().order(ByteOrder.nativeOrder());
            int samples = Math.min(bytes, pcm.capacity()) / 2;
            for (int i = 0; i < samples; i++) {
                pcm.putShort(i * 2, clip(next(pcm.getShort(i * 2))));
            }
        }

        float next(float in) {
            float out = pitch == null ? in : pitch.next(in);
            if (ringHz > 0) out *= (float) Math.sin(2 * Math.PI * ringHz * sample / rate);
            if (echo != null) out = echo.next(out);
            sample++;
            return out * gain;
        }

        private static short clip(float value) {
            return (short) Math.max(Short.MIN_VALUE, Math.min(Short.MAX_VALUE, Math.round(value)));
        }
    }

    /**
     * Changes pitch without changing length: two read heads trail the write head through a short
     * delay line, both moving at the new speed. Each wraps around once per window, and each one's
     * gain is zero right where it wraps, so the jump never clicks; the two gains always add up to one.
     */
    static final class PitchShifter {
        private final float[] line;
        private final float window;
        private final float drift;
        private int write;
        private float delay;

        PitchShifter(double ratio, int rate) {
            window = Math.max(64, Math.round(rate * 0.04f));
            line = new float[(int) window * 2 + 4];
            drift = (float) (1 - ratio);
        }

        float next(float in) {
            line[write] = in;
            float other = wrap(delay + window / 2);
            float share = (float) Math.sin(Math.PI * delay / window);
            share *= share;
            float out = share * tap(delay) + (1 - share) * tap(other);
            delay = wrap(delay + drift);
            write = (write + 1) % line.length;
            return out;
        }

        private float wrap(float value) {
            while (value >= window) value -= window;
            while (value < 0) value += window;
            return value;
        }

        /** The sample [behind] samples (and a bit) before the one just written, read between the two nearest. */
        private float tap(float behind) {
            float at = write - 1 - behind;
            while (at < 0) at += line.length;
            int first = (int) at;
            float part = at - first;
            int second = (first + 1) % line.length;
            return line[first] * (1 - part) + line[second] * part;
        }
    }

    /** One echo that fades as it repeats. */
    static final class Echo {
        private final float[] line;
        private int at;

        Echo(int length) {
            line = new float[Math.max(1, length)];
        }

        float next(float in) {
            float out = in + 0.45f * line[at];
            line[at] = out;
            at = (at + 1) % line.length;
            return out;
        }
    }
}
