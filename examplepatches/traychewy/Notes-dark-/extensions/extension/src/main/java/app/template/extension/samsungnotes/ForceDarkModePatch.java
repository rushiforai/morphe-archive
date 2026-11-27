package app.template.extension.samsungnotes;

import android.app.UiModeManager;
import android.content.Context;
import android.os.Build;
import android.util.Log;

import java.lang.reflect.Method;

/**
 * Called from the start of Samsung Notes' Application.onCreate().
 *
 * Uses the per-app night mode API (Android 12+), which changes only this app's
 * configuration. The system theme is left alone.
 */
@SuppressWarnings("unused")
public final class ForceDarkModePatch {

    private static final String TAG = "ForceDarkMode";

    private ForceDarkModePatch() {
    }

    public static void apply(Context context) {
        // Primary: per-app night mode. Persisted by the system and applied to every
        // activity of this package. Calling it again with the same value is a no-op.
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            try {
                UiModeManager uiModeManager = context.getSystemService(UiModeManager.class);
                if (uiModeManager != null) {
                    uiModeManager.setApplicationNightMode(UiModeManager.MODE_NIGHT_YES);
                }
            } catch (Throwable t) {
                Log.e(TAG, "setApplicationNightMode failed", t);
            }
        }

        // Fallback: AppCompat/SESL default night mode, in case the app builds its own
        // configuration. Looked up by name because the class may be renamed by R8,
        // in which case this silently does nothing.
        try {
            Class<?> delegate = Class.forName("androidx.appcompat.app.AppCompatDelegate");
            Method setDefaultNightMode = delegate.getMethod("setDefaultNightMode", int.class);
            setDefaultNightMode.invoke(null, 2 /* MODE_NIGHT_YES */);
        } catch (Throwable ignored) {
            // Not present or obfuscated.
        }
    }
}
