package app.morphe.extension.chmate;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/** Pure Java perceptual fingerprinting and one-to-one reference/attachment matching. */
public final class RegisteredImageHash {
    public static final int STRICT = 0, STANDARD = 1, WIDE = 2, SIMILAR = 3;
    private static final int SIDE = 32;
    private static final double[][] COS = new double[8][SIDE];
    static {
        for (int u = 0; u < 8; u++)
            for (int x = 0; x < SIDE; x++) COS[u][x] = Math.cos((2 * x + 1) * u * Math.PI / 64);
    }

    public static final class Stamp {
        public final long phash, dhash;
        public final double aspect;
        /** Unsigned 32x32 luminance samples, for resizing/recompression validation. */
        public final byte[] gray;
        public Stamp(long phash, long dhash, double aspect) {
            this(phash, dhash, aspect, null);
        }
        public Stamp(long phash, long dhash, double aspect, byte[] gray) {
            this.phash = phash; this.dhash = dhash; this.aspect = aspect;
            this.gray = gray == null ? null : gray.clone();
        }
    }

    private RegisteredImageHash() { }

    /** ARGB pixels, already scaled to 32x32; the original aspect ratio is retained. */
    public static Stamp calculate(int[] argb, int originalWidth, int originalHeight) {
        if (argb == null || argb.length != SIDE * SIDE || originalWidth < 8 || originalHeight < 8)
            throw new IllegalArgumentException("Invalid image dimensions");
        double[] gray = new double[argb.length];
        double mean = 0;
        for (int i = 0; i < argb.length; i++) {
            int c = argb[i];
            gray[i] = (0.299 * ((c >>> 16) & 255) + 0.587 * ((c >>> 8) & 255) + 0.114 * (c & 255));
            mean += gray[i];
        }
        mean /= gray.length;
        double variance = 0;
        for (double v : gray) variance += (v - mean) * (v - mean);
        if (variance / gray.length < 100) return null; // Flat images are too ambiguous to hide posts.

        double[] coefficients = new double[63]; int index = 0;
        double[][] horizontal = new double[8][SIDE];
        for (int u = 0; u < 8; u++) for (int y = 0; y < SIDE; y++) {
            double sum = 0;
            for (int x = 0; x < SIDE; x++) sum += gray[y * SIDE + x] * COS[u][x];
            horizontal[u][y] = sum;
        }
        for (int v = 0; v < 8; v++) for (int u = 0; u < 8; u++) {
            if (u == 0 && v == 0) continue;
            double sum = 0;
            for (int y = 0; y < SIDE; y++) sum += horizontal[u][y] * COS[v][y];
            coefficients[index++] = sum;
        }
        double[] sorted = coefficients.clone(); Arrays.sort(sorted);
        double median = sorted[sorted.length / 2]; long phash = 0;
        for (int i = 0; i < coefficients.length; i++) if (coefficients[i] > median) phash |= 1L << i;
        long dhash = 0;
        for (int y = 0; y < 8; y++) for (int x = 0; x < 8; x++) {
            int offset = Math.round(y * 31f / 7) * SIDE;
            int left = offset + Math.round(x * 31f / 8);
            int right = offset + Math.round((x + 1) * 31f / 8);
            if (gray[left] > gray[right]) dhash |= 1L << (y * 8 + x);
        }
        byte[] pixels = new byte[gray.length];
        for (int i = 0; i < gray.length; i++) pixels[i] = (byte) Math.round(gray[i]);
        return new Stamp(phash, dhash, (double) originalWidth / originalHeight, pixels);
    }

    public static boolean similar(Stamp first, Stamp second) {
        return similar(first, second, STANDARD);
    }

    /** Levels are opt-in; high levels permit structurally similar but different pictures. */
    public static boolean similar(Stamp first, Stamp second, int level) {
        level = Math.max(STRICT, Math.min(SIMILAR, level));
        return first != null && second != null && first.aspect > 0 && second.aspect > 0
                && Math.abs(Math.log(first.aspect / second.aspect)) <= new double[]{.08, .16, .27, .45}[level]
                && Long.bitCount(first.phash ^ second.phash) <= new int[]{8, 12, 17, 23}[level]
                && Long.bitCount(first.dhash ^ second.dhash) <= new int[]{8, 14, 21, 29}[level]
                && (level == SIMILAR || ssim(first, second) >= new double[]{.87, .76, .59}[level]);
    }

    /** Global SSIM of normalized luminance. Invalid/missing pixels cannot cause hiding. */
    public static double ssim(Stamp first, Stamp second) {
        if (first == null || second == null || first.gray == null || second.gray == null
                || first.gray.length != 1024 || second.gray.length != 1024) return -1;
        double a = 0, b = 0;
        for (int i = 0; i < 1024; i++) { a += first.gray[i] & 255; b += second.gray[i] & 255; }
        a /= 1024; b /= 1024;
        double va = 0, vb = 0, cov = 0;
        for (int i = 0; i < 1024; i++) {
            double x = (first.gray[i] & 255) - a, y = (second.gray[i] & 255) - b;
            va += x * x; vb += y * y; cov += x * y;
        }
        va /= 1024; vb /= 1024; cov /= 1024;
        double c1 = Math.pow(0.01 * 255, 2), c2 = Math.pow(0.03 * 255, 2);
        return (2 * a * b + c1) * (2 * cov + c2)
                / ((a * a + b * b + c1) * (va + vb + c2));
    }

    /** Near-identical copies (including re-encoded or resized files) count as one image. */
    public static boolean sameImage(Stamp first, Stamp second) {
        return first != null && second != null && first.aspect > 0 && second.aspect > 0
                && Math.abs(Math.log(first.aspect / second.aspect)) <= .04
                && Long.bitCount(first.phash ^ second.phash) <= 12
                && Long.bitCount(first.dhash ^ second.dhash) <= 10
                && ssim(first, second) >= .975;
    }

    /** Each distinct attachment and each registered image can count at most once. */
    public static int matchingCount(List<Stamp> references, List<String> urls, Map<String, Stamp> resolved) {
        return matchingCount(references, urls, resolved, STANDARD);
    }

    public static int matchingCount(List<Stamp> references, List<String> urls, Map<String, Stamp> resolved, int level) {
        if (references == null || urls == null || resolved == null || references.isEmpty()) return 0;
        Set<String> uniqueUrls = new LinkedHashSet<>(urls);
        List<Stamp> attachments = new ArrayList<>();
        for (String url : uniqueUrls) {
            Stamp stamp = resolved.get(url);
            if (stamp == null) continue;
            boolean duplicate = false;
            for (Stamp seen : attachments) if (sameImage(stamp, seen)) { duplicate = true; break; }
            if (!duplicate) attachments.add(stamp);
        }
        List<Stamp> distinctReferences = new ArrayList<>();
        for (Stamp stamp : references) {
            if (stamp == null) continue;
            boolean duplicate = false;
            for (Stamp seen : distinctReferences) if (sameImage(stamp, seen)) { duplicate = true; break; }
            if (!duplicate) distinctReferences.add(stamp);
        }
        int[] assigned = new int[distinctReferences.size()]; Arrays.fill(assigned, -1);
        int count = 0;
        for (int i = 0; i < attachments.size(); i++)
            if (augment(i, attachments, distinctReferences, assigned, new boolean[distinctReferences.size()], level)) count++;
        return count;
    }

    private static boolean augment(int image, List<Stamp> attachments, List<Stamp> refs,
                                   int[] assigned, boolean[] visited, int level) {
        for (int ref = 0; ref < refs.size(); ref++) {
            if (visited[ref] || !similar(attachments.get(image), refs.get(ref), level)) continue;
            visited[ref] = true;
            if (assigned[ref] == -1 || augment(assigned[ref], attachments, refs, assigned, visited, level)) {
                assigned[ref] = image; return true;
            }
        }
        return false;
    }
}
