package app.revanced.extension.rif;

import android.util.Log;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/**
 * Local copies of the separate sound files of inline videos (see InlineVideos.setMuted).
 * Streaming the sound over HTTP made Android's player pause for a refill several times a
 * second (heard as the sound cutting out), so the file is downloaded first and played from
 * disk. Lives in rif's cache dir, in {@code inline-audio/}: one {@code <sha1 of the URL>.mp4}
 * per sound, about 40 MB in all, trimmed oldest first. A download goes to a {@code .part}
 * file that is renamed when complete, one at a time on a background thread.
 */
final class SoundCache {

    private SoundCache() {}

    private static final String TAG = "RifInlineVideos";
    static final long MAX_FILE_BYTES = 25L * 1024 * 1024;
    static final long MAX_TOTAL_BYTES = 40L * 1024 * 1024;
    private static final long STALE_PART_MS = 60_000;
    private static final int CONNECT_TIMEOUT_MS = 10_000;
    private static final int READ_TIMEOUT_MS = 10_000;
    // A file's mtime (the trim order) is refreshed on use at most this often.
    private static final long TOUCH_MS = 60_000;

    /** Gets the result on the download thread: the file, or null with the reason it failed. */
    interface Callback {
        void done(File file, String error);
    }

    private static ThreadPoolExecutor executor;

    /** The folder for sound files under [cacheDir], created if missing; null if it can't be. */
    static File dir(File cacheDir) {
        if (cacheDir == null) return null;
        File d = new File(cacheDir, "inline-audio");
        return d.isDirectory() || d.mkdirs() ? d : null;
    }

    static String fileName(String url) {
        return InlineCache.sha1(url) + ".mp4";
    }

    /** The complete downloaded file for [url] in [dir], or null. */
    static File cached(File dir, String url) {
        if (dir == null) return null;
        File f = new File(dir, fileName(url));
        if (!f.isFile() || f.length() <= 0) return null;
        long now = System.currentTimeMillis();
        if (now - f.lastModified() > TOUCH_MS) f.setLastModified(now);
        return f;
    }

    /** Downloads [url] into [dir] on the background thread, then calls [cb] there. */
    static synchronized void download(File dir, String url, String userAgent, Callback cb) {
        if (executor == null) {
            executor = new ThreadPoolExecutor(1, 1, 30, TimeUnit.SECONDS, new LinkedBlockingQueue<Runnable>(),
                    r -> {
                        Thread t = new Thread(r, "RifSoundCache");
                        t.setDaemon(true);
                        return t;
                    });
            executor.allowCoreThreadTimeOut(true);
        }
        executor.execute(() -> {
            File part = new File(dir, fileName(url) + ".part");
            File result = null;
            String error = null;
            try {
                result = cached(dir, url); // queued twice (the same sound in two places)
                if (result == null) {
                    long start = System.currentTimeMillis();
                    File done = new File(dir, fileName(url));
                    long bytes = fetch(url, userAgent, part);
                    if (done.exists() && !done.delete()) throw new IOException("can't replace " + done);
                    if (!part.renameTo(done)) throw new IOException("can't rename " + part);
                    result = done;
                    Log.i(TAG, "sound cached: " + (bytes + 1023) / 1024 + " KB in "
                            + (System.currentTimeMillis() - start) + " ms");
                }
            } catch (Throwable t) {
                part.delete();
                result = null;
                error = t.getMessage() == null ? t.getClass().getSimpleName() : t.getMessage();
            }
            if (result != null) {
                try {
                    trim(dir, MAX_TOTAL_BYTES, System.currentTimeMillis());
                } catch (Throwable t) {
                    Log.w(TAG, "sound cache trim failed", t);
                }
            }
            try {
                cb.done(result, error);
            } catch (Throwable t) {
                Log.w(TAG, "sound download callback failed", t);
            }
        });
    }

    /** Saves [url] to [out]; returns its size. Throws if it fails or is over MAX_FILE_BYTES. */
    private static long fetch(String url, String userAgent, File out) throws IOException {
        HttpURLConnection conn = null;
        try {
            conn = (HttpURLConnection) new URL(url).openConnection();
            conn.setConnectTimeout(CONNECT_TIMEOUT_MS);
            conn.setReadTimeout(READ_TIMEOUT_MS);
            conn.setInstanceFollowRedirects(true);
            conn.setRequestProperty("User-Agent", userAgent);
            int code = conn.getResponseCode();
            if (code != HttpURLConnection.HTTP_OK) throw new IOException("HTTP " + code);
            int length = conn.getContentLength(); // -1 if unknown
            if (length > MAX_FILE_BYTES) throw new IOException("too big: " + length / 1024 + " KB");
            long total = 0;
            try (InputStream in = conn.getInputStream(); FileOutputStream os = new FileOutputStream(out)) {
                byte[] buf = new byte[32 * 1024];
                int n;
                while ((n = in.read(buf)) != -1) {
                    total += n;
                    if (total > MAX_FILE_BYTES) throw new IOException("too big: over " + MAX_FILE_BYTES / 1024 + " KB");
                    os.write(buf, 0, n);
                }
            }
            if (total == 0 || (length >= 0 && total != length)) throw new IOException("incomplete: " + total + " of " + length);
            return total;
        } finally {
            if (conn != null) conn.disconnect();
        }
    }

    /**
     * Deletes {@code .part} files older than a minute, then the oldest sound files until
     * those left total at most [maxBytes].
     */
    static void trim(File dir, long maxBytes, long now) {
        File[] files = dir.listFiles();
        if (files == null) return;
        long total = 0;
        ArrayList<File> sounds = new ArrayList<>();
        for (File f : files) {
            if (f.getName().endsWith(".part")) {
                if (now - f.lastModified() > STALE_PART_MS) f.delete();
            } else {
                sounds.add(f);
                total += f.length();
            }
        }
        File[] sorted = sounds.toArray(new File[0]);
        Arrays.sort(sorted, new Comparator<File>() {
            @Override
            public int compare(File a, File b) {
                return Long.compare(a.lastModified(), b.lastModified());
            }
        });
        for (File f : sorted) {
            if (total <= maxBytes) break;
            long len = f.length();
            if (f.delete()) total -= len;
        }
    }
}
