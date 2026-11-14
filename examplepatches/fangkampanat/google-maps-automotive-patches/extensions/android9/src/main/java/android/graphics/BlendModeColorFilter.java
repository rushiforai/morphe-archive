package android.graphics;

/**
 * Android 10's BlendModeColorFilter for Android 9, where the class does not exist (patch "Android 9 (API 28)").
 * Loaded only on Android 9 (classes load parent first). A PorterDuffColorFilter with the blend mode's PorterDuff mode
 * (SRC_OVER for an advanced mode), which is what Android 10 draws for those modes.
 */
public class BlendModeColorFilter extends PorterDuffColorFilter {
    private final int color;
    private final BlendMode mode;

    public BlendModeColorFilter(int color, BlendMode mode) {
        super(color, BlendMode.porterDuffOrSrcOver28(mode));
        this.color = color;
        this.mode = mode;
    }

    public int getColor() {
        return color;
    }

    public BlendMode getMode() {
        return mode;
    }

    @Override
    public boolean equals(Object object) {
        if (this == object) return true;
        if (object == null || getClass() != object.getClass()) return false;
        BlendModeColorFilter other = (BlendModeColorFilter) object;
        return other.mode == mode && other.color == color;
    }

    @Override
    public int hashCode() {
        return 31 * mode.hashCode() + color;
    }
}
