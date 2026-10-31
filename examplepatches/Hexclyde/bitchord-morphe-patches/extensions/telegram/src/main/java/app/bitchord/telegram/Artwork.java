package app.bitchord.telegram;

import org.json.JSONObject;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

/**
 * Album covers from Telegram, copied into the app's own storage so BitChord can show them from a
 * file:// address. Telegram's cache can be cleared at any time; these copies stay until sign-out.
 */
final class Artwork {
    static final int MAX_FILES = 1000;
    static final long MAX_BYTES = 2L * 1024 * 1024;

    interface Download {
        /** Starts a download and calls back with the local path, or null if it failed. */
        void start(int file, Done done);
    }

    interface Done {
        void finished(String path);
    }

    private final File dir;

    Artwork(File dir) {
        this.dir = dir;
    }

    /** The cover's address if it's already been copied, otherwise null. */
    String cached(JSONObject row) {
        String key = row.optString("coverKey");
        if (dir == null || key.isEmpty() || row.optInt("cover") == 0) return null;
        File file = file(key);
        return file.isFile() ? "file://" + file.getAbsolutePath() : null;
    }

    /**
     * Adds artworkURL to rows that have a cover. Covers that aren't saved yet are downloaded, and
     * those that arrive within the time limit are used straight away. The rest are saved in the
     * background and show up in the next search.
     */
    void fill(List<JSONObject> rows, Download download, long waitMillis) throws Exception {
        if (dir == null || rows.isEmpty()) return;
        if (!dir.isDirectory() && !dir.mkdirs()) return;
        CountDownLatch pending = new CountDownLatch(rows.size());
        for (JSONObject row : rows) {
            if (cached(row) != null || row.optInt("cover") == 0) {
                pending.countDown();
                continue;
            }
            String key = row.optString("coverKey");
            download.start(
                    row.optInt("cover"),
                    path -> {
                        try {
                            if (path != null) save(new File(path), file(key));
                        } finally {
                            pending.countDown();
                        }
                    });
        }
        pending.await(Math.max(0, waitMillis), TimeUnit.MILLISECONDS);
        for (JSONObject row : rows) {
            String url = cached(row);
            if (url != null) row.put("artworkURL", url);
        }
    }

    void clear() {
        File[] files = dir == null ? null : dir.listFiles();
        if (files != null) for (File file : files) file.delete();
    }

    private File file(String key) {
        return new File(dir, "cover-" + hash(key) + ".jpg");
    }

    private synchronized void save(File from, File to) {
        if (to.isFile() || !from.isFile() || from.length() == 0 || from.length() > MAX_BYTES)
            return;
        File part = new File(to.getPath() + ".part");
        try (InputStream in = new FileInputStream(from);
                OutputStream out = new FileOutputStream(part)) {
            byte[] block = new byte[16 * 1024];
            int n;
            while ((n = in.read(block)) != -1) out.write(block, 0, n);
        } catch (Exception e) {
            part.delete();
            return;
        }
        if (!part.renameTo(to)) part.delete();
        trim();
    }

    private void trim() {
        File[] files = dir.listFiles((parent, name) -> name.endsWith(".jpg"));
        if (files == null || files.length <= MAX_FILES) return;
        Arrays.sort(files, Comparator.comparingLong(File::lastModified));
        for (int i = 0; i < files.length - MAX_FILES; i++) files[i].delete();
    }

    static String hash(String key) {
        try {
            byte[] digest =
                    MessageDigest.getInstance("SHA-256")
                            .digest(key.getBytes(StandardCharsets.UTF_8));
            StringBuilder hex = new StringBuilder();
            for (int i = 0; i < 16; i++) hex.append(String.format("%02x", digest[i]));
            return hex.toString();
        } catch (Exception e) {
            throw new IllegalStateException(e);
        }
    }
}
