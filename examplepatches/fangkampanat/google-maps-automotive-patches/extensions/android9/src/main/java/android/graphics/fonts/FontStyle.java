package android.graphics.fonts;

/**
 * Android 10's FontStyle for Android 9, where the class does not exist (patch "Android 9 (API 28)"). Loaded only on
 * Android 9 (classes load parent first). A weight and a slant, as in Android 10.
 */
public final class FontStyle {
    public static final int FONT_WEIGHT_MIN = 1;
    public static final int FONT_WEIGHT_NORMAL = 400;
    public static final int FONT_WEIGHT_BOLD = 700;
    public static final int FONT_WEIGHT_MAX = 1000;
    public static final int FONT_SLANT_UPRIGHT = 0;
    public static final int FONT_SLANT_ITALIC = 1;

    private final int weight;
    private final int slant;

    public FontStyle() {
        this(FONT_WEIGHT_NORMAL, FONT_SLANT_UPRIGHT);
    }

    public FontStyle(int weight, int slant) {
        if (weight < FONT_WEIGHT_MIN || weight > FONT_WEIGHT_MAX) {
            throw new IllegalArgumentException("weight value must be [1, 1000]");
        }
        this.weight = weight;
        this.slant = slant;
    }

    public int getWeight() {
        return weight;
    }

    public int getSlant() {
        return slant;
    }

    /** Android 10's match score (FontStyle.getMatchScore, as in minikin): 1 per 100 of weight difference, 2 for another
     * slant; lower is closer. */
    public int getMatchScore(FontStyle style) {
        return Math.abs(getWeight() - style.getWeight()) / 100 + (getSlant() == style.getSlant() ? 0 : 2);
    }

    @Override
    public boolean equals(Object object) {
        if (this == object) return true;
        if (!(object instanceof FontStyle)) return false;
        FontStyle other = (FontStyle) object;
        return other.weight == weight && other.slant == slant;
    }

    @Override
    public int hashCode() {
        return 31 * weight + slant;
    }

    @Override
    public String toString() {
        return "FontStyle { weight=" + weight + ", slant=" + slant + "}";
    }
}
