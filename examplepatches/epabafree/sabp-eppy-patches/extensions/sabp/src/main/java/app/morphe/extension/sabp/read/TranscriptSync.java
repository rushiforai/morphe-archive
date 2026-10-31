package app.morphe.extension.sabp.read;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.morphe.extension.sabp.EppyBook;

/**
 * Lines the on-device transcript up with the paired EPUB/PDF. The book is used as a reference,
 * not copied: every ~14 transcribed words are looked up in the text near where the previous ones
 * matched (TextMatcher), and the matches are then chained so that both time and text only move
 * forward (a weighted longest increasing sequence). The chain may jump ahead in the text, which
 * is how skipped front matter, footnotes and appendices are handled; a stray match that jumps
 * somewhere else is outvoted by its neighbours.
 */
final class TranscriptSync {
    static final int CHUNK = 14;

    static final class Cand {
        double t0, t1; // book seconds
        int w0, w1;    // text words
        float conf;
    }

    interface Cancel {
        boolean cancelled();
    }

    private TranscriptSync() {
    }

    /**
     * Matches new transcript chunks (results cached in {@code cache}, key file@ms, empty array for
     * "no match") and returns the chained anchors. Returns null if cancelled.
     */
    static List<Alignment.Anchor> run(BookText text, EppyBook b, Transcriber tr, Map<String, double[]> cache, Cancel cancel) {
        List<Cand> cands = new ArrayList<>();
        Cand prev = null;
        for (EppyBook.FileItem f : b.files) {
            if (f.start < 0) continue;
            FileTranscript ft = tr.transcript(b.folderUri, f.name);
            if (ft == null) continue;
            List<FileTranscript.Word> words = ft.words();
            ArrayList<String> chunk = new ArrayList<>();
            long c0 = -1, c1 = -1;
            for (int i = 0; i <= words.size(); i++) {
                FileTranscript.Word w = i < words.size() ? words.get(i) : null;
                String n = w != null ? BookText.normalize(w.text) : null;
                if (n != null && !n.isEmpty()) {
                    if (chunk.isEmpty()) c0 = w.t0;
                    chunk.add(n);
                    c1 = w.t1;
                }
                if (chunk.size() < CHUNK && w != null) continue;
                if (chunk.size() >= 6) {
                    if (cancel.cancelled()) return null;
                    String key = f.name + "@" + c0;
                    double[] hit = cache.get(key);
                    if (hit == null) {
                        int near = -1;
                        if (prev != null && f.start + c0 / 1000.0 - prev.t1 < 300) {
                            near = prev.w1 + (int) ((f.start + c0 / 1000.0 - prev.t1) * 2.5);
                        }
                        TextMatcher.Result r = TextMatcher.locate(text, chunk, near, 4000, cancel::cancelled);
                        if (r != null && r.acceptable()) {
                            hit = new double[]{f.start + c0 / 1000.0, f.start + c1 / 1000.0, r.word,
                                    Math.min(text.wordCount() - 1, r.word + chunk.size() - 1), r.confidence()};
                        } else {
                            hit = new double[0];
                        }
                        cache.put(key, hit);
                    }
                    if (hit.length == 5) {
                        Cand cd = new Cand();
                        cd.t0 = hit[0];
                        cd.t1 = hit[1];
                        cd.w0 = (int) hit[2];
                        cd.w1 = (int) hit[3];
                        cd.conf = (float) hit[4];
                        cands.add(cd);
                        prev = cd;
                    }
                }
                chunk.clear();
            }
        }
        return chain(cands);
    }

    /** Heaviest chain with increasing time and text position. */
    static List<Alignment.Anchor> chain(List<Cand> cands) {
        Collections.sort(cands, (a, b) -> Double.compare(a.t0, b.t0));
        int n = cands.size();
        float[] score = new float[n];
        int[] from = new int[n];
        int best = -1;
        for (int i = 0; i < n; i++) {
            Cand c = cands.get(i);
            score[i] = c.conf;
            from[i] = -1;
            for (int j = i - 1; j >= 0; j--) {
                Cand p = cands.get(j);
                if (p.t1 > c.t0 + 0.5 || p.w1 > c.w0 + 2) continue;
                // A big jump back in time is fine; going faster than ~8 words/s over a stretch with no
                // skip in between is not plausible narration, unless it's a real skip (> 400 words).
                double dt = c.t0 - p.t1;
                int dw = c.w0 - p.w1;
                if (dt < 30 && dw > 8 * Math.max(1, dt) + 30 && dw < 400) continue;
                float s = score[j] + c.conf;
                if (s > score[i]) {
                    score[i] = s;
                    from[i] = j;
                }
            }
            if (best < 0 || score[i] > score[best]) best = i;
        }
        ArrayList<Alignment.Anchor> out = new ArrayList<>();
        for (int i = best; i >= 0; i = from[i]) {
            Cand c = cands.get(i);
            out.add(new Alignment.Anchor(c.t1, Math.max(c.w0, c.w1), Alignment.SRC_TRANSCRIPT, c.conf));
            out.add(new Alignment.Anchor(c.t0, c.w0, Alignment.SRC_TRANSCRIPT, c.conf));
        }
        Collections.reverse(out);
        return out;
    }

    // ---- cache (JSON) ---------------------------------------------------------------------------

    static JSONObject toJson(Map<String, double[]> cache) throws Exception {
        JSONObject o = new JSONObject();
        for (Map.Entry<String, double[]> e : cache.entrySet()) {
            JSONArray a = new JSONArray();
            for (double d : e.getValue()) a.put(d);
            o.put(e.getKey(), a);
        }
        return o;
    }

    static Map<String, double[]> fromJson(JSONObject o) {
        HashMap<String, double[]> m = new HashMap<>();
        if (o == null) return m;
        java.util.Iterator<String> it = o.keys();
        while (it.hasNext()) {
            String k = it.next();
            JSONArray a = o.optJSONArray(k);
            if (a == null) continue;
            double[] d = new double[a.length()];
            for (int i = 0; i < d.length; i++) d[i] = a.optDouble(i);
            m.put(k, d);
        }
        return m;
    }

    // ---- names, to help the recogniser spell them -------------------------------------------------

    private static final Pattern WORD = Pattern.compile("\\p{L}[\\p{L}'’-]*");

    /** Names and other capitalised words that the book never writes in lower case. */
    static String namesPrompt(BookText text) {
        HashMap<String, Integer> caps = new HashMap<>();
        java.util.HashSet<String> lower = new java.util.HashSet<>();
        for (BookText.Para p : text.paras) {
            if (p.heading) continue;
            Matcher m = WORD.matcher(p.text);
            int lastEnd = 0;
            boolean sentenceStart = true;
            while (m.find()) {
                String gap = p.text.substring(lastEnd, m.start());
                if (gap.matches(".*[.!?:;\"“”]\\s*$")) sentenceStart = true;
                String w = m.group();
                lastEnd = m.end();
                if (Character.isLowerCase(w.charAt(0))) lower.add(w.toLowerCase(java.util.Locale.ROOT));
                else if (!sentenceStart && w.length() > 2 && !w.equals(w.toUpperCase(java.util.Locale.ROOT))) caps.merge(w, 1, Integer::sum);
                sentenceStart = false;
            }
        }
        ArrayList<Map.Entry<String, Integer>> list = new ArrayList<>();
        for (Map.Entry<String, Integer> e : caps.entrySet()) {
            if (e.getValue() >= 3 && !lower.contains(e.getKey().toLowerCase(java.util.Locale.ROOT))) list.add(e);
        }
        Collections.sort(list, (a, b) -> b.getValue() - a.getValue());
        StringBuilder sb = new StringBuilder();
        for (Map.Entry<String, Integer> e : list) {
            if (sb.length() + e.getKey().length() > 380) break;
            sb.append(sb.length() == 0 ? "" : ", ").append(e.getKey());
        }
        return sb.length() == 0 ? null : sb + ".";
    }
}
