package app.bitchord.telegram;

import android.media.MediaCodec;
import android.media.MediaDataSource;
import android.media.MediaExtractor;
import android.media.MediaFormat;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;

/**
 * Decodes the start of a Telegram file with Android's own decoders, reading it through the same
 * reader playback uses. Only as much of the file as the first seconds need is downloaded.
 */
final class AudioDecode {
    private AudioDecode() {}

    /** Give up on a file that takes longer than this to read and decode. */
    static final long BUDGET_MILLIS = 90_000;

    static SoundCheck.Pcm start(TelegramBridge bridge, String telegramId, int seconds)
            throws Exception {
        return start(bridge, telegramId, seconds, seconds);
    }

    /**
     * As above; when reading takes too long, what was decoded is enough once it's {@code least}
     * seconds.
     */
    static SoundCheck.Pcm start(TelegramBridge bridge, String telegramId, int seconds, int least)
            throws Exception {
        return decode(bridge, telegramId, 0, seconds, least, BUDGET_MILLIS);
    }

    /**
     * {@code seconds} of a file from about {@code fromMs}: the decoded samples say exactly where
     * they start. Gives up after {@code budgetMillis}, unless {@code least} seconds are decoded.
     */
    static SoundCheck.Pcm decode(
            TelegramBridge bridge,
            String telegramId,
            long fromMs,
            int seconds,
            int least,
            long budgetMillis)
            throws Exception {
        long deadline = System.currentTimeMillis() + budgetMillis;
        MediaExtractor extractor = new MediaExtractor();
        MediaCodec codec = null;
        try (Source source = new Source(bridge, bridge.url() + "/audio/" + telegramId)) {
            extractor.setDataSource(source);
            int track = -1;
            MediaFormat format = null;
            for (int i = 0; i < extractor.getTrackCount(); i++) {
                MediaFormat f = extractor.getTrackFormat(i);
                String mime = f.getString(MediaFormat.KEY_MIME);
                if (mime != null && mime.startsWith("audio/")) {
                    track = i;
                    format = f;
                    break;
                }
            }
            if (track < 0) throw new IOException("No audio in the file");
            extractor.selectTrack(track);
            if (fromMs > 0) extractor.seekTo(fromMs * 1000, MediaExtractor.SEEK_TO_PREVIOUS_SYNC);
            long startUs = -1;
            codec = MediaCodec.createDecoderByType(format.getString(MediaFormat.KEY_MIME));
            codec.configure(format, null, null, 0);
            codec.start();
            int rate = format.getInteger(MediaFormat.KEY_SAMPLE_RATE);
            int channels = format.getInteger(MediaFormat.KEY_CHANNEL_COUNT);
            int encoding = Downmix.PCM_16BIT;
            float[] mono = new float[rate * seconds];
            int length = 0;
            boolean inputDone = false;
            MediaCodec.BufferInfo info = new MediaCodec.BufferInfo();
            while (length < mono.length) {
                if (System.currentTimeMillis() > deadline) {
                    if (length >= (long) rate * least) break;
                    throw new IOException("Reading the file took too long");
                }
                if (!inputDone) {
                    int in = codec.dequeueInputBuffer(10_000);
                    if (in >= 0) {
                        ByteBuffer buffer = codec.getInputBuffer(in);
                        int size = extractor.readSampleData(buffer, 0);
                        if (size < 0) {
                            codec.queueInputBuffer(
                                    in, 0, 0, 0, MediaCodec.BUFFER_FLAG_END_OF_STREAM);
                            inputDone = true;
                        } else {
                            codec.queueInputBuffer(in, 0, size, extractor.getSampleTime(), 0);
                            extractor.advance();
                        }
                    }
                }
                int out = codec.dequeueOutputBuffer(info, 10_000);
                if (out == MediaCodec.INFO_OUTPUT_FORMAT_CHANGED) {
                    MediaFormat now = codec.getOutputFormat();
                    channels = now.getInteger(MediaFormat.KEY_CHANNEL_COUNT);
                    if (now.containsKey("pcm-encoding")) encoding = now.getInteger("pcm-encoding");
                    int nowRate = now.getInteger(MediaFormat.KEY_SAMPLE_RATE);
                    if (nowRate != rate && length == 0) {
                        rate = nowRate;
                        mono = new float[rate * seconds];
                    }
                } else if (out >= 0) {
                    ByteBuffer pcm = codec.getOutputBuffer(out);
                    if (pcm != null && info.size > 0 && Downmix.bytesPerSample(encoding) > 0) {
                        if (startUs < 0) startUs = info.presentationTimeUs;
                        ByteBuffer b = pcm.duplicate().order(ByteOrder.LITTLE_ENDIAN);
                        b.position(info.offset);
                        b.limit(info.offset + info.size);
                        int frame = Downmix.bytesPerSample(encoding) * channels;
                        while (b.remaining() >= frame && length < mono.length) {
                            float sum = 0;
                            for (int c = 0; c < channels; c++) sum += Downmix.read(b, encoding);
                            mono[length++] = sum / channels;
                        }
                    }
                    codec.releaseOutputBuffer(out, false);
                    if ((info.flags & MediaCodec.BUFFER_FLAG_END_OF_STREAM) != 0) break;
                }
            }
            if (length < rate * Math.min(10, least))
                throw new IOException("Too little audio decoded");
            return new SoundCheck.Pcm(mono, length, rate, Math.max(0, startUs));
        } finally {
            if (codec != null)
                try {
                    codec.stop();
                } catch (RuntimeException ignored) {
                    // Already stopped.
                } finally {
                    codec.release();
                }
            extractor.release();
        }
    }

    /** The file as the extractor reads it, through the playback reader. */
    static final class Source extends MediaDataSource {
        final TelegramBridge bridge;
        final String url;
        NativeAudio.Reader reader;
        long size = -1;

        Source(TelegramBridge bridge, String url) throws IOException {
            this.bridge = bridge;
            this.url = url;
            open(0);
            size = reader.total;
        }

        private void open(long position) throws IOException {
            if (reader != null) reader.close();
            reader = null;
            reader = bridge.audio.open(url, position, -1);
        }

        @Override
        public int readAt(long position, byte[] buffer, int offset, int length) throws IOException {
            if (position >= size) return -1;
            if (reader.position != position) open(position);
            int read = reader.read(buffer, offset, length);
            return read <= 0 ? -1 : read;
        }

        @Override
        public long getSize() {
            return size;
        }

        @Override
        public void close() {
            if (reader != null) reader.close();
            reader = null;
        }
    }
}
