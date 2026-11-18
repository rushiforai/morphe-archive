package app.afterglow.extension.ui;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.net.Uri;
import android.widget.Toast;

import app.afterglow.extension.Afterglow;

/** Opens the original feature settings only when their complete patch graph is installed. */
public final class MorpheSettingsBridge {
    private MorpheSettingsBridge() {}

    /** Replaced by the settings bridge patch; absent imported features leave this false. */
    public static boolean isInstalled() {
        return false;
    }

    public static void open(Activity activity) {
        if (!isInstalled()) return;
        try {
            // Match upstream newIntent(), using the actual renamed package of this installation.
            Intent intent = new Intent()
                    .setClassName(activity.getPackageName(), "com.google.android.gms.common.api.GoogleApiActivity")
                    .setData(Uri.parse("morphe_settings_intent"));
            activity.startActivity(intent);
        } catch (ActivityNotFoundException | SecurityException error) {
            Afterglow.error("MorpheSettingsBridge.open", error);
            Toast.makeText(activity, "Additional features could not be opened.", Toast.LENGTH_LONG).show();
        }
    }
}
