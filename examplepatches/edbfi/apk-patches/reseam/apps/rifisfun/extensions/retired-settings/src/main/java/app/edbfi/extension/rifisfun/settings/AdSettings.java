// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.extension.rifisfun.settings;

import android.content.Context;
import android.content.SharedPreferences;
import app.reseam.runtime.Export;
import java.util.LinkedHashSet;
import java.util.Set;

public final class AdSettings {
    private static final String SHOW_ADS = "edbfi_show_ads";
    private static final String MIGRATED = "edbfi_ads_choice_migrated";

    private AdSettings() {}

    @Export
    public static synchronized void migrate(SharedPreferences prefs) {
        if (prefs.getBoolean(MIGRATED, false)) return;
        boolean show = prefs.getBoolean("ADS_ENABLED", true) && prefs.getBoolean(SHOW_ADS, true);
        prefs.edit().putBoolean(SHOW_ADS, show).putBoolean(MIGRATED, true).apply();
    }

    @Export
    public static boolean showAds(Context context) {
        return context.getSharedPreferences("settings", Context.MODE_PRIVATE).getBoolean(SHOW_ADS, true);
    }

    @Export
    public static Set<String> settingsRequiringAds(Set<String> stock) {
        Set<String> result = new LinkedHashSet<>(stock);
        result.remove("DUALPANE_2");
        result.remove("MODERATOR_ENABLED");
        result.remove("THREADS_CARDS");
        result.remove("AUTO_THREADS_CARDS_FOR_IMAGES_ENUM");
        result.remove("NATIVE_IMAGE_ALBUMS");
        result.remove("REDDIT_VISITED_ENABLED");
        return result;
    }
}
