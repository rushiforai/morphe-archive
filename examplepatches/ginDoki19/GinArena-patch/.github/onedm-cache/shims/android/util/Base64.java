package android.util;

import java.nio.charset.StandardCharsets;

public final class Base64 {
    public static final int DEFAULT = 0;
    public static final int NO_PADDING = 1;
    public static final int NO_WRAP = 2;
    public static final int URL_SAFE = 8;

    private Base64() {}

    public static byte[] decode(String str, int flags) {
        if (str == null) return new byte[0];
        String cleaned = str.replaceAll("\\s+", "");
        if ((flags & URL_SAFE) != 0) {
            return java.util.Base64.getUrlDecoder().decode(cleaned);
        }
        return java.util.Base64.getDecoder().decode(cleaned);
    }

    public static byte[] decode(byte[] input, int flags) {
        return decode(new String(input, StandardCharsets.ISO_8859_1), flags);
    }

    public static String encodeToString(byte[] input, int flags) {
        if (input == null) return "";
        java.util.Base64.Encoder enc = (flags & URL_SAFE) != 0
            ? java.util.Base64.getUrlEncoder()
            : ((flags & NO_WRAP) != 0 ? java.util.Base64.getEncoder() : java.util.Base64.getMimeEncoder(76, new byte[]{'\n'}));
        if ((flags & NO_PADDING) != 0) {
            enc = enc.withoutPadding();
        }
        String out = enc.encodeToString(input);
        return (flags & NO_WRAP) != 0 ? out : out + "\n";
    }
}
