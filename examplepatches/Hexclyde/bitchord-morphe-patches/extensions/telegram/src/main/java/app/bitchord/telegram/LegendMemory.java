package app.bitchord.telegram;

import org.json.JSONObject;

import java.io.File;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Format legends of songs that have played in a lossless format, so the legend also shows in
 * BitChord's main search, library and queue, not only while the song is playing.
 */
final class LegendMemory {
    static final int MAX = 3000;

    private final File store;
    private final Map<String, String> labels =
            new LinkedHashMap<String, String>(16, 0.75f, true) {
                @Override
                protected boolean removeEldestEntry(Map.Entry<String, String> eldest) {
                    return size() > MAX;
                }
            };

    LegendMemory(File store) {
        this.store = store;
        try {
            if (store != null && store.isFile()) {
                JSONObject saved =
                        new JSONObject(
                                new String(
                                        Files.readAllBytes(store.toPath()),
                                        StandardCharsets.UTF_8));
                for (Iterator<String> keys = saved.keys(); keys.hasNext(); ) {
                    String key = keys.next();
                    labels.put(key, saved.optString(key));
                }
            }
        } catch (Exception ignored) {
            // Rebuilt as songs play.
        }
    }

    synchronized String get(String id) {
        String label = id == null ? null : labels.get(id);
        return label == null ? "" : label;
    }

    /**
     * Remembers a song's legend; true if it changed. "FLAC" doesn't replace a remembered "FLAC
     * 24bit" for the same song, since a source that didn't state the bit depth knows less.
     */
    synchronized boolean put(String id, String label) {
        if (id == null || id.isEmpty() || label == null || label.isEmpty()) return false;
        String old = labels.get(id);
        if (label.equals(old)) return false;
        if (old != null && !label.contains(" ") && old.startsWith(label + " ")) return false;
        labels.put(id, label);
        return true;
    }

    synchronized void clear() {
        labels.clear();
        if (store != null) store.delete();
    }

    synchronized void save() {
        if (store == null) return;
        try {
            File part = new File(store.getPath() + ".part");
            Files.write(
                    part.toPath(),
                    new JSONObject(labels).toString().getBytes(StandardCharsets.UTF_8));
            if (!part.renameTo(store)) part.delete();
        } catch (Exception ignored) {
            // Only a cache.
        }
    }
}
