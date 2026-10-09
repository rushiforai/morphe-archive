package app.spicetify.extension.spotify.settings;

import android.content.Context;
import android.content.SharedPreferences;
import app.spicetify.extension.spotify.extensions.ActivityTracker;
import app.spicetify.extension.spotify.home.HomePins;
import app.spicetify.extension.spotify.localserver.ServerConfig;
import app.spicetify.extension.spotify.localserver.ServerProcess;
import app.spicetify.extension.spotify.localserver.ServerIndex;
import app.spicetify.extension.spotify.theme.ThemeRuntime;

public final class PatchSettings {
    private static final String FILE = "spicetify_patch_settings";
    private static final String CLEAN_SHARING = "clean_sharing";
    private static final String HIDE_PREMIUM_TAB = "hide_premium_tab";
    private static final String HIDE_BRAND_ADS = "hide_brand_ads";
    private static final String HIDE_PLAYER_AD_CARDS = "hide_player_ad_cards";
    private static volatile SharedPreferences preferences;
    private static volatile Context applicationContext;
    private static volatile String startupState;
    private static volatile boolean restartMarked;

    private PatchSettings() {}

    public static void initialize(Context context) {
        if (InstalledPatches.serverFiles() && ServerProcess.skipApplication(context)) return;
        applicationContext = context.getApplicationContext();
        preferences = applicationContext.getSharedPreferences(FILE, Context.MODE_PRIVATE);
        if (InstalledPatches.homePins()) HomePins.initialize(context);
        startupState = restartState();
        restartMarked = false;
        if (InstalledPatches.serverFiles()) {
            ServerConfig.initialize(context);
            ServerIndex.scanAsync();
        }
        if (InstalledPatches.themeColors()) ThemeRuntime.install(context);
        if (InstalledPatches.extensions()) ActivityTracker.install(context);
    }

    /** The application context Spotify's onCreate passed to {@link #initialize}, or null before then. */
    public static Context applicationContext() {
        return applicationContext;
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
        return hidePremiumTabEnabled() + "|" + hideBrandAdsEnabled() + "|" + hidePlayerAdCardsEnabled()
                + "|" + HomePins.onlyPins();
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
}
