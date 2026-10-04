package app.spicetify.extension.spotify.theme;

/** Color math on packed ARGB ints. */
final class ArgbColors {
    private static final String HEX = "0123456789abcdefABCDEF";

    private ArgbColors() {}

    /** Channel-wise sRGB mix: 0 keeps {@code from}, 1 gives {@code to}. Keeps {@code from}'s alpha. */
    static int mix(int from, int to, double amount) {
        int red = channel((from >> 16) & 0xFF, (to >> 16) & 0xFF, amount);
        int green = channel((from >> 8) & 0xFF, (to >> 8) & 0xFF, amount);
        int blue = channel(from & 0xFF, to & 0xFF, amount);
        return (from & 0xFF000000) | (red << 16) | (green << 8) | blue;
    }

    /** Adds {@code amount} to each color channel, up to 255. Keeps alpha. */
    static int lighten(int argb, int amount) {
        int red = Math.min(255, ((argb >> 16) & 0xFF) + amount);
        int green = Math.min(255, ((argb >> 8) & 0xFF) + amount);
        int blue = Math.min(255, (argb & 0xFF) + amount);
        return (argb & 0xFF000000) | (red << 16) | (green << 8) | blue;
    }

    private static int channel(int from, int to, double amount) {
        return (int) Math.max(0, Math.min(255, Math.round(from + (to - from) * amount)));
    }

    /** WCAG 2 relative luminance, ignoring alpha. */
    static double luminance(int argb) {
        return 0.2126 * linear((argb >> 16) & 0xFF) + 0.7152 * linear((argb >> 8) & 0xFF) + 0.0722 * linear(argb & 0xFF);
    }

    private static double linear(int channel) {
        double srgb = channel / 255.0;
        return srgb <= 0.04045 ? srgb / 12.92 : Math.pow((srgb + 0.055) / 1.055, 2.4);
    }

    /** WCAG 2 contrast ratio, from 1 to 21. */
    static double contrast(int first, int second) {
        double a = luminance(first);
        double b = luminance(second);
        return (Math.max(a, b) + 0.05) / (Math.min(a, b) + 0.05);
    }

    /** 3, 6 or 8 hex digits without '#'. Eight digits are AARRGGBB, or CSS's RRGGBBAA when cssOrder. */
    static Integer parseHex(String digits, boolean cssOrder) {
        if (digits.isEmpty()) return null;
        for (int i = 0; i < digits.length(); i++) if (HEX.indexOf(digits.charAt(i)) < 0) return null;
        String argb;
        switch (digits.length()) {
            case 3:
                StringBuilder doubled = new StringBuilder("FF");
                for (char c : digits.toCharArray()) doubled.append(c).append(c);
                argb = doubled.toString();
                break;
            case 6:
                argb = "FF" + digits;
                break;
            case 8:
                argb = cssOrder ? digits.substring(6) + digits.substring(0, 6) : digits;
                break;
            default:
                return null;
        }
        return (int) Long.parseLong(argb, 16);
    }
}
