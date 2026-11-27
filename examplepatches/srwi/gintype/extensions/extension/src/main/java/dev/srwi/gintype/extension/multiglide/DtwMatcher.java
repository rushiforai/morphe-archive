package dev.srwi.gintype.extension.multiglide;

import java.util.Arrays;
import java.util.List;

/**
 * From-scratch dynamic time warping over arc-length-resampled 2D paths.
 * Ported 1:1 from Kinetica's DtwMatcher.kt.
 *
 * Both the observed swipe and the ideal word path are resampled to N (32) points at
 * uniform arc-length spacing before matching. That removes finger-speed
 * variation, so the remaining warping is geometric (corner cutting,
 * overshoot) and a narrow Sakoe-Chiba band suffices. Fixed N keeps the matrix
 * shape constant: two preallocated rolling rows, zero allocation per call.
 *
 * Not thread-safe: one instance per decode call/thread.
 */
public final class DtwMatcher {

    private final int n = KineticaConstants.RESAMPLE_N;
    private final int band = KineticaConstants.DTW_BAND_R;
    private final float[] prev = new float[n];
    private final float[] curr = new float[n];
    private final float[] polyScratch = new float[2 * (KineticaConstants.MAX_WORD_LEN + 1)];

    public static final class Point2D {
        public final float x;
        public final float y;
        public final long t;

        public Point2D(float x, float y, long t) {
            this.x = x;
            this.y = y;
            this.t = t;
        }
    }

    /**
     * Resamples path to N (32) points at uniform arc length into out (64 floats: x0, y0, x1, y1...).
     */
    public void resample(List<Point2D> path, float[] out) {
        int count = path.size();
        if (count == 0) return;
        if (count == 1) {
            fillConstant(path.get(0).x, path.get(0).y, out);
            return;
        }
        float arc = 0f;
        for (int i = 1; i < count; i++) {
            Point2D p0 = path.get(i - 1);
            Point2D p1 = path.get(i);
            arc += dist(p0.x, p0.y, p1.x, p1.y);
        }
        if (arc <= 1e-6f) {
            fillConstant(path.get(0).x, path.get(0).y, out);
            return;
        }
        float step = arc / (n - 1);
        out[0] = path.get(0).x;
        out[1] = path.get(0).y;
        int seg = 1;
        float segStartAcc = 0f;
        float segLen = dist(path.get(0).x, path.get(0).y, path.get(1).x, path.get(1).y);
        for (int k = 1; k < n - 1; k++) {
            float target = k * step;
            while (segStartAcc + segLen < target && seg < count - 1) {
                segStartAcc += segLen;
                seg++;
                segLen = dist(path.get(seg - 1).x, path.get(seg - 1).y, path.get(seg).x, path.get(seg).y);
            }
            float f = (segLen <= 1e-6f) ? 0f : (target - segStartAcc) / segLen;
            out[2 * k] = path.get(seg - 1).x + f * (path.get(seg).x - path.get(seg - 1).x);
            out[2 * k + 1] = path.get(seg - 1).y + f * (path.get(seg).y - path.get(seg - 1).y);
        }
        out[2 * (n - 1)] = path.get(count - 1).x;
        out[2 * (n - 1) + 1] = path.get(count - 1).y;
    }

    /**
     * Interpolates point timestamps at the exact N (32) arc-length positions used by resample().
     */
    public void resampleTimes(List<Point2D> path, long[] out) {
        int count = path.size();
        if (count == 0) return;
        if (count == 1) {
            Arrays.fill(out, path.get(0).t);
            return;
        }
        float arc = 0f;
        for (int i = 1; i < count; i++) {
            Point2D p0 = path.get(i - 1);
            Point2D p1 = path.get(i);
            arc += dist(p0.x, p0.y, p1.x, p1.y);
        }
        if (arc <= 1e-6f) {
            long t0 = path.get(0).t;
            long span = path.get(count - 1).t - t0;
            for (int k = 0; k < n; k++) {
                out[k] = t0 + Math.round((double) span * k / (n - 1));
            }
            return;
        }
        float step = arc / (n - 1);
        out[0] = path.get(0).t;
        int seg = 1;
        float segStartAcc = 0f;
        float segLen = dist(path.get(0).x, path.get(0).y, path.get(1).x, path.get(1).y);
        for (int k = 1; k < n - 1; k++) {
            float target = k * step;
            while (segStartAcc + segLen < target && seg < count - 1) {
                segStartAcc += segLen;
                seg++;
                segLen = dist(path.get(seg - 1).x, path.get(seg - 1).y, path.get(seg).x, path.get(seg).y);
            }
            float f = (segLen <= 1e-6f) ? 0f : (target - segStartAcc) / segLen;
            long tA = path.get(seg - 1).t;
            long tB = path.get(seg).t;
            out[k] = tA + Math.round((double) f * (tB - tA));
        }
        out[n - 1] = path.get(count - 1).t;
    }

    /**
     * Length in kw of the path idealPath() draws through the same letters.
     */
    public float idealLength(int[] letters, int from, int to, MultiGlideGeometry geometry) {
        float len = 0f;
        int prevCode = -1;
        for (int i = from; i < to; i++) {
            int code = letters[i];
            if (!geometry.hasKey(code)) continue;
            if (code == prevCode) continue;
            if (prevCode >= 0) len += geometry.keyDist(prevCode, code);
            prevCode = code;
        }
        return len;
    }

    /**
     * Ideal path for letters[from until to]: polyline through key centers with
     * consecutive duplicate keys removed (a doubled letter adds zero length, so
     * "hello" and "helo" share one ideal path and the dictionary disambiguates).
     * Resampled into out. Returns false when no drawable letter remains.
     */
    public boolean idealPath(int[] letters, int from, int to, MultiGlideGeometry geometry, float[] out) {
        int m = 0;
        int prevCode = -1;
        for (int i = from; i < to; i++) {
            int code = letters[i];
            if (!geometry.hasKey(code)) continue;
            if (code == prevCode) continue;
            polyScratch[2 * m] = geometry.centerXKw(code);
            polyScratch[2 * m + 1] = geometry.centerYKw(code);
            prevCode = code;
            m++;
        }
        if (m == 0) return false;
        resamplePoly(polyScratch, m, out);
        return true;
    }

    /**
     * Resamples a polyline of count (x, y) pairs to N points into out.
     */
    public void resamplePoly(float[] poly, int count, float[] out) {
        if (count == 1) {
            fillConstant(poly[0], poly[1], out);
            return;
        }
        float arc = 0f;
        for (int i = 1; i < count; i++) {
            arc += dist(poly[2 * (i - 1)], poly[2 * (i - 1) + 1], poly[2 * i], poly[2 * i + 1]);
        }
        if (arc <= 1e-6f) {
            fillConstant(poly[0], poly[1], out);
            return;
        }
        float step = arc / (n - 1);
        out[0] = poly[0];
        out[1] = poly[1];
        int seg = 1;
        float segStartAcc = 0f;
        float segLen = dist(poly[0], poly[1], poly[2], poly[3]);
        for (int k = 1; k < n - 1; k++) {
            float target = k * step;
            while (segStartAcc + segLen < target && seg < count - 1) {
                segStartAcc += segLen;
                seg++;
                segLen = dist(poly[2 * (seg - 1)], poly[2 * (seg - 1) + 1], poly[2 * seg], poly[2 * seg + 1]);
            }
            float f = (segLen <= 1e-6f) ? 0f : (target - segStartAcc) / segLen;
            out[2 * k] = poly[2 * (seg - 1)] + f * (poly[2 * seg] - poly[2 * (seg - 1)]);
            out[2 * k + 1] = poly[2 * (seg - 1) + 1] + f * (poly[2 * seg + 1] - poly[2 * (seg - 1) + 1]);
        }
        out[2 * (n - 1)] = poly[2 * (count - 1)];
        out[2 * (n - 1) + 1] = poly[2 * (count - 1) + 1];
    }

    /**
     * Banded DTW between two resampled paths. Both endpoints are anchored (the
     * gesture's start/end are the user's most deliberate positions, weighted x2).
     * Returns the accumulated cost, or +Inf once the running row minimum exceeds abandonAboveAccum.
     * Divide by N for the mean per-step cost.
     */
    public float distanceAccum(float[] observed, float[] ideal, float abandonAboveAccum) {
        float w = KineticaConstants.DTW_ENDPOINT_WEIGHT;
        Arrays.fill(prev, Float.POSITIVE_INFINITY);
        Arrays.fill(curr, Float.POSITIVE_INFINITY);

        prev[0] = w * cellDist(observed, 0, ideal, 0);
        int row0Hi = Math.min(n - 1, band);
        for (int j = 1; j <= row0Hi; j++) {
            prev[j] = prev[j - 1] + cellDist(observed, 0, ideal, j);
        }

        for (int i = 1; i < n; i++) {
            int jLo = Math.max(0, i - band);
            int jHi = Math.min(n - 1, i + band);
            if (jLo > 0) curr[jLo - 1] = Float.POSITIVE_INFINITY;
            float rowMin = Float.POSITIVE_INFINITY;
            for (int j = jLo; j <= jHi; j++) {
                float d = cellDist(observed, i, ideal, j);
                float best = prev[j];
                if (j > 0) {
                    if (prev[j - 1] < best) best = prev[j - 1];
                    if (curr[j - 1] < best) best = curr[j - 1];
                }
                float weighted = (i == n - 1 && j == n - 1) ? (w * d) : d;
                float v = weighted + best;
                curr[j] = v;
                if (v < rowMin) rowMin = v;
            }
            if (jHi < n - 1) curr[jHi + 1] = Float.POSITIVE_INFINITY;
            if (rowMin > abandonAboveAccum) return Float.POSITIVE_INFINITY;
            System.arraycopy(curr, 0, prev, 0, n);
        }
        return prev[n - 1];
    }

    private void fillConstant(float x, float y, float[] out) {
        for (int k = 0; k < n; k++) {
            out[2 * k] = x;
            out[2 * k + 1] = y;
        }
    }

    private float cellDist(float[] a, int i, float[] b, int j) {
        float dx = a[2 * i] - b[2 * j];
        float dy = a[2 * i + 1] - b[2 * j + 1];
        return (float) Math.sqrt(dx * dx + dy * dy);
    }

    private float dist(float x0, float y0, float x1, float y1) {
        float dx = x1 - x0;
        float dy = y1 - y0;
        return (float) Math.sqrt(dx * dx + dy * dy);
    }
}
