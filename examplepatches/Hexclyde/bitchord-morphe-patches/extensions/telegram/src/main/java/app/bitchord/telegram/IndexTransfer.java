package app.bitchord.telegram;

import org.json.JSONObject;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.zip.GZIPInputStream;
import java.util.zip.GZIPOutputStream;

/**
 * Saved indexes as a file: for a backup, or for someone else in the same chat, whose phone can then
 * skip reading the chat from Telegram.
 *
 * <p>A gzip file of JSON lines: a header, then for each chat a line about it and one line per file.
 * Only what the index knows about each post is kept. Telegram's file numbers are left out: they
 * belong to one phone, and the post's own file is taken when a song plays.
 *
 * <p>A file someone else made is read strictly: only known fields, sensible sizes, and every file
 * in the chat its section names.
 */
final class IndexTransfer {
    private IndexTransfer() {}

    static final String INDEX = "bitchord-index", BACKUP = "bitchord-backup";
    static final int VERSION = 1;

    /** No index file holds more than this many files, or lines longer than this. */
    static final int MAX_FILES = 2_000_000, MAX_LINE = 64 * 1024;

    /** One chat's part of a file. */
    static final class Section {
        long chat, newest;
        String title = "";
        boolean complete;
        final List<JSONObject> rows = new ArrayList<>();
    }

    /** Where files come from when writing: a chat's rows, a page at a time. */
    interface Rows {
        List<JSONObject> after(long chat, long message, int limit) throws Exception;
    }

    /** Writes a header line, then each chat's section. */
    static void write(OutputStream out, JSONObject header, List<Section> chats, Rows rows)
            throws Exception {
        Writer w = new OutputStreamWriter(new GZIPOutputStream(out), StandardCharsets.UTF_8);
        w.write(header.toString());
        w.write('\n');
        for (Section s : chats) {
            w.write(
                    new JSONObject()
                            .put("chat", s.chat)
                            .put("title", s.title)
                            .put("newest", s.newest)
                            .put("complete", s.complete)
                            .toString());
            w.write('\n');
            // Pages of files after a message. A post's songs (a zip's) share its message, so a page
            // can end inside a post: the next starts at that post again, skipping what's written.
            long lastMessage = 0, lastEntry = -1;
            while (true) {
                List<JSONObject> page = rows.after(s.chat, Math.max(0, lastMessage - 1), 1000);
                boolean wrote = false;
                for (JSONObject row : page) {
                    long message = row.optLong("message"), entry = row.optLong("entry");
                    if (message < lastMessage || (message == lastMessage && entry <= lastEntry))
                        continue;
                    lastMessage = message;
                    lastEntry = entry;
                    wrote = true;
                    JSONObject clean = clean(row, s.chat);
                    if (clean != null) {
                        w.write(clean.toString());
                        w.write('\n');
                    }
                }
                if (!wrote || page.size() < 1000) break;
            }
            w.write("{\"end\":true}\n");
        }
        w.flush();
        w.close();
    }

    /** The header of a file and its sections. */
    static final class Contents {
        JSONObject header;
        final List<Section> sections = new ArrayList<>();
    }

    /** Reads a file, refusing anything that isn't one of ours. */
    static Contents read(InputStream in) throws Exception {
        BufferedReader r =
                new BufferedReader(
                        new InputStreamReader(new GZIPInputStream(in), StandardCharsets.UTF_8));
        Contents contents = new Contents();
        String line = line(r);
        if (line == null) throw new IOException("This isn't a BitChord index or backup file.");
        contents.header = new JSONObject(line);
        String format = contents.header.optString("format");
        if (!format.equals(INDEX) && !format.equals(BACKUP))
            throw new IOException("This isn't a BitChord index or backup file.");
        if (contents.header.optInt("version") > VERSION)
            throw new IOException("This file is from a newer version of the patch. Update first.");
        Section section = null;
        int files = 0;
        while ((line = line(r)) != null) {
            if (line.isEmpty()) continue;
            JSONObject o = new JSONObject(line);
            if (section == null) {
                if (!o.has("chat")) throw new IOException("Damaged index file");
                section = new Section();
                section.chat = o.getLong("chat");
                section.title = text(o.optString("title"), 256);
                section.newest = Math.max(0, o.optLong("newest"));
                section.complete = o.optBoolean("complete");
                contents.sections.add(section);
            } else if (o.optBoolean("end")) section = null;
            else {
                if (++files > MAX_FILES) throw new IOException("Index file too large");
                JSONObject clean = clean(o, section.chat);
                if (clean != null) section.rows.add(clean);
            }
        }
        return contents;
    }

    private static String line(BufferedReader r) throws IOException {
        StringBuilder b = new StringBuilder();
        int c;
        while ((c = r.read()) != -1) {
            if (c == '\n') return b.toString();
            if (b.length() >= MAX_LINE) throw new IOException("Damaged index file");
            b.append((char) c);
        }
        return b.length() == 0 ? null : b.toString();
    }

    private static final String[] TEXT = {
        "title", "artist", "format", "mime", "fileName", "unique", "coverKey", "album"
    };
    private static final String[] NUMBERS = {"size", "duration", "track", "mediaAlbum"};
    private static final Set<String> CHECK_VERDICTS =
            new HashSet<>(Arrays.asList("ok", "lossy", "suspect", "upsampled", "unknown"));

    /**
     * A file's row with only known fields, in the given chat, without Telegram's file numbers; null
     * when it isn't a sensible one.
     */
    static JSONObject clean(JSONObject row, long chat) {
        try {
            long message = row.optLong("message");
            long entry = row.optLong("entry");
            if (row.optLong("chat") != chat || message <= 0 || entry < 0 || entry > 999_999_999)
                return null;
            JSONObject out =
                    new JSONObject()
                            .put("chat", chat)
                            .put("message", message)
                            .put("entry", entry)
                            .put("id", chat + "_" + message + (entry > 0 ? "_" + entry : ""))
                            .put("file", 0)
                            .put("tagged", row.optBoolean("tagged"));
            for (String key : TEXT) if (row.has(key)) out.put(key, text(row.optString(key), 512));
            for (String key : NUMBERS)
                if (row.has(key)) out.put(key, Math.max(0, row.optLong(key)));
            if (out.optString("title").isEmpty()) return null;
            JSONObject header =
                    numbers(
                            row.optJSONObject("header"),
                            "bits",
                            "rate",
                            "channels",
                            "seconds",
                            "lfe");
            if (header != null) {
                JSONObject from = row.getJSONObject("header");
                header.put("codec", text(from.optString("codec"), 16));
                if (from.optBoolean("atmos")) header.put("atmos", true);
                out.put("header", header);
            }
            JSONObject zip = numbers(row.optJSONObject("zip"), "data", "method", "compressed");
            if (zip != null) out.put("zip", zip);
            JSONObject cue =
                    numbers(
                            row.optJSONObject("cue"),
                            "start",
                            "end",
                            "rate",
                            "channels",
                            "bits",
                            "first",
                            "total",
                            "samples",
                            "minBlock",
                            "maxBlock",
                            "maxFrame");
            if (cue != null) {
                String source = row.getJSONObject("cue").optString("source");
                if (!source.equals("flac") && !source.equals("wav")) return null;
                cue.put("source", source);
                out.put("cue", cue);
            }
            // What a check of the file found, and names it was recognised by.
            JSONObject check =
                    numbers(
                            row.optJSONObject("check"),
                            "v",
                            "cutoff",
                            "kbps",
                            "from",
                            "bits",
                            "declared",
                            "score");
            if (check != null) {
                String verdict = row.getJSONObject("check").optString("verdict");
                if (CHECK_VERDICTS.contains(verdict)) {
                    check.put("verdict", verdict);
                    JSONObject from = row.getJSONObject("check");
                    if (from.has("encoder"))
                        check.put("encoder", text(from.optString("encoder"), 64));
                    for (String key : new String[] {"strength", "lock"}) {
                        double v = from.optDouble(key, 0);
                        if (from.has(key) && Double.isFinite(v))
                            check.put(key, Math.max(0, Math.min(200, v)));
                    }
                    out.put("check", check);
                }
            }
            JSONObject names = row.optJSONObject("recognized");
            if (names != null && !names.optString("title").isEmpty()) {
                JSONObject kept = new JSONObject();
                for (String key : new String[] {"title", "artist", "id", "by"})
                    kept.put(key, text(names.optString(key), 512));
                double score = names.optDouble("score", 0);
                kept.put("score", Double.isFinite(score) ? Math.max(0, Math.min(1, score)) : 0);
                out.put("recognized", kept);
            }
            return out;
        } catch (Exception e) {
            return null;
        }
    }

    private static JSONObject numbers(JSONObject from, String... keys) throws Exception {
        if (from == null) return null;
        JSONObject out = new JSONObject();
        for (String key : keys) if (from.has(key)) out.put(key, Math.max(0, from.optLong(key)));
        return out;
    }

    private static String text(String s, int max) {
        s = s == null ? "" : s.replaceAll("\\p{Cntrl}", " ");
        return s.length() > max ? s.substring(0, max) : s;
    }

    /** "bitchord-index-1001234567890-20261029.jsonl.gz": how a chat's index file is named. */
    static String fileName(long chat, String date) {
        return "bitchord-index-" + Math.abs(chat) + "-" + date + ".jsonl.gz";
    }

    /** Whether a file name is a chat's index file. */
    static boolean forChat(String name, long chat) {
        return name != null
                && name.startsWith("bitchord-index-" + Math.abs(chat) + "-")
                && name.endsWith(".jsonl.gz");
    }
}
