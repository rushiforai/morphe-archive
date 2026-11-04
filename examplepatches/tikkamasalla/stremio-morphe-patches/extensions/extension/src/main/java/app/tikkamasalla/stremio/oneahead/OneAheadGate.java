package app.tikkamasalla.stremio.oneahead;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Locale;

/**
 * Pure decisions of the one-ahead wiring (no Android, no IO): when the detector may
 * start, which files may vote, and how a file is identified. The Android glue in
 * OneAheadTrigger supplies measured facts; everything here is unit tested.
 */
public final class OneAheadGate {
    private OneAheadGate() {}

    // ---- trigger -----------------------------------------------------------

    /**
     * Null starts the runner; otherwise one refusal word for the log. The lookup
     * gates only when it found both an intro and credits: a missing one is exactly
     * what the detector can still work out.
     */
    public static String decide(boolean settingOn, boolean series, boolean directHttp,
                                boolean hasIntro, boolean hasCredits, boolean hasResult) {
        if (!settingOn) return "setting-off";
        if (!series) return "not-series";
        if (!directHttp) return "not-direct";
        if (hasIntro && hasCredits) return "already-known";
        if (hasResult) return "has-result";
        return null;
    }

    /** Which steps run for the two switches: borrow copies chapters, detection works out times. */
    public static boolean jobRuns(boolean borrowOn, boolean oneAheadOn) { return borrowOn || oneAheadOn; }
    public static boolean runBorrow(boolean borrowOn) { return borrowOn; }
    public static boolean runDetect(boolean oneAheadOn) { return oneAheadOn; }

    /**
     * The target's refusal word before any read of its link. A link not marked cached is
     * never read by this feature: touching one can start a download in the user's account.
     */
    public static String decideTarget(boolean settingOn, boolean series, String url, boolean cached,
                                      boolean hasIntro, boolean hasCredits, boolean hasResult) {
        if (settingOn && series && !cached) return "not-cached";
        return decide(settingOn, series, isDirectHttp(url), hasIntro, hasCredits, hasResult);
    }

    // ---- prefetch guard (IntroSkipBridge) -------------------------------------

    /** A finished lookup is reported, never fetched again; no length never runs. */
    public static boolean prefetchFetches(long length, boolean hasDone, boolean inflight) {
        return length > 0 && !hasDone && !inflight;
    }

    /** Only a finished result is handed to the trigger; an inflight one stays silent. */
    public static boolean prefetchCallback(long length, boolean hasDone) {
        return length > 0 && hasDone;
    }

    /** The external path starts only with a known next id and a known length. */
    public static boolean externalStarts(String nextVideoId, String metaId, long lengthSec) {
        return nextVideoId != null && nextVideoId.length() > 0
                && metaId != null && metaId.length() > 0 && lengthSec > 0;
    }

    /** Own times stop the run only when every missing type is already covered. */
    public static boolean ownCovers(boolean needIntro, boolean needCredits,
                                    boolean ownIntro, boolean ownCredits) {
        return (ownIntro || ownCredits) && (!needIntro || ownIntro) && (!needCredits || ownCredits);
    }

    public static boolean isDirectHttp(String url) {
        if (url == null) return false;
        String u = url.toLowerCase(Locale.ROOT);
        if (!u.startsWith("http://") && !u.startsWith("https://")) return false;
        // The local streaming server: behind it is a torrent read from the swarm, not a file on a CDN.
        int from = u.indexOf("://") + 3, to = from;
        while (to < u.length() && "/?#".indexOf(u.charAt(to)) < 0) to++;
        String host = u.substring(from, to);
        host = host.substring(host.lastIndexOf('@') + 1);
        if (host.startsWith("[::1]")) return false;
        int port = host.indexOf(':');
        if (port >= 0) host = host.substring(0, port);
        return !(host.equals("localhost") || host.equals("0.0.0.0") || host.matches("127[.][0-9]+[.][0-9]+[.][0-9]+"));
    }

    /** Seconds in a meta runtime ("24 min", "1h 30min", "1h"); 0 when none. Only prices a plan. */
    public static double runtimeSec(String text) {
        if (text == null) return 0;
        java.util.regex.Matcher h = java.util.regex.Pattern.compile("(?i)([0-9]+)[ ]*h").matcher(text);
        java.util.regex.Matcher m = java.util.regex.Pattern.compile("(?i)([0-9]+)[ ]*m").matcher(text);
        long hours = h.find() ? Long.parseLong(h.group(1)) : 0, mins = m.find() ? Long.parseLong(m.group(1)) : 0;
        return (hours * 60 + mins) * 60.0;
    }

    // ---- finale --------------------------------------------------------------

    /** Episodes at the end of a season's list that count as finales: a list can end in a recap or an OVA. */
    public static final int FINALE_TAIL = 2;

    /**
     * The last two listed episodes of a season count as finales. A flagged episode only
     * loses credits without file-end agreement. A missing list treats the TARGET as a
     * finale (safety: without the flag the detector can report a long false credits segment).
     */
    public static boolean isFinale(String episodeId, List<String> seasonIdsInOrder) {
        if (seasonIdsInOrder == null || seasonIdsInOrder.isEmpty()) return true;
        if (episodeId == null) return true;
        // An episode the list does not contain (not yet listed, or another
        // season's) is treated as a finale: the safe direction.
        int at = seasonIdsInOrder.indexOf(episodeId);
        return at < 0 || at >= seasonIdsInOrder.size() - FINALE_TAIL;
    }

    /**
     * Candidate flag: with no list, a candidate is not called a finale (calling
     * every candidate one would make the planner drop them all). With a list,
     * the same rule as the target applies.
     */
    public static boolean candidateFinale(String episodeId, List<String> seasonIdsInOrder) {
        if (seasonIdsInOrder == null || seasonIdsInOrder.isEmpty()) return false;
        return isFinale(episodeId, seasonIdsInOrder);
    }

    // ---- candidates ----------------------------------------------------------

    /**
     * Episodes worth a stream query for references: later ones first, then earlier ones, nearest
     * first, no finales (they cannot vote). Near a season's end the later ones run out.
     */
    public static List<String> queryOrder(List<String> seasonIdsInOrder, String targetId) {
        List<String> out = new ArrayList<>();
        if (seasonIdsInOrder == null) return out;
        int at = seasonIdsInOrder.indexOf(targetId);
        if (at < 0) return out;
        int usableEnd = seasonIdsInOrder.size() - FINALE_TAIL;
        for (int i = at + 1; i < usableEnd; i++) out.add(seasonIdsInOrder.get(i));
        for (int i = Math.min(at, usableEnd) - 1; i >= 0; i--) out.add(seasonIdsInOrder.get(i));
        return out;
    }

    /**
     * The row to read for one reference, from {url, fileName, cached, size} rows: only rows marked
     * cached, the target's release group first (a reference only votes when it matches the target),
     * then the smallest known size.
     */
    public static String[] pickReference(List<String[]> rows, String targetGroup) {
        String[] best = null;
        long bestSize = Long.MAX_VALUE;
        boolean bestSame = false;
        for (String[] row : rows) {
            if (row == null || row.length < 4 || !"1".equals(row[2])) continue;
            long size = Long.MAX_VALUE;
            try { long v = Long.parseLong(row[3]); if (v > 0) size = v; } catch (RuntimeException unknown) { /* last */ }
            boolean same = sameGroup(releaseGroup(row.length > 1 ? row[1] : ""), targetGroup);
            if (best == null || (same && !bestSame) || (same == bestSame && size < bestSize)) {
                best = row; bestSize = size; bestSame = same;
            }
        }
        return best;
    }

    public static final int KIND_CACHED_FEATURES = 0, KIND_NOW_PLAYING = 1, KIND_STREAM = 2;

    /** One reference candidate before identity is measured. sizeBytes 0 = unknown. */
    public static final class Candidate {
        public final String episodeId, fileName;
        public final int kind;
        public final long sizeBytes;
        public Candidate(String episodeId, String fileName, int kind, long sizeBytes) {
            this.episodeId = episodeId; this.fileName = fileName;
            this.kind = kind; this.sizeBytes = sizeBytes;
        }
    }

    /**
     * Reference order: cached features, the file playing now, then queried streams;
     * inside a class, the target's release group first, then smaller files.
     */
    public static List<Candidate> orderCandidates(List<Candidate> in, final String targetGroup) {
        List<Candidate> out = new ArrayList<>();
        if (in != null) for (Candidate c : in) if (c != null) out.add(c);
        out.sort(Comparator.comparingInt((Candidate c) -> c.kind)
                .thenComparing(c -> !sameGroup(releaseGroup(c.fileName), targetGroup))
                .thenComparingLong(c -> c.sizeBytes <= 0 ? Long.MAX_VALUE : c.sizeBytes));
        return out;
    }

    /**
     * The planner re-sorts by (uncached, size), so group preference is enforced by
     * selection: when at least MIN_REFS candidates share the target's release
     * group, only those are passed (at most MAX_REFS); otherwise the ordered list.
     */
    public static List<Candidate> capForPlanner(List<Candidate> ordered, String targetGroup) {
        List<Candidate> out = new ArrayList<>();
        if (ordered == null) return out;
        // Cached features cost nothing and vote best: they always survive.
        for (Candidate c : ordered) {
            if (c.kind == KIND_CACHED_FEATURES) { if (out.size() < OneAheadPlanner.MAX_REFS) out.add(c); }
        }
        if (targetGroup != null && targetGroup.length() > 0) {
            List<Candidate> same = new ArrayList<>();
            for (Candidate c : ordered) {
                if (c.kind != KIND_CACHED_FEATURES && sameGroup(releaseGroup(c.fileName), targetGroup)) same.add(c);
            }
            if (same.size() >= OneAheadPlanner.MIN_REFS) {
                for (Candidate c : same) { if (out.size() >= OneAheadPlanner.MAX_REFS) break; if (!out.contains(c)) out.add(c); }
                return out;
            }
        }
        for (Candidate c : ordered) { if (out.size() >= OneAheadPlanner.MAX_REFS) break; if (!out.contains(c)) out.add(c); }
        return out;
    }

    private static boolean sameGroup(String group, String targetGroup) {
        return group != null && group.length() > 0 && targetGroup != null
                && group.equalsIgnoreCase(targetGroup);
    }

    /** Release group shown by a file name ("...x264-GROUP.mkv", "[GROUP] Show - 02.mkv"), "" when none. */
    public static String releaseGroup(String name) {
        if (name == null) return "";
        String n = name.trim();
        String lower = n.toLowerCase(Locale.ROOT);
        for (String ext : new String[]{".mkv", ".mp4", ".m4v", ".avi", ".ts", ".webm"})
            if (lower.endsWith(ext)) { n = n.substring(0, n.length() - ext.length()); break; }
        if (n.startsWith("[") && n.indexOf(']') > 1) {
            String g = n.substring(1, n.indexOf(']')).trim();
            if (isGroupToken(g)) return g;
        }
        int dash = n.lastIndexOf('-');
        if (dash > 0 && dash < n.length() - 1) {
            String tail = n.substring(dash + 1).trim();
            int bracket = tail.indexOf('[');
            if (bracket > 0) tail = tail.substring(0, bracket).trim(); // "GROUP[rarbg]"
            String head = n.substring(0, dash);
            // A dash tail with a dot is a codec string ("WEB-DL.x264"), not a group.
            if (tail.indexOf('.') < 0 && isGroupToken(tail) && !isSourceToken(tail)
                    && (head.indexOf('.') >= 0 || head.indexOf(' ') >= 0)) return tail;
        }
        if (n.endsWith("]") && n.lastIndexOf('[') > 0) {
            String g = n.substring(n.lastIndexOf('[') + 1, n.length() - 1).trim();
            // A hex tag is a CRC32, not a group: it differs per episode.
            if (isGroupToken(g) && !isCrcTag(g)) return g;
        }
        return "";
    }

    /** Hyphenated source/codec tails ("WEB-DL", "Blu-Ray", "E-AC3") are not release groups. */
    private static boolean isSourceToken(String tail) {
        String u = tail.toUpperCase(Locale.ROOT);
        return u.equals("DL") || u.equals("RAY") || u.equals("AC3") || u.equals("DTS")
                || u.equals("AAC") || u.equals("MP3") || u.equals("TRUEHD") || u.equals("ATMOS")
                || u.equals("HDR") || u.equals("DV") || u.equals("HD") || u.equals("SD") || u.equals("UHD");
    }

    private static boolean isCrcTag(String g) {
        if (g.length() < 6) return false;
        boolean digit = false;
        for (int i = 0; i < g.length(); i++) {
            char c = g.charAt(i);
            if (c >= '0' && c <= '9') digit = true;
            else if (!((c >= 'a' && c <= 'f') || (c >= 'A' && c <= 'F'))) return false;
        }
        return digit;
    }

    private static boolean isGroupToken(String g) {
        if (g == null || g.length() < 2 || g.indexOf(' ') >= 0) return false;
        boolean letter = false;
        for (int i = 0; i < g.length(); i++) {
            char c = g.charAt(i);
            if (Character.isLetter(c)) letter = true;
            else if (!Character.isDigit(c) && c != '.' && c != '_' && c != '-') return false;
        }
        return letter; // a pure number is a year or episode, never a group
    }

    // ---- file identity ---------------------------------------------------------

    /** FNV-1a 64 over the first bytes of a file; never 0 (0 means "unknown" to the planner). */
    public static long headHash(byte[] b, int off, int len) {
        long h = 0xcbf29ce484222325L;
        if (b != null) {
            int end = (int) Math.min((long) b.length, (long) off + Math.max(0, len));
            for (int i = Math.max(0, off); i < end; i++) { h ^= b[i] & 0xFF; h *= 0x100000001b3L; }
        }
        return h == 0 ? 1 : h;
    }

    public static OneAheadPlanner.Container containerOf(String fileName) {
        if (fileName == null) return OneAheadPlanner.Container.UNKNOWN;
        String n = fileName.toLowerCase(Locale.ROOT);
        if (n.endsWith(".mkv")) return OneAheadPlanner.Container.MKV;
        if (n.endsWith(".mp4") || n.endsWith(".m4v")) return OneAheadPlanner.Container.MP4;
        return OneAheadPlanner.Container.UNKNOWN;
    }

    /** Exception class name only: messages can carry a link or token, so they are dropped. */
    public static String safeReason(Throwable t) {
        return t == null ? "none" : t.getClass().getSimpleName();
    }
}
