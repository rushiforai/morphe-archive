package app.bitchord.telegram;

import org.json.JSONObject;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

/**
 * Bit depth, sample rate and channels of lossless Telegram files, read from the first bytes of each
 * file and remembered. Telegram doesn't report these, and they're what tells 16-bit from 24-bit
 * FLAC.
 */
final class FormatProbe {
    static final int HEAD_BYTES = 64 * 1024;
    static final int MAX_KNOWN = 3000;

    private final File store;

    /** Told when a header has been read, so legends on screen can update. */
    volatile Runnable onChange;

    private final Map<String, JSONObject> known =
            new LinkedHashMap<String, JSONObject>(16, 0.75f, true) {
                @Override
                protected boolean removeEldestEntry(Map.Entry<String, JSONObject> eldest) {
                    return size() > MAX_KNOWN;
                }
            };

    FormatProbe(File store) {
        this.store = store;
        try {
            if (store != null && store.isFile()) {
                JSONObject saved =
                        new JSONObject(
                                new String(
                                        java.nio.file.Files.readAllBytes(store.toPath()),
                                        java.nio.charset.StandardCharsets.UTF_8));
                for (java.util.Iterator<String> keys = saved.keys(); keys.hasNext(); ) {
                    String key = keys.next();
                    JSONObject value = saved.optJSONObject(key);
                    if (value != null) known.put(key, value);
                }
            }
        } catch (Exception ignored) {
            // A damaged cache is rebuilt as files are probed again.
        }
    }

    static boolean probable(JSONObject row) {
        // Its header was read when its zip or cue sheet was.
        if (row.has("zip") || row.has("cue")) return false;
        // From a shared index, not yet played on this phone: no file to read yet.
        if (row.optInt("file") == 0) return false;
        // Also the containers and Dolby files whose header says what the name can't: Atmos,
        // the channels, ALAC's bit depth.
        return format(row).matches("flac|wav|aiff?|m4a|mp4|ac3|eac3|ec3|ac4|mka");
    }

    static String format(JSONObject row) {
        return row.optString("format").toLowerCase(Locale.ROOT);
    }

    synchronized JSONObject get(String id) {
        return id == null ? null : known.get(id);
    }

    /**
     * Starts reading the headers of up to {@code max} unprobed lossless rows. Returns a latch that
     * opens when they're all done.
     */
    CountDownLatch probe(List<JSONObject> rows, Artwork.Download download, int max) {
        java.util.List<JSONObject> wanted = new java.util.ArrayList<>();
        for (JSONObject row : rows)
            if ((row.has("zip") || row.has("cue")) && row.optJSONObject("header") != null)
                record(row.optString("id"), row.optJSONObject("header"));
        for (JSONObject row : rows)
            if (wanted.size() < max && probable(row) && get(row.optString("id")) == null)
                wanted.add(row);
        CountDownLatch done = new CountDownLatch(wanted.size());
        for (JSONObject row : wanted) {
            String id = row.optString("id");
            download.start(
                    row.optInt("file"),
                    path -> {
                        try {
                            if (path != null) record(id, read(new File(path)));
                        } finally {
                            done.countDown();
                        }
                    });
        }
        return done;
    }

    /** Adds what's known to the rows: bits, rate and channels. */
    void annotate(List<JSONObject> rows) throws Exception {
        for (JSONObject row : rows) {
            JSONObject header = get(row.optString("id"));
            if (header == null) continue;
            row.put("bits", header.optInt("bits"))
                    .put("rate", header.optInt("rate"))
                    .put("channels", header.optInt("channels"));
            if (DolbyHeader.dolby(header.optString("codec")))
                row.put("codec", header.optString("codec"))
                        .put("atmos", header.optBoolean("atmos"));
        }
    }

    static void await(CountDownLatch latch, long millis) {
        try {
            latch.await(Math.max(0, millis), TimeUnit.MILLISECONDS);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
    }

    synchronized void record(String id, JSONObject header) {
        if (header == null || id.isEmpty()) return;
        known.put(id, header);
        save();
        Runnable listener = onChange;
        if (listener != null) listener.run();
    }

    synchronized void clear() {
        known.clear();
        if (store != null) store.delete();
    }

    private void save() {
        if (store == null) return;
        try {
            File part = new File(store.getPath() + ".part");
            java.nio.file.Files.write(
                    part.toPath(),
                    new JSONObject(known)
                            .toString()
                            .getBytes(java.nio.charset.StandardCharsets.UTF_8));
            if (!part.renameTo(store)) part.delete();
        } catch (Exception ignored) {
            // Only a cache.
        }
    }

    static JSONObject read(File file) {
        byte[] head = new byte[HEAD_BYTES];
        int length = 0;
        try (InputStream in = new FileInputStream(file)) {
            int n;
            while (length < head.length && (n = in.read(head, length, head.length - length)) > 0)
                length += n;
        } catch (Exception e) {
            return null;
        }
        return AudioHeader.parse(head, length);
    }
}
