/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.theme;

import android.content.ComponentCallbacks;
import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Color;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.SettingsStatus;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * Helper for the "Material You theme" patch: Facebook's dark mode in the colours of the phone's
 * wallpaper palette on Android 12 and newer, and of {@link TonePalette#FALLBACK} on Android 11.
 *
 * <p>Every colour it changes keeps its lightness ({@link TonePalette#sameLightness}). A grey becomes
 * the palette's neutral at the same L*, and one of Facebook's blues becomes the palette's accent at
 * the same L*, so text, icons and dividers keep the contrast Facebook gave them. Anything else,
 * and anything this class doesn't recognise, is left as Facebook sent it.
 *
 * <p>Light mode is left alone. A colour token is only recoloured when it arrives with the exact
 * colour Facebook's dark theme gives that token ({@link #FDS_DARK}), and a literal, a server colour
 * or a colour resource only when it is one of the dark surfaces no light screen uses
 * ({@link #SURFACES}). The Video tab is the exception that takes the rest: it stays dark in light
 * mode, built from the same dark style, so every route also asks Facebook's own answer for dark
 * mode ({@link DarkMode}). The system bars ask Facebook's dark check for the window
 * ({@link #statusBar}, {@link #navigationBar}).
 *
 * <p>With the AMOLED black theme in the same build, AMOLED goes first. Its black backgrounds and
 * near-black cards reach this class in colours no dark-theme token has, so they stay as AMOLED made
 * them, and this class recolours text, icons, dividers and the buttons and inputs AMOLED leaves grey.
 */
public final class MaterialYouTheme {

    private MaterialYouTheme() {}

    /**
     * FDS colour tokens and the colours Facebook's dark theme gives them, read from the dark and
     * darker FDS styles of Facebook 580.0.0.51.74 and 577.0.0.50.72, where they are the same. Only
     * tokens whose dark colour differs from their light one are here, and only neutral greys and
     * Facebook's blues. Reactions, charts, code and anything drawn on media or on a colour keep
     * Facebook's colours. MaterialYouTokenFixtureTest holds this list to both fixtures.
     */
    static final String FDS_DARK = "ACCENT=1D85FC;ACTIVE_DOT=E2E5E9;ATTACHMENT_FOOTER_BACKGROUND=F2F4F7;"
            + "BLUE_LINK=5AA7FF,3E93F8;BOTTOM_SHEET_BACKGROUND_DEEMPHASIZED=252728;BOTTOM_SHEET_HANDLE=6F7276;"
            + "BOTTOM_SHEET_INSET_BACKGROUND=333334;CARD_BACKGROUND=333334;CARD_BACKGROUND_FLAT=333334;"
            + "CARD_BACKGROUND_LEGACY_WEB=252728;CARD_BORDER=333334;CLIENT_BOTTOM_SHEET_PRESSED=3B3C3E;"
            + "COMMENT_BACKGROUND=333334;COMMENT_THREADING_LINES=46484B;DISABLED_BUTTON_BACKGROUND=333334;"
            + "DISABLED_ICON=6F7276;DISABLED_TEXT=6F7276,505255;DIVIDER=65686C,505255;DOT_BADGE_BLUE=1D85FC;"
            + "ENTITY_HEADER_BACKGROUND=252728;FBLITE_ACCENT_ON_BACKGROUND=1D85FC;FBLITE_STRONG_SECONDARY=D0D3D7;"
            + "FBLITE_TEXT_INPUT_INACTIVE_INNER_BORDER=6F7276;FBLITE_WASH=080809;FEED_GAP_VERTICAL=101011;"
            + "INACTIVE_DOT=84878B;LIST_CELL_BACKGROUND=252728;META_ICON=B0B3B8;META_TEXT=B0B3B8;"
            + "NAV_BAR_BACKGROUND=252728;NAV_BAR_ICON=E8EAEE;NAV_BAR_TEXT=E8EAEE;PLACEHOLDER_ICON=B0B3B8,84878B;"
            + "PLACEHOLDER_TEXT=B0B3B8,84878B;POPOVER_BACKGROUND=3B3C3E,3E4042;PRIMARY_BUTTON_TEXT=252728;"
            + "PRIMARY_DEEMPHASIZED_BUTTON_ICON=75B6FF;PRIMARY_DEEMPHASIZED_BUTTON_TEXT=75B6FF,0866FF;"
            + "PRIMARY_ICON=F2F4F7;PRIMARY_TEXT=F2F4F7;PROGRESS_RING_DISABLED_FOREGROUND=6F7276;"
            + "SECONDARY_BUTTON_BACKGROUND=333334;SECONDARY_BUTTON_BACKGROUND_FLOATING=46484B;"
            + "SECONDARY_BUTTON_BACKGROUND_OPAQUE=46484B;SECONDARY_BUTTON_ICON=F2F4F7;SECONDARY_BUTTON_TEXT=F2F4F7;"
            + "SECONDARY_ICON=B0B3B8,A1A4A9;SECONDARY_TEXT=B0B3B8,A1A4A9;SURFACE_BACKGROUND=252728;"
            + "SWITCH_CHECKED_BACKGROUND_COLOR_ANDROID=ADD5FF;SWITCH_CHECKED_HANDLE_FILL_COLOR_ANDROID=0866FF;"
            + "SWITCH_DISABLED_HANDLE_FILL_COLOR=6F7276;SWITCH_UNCHECKED_BACKGROUND_COLOR=6F7276;"
            + "TAB_BAR_ACTIVE_ICON=F2F4F7;TAB_BAR_BACKGROUND=252728;TAB_BAR_INACTIVE_ICON=F2F4F7;"
            + "TEXT_INPUT_ACTIVE_INNER_BORDER=1D85FC;TEXT_INPUT_ACTIVE_TEXT=3E93F8;TEXT_INPUT_BAR_BACKGROUND=333334;"
            + "TEXT_INPUT_BAR_BACKGROUND_ON_DEEMPHASIZED=333334;TEXT_INPUT_INACTIVE_INNER_BORDER=5C5E62;"
            + "TOGGLE_ACTIVE_BACKGROUND=1D85FC,0866FF;TOOLTIP_TEXT=080809;UFI_TRAY_ICON_BUTTON_BACKGROUND=46484B;"
            + "VOICE_SWITCHER_BACKGROUND=46484B;WASH=101011,1C1C1D;WEB_WASH=1C1C1D";

    /**
     * The dark surfaces Facebook also writes into its code (route three) and sends as text (route
     * four). None of them is a light-theme colour in either fixture, so a value on its own says
     * dark mode. Route three reads the field of the same name for each, below.
     */
    static final String SURFACES = "101011 18191A 1C1C1D 242526 252728 3E4042";

    private static final Map<String, int[]> FDS = Collections.unmodifiableMap(parseTokens(FDS_DARK));
    private static final int[] SURFACE_VALUES = parseSurfaces(SURFACES);

    // Route three: the patch replaces "const vX, 0xFF252728" with a read of DARK_252728, and so on.
    // In Facebook's dark mode they hold the palette's colours, and in light mode Facebook's own, for
    // the Video tab that stays dark there. Volatile: the thread that gets Facebook's answer writes
    // them, and the UI thread reads them.
    public static volatile int DARK_101011;
    public static volatile int DARK_18191A;
    public static volatile int DARK_1C1C1D;
    public static volatile int DARK_242526;
    public static volatile int DARK_252728;
    public static volatile int DARK_3E4042;

    /** The palette in use: {@link TonePalette#fallback()} until the context is there. */
    private static volatile TonePalette palette;

    /** Whether the palette follows the phone's, and is read again when its colours change. */
    private static volatile boolean bound;

    /** Held while route three's fields are written, so two writes can't interleave. */
    private static final Object PUBLISHING = new Object();

    static {
        palette = TonePalette.fallback();
        publish();
        DarkMode.changed = MaterialYouTheme::publish;
        bind();
    }

    /**
     * Route one, for FDS: a colour a resolver returns for {@code token}.
     *
     * @return the palette's colour if {@code color} is the one Facebook's dark theme gives this
     * token, otherwise {@code color}
     */
    public static int fds(int color, Object token) {
        HookStatus.invoked(FamilyNames.MATERIAL_YOU_THEME);
        if ((color >>> 24) != 0xFF || !(token instanceof Enum) || !DarkMode.on()) return color;
        int[] dark = FDS.get(((Enum<?>) token).name());
        if (dark == null) return color;
        for (int value : dark) {
            if (value == color) return recolour(palette(), color);
        }
        return color;
    }

    /**
     * Route one, for Mig: a colour the Mig dark scheme returns. That scheme only answers for a dark
     * surface, so its greys and blues are recoloured whatever the token, in Facebook's dark mode.
     */
    public static int mig(int color, Object token) {
        HookStatus.invoked(FamilyNames.MATERIAL_YOU_THEME);
        return (color >>> 24) == 0xFF && DarkMode.on() ? recolour(palette(), color) : color;
    }

    /**
     * Route four: a colour the server sends as text. The patch sends every call to
     * {@link Color#parseColor} here, including the ones AMOLED already sent to its own, and AMOLED
     * goes first. A colour this class doesn't know as a dark surface is returned as parsed, and a
     * text that is no colour throws as it did before.
     */
    public static int parseColor(String text) {
        HookStatus.invoked(FamilyNames.MATERIAL_YOU_THEME);
        return darkSurface(SettingsStatus.amoledTheme() ? AmoledTheme.parseColor(text) : Color.parseColor(text));
    }

    /**
     * Route two's counterpart: Facebook reading a colour resource with {@code Context.getColor}. The
     * patch sends every such call here, including the ones AMOLED already sent to its own, and
     * AMOLED goes first.
     *
     * <p>Material You's resource half only recolours night colours, and Facebook keeps its dark
     * palette in the default configuration, where light mode reads it too. The Video tab's bottom
     * bar is {@code getColor} of that palette's #252728 (580 {@code LX/4KA}, 577 {@code LX/4Bb}),
     * in both modes. So one of the dark surfaces takes the palette here, in Facebook's dark mode only.
     * In dark mode the tab bar also sets the window's navigation bar colour from that read for every
     * tab (580 {@code LX/268;->A0F}, 577 {@code LX/29f;->A0F}), which Android 15 and newer draws at
     * 80% over the bottom edge with three-button navigation.
     */
    public static int getColor(Context context, int id) {
        return getColor(context, id, SettingsStatus.amoledTheme());
    }

    static int getColor(Context context, int id, boolean amoled) {
        return darkSurface(amoled ? AmoledTheme.getColor(context, id) : context.getColor(id));
    }

    /** The same for {@code Resources.getColor(int)}. */
    public static int getColor(Resources resources, int id) {
        return getColor(resources, id, SettingsStatus.amoledTheme());
    }

    @SuppressWarnings("deprecation")
    static int getColor(Resources resources, int id, boolean amoled) {
        return darkSurface(amoled ? AmoledTheme.getColor(resources, id) : resources.getColor(id));
    }

    /** The same for {@code Resources.getColor(int, Theme)}. */
    public static int getColor(Resources resources, int id, @Nullable Resources.Theme theme) {
        return getColor(resources, id, theme, SettingsStatus.amoledTheme());
    }

    static int getColor(Resources resources, int id, @Nullable Resources.Theme theme, boolean amoled) {
        return darkSurface(amoled ? AmoledTheme.getColor(resources, id, theme) : resources.getColor(id, theme));
    }

    /** The palette's neutral at the same lightness for one of the {@link #SURFACES}, in dark mode. */
    private static int darkSurface(int color) {
        return isSurface(color) && DarkMode.on() ? palette().sameLightness(TonePalette.NEUTRAL, color) : color;
    }

    /**
     * The status bar: the colour Facebook is about to paint it, and whether Facebook's theme is dark.
     *
     * <p>On Android 15 and newer Facebook paints the bar itself, and the patch calls this first thing
     * in that method. A tab's bar colour often comes from a token that isn't a dark-theme colour at
     * all: back from Recent Apps the Video tab asks for {@code #333334}, which it asks for in light
     * mode too. So the colour alone can't say which theme is on, and the patch passes Facebook's own
     * answer for the window. One of Facebook's dark chrome greys (the band AMOLED blackens) takes the
     * palette's neutral at the same lightness, as every grey this class recolours does.
     *
     * <p>With AMOLED in the build, the patch calls this in place of AMOLED's own hook and AMOLED's
     * rule goes first. Its black stays black, since black is the palette's darkest tone.
     *
     * @return the palette's colour for a dark chrome grey in the dark theme, otherwise {@code color}
     */
    public static int statusBar(int color, boolean dark) {
        return statusBar(color, dark, SettingsStatus.amoledTheme());
    }

    static int statusBar(int color, boolean dark, boolean amoled) {
        HookStatus.invoked(FamilyNames.MATERIAL_YOU_THEME);
        if (amoled) color = AmoledTheme.statusBar(color, dark);
        if (!dark || !AmoledTheme.isDarkNeutral(color, AmoledTheme.MAX_BAR_CHANNEL)) return color;
        return palette().sameLightness(TonePalette.NEUTRAL, color);
    }

    /**
     * The navigation bar, as {@link #statusBar} does it: the Video tab writes its bars'
     * {@code #252728} into code for both themes, and route three leaves a colour a method hands to
     * a system bar for this hook. A dark grey in AMOLED's band for the bar takes the palette's
     * neutral at the same lightness in the dark theme only. With AMOLED in the build its rule goes
     * first.
     *
     * @return the palette's colour for a dark grey in the dark theme, otherwise {@code color}
     */
    public static int navigationBar(int color, boolean dark) {
        return navigationBar(color, dark, SettingsStatus.amoledTheme());
    }

    static int navigationBar(int color, boolean dark, boolean amoled) {
        HookStatus.invoked(FamilyNames.MATERIAL_YOU_THEME);
        if (amoled) color = AmoledTheme.navigationBar(color, dark);
        if (!dark || !AmoledTheme.isDarkNeutral(color, AmoledTheme.MAX_CHANNEL)) return color;
        return palette().sameLightness(TonePalette.NEUTRAL, color);
    }

    /** A grey becomes the palette's neutral, a Facebook blue its accent, both at the same lightness. */
    static int recolour(TonePalette palette, int color) {
        if (isNeutral(color)) return palette.sameLightness(TonePalette.NEUTRAL, color);
        if (isFacebookBlue(color)) return palette.sameLightness(TonePalette.ACCENT, color);
        return color;
    }

    /** A grey: its channels are within 10 of each other. Facebook's greys are within 8. */
    static boolean isNeutral(int color) {
        int r = (color >> 16) & 0xFF;
        int g = (color >> 8) & 0xFF;
        int b = color & 0xFF;
        return Math.max(r, Math.max(g, b)) - Math.min(r, Math.min(g, b)) <= 10;
    }

    /**
     * One of Facebook's blues, #00488C to #ADD5FF: an HSV hue from 200 to 225 degrees, saturation
     * of at least a quarter and value of at least 0.3. Worked in integers, since the Mig hook runs
     * on every layout pass and makes no object.
     */
    static boolean isFacebookBlue(int color) {
        int r = (color >> 16) & 0xFF;
        int g = (color >> 8) & 0xFF;
        int b = color & 0xFF;
        int delta = b - Math.min(r, g);
        if (b < r || b < g || b < 77 || delta * 4 < b) return false;
        // With blue the largest channel, hue = 240 + 60 * (r - g) / delta.
        int turn = 60 * (r - g);
        return turn >= -40 * delta && turn <= -15 * delta;
    }

    static boolean isSurface(int color) {
        return Arrays.binarySearch(SURFACE_VALUES, color) >= 0;
    }

    /** The palette in use, binding it to the phone's once the context is there. */
    static TonePalette palette() {
        if (!bound) bind();
        return palette;
    }

    /**
     * Reads the phone's palette once Hushfacebook has a context, and again whenever the
     * configuration changes. A new wallpaper palette reaches the app as a configuration change.
     */
    private static synchronized void bind() {
        if (bound || !Utils.settingsReady()) return;
        try {
            Context app = Utils.getContext();
            if (app == null) return;
            reload(app);
            app.registerComponentCallbacks(new ComponentCallbacks() {
                @Override
                public void onConfigurationChanged(@NonNull Configuration configuration) {
                    reload(app);
                }

                @Override
                public void onLowMemory() {
                }
            });
            bound = true;
        } catch (RuntimeException failure) {
            Logger.printException(() -> "Material You theme: could not read the wallpaper palette", failure);
        }
    }

    static void reload(Context context) {
        palette = TonePalette.of(context);
        publish();
    }

    /** Package-visible for tests: puts a palette in use and writes the route three fields from it. */
    static void use(TonePalette next, boolean followPhone) {
        palette = next;
        publish();
        bound = !followPhone;
    }

    /**
     * Writes route three's fields from the palette in use: its surfaces in Facebook's dark mode,
     * Facebook's own in light mode. It runs after every change of either, on the thread that made
     * it. One write at a time, each reading the answer and the palette once, so the last one leaves
     * all six fields in the mode and the palette that stand.
     */
    private static void publish() {
        synchronized (PUBLISHING) {
            TonePalette p = DarkMode.on() ? palette : null;
            DARK_101011 = surface(p, 0x101011);
            DARK_18191A = surface(p, 0x18191A);
            DARK_1C1C1D = surface(p, 0x1C1C1D);
            DARK_242526 = surface(p, 0x242526);
            DARK_252728 = surface(p, 0x252728);
            DARK_3E4042 = surface(p, 0x3E4042);
        }
    }

    /** The palette's neutral at the lightness of Facebook's surface {@code rgb}, or Facebook's own without a palette. */
    private static int surface(@Nullable TonePalette p, int rgb) {
        return p == null ? 0xFF000000 | rgb : p.sameLightness(TonePalette.NEUTRAL, 0xFF000000 | rgb);
    }

    private static Map<String, int[]> parseTokens(String table) {
        Map<String, int[]> tokens = new HashMap<>();
        for (String entry : table.split(";")) {
            int equals = entry.indexOf('=');
            String[] hex = entry.substring(equals + 1).split(",");
            int[] values = new int[hex.length];
            for (int i = 0; i < hex.length; i++) values[i] = 0xFF000000 | Integer.parseInt(hex[i], 16);
            if (tokens.put(entry.substring(0, equals), values) != null) {
                throw new IllegalStateException("token listed twice: " + entry);
            }
        }
        return tokens;
    }

    private static int[] parseSurfaces(String list) {
        String[] hex = list.split(" ");
        int[] values = new int[hex.length];
        for (int i = 0; i < hex.length; i++) values[i] = 0xFF000000 | Integer.parseInt(hex[i], 16);
        Arrays.sort(values);
        return values;
    }
}
