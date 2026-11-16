package app.onlynazril.extension.tiktok;

import android.app.Activity;
import android.content.Intent;

import app.onlynazril.extension.tiktok.settings.SettingsBackup;

/** One activity-result entry for the Tweaks screen: settings backup and the font picker. */
public final class ActivityResults {
    private ActivityResults() {}

    public static void onActivityResult(
            Activity activity, int requestCode, int resultCode, Intent data) {
        if (SettingsBackup.onActivityResult(activity, requestCode, resultCode, data)) return;
        CustomFontBridge.onActivityResult(activity, requestCode, resultCode, data);
    }
}
