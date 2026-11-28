package app.morphe.extension.sabp.read;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * Finds where a short transcript occurs in the document, coarse to fine, without a whole-book
 * index in memory:
 * <ol>
 *     <li>with a reliable estimate, search a window around it (default ±4,000 words);</li>
 *     <li>otherwise scan the book in 6,000-word chunks, each with a small local index that is
 *     discarded after use;</li>
 *     <li>inside the best region, refine the exact start word by in-order hits.</li>
 * </ol>
 * The result reports the best and the runner-up score; a match is only accepted when the best
 * region clearly beats every other region, so a phrase that appears in several places can't
 * cause a jump to the wrong one.
 */
public final class TextMatcher {
    public static final int CHUNK = 6000;
    private static final int OVERLAP = 80;
    private static final int BUCKET = 4;

    public static final class Result {
        public final int word;            // start word of the transcript in the text
        public final float hitRatio;      // fraction of transcript words found in order there
        public final float best, second;  // region scores
        public final boolean ambiguous;
        public final int windowsSearched;

        Result(int word, float hitRatio, float best, float second, int windows) {
            this.word = word;
            this.hitRatio = hitRatio;
            this.best = best;
            this.second = second;
            this.ambiguous = second > 0 && second >= best * 0.75f;
            this.windowsSearched = windows;
        }

        /** 0..1: in-order coverage scaled by how clearly this place beats the runner-up. */
        public float confidence() {
            float distinct = second > 0 ? Math.max(0f, Math.min(1f, (best - second) / best)) : 1f;
            return hitRatio * (0.5f + 0.5f * distinct);
        }

        public boolean acceptable() {
            return !ambiguous && hitRatio >= 0.45f && confidence() >= 0.4f;
        }
    }

    public interface Cancel {
        boolean cancelled();
    }

    private TextMatcher() {
    }

    /** Coarse-to-fine search. near < 0 means no estimate (scan the whole book in chunks). */
    public static Result locate(BookText text, List<String> transcript, int near, int radius, Cancel cancel) {
        int n = text.wordCount();
        if (transcript.size() < 5 || n == 0) return null;
        if (near >= 0) {
            Result local = search(text, transcript, Math.max(0, near - radius), Math.min(n, near + radius + transcript.size()));
            if (local != null && local.acceptable()) return local;
        }
        Result best = null;
        float runnerUp = 0;
        int windows = 0;
        for (int from = 0; from < n; from += CHUNK - OVERLAP) {
            if (cancel != null && cancel.cancelled()) return null;
            Result r = search(text, transcript, from, Math.min(n, from + CHUNK));
            windows++;
            if (r == null) continue;
            if (best == null || r.best > best.best) {
                if (best != null && Math.abs(best.word - r.word) > transcript.size() * 2) runnerUp = Math.max(runnerUp, best.best);
                runnerUp = Math.max(runnerUp, r.second);
                best = r;
            } else if (Math.abs(best.word - r.word) > transcript.size() * 2) {
                runnerUp = Math.max(runnerUp, r.best);
            }
        }
        if (best == null) return null;
        return new Result(best.word, best.hitRatio, best.best, Math.max(runnerUp, best.second), windows);
    }

    /** Voting search inside [from, to): each transcript word votes for consistent start positions. */
    static Result search(BookText text, List<String> transcript, int from, int to) {
        // Local index of this window only.
        HashMap<String, ArrayList<Integer>> local = new HashMap<>();
        HashMap<String, Integer> tcount = new HashMap<>();
        for (String w : transcript) tcount.put(w, 0);
        for (int i = from; i < to; i++) {
            String w = text.words[i];
            if (!tcount.containsKey(w)) continue;
            ArrayList<Integer> l = local.get(w);
            if (l == null) local.put(w, l = new ArrayList<>());
            l.add(i);
        }
        if (local.isEmpty()) return null;
        HashMap<Integer, float[]> votes = new HashMap<>();
        int window = to - from;
        for (int i = 0; i < transcript.size(); i++) {
            ArrayList<Integer> occ = local.get(transcript.get(i));
            if (occ == null) continue;
            // Common words ("the", "and") carry little information.
            if (occ.size() > Math.max(40, window / 150)) continue;
            float weight = (float) (1.0 / Math.sqrt(occ.size()));
            for (int p : occ) {
                int key = Math.floorDiv(p - i, BUCKET);
                float[] v = votes.get(key);
                if (v == null) votes.put(key, v = new float[1]);
                v[0] += weight;
            }
        }
        if (votes.isEmpty()) return null;
        int bestKey = 0;
        float best = 0, second = 0;
        for (java.util.Map.Entry<Integer, float[]> e : votes.entrySet()) {
            float s = e.getValue()[0];
            float[] a = votes.get(e.getKey() - 1), b = votes.get(e.getKey() + 1);
            if (a != null) s += a[0] * 0.5f;
            if (b != null) s += b[0] * 0.5f;
            if (s > best) {
                if (Math.abs(e.getKey() - bestKey) > 3) second = Math.max(second, best);
                best = s;
                bestKey = e.getKey();
            } else if (s > second && Math.abs(e.getKey() - bestKey) > 3) {
                second = s;
            }
        }
        // Refine: exact start with the most in-order hits (allowing one-word slips).
        int n = text.wordCount();
        int lo = Math.max(0, bestKey * BUCKET - BUCKET), hi = Math.min(n - 1, bestKey * BUCKET + 2 * BUCKET);
        int bestStart = lo, bestHits = -1;
        for (int s = lo; s <= hi; s++) {
            int hits = 0;
            for (int i = 0; i < transcript.size(); i++) {
                int w = s + i;
                String t = transcript.get(i);
                if (w >= 0 && w < n && (t.equals(text.words[w]) || (w + 1 < n && t.equals(text.words[w + 1]))
                        || (w - 1 >= 0 && t.equals(text.words[w - 1])))) hits++;
            }
            if (hits > bestHits) {
                bestHits = hits;
                bestStart = s;
            }
        }
        return new Result(bestStart, bestHits / (float) transcript.size(), best, second, 1);
    }
}
