package app.morphe.extension.sabp.read;

import android.content.Context;
import android.media.AudioFormat;
import android.media.MediaCodec;
import android.media.MediaExtractor;
import android.media.MediaFormat;
import android.net.Uri;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;

/**
 * Decodes a short window of an audiobook file to 16 kHz mono float PCM for Whisper, with
 * Android's own decoders (any format SABP plays). One window at a time keeps memory small:
 * 30 s is about 2 MB.
 */
public final class AudioDecoder {
    public static final int RATE = 16000;

    private AudioDecoder() {
    }

    /** File length in milliseconds, or -1. */
    public static long durationMs(Context c, Uri uri) {
        MediaExtractor ex = new MediaExtractor();
        try {
            ex.setDataSource(c, uri, null);
            for (int i = 0; i < ex.getTrackCount(); i++) {
                MediaFormat f = ex.getTrackFormat(i);
                String mime = f.getString(MediaFormat.KEY_MIME);
                if (mime != null && mime.startsWith("audio/") && f.containsKey(MediaFormat.KEY_DURATION)) {
                    return f.getLong(MediaFormat.KEY_DURATION) / 1000;
                }
            }
        } catch (Throwable ignored) {
        } finally {
            ex.release();
        }
        return -1;
    }

    /** Decodes [startMs, startMs + lengthMs). The result may be shorter at the end of the file. */
    public static float[] decode(Context c, Uri uri, long startMs, long lengthMs) throws Exception {
        MediaExtractor ex = new MediaExtractor();
        MediaCodec codec = null;
        try {
            ex.setDataSource(c, uri, null);
            int track = -1;
            MediaFormat fmt = null;
            for (int i = 0; i < ex.getTrackCount(); i++) {
                MediaFormat f = ex.getTrackFormat(i);
                String mime = f.getString(MediaFormat.KEY_MIME);
                if (mime != null && mime.startsWith("audio/")) {
                    track = i;
                    fmt = f;
                    break;
                }
            }
            if (track < 0) throw new IllegalStateException("no audio track");
            ex.selectTrack(track);
            long startUs = Math.max(0, startMs) * 1000;
            long endUs = startUs + lengthMs * 1000;
            ex.seekTo(startUs, MediaExtractor.SEEK_TO_PREVIOUS_SYNC);
            codec = MediaCodec.createDecoderByType(fmt.getString(MediaFormat.KEY_MIME));
            codec.configure(fmt, null, null, 0);
            codec.start();
            int srcRate = fmt.containsKey(MediaFormat.KEY_SAMPLE_RATE) ? fmt.getInteger(MediaFormat.KEY_SAMPLE_RATE) : 44100;
            int channels = fmt.containsKey(MediaFormat.KEY_CHANNEL_COUNT) ? fmt.getInteger(MediaFormat.KEY_CHANNEL_COUNT) : 2;
            boolean floatPcm = false;
            Resampler rs = null;
            float[] out = new float[(int) (lengthMs * RATE / 1000) + RATE];
            int n = 0;
            MediaCodec.BufferInfo info = new MediaCodec.BufferInfo();
            boolean inputDone = false, outputDone = false;
            long guard = System.currentTimeMillis() + 60_000;
            while (!outputDone && System.currentTimeMillis() < guard) {
                if (!inputDone) {
                    int in = codec.dequeueInputBuffer(10_000);
                    if (in >= 0) {
                        ByteBuffer buf = codec.getInputBuffer(in);
                        int size = ex.readSampleData(buf, 0);
                        long t = ex.getSampleTime();
                        if (size < 0 || t > endUs + 200_000) {
                            codec.queueInputBuffer(in, 0, 0, 0, MediaCodec.BUFFER_FLAG_END_OF_STREAM);
                            inputDone = true;
                        } else {
                            codec.queueInputBuffer(in, 0, size, t, 0);
                            ex.advance();
                        }
                    }
                }
                int o = codec.dequeueOutputBuffer(info, 10_000);
                if (o == MediaCodec.INFO_OUTPUT_FORMAT_CHANGED) {
                    MediaFormat of = codec.getOutputFormat();
                    if (of.containsKey(MediaFormat.KEY_SAMPLE_RATE)) srcRate = of.getInteger(MediaFormat.KEY_SAMPLE_RATE);
                    if (of.containsKey(MediaFormat.KEY_CHANNEL_COUNT)) channels = of.getInteger(MediaFormat.KEY_CHANNEL_COUNT);
                    if (of.containsKey(MediaFormat.KEY_PCM_ENCODING)) floatPcm = of.getInteger(MediaFormat.KEY_PCM_ENCODING) == AudioFormat.ENCODING_PCM_FLOAT;
                } else if (o >= 0) {
                    if (info.size > 0) {
                        ByteBuffer ob = codec.getOutputBuffer(o);
                        ob.position(info.offset);
                        ob.limit(info.offset + info.size);
                        ob.order(ByteOrder.nativeOrder());
                        int bytesPerSample = floatPcm ? 4 : 2;
                        int frames = info.size / bytesPerSample / Math.max(1, channels);
                        // Drop frames before the window start (decoding began at a sync point).
                        long frameUs = 1_000_000L / Math.max(1, srcRate);
                        int skip = info.presentationTimeUs < startUs ? (int) Math.min(frames, (startUs - info.presentationTimeUs) / frameUs) : 0;
                        if (rs == null) rs = new Resampler(srcRate);
                        for (int f = 0; f < frames; f++) {
                            float sum = 0;
                            for (int ch = 0; ch < channels; ch++) {
                                sum += floatPcm ? ob.getFloat() : ob.getShort() / 32768f;
                            }
                            if (f < skip) continue;
                            int k = rs.push(sum / channels);
                            for (int r = 0; r < k; r++) {
                                if (n == out.length) out = java.util.Arrays.copyOf(out, out.length * 2);
                                out[n++] = rs.value;
                            }
                        }
                    }
                    codec.releaseOutputBuffer(o, false);
                    if ((info.flags & MediaCodec.BUFFER_FLAG_END_OF_STREAM) != 0 || info.presentationTimeUs > endUs) outputDone = true;
                }
            }
            int want = (int) (lengthMs * RATE / 1000);
            return java.util.Arrays.copyOf(out, Math.min(n, want));
        } finally {
            try {
                if (codec != null) {
                    codec.stop();
                    codec.release();
                }
            } catch (Throwable ignored) {
            }
            ex.release();
        }
    }

    /**
     * Resampler to 16 kHz: box filter when downsampling (averages the source samples in each
     * output period), sample-and-hold when upsampling (8 kHz files).
     */
    static final class Resampler {
        private final double step;
        private double acc, pos;
        private int count;
        float value;

        Resampler(int from) {
            step = from / (double) RATE;
        }

        /** Feeds one input sample; returns how many output samples equal {@link #value}. */
        int push(float s) {
            acc += s;
            count++;
            pos += 1;
            int k = 0;
            while (pos >= step) {
                pos -= step;
                k++;
            }
            if (k > 0) {
                value = (float) (acc / count);
                acc = 0;
                count = 0;
            }
            return k;
        }
    }
}
