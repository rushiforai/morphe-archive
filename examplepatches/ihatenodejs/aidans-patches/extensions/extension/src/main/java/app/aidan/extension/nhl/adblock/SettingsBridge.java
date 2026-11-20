package app.aidan.extension.nhl.adblock;

import android.content.Context;
import android.content.Intent;
import android.util.Log;

/**
 * Settings integration bridge for NHL Preferences screen.
 */
public final class SettingsBridge {
    private static final String TAG = "AidanAdBlockSettings";

    private SettingsBridge() {}

    /**
     * Renders the Aidan's Patches section immediately before Preferences in Ldq8.k.
     */
    public static void renderSection(Context context, Object composer, int changed) {
        AdBlockSettingsSection.render(context, composer, changed);
    }

    /**
     * Launches the native AdBlockSettingsActivity.
     */
    public static void launchSettings(Context context) {
        Log.i(TAG, "launchSettings called with context: " + context);
        if (context == null) return;
        try {
            Intent intent = new Intent(context, AdBlockSettingsActivity.class);
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            context.startActivity(intent);
            Log.i(TAG, "startActivity(AdBlockSettingsActivity) completed");
        } catch (Exception e) {
            Log.e(TAG, "Failed to launch AdBlockSettingsActivity", e);
        }
    }
}
