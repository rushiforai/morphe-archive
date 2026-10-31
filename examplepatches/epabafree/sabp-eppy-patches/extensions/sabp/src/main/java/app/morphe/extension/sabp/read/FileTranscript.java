package app.morphe.extension.sabp.read;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

/**
 * The transcript of one audio file: segments with timed words (milliseconds from the start of
 * the file) and which parts of the file are done. Saved as JSON in the app's private storage.
 */
public final class FileTranscript {
    public static final class Word {
        public final long t0, t1;
        public final String text;

        public Word(long t0, long t1, String text) {
            this.t0 = t0;
            this.t1 = t1;
            this.text = text;
        }
    }

    public static final class Seg {
        public long t0, t1;
        public String text;
        public final List<Word> words = new ArrayList<>();
    }

    public final String name;
    public long durationMs;
    public final List<Seg> segs = new ArrayList<>();
    /** Sorted, non-overlapping [start, end) ranges already transcribed. */
    final List<long[]> covered = new ArrayList<>();
    transient int windows;

    FileTranscript(String name) {
        this.name = name;
    }

    // ---- coverage ---------------------------------------------------------------------------------

    /** First not-yet-transcribed position at or after {@code from}, or -1 when the rest is done. */
    public long firstGap(long from) {
        long p = Math.max(0, from);
        for (long[] r : covered) {
            if (r[1] <= p) continue;
            if (r[0] > p) break;
            p = r[1];
        }
        return p < durationMs - 500 ? p : -1;
    }

    /** Start of the first done range after {@code from}, or the file length. */
    long nextCoveredStart(long from) {
        for (long[] r : covered) if (r[0] > from) return r[0];
        return durationMs;
    }

    public long coveredMs() {
        long n = 0;
        for (long[] r : covered) n += r[1] - r[0];
        return n;
    }

    public boolean isCovered(long ms) {
        for (long[] r : covered) if (ms >= r[0] && ms < r[1]) return true;
        return false;
    }

    void cover(long a, long b) {
        if (b <= a) return;
        covered.add(new long[]{a, b});
        Collections.sort(covered, (x, y) -> Long.compare(x[0], y[0]));
        List<long[]> merged = new ArrayList<>();
        for (long[] r : covered) {
            long[] last = merged.isEmpty() ? null : merged.get(merged.size() - 1);
            if (last != null && r[0] <= last[1] + 200) last[1] = Math.max(last[1], r[1]);
            else merged.add(new long[]{r[0], r[1]});
        }
        covered.clear();
        covered.addAll(merged);
    }

    /** Adds the segments of a window covering [a, b), replacing anything there before. */
    void add(List<Seg> fresh, long a, long b) {
        segs.removeIf(s -> s.t0 >= a && s.t0 < b);
        for (Seg s : fresh) if (s.t0 < b) segs.add(s);
        Collections.sort(segs, (x, y) -> Long.compare(x.t0, y.t0));
        cover(a, b);
    }

    /** All words in order. */
    public List<Word> words() {
        List<Word> out = new ArrayList<>();
        for (Seg s : segs) out.addAll(s.words);
        return out;
    }

    // ---- SRT --------------------------------------------------------------------------------------

    public String toSrt() {
        StringBuilder b = new StringBuilder();
        int n = 1;
        for (Seg s : segs) {
            b.append(n++).append('\n').append(srtTime(s.t0)).append(" --> ").append(srtTime(Math.max(s.t1, s.t0 + 300))).append('\n')
                    .append(s.text).append("\n\n");
        }
        return b.toString();
    }

    static String srtTime(long ms) {
        return String.format(Locale.US, "%02d:%02d:%02d,%03d", ms / 3_600_000, ms / 60_000 % 60, ms / 1000 % 60, ms % 1000);
    }

    // ---- storage -----------------------------------------------------------------------------------

    private static final HashMap<String, Object[]> cache = new HashMap<>(); // path -> {lastModified, transcript}

    static File fileFor(File dir, String name) {
        return new File(dir, Transcriber.sha1(name) + ".json");
    }

    static FileTranscript load(File dir, String name) {
        File f = fileFor(dir, name);
        if (!f.isFile()) return null;
        synchronized (cache) {
            Object[] hit = cache.get(f.getPath());
            if (hit != null && (Long) hit[0] == f.lastModified()) return (FileTranscript) hit[1];
        }
        try (FileInputStream in = new FileInputStream(f)) {
            byte[] data = new byte[(int) f.length()];
            int off = 0, r;
            while (off < data.length && (r = in.read(data, off, data.length - off)) > 0) off += r;
            JSONObject o = new JSONObject(new String(data, 0, off, StandardCharsets.UTF_8));
            FileTranscript t = new FileTranscript(o.getString("name"));
            t.durationMs = o.optLong("dur", -1);
            JSONArray cov = o.optJSONArray("covered");
            if (cov != null) for (int i = 0; i < cov.length(); i++) {
                JSONArray r2 = cov.getJSONArray(i);
                t.covered.add(new long[]{r2.getLong(0), r2.getLong(1)});
            }
            JSONArray ss = o.optJSONArray("segs");
            if (ss != null) for (int i = 0; i < ss.length(); i++) {
                JSONArray s = ss.getJSONArray(i);
                Seg seg = new Seg();
                seg.t0 = s.getLong(0);
                seg.t1 = s.getLong(1);
                seg.text = s.getString(2);
                JSONArray ws = s.getJSONArray(3);
                for (int k = 0; k < ws.length(); k++) {
                    JSONArray w = ws.getJSONArray(k);
                    seg.words.add(new Word(w.getLong(0), w.getLong(1), w.getString(2)));
                }
                t.segs.add(seg);
            }
            synchronized (cache) {
                cache.put(f.getPath(), new Object[]{f.lastModified(), t});
            }
            return t;
        } catch (Throwable e) {
            return null;
        }
    }

    void save(File dir) {
        try {
            dir.mkdirs();
            JSONObject o = new JSONObject();
            o.put("v", 1);
            o.put("name", name);
            o.put("dur", durationMs);
            JSONArray cov = new JSONArray();
            for (long[] r : covered) cov.put(new JSONArray().put(r[0]).put(r[1]));
            o.put("covered", cov);
            JSONArray ss = new JSONArray();
            for (Seg s : segs) {
                JSONArray ws = new JSONArray();
                for (Word w : s.words) ws.put(new JSONArray().put(w.t0).put(w.t1).put(w.text));
                ss.put(new JSONArray().put(s.t0).put(s.t1).put(s.text).put(ws));
            }
            o.put("segs", ss);
            File f = fileFor(dir, name);
            File tmp = new File(dir, f.getName() + ".tmp");
            try (FileOutputStream out = new FileOutputStream(tmp)) {
                out.write(o.toString().getBytes(StandardCharsets.UTF_8));
                out.getFD().sync();
            }
            if (!tmp.renameTo(f)) {
                f.delete();
                tmp.renameTo(f);
            }
            synchronized (cache) {
                cache.put(f.getPath(), new Object[]{f.lastModified(), this});
            }
        } catch (Throwable ignored) {
        }
    }
}
