package app.fakh.extension.github;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.res.Configuration;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.os.Bundle;
import android.os.Process;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsets;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

/**
 * Material You for GitHub's Compose color schemes, which define their colors in code, and the Material You and
 * AMOLED black switches. The View colors come from the resource patch, under the {@code round} (Material You) and
 * {@code notlong} (AMOLED black) qualifiers, which {@link #wrap(Context)} turns on or off for every activity.
 */
@SuppressWarnings("unused")
public final class MaterialYou {
    /** GitHub's own settings file, which the Fakh Patches switches persist to. */
    private static final String PREFS = "settings_preferences";
    /** Setting keys, also the keys of their rows in Settings. */
    public static final String MATERIAL_YOU = "fakh_material_you";
    public static final String AMOLED = "fakh_amoled";
    /** Tag of the restart bar, so a second toggle replaces it instead of stacking. */
    private static final String RESTART_BAR = "fakh_restart_bar";

    // Material 3 surface roles (Android 14), with the neutral tones closest to them on Android 12 and 13.
    private static final boolean ROLES = Build.VERSION.SDK_INT >= Build.VERSION_CODES.UPSIDE_DOWN_CAKE;

    /** Primer blue (0xRRGGBB) of either scheme to the accent tone of the same lightness. */
    private static final Map<Integer, Integer> ACCENTS = new HashMap<>();
    /**
     * Primer gray (0xRRGGBB) to the neutral tone of the same lightness, for translucent grays only: the borders
     * and dividers the palettes build as gray with alpha. Neutral1 has the least wallpaper tint.
     */
    private static final Map<Integer, Integer> TRANSLUCENT_GRAYS = new HashMap<>();
    /** Light neutral background (0xRRGGBB) to the surface role that replaces it. */
    private static final Map<Integer, Integer> LIGHT_SURFACES = new HashMap<>();
    /** Dark neutral background (0xRRGGBB) to the surface role that replaces it. */
    private static final Map<Integer, Integer> DARK_SURFACES = new HashMap<>();
    /** Opaque borders of the light and dark scheme, which only pair with each other. */
    private static final int LIGHT_BORDER = 0xBFC1C9;
    private static final int DARK_BORDER = 0x41434E;
    /**
     * The dark gray of floating action bars (Comment and info on pull requests) in the light and dark scheme. It
     * becomes a tinted dark tone in both, so its white label stays readable.
     */
    private static final int LIGHT_ACTION_BAR = 0x1F1F24;
    private static final int DARK_ACTION_BAR = 0x383A42;
    /** Dark canvas and card colors, which AMOLED black turns black. */
    private static final Set<Integer> AMOLED_SURFACES = new HashSet<>(Arrays.asList(0x050505, 0x0B0B0D, 0x17181C));

    static {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            // Links, buttons and selected states: very light tints, mid blues, GitHub blue, and the dark blues.
            ACCENTS.put(0xF1F8FF, android.R.color.system_accent1_10);
            ACCENTS.put(0xF5FAFF, android.R.color.system_accent1_10);
            ACCENTS.put(0xDBEDFF, android.R.color.system_accent1_50);
            ACCENTS.put(0xDDF4FF, android.R.color.system_accent1_50);
            ACCENTS.put(0xE5F2FF, android.R.color.system_accent1_50);
            ACCENTS.put(0xC8E1FF, android.R.color.system_accent1_100);
            ACCENTS.put(0xD1E6FF, android.R.color.system_accent1_100);
            ACCENTS.put(0x85BEFF, android.R.color.system_accent1_200);
            ACCENTS.put(0x79B8FF, android.R.color.system_accent1_300);
            ACCENTS.put(0x2188FF, android.R.color.system_accent1_400);
            ACCENTS.put(0x2E8FFF, android.R.color.system_accent1_400);
            ACCENTS.put(0x388BFD, android.R.color.system_accent1_400);
            ACCENTS.put(0x006EDB, android.R.color.system_accent1_500);
            ACCENTS.put(0x0D6EDB, android.R.color.system_accent1_500);
            ACCENTS.put(0x0576FF, android.R.color.system_accent1_500);
            ACCENTS.put(0x0366D6, android.R.color.system_accent1_600);
            ACCENTS.put(0x005CC5, android.R.color.system_accent1_600);
            ACCENTS.put(0x0C65C9, android.R.color.system_accent1_600);
            ACCENTS.put(0x044289, android.R.color.system_accent1_700);
            ACCENTS.put(0x0B498F, android.R.color.system_accent1_700);
            ACCENTS.put(0x032F62, android.R.color.system_accent1_800);
            ACCENTS.put(0x05264C, android.R.color.system_accent1_800);
            ACCENTS.put(0x063366, android.R.color.system_accent1_800);
            ACCENTS.put(0x082A52, android.R.color.system_accent1_800);
            // Checked switch tracks, hardcoded in the switch component: light and dark.
            ACCENTS.put(0xB3D1F5, android.R.color.system_accent1_200);
            ACCENTS.put(0x183564, android.R.color.system_accent1_800);
            TRANSLUCENT_GRAYS.put(0x41434E, android.R.color.system_neutral1_700);
            TRANSLUCENT_GRAYS.put(0x525560, android.R.color.system_neutral1_600);
            TRANSLUCENT_GRAYS.put(0x6C6F7E, android.R.color.system_neutral1_500);
            TRANSLUCENT_GRAYS.put(0x9194A1, android.R.color.system_neutral1_400);
            TRANSLUCENT_GRAYS.put(0xBFC1C9, android.R.color.system_neutral1_200);
            TRANSLUCENT_GRAYS.put(0xD6D7DC, android.R.color.system_neutral1_100);
            // Light: cards, bars and plain pages; the canvas behind cards; inset fields; borders. Code blocks (#F7F7F9)
            // keep their gray, so diffs stay easy to read.
            LIGHT_SURFACES.put(0xFFFFFF, ROLES ? android.R.color.system_surface_light : android.R.color.system_neutral2_50);
            LIGHT_SURFACES.put(0xFBFBFC, ROLES ? android.R.color.system_surface_light : android.R.color.system_neutral2_50);
            LIGHT_SURFACES.put(0xEFF0F5, ROLES ? android.R.color.system_surface_container_low_light : android.R.color.system_neutral2_100);
            LIGHT_SURFACES.put(0xE3E4E8, ROLES ? android.R.color.system_surface_container_highest_light : android.R.color.system_neutral2_100);
            LIGHT_SURFACES.put(LIGHT_BORDER, ROLES ? android.R.color.system_surface_container_highest_light : android.R.color.system_neutral2_200);
            // Dark: the canvas, cards a step lighter, raised surfaces of sheets, menus and dialogs, borders.
            DARK_SURFACES.put(0x050505, ROLES ? android.R.color.system_surface_dark : android.R.color.system_neutral1_1000);
            DARK_SURFACES.put(0x0B0B0D, ROLES ? android.R.color.system_surface_dark : android.R.color.system_neutral1_1000);
            DARK_SURFACES.put(0x17181C, ROLES ? android.R.color.system_surface_container_dark : android.R.color.system_neutral1_900);
            DARK_SURFACES.put(0x1F1F24, ROLES ? android.R.color.system_surface_container_high_dark : android.R.color.system_neutral2_800);
            DARK_SURFACES.put(0x2E2F37, ROLES ? android.R.color.system_surface_container_high_dark : android.R.color.system_neutral2_800);
            DARK_SURFACES.put(0x383A42, ROLES ? android.R.color.system_surface_container_high_dark : android.R.color.system_neutral2_800);
            DARK_SURFACES.put(DARK_BORDER, ROLES ? android.R.color.system_surface_container_highest_dark : android.R.color.system_neutral2_700);
        }
    }

    /** A dark scheme field that AMOLED black turns black, with the color it has otherwise. */
    private static final class AmoledField {
        final Object scheme;
        final Field field;
        final long normal;

        AmoledField(Object scheme, Field field, long normal) {
            this.scheme = scheme;
            this.field = field;
            this.normal = normal;
        }
    }

    /** Every dark canvas and card field of the schemes, to switch AMOLED black while the app runs. */
    private static final List<AmoledField> AMOLED_FIELDS = new ArrayList<>();

    // Read once per process, except AMOLED black, which switches in place: Material You needs a restart.
    private static Boolean materialYou;
    private static Boolean amoled;

    private MaterialYou() {
    }

    /**
     * Injected at the end of the static initializers that build GitHub's Compose color schemes, once per pair of
     * light and dark scheme. Rewrites both in place, before any screen or derived theme reads them.
     *
     * <p>Blues become the accent in either scheme. A neutral becomes a surface role only when the same field is a
     * neutral background in both schemes, such as white in light and near-black in dark: white text on buttons
     * stays white in both, so it is left alone. With Material You off, only AMOLED black applies. The dark
     * canvas and card fields are remembered, so AMOLED black can be switched while the app runs.
     *
     * @param light the light scheme, whose fields are packed Compose colors
     * @param dark  the dark scheme, of the same class
     */
    public static void schemes(Object light, Object dark) {
        Context context = application();
        if (context == null || Build.VERSION.SDK_INT < Build.VERSION_CODES.S) return;
        boolean colors = isMaterialYou(context);
        boolean black = isAmoled(context);
        int lightAccent = context.getColor(android.R.color.system_accent1_600);
        int darkAccent = context.getColor(android.R.color.system_accent1_200);
        for (Field field : light.getClass().getDeclaredFields()) {
            if (field.getType() != long.class || Modifier.isStatic(field.getModifiers())) continue;
            try {
                field.setAccessible(true);
                long lightColor = field.getLong(light);
                long darkColor = field.getLong(dark);
                // Only sRGB colors, whose color space id in the low bits is 0.
                if ((lightColor & 0x3FL) != 0 || (darkColor & 0x3FL) != 0) continue;
                int lightArgb = (int) (lightColor >>> 32);
                int darkArgb = (int) (darkColor >>> 32);
                if (colors && lightArgb == (0xFF000000 | LIGHT_ACTION_BAR) && darkArgb == (0xFF000000 | DARK_ACTION_BAR)) {
                    field.setLong(light, pack(context.getColor(android.R.color.system_neutral1_800)));
                    field.setLong(dark, pack(context.getColor(ROLES
                            ? android.R.color.system_surface_container_highest_dark : android.R.color.system_neutral2_700)));
                    continue;
                }
                Integer lightSurface = opaque(lightArgb) ? LIGHT_SURFACES.get(lightArgb & 0xFFFFFF) : null;
                Integer darkSurface = opaque(darkArgb) ? DARK_SURFACES.get(darkArgb & 0xFFFFFF) : null;
                if (lightSurface != null && darkSurface != null
                        && ((lightArgb & 0xFFFFFF) == LIGHT_BORDER) == ((darkArgb & 0xFFFFFF) == DARK_BORDER)) {
                    if (colors) field.setLong(light, pack(context.getColor(lightSurface)));
                    long normal = colors ? pack(context.getColor(darkSurface)) : darkColor;
                    if (AMOLED_SURFACES.contains(darkArgb & 0xFFFFFF)) {
                        synchronized (AMOLED_FIELDS) {
                            AMOLED_FIELDS.add(new AmoledField(dark, field, normal));
                        }
                        if (black) normal = pack(0xFF000000);
                    }
                    field.setLong(dark, normal);
                    continue;
                }
                if (!colors) continue;
                Integer accent = accent(context, lightArgb, lightAccent);
                if (accent != null) field.setLong(light, pack(accent));
                accent = accent(context, darkArgb, darkAccent);
                if (accent != null) field.setLong(dark, pack(accent));
            } catch (ReflectiveOperationException ignored) {
            }
        }
    }

    /**
     * Injected at the end of the static initializers of GitHub's Compose palettes, once per color. The schemes and
     * a few components (switch tracks, progress bars) copy these colors, so their blues are replaced here first.
     *
     * @param packed a packed Compose color
     * @return the accent tone (blues) or neutral tone (translucent grays) of the same lightness, with the
     *     color's own alpha, or {@code packed}
     */
    public static long paletteColor(long packed) {
        if ((packed & 0x3FL) != 0 || Build.VERSION.SDK_INT < Build.VERSION_CODES.S) return packed;
        Context context = application();
        if (context == null || !isMaterialYou(context)) return packed;
        int argb = (int) (packed >>> 32);
        Integer tone = ACCENTS.get(argb & 0xFFFFFF);
        if (tone == null && !opaque(argb)) tone = TRANSLUCENT_GRAYS.get(argb & 0xFFFFFF);
        if (tone == null) return packed;
        return pack((argb & 0xFF000000) | (context.getColor(tone) & 0xFFFFFF));
    }

    /**
     * Injected after each blue color literal in code, such as the checked track of switches, which components
     * pass as a plain ARGB long instead of reading a palette.
     *
     * @param argb an opaque ARGB color as a long
     * @return the accent tone of the same lightness, or {@code argb}
     */
    public static long colorLiteral(long argb) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.S) return argb;
        Context context = application();
        if (context == null || !isMaterialYou(context)) return argb;
        Integer tone = ACCENTS.get((int) argb & 0xFFFFFF);
        return tone == null ? argb : context.getColor(tone) & 0xFFFFFFFFL;
    }

    /**
     * The accent that replaces a Primer blue: the tone of the same lightness for an opaque blue, and the main
     * accent with the blue's own alpha for a translucent one (selected tab pills, pressed rows).
     *
     * @return the new ARGB color, or null when [argb] is not a Primer blue
     */
    private static Integer accent(Context context, int argb, int mainAccent) {
        Integer tone = ACCENTS.get(argb & 0xFFFFFF);
        if (tone == null) return null;
        if (opaque(argb)) return context.getColor(tone);
        return (argb & 0xFF000000) | (mainAccent & 0xFFFFFF);
    }

    private static boolean opaque(int argb) {
        return (argb >>> 24) == 0xFF;
    }

    /** An ARGB color as a packed sRGB Compose Color. */
    private static long pack(int argb) {
        return (argb & 0xFFFFFFFFL) << 32;
    }

    /**
     * Injected at the start of AppCompatActivity.attachBaseContext. Selects the resource patch's colors, which
     * sit under two screen qualifiers that phones never report on their own terms here: {@code round} for
     * Material You and {@code notlong} for AMOLED black. Both are forced on or off from the settings, so the
     * real screen shape never picks them.
     *
     * @param base the activity's base context
     * @return a context with the screen shape overridden
     */
    public static Context wrap(Context base) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.S) return base;
        watchActivities(base);
        int layout = base.getResources().getConfiguration().screenLayout;
        Configuration override = new Configuration();
        // Layout direction bits left at 0 keep the base context's own direction.
        override.screenLayout = layout & ~(Configuration.SCREENLAYOUT_LONG_MASK | Configuration.SCREENLAYOUT_ROUND_MASK
                | Configuration.SCREENLAYOUT_LAYOUTDIR_MASK)
                | (isAmoled(base) ? Configuration.SCREENLAYOUT_LONG_NO : Configuration.SCREENLAYOUT_LONG_YES)
                | (isMaterialYou(base) ? Configuration.SCREENLAYOUT_ROUND_YES : Configuration.SCREENLAYOUT_ROUND_NO);
        return base.createConfigurationContext(override);
    }

    /**
     * Called after a switch in the Fakh Patches section was toggled, which already saved its new state in the
     * background. Saves it again synchronously, so a restart cannot lose it. AMOLED black applies right away;
     * Material You offers a restart, since the palettes and everything copied from them are built once per process.
     *
     * @param context the settings screen's context
     * @param key     the switch's key
     */
    public static void toggled(Context context, String key) {
        SharedPreferences prefs = prefs(context);
        boolean on = prefs.getBoolean(key, MATERIAL_YOU.equals(key));
        prefs.edit().putBoolean(key, on).commit();
        Activity activity = activity(context);
        if (AMOLED.equals(key)) {
            setAmoled(on);
            if (activity != null) activity.recreate();
        } else if (activity != null) {
            showRestartBar(activity);
        }
    }

    /** Turns the remembered dark canvas and card fields black, or back to their normal color. */
    private static void setAmoled(boolean on) {
        amoled = on;
        synchronized (AMOLED_FIELDS) {
            for (AmoledField entry : AMOLED_FIELDS) {
                try {
                    entry.field.setLong(entry.scheme, on ? pack(0xFF000000) : entry.normal);
                } catch (ReflectiveOperationException ignored) {
                }
            }
        }
    }

    /** The Black setting each activity was created with. */
    private static final Map<Activity, Boolean> CREATED_BLACK = new WeakHashMap<>();
    private static boolean watching;

    /**
     * Recreates an activity that comes back to the front with the other AMOLED black setting: the screens behind Settings were created before the switch, and their View colors come from their
     * base context.
     */
    private static void watchActivities(Context context) {
        if (watching || !(context.getApplicationContext() instanceof Application)) return;
        watching = true;
        ((Application) context.getApplicationContext()).registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
            @Override
            public void onActivityCreated(Activity activity, Bundle savedInstanceState) {
                CREATED_BLACK.put(activity, isAmoled(activity));
            }

            @Override
            public void onActivityResumed(Activity activity) {
                Boolean black = CREATED_BLACK.get(activity);
                if (black != null && black != isAmoled(activity)) activity.recreate();
            }

            @Override
            public void onActivityStarted(Activity activity) {
            }

            @Override
            public void onActivityPaused(Activity activity) {
            }

            @Override
            public void onActivityStopped(Activity activity) {
            }

            @Override
            public void onActivitySaveInstanceState(Activity activity, Bundle outState) {
            }

            @Override
            public void onActivityDestroyed(Activity activity) {
            }
        });
    }

    /**
     * A snackbar-like bar at the bottom of the screen, in the Material 3 inverse surface colors, saying the change
     * applies after a restart, with a Restart action. It hides itself after a few seconds.
     */
    private static void showRestartBar(Activity activity) {
        ViewGroup root = activity.findViewById(android.R.id.content);
        if (root == null) return;
        View old = root.findViewWithTag(RESTART_BAR);
        if (old != null) root.removeView(old);

        boolean dark = (activity.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
                == Configuration.UI_MODE_NIGHT_YES;
        float density = activity.getResources().getDisplayMetrics().density;
        LinearLayout bar = new LinearLayout(activity);
        bar.setTag(RESTART_BAR);
        bar.setGravity(Gravity.CENTER_VERTICAL);
        bar.setPadding((int) (16 * density), (int) (6 * density), (int) (8 * density), (int) (6 * density));
        GradientDrawable background = new GradientDrawable();
        background.setCornerRadius(4 * density);
        background.setColor(activity.getColor(dark ? android.R.color.system_neutral1_100 : android.R.color.system_neutral1_800));
        bar.setBackground(background);
        bar.setElevation(6 * density);

        TextView message = new TextView(activity);
        message.setText("Restart GitHub to apply");
        message.setTextSize(14);
        message.setTextColor(activity.getColor(dark ? android.R.color.system_neutral1_800 : android.R.color.system_neutral1_50));
        bar.addView(message, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));

        Button restart = new Button(activity, null, android.R.attr.borderlessButtonStyle);
        restart.setText("Restart");
        restart.setTextColor(activity.getColor(dark ? android.R.color.system_accent1_600 : android.R.color.system_accent1_200));
        restart.setOnClickListener(v -> restart(activity));
        bar.addView(restart);

        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.BOTTOM);
        int margin = (int) (16 * density);
        params.setMargins(margin, margin, margin, margin + navigationBarHeight(root));
        root.addView(bar, params);
        bar.postDelayed(() -> root.removeView(bar), 6000);
    }

    /** Height of the navigation bar under the content, which edge-to-edge screens draw behind. */
    private static int navigationBarHeight(View root) {
        WindowInsets insets = root.getRootWindowInsets();
        return insets == null ? 0 : insets.getInsets(WindowInsets.Type.navigationBars()).bottom;
    }

    /** The activity behind a view's context, which preferences wrap in a themed context. */
    private static Activity activity(Context context) {
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity) return (Activity) context;
            context = ((ContextWrapper) context).getBaseContext();
        }
        return null;
    }

    private static boolean isMaterialYou(Context context) {
        if (materialYou == null) materialYou = prefs(context).getBoolean(MATERIAL_YOU, true);
        return materialYou;
    }

    private static boolean isAmoled(Context context) {
        if (amoled == null) amoled = prefs(context).getBoolean(AMOLED, false);
        return amoled;
    }

    /** GitHub's settings file, where the Fakh Patches switches save their state. */
    private static SharedPreferences prefs(Context context) {
        return context.getApplicationContext() != null
                ? context.getApplicationContext().getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                : context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    /** Starts the app over in a fresh process. */
    private static void restart(Context context) {
        Intent launch = context.getPackageManager().getLaunchIntentForPackage(context.getPackageName());
        if (launch == null) return;
        context.startActivity(Intent.makeRestartActivityTask(launch.getComponent()));
        Process.killProcess(Process.myPid());
    }

    /** The app's Application, for the scheme initializers that run without a Context at hand. */
    private static Application application() {
        try {
            return (Application) Class.forName("android.app.ActivityThread").getMethod("currentApplication").invoke(null);
        } catch (ReflectiveOperationException e) {
            return null;
        }
    }
}
