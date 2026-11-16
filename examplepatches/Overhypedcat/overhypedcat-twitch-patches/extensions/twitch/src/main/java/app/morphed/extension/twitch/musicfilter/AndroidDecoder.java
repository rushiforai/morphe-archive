package app.morphed.extension.twitch.musicfilter;

import android.media.AudioFormat;
import android.media.MediaCodec;
import android.media.MediaExtractor;
import android.media.MediaFormat;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Process;

import java.io.File;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.FloatBuffer;
import java.nio.ShortBuffer;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

/** Reads a downloaded song (Opus or AAC) into 16-bit stereo at 48 kHz with Android's own decoders. */
public final class AndroidDecoder implements SongLibrary.Decoder {
    /** A decode that takes longer has hung (a song takes seconds; a slow phone well under a minute). */
    private static final long DECODE_LIMIT_S = 5 * 60;
    /** A song's copy is at most this long (at the file's own rate): longer won't fit in memory. */
    private static final int MAX_FRAMES = 11 * 60 * 48000;
    private static final String TOO_LONG = "the download is too long for a song's copy";

    @Override
    public SongCopy decode(String videoId, File file) throws SongProblem {
        MediaExtractor extractor = new MediaExtractor();
        MediaCodec codec = null;
        HandlerThread thread = null;
        try {
            extractor.setDataSource(file.getPath());
            int track = -1;
            MediaFormat format = null;
            for (int i = 0; i < extractor.getTrackCount(); i++) {
                MediaFormat candidate = extractor.getTrackFormat(i);
                String mime = candidate.getString(MediaFormat.KEY_MIME);
                if (mime != null && mime.startsWith("audio/")) {
                    track = i;
                    format = candidate;
                    break;
                }
            }
            if (track < 0) throw new SongProblem("the download has no sound in it");
            extractor.selectTrack(track);
            codec = MediaCodec.createDecoderByType(format.getString(MediaFormat.KEY_MIME));
            // The codec's callbacks rather than asking it piece by piece: a song is thousands of 20 ms pieces,
            // and with callbacks they're all in flight at once (measured: about twice as fast).
            Collector collected = new Collector(format);
            // Background priority, as the rest of song removal: the stream's own playback comes first.
            thread = new HandlerThread("TwitchMorphed-decode", Process.THREAD_PRIORITY_BACKGROUND);
            thread.start();
            codec.setCallback(new Feeder(extractor, collected), new Handler(thread.getLooper()));
            codec.configure(format, null, null, 0);
            codec.start();
            if (!collected.done.await(DECODE_LIMIT_S, TimeUnit.SECONDS)) {
                throw new SongProblem("decoding the download took over " + DECODE_LIMIT_S / 60 + " minutes");
            }
            if (collected.failure instanceof SongProblem) throw (SongProblem) collected.failure;
            if (collected.failure != null) throw collected.failure;
            if (collected.left.size == 0) throw new SongProblem("the download has no sound in it");
            short[] l = collected.left.toArray(), r = collected.right.toArray();
            if (collected.rate != Canceller.RATE) {
                l = Resampler.resample(l, collected.rate, Canceller.RATE);
                r = Resampler.resample(r, collected.rate, Canceller.RATE);
            }
            return new SongCopy(videoId, l, r);
        } catch (SongProblem problem) {
            throw problem;
        } catch (InterruptedException interrupted) {
            Thread.currentThread().interrupt();
            throw new SongProblem("decoding the download was stopped");
        } catch (Throwable error) {
            throw new SongProblem("the download couldn't be read: " + Reasons.of(error), error);
        } finally {
            if (codec != null) {
                try {
                    codec.stop();
                } catch (Exception ignored) {
                    // already stopped by its failure
                }
                try {
                    codec.release();
                } catch (Exception ignored) {
                    // released with its failure
                }
            }
            if (thread != null) {
                thread.quitSafely();
                try {
                    thread.join(1000); // a callback still reading must be done before the extractor goes
                } catch (InterruptedException interrupted) {
                    Thread.currentThread().interrupt();
                }
            }
            extractor.release();
        }
    }

    /** The decoded sound, gathered on the codec's thread; read once done counts down. */
    private static final class Collector {
        final CountDownLatch done = new CountDownLatch(1);
        final ShortGrowable left, right;
        int rate, channels;
        boolean floats;
        float[] floatChunk = new float[0];
        short[] shortChunk = new short[0];
        Throwable failure;

        Collector(MediaFormat format) {
            rate = format.getInteger(MediaFormat.KEY_SAMPLE_RATE);
            channels = format.getInteger(MediaFormat.KEY_CHANNEL_COUNT);
            long durationUs = format.containsKey(MediaFormat.KEY_DURATION) ? format.getLong(MediaFormat.KEY_DURATION) : 0;
            int guess = (int) Math.max(48000L * 10, durationUs * 48 / 1000 + 48000);
            left = new ShortGrowable(guess);
            right = new ShortGrowable(guess);
        }

        void format(MediaFormat outFormat) {
            rate = outFormat.getInteger(MediaFormat.KEY_SAMPLE_RATE);
            channels = outFormat.getInteger(MediaFormat.KEY_CHANNEL_COUNT);
            floats = outFormat.containsKey(MediaFormat.KEY_PCM_ENCODING)
                    && outFormat.getInteger(MediaFormat.KEY_PCM_ENCODING) == AudioFormat.ENCODING_PCM_FLOAT;
        }

        /** One decoded piece into left and right, in bulk (a song is millions of samples). */
        void add(ByteBuffer pcm) throws SongProblem {
            if (floats) {
                FloatBuffer samples = pcm.asFloatBuffer();
                int count = samples.remaining();
                int frames = count / channels;
                if (left.size + frames > MAX_FRAMES) throw new SongProblem(TOO_LONG);
                if (floatChunk.length < count) floatChunk = new float[count];
                samples.get(floatChunk, 0, count);
                left.reserve(frames);
                right.reserve(frames);
                for (int f = 0, i = 0; f < frames; f++, i += channels) {
                    left.data[left.size++] = toShort(floatChunk[i]);
                    right.data[right.size++] = toShort(floatChunk[channels > 1 ? i + 1 : i]);
                }
            } else {
                ShortBuffer samples = pcm.asShortBuffer();
                int count = samples.remaining();
                int frames = count / channels;
                if (left.size + frames > MAX_FRAMES) throw new SongProblem(TOO_LONG);
                if (shortChunk.length < count) shortChunk = new short[count];
                samples.get(shortChunk, 0, count);
                left.reserve(frames);
                right.reserve(frames);
                for (int f = 0, i = 0; f < frames; f++, i += channels) {
                    left.data[left.size++] = shortChunk[i];
                    right.data[right.size++] = shortChunk[channels > 1 ? i + 1 : i];
                }
            }
        }

        /** Ends the decode: with why, or (null) because it's all here. Only the first end counts. */
        void finish(Throwable why) {
            if (done.getCount() == 0) return;
            failure = why;
            done.countDown();
        }
    }

    /** Hands the file's pieces to the codec as it asks, and its sound to the collector. */
    private static final class Feeder extends MediaCodec.Callback {
        private final MediaExtractor extractor;
        private final Collector collected;
        private boolean inputDone;

        Feeder(MediaExtractor extractor, Collector collected) {
            this.extractor = extractor;
            this.collected = collected;
        }

        @Override
        public void onInputBufferAvailable(MediaCodec codec, int index) {
            if (inputDone || collected.done.getCount() == 0) return;
            try {
                ByteBuffer buffer = codec.getInputBuffer(index);
                int size = buffer == null ? -1 : extractor.readSampleData(buffer, 0);
                if (size < 0) {
                    codec.queueInputBuffer(index, 0, 0, 0, MediaCodec.BUFFER_FLAG_END_OF_STREAM);
                    inputDone = true;
                } else {
                    codec.queueInputBuffer(index, 0, size, extractor.getSampleTime(), 0);
                    extractor.advance();
                }
            } catch (Throwable error) {
                collected.finish(error);
            }
        }

        @Override
        public void onOutputBufferAvailable(MediaCodec codec, int index, MediaCodec.BufferInfo info) {
            if (collected.done.getCount() == 0) return;
            try {
                ByteBuffer buffer = codec.getOutputBuffer(index);
                if (buffer != null && info.size > 0) {
                    buffer.position(info.offset).limit(info.offset + info.size);
                    collected.add(buffer.slice().order(ByteOrder.nativeOrder()));
                }
                codec.releaseOutputBuffer(index, false);
                if ((info.flags & MediaCodec.BUFFER_FLAG_END_OF_STREAM) != 0) collected.finish(null);
            } catch (Throwable error) {
                collected.finish(error);
            }
        }

        @Override
        public void onOutputFormatChanged(MediaCodec codec, MediaFormat format) {
            try {
                collected.format(format);
            } catch (Throwable error) { // (a vendor codec without a key): never on the app's own thread
                collected.finish(error);
            }
        }

        @Override
        public void onError(MediaCodec codec, MediaCodec.CodecException error) {
            collected.finish(error);
        }
    }

    private static short toShort(float value) {
        return (short) Math.max(-32768, Math.min(32767, Math.round(value * 32768f)));
    }

    /** A growing array of samples (a song is millions of them: no boxing). */
    static final class ShortGrowable {
        short[] data;
        int size;

        ShortGrowable(int capacity) {
            data = new short[Math.max(capacity, 1024)];
        }

        void reserve(int more) {
            if (size + more > data.length) data = java.util.Arrays.copyOf(data, Math.max(size + more, data.length + data.length / 2));
        }

        short[] toArray() {
            return java.util.Arrays.copyOf(data, size);
        }
    }
}
