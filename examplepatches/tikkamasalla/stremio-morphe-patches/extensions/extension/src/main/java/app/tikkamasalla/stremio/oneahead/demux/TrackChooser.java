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

    /** What the viewer is playing. Language may be null or empty when unknown; channels 0 when unknown. */
    public static final class Request {
        public final String language;
        public final int channels;

        public Request(String language, int channels) {
            this.language = language;
            this.channels = channels;
        }
    }

    private static final int MAX_COST = 8 * 240;

    private TrackChooser() {
    }

    /** The best track, or null when none can stand in for what the viewer plays. */
    public static TrackInfo choose(List<TrackInfo> tracks, Request request, Probe probe) {
        String want = normalize(request.language);
        TrackInfo best = null;
        int bestScore = -1;
        for (TrackInfo t : tracks) {
            if (t.unreadable || t.mime == null || !probe.canDecode(t.mime)) continue;
            String lang = normalize(t.language);
            int score = 0;
            if (!want.isEmpty()) {
                if (lang.equals(want)) score += 10000;
                else if (!lang.isEmpty() || tracks.size() > 1) continue; // A lone unlabeled track may stand in.
            }
            String name = t.name.toLowerCase(Locale.ROOT);
            boolean aside = t.commentary || t.visualImpaired || name.contains("commentary")
                    || name.contains("description") || name.contains("descriptive");
            if (aside) {
                if (!want.isEmpty() || tracks.size() > 1) continue;
            }
            if (request.channels > 0) score += 2000 - 300 * Math.min(6, Math.abs(t.channels - request.channels));
            if (probe.isSoftware(t.mime)) score += 200;
            score += MAX_COST - decodeCost(t);
            if (t.isDefault) score += 100;
            score += Math.max(0, 40 - t.number);
            if (score > bestScore) {
                bestScore = score;
                best = t;
            }
        }
        return best;
    }

    /**
     * Rough work to decode a track, so among tracks of one language the cheapest wins even over the
     * default flag: a stereo AC3 beats 7.1 TrueHD. One step outweighs the default flag and the track order.
     */
    static int decodeCost(TrackInfo t) {
        int perChannel;
        switch (t.mime) {
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
