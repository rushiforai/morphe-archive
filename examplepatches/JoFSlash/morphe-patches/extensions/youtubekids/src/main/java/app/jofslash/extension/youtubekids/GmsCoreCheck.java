package app.jofslash.extension.youtubekids;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.os.Handler;
import android.os.Looper;
import android.widget.Toast;

/**
 * Used by the GmsCore support patch. YouTube Kids plays videos and signs in through MicroG-RE,
 * so tell the user when it is missing.
 */
@SuppressWarnings("unused")
public final class GmsCoreCheck {
    private static final String GMS_CORE_PACKAGE = "app.revanced.android.gms";
    private static final String PREFERENCES = "jofslash_gmscore";
    private static final String TOLD = "told_missing";

    private GmsCoreCheck() {
    }

    public static void check(Context context) {
        try {
            final Context app = context.getApplicationContext() != null
                    ? context.getApplicationContext() : context;
            SharedPreferences preferences = app.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE);
            try {
                app.getPackageManager().getPackageInfo(GMS_CORE_PACKAGE, 0);
                // Installed: say it again if it goes missing later.
                if (preferences.getBoolean(TOLD, false)) preferences.edit().remove(TOLD).apply();
                return;
            } catch (PackageManager.NameNotFoundException missing) {
                // Say it once, not at every start (the app also starts in the background).
                if (preferences.getBoolean(TOLD, false)) return;
                preferences.edit().putBoolean(TOLD, true).apply();
            }
            new Handler(Looper.getMainLooper()).postDelayed(() -> Toast.makeText(app,
                    "Install MicroG-RE (app.revanced.android.gms): YouTube Kids needs it to play videos.",
                    Toast.LENGTH_LONG).show(), 3000);
        } catch (Throwable ignored) {
            // Never break the app start.
        }
    }
}
