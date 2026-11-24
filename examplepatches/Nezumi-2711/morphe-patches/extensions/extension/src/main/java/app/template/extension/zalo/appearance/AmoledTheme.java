package app.template.extension.zalo.appearance;

/**
 * Remaps server-driven Zinstant background colors (Me tab and other Zinstant
 * screens) to the AMOLED palette. Zinstant layouts carry their own dark palette,
 * so the resource-level AMOLED patch does not reach them.
 */
@SuppressWarnings("unused")
public final class AmoledTheme {
    private AmoledTheme() { }

    /** Zalo's stock dark layer background (ng95), used for Zinstant cards. */
    private static final int DARK_LAYER = 0xFF171717;

    private static final int BLACK = 0xFF000000;

    /** Called with every Zinstant background color before it is stored. */
    public static int zinstantBackground(int color) {
        return color == DARK_LAYER ? BLACK : color;
    }
}
