package dev.materialtidal.extension.tidal.player.waveform;

import java.nio.ByteBuffer;
import java.util.Arrays;

/**
 * Pure-Java PCM energy analysis, perceptual normalization, envelope resampling,
 * deterministic song-seeded fallback generation, and non-destructive live buffer metering.
 */
public final class SongWaveformAnalyzer {

    public static final int CANONICAL_BINS = 64;

    // Numeric mirror of android.media.AudioFormat ENCODING_PCM_* constants so pure JVM tests need no Android stub.
    public static final int ENCODING_PCM_16BIT = 2;
    public static final int ENCODING_PCM_8BIT = 3;
    public static final int ENCODING_PCM_FLOAT = 4;
    public static final int ENCODING_PCM_24BIT_PACKED = 21;
    public static final int ENCODING_PCM_32BIT = 22;

    private SongWaveformAnalyzer() {}

    /**
     * Streaming accumulator that collects short chronological PCM-16 energy frames during MediaCodec decoding.
     */
    public static final class EnvelopeAccumulator {
        private final float[] rawFrames;
        private int frameCount;
        private double sumSq;
        private long sampleCount;
        private final long samplesPerFrame;

        public EnvelopeAccumulator(int sampleRateHz, int channelCount, int expectedMaxFrames) {
            int sr = Math.max(8000, sampleRateHz);
            int ch = Math.max(1, channelCount);
            // ~45ms frame window for crisp transient capture with minimal memory
            this.samplesPerFrame = Math.max(256L, ((long) sr * ch * 45L) / 1000L);
            this.rawFrames = new float[Math.max(128, expectedMaxFrames)];
        }

        public void acceptPcm16(ByteBuffer buf, int offset, int byteCount) {
            if (buf == null || byteCount < 2) {
                return;
            }
            int end = Math.min(buf.limit(), offset + byteCount) - 1;
            int stepBytes = byteCount > 32768 ? 4 : 2;
            for (int i = offset; i < end; i += stepBytes) {
                int lo = buf.get(i) & 0xFF;
                int hi = buf.get(i + 1);
                int sample = (hi << 8) | lo;
                float norm = sample / 32768f;
                sumSq += (double) norm * (double) norm;
                sampleCount++;
                if (sampleCount >= samplesPerFrame) {
                    flushFrame();
                }
            }
        }

        public void finish() {
            if (sampleCount > 0) {
                flushFrame();
            }
        }

        public float[] buildCanonicalEnvelope() {
            finish();
            return finalizeEnvelope(rawFrames, frameCount, CANONICAL_BINS);
        }

        private void flushFrame() {
            if (sampleCount <= 0) {
                return;
            }
            float rms = (float) Math.sqrt(sumSq / (double) sampleCount);
            sumSq = 0.0;
            sampleCount = 0L;
            if (frameCount < rawFrames.length) {
                rawFrames[frameCount++] = rms;
            } else {
                // Downsample 2:1 in place if a very long track exceeds preallocation
                int half = frameCount / 2;
                for (int i = 0; i < half; i++) {
                    rawFrames[i] = Math.max(rawFrames[i * 2], rawFrames[i * 2 + 1]);
                }
                frameCount = half;
                rawFrames[frameCount++] = rms;
            }
        }
    }

    /**
     * Converts raw chronological RMS frames into a normalized, perceptually scaled waveform envelope.
     */
    public static float[] finalizeEnvelope(float[] rawEnergy, int rawCount, int targetBins) {
        int outLen = Math.max(8, targetBins);
        float[] out = new float[outLen];
        if (rawEnergy == null || rawCount <= 0) {
            Arrays.fill(out, 0.22f);
            return out;
        }

        int n = Math.min(rawCount, rawEnergy.length);
        // 1. Bucket into target bins using RMS + transient peak blend
        for (int b = 0; b < outLen; b++) {
            float startF = (b * (float) n) / outLen;
            float endF = ((b + 1) * (float) n) / outLen;
            int i0 = Math.max(0, Math.min(n - 1, (int) Math.floor(startF)));
            int i1 = Math.max(i0 + 1, Math.min(n, (int) Math.ceil(endF)));
            double sumSq = 0.0;
            float peak = 0f;
            int cnt = 0;
            for (int i = i0; i < i1; i++) {
                float v = Math.max(0f, rawEnergy[i]);
                sumSq += (double) v * (double) v;
                if (v > peak) {
                    peak = v;
                }
                cnt++;
            }
            float rms = cnt > 0 ? (float) Math.sqrt(sumSq / cnt) : 0f;
            out[b] = 0.68f * rms + 0.32f * peak;
        }

        // 2. Robust percentile normalization so quiet and loud masters both remain expressive
        float[] sorted = Arrays.copyOf(out, outLen);
        Arrays.sort(sorted);
        float lowFloor = sorted[Math.max(0, Math.min(outLen - 1, Math.round((outLen - 1) * 0.08f)))];
        float highCeil = sorted[Math.max(0, Math.min(outLen - 1, Math.round((outLen - 1) * 0.96f)))];
        float span = highCeil - lowFloor;
        if (span < 0.0025f) {
            float mean = 0f;
            for (float v : out) {
                mean += v;
            }
            mean /= outLen;
            float flat = mean > 0.001f ? 0.42f : 0.16f;
            Arrays.fill(out, flat);
            return out;
        }

        for (int i = 0; i < outLen; i++) {
            float norm = (out[i] - lowFloor) / span;
            norm = Math.max(0f, Math.min(1f, norm));
            // Perceptual power compression + readable minimum bar floor
            float shaped = (float) Math.pow(norm, 0.78);
            out[i] = 0.12f + 0.88f * shaped;
        }

        // 3. Gentle 3-tap perceptual smoothing
        float[] smoothed = new float[outLen];
        for (int i = 0; i < outLen; i++) {
            float prev = i > 0 ? out[i - 1] : out[i];
            float next = i + 1 < outLen ? out[i + 1] : out[i];
            smoothed[i] = 0.18f * prev + 0.64f * out[i] + 0.18f * next;
        }
        return smoothed;
    }

    /**
     * Resamples a canonical envelope into a display bar count using linear + peak-preserving interpolation.
     */
    public static float[] resampleEnvelope(float[] canonical, int targetCount) {
        int outLen = Math.max(8, targetCount);
        float[] result = new float[outLen];
        if (canonical == null || canonical.length == 0) {
            Arrays.fill(result, 0.25f);
            return result;
        }
        int srcLen = canonical.length;
        if (srcLen == outLen) {
            for (int i = 0; i < outLen; i++) {
                result[i] = clamp01(canonical[i]);
            }
            return result;
        }
        for (int i = 0; i < outLen; i++) {
            float pos = outLen == 1 ? 0f : (i * (float) (srcLen - 1)) / (float) (outLen - 1);
            int idx0 = (int) Math.floor(pos);
            int idx1 = Math.min(srcLen - 1, idx0 + 1);
            float t = pos - idx0;
            float linear = canonical[idx0] * (1f - t) + canonical[idx1] * t;
            result[i] = Math.max(0.10f, Math.min(1.0f, linear));
        }
        return result;
    }

    /**
     * Generates an immediate deterministic, musical-looking placeholder waveform seeded by track ID/title.
     */
    public static float[] generateSeededPlaceholder(String seedKey, int targetCount) {
        int count = Math.max(8, targetCount);
        float[] bars = new float[count];
        long h = 0x9E3779B97F4A7C15L;
        if (seedKey != null) {
            for (int i = 0; i < seedKey.length(); i++) {
                h = (h * 0xBF58476D1CE4E5B9L) ^ seedKey.charAt(i);
                h ^= (h >>> 27);
            }
        }
        float phaseA = ((h & 0xFFFFL) / 65535f) * 6.28318f;
        float phaseB = (((h >>> 16) & 0xFFFFL) / 65535f) * 6.28318f;
        float phaseC = (((h >>> 32) & 0xFFFFL) / 65535f) * 6.28318f;
        long rng = h ^ 0x94D049BB133111EBL;

        for (int i = 0; i < count; i++) {
            float u = count == 1 ? 0.5f : (float) i / (float) (count - 1);
            // Musical arc: soft intro, chorus lift, gentle outro
            float macro = (float) (0.55 + 0.25 * Math.sin(u * Math.PI)
                    + 0.14 * Math.sin(u * Math.PI * 2.5 + phaseA)
                    + 0.11 * Math.cos(u * Math.PI * 6.2 + phaseB));
            rng ^= (rng << 13);
            rng ^= (rng >>> 7);
            rng ^= (rng << 17);
            float micro = ((rng & 0xFFL) / 255f - 0.5f) * 0.26f
                    + 0.10f * (float) Math.sin(u * 21.0 + phaseC);
            float v = 0.18f + 0.78f * clamp01(macro + micro);
            bars[i] = Math.max(0.16f, Math.min(0.96f, v));
        }
        return bars;
    }

    public static byte[] quantizeToBytes(float[] bins) {
        int len = bins == null ? 0 : bins.length;
        byte[] out = new byte[len];
        for (int i = 0; i < len; i++) {
            int q = Math.round(clamp01(bins[i]) * 255f);
            out[i] = (byte) Math.max(0, Math.min(255, q));
        }
        return out;
    }

    public static float[] dequantizeFromBytes(byte[] bytes) {
        int len = bytes == null ? 0 : bytes.length;
        float[] out = new float[len];
        for (int i = 0; i < len; i++) {
            out[i] = (bytes[i] & 0xFF) / 255f;
        }
        return out;
    }

    /**
     * Computes instantaneous normalized PCM energy [0..1] from an ExoPlayer/AudioSink ByteBuffer
     * WITHOUT modifying buffer position, limit, or byte order.
     */
    public static float analyzeLiveBuffer(ByteBuffer buf, int encoding) {
        if (buf == null) {
            return 0f;
        }
        int pos = buf.position();
        int lim = buf.limit();
        int rem = lim - pos;
        if (rem <= 0) {
            return 0f;
        }

        double sumSq = 0.0;
        float peak = 0f;
        int count = 0;

        if (encoding == ENCODING_PCM_FLOAT) {
            int step = Math.max(4, ((rem / 4) / 96) * 4);
            for (int i = pos; i + 3 < lim; i += step) {
                int bits = (buf.get(i) & 0xFF)
                        | ((buf.get(i + 1) & 0xFF) << 8)
                        | ((buf.get(i + 2) & 0xFF) << 16)
                        | ((buf.get(i + 3) & 0xFF) << 24);
                float f = Float.intBitsToFloat(bits);
                if (Float.isNaN(f) || Float.isInfinite(f)) {
                    continue;
                }
                float abs = Math.min(1f, Math.abs(f));
                sumSq += (double) abs * (double) abs;
                if (abs > peak) peak = abs;
                count++;
            }
        } else if (encoding == ENCODING_PCM_24BIT_PACKED) {
            int step = Math.max(3, ((rem / 3) / 96) * 3);
            for (int i = pos; i + 2 < lim; i += step) {
                int raw = (buf.get(i) & 0xFF)
                        | ((buf.get(i + 1) & 0xFF) << 8)
                        | (buf.get(i + 2) << 16);
                float abs = Math.min(1f, Math.abs(raw / 8388608f));
                sumSq += (double) abs * (double) abs;
                if (abs > peak) peak = abs;
                count++;
            }
        } else if (encoding == ENCODING_PCM_32BIT) {
            int step = Math.max(4, ((rem / 4) / 96) * 4);
            for (int i = pos; i + 3 < lim; i += step) {
                int raw = (buf.get(i) & 0xFF)
                        | ((buf.get(i + 1) & 0xFF) << 8)
                        | ((buf.get(i + 2) & 0xFF) << 16)
                        | (buf.get(i + 3) << 24);
                float abs = Math.min(1f, Math.abs(raw / 2147483648f));
                sumSq += (double) abs * (double) abs;
                if (abs > peak) peak = abs;
                count++;
            }
        } else if (encoding == ENCODING_PCM_8BIT) {
            int step = Math.max(1, rem / 96);
            for (int i = pos; i < lim; i += step) {
                int unsigned = buf.get(i) & 0xFF;
                float abs = Math.abs((unsigned - 128) / 128f);
                sumSq += (double) abs * (double) abs;
                if (abs > peak) peak = abs;
                count++;
            }
        } else {
            // Default: ENCODING_PCM_16BIT little-endian
            int step = Math.max(2, ((rem / 2) / 96) * 2);
            for (int i = pos; i + 1 < lim; i += step) {
                int sample = (buf.get(i) & 0xFF) | (buf.get(i + 1) << 8);
                float abs = Math.min(1f, Math.abs(sample / 32768f));
                sumSq += (double) abs * (double) abs;
                if (abs > peak) peak = abs;
                count++;
            }
        }

        if (count == 0) {
            return 0f;
        }
        float rms = (float) Math.sqrt(sumSq / count);
        // Gentle logarithmic curve so typical music loudness sits nicely around 0.25..0.90
        float raw = 0.72f * rms + 0.28f * peak;
        return clamp01((float) Math.pow(raw * 1.45f, 0.68));
    }

    private static float clamp01(float v) {
        if (Float.isNaN(v)) return 0f;
        return Math.max(0f, Math.min(1f, v));
    }
}
