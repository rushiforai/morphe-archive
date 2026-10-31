package app.bitchord.telegram;

import androidx.media3.common.Format;
import androidx.media3.exoplayer.audio.AudioSink;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.Collections;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Plays surround audio (5.1, 7.1 and similar) as stereo, inside BitChord's audio sink, before its
 * equaliser and effects. The file isn't changed. Uses the same mix as ffmpeg's {@code -ac 2}:
 * centre and surrounds at -3 dB, LFE left out, then scaled down so the result can't clip.
 */
public final class Downmix {
    private Downmix() {}

    /** BitChord's audio sink after patching: the original handleBuffer under another name. */
    public interface Target {
        boolean originalHandleBuffer(ByteBuffer buffer, long presentationTimeUs, int count)
                throws Exception;
    }

    static final int PCM_16BIT = 2, PCM_FLOAT = 4, PCM_24BIT = 21, PCM_32BIT = 22;
    private static final float HALF = 0.70710677f;

    static volatile boolean enabled = false;
    private static final Map<Object, State> states =
            Collections.synchronizedMap(new WeakHashMap<>());
    private static final ThreadLocal<Object[]> configuring = new ThreadLocal<>();

    static final class State {
        final int channels, bytes, encoding;
        final float[][] matrix;
        ByteBuffer out;
        boolean pending;

        State(int channels, int encoding, float[][] matrix) {
            this.channels = channels;
            this.encoding = encoding;
            this.bytes = bytesPerSample(encoding);
            this.matrix = matrix;
        }
    }

    /**
     * Left and right gains for each input channel, in Android's channel order, or null when the
     * layout isn't one this knows how to fold down.
     */
    static float[][] matrix(int channels) {
        float[] left, right;
        switch (channels) {
            case 3: // FL FR FC
                left = new float[] {1, 0, HALF};
                right = new float[] {0, 1, HALF};
                break;
            case 4: // FL FR BL BR
                left = new float[] {1, 0, HALF, 0};
                right = new float[] {0, 1, 0, HALF};
                break;
            case 5: // FL FR FC BL BR
                left = new float[] {1, 0, HALF, HALF, 0};
                right = new float[] {0, 1, HALF, 0, HALF};
                break;
            case 6: // FL FR FC LFE BL BR
                left = new float[] {1, 0, HALF, 0, HALF, 0};
                right = new float[] {0, 1, HALF, 0, 0, HALF};
                break;
            case 8: // FL FR FC LFE BL BR SL SR
                left = new float[] {1, 0, HALF, 0, HALF, 0, HALF, 0};
                right = new float[] {0, 1, HALF, 0, 0, HALF, 0, HALF};
                break;
            default:
                return null;
        }
        float scale = 0;
        for (float gain : left) scale += gain;
        for (int i = 0; i < channels; i++) {
            left[i] /= scale;
            right[i] /= scale;
        }
        return new float[][] {left, right};
    }

    static int bytesPerSample(int encoding) {
        switch (encoding) {
            case PCM_16BIT:
                return 2;
            case PCM_24BIT:
                return 3;
            case PCM_32BIT:
            case PCM_FLOAT:
                return 4;
            default:
                return 0;
        }
    }

    /** What to do with a format, or null to leave it alone. */
    static State plan(String mime, int channels, int encoding, boolean mapped) {
        if (!enabled || mapped || !"audio/raw".equals(mime) || bytesPerSample(encoding) == 0)
            return null;
        float[][] matrix = matrix(channels);
        return matrix == null ? null : new State(channels, encoding, matrix);
    }

    /** Called first in the sink's configure. */
    public static void configure(Object sink, AudioSink.AudioSinkConfig config) {
        states.remove(sink);
        configuring.set(new Object[] {sink, config != null && config.outputChannelMapping != null});
    }

    /** The format the sink should set itself up for: stereo when the input is folded down. */
    public static Format format(Format format) {
        Object[] call = configuring.get();
        configuring.remove();
        if (call == null || format == null) return format;
        try {
            if ("audio/raw".equals(format.sampleMimeType))
                SoundCheck.format(
                        call[0], format.sampleRate, format.channelCount, format.pcmEncoding);
            else SoundCheck.format(call[0], 0, 0, 0);
        } catch (Throwable ignored) {
            // Only the sound check reads it.
        }
        State state;
        try {
            state =
                    plan(
                            format.sampleMimeType,
                            format.channelCount,
                            format.pcmEncoding,
                            (Boolean) call[1]);
            if (state == null) return format;
            Format.Builder stereo = format.buildUpon();
            stereo.channelCount = 2;
            stereo.channelMask = Format.NO_VALUE;
            format = stereo.build();
        } catch (Throwable e) {
            return format;
        }
        states.put(call[0], state);
        return format;
    }

    /** Called when the sink falls back to passing the original configuration through. */
    public static void off(Object sink) {
        states.remove(sink);
    }

    /** The sink was flushed or reset: drop the part of a buffer it hadn't taken yet. */
    public static void flush(Object sink) {
        State state = states.get(sink);
        if (state != null) state.pending = false;
        VersionAlign.flushed(sink);
    }

    public static boolean handleBuffer(Target sink, ByteBuffer buffer, long timeUs, int count)
            throws Exception {
        SoundCheck.tap(sink, buffer, timeUs);
        VersionAlign.tap(sink, buffer, timeUs);
        if (VersionAlign.drop(sink, buffer, timeUs)) return true;
        State state = states.get(sink);
        if (state == null) return sink.originalHandleBuffer(buffer, timeUs, count);
        if (!state.pending) {
            state.out = convert(state, buffer, state.out);
            state.pending = true;
        }
        boolean done = sink.originalHandleBuffer(state.out, timeUs, count);
        if (done) {
            state.pending = false;
            buffer.position(buffer.limit());
        }
        return done;
    }

    /** Folds the frames between the buffer's position and limit into stereo. */
    static ByteBuffer convert(State state, ByteBuffer in, ByteBuffer out) {
        ByteBuffer source = in.duplicate().order(ByteOrder.LITTLE_ENDIAN);
        int frames = source.remaining() / (state.bytes * state.channels);
        int size = frames * state.bytes * 2;
        if (out == null || out.capacity() < size)
            out = ByteBuffer.allocateDirect(Math.max(size, 4096)).order(ByteOrder.nativeOrder());
        out.clear();
        out.order(ByteOrder.LITTLE_ENDIAN);
        float[] left = state.matrix[0], right = state.matrix[1];
        float[] frame = new float[state.channels];
        for (int f = 0; f < frames; f++) {
            for (int c = 0; c < state.channels; c++) frame[c] = read(source, state.encoding);
            float l = 0, r = 0;
            for (int c = 0; c < state.channels; c++) {
                l += frame[c] * left[c];
                r += frame[c] * right[c];
            }
            write(out, state.encoding, l);
            write(out, state.encoding, r);
        }
        out.flip();
        return out;
    }

    static float read(ByteBuffer b, int encoding) {
        switch (encoding) {
            case PCM_16BIT:
                return b.getShort() / 32768f;
            case PCM_24BIT:
                int low = b.get() & 0xff, mid = b.get() & 0xff, high = b.get();
                return ((high << 16) | (mid << 8) | low) / 8388608f;
            case PCM_32BIT:
                return (float) (b.getInt() / 2147483648.0);
            default:
                return b.getFloat();
        }
    }

    static void write(ByteBuffer b, int encoding, float value) {
        switch (encoding) {
            case PCM_16BIT:
                b.putShort((short) Math.round(clamp(value) * 32767f));
                break;
            case PCM_24BIT:
                int v24 = Math.round(clamp(value) * 8388607f);
                b.put((byte) v24).put((byte) (v24 >> 8)).put((byte) (v24 >> 16));
                break;
            case PCM_32BIT:
                b.putInt((int) Math.round(clamp(value) * 2147483647.0));
                break;
            default:
                b.putFloat(value);
        }
    }

    private static float clamp(float value) {
        return value > 1f ? 1f : value < -1f ? -1f : value;
    }
}
