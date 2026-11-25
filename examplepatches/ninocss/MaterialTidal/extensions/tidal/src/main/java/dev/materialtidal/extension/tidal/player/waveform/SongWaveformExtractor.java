package dev.materialtidal.extension.tidal.player.waveform;

import android.content.Context;
import android.media.MediaCodec;
import android.media.MediaDataSource;
import android.media.MediaExtractor;
import android.media.MediaFormat;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Base64;
import android.util.Log;
import android.util.LruCache;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import java.util.HashSet;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import dev.materialtidal.extension.tidal.theme.MaterialYouConfig;

/**
 * Resolves the playing TIDAL track's audio stream (LOW/HIGH AAC MP4), decodes its
 * audio envelope in-memory into 64 canonical waveform bins, and caches results
 * across RAM + disk (`mt_waveforms_v1`).
 */
public final class SongWaveformExtractor {

    private static final String TAG = "MaterialTidalWave";
    private static final String CACHE_DIR_NAME = "mt_waveforms_v1";
    private static final byte[] MAGIC = new byte[]{'M', 'T', 'W', 'F', 1};
    private static final int MAX_DOWNLOAD_BYTES = 18 * 1024 * 1024;
    private static final int MAX_DISK_CACHE_FILES = 600;
    private static final long MAX_DECODE_WALL_MS = 12_000L;

    public interface Callback {
        void onWaveformReady(String trackKey, float[] canonical64, boolean isRealAudio);
    }

    private static final Handler MAIN_HANDLER = new Handler(Looper.getMainLooper());
    private static final LruCache<String, float[]> MEMORY_CACHE = new LruCache<>(160);
    private static final Set<String> IN_FLIGHT = new HashSet<>();
    private static final ExecutorService EXECUTOR = Executors.newSingleThreadExecutor(r -> {
        Thread t = new Thread(r, "MaterialTidal-Waveform");
        t.setPriority(Thread.MIN_PRIORITY + 1);
        t.setDaemon(true);
        return t;
    });

    private static volatile String latestRequestedKey = "";

    private SongWaveformExtractor() {}

    /**
     * Called when the active track changes (even from the Mini-Player) so the real waveform
     * is decoded and cached in the background before the user opens the Fullscreen player.
     */
    public static void prewarmCurrentTrackIfEnabled(Context context) {
        if (context == null || !MaterialYouConfig.isPlayerWaveformSeekbarEnabled()) {
            return;
        }
        String trackId = SongWaveformBridge.fetchActiveTrackId();
        if (trackId == null || trackId.trim().isEmpty()) {
            return;
        }
        requestWaveform(context.getApplicationContext(), trackId.trim(), "id:" + trackId.trim(), null, 0L, true, null);
    }

    /**
     * Checks RAM cache synchronously. Returns null if not yet cached in memory.
     */
    public static float[] getCachedEnvelope(String trackId, String trackKey) {
        synchronized (MEMORY_CACHE) {
            if (trackId != null && !trackId.isEmpty()) {
                float[] hit = MEMORY_CACHE.get(trackId);
                if (hit != null) {
                    return hit;
                }
            }
            if (trackKey != null && !trackKey.isEmpty()) {
                return MEMORY_CACHE.get(trackKey);
            }
        }
        return null;
    }

    /**
     * Requests waveform extraction for a song. Never blocks the calling UI thread.
     */
    public static void requestWaveform(
            Context context,
            String trackId,
            String trackKey,
            String title,
            long durationMs,
            boolean allowNetworkDecode,
            Callback callback) {
        if (context == null) {
            return;
        }
        final Context appCtx = context.getApplicationContext();
        final String cleanId = trackId != null ? trackId.trim() : "";
        final String resolvedKey = (trackKey != null && !trackKey.trim().isEmpty())
                ? trackKey.trim()
                : (!cleanId.isEmpty() ? "id:" + cleanId : (title != null ? title.trim() : ""));
        if (resolvedKey.isEmpty() && cleanId.isEmpty()) {
            return;
        }

        final String cachePrimaryKey = !cleanId.isEmpty() ? cleanId : resolvedKey;
        float[] memHit = getCachedEnvelope(cleanId, resolvedKey);
        if (memHit != null) {
            if (callback != null) {
                MAIN_HANDLER.post(() -> callback.onWaveformReady(resolvedKey, memHit, true));
            }
            return;
        }

        latestRequestedKey = resolvedKey;
        synchronized (IN_FLIGHT) {
            if (IN_FLIGHT.contains(cachePrimaryKey)) {
                return;
            }
            IN_FLIGHT.add(cachePrimaryKey);
        }

        EXECUTOR.execute(() -> {
            try {
                // 1. Check persistent binary disk cache first
                float[] diskHit = readDiskCache(appCtx, cachePrimaryKey);
                if (diskHit != null) {
                    putMemoryCache(cleanId, resolvedKey, diskHit);
                    postReady(callback, resolvedKey, diskHit, true);
                    return;
                }

                // 2. Skip decode if caller is transient preview or track ID unavailable
                String effectiveId = !cleanId.isEmpty() ? cleanId : SongWaveformBridge.fetchActiveTrackId();
                if (!allowNetworkDecode || effectiveId == null || effectiveId.trim().isEmpty()) {
                    return;
                }
                effectiveId = effectiveId.trim();

                // Re-check disk cache with resolved track ID if it wasn't provided initially
                if (cleanId.isEmpty()) {
                    float[] altDiskHit = readDiskCache(appCtx, effectiveId);
                    if (altDiskHit != null) {
                        putMemoryCache(effectiveId, resolvedKey, altDiskHit);
                        postReady(callback, resolvedKey, altDiskHit, true);
                        return;
                    }
                }

                // 3. Resolve TIDAL playback stream URL (LOW 96kbps AAC first for tiny ~2-3 MB decode)
                String[] auth = SongWaveformBridge.fetchAuthSnapshot();
                if (auth == null || auth.length < 1 || auth[0] == null || auth[0].isEmpty()) {
                    return;
                }
                String streamUrl = resolveStreamUrl(effectiveId, auth);
                if (streamUrl == null || streamUrl.isEmpty()) {
                    return;
                }

                // Bail out early if the user has already skipped away
                if (!resolvedKey.equals(latestRequestedKey) && !("id:" + effectiveId).equals(latestRequestedKey)) {
                    return;
                }

                byte[] audioBytes = downloadBounded(streamUrl, resolvedKey, effectiveId);
                if (audioBytes == null || audioBytes.length < 4096) {
                    return;
                }

                float[] canonical = decodeAudioEnvelope(audioBytes);
                if (canonical == null || canonical.length != SongWaveformAnalyzer.CANONICAL_BINS) {
                    return;
                }

                putMemoryCache(effectiveId, resolvedKey, canonical);
                writeDiskCache(appCtx, effectiveId, canonical);
                postReady(callback, resolvedKey, canonical, true);
            } catch (Throwable t) {
                Log.d(TAG, "Waveform extract skipped/failed: " + t.getMessage());
            } finally {
                synchronized (IN_FLIGHT) {
                    IN_FLIGHT.remove(cachePrimaryKey);
                }
            }
        });
    }

    private static void putMemoryCache(String trackId, String trackKey, float[] canonical) {
        synchronized (MEMORY_CACHE) {
            if (trackId != null && !trackId.isEmpty()) {
                MEMORY_CACHE.put(trackId, canonical);
            }
            if (trackKey != null && !trackKey.isEmpty()) {
                MEMORY_CACHE.put(trackKey, canonical);
            }
        }
    }

    private static void postReady(Callback cb, String trackKey, float[] canonical, boolean isReal) {
        if (cb != null) {
            MAIN_HANDLER.post(() -> cb.onWaveformReady(trackKey, canonical, isReal));
        }
    }

    private static String resolveStreamUrl(String trackId, String[] auth) {
        String[] qualities = new String[]{"LOW", "HIGH"};
        String accessToken = auth[0];
        String clientToken = auth.length > 1 ? auth[1] : null;
        String countryCode = (auth.length > 2 && auth[2] != null && !auth[2].isEmpty()) ? auth[2] : "US";

        for (String quality : qualities) {
            HttpURLConnection conn = null;
            try {
                String urlStr = "https://api.tidal.com/v1/tracks/"
                        + URLEncoder.encode(trackId, "UTF-8")
                        + "/playbackinfopostpaywall?audioquality=" + quality
                        + "&playbackmode=STREAM&assetpresentation=FULL&countryCode="
                        + URLEncoder.encode(countryCode, "UTF-8");
                conn = (HttpURLConnection) new URL(urlStr).openConnection();
                conn.setRequestMethod("GET");
                conn.setConnectTimeout(6000);
                conn.setReadTimeout(6000);
                conn.setRequestProperty("Authorization", "Bearer " + accessToken);
                if (clientToken != null && !clientToken.isEmpty()) {
                    conn.setRequestProperty("X-Tidal-Token", clientToken);
                }
                conn.setRequestProperty("Accept", "application/json");
                int code = conn.getResponseCode();
                if (code < 200 || code >= 300) {
                    continue;
                }
                String body = readUtf8Stream(conn.getInputStream(), 256 * 1024);
                JSONObject json = new JSONObject(body);
                String mime = json.optString("manifestMimeType", "");
                String b64 = json.optString("manifest", "");
                if (!mime.contains("bts") || b64.isEmpty()) {
                    continue;
                }
                String decodedManifest = new String(Base64.decode(b64, Base64.DEFAULT), StandardCharsets.UTF_8);
                JSONObject manifestJson = new JSONObject(decodedManifest);
                JSONArray urls = manifestJson.optJSONArray("urls");
                if (urls != null && urls.length() > 0) {
                    String candidate = urls.optString(0, "");
                    if (candidate.startsWith("http")) {
                        return candidate;
                    }
                }
            } catch (Throwable ignored) {
            } finally {
                if (conn != null) {
                    conn.disconnect();
                }
            }
        }
        return null;
    }

    private static byte[] downloadBounded(String streamUrl, String expectedKey, String effectiveId) {
        HttpURLConnection conn = null;
        try {
            conn = (HttpURLConnection) new URL(streamUrl).openConnection();
            conn.setRequestMethod("GET");
            conn.setConnectTimeout(7000);
            conn.setReadTimeout(9000);
            int code = conn.getResponseCode();
            if (code < 200 || code >= 300) {
                return null;
            }
            int contentLength = conn.getContentLength();
            if (contentLength > MAX_DOWNLOAD_BYTES) {
                return null;
            }
            int initCap = contentLength > 0 ? Math.min(contentLength, MAX_DOWNLOAD_BYTES) : (512 * 1024);
            ByteArrayOutputStream baos = new ByteArrayOutputStream(initCap);
            byte[] buf = new byte[16384];
            try (InputStream is = conn.getInputStream()) {
                int read;
                int total = 0;
                while ((read = is.read(buf)) != -1) {
                    // Abort immediately if the user moved to a different song
                    String latest = latestRequestedKey;
                    if (!latest.isEmpty() && !latest.equals(expectedKey) && !latest.equals("id:" + effectiveId)) {
                        return null;
                    }
                    total += read;
                    if (total > MAX_DOWNLOAD_BYTES) {
                        return null;
                    }
                    baos.write(buf, 0, read);
                }
            }
            return baos.toByteArray();
        } catch (Throwable t) {
            return null;
        } finally {
            if (conn != null) {
                conn.disconnect();
            }
        }
    }

    private static float[] decodeAudioEnvelope(byte[] audioBytes) {
        MediaExtractor extractor = null;
        MediaCodec codec = null;
        try {
            extractor = new MediaExtractor();
            extractor.setDataSource(new ByteArrayMediaDataSource(audioBytes));
            int trackIndex = -1;
            MediaFormat audioFormat = null;
            int trackCount = extractor.getTrackCount();
            for (int i = 0; i < trackCount; i++) {
                MediaFormat fmt = extractor.getTrackFormat(i);
                String mime = fmt.getString(MediaFormat.KEY_MIME);
                if (mime != null && mime.startsWith("audio/")) {
                    trackIndex = i;
                    audioFormat = fmt;
                    break;
                }
            }
            if (trackIndex < 0 || audioFormat == null) {
                return null;
            }
            extractor.selectTrack(trackIndex);
            String mime = audioFormat.getString(MediaFormat.KEY_MIME);
            if (mime == null) {
                return null;
            }
            int sampleRate = audioFormat.containsKey(MediaFormat.KEY_SAMPLE_RATE)
                    ? audioFormat.getInteger(MediaFormat.KEY_SAMPLE_RATE)
                    : 44100;
            int channels = audioFormat.containsKey(MediaFormat.KEY_CHANNEL_COUNT)
                    ? audioFormat.getInteger(MediaFormat.KEY_CHANNEL_COUNT)
                    : 2;

            codec = MediaCodec.createDecoderByType(mime);
            codec.configure(audioFormat, null, null, 0);
            codec.start();

            SongWaveformAnalyzer.EnvelopeAccumulator acc =
                    new SongWaveformAnalyzer.EnvelopeAccumulator(sampleRate, channels, 16384);
            MediaCodec.BufferInfo info = new MediaCodec.BufferInfo();
            boolean sawInputEos = false;
            boolean sawOutputEos = false;
            long deadlineMs = SystemClock.uptimeMillis() + MAX_DECODE_WALL_MS;

            while (!sawOutputEos && SystemClock.uptimeMillis() < deadlineMs) {
                if (!sawInputEos) {
                    int inIdx = codec.dequeueInputBuffer(2500L);
                    if (inIdx >= 0) {
                        ByteBuffer inBuf = codec.getInputBuffer(inIdx);
                        if (inBuf != null) {
                            int sampleSize = extractor.readSampleData(inBuf, 0);
                            if (sampleSize < 0) {
                                codec.queueInputBuffer(inIdx, 0, 0, 0L, MediaCodec.BUFFER_FLAG_END_OF_STREAM);
                                sawInputEos = true;
                            } else {
                                long pts = extractor.getSampleTime();
                                codec.queueInputBuffer(inIdx, 0, sampleSize, pts, 0);
                                extractor.advance();
                            }
                        }
                    }
                }

                int outIdx = codec.dequeueOutputBuffer(info, 2500L);
                if (outIdx >= 0) {
                    if ((info.flags & MediaCodec.BUFFER_FLAG_END_OF_STREAM) != 0) {
                        sawOutputEos = true;
                    }
                    if (info.size > 0) {
                        ByteBuffer outBuf = codec.getOutputBuffer(outIdx);
                        if (outBuf != null) {
                            acc.acceptPcm16(outBuf, info.offset, info.size);
                        }
                    }
                    codec.releaseOutputBuffer(outIdx, false);
                }
            }
            return acc.buildCanonicalEnvelope();
        } catch (Throwable t) {
            return null;
        } finally {
            if (codec != null) {
                try {
                    codec.stop();
                } catch (Throwable ignored) {}
                try {
                    codec.release();
                } catch (Throwable ignored) {}
            }
            if (extractor != null) {
                try {
                    extractor.release();
                } catch (Throwable ignored) {}
            }
        }
    }

    private static float[] readDiskCache(Context ctx, String key) {
        if (ctx == null || key == null || key.isEmpty()) {
            return null;
        }
        File file = getCacheFile(ctx, key);
        if (!file.isFile() || file.length() != MAGIC.length + SongWaveformAnalyzer.CANONICAL_BINS) {
            return null;
        }
        byte[] raw = new byte[MAGIC.length + SongWaveformAnalyzer.CANONICAL_BINS];
        try (FileInputStream fis = new FileInputStream(file)) {
            int offset = 0;
            while (offset < raw.length) {
                int n = fis.read(raw, offset, raw.length - offset);
                if (n < 0) return null;
                offset += n;
            }
            for (int i = 0; i < MAGIC.length; i++) {
                if (raw[i] != MAGIC[i]) return null;
            }
            byte[] payload = new byte[SongWaveformAnalyzer.CANONICAL_BINS];
            System.arraycopy(raw, MAGIC.length, payload, 0, payload.length);
            return SongWaveformAnalyzer.dequantizeFromBytes(payload);
        } catch (Throwable t) {
            return null;
        }
    }

    private static void writeDiskCache(Context ctx, String key, float[] canonical) {
        if (ctx == null || key == null || key.isEmpty() || canonical == null
                || canonical.length != SongWaveformAnalyzer.CANONICAL_BINS) {
            return;
        }
        try {
            File dir = new File(ctx.getCacheDir(), CACHE_DIR_NAME);
            if (!dir.exists() && !dir.mkdirs()) {
                return;
            }
            pruneCacheDirIfNeeded(dir);
            File target = getCacheFile(ctx, key);
            byte[] payload = SongWaveformAnalyzer.quantizeToBytes(canonical);
            try (FileOutputStream fos = new FileOutputStream(target)) {
                fos.write(MAGIC);
                fos.write(payload);
                fos.flush();
            }
        } catch (Throwable ignored) {}
    }

    private static void pruneCacheDirIfNeeded(File dir) {
        File[] files = dir.listFiles();
        if (files == null || files.length <= MAX_DISK_CACHE_FILES) {
            return;
        }
        // Delete oldest ~15% when overflowing cap
        java.util.Arrays.sort(files, (a, b) -> Long.compare(a.lastModified(), b.lastModified()));
        int toDelete = files.length - (MAX_DISK_CACHE_FILES - 80);
        for (int i = 0; i < toDelete && i < files.length; i++) {
            files[i].delete();
        }
    }

    private static File getCacheFile(Context ctx, String key) {
        File dir = new File(ctx.getCacheDir(), CACHE_DIR_NAME);
        String safe = key.replaceAll("[^a-zA-Z0-9._-]", "_");
        if (safe.length() > 64) {
            safe = safe.substring(0, 48) + "_" + Integer.toHexString(key.hashCode());
        }
        return new File(dir, safe + ".wf");
    }

    private static String readUtf8Stream(InputStream is, int maxBytes) throws Exception {
        ByteArrayOutputStream baos = new ByteArrayOutputStream(4096);
        byte[] buf = new byte[4096];
        int total = 0;
        int n;
        while ((n = is.read(buf)) != -1) {
            total += n;
            if (total > maxBytes) break;
            baos.write(buf, 0, n);
        }
        return baos.toString("UTF-8");
    }

    private static final class ByteArrayMediaDataSource extends MediaDataSource {
        private final byte[] data;

        ByteArrayMediaDataSource(byte[] data) {
            this.data = data;
        }

        @Override
        public int readAt(long position, byte[] buffer, int offset, int size) {
            if (position < 0 || position >= data.length) {
                return -1;
            }
            int avail = (int) Math.min(size, data.length - position);
            System.arraycopy(data, (int) position, buffer, offset, avail);
            return avail;
        }

        @Override
        public long getSize() {
            return data.length;
        }

        @Override
        public void close() {}
    }
}
