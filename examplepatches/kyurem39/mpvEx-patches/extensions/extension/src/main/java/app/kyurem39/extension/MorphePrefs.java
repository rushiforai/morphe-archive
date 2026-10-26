package app.kyurem39.extension;

import android.content.Context;
import android.content.SharedPreferences;

import java.util.Locale;

/**
 * Persisted state of the features this patch bundle adds to mpvEx.
 *
 * <p>The values live in a preference file of their own so that nothing the app does to its own
 * preferences can reset them.
 *
 * <p>This class is written in Java on purpose: the classes of this extension are merged into an
 * app whose Kotlin runtime has been shrunk by R8, so they must not call Kotlin intrinsics.
 */
public final class MorphePrefs {
    private static final String PREFS_NAME = "morphe_mpvex_settings";
    private static final String KEY_VIETNAMESE_UI = "vietnamese_ui";

    public static final Locale VIETNAMESE = Locale.forLanguageTag("vi");

    private MorphePrefs() {}

    /**
     * Whether the interface is forced to Vietnamese. On by default, so a freshly patched app
     * opens in Vietnamese and the user can turn it off in the Morphe settings.
     */
    public static boolean isVietnameseEnabled(Context context) {
        return preferences(context).getBoolean(KEY_VIETNAMESE_UI, true);
    }

    public static void setVietnameseEnabled(Context context, boolean enabled) {
        preferences(context).edit().putBoolean(KEY_VIETNAMESE_UI, enabled).apply();
    }

    private static SharedPreferences preferences(Context context) {
        return context.getApplicationContext()
            .getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
    }
}
