package app.bitchord.telegram;

import org.json.JSONObject;

import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Audio quality and names from file names, for files Telegram knows little about. */
public final class TrackDetails {
    private TrackDetails() {}

    // Stereo 16-bit FLAC is usually 700 to 1100 kbps; above this it's almost always 24-bit.
    static final int HI_RES_KBPS = 2000;
    // AAC in an .m4a never gets near this; ALAC in the same container always does.
    static final int ALAC_KBPS = 500;

    private static final Pattern LOSSLESS_FORMAT =
            Pattern.compile("flac|wav|wave|aiff?|alac|ape|wv|truehd");
    private static final Pattern LOSSLESS_MIME =
            Pattern.compile("audio/(x-)?(flac|wav|wave|aiff|alac|ape|wavpack|true-hd)");
    private static final Pattern CONTAINER = Pattern.compile("m4a|mp4|caf");
    private static final Pattern EXTENSION =
            Pattern.compile(
                    "\\.(flac|mp3|m4a|aac|ogg|opus|wav|alac|aiff?|ape|wv|ac3|eac3|ec3|ac4|mka)$",
                    Pattern.CASE_INSENSITIVE);
    // "01 - ", "1. ", "03 ", "12)" in front of a title. A bare "7 Rings" or "1979" is left alone.
    private static final Pattern TRACK_NUMBER =
            Pattern.compile("^(?:0\\d{1,2}\\s+|\\d{1,3}\\s*(?:[-)\\]]|\\.(?=\\s)|\\s-)\\s*)");
    private static final Pattern NOISE =
            Pattern.compile(
                    "\\s*[\\[(](?:official\\s*(?:music\\s*)?(?:video|audio|visuali[sz]er)|"
                            + "lyrics?(?:\\s*video)?|audio|hq|hd|4k|flac|mp3|"
                            + "\\d{2,4}\\s*kbps|\\d{2}(?:[.,]\\d)?\\s*khz)[\\])]",
                    Pattern.CASE_INSENSITIVE);
    private static final Pattern DASH = Pattern.compile("\\s+[-\u2013\u2014]\\s+");

    /**
     * A tier label BitChord ranks sources by, or "" when the file doesn't say enough. Lossless
     * formats are LOSSLESS (HI_RES_LOSSLESS when the bitrate is far above CD quality). Lossy files
     * are HIGH or LOW from their average bitrate.
     */
    public static String quality(String format, String mime, long bytes, int seconds) {
        return quality(format, mime, bytes, seconds, 0);
    }

    /** As above, with the bit depth read from the file's header when it's known (0 if not). */
    public static String quality(String format, String mime, long bytes, int seconds, int bits) {
        format = lower(format);
        mime = lower(mime);
        int kbps = kbps(bytes, seconds);
        boolean lossless =
                LOSSLESS_FORMAT.matcher(format).matches()
                        || LOSSLESS_MIME.matcher(mime).matches()
                        || (CONTAINER.matcher(format).matches()
                                && kbps >= ALAC_KBPS
                                && !mime.contains("ac3")
                                && !mime.contains("ac-3"));
        if (lossless) {
            if (bits > 0) return bits > 16 ? "HI_RES_LOSSLESS" : "LOSSLESS";
            return kbps >= HI_RES_KBPS ? "HI_RES_LOSSLESS" : "LOSSLESS";
        }
        if (kbps >= 256) return "HIGH";
        if (kbps > 0 && kbps <= 160) return "LOW";
        return "";
    }

    /** "850 MB", "31.4 GB": a download's size, as phones show storage. */
    static String size(long bytes) {
        if (bytes >= 1_000_000_000L)
            return String.format(Locale.US, "%.1f GB", bytes / 1_000_000_000.0);
        return Math.max(1, Math.round(bytes / 1_000_000.0)) + " MB";
    }

    /** Average bitrate in kbps, or 0 when the size or length is unknown. */
    public static int kbps(long bytes, int seconds) {
        if (bytes <= 0 || seconds <= 0) return 0;
        long value = bytes * 8 / 1000 / seconds;
        return value > 100_000 ? 0 : (int) value;
    }

    /**
     * Title and artist read from a file name such as "03 - Artist - Title (Official Audio).flac".
     * The artist is "" when the name doesn't have one. A known artist (the file's performer tag)
     * wins over the one in the name, unless they agree.
     */
    public static String[] fromFileName(String name, String knownArtist) {
        String base = EXTENSION.matcher(name == null ? "" : name.trim()).replaceFirst("");
        if (base.indexOf(' ') < 0 || base.indexOf('_') >= 0) base = base.replace('_', ' ');
        base = base.replaceAll("\\s+", " ").trim();
        String previous;
        do {
            previous = base;
            base = NOISE.matcher(base).replaceAll("").trim();
        } while (!base.equals(previous));
        String[] parts = DASH.split(base);
        if (parts.length > 1 && parts[0].matches("\\d{1,3}")) {
            String[] rest = new String[parts.length - 1];
            System.arraycopy(parts, 1, rest, 0, rest.length);
            parts = rest;
        } else if (parts.length > 0) {
            Matcher number = TRACK_NUMBER.matcher(parts[0]);
            if (number.find() && number.end() < parts[0].length())
                parts[0] = parts[0].substring(number.end()).trim();
        }
        String artist = "", title = base;
        if (parts.length >= 2) {
            artist = parts[0].trim();
            title = String.join(" - ", java.util.Arrays.copyOfRange(parts, 1, parts.length)).trim();
        } else if (parts.length == 1) title = parts[0].trim();
        String known = knownArtist == null ? "" : knownArtist.trim();
        if (!known.isEmpty()) {
            if (!artist.isEmpty() && !lower(artist).equals(lower(known))) title = join(parts);
            artist = known;
        }
        if (title.isEmpty()) title = base.isEmpty() ? (name == null ? "" : name) : base;
        return new String[] {title, artist};
    }

    /**
     * The row with its title and artist taken from the file name, when the file has no title tag of
     * its own. Other rows are returned unchanged.
     */
    public static JSONObject withFileName(JSONObject row) throws Exception {
        if (row.optBoolean("tagged", true)) return row;
        String[] name = fromFileName(row.optString("fileName"), row.optString("artist"));
        JSONObject copy = new JSONObject(row.toString());
        copy.put("title", name[0]);
        copy.put("artist", name[1]);
        return copy;
    }

    private static String join(String[] parts) {
        return String.join(" - ", parts).trim();
    }

    private static String lower(String value) {
        return value == null ? "" : value.trim().toLowerCase(Locale.ROOT);
    }
}
