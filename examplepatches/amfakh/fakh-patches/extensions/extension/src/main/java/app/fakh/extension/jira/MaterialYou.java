package app.fakh.extension.jira;

import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.res.Configuration;
import android.os.Build;
import android.os.Process;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.HashMap;
import java.util.Map;

import app.fakh.extension.shared.AppRuntime;

/**
 * Material You for Jira's Compose color palettes, which define their colors in code, and the Material You and pitch
 * black switches. The View colors come from the resource patch, under the {@code round} (Material You) and
 * {@code notlong} (pitch black) qualifiers, which {@link #wrap(Context)} turns on or off for every activity.
 */
@SuppressWarnings("unused")
public final class MaterialYou {
    // Material 3 surface roles (Android 14), with the neutral tones closest to them on Android 12 and 13.
    private static final boolean ROLES = Build.VERSION.SDK_INT >= Build.VERSION_CODES.UPSIDE_DOWN_CAKE;

    /** Atlassian blue (0xRRGGBB) to the accent tone of the same lightness. */
    private static final Map<Integer, Integer> ACCENTS = new HashMap<>();
    /** Light neutral backgrounds (0xRRGGBB) to the surface role that replaces them. */
    private static final Map<Integer, Integer> LIGHT_SURFACES = new HashMap<>();
    /** Dark neutral backgrounds (0xRRGGBB) to the surface role that replaces them. */
    private static final Map<Integer, Integer> DARK_SURFACES = new HashMap<>();

    static {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            ACCENTS.put(0xE9F2FE, android.R.color.system_accent1_50);
            ACCENTS.put(0xDEEBFF, android.R.color.system_accent1_50);
            ACCENTS.put(0xCFE1FD, android.R.color.system_accent1_100);
            ACCENTS.put(0xB3D4FF, android.R.color.system_accent1_100);
            ACCENTS.put(0xADCBFB, android.R.color.system_accent1_200);
            ACCENTS.put(0x8FB8F6, android.R.color.system_accent1_200);
            ACCENTS.put(0x669DF1, android.R.color.system_accent1_200);
            ACCENTS.put(0x4C9AFF, android.R.color.system_accent1_200);
            ACCENTS.put(0x4794FF, android.R.color.system_accent1_200);
            ACCENTS.put(0x4688EC, android.R.color.system_accent1_500);
            ACCENTS.put(0x2684FF, android.R.color.system_accent1_500);
            ACCENTS.put(0x247FFF, android.R.color.system_accent1_500);
            ACCENTS.put(0x357DE8, android.R.color.system_accent1_600);
            ACCENTS.put(0x1868DB, android.R.color.system_accent1_600);
            ACCENTS.put(0x0065FF, android.R.color.system_accent1_600);
            ACCENTS.put(0x0052CC, android.R.color.system_accent1_600);
            ACCENTS.put(0x0055CC, android.R.color.system_accent1_600);
            ACCENTS.put(0x1558BC, android.R.color.system_accent1_700);
            ACCENTS.put(0x0747A6, android.R.color.system_accent1_700);
            ACCENTS.put(0x144794, android.R.color.system_accent1_800);
            ACCENTS.put(0x123263, android.R.color.system_accent1_800);
            ACCENTS.put(0x1C2B42, android.R.color.system_accent1_900);
            // Light: cards and bars (white), the canvas behind them, tinted fills, borders. The legacy N* ramp
            // follows the same steps.
            LIGHT_SURFACES.put(0xFFFFFF, role(android.R.color.system_surface_light, android.R.color.system_neutral2_50));
            LIGHT_SURFACES.put(0xF8F8F8, role(android.R.color.system_surface_container_low_light, android.R.color.system_neutral2_100));
            LIGHT_SURFACES.put(0xF4F5F7, role(android.R.color.system_surface_container_low_light, android.R.color.system_neutral2_100));
            LIGHT_SURFACES.put(0xF0F1F2, role(android.R.color.system_surface_container_low_light, android.R.color.system_neutral2_100));
            LIGHT_SURFACES.put(0xEBECF0, role(android.R.color.system_surface_container_low_light, android.R.color.system_neutral2_100));
            LIGHT_SURFACES.put(0xDDDEE1, role(android.R.color.system_surface_container_highest_light, android.R.color.system_neutral2_200));
            // Dark: the canvas behind cards, cards a step lighter, raised surfaces of sheets and menus, borders.
            DARK_SURFACES.put(0x111213, role(android.R.color.system_surface_dark, android.R.color.system_neutral1_1000));
            DARK_SURFACES.put(0x18191A, role(android.R.color.system_surface_container_dark, android.R.color.system_neutral1_900));
            DARK_SURFACES.put(0x1F1F21, role(android.R.color.system_surface_container_high_dark, android.R.color.system_neutral2_800));
            DARK_SURFACES.put(0x242528, role(android.R.color.system_surface_container_highest_dark, android.R.color.system_neutral2_700));
            DARK_SURFACES.put(0x2B2C2F, role(android.R.color.system_surface_container_highest_dark, android.R.color.system_neutral2_700));
        }
    }

    /** The settings file that holds the Fakh Patches switches. */
    private static final String PREFS = "fakh_patches";
    /** Switch keys: Material You is on unless turned off, pitch black off unless turned on. */
    private static final String MATERIAL_YOU = "fakh_material_you";
    private static final String PITCH_BLACK = "fakh_pitch_black";
    private static final String HIDE_ROVO = "fakh_hide_rovo";
    /** Pref key, label and default of each Fakh Patches switch, by the number its row is made with. */
    static final String[] KEYS = {MATERIAL_YOU, PITCH_BLACK, HIDE_ROVO, "fakh_hide_tab_labels", "fakh_liquid_glass",
            "fakh_tab_Spaces", "fakh_tab_All work", "fakh_tab_Dashboards", "fakh_tab_Notifications"};
    static final String[] LABELS = {"Material You", "Pitch black", "Hide Rovo", "Hide tab labels", "Liquid Glass",
            "Spaces", "All work", "Dashboards", "Notifications"};
    static final boolean[] DEFAULTS = {true, false, true, false, true, true, true, true, true};

    /** The darkest page background (0xRRGGBB), the canvas behind cards, which pitch black turns black. */
    private static final int DARK_CANVAS = 0x111213;
    /** The card background one step up (0xRRGGBB), which pitch black lowers to the canvas role. */
    private static final int DARK_CARD = 0x18191A;

    private MaterialYou() {
    }

    /** The Material 3 role on Android 14 and up, otherwise the neutral tone closest to it. */
    private static int role(int role, int fallback) {
        return ROLES ? role : fallback;
    }

    /**
     * Injected at the end of the static initializers of Jira's Compose palettes, once per color.
     *
     * @param packed a packed Compose color
     * @return the accent tone of the same lightness for a blue, or the surface role for an opaque neutral
     *     background, keeping the color's own alpha, or {@code packed}
     */
    public static long paletteColor(long packed) {
        if ((packed & 0x3FL) != 0 || Build.VERSION.SDK_INT < Build.VERSION_CODES.S) return packed;
        Context context = AppRuntime.application();
        if (context == null || !materialYou(context)) return packed;
        int argb = (int) (packed >>> 32);
        int rgb = argb & 0xFFFFFF;
        Integer tone = ACCENTS.get(rgb);
        if (tone == null && (argb >>> 24) == 0xFF) {
            if ((rgb == DARK_CANVAS || rgb == DARK_CARD) && pitchBlack(context)) {
                return rgb == DARK_CANVAS ? pack(0xFF000000) : surfaceDark(context);
            }
            tone = LIGHT_SURFACES.get(rgb);
            if (tone == null) tone = DARK_SURFACES.get(rgb);
        }
        if (tone == null) return packed;
        return pack((argb & 0xFF000000) | (context.getColor(tone) & 0xFFFFFF));
    }

    /** The dark surface role, packed. */
    private static long surfaceDark(Context context) {
        return pack(0xFF000000 | (context.getColor(DARK_SURFACES.get(DARK_CANVAS)) & 0xFFFFFF));
    }

    /** Whether the Material You patch is in; the patch makes this return true. */
    static boolean isMaterialYouIncluded() {
        return false;
    }

    /**
     * Whether Material You is patched in and its switch is on. Read when the palettes are built, so a change applies
     * after a restart. Without the patch the glass bar's pill stays neutral.
     */
    static boolean materialYou(Context context) {
        return isMaterialYouIncluded() && prefs(context).getBoolean(MATERIAL_YOU, true);
    }

    /** Whether the pitch black switch is on. Read when the palettes are built, so a change applies after a restart. */
    private static boolean pitchBlack(Context context) {
        return prefs(context).getBoolean(PITCH_BLACK, false);
    }

    static SharedPreferences prefs(Context context) {
        return context.getApplicationContext() != null
                ? context.getApplicationContext().getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                : context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    /**
     * Injected at the start of AppCompatActivity.attachBaseContext. Selects the resource patch's colors, which sit
     * under two screen qualifiers that phones never report on their own terms here: {@code round} for Material You
     * and {@code notlong} for pitch black. Both are forced on or off from the settings.
     *
     * @param activity the activity being created, which the Settings snackbar later needs
     * @param base the activity's base context
     * @return a context with the screen shape overridden
     */
    public static Context wrap(android.app.Activity activity, Context base) {
        FakhSettings.remember(activity);
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.S) return base;
        int layout = base.getResources().getConfiguration().screenLayout;
        Configuration override = new Configuration();
        // Layout direction bits left at 0 keep the base context's own direction.
        override.screenLayout = layout & ~(Configuration.SCREENLAYOUT_LONG_MASK | Configuration.SCREENLAYOUT_ROUND_MASK
                | Configuration.SCREENLAYOUT_LAYOUTDIR_MASK)
                | (pitchBlack(base) ? Configuration.SCREENLAYOUT_LONG_NO : Configuration.SCREENLAYOUT_LONG_YES)
                | (materialYou(base) ? Configuration.SCREENLAYOUT_ROUND_YES : Configuration.SCREENLAYOUT_ROUND_NO);
        return base.createConfigurationContext(override);
    }

    /** Whether the bottom bar hides the text under its icons. */
    static boolean hideTabLabels(Context context) {
        return prefs(context).getBoolean(KEYS[3], false);
    }

    /** Whether the bottom bar has the Liquid Glass look. */
    static boolean liquidGlass(Context context) {
        return prefs(context).getBoolean(KEYS[4], true);
    }

    /** Whether the bottom bar shows the tab with this label; tabs it has no switch for always show. */
    static boolean tabShown(Context context, CharSequence label) {
        return label == null || prefs(context).getBoolean("fakh_tab_" + label, true);
    }

    /** Whether the Rovo button and icons are hidden. */
    public static boolean hideRovo() {
        Context context = AppRuntime.application();
        return context == null || prefs(context).getBoolean(HIDE_ROVO, true);
    }

    /** The answers of the methods every object has, for proxies. */
    static Object objectMethod(Object proxy, Method method, Object[] args) {
        switch (method.getName()) {
            case "equals":
                return args != null && proxy == args[0];
            case "hashCode":
                return System.identityHashCode(proxy);
            default:
                return "FakhPatchesRow";
        }
    }

    /** An sRGB Compose color: the ARGB value in the high 32 bits, the color space id (sRGB is 0) below. */
    private static long pack(int argb) {
        return (argb & 0xFFFFFFFFL) << 32;
    }
}
