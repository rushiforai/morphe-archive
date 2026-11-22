package android.content.res;

/**
 * Lab stub: overrides the shared stub to add the television ui mode and the orientation bits.
 *
 * The shared stub in patch-source carries only the night-mode bits. The extension needs
 * UI_MODE_TYPE_TELEVISION so a cheap TV box that does not declare leanback is still recognised,
 * and ORIENTATION_LANDSCAPE for the grid-width fallback (the app itself uses 8 columns in
 * landscape). These are the platform's real values and they are compile-time constants inlined by
 * javac, so the dex carries the numbers, not a reference to this class.
 */
public final class Configuration {
    public static final int UI_MODE_NIGHT_MASK = 0x30;
    public static final int UI_MODE_NIGHT_YES = 0x20;
    public static final int UI_MODE_TYPE_MASK = 0x0f;
    public static final int UI_MODE_TYPE_TELEVISION = 0x04;
    public static final int ORIENTATION_LANDSCAPE = 2;
    public int uiMode;
    public int orientation;
}
