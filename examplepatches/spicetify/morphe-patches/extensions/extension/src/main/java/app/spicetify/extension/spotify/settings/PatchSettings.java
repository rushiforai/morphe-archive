package app.spicetify.extension.spotify.settings;

import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import app.spicetify.extension.spotify.home.HomePins;
import app.spicetify.extension.spotify.localserver.ServerConfig;
import app.spicetify.extension.spotify.theme.ThemeOverlay;

public final class PatchSettings {
    private static final String FILE = "spicetify_patch_settings";
    private static final String CLEAN_SHARING = "clean_sharing";
    private static final String HIDE_PREMIUM_TAB = "hide_premium_tab";
    private static final String HIDE_BRAND_ADS = "hide_brand_ads";
    private static final String HIDE_PLAYER_AD_CARDS = "hide_player_ad_cards";
    private static final String THEME_BACKGROUND = "theme_background";
    private static final String THEME_ACCENT = "theme_accent";
    private static final String THEME_SURFACE = "theme_surface";
    private static final String THEME_PRESET = "theme_preset";
    private static volatile SharedPreferences preferences;
    private static volatile String startupState;
    private static volatile boolean restartMarked;

    private PatchSettings() {}

    public static void initialize(Context context) {
        preferences = context.getApplicationContext().getSharedPreferences(FILE, Context.MODE_PRIVATE);
        startupState = restartState();
        restartMarked = false;
        if (InstalledPatches.homePins()) HomePins.initialize(context);
        if (InstalledPatches.serverFiles()) ServerConfig.initialize(context);
        if (InstalledPatches.themeColors() && context instanceof Application) ThemeOverlay.install((Application) context);
    }

    /** True when a setting that Spotify reads at startup differs from the value this process started with. */
    public static boolean restartRequired() {
        return restartMarked || (startupState != null && !startupState.equals(restartState()));
    }

    /** Records a change kept outside these preferences, such as Home pins, that applies after a restart. */
    public static void markRestartRequired() {
        restartMarked = true;
    }

    private static String restartState() {
        return hidePremiumTabEnabled() + "|" + hideBrandAdsEnabled() + "|" + hidePlayerAdCardsEnabled() + "|"
                + themeBackground() + "|" + themeSurface() + "|" + themeAccent();
    }

    /** False until Spotify's Application has loaded the Spicetify settings. */
    public static boolean initialized() {
        return preferences != null;
    }

    public static boolean cleanSharingEnabled() {
        SharedPreferences current = preferences;
        return current == null || current.getBoolean(CLEAN_SHARING, true);
    }

    public static void setCleanSharingEnabled(boolean enabled) {
        SharedPreferences current = preferences;
        if (current == null) throw new IllegalStateException("Spicetify settings are not initialized.");
        current.edit().putBoolean(CLEAN_SHARING, enabled).apply();
    }

    public static boolean hidePremiumTabEnabled() {
        SharedPreferences current = preferences;
        return current != null && current.getBoolean(HIDE_PREMIUM_TAB, true);
    }

    public static boolean showPremiumTab(boolean spotifyEnabled) {
        return spotifyEnabled && !hidePremiumTabEnabled();
    }

    public static void setHidePremiumTabEnabled(boolean enabled) {
        SharedPreferences current = preferences;
        if (current == null) throw new IllegalStateException("Spicetify settings are not initialized.");
        current.edit().putBoolean(HIDE_PREMIUM_TAB, enabled).apply();
    }

    public static boolean hideBrandAdsEnabled() {
        SharedPreferences current = preferences;
        return current != null && current.getBoolean(HIDE_BRAND_ADS, true);
    }

    public static void setHideBrandAdsEnabled(boolean enabled) {
        SharedPreferences current = preferences;
        if (current == null) throw new IllegalStateException("Spicetify settings are not initialized.");
        current.edit().putBoolean(HIDE_BRAND_ADS, enabled).apply();
    }

    public static boolean hidePlayerAdCardsEnabled() {
        SharedPreferences current = preferences;
        return current != null && current.getBoolean(HIDE_PLAYER_AD_CARDS, true);
    }

    public static void setHidePlayerAdCardsEnabled(boolean enabled) {
        SharedPreferences current = preferences;
        if (current == null) throw new IllegalStateException("Spicetify settings are not initialized.");
        current.edit().putBoolean(HIDE_PLAYER_AD_CARDS, enabled).apply();
    }

    /** Returns the in-app background color, or null to keep Spotify's own. */
    public static Integer themeBackground() {
        return color(THEME_BACKGROUND);
    }

    /** Returns the in-app accent color, or null to keep Spotify's own. */
    public static Integer themeAccent() {
        return color(THEME_ACCENT);
    }

    /** Returns the in-app surface color for headers and cards, or null to derive it from the background. */
    public static Integer themeSurface() {
        return color(THEME_SURFACE);
    }

    /** Returns the chosen theme's key, "custom" for individually picked colors, or null for Spotify's own. */
    public static String themePreset() {
        SharedPreferences current = preferences;
        if (current == null) return null;
        String preset = current.getString(THEME_PRESET, null);
        if (preset != null) return preset;
        boolean colors = current.contains(THEME_BACKGROUND) || current.contains(THEME_SURFACE) || current.contains(THEME_ACCENT);
        return colors ? "custom" : null;
    }

    /** Saves a theme; a null color keeps Spotify's own for that part, and a null preset restores Spotify's theme. */
    public static void setTheme(String preset, Integer background, Integer surface, Integer accent) {
        SharedPreferences current = preferences;
        if (current == null) throw new IllegalStateException("Spicetify settings are not initialized.");
        SharedPreferences.Editor editor = current.edit();
        put(editor, THEME_BACKGROUND, background);
        put(editor, THEME_SURFACE, surface);
        put(editor, THEME_ACCENT, accent);
        if (preset == null) editor.remove(THEME_PRESET); else editor.putString(THEME_PRESET, preset);
        editor.apply();
    }

    private static Integer color(String key) {
        SharedPreferences current = preferences;
        return current != null && current.contains(key) ? current.getInt(key, 0) : null;
    }

    private static void put(SharedPreferences.Editor editor, String key, Integer color) {
        if (color == null) editor.remove(key); else editor.putInt(key, color);
    }
}
