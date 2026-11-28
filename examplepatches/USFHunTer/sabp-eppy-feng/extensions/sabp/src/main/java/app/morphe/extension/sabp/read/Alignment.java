package app.morphe.extension.sabp.read;

import org.json.JSONArray;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Maps audiobook time (seconds from the start of the book) to word positions in the attached text.
 *
 * <p>Built from anchors: exact ones from EPUB media overlays, automatic ones from speech
 * recognition, and manual "I'm hearing this" taps. Between anchors the mapping is linear, so even
 * a few anchors give a good follow-along; with none it falls back to a whole-book estimate.
 */
public final class Alignment {
    public static final int SRC_OVERLAY = 0, SRC_SPEECH = 1, SRC_MANUAL = 2, SRC_CHAPTER = 3, SRC_TRANSCRIPT = 4;

    /** How trustworthy the position at a given time is. */
    public static final int LEVEL_ESTIMATE = 0, LEVEL_APPROX = 1, LEVEL_CONFIRMED = 2, LEVEL_MANUAL = 3, LEVEL_EXACT = 4;

    public static final class Anchor implements Comparable<Anchor> {
        public final double seconds;
        public final int word;
        public final int source;
        public final float confidence;

        public Anchor(double seconds, int word, int source, float confidence) {
            this.seconds = seconds;
            this.word = word;
            this.source = source;
            this.confidence = confidence;
        }

        @Override
        public int compareTo(Anchor o) {
            return Double.compare(seconds, o.seconds);
        }
    }

    private final ArrayList<Anchor> anchors = new ArrayList<>();
    private int words;
    private double bookSeconds;

    public synchronized void setBounds(int words, double bookSeconds) {
        this.words = Math.max(1, words);
        if (bookSeconds > 0) this.bookSeconds = bookSeconds;
    }

    public synchronized int anchorCount(int source) {
        int n = 0;
        for (Anchor a : anchors) if (source < 0 || a.source == source) n++;
        return n;
    }

    public synchronized boolean hasOverlay() {
        return anchorCount(SRC_OVERLAY) > 0;
    }

    private static int rank(int source) {
        switch (source) {
            case SRC_OVERLAY: return 4;
            case SRC_MANUAL: return 3;
            case SRC_SPEECH:
            case SRC_TRANSCRIPT: return 2;
            default: return 1; // chapter (approximate)
        }
    }

    /**
     * Adds an anchor if it is consistent with the existing ones. Time order and word order must
     * agree, and the implied narration speed must be plausible (0.8–6 words/s). When it conflicts
     * with an anchor of the same or higher rank, the new one is rejected (so one bad match can't
     * wipe out good ones). Lower-ranked conflicting anchors are dropped. Manual corrections outrank
     * speech matches; book timings (overlays) outrank everything.
     *
     * @return true if added
     */
    public synchronized boolean add(Anchor a) {
        ArrayList<Anchor> drop = new ArrayList<>();
        for (Anchor o : anchors) {
            double dt = a.seconds - o.seconds;
            int dw = a.word - o.word;
            boolean conflict = Math.abs(dt) < 4 && o.source == a.source
                    || (dt > 0 && dw < 0) || (dt < 0 && dw > 0)
                    || (Math.abs(dt) >= 20 && (Math.abs(dw) / Math.abs(dt) > 6 || Math.abs(dw) / Math.abs(dt) < 0.8));
            if (!conflict) continue;
            if (rank(o.source) >= rank(a.source) && !(Math.abs(dt) < 4 && o.source == a.source && a.source != SRC_OVERLAY)) return false;
            drop.add(o);
        }
        anchors.removeAll(drop);
        anchors.add(a);
        Collections.sort(anchors);
        return true;
    }

    /** Precision of the mapping at a book time, from the closest anchors around it. */
    public synchronized int levelAt(double t) {
        Anchor before = null, after = null;
        for (Anchor x : anchors) {
            if (x.seconds <= t) before = x;
            else { after = x; break; }
        }
        int best = LEVEL_ESTIMATE;
        for (Anchor x : new Anchor[]{before, after}) {
            if (x == null) continue;
            double d = Math.abs(x.seconds - t);
            int lvl;
            if (x.source == SRC_OVERLAY) lvl = d < 120 ? LEVEL_EXACT : LEVEL_APPROX;
            else if (x.source == SRC_MANUAL) lvl = d < 300 ? LEVEL_MANUAL : d < 1800 ? LEVEL_APPROX : LEVEL_ESTIMATE;
            else if (x.source == SRC_TRANSCRIPT) lvl = d < 45 ? LEVEL_CONFIRMED : d < 600 ? LEVEL_APPROX : LEVEL_ESTIMATE;
            else if (x.source == SRC_SPEECH) lvl = d < 600 ? LEVEL_CONFIRMED : d < 2400 ? LEVEL_APPROX : LEVEL_ESTIMATE;
            else lvl = d < 3600 ? LEVEL_APPROX : LEVEL_ESTIMATE;
            best = Math.max(best, lvl);
        }
        return best;
    }

    public synchronized void clear(int source) {
        ArrayList<Anchor> keep = new ArrayList<>();
        for (Anchor a : anchors) if (source >= 0 && a.source != source) keep.add(a);
        anchors.clear();
        anchors.addAll(keep);
    }

    /**
     * Replaces the transcript anchors with a chain that is already in time and word order (see
     * TranscriptSync). Unlike add(), large forward jumps in the text are allowed here: they are
     * passages the narrator skipped (front matter, footnotes, appendices). Anchors that disagree
     * with manual corrections or book timings are left out; chapter and listening anchors that
     * disagree with the chain are dropped.
     */
    public synchronized int setTranscriptChain(List<Anchor> chain) {
        clear(SRC_TRANSCRIPT);
        ArrayList<Anchor> strong = new ArrayList<>();
        for (Anchor o : anchors) if (o.source == SRC_MANUAL || o.source == SRC_OVERLAY) strong.add(o);
        int added = 0;
        ArrayList<Anchor> keep = new ArrayList<>();
        for (Anchor a : chain) {
            boolean bad = false;
            for (Anchor o : strong) {
                double dt = a.seconds - o.seconds;
                int dw = a.word - o.word;
                if ((dt > 0 && dw < 0) || (dt < 0 && dw > 0)) {
                    bad = true;
                    break;
                }
            }
            if (!bad) keep.add(a);
        }
        if (!keep.isEmpty()) {
            ArrayList<Anchor> drop = new ArrayList<>();
            for (Anchor o : anchors) {
                if (o.source != SRC_CHAPTER && o.source != SRC_SPEECH) continue;
                for (Anchor a : keep) {
                    double dt = a.seconds - o.seconds;
                    int dw = a.word - o.word;
                    if ((dt > 0 && dw < 0) || (dt < 0 && dw > 0) || Math.abs(dt) < 2) {
                        drop.add(o);
                        break;
                    }
                }
            }
            anchors.removeAll(drop);
            anchors.addAll(keep);
            added = keep.size();
            Collections.sort(anchors);
        }
        return added;
    }

    public synchronized void setOverlays(List<BookText.Overlay> overlays) {
        clear(SRC_OVERLAY);
        for (BookText.Overlay o : overlays) anchors.add(new Anchor(o.seconds, o.word, SRC_OVERLAY, 1f));
        Collections.sort(anchors);
    }

    private double rate() {
        return bookSeconds > 0 ? words / bookSeconds : 2.5; // ~150 words per minute
    }

    /** Word being spoken at a given book time. */
    public synchronized int wordAt(double t) {
        if (anchors.isEmpty()) return clamp((int) Math.round(t * rate()));
        Anchor first = anchors.get(0);
        if (t <= first.seconds) return clamp((int) Math.round(first.word - (first.seconds - t) * localRate(0)));
        Anchor last = anchors.get(anchors.size() - 1);
        if (t >= last.seconds) return clamp((int) Math.round(last.word + (t - last.seconds) * localRate(anchors.size() - 2)));
        int lo = 0, hi = anchors.size() - 1;
        while (hi - lo > 1) {
            int mid = (lo + hi) / 2;
            if (anchors.get(mid).seconds <= t) lo = mid;
            else hi = mid;
        }
        Anchor a = anchors.get(lo), b = anchors.get(hi);
        double f = (t - a.seconds) / Math.max(0.001, b.seconds - a.seconds);
        return clamp((int) Math.round(a.word + f * (b.word - a.word)));
    }

    /** Book time at which a word is spoken (inverse of wordAt). */
    public synchronized double timeOf(int w) {
        if (anchors.isEmpty()) return w / rate();
        Anchor first = anchors.get(0);
        if (w <= first.word) return Math.max(0, first.seconds - (first.word - w) / localRate(0));
        Anchor last = anchors.get(anchors.size() - 1);
        if (w >= last.word) return last.seconds + (w - last.word) / localRate(anchors.size() - 2);
        for (int i = 0; i + 1 < anchors.size(); i++) {
            Anchor a = anchors.get(i), b = anchors.get(i + 1);
            if (w >= a.word && w <= b.word) {
                double f = (w - a.word) / (double) Math.max(1, b.word - a.word);
                return a.seconds + f * (b.seconds - a.seconds);
            }
        }
        return w / rate();
    }

    /** Words per second around anchor i (falls back to the book average). */
    private double localRate(int i) {
        if (i >= 0 && i + 1 < anchors.size()) {
            Anchor a = anchors.get(i), b = anchors.get(i + 1);
            double dt = b.seconds - a.seconds;
            if (dt > 20 && b.word > a.word) {
                double r = (b.word - a.word) / dt;
                if (r > 0.8 && r < 6) return r;
            }
        }
        double r = rate();
        return r > 0.8 && r < 6 ? r : 2.5;
    }

    private int clamp(int w) {
        return Math.max(0, Math.min(words - 1, w));
    }

    // ---- persistence --------------------------------------------------------------------------

    public synchronized JSONArray toJson() {
        JSONArray a = new JSONArray();
        for (Anchor x : anchors) {
            if (x.source == SRC_OVERLAY || x.source == SRC_CHAPTER || x.source == SRC_TRANSCRIPT) continue; // rebuilt from the document/audio/transcript
            try {
                a.put(new JSONArray().put(x.seconds).put(x.word).put(x.source).put((double) x.confidence));
            } catch (Exception ignored) {
            }
        }
        return a;
    }

    public synchronized void fromJson(JSONArray a) {
        if (a == null) return;
        for (int i = 0; i < a.length(); i++) {
            JSONArray x = a.optJSONArray(i);
            if (x == null) continue;
            anchors.add(new Anchor(x.optDouble(0), x.optInt(1), x.optInt(2), (float) x.optDouble(3, 0.5)));
        }
        Collections.sort(anchors);
    }
}
