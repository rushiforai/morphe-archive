package app.revanced.extension.rif;

import android.content.Context;
import android.util.Log;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.Arrays;
import java.util.Comparator;

/**
 * Disk cache for inline media (part of "Inline comment images"), so a comment's images,
 * album listings, resolved videos and video still frames show at once the next time, also
 * after rif restarts. Lives in rif's cache dir (the system may clear it), in
 * {@code revanced_inline/}: one file per entry, named by the SHA-1 of its key. Our own
 * cache rather than HttpResponseCache.install(), which is global and would affect rif.
 *
 * About 100 MB in all, trimmed least-recently-used first (a read touches the file). Text
 * entries (album listings, og:image results, resolved videos) expire after 7 days, empty
 * ones ("no image here") after 1 day; bytes entries (images, still frames) only by
 * trimming. Reads are safe on any thread but the main one and never wait for a write or a
 * trim; writes happen on the loader threads.
 */
final class InlineCache {

    private InlineCache() {}

    private static final String TAG = "RifInlineImages";
    private static final long MAX_BYTES = 100L * 1024 * 1024;
    private static final long TRIM_TO_BYTES = 80L * 1024 * 1024;
    private static final long TEXT_MAX_AGE_MS = 7L * 24 * 60 * 60 * 1000;
    private static final long EMPTY_TEXT_MAX_AGE_MS = 24L * 60 * 60 * 1000;
    // Reads touch a file's mtime (the trim order) at most this often.
    private static final long TOUCH_MS = 60_000;

    private static volatile File dir;
    // Total size of the cache files, or -1 until counted (on the first write). Guarded by
    // SIZE_LOCK, which only writers take (counting and trimming can take a while).
    private static final Object SIZE_LOCK = new Object();
    private static long size = -1;

    private static File dir() {
        File d = dir;
        if (d != null) return d;
        synchronized (InlineCache.class) {
            if (dir != null) return dir;
            Context ctx = Settings.context();
            if (ctx == null) return null;
            d = new File(ctx.getCacheDir(), "revanced_inline");
            if (!d.isDirectory() && !d.mkdirs()) return null;
            dir = d;
            return d;
        }
    }

    private static File file(String key) {
        File d = dir();
        return d == null ? null : new File(d, sha1(key));
    }

    /** The bytes stored under [key], or null. */
    static byte[] get(String key) {
        try {
            File f = file(key);
            if (f == null || !f.isFile()) return null;
            long len = f.length();
            if (len <= 0 || len > Integer.MAX_VALUE) return null;
            // Read to the end rather than trusting the length (a file can be replaced).
            ByteArrayOutputStream out = new ByteArrayOutputStream((int) len);
            try (FileInputStream in = new FileInputStream(f)) {
                byte[] buf = new byte[64 * 1024];
                int n;
                while ((n = in.read(buf)) != -1) out.write(buf, 0, n);
            }
            if (out.size() == 0) return null;
            byte[] data = out.toByteArray();
            long now = System.currentTimeMillis();
            if (now - f.lastModified() > TOUCH_MS) f.setLastModified(now);
            return data;
        } catch (Throwable t) {
            return null;
        }
    }

    /** True if something is stored under [key]. */
    static boolean has(String key) {
        File f = file(key);
        return f != null && f.isFile();
    }

    /** Stores [data] under [key] (written to a temp file, then renamed into place). */
    static void put(String key, byte[] data) {
        if (data == null || data.length == 0) return;
        try {
            File f = file(key);
            if (f == null) return;
            File parent = f.getParentFile();
            if (parent != null && !parent.isDirectory()) parent.mkdirs(); // the system cleared it
            File tmp = new File(f.getPath() + ".tmp" + Thread.currentThread().getId());
            try (FileOutputStream out = new FileOutputStream(tmp)) {
                out.write(data);
            }
            long old = f.isFile() ? f.length() : 0;
            if (!tmp.renameTo(f)) {
                tmp.delete();
                return;
            }
            added(data.length - old);
        } catch (Throwable t) {
            Log.w(TAG, "disk cache write failed (" + t + ")");
        }
    }

    /**
     * The text stored under [key] by putText, or null if absent or expired (7 days; 1 day
     * for an empty text, which callers store for "nothing here").
     */
    static String getText(String key) {
        byte[] data = get(key);
        if (data == null) return null;
        try {
            String s = new String(data, StandardCharsets.UTF_8);
            int nl = s.indexOf('\n');
            if (nl < 0) return null;
            long written = Long.parseLong(s.substring(0, nl));
            String text = s.substring(nl + 1);
            long maxAge = text.isEmpty() ? EMPTY_TEXT_MAX_AGE_MS : TEXT_MAX_AGE_MS;
            if (System.currentTimeMillis() - written > maxAge) return null;
            return text;
        } catch (Throwable t) {
            return null;
        }
    }

    static void putText(String key, String text) {
        if (text == null) return;
        put(key, (System.currentTimeMillis() + "\n" + text).getBytes(StandardCharsets.UTF_8));
    }

    /** Counts a write; trims the oldest files once the total passes the limit. */
    private static void added(long bytes) {
        File[] files;
        File dir = InlineCache.dir;
        synchronized (SIZE_LOCK) {
            if (size < 0) {
                size = 0;
                File[] all = dir == null ? null : dir.listFiles();
                if (all != null) for (File f : all) size += f.length();
            } else {
                size += bytes;
            }
            if (size <= MAX_BYTES || dir == null) return;
            files = dir.listFiles();
            if (files == null) return;
            // Recount while trimming; concurrent writes are counted again on their own.
            size = 0;
            for (File f : files) size += f.length();
            if (size <= MAX_BYTES) return;
            final long[] mtime = new long[files.length];
            final File[] sorted = files;
            for (int i = 0; i < sorted.length; i++) mtime[i] = sorted[i].lastModified();
            Integer[] order = new Integer[sorted.length];
            for (int i = 0; i < order.length; i++) order[i] = i;
            Arrays.sort(order, new Comparator<Integer>() { // minSdk 21: no comparingLong
                @Override
                public int compare(Integer a, Integer b) {
                    return Long.compare(mtime[a], mtime[b]);
                }
            });
            for (Integer i : order) {
                if (size <= TRIM_TO_BYTES) break;
                long len = sorted[i].length();
                if (sorted[i].delete()) size -= len;
            }
        }
    }

    static String sha1(String key) {
        try {
            byte[] digest = MessageDigest.getInstance("SHA-1").digest(key.getBytes(StandardCharsets.UTF_8));
            StringBuilder sb = new StringBuilder(digest.length * 2);
            for (byte b : digest) sb.append(String.format("%02x", b & 0xFF));
            return sb.toString();
        } catch (Exception e) {
            return Integer.toHexString(key.hashCode()) + "_" + key.length();
        }
    }
}
