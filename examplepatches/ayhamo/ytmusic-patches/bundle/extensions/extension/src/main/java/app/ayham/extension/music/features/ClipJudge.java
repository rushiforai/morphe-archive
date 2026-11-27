package app.ayham.extension.music.features;

import java.util.ArrayList;
import java.util.List;

/**
 * Prism's Canvas judging (FrameJudge on the storyboard, ClipRefine on the clip's own frames), as
 * plain arithmetic on small grey grids so it is tested without a phone.
 *
 * <p>Storyboard: black bars, a still upload, every ~8 s window scored by its movement (some, not
 * frantic), brightness (not a black screen) and distance from the intro and the credits; the window
 * near YouTube's "Most replayed" peak is taken first, else near the chorus, else the middle third,
 * else the best; the crop goes where the detail and movement are. Real frames: where the video cuts, the loop
 * ending on its last cut 5 to 9 s in, and the flash guard (more than three flashes in a second over
 * a quarter of the picture is never shown).
 */
final class ClipJudge {
    static final int W = 32, H = 18;
    static final long WINDOW_MS = 8_000, HEAD_MS = 12_000, TAIL_MS = 15_000, MIN_LOOP_MS = 5_000, MAX_LOOP_MS = 9_000;
    private static final int BLACK = 24, LIT = 48;
    private static final double BAR_SHARE = 0.9, STEP_MOVE = 3, STILL_SHARE = 0.6, WINDOW_STILL_SHARE = 0.75;
    private static final double IDEAL_MOVE = 18, FRANTIC_MOVE = 60, DARK = 16, BRIGHT = 64, CROP_SHARE = 0.32, CROP_LEAD = 1.15;
    private static final long PEAK_BEFORE_MS = 4_000, PEAK_AFTER_MS = 8_000, CHORUS_NEAR_MS = 10_000, APART_MS = 15_000;
    private static final int RUNNERS_UP = 4;
    private static final double GOOD_ENOUGH = 0.3;
    private static final float CUT = 22, FLASH_AREA = 0.25f;
    private static final int FLASH_STEP = 26, FLASH_CHANGES = 7;

    private ClipJudge() {
    }

    /** One frame reduced to W x H grey values (0..255), row by row. */
    static int[] grid(int[] luma, int width, int x0, int y0, int w, int h) {
        int[] out = new int[W * H];
        for (int cy = 0; cy < H; cy++)
            for (int cx = 0; cx < W; cx++) {
                int ya = y0 + cy * h / H, yb = Math.max(ya + 1, y0 + (cy + 1) * h / H);
                int xa = x0 + cx * w / W, xb = Math.max(xa + 1, x0 + (cx + 1) * w / W);
                long sum = 0;
                int n = 0;
                for (int y = ya; y < yb; y++)
                    for (int x = xa; x < xb; x++, n++) sum += luma[y * width + x];
                out[cy * W + cx] = n > 0 ? (int) (sum / n) : 0;
            }
        return out;
    }

    // ---------------------------------------------------------------------------------- bars

    /** Black bars baked into the picture: {left, top, right, bottom} as shares of the frame. */
    static float[] bars(List<int[]> frames) {
        List<int[]> lit = new ArrayList<>();
        for (int[] f : frames) {
            for (int v : f)
                if (v >= LIT) {
                    lit.add(f);
                    break;
                }
        }
        if (lit.size() < 3) return new float[4];
        double need = lit.size() * BAR_SHARE;
        boolean[] col = new boolean[W], row = new boolean[H];
        for (int x = 0; x < W; x++) {
            int c = 0;
            for (int[] f : lit) {
                int b = 0;
                for (int y = 0; y < H; y++) if (f[y * W + x] <= BLACK) b++;
                if (b >= H * 9 / 10) c++;
            }
            col[x] = c >= need;
        }
        for (int y = 0; y < H; y++) {
            int c = 0;
            for (int[] f : lit) {
                int b = 0;
                for (int x = 0; x < W; x++) if (f[y * W + x] <= BLACK) b++;
                if (b >= W * 9 / 10) c++;
            }
            row[y] = c >= need;
        }
        int left = 0, right = 0, top = 0, bottom = 0;
        while (left < W && col[left]) left++;
        while (right < W - left && col[W - 1 - right]) right++;
        while (top < H && row[top]) top++;
        while (bottom < H - top && row[H - 1 - bottom]) bottom++;
        if (left + right > W / 2) left = right = 0;
        if (top + bottom > H / 2) top = bottom = 0;
        return new float[]{left / (float) W, top / (float) H, right / (float) W, bottom / (float) H};
    }

    /** The picture inside the bars, in cells: {x0, y0, x1, y1}. */
    static int[] area(float[] bars) {
        return new int[]{Math.round(bars[0] * W), Math.round(bars[1] * H), W - Math.round(bars[2] * W), H - Math.round(bars[3] * H)};
    }

    private static int[] middle(int[] a) {
        int dx = (int) Math.round((a[2] - a[0]) * 0.2), dy = (int) Math.round((a[3] - a[1]) * 0.2);
        return new int[]{a[0] + dx, a[1] + dy, Math.max(a[0] + dx + 1, a[2] - dx), Math.max(a[1] + dy + 1, a[3] - dy)};
    }

    static double diff(int[] p, int[] q, int[] a) {
        long sum = 0;
        for (int y = a[1]; y < a[3]; y++)
            for (int x = a[0]; x < a[2]; x++) sum += Math.abs(p[y * W + x] - q[y * W + x]);
        return sum / (double) ((a[2] - a[0]) * (a[3] - a[1]));
    }

    private static double mean(int[] g, int[] a) {
        long sum = 0;
        for (int y = a[1]; y < a[3]; y++)
            for (int x = a[0]; x < a[2]; x++) sum += g[y * W + x];
        return sum / (double) ((a[2] - a[0]) * (a[3] - a[1]));
    }

    // ---------------------------------------------------------------------------------- still

    /** A still upload: most steps show no change in the middle of the picture. */
    static boolean still(List<int[]> frames, float[] bars) {
        if (frames.size() < 2) return true;
        int[] m = middle(area(bars));
        int n = 0;
        for (int i = 1; i < frames.size(); i++) if (diff(frames.get(i - 1), frames.get(i), m) < STEP_MOVE) n++;
        return n / (double) (frames.size() - 1) >= STILL_SHARE;
    }

    // ---------------------------------------------------------------------------------- windows

    /** {startMs, endMs, score} of every scoring ~8 s window, one per frame. */
    static List<double[]> windows(List<int[]> frames, long intervalMs, long lengthMs, float[] bars) {
        List<double[]> out = new ArrayList<>();
        if (frames.size() < 2 || intervalMs <= 0) return out;
        int[] a = area(bars), m = middle(a);
        int steps = (int) Math.max(1, Math.min(frames.size() - 1, Math.round(WINDOW_MS / (double) intervalMs)));
        double[] move = new double[frames.size() - 1], moveMid = new double[frames.size() - 1], light = new double[frames.size()];
        for (int i = 0; i + 1 < frames.size(); i++) {
            move[i] = diff(frames.get(i), frames.get(i + 1), a);
            moveMid[i] = diff(frames.get(i), frames.get(i + 1), m);
        }
        for (int i = 0; i < frames.size(); i++) light[i] = mean(frames.get(i), a);
        boolean roomy = lengthMs >= HEAD_MS + TAIL_MS + 3 * WINDOW_MS;
        for (int i = 0; i <= frames.size() - 1 - steps; i++) {
            long start = i * intervalMs, end = Math.min(start + WINDOW_MS, lengthMs);
            boolean nearEnds = start < HEAD_MS || end > lengthMs - TAIL_MS;
            if (nearEnds && roomy) continue;
            int still = 0;
            double motion = 0, bright = 0, dark = 0;
            for (int k = i; k < i + steps; k++) {
                if (moveMid[k] < STEP_MOVE) still++;
                motion += move[k];
            }
            if (still >= steps * WINDOW_STILL_SHARE) continue;
            for (int k = i; k <= i + steps; k++) {
                bright += light[k];
                if (light[k] < DARK) dark++;
            }
            motion /= steps;
            bright /= steps + 1;
            dark /= steps + 1;
            double moveScore = motion <= IDEAL_MOVE ? motion / IDEAL_MOVE
                    : 1 - 0.5 * Math.min(1, (motion - IDEAL_MOVE) / (FRANTIC_MOVE - IDEAL_MOVE));
            double brightScore = Math.max(0, Math.min(1, (bright - DARK) / (BRIGHT - DARK)));
            out.add(new double[]{start, end, moveScore * brightScore * (1 - dark) * (nearEnds ? 0.5 : 1)});
        }
        return out;
    }

    /** Best first: the higher score, on a tie the earlier start (the answer never depends on the windows' order). */
    private static boolean better(double[] w, double[] than) {
        return than == null || w[2] > than[2] || w[2] == than[2] && w[0] < than[0];
    }

    /**
     * The loop's window (Prism's FrameJudge.choose): the best near YouTube's "Most replayed" [peakMs] (one
     * in the first HEAD_MS is the intro everyone replays: ignored), else near the song's [chorusMs] (from
     * synced lyrics), else in the middle third, each only from windows scoring above 0 and at least
     * GOOD_ENOUGH of the best; else the best anywhere, even at 0. Null without windows. [peakMs] and
     * [chorusMs] null when unknown.
     */
    static double[] choose(List<double[]> windows, long lengthMs, Long peakMs, Long chorusMs) {
        if (windows.isEmpty()) return null;
        double[] top = null;
        for (double[] w : windows) if (better(w, top)) top = w;
        double[] w = null;
        if (peakMs != null && peakMs >= HEAD_MS) w = pick(windows, top, peakMs - PEAK_BEFORE_MS, peakMs + PEAK_AFTER_MS);
        if (w == null && chorusMs != null) w = pick(windows, top, chorusMs - CHORUS_NEAR_MS, chorusMs + CHORUS_NEAR_MS);
        if (w == null) w = pick(windows, top, lengthMs / 3, lengthMs * 2 / 3);
        return w != null ? w : top;
    }

    /** The best window starting in [from, to] that scores above 0 and at least GOOD_ENOUGH of [top]'s score, or null. */
    private static double[] pick(List<double[]> windows, double[] top, long from, long to) {
        double[] b = null;
        for (double[] w : windows)
            if (w[0] >= from && w[0] <= to && w[2] > 0 && w[2] >= top[2] * GOOD_ENOUGH && better(w, b)) b = w;
        return b;
    }

    /** Up to RUNNERS_UP other good parts' starts, best first, each APART_MS from the chosen one and each other. */
    static List<Long> runnersUp(List<double[]> windows, long chosenMs) {
        List<double[]> scoring = new ArrayList<>();
        for (double[] w : windows) if (w[2] > 0) scoring.add(w);
        scoring.sort((x, y) -> better(x, y) ? -1 : better(y, x) ? 1 : 0);
        List<Long> taken = new ArrayList<>(), out = new ArrayList<>();
        taken.add(chosenMs);
        for (double[] w : scoring) {
            if (out.size() >= RUNNERS_UP) break;
            boolean near = false;
            for (long t : taken) near |= Math.abs(t - (long) w[0]) < APART_MS;
            if (near) continue;
            taken.add((long) w[0]);
            out.add((long) w[0]);
        }
        return out;
    }

    /** What the storyboard says when the video is not a still upload: the window, its crop and bars, and other parts. */
    static final class Loop {
        long startMs, endMs, lengthMs;
        float cropX = 0.5f;
        float[] bars = new float[4];
        List<Long> others = new ArrayList<>();
    }

    /**
     * Prism's FrameJudge.judge: bars, the still check, the windows, the chosen one and its crop. Null for a
     * still upload, also when every window is left out (still steps, or the ends of a roomy video).
     */
    static Loop judge(List<int[]> frames, long intervalMs, long lengthMs, Long peakMs, Long chorusMs) {
        long length = Math.max(lengthMs, frames.size() * intervalMs);
        float[] b = bars(frames);
        if (still(frames, b)) return null;
        List<double[]> windows = windows(frames, intervalMs, length, b);
        double[] w = choose(windows, length, peakMs, chorusMs);
        if (w == null) return null;
        int first = (int) ((long) w[0] / intervalMs), last = (int) Math.min(frames.size() - 1, ((long) w[1] + intervalMs - 1) / intervalMs);
        Loop l = new Loop();
        l.startMs = (long) w[0];
        l.endMs = (long) w[1];
        l.lengthMs = length;
        l.bars = b;
        l.cropX = cropX(frames.subList(first, last + 1), b);
        l.others = runnersUp(windows, l.startMs);
        return l;
    }

    /** The middle WINDOW_MS of a video with no preview frames (Prism's FrameJudge.noFrames): {startMs, endMs}. */
    static long[] noFrames(long lengthMs) {
        long window = Math.min(WINDOW_MS, lengthMs);
        long start = Math.max(0, (lengthMs - window) / 2);
        return new long[]{start, start + window};
    }

    /**
     * Where the crop sits across the picture inside the bars (0 left, 0.5 centred, 1 right): the band
     * of CROP_SHARE of its width (what a full-height upright crop of a 16:9 picture keeps, as Prism's
     * FrameJudge) that holds the most detail and movement, when it leads the centre by CROP_LEAD; ties
     * go to the band nearer the centre.
     */
    static float cropX(List<int[]> frames, float[] bars) {
        int[] a = area(bars);
        int aw = a[2] - a[0];
        if (frames.isEmpty() || aw < 4) return 0.5f;
        double[] weight = new double[aw];
        for (int i = 0; i < frames.size(); i++) {
            int[] f = frames.get(i);
            for (int y = a[1]; y < a[3]; y++)
                for (int x = a[0]; x < a[2]; x++) {
                    int k = x - a[0];
                    if (x + 1 < a[2]) {
                        double d = Math.abs(f[y * W + x + 1] - f[y * W + x]);
                        weight[k] += d / 2;
                        weight[k + 1] += d / 2;
                    }
                    if (i > 0) weight[k] += Math.abs(f[y * W + x] - frames.get(i - 1)[y * W + x]);
                }
        }
        int band = Math.max(1, Math.min(aw, (int) Math.round(aw * CROP_SHARE)));
        int room = aw - band;
        if (room <= 0) return 0.5f;
        double centre = sum(weight, room / 2, band);
        int bestAt = room / 2;
        double best = centre;
        for (int s = 0; s <= room; s++) {
            double v = sum(weight, s, band);
            if (v > best || v == best && Math.abs(s * 2 - room) < Math.abs(bestAt * 2 - room)) {
                best = v;
                bestAt = s;
            }
        }
        if (best <= centre * CROP_LEAD) return 0.5f;
        return bestAt / (float) room;
    }

    private static double sum(double[] w, int from, int n) {
        double s = 0;
        for (int i = from; i < from + n; i++) s += w[i];
        return s;
    }

    // ---------------------------------------------------------------------------------- real frames

    static float change(int[] a, int[] b) {
        long sum = 0;
        for (int i = 0; i < a.length; i++) sum += Math.abs(a[i] - b[i]);
        return sum / (float) a.length;
    }

    /** The times of the first frame after each cut (a lone large change, not movement or a dissolve). */
    static List<Long> cuts(List<int[]> frames, long[] times) {
        List<Long> out = new ArrayList<>();
        if (frames.size() < 3) return out;
        float[] d = new float[frames.size()];
        for (int i = 1; i < frames.size(); i++) d[i] = change(frames.get(i - 1), frames.get(i));
        for (int i = 1; i < frames.size(); i++) {
            float before = i > 1 ? d[i - 1] : 0, after = i + 1 < frames.size() ? d[i + 1] : 0;
            if (d[i] >= CUT && d[i] >= 3 * Math.max(Math.max(before, after), 2)) out.add(times[i]);
        }
        return out;
    }

    /** More than three flashes in any one second over a quarter of the picture or more (frames before [untilMs]). */
    static boolean flashing(List<int[]> frames, long[] times, long untilMs) {
        List<Long> at = new ArrayList<>();
        List<Boolean> up = new ArrayList<>();
        for (int i = 1; i < frames.size() && times[i] < untilMs; i++) {
            int[] a = frames.get(i - 1), b = frames.get(i);
            int cells = 0, sum = 0;
            for (int k = 0; k < a.length; k++) {
                int step = b[k] - a[k];
                if (Math.abs(step) >= FLASH_STEP) {
                    cells++;
                    sum += step;
                }
            }
            if (cells >= a.length * FLASH_AREA && sum != 0) {
                at.add(times[i]);
                up.add(sum > 0);
            }
        }
        for (int i = 0; i < at.size(); i++) {
            int changes = 1;
            boolean last = up.get(i);
            for (int j = i + 1; j < at.size() && at.get(j) - at.get(i) <= 1000; j++)
                if (up.get(j) != last) {
                    changes++;
                    last = up.get(j);
                }
            if (changes >= FLASH_CHANGES) return true;
        }
        return false;
    }

    /**
     * Where the loop ends (ms from the clip's start): on the last cut leaving it 5 to 9 s long, else 8 s
     * or where the frames end; moved to earlier cuts while it flashes. -1 when it still flashes.
     */
    static long end(List<int[]> frames, long[] times, long framesEndMs) {
        List<Long> cuts = cuts(frames, times);
        long end = -1;
        for (long c : cuts) if (c >= MIN_LOOP_MS && c <= MAX_LOOP_MS && c <= framesEndMs) end = c;
        if (end < 0) end = Math.max(1, Math.min(WINDOW_MS, framesEndMs));
        while (flashing(frames, times, end)) {
            long earlier = -1;
            for (long c : cuts) if (c < end && c >= MIN_LOOP_MS) earlier = c;
            if (earlier < 0) return -1;
            end = earlier;
        }
        return end;
    }
}
