package app.noam.extension.chesscom.settings;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;

import app.noam.extension.chesscom.Features;

/** The welcome screens open once, the first time chess.com's Home shows after patching. */
public final class Welcome {
    private static final String HOME_SCREEN = "com.chess.home.HomeActivity";
    private static final String SHOWN = "welcome_shown";

    private Welcome() {}

    public static void onScreenShown(Activity activity) {
        if (activity == null || !activity.getClass().getName().equals(HOME_SCREEN)) return;
        SharedPreferences preferences = Features.preferences();
        if (preferences == null || preferences.getBoolean(SHOWN, false)) return;
        preferences.edit().putBoolean(SHOWN, true).apply();
        activity.startActivity(new Intent(activity, MorpheSettingsActivity.class)
            .putExtra(MorpheSettingsActivity.EXTRA_PAGE, Features.PAGE_WELCOME));
    }
}
