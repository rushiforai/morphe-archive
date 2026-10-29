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
    private static final String KEY_SUBTITLE_TRANSLATION = "subtitle_translation";
    private static final String KEY_SUBTITLE_TARGET = "subtitle_target_language";

    public static final Locale VIETNAMESE = Locale.forLanguageTag("vi");
    public static final String DEFAULT_SUBTITLE_TARGET = "vi";

    private MorphePrefs() {}

    /**
     * Whether the interface is forced to Vietnamese. On by default, so a freshly patched app
     * opens in Vietnamese and the user can turn it off in the Morphe settings.
     */
    public static boolean isVietnameseEnabled(Context context) {
        return preferences(context).getBoolean(KEY_VIETNAMESE_UI, true);
    }

    /**
     * Stored synchronously: the settings panel reads it again immediately after the toggle
     * changes, so it must be on disk before this call returns.
     */
    public static void setVietnameseEnabled(Context context, boolean enabled) {
        preferences(context).edit().putBoolean(KEY_VIETNAMESE_UI, enabled).commit();
    }

    /**
     * Whether subtitle files are translated automatically. Off by default: translating sends the
     * subtitle text to an online service, so the user opts in from the patch settings.
     */
    public static boolean isSubtitleTranslationEnabled(Context context) {
        return preferences(context).getBoolean(KEY_SUBTITLE_TRANSLATION, false);
    }

    /**
     * Stored synchronously: the value is read again while the player loads a file, possibly on
     * another thread, so it must be on disk before this call returns.
     */
    public static void setSubtitleTranslationEnabled(Context context, boolean enabled) {
        preferences(context).edit().putBoolean(KEY_SUBTITLE_TRANSLATION, enabled).commit();
    }

    /** BCP-47 language tag the subtitles are translated into. */
    public static String subtitleTargetLanguage(Context context) {
        return preferences(context).getString(
            KEY_SUBTITLE_TARGET,
            DEFAULT_SUBTITLE_TARGET
        );
    }

    public static void setSubtitleTargetLanguage(Context context, String language) {
        preferences(context).edit().putString(KEY_SUBTITLE_TARGET, language).apply();
    }

    private static SharedPreferences preferences(Context context) {
        return context.getApplicationContext()
            .getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
    }
}
