package app.jimaku.extension.settings;

import android.content.Context;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.function.Supplier;

import app.jimaku.extension.JimakuLog;
import app.jimaku.extension.Languages;
import app.jimaku.extension.session.VideoSession;
import app.jimaku.extension.subtitles.Line;

/**
 * Standard results, kept in a folder of Jimaku's own in the app's files, as the extension keeps them
 * in the browser ({@code keep} in {@code lib/store.ts}): 50 within 8 MiB, the newest first, the
 * oldest out first. Each result counts its key and its document's JSON. One too big to keep still
 * shows from memory. The original's language marker goes with its document, and leaves with it.
 * <p>
 * An index file lists the results, so a video's languages are known without reading any document.
 * Calls block on the file system; run them off the main thread.
 */
public final class KeptResults implements VideoSession.Kept {
    public static final int RESULTS = 50;
    public static final long BYTES = 8L * 1024 * 1024;
    private static final String INDEX = "index.json";

    private static final class Entry {
        final String key;
        final long bytes;
        final boolean original;

        Entry(String key, long bytes, boolean original) {
            this.key = key;
            this.bytes = bytes;
            this.original = original;
        }
    }

    private final Supplier<File> folder;
    /** The index as last read or written, newest first; null until read. */
    private List<Entry> index;

    /** {@code context} gives the app's context once YouTube has one, or null before. */
    public static KeptResults of(Supplier<Context> context) {
        return new KeptResults(() -> {
            Context found = context.get();
            return found == null ? null : new File(found.getFilesDir(), "jimaku-results");
        });
    }

    KeptResults(Supplier<File> folder) {
        this.folder = folder;
    }

    private static String keyFor(String video, String lang) {
        return "captions:" + video + ":" + lang;
    }

    @Override
    public synchronized List<String> languages(String video) {
        String prefix = keyFor(video, "");
        List<String> found = new ArrayList<>();
        for (Entry entry : index()) {
            if (!entry.key.startsWith(prefix)) continue;
            String lang = entry.key.substring(prefix.length());
            if (Languages.isLanguageCode(lang)) found.add(lang);
        }
        return found;
    }

    @Override
    public synchronized String originalLanguage(String video) {
        String prefix = keyFor(video, "");
        for (Entry entry : index()) {
            if (!entry.original || !entry.key.startsWith(prefix)) continue;
            String lang = entry.key.substring(prefix.length());
            if (Languages.isLanguageCode(lang)) return lang;
        }
        return null;
    }

    @Override
    public synchronized List<Line> get(String video, String lang) {
        File file = file(keyFor(video, lang));
        if (file == null || !file.isFile()) return null;
        try {
            Object stored = new JSONTokener(new String(Files.readAllBytes(file.toPath()), StandardCharsets.UTF_8)).nextValue();
            JSONArray lines = stored instanceof JSONObject document ? document.optJSONArray("lines") : stored instanceof JSONArray array ? array : null;
            return lines != null ? lines(lines) : null;
        } catch (IOException | JSONException e) {
            JimakuLog.warn("A kept result for " + video + " can't be read: " + e);
            return null;
        }
    }

    @Override
    public synchronized boolean keep(String video, String lang, List<Line> lines, boolean original) {
        File dir = folder.get();
        if (dir == null) return false;
        String key = keyFor(video, lang);
        String document;
        try {
            JSONArray array = new JSONArray();
            for (Line line : lines) array.put(new JSONObject().put("start", line.start).put("end", line.end).put("text", line.text));
            document = original ? new JSONObject().put("lines", array).put("original", true).toString() : array.toString();
        } catch (JSONException e) {
            return false;
        }
        long bytes = (key + document).getBytes(StandardCharsets.UTF_8).length;
        if (bytes > BYTES) return false;

        List<Entry> kept = new ArrayList<>();
        for (Entry entry : index()) if (!entry.key.equals(key)) kept.add(entry);
        List<Entry> dropped = new ArrayList<>();
        while (kept.size() > RESULTS - 1) dropped.add(kept.remove(kept.size() - 1));
        long used = 0;
        for (Entry entry : kept) used += entry.bytes;
        while (used + bytes > BYTES && !kept.isEmpty()) {
            Entry oldest = kept.remove(kept.size() - 1);
            used -= oldest.bytes;
            dropped.add(oldest);
        }
        kept.add(0, new Entry(key, bytes, original));
        try {
            if (!dir.isDirectory() && !dir.mkdirs()) return false;
            write(file(key), document);
            for (Entry gone : dropped) {
                File old = file(gone.key);
                if (old != null && old.exists() && !old.delete()) JimakuLog.warn("A kept result could not be removed: " + gone.key);
            }
            write(new File(dir, INDEX), indexJson(kept));
        } catch (IOException | JSONException e) {
            JimakuLog.warn("Keeping " + key + " failed: " + e);
            index = null;
            return false;
        }
        index = kept;
        return true;
    }

    private List<Entry> index() {
        if (index != null) return index;
        File dir = folder.get();
        if (dir == null) return Collections.emptyList();
        List<Entry> read = new ArrayList<>();
        File file = new File(dir, INDEX);
        if (file.isFile()) {
            try {
                JSONArray entries = new JSONArray(new String(Files.readAllBytes(file.toPath()), StandardCharsets.UTF_8));
                for (int i = 0; i < entries.length(); i++) {
                    JSONObject entry = entries.optJSONObject(i);
                    String key = entry != null ? entry.optString("key", "") : "";
                    if (!key.startsWith("captions:")) continue;
                    read.add(new Entry(key, entry.optLong("bytes", 0), entry.optBoolean("original", false)));
                }
            } catch (IOException | JSONException e) {
                JimakuLog.warn("The kept results' index can't be read: " + e);
            }
        }
        index = read;
        return read;
    }

    private File file(String key) {
        File dir = folder.get();
        if (dir == null) return null;
        // Video IDs and language codes are letters, digits, - and _ only.
        return new File(dir, key.substring("captions:".length()).replace(':', '.') + ".json");
    }

    private static String indexJson(List<Entry> entries) throws JSONException {
        JSONArray array = new JSONArray();
        for (Entry entry : entries) array.put(new JSONObject().put("key", entry.key).put("bytes", entry.bytes).put("original", entry.original));
        return array.toString();
    }

    /** Written beside the file and moved into place, so a write cut short leaves the old one whole. */
    private static void write(File file, String text) throws IOException {
        File partial = new File(file.getPath() + ".part");
        try (FileOutputStream out = new FileOutputStream(partial)) {
            out.write(text.getBytes(StandardCharsets.UTF_8));
            out.getFD().sync();
        }
        if (!partial.renameTo(file)) {
            Files.move(partial.toPath(), file.toPath(), java.nio.file.StandardCopyOption.REPLACE_EXISTING);
        }
    }

    private static List<Line> lines(JSONArray array) {
        List<Line> lines = new ArrayList<>();
        for (int i = 0; i < array.length(); i++) {
            JSONObject line = array.optJSONObject(i);
            if (line == null || !line.has("start") || !line.has("end")) return null;
            Object text = line.opt("text");
            if (!(text instanceof String words)) return null;
            lines.add(new Line(line.optDouble("start"), line.optDouble("end"), words));
        }
        return lines;
    }
}
