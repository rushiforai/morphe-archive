package app.ayham.extension.music.addons;

import android.media.AudioFormat;
import android.media.MediaCodec;
import android.media.MediaExtractor;
import android.media.MediaFormat;

import java.io.File;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;

/**
 * A whole song decoded by MediaExtractor + MediaCodec, the decoders ExoPlayer itself plays through
 * on this device (offset-map.md: fit on the same decoder's output that plays), handed out as
 * planar float blocks at the file's own rate. Also the mono 22 050 Hz stream the fit reads.
 */
public final class AudioDecode {
    private AudioDecode() {
    }

    public interface Sink {
        /** The format, before the first block. */
        void format(int rate, int channels) throws IOException;

        /** frames samples per channel. */
        void block(float[][] planar, int frames) throws IOException;
    }

    /** Longer files (sets, albums in one) are not fitted. */
    public static final double MAX_SEC = 15 * 60;

    public static void decode(File file, Sink sink) throws IOException {
        decode(file, null, 0, -1, sink, null);
    }

    /** What a ranged decode read: the first block's time in the file, and the track's MIME type. */
    public static final class Range {
        public double firstSec = Double.NaN;
        public String mime;
        /** The track's length the container states, or NaN. */
        public double durationSec = Double.NaN;
    }

    /**
     * A part of a streamed file: from the sync point at or before fromSec until untilSec (the
     * extractor reads only the bytes it seeks to). out gets where the first block starts.
     */
    public static void decode(android.media.MediaDataSource src, double fromSec, double untilSec, Sink sink, Range out) throws IOException {
        decode(null, src, fromSec, untilSec, sink, out);
    }

    /** A part of a local file (YouTube's copy around a window), as the streamed one. */
    public static void decode(File file, double fromSec, double untilSec, Sink sink, Range out) throws IOException {
        decode(file, null, fromSec, untilSec, sink, out);
    }

    private static void decode(File file, android.media.MediaDataSource src, double fromSec, double untilSec, Sink sink, Range range) throws IOException {
        MediaExtractor ex = new MediaExtractor();
        MediaCodec codec = null;
        long untilUs = untilSec < 0 ? Long.MAX_VALUE : Math.round(untilSec * 1e6);
        try {
            if (file != null) ex.setDataSource(file.getPath());
            else ex.setDataSource(src);
            MediaFormat fmt = null;
            for (int i = 0; i < ex.getTrackCount(); i++) {
                MediaFormat f = ex.getTrackFormat(i);
                String mime = f.getString(MediaFormat.KEY_MIME);
                if (mime != null && mime.startsWith("audio/")) {
                    ex.selectTrack(i);
                    fmt = f;
                    break;
                }
            }
            if (fmt == null) throw new IOException("no audio track");
            if (range != null) {
                range.mime = fmt.getString(MediaFormat.KEY_MIME);
                if (fmt.containsKey(MediaFormat.KEY_DURATION) && fmt.getLong(MediaFormat.KEY_DURATION) > 0) range.durationSec = fmt.getLong(MediaFormat.KEY_DURATION) / 1e6;
            }
            if (fromSec > 0) ex.seekTo(Math.round(fromSec * 1e6), MediaExtractor.SEEK_TO_PREVIOUS_SYNC);
            codec = MediaCodec.createDecoderByType(fmt.getString(MediaFormat.KEY_MIME));
            codec.configure(fmt, null, null, 0);
            codec.start();
            int rate = fmt.getInteger(MediaFormat.KEY_SAMPLE_RATE), channels = fmt.getInteger(MediaFormat.KEY_CHANNEL_COUNT);
            int enc = AudioFormat.ENCODING_PCM_16BIT;
            boolean told = false, inputDone = false;
            int toldChannels = 0, toldRate = 0;
            long frames = 0;
            MediaCodec.BufferInfo info = new MediaCodec.BufferInfo();
            float[][] planar = null;
            long lastOut = android.os.SystemClock.elapsedRealtime(), t0 = lastOut, inSink = 0;
            short[] pcm16 = null;
            float[] pcmF = null;
            while (true) {
                // every free input buffer filled before waiting on an output: one chunk at a time
                // left the decoder idle between them (a 156 s FLAC took ~40 s a pass on the phone)
                while (!inputDone) {
                    int in = codec.dequeueInputBuffer(0);
                    if (in < 0) break;
                    ByteBuffer b = codec.getInputBuffer(in);
                    int n = b == null ? -1 : ex.readSampleData(b, 0);
                    if (n >= 0 && ex.getSampleTime() > untilUs) n = -1;   // the range's end
                    if (n < 0) {
                        codec.queueInputBuffer(in, 0, 0, 0, MediaCodec.BUFFER_FLAG_END_OF_STREAM);
                        inputDone = true;
                    } else {
                        codec.queueInputBuffer(in, 0, n, ex.getSampleTime(), 0);
                        ex.advance();
                    }
                }
                int out = codec.dequeueOutputBuffer(info, 5_000);
                if (out == MediaCodec.INFO_OUTPUT_FORMAT_CHANGED) {
                    MediaFormat of = codec.getOutputFormat();
                    rate = of.getInteger(MediaFormat.KEY_SAMPLE_RATE);
                    channels = of.getInteger(MediaFormat.KEY_CHANNEL_COUNT);
                    enc = of.containsKey(MediaFormat.KEY_PCM_ENCODING) ? of.getInteger(MediaFormat.KEY_PCM_ENCODING) : AudioFormat.ENCODING_PCM_16BIT;
                    continue;
                }
                // an empty buffer that doesn't end the stream is no progress either
                boolean empty = out >= 0 && info.size <= 0 && (info.flags & MediaCodec.BUFFER_FLAG_END_OF_STREAM) == 0;
                if (out < 0 || empty) {
                    // a decoder that never answers would hold the one prep (or download) worker for good
                    if (android.os.SystemClock.elapsedRealtime() - lastOut > 30_000) throw new IOException("the decoder stalled");
                    if (out < 0) continue;
                } else {
                    lastOut = android.os.SystemClock.elapsedRealtime();
                }
                ByteBuffer buf = codec.getOutputBuffer(out);
                if (buf != null && info.size > 0) {
                    // the sink is told the format with the first audio (an empty buffer before a format change doesn't fix it)
                    if (!told) {
                        // an untrusted file's format: no channels would divide by zero below, no rate breaks the resampler
                        if (rate <= 0 || channels <= 0) throw new IOException("a format of " + rate + " Hz, " + channels + " channels");
                        told = true;
                        toldRate = rate;
                        toldChannels = channels;
                        sink.format(rate, channels);
                    } else if (channels != toldChannels || rate != toldRate) {
                        // the sink sized its meters by the first channel count and timed everything by the first rate
                        throw new IOException("the format changed mid-stream (" + toldRate + " Hz, " + toldChannels + " ch to " + rate + " Hz, " + channels + " ch)");
                    }
                    if (range != null && Double.isNaN(range.firstSec)) range.firstSec = info.presentationTimeUs / 1e6;
                    // a ranged decode ends on the output's own time too: the extractor's sample times
                    // didn't stop a FLAC stream's input (the phone decoded 30 s of a 12 s window)
                    if (range != null && untilUs != Long.MAX_VALUE && info.presentationTimeUs > untilUs) {
                        codec.releaseOutputBuffer(out, false);
                        break;
                    }
                    buf = buf.order(ByteOrder.nativeOrder());
                    buf.position(info.offset).limit(info.offset + info.size);
                    int bytes = enc == AudioFormat.ENCODING_PCM_FLOAT ? 4 : enc == AudioFormat.ENCODING_PCM_24BIT_PACKED ? 3
                            : enc == AudioFormat.ENCODING_PCM_32BIT ? 4 : enc == AudioFormat.ENCODING_PCM_8BIT ? 1 : 2;
                    int n = info.size / (channels * bytes);
                    if (planar == null || planar.length != channels || planar[0].length < n) planar = new float[channels][Math.max(n, 4096)];
                    int all = n * channels;
                    if (enc == AudioFormat.ENCODING_PCM_16BIT) {
                        // in bulk: a call per sample was millions of calls a song
                        if (pcm16 == null || pcm16.length < all) pcm16 = new short[all];
                        buf.asShortBuffer().get(pcm16, 0, all);
                        for (int f = 0, i = 0; f < n; f++)
                            for (int c = 0; c < channels; c++) planar[c][f] = pcm16[i++] / 32768f;
                    } else if (enc == AudioFormat.ENCODING_PCM_FLOAT) {
                        if (pcmF == null || pcmF.length < all) pcmF = new float[all];
                        buf.asFloatBuffer().get(pcmF, 0, all);
                        for (int f = 0, i = 0; f < n; f++)
                            for (int c = 0; c < channels; c++) planar[c][f] = pcmF[i++];
                    } else {
                        for (int f = 0; f < n; f++) {
                            for (int c = 0; c < channels; c++) planar[c][f] = sample(buf, enc);
                        }
                    }
                    long s0 = android.os.SystemClock.elapsedRealtime();
                    sink.block(planar, n);
                    // the sink may wait out a mix (waitWhileHeld): that time is not the decoder stalling
                    lastOut = android.os.SystemClock.elapsedRealtime();
                    inSink += lastOut - s0;
                    frames += n;
                    if (frames > MAX_SEC * rate) throw new IOException("over " + (int) MAX_SEC + " s");
                }
                codec.releaseOutputBuffer(out, false);
                if ((info.flags & MediaCodec.BUFFER_FLAG_END_OF_STREAM) != 0) break;
            }
            if (!told) throw new IOException("nothing decoded");
            long took = android.os.SystemClock.elapsedRealtime() - t0;
            android.util.Log.i("AyhamAddons", String.format(java.util.Locale.US, "decoded %s: %.1f s of audio in %d ms (%d ms of it in our own processing, %s)",
                    file != null ? file.getName() : String.format(java.util.Locale.US, "a stream window (asked %.1f-%.1f s, first block at %.2f s)", fromSec, untilSec, range == null ? Double.NaN : range.firstSec), frames / (double) rate, took, inSink, enc == AudioFormat.ENCODING_PCM_FLOAT ? "float" : enc == AudioFormat.ENCODING_PCM_16BIT ? "16-bit" : "enc " + enc));
        } finally {
            if (codec != null) {
                try {
                    codec.stop();
                } catch (Throwable ignored) {
                }
                codec.release();
            }
            ex.release();
        }
    }

    private static float sample(ByteBuffer b, int enc) {
        switch (enc) {
            case AudioFormat.ENCODING_PCM_FLOAT:
                return b.getFloat();
            case AudioFormat.ENCODING_PCM_24BIT_PACKED: {
                int lo = b.get() & 0xFF, mid = b.get() & 0xFF, hi = b.get();
                return ((hi << 16) | (mid << 8) | lo) / 8388608f;
            }
            case AudioFormat.ENCODING_PCM_32BIT:
                return b.getInt() / 2147483648f;
            case AudioFormat.ENCODING_PCM_8BIT:
                return ((b.get() & 0xFF) - 128) / 128f;
            default:
                return b.getShort() / 32768f;
        }
    }

    /**
     * Planar audio streamed to another rate, in order: the native resampler run on 1 s blocks
     * with 0.1 s of context each side (zeros beyond the ends), the middle kept, so the stream is
     * continuous and the memory flat whatever the song's length and rate.
     */
    public static final class Resampler {
        public interface Out {
            void put(float[][] planar, int off, int frames) throws IOException;
        }

        private final int from, to, pad;
        private final float[][] buf;   // source rate: [pad context][1 s][pad context]
        private final Out out;
        private int have;              // frames in buf

        public Resampler(int from, int to, int channels, Out out) {
            this.from = from;
            this.to = to;
            this.out = out;
            pad = Math.max(1, from / 10);
            buf = new float[channels][from + 2 * pad];
            have = pad;                // zeros before the start
        }

        public void add(float[][] planar, int off, int frames) throws IOException {
            if (from == to) {
                out.put(planar, off, frames);
                return;
            }
            for (int f = 0; f < frames; f++) {
                for (int c = 0; c < buf.length; c++) buf[c][have] = planar[c][off + f];
                if (++have == buf[0].length) block(buf[0].length - 2 * pad);
            }
        }

        /** Resamples the buffer and hands out its middle: real frames after the leading context. */
        private void block(int real) throws IOException {
            float[][] o = new float[buf.length][];
            for (int c = 0; c < buf.length; c++) o[c] = app.ayham.extension.music.automix.Models.resample(buf[c], from, to);
            int outPad = (int) Math.round(pad * (double) to / from);
            int keep = (int) Math.round(real * (double) to / from);
            keep = Math.max(0, Math.min(keep, o[0].length - outPad));
            out.put(o, outPad, keep);
            // the last 2 pads become the next block's leading context
            for (float[] b : buf) System.arraycopy(b, b.length - 2 * pad, b, 0, 2 * pad);
            have = 2 * pad;
        }

        public void finish() throws IOException {
            if (from == to || have <= pad) return;
            // the last, short second: its samples after the leading context, zeros after them
            int real = have - pad;
            for (float[] b : buf) java.util.Arrays.fill(b, have, b.length, 0f);
            block(real);
        }
    }

    /** Mono (the mean of the channels) at FIT_RATE, for the fit. */
    public static final class ToFit {
        private final OffsetFit.Side side;
        private Resampler rs;
        private float[][] mono = new float[1][4096];

        public ToFit(OffsetFit.Side side) {
            this.side = side;
        }

        public void format(int rate) {
            rs = new Resampler(rate, OffsetFit.FIT_RATE, 1, (p, off, n) -> side.add(p[0], off, n));
        }

        public void add(float[][] planar, int frames) throws IOException {
            if (mono[0].length < frames) mono = new float[1][frames];
            int ch = planar.length;
            for (int f = 0; f < frames; f++) {
                float s = 0;
                for (int c = 0; c < ch; c++) s += planar[c][f];
                mono[0][f] = s / ch;
            }
            rs.add(mono, 0, frames);
        }

        public void finish() throws IOException {
            if (rs != null) rs.finish();
            side.finish();
        }
    }
}
