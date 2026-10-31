package app.bitchord.telegram;

import org.json.JSONObject;

import java.util.List;
import java.util.Locale;

/** Legend text for formats, and matching BitChord's search results to Telegram files. */
final class LegendMatch {
    private LegendMatch() {}

    static final int LENGTH_SLACK_SEC = 3;

    /** "FLAC 24bit", "MP3 320kbps", "OPUS"; "" when the codec isn't known. */
    static String label(String codec, Integer bits, Integer kbps) {
        if (codec == null) return "";
        String name;
        boolean lossless = false;
        switch (codec.toLowerCase(Locale.ROOT).trim()) {
            case "flac":
                name = "FLAC";
                lossless = true;
                break;
            case "alac":
                name = "ALAC";
                lossless = true;
                break;
            case "wav":
            case "wave":
            case "pcm":
                name = "WAV";
                lossless = true;
                break;
            case "aif":
            case "aiff":
                name = "AIFF";
                lossless = true;
                break;
            case "mp3":
            case "mpeg":
                name = "MP3";
                break;
            case "aac":
            case "mp4a":
            case "m4a":
            case "mp4":
                name = "AAC";
                break;
            case "opus":
            case "webm":
                name = "OPUS";
                break;
            case "ogg":
            case "vorbis":
                name = "OGG";
                break;
            case "ac3":
                name = "DD";
                break;
            case "eac3":
            case "ec-3":
            case "ec3":
                name = "DD+";
                break;
            case "eac3-joc":
            case "ec3-joc":
                return "Dolby Atmos";
            case "truehd":
                return "TrueHD";
            case "ac4":
            case "ac-4":
                return "AC-4";
            default:
                return "";
        }
        if (lossless) return bits != null && bits > 0 ? name + " " + bits + "bit" : name;
        return kbps != null && kbps > 0 ? name + " " + kbps + "kbps" : name;
    }

    /**
     * The legend for a Telegram search row; the header, when read, gives the bit depth, and a check
     * of the file says when it isn't what it claims ("FLAC 16bit · from ≈128 kbps").
     */
    static String row(JSONObject row, JSONObject header) {
        return LosslessCheck.legend(format(row, header), LosslessCheck.of(row, header));
    }

    private static String format(JSONObject row, JSONObject header) {
        if (header != null) return AudioHeader.label(header);
        String format = row.optString("format").toLowerCase(Locale.ROOT);
        int kbps = TrackDetails.kbps(row.optLong("size"), row.optInt("duration"));
        if (format.equals("m4a") || format.equals("mp4"))
            format = kbps >= TrackDetails.ALAC_KBPS ? "alac" : "aac";
        if (format.equals("aif")) format = "aiff";
        return label(format, null, kbps);
    }

    /** Seconds in "3:29" or "1:02:03", or 0. */
    static int seconds(String text) {
        if (text == null) return 0;
        int total = 0;
        for (String part : text.trim().split(":")) {
            try {
                total = total * 60 + Integer.parseInt(part.trim());
            } catch (NumberFormatException e) {
                return 0;
            }
        }
        return total;
    }

    /**
     * The Telegram row that's the same song as a search result: the same title words, a shared
     * artist (or none on the file), and, when both are known, lengths within a few seconds.
     */
    static JSONObject match(String title, String artist, String length, List<JSONObject> rows) {
        List<String> wanted = TrackNames.words(title);
        if (wanted.isEmpty() || rows == null) return null;
        int seconds = seconds(length);
        for (JSONObject row : rows) {
            if (!TrackNames.words(row.optString("title")).equals(wanted)) continue;
            String rowArtist = row.optString("artist");
            if (!rowArtist.isEmpty()
                    && artist != null
                    && !artist.isEmpty()
                    && !TrackNames.sharesArtist(rowArtist, artist)) continue;
            int duration = row.optInt("duration");
            if (seconds > 0 && duration > 0 && Math.abs(seconds - duration) > LENGTH_SLACK_SEC)
                continue;
            return row;
        }
        return null;
    }
}
