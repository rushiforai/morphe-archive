package app.tikkamasalla.stremio.oneahead;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Set;

/**
 * Pure display rules for one-ahead results (no Android, no IO): a result becomes
 * segments of source "One-ahead", the lowest source of all. It only
 * fills a type no real source has, it never narrows or merges, and credits keep
 * the usual sanity (40% rule, 600 s cap). The intent form carries times, size
 * and hash only, never a link or token.
 */
public final class OneAheadShow {
    public static final String EXTRA = "tikka.oneahead";
    public static final double DURATION_TOL_S = 2.0;

    private OneAheadShow() {}

    /** One display segment: label "OP" or "credits", seconds. */
    public static final class Seg {
        public final String label;
        public final double start, end;
        public final String source;
        public Seg(String label, double start, double end) {
            this(label, start, end, OneAheadResult.SOURCE);
        }
        public Seg(String label, double start, double end, String source) {
            this.label = label; this.start = start; this.end = end; this.source = source;
        }
    }

    public static boolean isOneAhead(String source) {
        return source != null && (source.startsWith(OneAheadResult.SOURCE) || source.equals(OneAheadResult.BORROWED));
    }

    /** Detector types to display labels; anything else is not shown. */
    public static List<Seg> fromResult(OneAheadResult r) {
        List<Seg> out = new ArrayList<>();
        if (r == null) return out;
        for (OneAheadResult.Segment s : r.segments) {
            if ("intro".equals(s.type)) out.add(new Seg("OP", s.start, s.end, s.source));
            else if ("credits".equals(s.type)) out.add(new Seg("credits", s.start, s.end, s.source));
        }
        return out;
    }

    /** The credits/intro sanity every source gets (600 s cap, OP 60%, credits 40%). */
    public static boolean sane(Seg s, double runtimeSec) {
        if (s == null || !Double.isFinite(s.start) || !Double.isFinite(s.end)
                || s.start < 0 || s.end <= s.start || s.end - s.start > 600.0) return false;
        if (runtimeSec > 0) {
            if ("OP".equals(s.label) && s.start > runtimeSec * 0.60) return false;
            if ("credits".equals(s.label) && s.start < runtimeSec * 0.40) return false;
        }
        return true;
    }

    /** Only types no real source has; a real source for the type wins in any order. */
    public static List<Seg> selectLowest(Set<String> realLabels, List<Seg> cands, double runtimeSec) {
        List<Seg> out = new ArrayList<>();
        if (cands == null) return out;
        java.util.Set<String> seen = new java.util.HashSet<>();
        for (Seg s : cands) {
            if (realLabels != null && realLabels.contains(s.label)) continue;
            if (!seen.add(s.label)) continue; // one shown segment per type
            if (!sane(s, runtimeSec)) continue;
            out.add(s);
        }
        return out;
    }

    /** Every real source has answered (or given up); only then may One-ahead fill a type. */
    public static boolean lookupsDone(boolean onlineDone, boolean chaptersSettled) {
        return onlineDone && chaptersSettled;
    }

    /** What One-ahead shows right now: nothing until the real lookups finish, then only missing types. */
    public static List<Seg> fill(Set<String> realLabels, List<Seg> cands, double runtimeSec, boolean lookupsDone) {
        return lookupsDone ? selectLowest(realLabels, cands, runtimeSec) : new ArrayList<Seg>();
    }

    /** Vimu drops the hand-off when the real duration moved more than 2 s. */
    public static boolean durationOk(double expectedSec, double realSec) {
        return expectedSec > 0 && realSec > 0 && Math.abs(expectedSec - realSec) <= DURATION_TOL_S;
    }

    /** "1;size;hashHex;durSec;OP,start,end;credits,start,end" — times, size, hash only. */
    public static String encode(long size, long hash, double durSec, List<Seg> segs) {
        StringBuilder b = new StringBuilder("1;");
        b.append(size).append(';').append(Long.toHexString(hash)).append(';')
                .append(String.format(Locale.US, "%.3f", durSec));
        if (segs != null) for (Seg s : segs) {
            b.append(';').append(s.label).append(',')
                    .append(String.format(Locale.US, "%.3f", s.start)).append(',')
                    .append(String.format(Locale.US, "%.3f", s.end));
            if (OneAheadResult.BORROWED.equals(s.source)) b.append(",b");
            else if (OneAheadResult.THEME.equals(s.source)) b.append(",t");
        }
        return b.toString();
    }

    /** Parsed hand-off, or null when malformed. */
    public static final class Handoff {
        public final long size, hash;
        public final double durSec;
        public final List<Seg> segs;
        private int boundGen = -1, lastPosMs;
        private boolean bound, dead;
        Handoff(long size, long hash, double durSec, List<Seg> segs) {
            this.size = size; this.hash = hash; this.durSec = durSec; this.segs = segs;
        }

        /**
         * True while the player is still on the file this hand-off was launched with. It binds to
         * the media generation of its first tick and dies for good on any change; Vimu cannot read
         * size or hash, and an equal duration proves nothing (episodes can match within 0.5 s). A
         * jump back to the start also kills it: a next file the player did not report, or a restart,
         * and losing a button on a restart costs nothing.
         */
        public boolean stillThisFile(int mediaGen, int posMs, int durationMs) {
            if (dead) return false;
            if (!bound) { bound = true; boundGen = mediaGen; }
            if (mediaGen != boundGen) dead = true;
            if (durationMs <= 0) return !dead; // a file still loading must not hide the jump
            if (lastPosMs > 60_000 && posMs < 15_000) dead = true;
            lastPosMs = posMs;
            return !dead;
        }
    }

    public static Handoff decode(String v) {
        try {
            if (v == null || !v.startsWith("1;")) return null;
            String[] p = v.split(";");
            if (p.length < 4) return null;
            long size = Long.parseLong(p[1]);
            long hash = Long.parseUnsignedLong(p[2], 16);
            double dur = Double.parseDouble(p[3]);
            if (size <= 0 || hash == 0 || !Double.isFinite(dur) || dur <= 0) return null;
            List<Seg> segs = new ArrayList<>();
            for (int i = 4; i < p.length; i++) {
                String[] f = p[i].split(",");
                if (f.length < 3 || f.length > 4 || !("OP".equals(f[0]) || "credits".equals(f[0]))) return null;
                double a = Double.parseDouble(f[1]), b = Double.parseDouble(f[2]);
                if (!Double.isFinite(a) || !Double.isFinite(b) || a < 0 || b <= a) continue;
                String src = OneAheadResult.SOURCE;
                if (f.length == 4) {
                    if ("b".equals(f[3])) src = OneAheadResult.BORROWED;
                    else if ("t".equals(f[3])) src = OneAheadResult.THEME;
                    else return null; // malformed tag: no segments rather than a wrong source
                }
                segs.add(new Seg(f[0], a, b, src));
            }
            return segs.isEmpty() ? null : new Handoff(size, hash, dur, segs);
        } catch (RuntimeException bad) { return null; }
    }
}
