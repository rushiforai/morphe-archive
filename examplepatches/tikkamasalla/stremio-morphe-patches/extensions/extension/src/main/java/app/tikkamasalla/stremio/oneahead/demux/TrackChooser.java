package app.tikkamasalla.stremio.oneahead.demux;

import java.util.List;
import java.util.Locale;

/**
 * Picks the audio track to decode. A reference in another language votes on the wrong audio, so a
 * known language with no match gives no track at all rather than a guess.
 */
public final class TrackChooser {
    /** Which decoders exist, answered by the Android side or a test stub. */
    public interface Probe {
        boolean canDecode(String mime);

        boolean isSoftware(String mime);
    }

    /** How the wanted language was learned. Selected: read off the player. Previous: the last episode's. Unknown: nothing. */
    public static final String SELECTED = "selected", PREVIOUS = "previous", UNKNOWN = "unknown";

    /**
     * What the viewer is playing. Language may be null or empty when unknown; channels 0 when unknown.
     * Source Previous or Unknown means the player's own track could not be read: the fallback order applies.
     */
    public static final class Request {
        public final String language;
        public final int channels;
        public final String source;

        public Request(String language, int channels) {
            this(language, channels, "");
        }

        public Request(String language, int channels, String source) {
            this.language = language;
            this.channels = channels;
            this.source = source == null ? "" : source;
        }

        boolean fallback() {
            return PREVIOUS.equals(source) || UNKNOWN.equals(source);
        }
    }

    private static final int MAX_COST = 8 * 240;

    private TrackChooser() {
    }

    /** The best track, or null when none can stand in for what the viewer plays. */
    public static TrackInfo choose(List<TrackInfo> tracks, Request request, Probe probe) {
        if (tracks == null || request == null || probe == null) return null;
        if (request.fallback()) return chooseFallback(tracks, request, probe);
        String want = normalize(request.language);
        TrackInfo best = null;
        int bestScore = -1;
        for (TrackInfo t : tracks) {
            if (t == null || t.unreadable || t.mime == null || !probe.canDecode(t.mime)) continue;
            String lang = normalize(t.language);
            int score = 0;
            if (!want.isEmpty()) {
                if (lang.equals(want)) score += 10000;
                else if (!lang.isEmpty() || tracks.size() > 1) continue; // A lone unlabeled track may stand in.
            }
            if (isAside(t)) {
                if (!want.isEmpty() || tracks.size() > 1) continue;
            }
            score += rank(t, request, probe);
            if (score > bestScore) {
                bestScore = score;
                best = t;
            }
        }
        return best;
    }

    private static boolean isAside(TrackInfo t) {
        String name = t.name == null ? "" : t.name.toLowerCase(Locale.ROOT);
        return t.commentary || t.visualImpaired || name.contains("commentary")
                || name.contains("description") || name.contains("descriptive");
    }

    /** Channel closeness, decode cost, default flag and file order: everything but the language. */
    private static int rank(TrackInfo t, Request request, Probe probe) {
        int score = 0;
        if (request.channels > 0) score += 2000 - 300 * Math.min(6, Math.abs(t.channels - request.channels));
        if (probe.isSoftware(t.mime)) score += 200;
        score += MAX_COST - decodeCost(t);
        if (t.isDefault) score += 100;
        score += Math.max(0, 40 - t.number);
        return score;
    }

    /**
     * The player's track is unknown. In order: the file's default-flagged track, then the previous episode's
     * language, then the first track that is not commentary. Same rule for the target and every reference.
     */
    private static TrackInfo chooseFallback(List<TrackInfo> tracks, Request request, Probe probe) {
        String prev = normalize(request.language);
        TrackInfo def = null, same = null, first = null;
        int defScore = -1, sameScore = -1;
        for (TrackInfo t : tracks) {
            if (t == null || t.unreadable || t.mime == null || !probe.canDecode(t.mime)) continue;
            if (isAside(t) && tracks.size() > 1) continue;
            int score = rank(t, request, probe);
            if (t.isDefault && score > defScore) { def = t; defScore = score; }
            if (!prev.isEmpty() && normalize(t.language).equals(prev) && score > sameScore) { same = t; sameScore = score; }
            if (first == null) first = t;
        }
        return def != null ? def : same != null ? same : first;
    }

    /**
     * Why this track won, in the log's words: language match, channel closeness, then codec cost.
     * The same rule ranks every file, so the target and its references read the same track.
     */
    public static String reason(List<TrackInfo> tracks, TrackInfo picked, Request request) {
        if (picked == null || request == null) return "no-track";
        String want = normalize(request.language);
        String got = normalize(picked.language);
        if (request.fallback()) {
            // Only the first step can pick a default-flagged track, so the flag names the step.
            String step = picked.isDefault ? "default-flag" : !want.isEmpty() && got.equals(want) ? "previous-episode" : "first-main";
            String w = step.equals("previous-episode") ? want : got;
            return "want=" + (w.isEmpty() ? "-" : w) + " via=" + step + " lang=" + (got.isEmpty() ? "-" : got)
                    + " ch=" + picked.channels + " codec=" + picked.mime;
        }
        return "want=" + (want.isEmpty() ? "-" : want) + " via=" + (SELECTED.equals(request.source) ? "player-selected" : "request")
                + " " + describe(picked, request, want, got);
    }

    private static String describe(TrackInfo picked, Request request, String want, String got) {
        if (!want.isEmpty() && got.equals(want)) {
            StringBuilder b = new StringBuilder("lang=" + got);
            if (request.channels > 0) b.append(picked.channels == request.channels ? " ch-match=" + picked.channels : " ch=" + picked.channels + "-vs-" + request.channels);
            else b.append(" ch=" + picked.channels);
            return b.append(" codec=" + picked.mime).toString();
        }
        if (want.isEmpty()) return "no-want ch=" + picked.channels + " codec=" + picked.mime;
        return "lang-fallback ch=" + picked.channels + " codec=" + picked.mime;
    }

    /**
     * Rough work to decode a track, so among tracks of one language the cheapest wins even over the
     * default flag: a stereo AC3 beats 7.1 TrueHD. One step outweighs the default flag and the track order.
     * E-AC3 ranks cheapest: on the Streamer the viewer plays the main E-AC3 track, and the job must
     * read that same track, not a same-layout dub in a cheaper codec.
     */
    static int decodeCost(TrackInfo t) {
        int perChannel;
        switch (t.mime) {
            case "audio/eac3":
                perChannel = 30;
                break;
            case "audio/true-hd":
                perChannel = 240;
                break;
            case "audio/vnd.dts":
            case "audio/flac":
                perChannel = 120;
                break;
            default:
                perChannel = 60;
        }
        return perChannel * Math.max(1, Math.min(8, t.channels));
    }

    /** ISO 639-1, 639-2/B, 639-2/T and BCP 47 forms all map to one lower-case code; und and empty to "". */
    public static String normalize(String language) {
        if (language == null) return "";
        String l = language.replace("\u0000", "").trim().toLowerCase(Locale.ROOT);
        int dash = l.indexOf('-');
        if (dash > 0) l = l.substring(0, dash);
        if (l.isEmpty() || l.equals("und") || l.equals("mis") || l.equals("zxx") || l.equals("mul")) return "";
        if (l.length() == 2) {
            try {
                l = new Locale(l).getISO3Language();
            } catch (RuntimeException unknown) {
                return l;
            }
        }
        switch (l) {
            case "ger": return "deu";
            case "fre": return "fra";
            case "chi": return "zho";
            case "dut": return "nld";
            case "gre": return "ell";
            case "per": return "fas";
            case "cze": return "ces";
            case "rum": return "ron";
            case "slo": return "slk";
            case "ice": return "isl";
            case "may": return "msa";
            case "baq": return "eus";
            case "arm": return "hye";
            case "bur": return "mya";
            case "geo": return "kat";
            case "mac": return "mkd";
            case "mao": return "mri";
            case "tib": return "bod";
            case "wel": return "cym";
            case "alb": return "sqi";
            default: return l;
        }
    }
}
