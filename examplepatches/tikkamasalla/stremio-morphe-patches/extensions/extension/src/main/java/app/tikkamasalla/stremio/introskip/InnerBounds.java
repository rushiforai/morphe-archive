package app.tikkamasalla.stremio.introskip;

/**
 * Pure inner-bounds decision (no Android classes), unit tested standalone: two online
 * sources giving the same type and agreeing closely keep only max(starts)-min(ends),
 * so a lone source running into the story (0-95.879 vs 0-90.0) cannot eat story.
 * Chapter windows never narrow; to-end credits take the other source's real end.
 */
public final class InnerBounds {
    static final double TOL_S = 15.0;
    static final double MIN_OVERLAP_S = 1.0; // same rule as Bridge overlaps()

    private InnerBounds() {
    }

    /** Source families for the zero-start rule: 1 TheIntroDB, 2 IntroDB.app/SkipDB
     * (copies of each other), 3 AniSkip; 0 = chapters, Own times, anything else. */
    static int familyOf(String source) {
        if (source == null) return 0;
        if (source.startsWith("IntroDB.app") || source.startsWith("SkipDB")) return 2;
        if (source.startsWith("AniSkip")) return 3;
        if (source.startsWith("IntroDB")) return 1;
        return 0;
    }

    /** True when a (<= 0.5 s start) is contradicted by b of another family holding the
     * same type entirely elsewhere: no overlap and b starts > 15 s after a. */
    static boolean zeroConflict(double aStart, double aEnd, String aSource,
                                double bStart, double bEnd, String bSource) {
        int fa = familyOf(aSource), fb = familyOf(bSource);
        if (fa == 0 || fb == 0 || fa == fb) return false;
        if (aStart > 0.5 || aEnd <= aStart || bEnd <= bStart) return false;
        return bStart > aStart + TOL_S && bStart >= aEnd;
    }

    /** Auto credits skip only up to this final length for an online source (measured: windows
     * that ate a mid-credits scene ran 277-326 s, ones that survived about 100 s; our 108 checked
     * credits have median 89 s, 90th percentile 104 s). Longer ones show the button instead. */
    public static final double LONG_ONLINE_CREDITS_S = 180.0;

    /** True for credits from an online database (TheIntroDB, IntroDB.app, SkipDB, AniSkip, or
     * their merged inner-bounds results; any case) whose final length is over the limit.
     * Chapters and Own times are exempt, they are checked. Pure; no Android classes. */
    public static boolean longOnlineCredits(boolean credits, String source, double lengthSeconds) {
        if (!credits || source == null || !(lengthSeconds > LONG_ONLINE_CREDITS_S)) return false;
        String s = source.toLowerCase(java.util.Locale.US);
        return s.startsWith("introdb") || s.startsWith("skipdb") || s.startsWith("aniskip");
    }

    static boolean chapterGuarded(String source) {
        return source != null && (source.startsWith("chapter ")
                || source.contains("snapped to chapters"));
    }

    private static boolean unboundedToEnd(double start, double end, String source) {
        if (end <= start || end > 86400.0) return true;
        if (source == null) return false;
        String lower = source.toLowerCase(java.util.Locale.US);
        // An already-narrowed segment carries a real end even if a parent source
        // was marked to-end; the marker must not resurrect unbounded handling.
        if (lower.contains("inner-bounds")) return false;
        return lower.contains("to-end") || lower.contains("to end");
    }

    /** {start, end} narrowed or null (keep first); why notes narrowing and >15 s
     * disagreements for the caller to log. Disjoint windows: null silently.
     * runtime <= 0 = unknown (EOF to-end detection off). */
    static double[] narrow(String label, double aStart, double aEnd, String aSource,
                           double bStart, double bEnd, String bSource, double runtime,
                           StringBuilder why) {
        if (label == null || aStart != aStart || aEnd != aEnd || bStart != bStart || bEnd != bEnd) return null;
        if (chapterGuarded(aSource) || chapterGuarded(bSource)) return null;
        double maxStart = Math.max(aStart, bStart);
        double startDiff = Math.abs(aStart - bStart);
        boolean credits = "credits".equals(label);
        boolean aUnb = credits && unboundedToEnd(aStart, aEnd, aSource);
        boolean bUnb = credits && unboundedToEnd(bStart, bEnd, bSource);
        boolean aEof = credits && !aUnb && runtime > 0 && aEnd > aStart && aEnd >= runtime - 0.5;
        boolean bEof = credits && !bUnb && runtime > 0 && bEnd > bStart && bEnd >= runtime - 0.5;
        // Exactly one side to-end: an unbounded marker beats a plain EOF end; a plain
        // EOF end counts only when the other side really ends earlier.
        double toEndEnd = 0, otherEnd = 0, toEndStart = 0;
        boolean toEnd = false, explicit = false;
        if (aUnb != bUnb) {
            toEnd = explicit = true;
            toEndEnd = aUnb ? aEnd : bEnd;
            toEndStart = aUnb ? aStart : bStart;
            otherEnd = aUnb ? bEnd : aEnd;
        } else if (!aUnb && aEof != bEof) {
            double oEnd = aEof ? bEnd : aEnd, oStart = aEof ? bStart : aStart;
            if (oEnd > oStart && oEnd < (aEof ? aEnd : bEnd)) {
                toEnd = true;
                toEndEnd = aEof ? aEnd : bEnd;
                toEndStart = aEof ? aStart : bStart;
                otherEnd = oEnd;
            }
        }
        if (toEnd) {
            if (otherEnd <= maxStart || otherEnd > 86400.0) return null;
            if (startDiff > TOL_S) {
                say(why, label, aStart, aEnd, aSource, bStart, bEnd, bSource, 0, 0, startDiff, -1);
                return null;
            }
            double inner = otherEnd - maxStart;
            if (inner <= MIN_OVERLAP_S) return null;
            // Never widen a finite end; the EOF heuristic must not let a tiny corrupt
            // snippet replace real credits running to EOF.
            if (toEndEnd > toEndStart && toEndEnd <= 86400.0 && otherEnd > toEndEnd) return null;
            if (!explicit && Math.abs(aEnd - bEnd) > TOL_S && inner < TOL_S) return null;
            say(why, label, aStart, aEnd, aSource, bStart, bEnd, bSource, maxStart, otherEnd, 0, 0);
            return new double[]{maxStart, otherEnd};
        }
        if (aEnd <= aStart || bEnd <= bStart || aEnd > 86400.0 || bEnd > 86400.0) return null;
        double minEnd = Math.min(aEnd, bEnd);
        if (minEnd - maxStart <= MIN_OVERLAP_S) return null;
        double endDiff = Math.abs(aEnd - bEnd);
        if (startDiff > TOL_S || endDiff > TOL_S) {
            say(why, label, aStart, aEnd, aSource, bStart, bEnd, bSource, 0, 0, startDiff, endDiff);
            return null;
        }
        say(why, label, aStart, aEnd, aSource, bStart, bEnd, bSource, maxStart, minEnd, 0, 0);
        return new double[]{maxStart, minEnd};
    }

    private static void say(StringBuilder why, String label, double aStart, double aEnd,
                            String aSource, double bStart, double bEnd, String bSource,
                            double start, double end, double startDiff, double endDiff) {
        if (why == null) return;
        why.append("Inner bounds ").append(label);
        if (startDiff > 0 || endDiff > 0) {
            why.append(" disagree >15s (startDiff=").append(startDiff).append(", endDiff=")
                    .append(endDiff).append("), keeping first:");
        } else {
            why.append(":");
        }
        why.append(" [").append(aSource).append("] ").append(aStart).append('-').append(aEnd)
                .append(" + [").append(bSource).append("] ").append(bStart).append('-').append(bEnd);
        if (startDiff == 0 && endDiff == 0) why.append(" -> ").append(start).append('-').append(end);
    }

    /** Online credits in the first 40% of a known runtime are a mislabeled opening
     * (live AniSkip ed 11-101 of 1470 s): drop with or without an OP. Chapter credits
     * keep their own rules; unknown runtime keeps the caller's overlap-only rule. */
    /** Folds a probe into running bounds; null if that inverts/shrinks below
     * MIN_OVERLAP_S. An invalid running end (to-end sentinel) takes the probe end. */
    static double[] combine(double curStart, double curEnd, double probeStart, double probeEnd) {
        double s = Math.max(curStart, probeStart);
        double e = curEnd > curStart ? Math.min(curEnd, probeEnd) : probeEnd;
        return e - s > MIN_OVERLAP_S ? new double[]{s, e} : null;
    }

    static boolean dropEarlyOnlineCredits(boolean credits, String source, double start, double runtime) {
        return credits && runtime > 0 && start < runtime * 0.40 && !chapterGuarded(source);
    }
}
