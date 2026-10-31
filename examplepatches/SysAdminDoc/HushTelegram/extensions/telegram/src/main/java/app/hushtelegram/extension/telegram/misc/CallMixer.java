/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import java.io.IOException;
import java.util.Arrays;

/**
 * Mixes a call's two sides into one mono track at {@link #RATE}. The speaker side is the clock:
 * each block Telegram plays takes the same stretch of microphone audio from a short ring, so the
 * two sides stay together however the engines time their reads. The microphone runs alone only
 * when nothing plays for a while (a build with only that side hooked), and the end of a call
 * writes what's left of it.
 *
 * <p>Input is 16-bit little-endian PCM at any rate and channel count. Pure Java, no Android.
 */
final class CallMixer {
    /** The recording's rate, the one WebRTC uses on most phones, so most blocks need no resampling. */
    static final int RATE = 48000;
    /** The ring holds two seconds of microphone audio; older samples go first when it's full. */
    static final int RING = RATE * 2;
    /** Forty milliseconds of microphone audio wait in the ring before the mix takes any, after a start or a gap. */
    static final int PRIME = RATE / 25;
    /** Half a second of microphone audio with nothing played over it is written on its own. */
    static final int ALONE = RATE / 2;

    /** Where mixed samples go: the encoder on a phone, a list in tests. */
    interface Sink {
        void write(short[] samples, int count) throws IOException;
    }

    private final Sink sink;
    private final short[] ring = new short[RING];
    private int head;
    private int held;
    private boolean primed;
    private long written;
    private long droppedMic;
    private final Resampler mic = new Resampler();
    private final Resampler speaker = new Resampler();

    CallMixer(Sink sink) {
        this.sink = sink;
    }

    /** A block the microphone recorded. */
    void mic(byte[] pcm, int length, int rate, int channels) throws IOException {
        short[] samples = mic.run(mono(pcm, length, channels), rate);
        for (short sample : samples) {
            if (held == RING) {
                head = (head + 1) % RING;
                held--;
                droppedMic++;
            }
            ring[(head + held) % RING] = sample;
            held++;
        }
        if (!primed && held >= PRIME) primed = true;
        if (held > ALONE) {
            // Nothing is playing to carry the microphone, so it goes out alone down to the prime.
            int alone = held - PRIME;
            short[] out = new short[alone];
            take(out, alone);
            emit(out, alone);
        }
    }

    /** A block Telegram played: the other side. The microphone joins it once primed. */
    void speaker(byte[] pcm, int length, int rate, int channels) throws IOException {
        short[] out = speaker.run(mono(pcm, length, channels), rate);
        if (out.length == 0) return;
        if (primed) {
            int count = Math.min(out.length, held);
            short[] taken = new short[count];
            take(taken, count);
            for (int i = 0; i < count; i++) out[i] = clip(out[i] + taken[i]);
            // Ran dry: the microphone waits for a fresh prime rather than stuttering block by block.
            if (count < out.length) primed = false;
        }
        emit(out, out.length);
    }

    /** The call ended: what's left of the microphone goes out on its own. */
    void flush() throws IOException {
        if (held == 0) return;
        short[] out = new short[held];
        int count = held;
        take(out, count);
        emit(out, count);
    }

    /** Samples written so far, at {@link #RATE}. */
    long written() {
        return written;
    }

    /** Microphone samples the full ring pushed out. */
    long droppedMic() {
        return droppedMic;
    }

    private void take(short[] into, int count) {
        for (int i = 0; i < count; i++) {
            into[i] = ring[head];
            head = (head + 1) % RING;
        }
        held -= count;
    }

    private void emit(short[] samples, int count) throws IOException {
        if (count == 0) return;
        sink.write(samples, count);
        written += count;
    }

    static short clip(int sample) {
        return (short) Math.max(Short.MIN_VALUE, Math.min(Short.MAX_VALUE, sample));
    }

    /** 16-bit little-endian frames to mono, each frame the average of its channels. A partial frame at the end is left out. */
    static short[] mono(byte[] pcm, int length, int channels) {
        int width = 2 * Math.max(1, channels);
        int frames = Math.max(0, Math.min(length, pcm.length)) / width;
        short[] out = new short[frames];
        for (int frame = 0; frame < frames; frame++) {
            int sum = 0;
            int base = frame * width;
            for (int channel = 0; channel < width; channel += 2) {
                sum += (short) ((pcm[base + channel] & 0xff) | (pcm[base + channel + 1] << 8));
            }
            out[frame] = (short) (sum / Math.max(1, channels));
        }
        return out;
    }

    /**
     * Linear resampling to {@link #RATE} that carries its position and last sample from one block
     * to the next, so block edges don't click. A block at the output rate passes as it is, and a
     * change of input rate starts over from that block.
     */
    static final class Resampler {
        private int from;
        private double position;
        private short previous;
        private boolean started;

        short[] run(short[] in, int rate) {
            if (rate <= 0 || in.length == 0) return new short[0];
            if (rate != from) {
                from = rate;
                position = 0;
                started = false;
            }
            if (rate == RATE) return in;
            int offset = started ? 1 : 0;
            int length = in.length + offset;
            double step = rate / (double) RATE;
            short[] out = new short[(int) Math.ceil((length - 1 - position) / step) + 1];
            int count = 0;
            while (position < length - 1 && count < out.length) {
                int index = (int) position;
                double fraction = position - index;
                int a = sample(in, offset, index);
                int b = sample(in, offset, index + 1);
                out[count++] = (short) Math.round(a + (b - a) * fraction);
                position += step;
            }
            previous = in[in.length - 1];
            started = true;
            position -= length - 1;
            return count == out.length ? out : Arrays.copyOf(out, count);
        }

        private int sample(short[] in, int offset, int index) {
            return offset == 1 && index == 0 ? previous : in[index - offset];
        }
    }
}
