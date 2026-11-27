package app.ayham.extension.music.automix;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * A song's 3-band waveform for the Automix overview (automix-overview.js bandsOf): low under
 * 200 Hz, mid to 2.5 kHz, high above, the peak of each in 40 columns a second, one scale for the
 * three (the song's 99th percentile fills the lane). Made from the stretches the analysis already
 * decoded to disk (the song's opening and end, which is where its mixes are). The last few songs
 * are kept.
 */
public final class Waves {
    public static final int FR = 40;
    private static final String TAG = "AyhamAutomix";
    private static final Handler main = new Handler(Looper.getMainLooper());

    /** One decoded stretch: its columns start at [start] song seconds. */
    public static final class Seg {
        public double start;
        public float[] low, mid, high;
    }

    public static final class Wave {
        public final List<Seg> segs = new ArrayList<>();

        /** Column i of the stretch holding song second t, as {low, mid, high}, or null. */
        public boolean at(double t, float[] out) {
            for (Seg s : segs) {
                int i = (int) Math.floor((t - s.start) * FR);
                if (i >= 0 && i < s.mid.length) {
                    out[0] = s.low[i];
                    out[1] = s.mid[i];
                    out[2] = s.high[i];
                    return true;
                }
            }
            return false;
        }
    }

    private static final Map<String, Wave> cache = new LinkedHashMap<String, Wave>(8, 0.75f, true) {
        @Override
        protected boolean removeEldestEntry(Map.Entry<String, Wave> e) {
            return size() > 6;
        }
    };
    /** id → when it may be tried again (the decoded audio was not there). */
    private static final Map<String, Long> busy = new HashMap<>();

    private Waves() {
    }

    /** The song's waveform, or null while it is made (then [ready] runs on the main thread once it is). */
    public static Wave get(String id, Runnable ready) {
        if (id == null) return null;
        Wave w = cache.get(id);
        if (w != null) return w;
        Long until = busy.get(id);
        long now = android.os.SystemClock.uptimeMillis();
        if (until != null && now < until) return null;
        busy.put(id, now + 5000);
        Context c = Automix.context();
        if (c == null) return null;
        new Thread(() -> {
            Wave made = null;
            try {
                made = make(c, id);
            } catch (Throwable t) {
                Log.w(TAG, "overview: no waveform for " + id, t);
            }
            Wave done = made;
            main.post(() -> {
                if (done == null) return; // not decoded (yet): tried again later
                busy.remove(id);
                cache.put(id, done);
                if (ready != null) ready.run();
            });
        }, "Automix-wave").start();
        return null;
    }

    private static Wave make(Context c, String id) throws Exception {
        Wave w = new Wave();
        for (Analyzer.Pcm pcm : new Analyzer.Pcm[]{Analyzer.head(c, id), Analyzer.tail(c, id)}) {
            if (pcm == null || pcm.frames < pcm.rate) continue;
            w.segs.add(bands(pcm));
        }
        if (w.segs.isEmpty()) return null;
        // one scale for the three bands: the song's loud parts fill the lane
        int total = 0;
        for (Seg s : w.segs) total += s.mid.length;
        float[] all = new float[total];
        int k = 0;
        for (Seg s : w.segs) for (int i = 0; i < s.mid.length; i++) all[k++] = Math.max(s.low[i], Math.max(s.mid[i], s.high[i]));
        java.util.Arrays.sort(all);
        float top = all.length == 0 ? 1 : all[(int) Math.floor(all.length * 0.99)];
        if (!(top > 0)) top = 1;
        for (Seg s : w.segs)
            for (float[] b : new float[][]{s.low, s.mid, s.high})
                for (int i = 0; i < b.length; i++) b[i] = Math.min(1, b[i] / top);
        return w;
    }

    /** RBJ biquad low/high pass at 200 Hz / 2.5 kHz, the peak of each band per column. */
    static Seg bands(Analyzer.Pcm pcm) throws Exception {
        int sr = pcm.rate, hop = Math.round(sr / (float) FR);
        double first = pcm.start();
        // the columns on the song's own grid of 1/40 s
        long firstCol = (long) Math.ceil(first * FR);
        int n = (int) Math.max(0, Math.floor(pcm.end() * FR) - firstCol);
        Seg s = new Seg();
        s.start = firstCol / (double) FR;
        s.low = new float[n];
        s.mid = new float[n];
        s.high = new float[n];
        double[] L = biquad(true, 200, sr), H = biquad(false, 2500, sr);
        double l1 = 0, l2 = 0, ly1 = 0, ly2 = 0, h1 = 0, h2 = 0, hy1 = 0, hy2 = 0;
        double sliceSec = 8;
        for (double from = s.start; from < s.start + n / (double) FR; from += sliceSec) {
            float[][] lr = pcm.read(from, Math.min(from + sliceSec, s.start + n / (double) FR));
            int base = (int) Math.round((from - s.start) * sr);
            for (int i = 0; i < lr[0].length; i++) {
                double x = (lr[0][i] + lr[1][i]) / 2;
                double lo = L[0] * x + L[1] * l1 + L[2] * l2 - L[3] * ly1 - L[4] * ly2;
                l2 = l1;
                l1 = x;
                ly2 = ly1;
                ly1 = lo;
                double hi = H[0] * x + H[1] * h1 + H[2] * h2 - H[3] * hy1 - H[4] * hy2;
                h2 = h1;
                h1 = x;
                hy2 = hy1;
                hy1 = hi;
                int col = (base + i) / hop;
                if (col < 0 || col >= n) continue;
                float al = (float) Math.abs(lo), ah = (float) Math.abs(hi), am = (float) Math.abs(x - lo - hi);
                if (al > s.low[col]) s.low[col] = al;
                if (am > s.mid[col]) s.mid[col] = am;
                if (ah > s.high[col]) s.high[col] = ah;
            }
        }
        return s;
    }

    /** {b0, b1, b2, a1, a2}, normalized. */
    static double[] biquad(boolean lowPass, double f, double sr) {
        double q = Math.sqrt(0.5), w = 2 * Math.PI * f / sr, c = Math.cos(w), al = Math.sin(w) / (2 * q);
        double b0 = lowPass ? (1 - c) / 2 : (1 + c) / 2, b1 = lowPass ? 1 - c : -(1 + c), b2 = b0, a0 = 1 + al;
        return new double[]{b0 / a0, b1 / a0, b2 / a0, (-2 * c) / a0, (1 - al) / a0};
    }
}
