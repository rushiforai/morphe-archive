/*
 * Runtime helper for the Material You theme patch.
 *
 * Every colour it changes keeps its CIE lightness (TonePalette.sameLightness). A grey becomes the
 * palette's neutral at the same L*, and one of Messenger's blues becomes the palette's accent at
 * the same L*, so text and icons keep the contrast Messenger gave them.
 *
 * In the Mig dark scheme every grey and blue is recoloured. In the FDS resolvers a token is
 * recoloured only when it carries Messenger's dark-theme colour for that token. The server-colour
 * and literal routes use a known set of dark surface values. Light mode is left alone unless its
 * switches are on: the light mode switch gives its blues the accent (#132), and the light mode greys
 * switch its greys the neutral (#155). The palette can take one of Material's styles (#155).
 */
package app.hushmessenger.extension;

import android.content.ComponentCallbacks;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Color;

import java.util.Arrays;
import java.util.concurrent.atomic.AtomicBoolean;

public final class MaterialYouTheme {

    private MaterialYouTheme() {}

    static final String KEY = "material_you";
    /** Runtime switch: with Material You on, Messenger's darkest backgrounds become #000000. Off by default. */
    static final String BLACK_KEY = "material_you_black";
    /** Runtime switch: with Material You on, light mode's blues take the accent too (#132). Off by default. */
    static final String LIGHT_KEY = "material_you_light";
    /** Runtime switch: with Material You on, light mode's greys take the palette's neutral too (#155). Off by default. */
    static final String LIGHT_GRAYS_KEY = "material_you_light_grays";
    /** Runtime choice: the Material style the palette takes, one of TonePalette.STYLES (#155). Absent means "default". */
    static final String STYLE_KEY = "material_you_style";

    // --- Dark mode detection ---

    /** Whether Messenger's dark mode is on, as it last answered. Defaults to true (dark) until Messenger answers. */
    private static final AtomicBoolean DARK = new AtomicBoolean(true);
    /** Whether Messenger has answered at all. Only the Material You patch hooks its dark mode controller. */
    private static volatile boolean answered;

    /**
     * Called with each answer Messenger's dark mode controller gives, right before it returns it.
     * The patch hooks the controller and sends every answer here.
     *
     * @return {@code dark}, for the controller to return
     */
    public static boolean darkModeAnswer(boolean dark) {
        answered = true;
        if (DARK.get() != dark && DARK.getAndSet(dark) != dark) {
            publish();
        }
        return dark;
    }

    /** Whether Messenger's dark mode is on, as it last answered. */
    public static boolean isDarkMode() {
        return DARK.get();
    }

    /**
     * Whether a bar Hush puts inside a chat should be light: Messenger's own theme once it has answered, and Hush's
     * Light theme switch before that or without the Material You patch.
     */
    static boolean chatIsLight() {
        return answered ? !DARK.get() : Settings.preferences.getBoolean("light", false);
    }

    /**
     * The theme for a question Hush asks over a chat, light or dark with the chat like its bars. One UI's DeviceDefault
     * alert stays dark in a light chat and draws its title dark on that dark sheet.
     */
    static int chatDialogTheme() {
        return chatIsLight() ? android.R.style.Theme_Material_Light_Dialog_Alert : android.R.style.Theme_Material_Dialog_Alert;
    }

    // --- Dark surfaces ---

    /**
     * The dark surfaces Messenger writes into its code (route 3) and sends as text (route 4).
     * These are the grey and near-grey values that appear on dark mode backgrounds. The most
     * common const values in Messenger 582.0.0.61.92 build 346415686:
     *
     * 0xFF080809 (count=32) - very dark, near-black (background)
     * 0xFF1C2B33 (count=26) - dark blue-tinted (Messenger's signature blue-dark)
     * 0xFF1C1C1D (count=9) - neutral dark grey (shared with Facebook)
     * 0xFF252728 (count=8) - card/surface grey (shared with Facebook)
     * 0xFF333334 (count=7) - elevated surface: the search bar, message box and note bubbles
     * 0xFF5C5E62 (count=11) - border/divider grey
     * 0xFF323339 (count=2) - dark grey of three tokens in the DSP ColorData resolver
     */
    static final String SURFACES = "080809 1C1C1D 252728 333334 323339";

    private static final int[] SURFACE_VALUES = parseSurfaces(SURFACES);

    // Route 3 fields: the patch replaces "const vX, 0xFF080809" with a read of DARK_080809.
    // In dark mode with the switch on they hold the palette's colours; otherwise Messenger's own.
    public static volatile int DARK_080809;
    public static volatile int DARK_1C1C1D;
    public static volatile int DARK_252728;
    public static volatile int DARK_333334;
    public static volatile int DARK_323339;

    /** Held while route 3 fields are written. */
    private static final Object PUBLISHING = new Object();

    private static volatile TonePalette palette;
    private static volatile boolean bound;
    // SharedPreferences keeps weak listener references, so retain this for the lifetime of the process.
    private static final SharedPreferences.OnSharedPreferenceChangeListener CHOICES = (preferences, key) -> {
        // A null key is a clear, which can take a saved theme with it.
        if (key == null || ThemeFile.KEY.equals(key) || STYLE_KEY.equals(key)) reload(Settings.appContext);
        else if (KEY.equals(key) || BLACK_KEY.equals(key) || "paused".equals(key) || "safe_mode".equals(key)) publish();
    };

    static {
        palette = TonePalette.fallback();
        publish();
    }

    // --- Route 1: Mig dark scheme ---

    /**
     * The colour the Mig dark scheme resolves for a token. That scheme only answers in dark mode,
     * so its greys and blues are recoloured whatever the token.
     */
    public static int mig(int color) {
        if (!Settings.enabled(KEY)) return color;
        return (color >>> 24) == 0xFF && isDarkMode() ? dark(color) : color;
    }

    /**
     * The colour the Mig light scheme resolves for a token. Its blues take the accent while the light mode switch is on,
     * and its greys the neutral while the light mode greys switch is.
     */
    public static int migLight(int color) {
        if (!Settings.enabled(KEY)) return color;
        return (color >>> 24) == 0xFF ? light(color) : color;
    }

    // --- Route 1: FDS colours ---

    /**
     * The colour an FDS resolver returns. In dark mode, greys and blues are recoloured to the
     * palette at the same lightness. In light mode blues are with the light mode switch on, and greys with the light
     * mode greys switch on.
     */
    public static int fds(int color) {
        if (!Settings.enabled(KEY)) return color;
        if ((color >>> 24) != 0xFF) return color;
        if (isDarkMode()) return dark(color);
        return light(color);
    }

    // --- Route 4: server colours and resource reads ---

    /** Route 4: a colour from Color.parseColor. */
    public static int parseColor(String text) {
        if (!Settings.enabled(KEY)) return Color.parseColor(text);
        return darkSurface(Color.parseColor(text));
    }

    /** Route 4: a colour from Context.getColor. */
    public static int getColor(Context context, int id) {
        if (!Settings.enabled(KEY)) return context.getColor(id);
        return darkSurface(context.getColor(id));
    }

    /** Route 4: a colour from Resources.getColor(int). */
    @SuppressWarnings("deprecation")
    public static int getColorRes(Resources resources, int id) {
        if (!Settings.enabled(KEY)) return resources.getColor(id);
        return darkSurface(resources.getColor(id));
    }

    /** Route 4: a colour from Resources.getColor(int, Theme). */
    public static int getColorResTheme(Resources resources, int id, Resources.Theme theme) {
        if (!Settings.enabled(KEY)) return resources.getColor(id, theme);
        return darkSurface(resources.getColor(id, theme));
    }

    /** The palette's neutral at the same lightness for one of the SURFACES, in dark mode. */
    private static int darkSurface(int color) {
        if (!isSurface(color) || !isDarkMode()) return color;
        return isBlackTarget(color) && blackOn() ? 0xFF000000 : palette().sameLightness(TonePalette.NEUTRAL, color);
    }

    /** A dark mode colour from the Mig or FDS resolvers: pure black when asked for, the palette's tint otherwise. */
    private static int dark(int color) {
        return isBlackTarget(color) && blackOn() ? 0xFF000000 : recolour(palette(), color);
    }

    /** Whether the pure black switch is on. Only read after the Material You switch has been checked. */
    private static boolean blackOn() {
        SharedPreferences prefs = Settings.preferences;
        return prefs != null && prefs.getBoolean(BLACK_KEY, false);
    }

    /** Whether the switch is on. Only read after the Material You switch has been checked. */
    private static boolean switchOn(String key) {
        SharedPreferences prefs = Settings.preferences;
        return prefs != null && prefs.getBoolean(key, false);
    }

    /**
     * A light mode colour: one of Messenger's blues becomes the accent at the same lightness with the light mode switch
     * on, a grey the neutral with the light mode greys switch on (white and black keep their lightness, so they stay),
     * and anything else stays.
     */
    static int light(int color) {
        if (isMessengerBlue(color)) return switchOn(LIGHT_KEY) ? palette().sameLightness(TonePalette.ACCENT, color) : color;
        return isNeutral(color) && switchOn(LIGHT_GRAYS_KEY) ? palette().sameLightness(TonePalette.NEUTRAL, color) : color;
    }

    /** The palette style chosen, "default" until one is. */
    static String style() {
        SharedPreferences prefs = Settings.preferences;
        String style = prefs == null ? null : prefs.getString(STYLE_KEY, null);
        return style == null ? TonePalette.STYLES[0] : style;
    }

    /** Messenger's darkest backgrounds: 0xFF080809 and any grey no brighter than 0x0F. */
    static boolean isBlackTarget(int color) {
        return (color >>> 24) == 0xFF && isNeutral(color) && Math.max((color >> 16) & 0xFF, Math.max((color >> 8) & 0xFF, color & 0xFF)) <= 0x0F;
    }

    // --- Colour classification ---

    /** A grey: its channels are within 10 of each other. Messenger's dark greys are within 8. */
    static boolean isNeutral(int color) {
        int r = (color >> 16) & 0xFF;
        int g = (color >> 8) & 0xFF;
        int b = color & 0xFF;
        return Math.max(r, Math.max(g, b)) - Math.min(r, Math.min(g, b)) <= 10;
    }

    /**
     * One of Messenger's blues: HSV hue from 200 to 225 degrees, saturation of at least a quarter
     * and value of at least 0.3. Worked in integers, since the Mig hook runs on every layout pass.
     */
    static boolean isMessengerBlue(int color) {
        int r = (color >> 16) & 0xFF;
        int g = (color >> 8) & 0xFF;
        int b = color & 0xFF;
        int delta = b - Math.min(r, g);
        if (b < r || b < g || b < 77 || delta * 4 < b) return false;
        int turn = 60 * (r - g);
        return turn >= -40 * delta && turn <= -15 * delta;
    }

    /** Recolour: greys become neutral, blues become accent, both at the same lightness. */
    static int recolour(TonePalette palette, int color) {
        if (isNeutral(color)) return palette.sameLightness(TonePalette.NEUTRAL, color);
        if (isMessengerBlue(color)) return palette.sameLightness(TonePalette.ACCENT, color);
        return color;
    }

    static boolean isSurface(int color) {
        return Arrays.binarySearch(SURFACE_VALUES, color) >= 0;
    }

    // --- Palette management ---

    static TonePalette palette() {
        if (!bound) bind();
        return palette;
    }

    /**
     * Runs from palette() the first time a hook needs a colour. Reads the saved theme or the
     * phone's wallpaper palette and listens for configuration changes (new wallpaper).
     */
    public static void bind() {
        if (bound) { publish(); return; }
        synchronized (MaterialYouTheme.class) {
            if (bound) { publish(); return; }
            try {
                Context app = Settings.appContext;
                if (app == null) return;
                reload(app);
                app.registerComponentCallbacks(new ComponentCallbacks() {
                    @Override
                    public void onConfigurationChanged(Configuration configuration) {
                        reload(app);
                    }

                    @Override
                    public void onLowMemory() {}
                });
                Settings.preferences.registerOnSharedPreferenceChangeListener(CHOICES);
                bound = true;
            } catch (RuntimeException failure) {
                // Fall back to the fixed palette
            }
        }
    }

    /** A pasted theme's palette when one is saved (#115), the wallpaper's otherwise, in the style chosen (#155). */
    static void reload(Context context) {
        ThemeFile theme = ThemeFile.saved();
        TonePalette base = theme != null ? theme.palette() : context != null ? TonePalette.of(context) : TonePalette.fallback();
        palette = base.styled(style());
        publish();
    }

    /** For tests: set a palette and write the route 3 fields. */
    static void use(TonePalette next) {
        palette = next;
        publish();
    }

    /**
     * Writes route 3 fields from the palette in use: its surfaces in dark mode with the switch on,
     * Messenger's own otherwise.
     */
    private static void publish() {
        synchronized (PUBLISHING) {
            TonePalette p = isDarkMode() && Settings.wouldUse(KEY) ? palette : null;
            DARK_080809 = p != null && blackOn() ? 0xFF000000 : surface(p, 0x080809);
            DARK_1C1C1D = surface(p, 0x1C1C1D);
            DARK_252728 = surface(p, 0x252728);
            DARK_333334 = surface(p, 0x333334);
            DARK_323339 = surface(p, 0x323339);
        }
    }

    private static int surface(TonePalette p, int rgb) {
        return p == null ? 0xFF000000 | rgb : p.sameLightness(TonePalette.NEUTRAL, 0xFF000000 | rgb);
    }

    private static int[] parseSurfaces(String list) {
        String[] hex = list.split(" ");
        int[] values = new int[hex.length];
        for (int i = 0; i < hex.length; i++) values[i] = 0xFF000000 | Integer.parseInt(hex[i], 16);
        Arrays.sort(values);
        return values;
    }
}
