package app.ayham.extension.music.addons;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Pattern;

/**
 * Which of an addon's search rows to open for a YouTube Music song: our rules (protocol.md §3 and
 * §7) on top of BitChord's TrackMatcher. A port of the extension's src/addons/pick.js; the cases
 * are spec/addons/pick-cases.json.
 */
public final class Pick {
    private Pick() {
    }

    static final int MAX_ROWS = 15;          // rows kept for matching
    static final int MAX_OPEN = 3;           // rows opened (stream asked, probed, fitted)
    static final int MAX_OPEN_ATMOS = 1;     // Atmos rows opened, ahead of the stereo ones (the phone's switch): 1 + 3 stays in the 5 /stream a minute
    static final double PREFER_SEC = 3;      // rows this close in length go first
    static final double DOWNLOAD_SLACK_SEC = 2;
    static final double PREVIEW_MAX_SEC = 35, PREVIEW_SONG_SEC = 45;   // (Mornye) a clip this short of a longer song

    public static final String LOSSLESS = "LOSSLESS", HIGH = "HIGH", LOW = "LOW";
    /** Quality tiers asked of an addon (Protocol.paramsFor): Hi-Res or CD by name; LOSSLESS is its best. */
    public static final String HIRES = "HIRES", CD = "CD";
    /** Dolby Atmos (the phone's switch): an Atmos stream's tier, and the Atmos download's (asks for the best). */
    public static final String DOLBY = "ATMOS";

    /** An addon's search row, its fields read leniently. */
    public static final class Row extends TrackMatcher.Candidate {
        public String isrc;
        public String tier;
        public Double kbps;
        public boolean atmos;
        public String streamURL;
        public Map<String, Object> raw;
    }

    public static final class Refusal {
        public final String id, why;

        Refusal(String id, String why) {
            this.id = id;
            this.why = why;
        }
    }

    public static final class Choice {
        /** At most 3 rows, best first. */
        public final List<Row> open = new ArrayList<>();
        /** Atmos rows that match (atmosOk only), at most 1, best first: tried before the stereo ones. */
        public final List<Row> atmos = new ArrayList<>();
        /** In the order the rules refused them. */
        public final List<Refusal> refused = new ArrayList<>();
    }

    public static final class Verdict {
        public final boolean ok;
        public final String why;
        public final Double maxSec;

        Verdict(boolean ok, String why, Double maxSec) {
            this.ok = ok;
            this.why = why;
            this.maxSec = maxSec;
        }
    }

    /** The probe's answer: its status and the two size headers (null when absent). */
    public static final class Head {
        public Integer status;
        public String contentRange;
        public String contentLength;
    }

    private static final Pattern LOSSLESS_TEXT = Pattern.compile("flac|alac|wav|hi[" + Js.WS + "_-]?res|(16|24)[" + Js.WS + "-]?bit|lossless");
    private static final Pattern LOW_TEXT = Pattern.compile(Js.B0 + "low" + Js.B1 + "|128|96|64");
    private static final Pattern HIGH_TEXT = Pattern.compile("320|mp3|aac|opus|high");
    static final Pattern ATMOS = Pattern.compile("atmos|dolby|eac3[_-]?joc|ec-?3", Pattern.CASE_INSENSITIVE);
    private static final Pattern KBPS = Pattern.compile("([0-9]{2,4})[" + Js.WS + "]*kbps", Pattern.CASE_INSENSITIVE);
    private static final Pattern ISRC = Pattern.compile("[A-Z]{2}[A-Z0-9]{3}[0-9]{7}");
    private static final Pattern TOTAL = Pattern.compile("/([0-9]+)[" + Js.WS + "]*\\z");

    /** §3: the tier a row's format text names, or null. */
    public static String tierOf(Object s) {
        String t = Js.text(s).toLowerCase(Locale.ROOT);
        if (t.isEmpty()) return null;
        if (LOSSLESS_TEXT.matcher(t).find()) return LOSSLESS;
        if (LOW_TEXT.matcher(t).find()) return LOW;
        if (HIGH_TEXT.matcher(t).find()) return HIGH;
        return null;
    }

    /** Atmos by NullBeat's flags or by the mode and format text. */
    public static boolean isAtmos(Map<String, Object> raw) {
        if (Boolean.TRUE.equals(Js.flag(raw.get("atmos"), null)) || Boolean.TRUE.equals(Js.flag(raw.get("isAtmos"), null))
                || Boolean.TRUE.equals(Js.flag(raw.get("isAtmosOnly"), null))) return true;
        List<Object> modes = new ArrayList<>();
        modes.add(raw.get("audioMode"));
        if (raw.get("audioModes") instanceof List) modes.addAll((List<?>) raw.get("audioModes"));
        modes.add(raw.get("format"));
        modes.add(raw.get("audioQuality"));
        for (Object m : modes) if (ATMOS.matcher(Js.text(m)).find()) return true;
        return false;
    }

    /** ISRC: 12 letters and digits, case and separators ignored; null when it isn't one. */
    public static String isrcOf(Object v) {
        String s = Js.text(v).toUpperCase(Locale.ROOT).replaceAll("[^A-Z0-9]", "");
        return ISRC.matcher(s).matches() ? s : null;
    }

    @SuppressWarnings("unchecked")
    public static Row rowOf(Object rawValue) {
        Map<String, Object> raw = rawValue instanceof Map ? (Map<String, Object>) rawValue : Collections.<String, Object>emptyMap();
        String q = Js.text(raw.get("format")) + " " + Js.text(raw.get("audioQuality"));
        Row r = new Row();
        r.id = Js.text(raw.get("id"));
        r.title = Js.text(raw.get("title"));
        r.artist = Js.text(raw.get("artist"));
        r.album = raw.get("album") == null ? null : Js.text(raw.get("album"));
        r.durationSec = Js.num(raw.get("duration"));
        r.explicit = Js.flag(raw.get("explicit"), null);
        r.isrc = isrcOf(raw.get("isrc"));
        r.tier = tierOf(q);
        r.kbps = Js.num(Js.group1(KBPS, q));
        r.atmos = isAtmos(raw);
        r.streamURL = Js.truthy(raw.get("streamURL")) ? Js.text(raw.get("streamURL")) : null;
        r.raw = raw;
        return r;
    }

    /**
     * The rows to open, best first (at most 3), and why the others were refused.
     * slackSec: the user's length slack (default 5, clamped to 0-10); forDownload: ±2 s instead.
     */
    public static Choice rowsToOpen(List<?> raws, TrackMatcher.Target target, double slackSec, boolean forDownload) {
        return rowsToOpen(raws, target, slackSec, forDownload, false);
    }

    /**
     * atmosOk (the phone's Dolby Atmos switch, a decoder on the phone): Atmos rows are not refused
     * but matched by the same rules into Choice.atmos (ours, phone only; the extension stays stereo).
     */
    public static Choice rowsToOpen(List<?> raws, TrackMatcher.Target target, double slackSec, boolean forDownload, boolean atmosOk) {
        Choice out = new Choice();
        double slack = forDownload ? DOWNLOAD_SLACK_SEC : Math.min(10, Math.max(0, slackSec));
        Double song = target.durationSec != null && target.durationSec > 0 ? target.durationSec : null;   // 0: unknown
        List<Row> rows = new ArrayList<>();
        if (raws != null) {
            for (int i = 0; i < raws.size() && i < MAX_ROWS; i++) {
                Row r = rowOf(raws.get(i));
                if (!r.id.isEmpty() && !r.title.isEmpty()) rows.add(r);
            }
        }
        // Atmos (another mix than YouTube's) and previews first
        List<Row> usable = new ArrayList<>(), atmos = new ArrayList<>();
        for (Row r : rows) {
            boolean preview = r.durationSec != null && song != null && r.durationSec <= PREVIEW_MAX_SEC && song > PREVIEW_SONG_SEC;
            String why = r.atmos && !atmosOk ? "atmos" : preview ? "preview" : null;
            if (why != null) out.refused.add(new Refusal(r.id, why));
            else if (r.atmos) atmos.add(r);
            else usable.add(r);
        }
        out.open.addAll(matched(usable, target, song, slack, out.refused, MAX_OPEN));
        out.atmos.addAll(matched(atmos, target, song, slack, out.refused, MAX_OPEN_ATMOS));
        return out;
    }

    /** The rows that are this song, best first (at most max); the others go to refused. */
    private static List<Row> matched(List<Row> usable, TrackMatcher.Target target, Double song, double slack, List<Refusal> refused, int max) {
        // ISRC first (ours, from Mornye): an equal ISRC is the same recording, whatever the titles say
        String want = isrcOf(target.isrc);
        List<Row> byIsrc = new ArrayList<>(), rest = new ArrayList<>();
        for (Row r : usable) {
            if (want != null && want.equals(r.isrc)) byIsrc.add(r);
            else rest.add(r);
        }
        TrackMatcher.Target t = target;
        if (song == null) {
            t = target.copy();
            t.durationSec = null;
        }
        List<Row> matched = TrackMatcher.ranked(rest, t);
        for (Row r : rest) if (!containsSame(matched, r)) refused.add(new Refusal(r.id, "not this song"));
        List<Row> ok = new ArrayList<>();
        List<Row> all = new ArrayList<>(byIsrc);
        all.addAll(matched);
        for (Row r : all) {
            if (r.durationSec != null && song != null && Math.abs(r.durationSec - song) > slack) {
                refused.add(new Refusal(r.id, "length"));
                continue;
            }
            ok.add(r);
        }
        // rows within 3 s first, otherwise in the order above
        List<Row> ordered = new ArrayList<>();
        for (Row r : ok) if (near(r, song)) ordered.add(r);
        for (Row r : ok) if (!near(r, song)) ordered.add(r);
        return ordered.size() > max ? new ArrayList<>(ordered.subList(0, max)) : ordered;
    }

    public static Choice rowsToOpen(List<?> raws, TrackMatcher.Target target) {
        return rowsToOpen(raws, target, 5, false);
    }

    private static boolean near(Row r, Double song) {
        return r.durationSec != null && song != null && Math.abs(r.durationSec - song) <= PREFER_SEC;
    }

    private static boolean containsSame(List<Row> rows, Row r) {
        for (Row x : rows) if (x == r) return true;
        return false;
    }

    /**
     * §7: a file too small to hold the whole song at the row's lowest believable bitrate is a cut.
     * The size is Content-Range's total, or Content-Length of a full (200) answer (a 206's is the
     * 1 byte). Unmeasurable is not refused.
     */
    public static Verdict probeVerdict(Head head, String tier, Double kbps, Double songSec, double slackSec) {
        Double total = Js.num(Js.group1(TOTAL, head == null || head.contentRange == null ? "" : head.contentRange));
        if (total == null && head != null && head.status != null && head.status == 200) total = Js.num(head.contentLength);
        if (!(total != null && total > 0) || !(songSec != null && songSec > 0)) return new Verdict(true, null, null);
        double floor = LOSSLESS.equals(tier) ? 200 : Math.min(kbps != null ? kbps : 64, 64);
        double maxSec = (total * 8) / (floor * 1000);
        return maxSec < songSec - slackSec
                ? new Verdict(false, "file holds at most " + Math.round(maxSec) + " s", null)
                : new Verdict(true, null, maxSec);
    }

    // ---- the lossy floor and the lossless pass (protocol.md 8.2.1) ----

    private static final java.util.regex.Pattern LOSSLESS_CODEC = java.util.regex.Pattern.compile("flac|alac|wav|pcm|aiff?", java.util.regex.Pattern.CASE_INSENSITIVE),
            LOSSY_CODEC = java.util.regex.Pattern.compile("mp3|mpeg|aac|mp4a|opus|vorbis|ogg", java.util.regex.Pattern.CASE_INSENSITIVE);
    static final double FLOOR_KBPS = 96, YT_KBPS_USUAL = 160;

    private static double n(Double d) {
        return d == null || d.isNaN() ? 0 : d;
    }

    /** 0 lossy, 1 lossless up to 16-bit/48 kHz, 2 Hi-Res. A lossless tier naming a lossy codec is lossy. */
    public static int qualityRank(Protocol.Stream st) {
        String c = st == null || st.codec == null ? "" : st.codec;
        boolean lossless = LOSSLESS_CODEC.matcher(c).find() || (st != null && LOSSLESS.equals(st.tier) && !LOSSY_CODEC.matcher(c).find());
        if (!lossless) return 0;
        return n(st.bitDepth) > 16 || n(st.sampleRate) > 48000 ? 2 : 1;
    }

    /** Lossless always; lossy at 96 kbps or more over YouTube's (160 when unknown): null, or why not. */
    public static String floorRefusal(Protocol.Stream st, double ytKbps) {
        if (qualityRank(st) >= 1) return null;
        double yt = ytKbps > 0 ? ytKbps : YT_KBPS_USUAL, b = n(st == null ? null : st.bitrate);
        if (b <= 0) return "lossy, bitrate unknown";
        return b >= yt + FLOOR_KBPS ? null : "lossy " + Js.number(b) + " kbps, not " + Js.number(FLOOR_KBPS) + " kbps over YouTube's " + Js.number(yt);
    }

    /** The pass after a copy plays: which addons are asked again, for what. */
    public static final class Upgrade {
        public final boolean aboveOnly;
        public final int minRank;

        Upgrade(boolean aboveOnly, int minRank) {
            this.aboveOnly = aboveOnly;
            this.minRank = minRank;
        }
    }

    /**
     * null: no pass. A lossy copy: every addon asked again for lossless (when the tier asked is
     * lossless). A cached copy under the tier asked: only the addons ranked above it, for better.
     */
    public static Upgrade upgradeWanted(Protocol.Stream st, String tier, boolean cached) {
        return upgradeWanted(qualityRank(st), tier, cached);
    }

    /** The same, by the copy's qualityRank (what AddonPrep keeps of a playing copy). */
    public static Upgrade upgradeWanted(int r, String tier, boolean cached) {
        int want = LOSSLESS.equals(tier) || HIRES.equals(tier) ? 2 : CD.equals(tier) ? 1 : 0;
        if (r >= want) return null;
        if (cached) return new Upgrade(true, r + 1);
        return r == 0 ? new Upgrade(false, 1) : null;
    }
}
