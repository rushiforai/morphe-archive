package io.github.emotionbug.patches.runtime;

/** Android-independent PCM accounting shared by the recorder and its unit tests. */
public final class RecorderMath {
    public static final int SAMPLE_RATE = 16000;
    public static final long MIN_DURATION_MS = 2000;
    private RecorderMath() {}

    public static long durationMs(long frames, int sampleRate) {
        return timestampUs(frames, sampleRate) / 1000;
    }

    public static long timestampUs(long frames, int sampleRate) {
        if (frames < 0 || sampleRate <= 0) throw new IllegalArgumentException("Invalid PCM clock");
        return Math.addExact(Math.multiplyExact(frames / sampleRate, 1000000L),
                (frames % sampleRate) * 1000000L / sampleRate);
    }

    public static boolean isTooShort(long frames, int sampleRate) {
        return durationMs(frames, sampleRate) < MIN_DURATION_MS;
    }

    /** RMS below 32 PCM16 units is treated as unusable near-silence, not speech. */
    public static final class Signal {
        private long samples;
        private double meanSquare;

        public void add(short[] pcm, int count) {
            if (count < 0 || count > pcm.length) throw new IllegalArgumentException("Invalid PCM length");
            if (count == 0) return;
            double energy = 0;
            for (int i = 0; i < count; i++) energy += (double) pcm[i] * pcm[i];
            long total = Math.addExact(samples, count);
            meanSquare += (energy / count - meanSquare) * ((double) count / total);
            samples = total;
        }

        public boolean isSilent() { return samples == 0 || meanSquare < 32.0 * 32.0; }
        public long samples() { return samples; }
    }
}
