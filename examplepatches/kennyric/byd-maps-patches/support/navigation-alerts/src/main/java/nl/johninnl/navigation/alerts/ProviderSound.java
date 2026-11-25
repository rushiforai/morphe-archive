package nl.johninnl.navigation.alerts;

import android.content.Context;
import android.content.res.AssetManager;
import android.media.MediaCodec;
import android.media.MediaDataSource;
import android.media.MediaExtractor;
import android.media.MediaFormat;
import android.os.SystemClock;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.ShortBuffer;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * The provider's own alert sound for an announcement (Flitsmeister's camera, zone or incident
 * signal). The file is read at runtime from the installed provider app and decoded to PCM, so
 * nothing is bundled or redistributed. Unavailable files, codecs or apps yield null and the
 * receiver keeps its own fallback.
 */
public final class ProviderSound {
    public static final String FLITSMEISTER = "nl.flitsmeister";
    static final int MAX_FILE_BYTES = 1 << 20, MAX_SECONDS = 8, CACHE_SIZE = 16;
    static final long RETRY_MS = 60000;

    private ProviderSound() {}

    /** Interleaved 16-bit PCM. */
    public static final class Pcm {
        public final short[] samples;
        public final int rate, channels;
        public Pcm(short[] samples, int rate, int channels) {
            if (samples == null || samples.length == 0 || rate < 8000 || rate > 96000 || channels < 1 || channels > 2
                    || samples.length % channels != 0) throw new IllegalArgumentException("PCM");
            this.samples = samples; this.rate = rate; this.channels = channels;
        }
        public int frames() { return samples.length / channels; }
    }

    /** Plain asset file names only: no directories, no traversal, known containers. */
    public static boolean validName(String name) {
        return name != null && name.matches("[a-z0-9_]{1,64}\\.(m4a|mp3|wav)");
    }

    /** The announcement's provider sound, or null when it has none. */
    public static String name(WarningEvent event) {
        return event == null || event.nativeSound.isEmpty() ? null : event.nativeSound;
    }

    private static final Map<String, Pcm> CACHE = new LinkedHashMap<>(16, 0.75f, true);
    private static final Map<String, Long> FAILED = new LinkedHashMap<>();
    private static volatile Decoder decoder = ProviderSound::decode;

    interface Decoder { Pcm decode(byte[] encoded) throws IOException; }

    /** Blocking: call off the main thread. */
    public static Pcm load(Context context, String provider, String name) {
        if (context == null || provider == null || !validName(name)) return null;
        String key = provider + "/" + name;
        long now = SystemClock.elapsedRealtime();
        synchronized (CACHE) {
            Pcm hit = CACHE.get(key);
            if (hit != null) return hit;
            Long failedAt = FAILED.get(key);
            if (failedAt != null && now - failedAt < RETRY_MS) return null;
        }
        Pcm pcm;
        try {
            byte[] bytes = read(context.createPackageContext(provider, 0).getAssets(), "audio/" + name);
            pcm = bytes == null ? null : decoder.decode(bytes);
        } catch (Exception unavailable) { pcm = null; }
        synchronized (CACHE) {
            if (pcm == null) {
                if (FAILED.size() >= 64) FAILED.remove(FAILED.keySet().iterator().next());
                FAILED.put(key, now);
            } else {
                FAILED.remove(key);
                CACHE.put(key, pcm);
                while (CACHE.size() > CACHE_SIZE) CACHE.remove(CACHE.keySet().iterator().next());
            }
        }
        return pcm;
    }

    /** Seed the cache with an already decoded sound (receiver tests and previews). */
    public static void remember(String provider, String name, Pcm pcm) {
        if (provider == null || !validName(name) || pcm == null) return;
        synchronized (CACHE) {
            CACHE.put(provider + "/" + name, pcm);
            while (CACHE.size() > CACHE_SIZE) CACHE.remove(CACHE.keySet().iterator().next());
        }
    }

    /** Non-blocking cache lookup. */
    public static Pcm cached(String provider, String name) {
        synchronized (CACHE) { return CACHE.get(provider + "/" + name); }
    }

    static byte[] read(AssetManager assets, String path) throws IOException {
        try (InputStream in = assets.open(path)) {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buffer = new byte[8192];
            for (int count; (count = in.read(buffer)) > 0; ) {
                if (out.size() + count > MAX_FILE_BYTES) return null;
                out.write(buffer, 0, count);
            }
            return out.size() == 0 ? null : out.toByteArray();
        }
    }

    static Pcm decode(byte[] encoded) throws IOException {
        MediaExtractor extractor = new MediaExtractor();
        MediaCodec codec = null;
        try {
            extractor.setDataSource(new Bytes(encoded));
            int track = -1; MediaFormat format = null;
            for (int i = 0; i < extractor.getTrackCount(); i++) {
                MediaFormat candidate = extractor.getTrackFormat(i);
                String mime = candidate.getString(MediaFormat.KEY_MIME);
                if (mime != null && mime.startsWith("audio/")) { track = i; format = candidate; break; }
            }
            if (track < 0) return null;
            extractor.selectTrack(track);
            int rate = format.getInteger(MediaFormat.KEY_SAMPLE_RATE), channels = format.getInteger(MediaFormat.KEY_CHANNEL_COUNT);
            codec = MediaCodec.createDecoderByType(format.getString(MediaFormat.KEY_MIME));
            codec.configure(format, null, null, 0);
            codec.start();
            MediaCodec.BufferInfo info = new MediaCodec.BufferInfo();
            ShortBuffer out = ShortBuffer.allocate(MAX_SECONDS * 96000 * 2);
            boolean inputDone = false, outputDone = false;
            long deadline = SystemClock.elapsedRealtime() + 3000;
            while (!outputDone && SystemClock.elapsedRealtime() < deadline) {
                if (!inputDone) {
                    int in = codec.dequeueInputBuffer(10000);
                    if (in >= 0) {
                        ByteBuffer buffer = codec.getInputBuffer(in);
                        int size = buffer == null ? -1 : extractor.readSampleData(buffer, 0);
                        if (size < 0) { codec.queueInputBuffer(in, 0, 0, 0, MediaCodec.BUFFER_FLAG_END_OF_STREAM); inputDone = true; }
                        else { codec.queueInputBuffer(in, 0, size, extractor.getSampleTime(), 0); extractor.advance(); }
                    }
                }
                int index = codec.dequeueOutputBuffer(info, 10000);
                if (index == MediaCodec.INFO_OUTPUT_FORMAT_CHANGED) {
                    MediaFormat actual = codec.getOutputFormat();
                    if (actual.containsKey(MediaFormat.KEY_PCM_ENCODING)
                            && actual.getInteger(MediaFormat.KEY_PCM_ENCODING) != android.media.AudioFormat.ENCODING_PCM_16BIT) return null;
                    rate = actual.getInteger(MediaFormat.KEY_SAMPLE_RATE); channels = actual.getInteger(MediaFormat.KEY_CHANNEL_COUNT);
                } else if (index >= 0) {
                    ByteBuffer buffer = codec.getOutputBuffer(index);
                    if (buffer != null && info.size > 0) {
                        buffer.position(info.offset); buffer.limit(info.offset + info.size);
                        ShortBuffer samples = buffer.slice().order(ByteOrder.nativeOrder()).asShortBuffer();
                        int room = Math.min(samples.remaining(), out.remaining());
                        for (int i = 0; i < room; i++) out.put(samples.get());
                    }
                    codec.releaseOutputBuffer(index, false);
                    if ((info.flags & MediaCodec.BUFFER_FLAG_END_OF_STREAM) != 0 || !out.hasRemaining()) outputDone = true;
                }
            }
            if (!outputDone || channels < 1 || channels > 2) return null;
            int limit = Math.min(out.position(), MAX_SECONDS * rate * channels);
            limit -= limit % channels;
            if (limit <= 0) return null;
            short[] pcm = new short[limit];
            out.flip(); out.get(pcm, 0, limit);
            return new Pcm(pcm, rate, channels);
        } catch (IllegalArgumentException | IllegalStateException invalid) {
            return null;
        } finally {
            if (codec != null) try { codec.stop(); } catch (RuntimeException ignored) { /* Released below. */ }
            if (codec != null) codec.release();
            extractor.release();
        }
    }

    private static final class Bytes extends MediaDataSource {
        private final byte[] data;
        Bytes(byte[] data) { this.data = data; }
        @Override public int readAt(long position, byte[] buffer, int offset, int size) {
            if (position >= data.length) return -1;
            int count = (int) Math.min(size, data.length - position);
            System.arraycopy(data, (int) position, buffer, offset, count);
            return count;
        }
        @Override public long getSize() { return data.length; }
        @Override public void close() {}
    }

    static void resetForTest(Decoder value) {
        synchronized (CACHE) { CACHE.clear(); FAILED.clear(); }
        decoder = value == null ? ProviderSound::decode : value;
    }
}
