package app.template.extension.hevalcontrols;

/**
 * Emoji icons for picker options ({@link HevalSettings#setOptionIconProvider}). Pure text, so no
 * images ship and nothing goes online; a device font without a flag draws the two letters instead.
 */
public final class OptionIcons {
    /** Globe showing Europe and Africa. */
    public static final String GLOBE_EUROPE_AFRICA = "🌍";
    /** Globe showing the Americas. */
    public static final String GLOBE_AMERICAS = "🌎";
    /** Globe showing Asia and Australia. */
    public static final String GLOBE_ASIA_AUSTRALIA = "🌏";
    /** Globe with meridians. */
    public static final String GLOBE = "🌐";
    /** Trophy. */
    public static final String TROPHY = "🏆";

    private static final int REGIONAL_INDICATOR_A = 0x1F1E6;
    private static final int BLACK_FLAG = 0x1F3F4;
    private static final int TAG_BASE = 0xE0000;
    private static final int CANCEL_TAG = 0xE007F;

    /**
     * The flag of a two-letter region code (ISO 3166-1 alpha-2, any case; "EU" and "XK" work too):
     * its regional indicator pair. Null unless {@code code} is exactly two letters A-Z.
     */
    public static String countryFlag(String code) {
        if (code == null || code.length() != 2) return null;
        char first = Character.toUpperCase(code.charAt(0));
        char second = Character.toUpperCase(code.charAt(1));
        if (first < 'A' || first > 'Z' || second < 'A' || second > 'Z') return null;
        return new StringBuilder(4)
                .appendCodePoint(REGIONAL_INDICATOR_A + (first - 'A'))
                .appendCodePoint(REGIONAL_INDICATOR_A + (second - 'A'))
                .toString();
    }

    /**
     * The tag-sequence flag of a subdivision (Unicode subdivision id, e.g. "gbeng" England,
     * "gbsct" Scotland, "gbwls" Wales): a black flag, the id as tag characters and a cancel tag.
     * Null unless {@code id} is 3 to 7 letters a-z or digits (lower case).
     */
    public static String subdivisionFlag(String id) {
        if (id == null || id.length() < 3 || id.length() > 7) return null;
        StringBuilder flag = new StringBuilder(4 + 2 * id.length()).appendCodePoint(BLACK_FLAG);
        for (int i = 0; i < id.length(); i++) {
            char c = id.charAt(i);
            if ((c < 'a' || c > 'z') && (c < '0' || c > '9')) return null;
            flag.appendCodePoint(TAG_BASE + c);
        }
        return flag.appendCodePoint(CANCEL_TAG).toString();
    }

    /** England's flag. */
    public static final String ENGLAND = subdivisionFlag("gbeng");
    /** Scotland's flag. */
    public static final String SCOTLAND = subdivisionFlag("gbsct");
    /** Wales' flag. */
    public static final String WALES = subdivisionFlag("gbwls");

    private OptionIcons() { }
}
