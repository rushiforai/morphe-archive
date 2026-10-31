package app.bitchord.telegram;

import org.json.JSONObject;

/**
 * Reads codec, bit depth, sample rate, channels and, where the header says, the length in seconds
 * from the first bytes of a lossless file. Dolby files and ALAC in .m4a are read by {@link
 * DolbyHeader}.
 */
public final class AudioHeader {
    private AudioHeader() {}

    /** What a header says, or null when it isn't a format read here or is cut short. */
    public static JSONObject parse(byte[] head, int length) {
        try {
            int start = id3Size(head, length);
            if (matches(head, length, start, "fLaC")) return flac(head, length, start + 4);
            if (matches(head, length, 0, "RIFF") || matches(head, length, 0, "RF64"))
                return wav(head, length);
            if (matches(head, length, 0, "FORM")
                    && (matches(head, length, 8, "AIFF") || matches(head, length, 8, "AIFC")))
                return aiff(head, length);
            return DolbyHeader.parse(head, length, start);
        } catch (RuntimeException e) {
            // A truncated or odd header just means no details.
        }
        return null;
    }

    /** The legend for a parsed header, such as "FLAC 24bit" or "Dolby Atmos". */
    public static String label(JSONObject header) {
        if (header == null) return "";
        if (DolbyHeader.dolby(header.optString("codec"))) return DolbyHeader.label(header);
        String codec = header.optString("codec").toUpperCase(java.util.Locale.ROOT);
        int bits = header.optInt("bits");
        return codec.isEmpty() ? "" : bits > 0 ? codec + " " + bits + "bit" : codec;
    }

    private static JSONObject flac(byte[] b, int length, int at) throws RuntimeException {
        // First metadata block must be STREAMINFO (type 0), 34 bytes.
        if (at + 4 + 18 > length || (b[at] & 0x7f) != 0) return null;
        int s = at + 4 + 10;
        int rate = ((b[s] & 0xff) << 12) | ((b[s + 1] & 0xff) << 4) | ((b[s + 2] & 0xff) >> 4);
        int channels = ((b[s + 2] & 0xff) >> 1 & 7) + 1;
        int bits = (((b[s + 2] & 1) << 4) | ((b[s + 3] & 0xff) >> 4)) + 1;
        long samples =
                ((long) (b[s + 3] & 0x0f) << 32)
                        | ((long) (b[s + 4] & 0xff) << 24)
                        | ((b[s + 5] & 0xff) << 16)
                        | ((b[s + 6] & 0xff) << 8)
                        | (b[s + 7] & 0xff);
        JSONObject header =
                details("flac", bits, rate, channels, rate > 0 ? samples / (double) rate : 0);
        if (header != null) LosslessCheck.quick(b, length, at, header);
        return header;
    }

    private static JSONObject wav(byte[] b, int length) {
        if (!matches(b, length, 8, "WAVE")) return null;
        int at = 12, channels = 0, rate = 0, bits = 0;
        while (at + 8 <= length) {
            int size = le32(b, at + 4);
            if (matches(b, length, at, "fmt ") && at + 8 + 16 <= length) {
                int format = le16(b, at + 8);
                channels = le16(b, at + 10);
                rate = le32(b, at + 12);
                bits = le16(b, at + 22);
                // 1 = PCM, 3 = float, 0xFFFE = extensible (sub-format follows; PCM in practice).
                if (format != 1 && format != 3 && format != 0xFFFE) return null;
            } else if (matches(b, length, at, "data") && rate > 0) {
                long bytes = size & 0xffffffffL; // 0xFFFFFFFF in RF64 files: length unknown
                double perSecond = rate * (double) channels * bits / 8;
                return details(
                        "wav", bits, rate, channels, bytes == 0xffffffffL ? 0 : bytes / perSecond);
            }
            if (size < 0) break;
            at += 8 + size + (size & 1);
        }
        return rate > 0 ? details("wav", bits, rate, channels, 0) : null;
    }

    private static JSONObject aiff(byte[] b, int length) {
        int at = 12;
        while (at + 8 <= length) {
            int size = be32(b, at + 4);
            if (matches(b, length, at, "COMM") && at + 8 + 18 <= length) {
                int channels = be16(b, at + 8);
                long frames = be32(b, at + 10) & 0xffffffffL;
                int bits = be16(b, at + 14);
                int rate = extended(b, at + 16);
                return details("aiff", bits, rate, channels, rate > 0 ? frames / (double) rate : 0);
            }
            if (size < 0) return null;
            at += 8 + size + (size & 1);
        }
        return null;
    }

    static JSONObject details(String codec, int bits, int rate, int channels, double seconds) {
        if (bits < 4 || bits > 64 || rate < 1000 || rate > 1_000_000 || channels < 1) return null;
        try {
            JSONObject header =
                    new JSONObject()
                            .put("codec", codec)
                            .put("bits", bits)
                            .put("rate", rate)
                            .put("channels", channels);
            if (seconds >= 1 && seconds < 24 * 3600)
                header.put("seconds", (int) Math.round(seconds));
            return header;
        } catch (org.json.JSONException e) {
            return null;
        }
    }

    /** Size of a leading ID3v2 tag, which some FLAC files carry, or 0. */
    static int id3Size(byte[] b, int length) {
        if (!matches(b, length, 0, "ID3") || length < 10) return 0;
        int size =
                ((b[6] & 0x7f) << 21)
                        | ((b[7] & 0x7f) << 14)
                        | ((b[8] & 0x7f) << 7)
                        | (b[9] & 0x7f);
        return 10 + size + ((b[5] & 0x10) != 0 ? 10 : 0);
    }

    /** 80-bit IEEE extended float, as AIFF stores its sample rate. */
    static int extended(byte[] b, int at) {
        int exponent = ((b[at] & 0x7f) << 8) | (b[at + 1] & 0xff);
        long mantissa = 0;
        for (int i = 0; i < 8; i++) mantissa = (mantissa << 8) | (b[at + 2 + i] & 0xff);
        int shift = 16383 + 63 - exponent;
        if (shift < 0 || shift > 63) return 0;
        return (int) (mantissa >>> shift);
    }

    static boolean matches(byte[] b, int length, int at, String text) {
        if (at < 0 || at + text.length() > length) return false;
        for (int i = 0; i < text.length(); i++) if (b[at + i] != text.charAt(i)) return false;
        return true;
    }

    private static int le16(byte[] b, int at) {
        return (b[at] & 0xff) | (b[at + 1] & 0xff) << 8;
    }

    private static int le32(byte[] b, int at) {
        return le16(b, at) | (b[at + 2] & 0xff) << 16 | (b[at + 3] & 0xff) << 24;
    }

    private static int be16(byte[] b, int at) {
        return (b[at] & 0xff) << 8 | (b[at + 1] & 0xff);
    }

    private static int be32(byte[] b, int at) {
        return be16(b, at) << 16 | be16(b, at + 2);
    }
}
