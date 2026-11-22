package app.morphe.extension.chmate;

import android.content.Context;

/** Hissi and Kyodemo share the action viewport; result tabs keep an independent height. */
public final class CheckerBarOptions {
    public static final String ACTIONS = "hissiViewerToolbarHeightDp";
    public static final String TABS = "hissiViewerResultTabsHeightDp";
    public static final String PROVIDERS = "hissiViewerProvidersHeightDp";
    public static final int PROVIDERS_TAG = 0x48690b0a;
    public static final String HANDLES = "hissiViewerResizeHandles";
    public static int height(Context context, String key, int fallback) {
        return Math.max(20, Math.min(80, SettingsProfiles.prefs(context).getInt(key, fallback)));
    }
    public static void save(Context context, String key, int value) {
        SettingsProfiles.prefs(context).edit().putInt(key, Math.max(20, Math.min(80, value))).apply();
    }
    public static final String PALETTE = "kyodemoToolbarPalette";
    public static final int PALETTE_TAG = 0x48690b0b;
    static final String[] PALETTE_NAMES = {"本文の配色に合わせる", "ダーク", "AMOLEDブラック", "ライト"};

    static int palette(Context context) {
        int value = SettingsProfiles.prefs(context).getInt(PALETTE, 0);
        return value >= 0 && value < PALETTE_NAMES.length ? value : 0;
    }

    static void savePalette(Context context, int choice) {
        SettingsProfiles.prefs(context).edit().putInt(PALETTE, choice).apply();
    }
    private CheckerBarOptions() { }
}
