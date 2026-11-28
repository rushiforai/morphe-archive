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
    /** Smaller differences are recognition noise, not a skipped passage. */
    static final int MIN_SKIP = 30;

    static final class Cand {
        double t0, t1; // book seconds
        int w0, w1;    // text words
        int i0, i1;    // transcript words (index into the run's word list)
        float conf;
    }

    interface Cancel {
        boolean cancelled();
    }

    /** One audio file of the book: its name, where it starts in the book (seconds) and its transcript (or null). */
    static final class Part {
        final String name;
        final double start;
        final FileTranscript transcript;

        Part(String name, double start, FileTranscript transcript) {
            this.name = name;
            this.start = start;
            this.transcript = transcript;
        }
    }

    private TranscriptSync() {
    }

    /**
     * Matches new transcript chunks (results cached in {@code cache}, key file@ms, empty array for
     * "no match") and returns the chained anchors. Skipped passages ({first, last} text word) are
     * added to {@code skipped}. Returns null if cancelled.
     */
    static List<Alignment.Anchor> run(BookText text, List<Part> parts, Map<String, double[]> cache, Cancel cancel, List<int[]> skipped) {
        List<Cand> cands = new ArrayList<>();
        ArrayList<String> heard = new ArrayList<>();
        Cand prev = null;
        for (Part f : parts) {
            FileTranscript ft = f.transcript;
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
                    heard.add(n);
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
                        cd.i1 = heard.size() - 1;
                        cd.i0 = cd.i1 - chunk.size() + 1;
                        cands.add(cd);
                        prev = cd;
                    }
                }
                chunk.clear();
            }
        }
        List<Cand> best = chain(cands);
        skipped.addAll(skipped(text.words, best, heard));
        ArrayList<Alignment.Anchor> out = new ArrayList<>();
        for (Cand c : best) {
            out.add(new Alignment.Anchor(c.t0, c.w0, Alignment.SRC_TRANSCRIPT, c.conf));
            out.add(new Alignment.Anchor(c.t1, Math.max(c.w0, c.w1), Alignment.SRC_TRANSCRIPT, c.conf));
        }
        return out;
    }

    /**
     * Skipped passages: document words between two neighbouring chain links that none of the
     * transcribed words between them account for. Narrated words right after the first link and
     * right before the second are matched word by word and left out of the passage.
     */
    static List<int[]> skipped(String[] text, List<Cand> chain, List<String> heard) {
        ArrayList<int[]> out = new ArrayList<>();
        for (int k = 1; k < chain.size(); k++) {
            Cand p = chain.get(k - 1), c = chain.get(k);
            int between = c.i0 - p.i1 - 1;
            // Time without transcribed words is audio not transcribed yet (or long silence): can't tell.
            if (between < 0 || c.t0 - p.t1 > between + 8) continue;
            int a = p.w1 + 1, z = c.w0 - 1;
            if (z - a + 1 - between < MIN_SKIP) continue;
            int i = p.i1 + 1, j = c.i0 - 1;
            while (i <= j && a <= z) { // forwards from p
                if (heard.get(i).equals(text[a])) { i++; a++; }
                else if (a < z && heard.get(i).equals(text[a + 1])) { i++; a += 2; } // word the recogniser missed
                else if (i < j && heard.get(i + 1).equals(text[a])) { i += 2; a++; } // word it added
                else if (a < z && heard.get(i).equals(text[a] + text[a + 1])) { i++; a += 2; } // "door-nail" heard as "doornail"
                else break;
            }
            while (i <= j && a <= z) { // backwards from c
                if (heard.get(j).equals(text[z])) { j--; z--; }
                else if (a < z && heard.get(j).equals(text[z - 1])) { j--; z -= 2; }
                else if (i < j && heard.get(j - 1).equals(text[z])) { j -= 2; z--; }
                else if (a < z && heard.get(j).equals(text[z - 1] + text[z])) { j--; z -= 2; }
                else break;
            }
            if (z - a + 1 >= MIN_SKIP && !mostlyHeard(text, a, z, heard, i, j)) out.add(new int[]{a, z});
        }
        return out;
    }

    /**
     * True if most of text[a..z] is among heard[i..j]: the narrator read it, in another order or with edits
     * (the word-by-word walk above gives up at the first difference).
     */
    static boolean mostlyHeard(String[] text, int a, int z, List<String> heard, int i, int j) {
        if (i > j) return false;
        HashMap<String, Integer> pool = new HashMap<>();
        for (int k = i; k <= j; k++) pool.merge(heard.get(k), 1, Integer::sum);
        int found = 0;
        for (int k = a; k <= z; k++) {
            Integer n = pool.get(text[k]);
            if (n != null && n > 0) {
                found++;
                pool.put(text[k], n - 1);
            }
        }
        return found >= 0.6 * (z - a + 1);
    }

    /** Heaviest chain with increasing time and text position. */
    static List<Cand> chain(List<Cand> cands) {
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
        ArrayList<Cand> out = new ArrayList<>();
        for (int i = best; i >= 0; i = from[i]) out.add(cands.get(i));
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
