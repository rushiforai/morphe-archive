package android.graphics;

/**
 * Android 10's BlendMode for Android 9, where the class does not exist (patch "Android 9 (API 28)"). Loaded only on
 * Android 9 (classes load parent first). Each mode carries the PorterDuff.Mode Android 10 maps it to; the advanced
 * modes have none, and Android 9 has no way to draw them.
 */
public enum BlendMode {
    CLEAR(PorterDuff.Mode.CLEAR),
    SRC(PorterDuff.Mode.SRC),
    DST(PorterDuff.Mode.DST),
    SRC_OVER(PorterDuff.Mode.SRC_OVER),
    DST_OVER(PorterDuff.Mode.DST_OVER),
    SRC_IN(PorterDuff.Mode.SRC_IN),
    DST_IN(PorterDuff.Mode.DST_IN),
    SRC_OUT(PorterDuff.Mode.SRC_OUT),
    DST_OUT(PorterDuff.Mode.DST_OUT),
    SRC_ATOP(PorterDuff.Mode.SRC_ATOP),
    DST_ATOP(PorterDuff.Mode.DST_ATOP),
    XOR(PorterDuff.Mode.XOR),
    PLUS(PorterDuff.Mode.ADD),
    MODULATE(PorterDuff.Mode.MULTIPLY),
    SCREEN(PorterDuff.Mode.SCREEN),
    OVERLAY(PorterDuff.Mode.OVERLAY),
    DARKEN(PorterDuff.Mode.DARKEN),
    LIGHTEN(PorterDuff.Mode.LIGHTEN),
    COLOR_DODGE(null),
    COLOR_BURN(null),
    HARD_LIGHT(null),
    SOFT_LIGHT(null),
    DIFFERENCE(null),
    EXCLUSION(null),
    MULTIPLY(null),
    HUE(null),
    SATURATION(null),
    COLOR(null),
    LUMINOSITY(null);

    private final PorterDuff.Mode porterDuffMode;

    BlendMode(PorterDuff.Mode porterDuffMode) {
        this.porterDuffMode = porterDuffMode;
    }

    /** Android 9 only: the PorterDuff.Mode Android 10 uses for this mode, or null for an advanced mode. */
    public PorterDuff.Mode porterDuffMode28() {
        return porterDuffMode;
    }

    /** Android 9 only: as porterDuffMode28, with SRC_OVER (plain drawing) for an advanced mode. */
    public static PorterDuff.Mode porterDuffOrSrcOver28(BlendMode mode) {
        PorterDuff.Mode porterDuff = mode == null ? null : mode.porterDuffMode;
        return porterDuff == null ? PorterDuff.Mode.SRC_OVER : porterDuff;
    }
}
