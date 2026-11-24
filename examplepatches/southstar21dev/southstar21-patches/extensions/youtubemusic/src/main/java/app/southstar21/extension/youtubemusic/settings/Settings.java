package app.southstar21.extension.youtubemusic.settings;

import android.content.Context;
import android.content.SharedPreferences;

/**
 * The settings of the southstar21 Patches menu, stored in YouTube Music's own preferences.
 * Values read while drawing are kept in fields, so a frame never waits on the preferences.
 * Whoever changes a setting redraws what shows it (see SettingsMenu).
 */
public final class Settings {
    private static final String PREFERENCES = "southstar21_patches";
    private static final String KEY_LIGHTWEIGHT_GLASS = "liquid_glass_lightweight";
    private static final String KEY_PLAYER_COLOR_ENABLED = "player_color_enabled";
    private static final String KEY_PLAYER_COLOR_CHOICE = "player_color_choice";
    private static final String KEY_HIDE_ASK_MUSIC = "hide_ask_music";
    private static final String KEY_WELCOME_SHOWN = "welcome_shown";

    private static SharedPreferences preferences;
    private static Context appContext;
    private static volatile boolean lightweightGlass = true;
    private static volatile boolean playerColorEnabled;
    private static volatile int playerColorChoice;
    private static volatile boolean hideAskMusic = true;

    private Settings() {
    }

    /** Loads the stored values. Safe to call again. */
    public static void init(Context context) {
        if (preferences != null) return;
        appContext = context.getApplicationContext();
        preferences = appContext.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE);
        lightweightGlass = preferences.getBoolean(KEY_LIGHTWEIGHT_GLASS, true);
        playerColorEnabled = preferences.getBoolean(KEY_PLAYER_COLOR_ENABLED, false);
        playerColorChoice = preferences.getInt(KEY_PLAYER_COLOR_CHOICE, 0);
        hideAskMusic = preferences.getBoolean(KEY_HIDE_ASK_MUSIC, true);
    }

    /**
     * Some hooks run before the main activity has focus (YouTube Music colors its player while
     * starting up), so this loads the preferences from the application if init() hasn't run yet.
     */
    private static void ensureLoaded() {
        if (preferences != null) return;
        try {
            Context app = (Context) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication").invoke(null);
            if (app != null) init(app);
        } catch (Throwable ignored) {
            // The defaults stand until the activity calls init().
        }
    }

    /** The application, or null this early. */
    public static Context context() {
        ensureLoaded();
        return appContext;
    }

    /**
     * Lightweight glass: one blur and painted shading everywhere, no refraction shaders, no
     * edge blur. Off: the full Liquid Glass effect. On by default.
     */
    public static boolean lightweightGlass() {
        return lightweightGlass;
    }

    public static void setLightweightGlass(boolean on) {
        if (lightweightGlass == on) return;
        lightweightGlass = on;
        if (preferences != null) preferences.edit().putBoolean(KEY_LIGHTWEIGHT_GLASS, on).apply();
    }

    /** Disable dynamic player color is switched on in the menu (off by default, even once the patch is included). */
    public static boolean playerColorEnabled() {
        ensureLoaded();
        return playerColorEnabled;
    }

    public static void setPlayerColorEnabled(boolean on) {
        playerColorEnabled = on;
        if (preferences != null) preferences.edit().putBoolean(KEY_PLAYER_COLOR_ENABLED, on).apply();
    }

    /** The player's neutral color, an index into PlayerColorPatch.COLOR_NAMES. */
    public static int playerColorChoice() {
        ensureLoaded();
        return playerColorChoice;
    }

    public static void setPlayerColorChoice(int choice) {
        playerColorChoice = choice;
        if (preferences != null) preferences.edit().putInt(KEY_PLAYER_COLOR_CHOICE, choice).apply();
    }

    /** Hide Ask Music button is switched on (on by default, once the patch is included). */
    public static boolean hideAskMusic() {
        ensureLoaded();
        return hideAskMusic;
    }

    public static void setHideAskMusic(boolean on) {
        hideAskMusic = on;
        if (preferences != null) preferences.edit().putBoolean(KEY_HIDE_ASK_MUSIC, on).apply();
    }

    /**
     * Whether the welcome (see {@link WelcomeBanner}) was shown already. Not a setting: resetting
     * the settings leaves it alone. True while the preferences aren't loaded, so it never shows then.
     */
    static boolean welcomeShown() {
        return preferences == null || preferences.getBoolean(KEY_WELCOME_SHOWN, false);
    }

    static void setWelcomeShown() {
        if (preferences != null) preferences.edit().putBoolean(KEY_WELCOME_SHOWN, true).apply();
    }
}
