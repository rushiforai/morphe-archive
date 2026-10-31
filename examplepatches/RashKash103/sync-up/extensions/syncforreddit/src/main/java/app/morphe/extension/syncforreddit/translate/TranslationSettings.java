package app.morphe.extension.syncforreddit.translate;

import android.content.Context;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;

import app.morphe.extension.shared.Logger;

/**
 * What the translation settings are set to, read from where Sync keeps its own.
 *
 * <p>Read as they are needed rather than held, so that changing one takes effect at once.
 *
 * @noinspection unused
 */
public final class TranslationSettings {
    public static final String ENABLED = "sync_up_translate";
    public static final String SERVICE = "sync_up_translate_service";
    public static final String LANGUAGE = "sync_up_translate_language";
    public static final String DEEPL_KEY = "sync_up_translate_deepl_key";
    public static final String DEEPL_USAGE = "sync_up_translate_deepl_usage";
    public static final String DEEPL_CONTEXT = "sync_up_translate_deepl_context";
    public static final String DEEPL_INSTRUCTIONS_ON = "sync_up_translate_deepl_instructions_on";
    public static final String DEEPL_INSTRUCTIONS = "sync_up_translate_deepl_instructions";
    public static final String GOOGLE_KEY = "sync_up_translate_google_key";
    public static final String KEEP = "sync_up_translate_keep";
    public static final String CACHE_CLEAR = "sync_up_translate_cache_clear";

    /** Translating on this device, which needs nothing set up, and is what it starts as. */
    public static final String ON_DEVICE = "device";
    public static final String DEEPL = "deepl";
    public static final String GOOGLE = "google";

    private TranslationSettings() {}

    public static boolean enabled(Context context) {
        return bool(context, ENABLED, true);
    }

    /**
     * Whether to offer translation at all, asked where the app asks whether the feature is to be
     * had. It answers for the two questions the app asks: whether this is a paid copy, and
     * whether the feature has been turned on from afar. Neither has anything to say about a
     * translation done on the device or paid for with one's own key, so the setting answers
     * instead.
     */
    public static boolean offered() {
        try {
            return enabled(app.morphe.extension.shared.Utils.getContext());
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not tell whether to offer translation: " + ex);
            return true;
        }
    }

    /** Which service does the translating. */
    public static String service(Context context) {
        return text(context, SERVICE, ON_DEVICE);
    }

    public static String language(Context context) {
        return text(context, LANGUAGE, "en-US");
    }

    public static boolean bool(Context context, String key, boolean fallback) {
        SharedPreferences settings = store(context);
        try {
            return settings == null ? fallback : settings.getBoolean(key, fallback);
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not read " + key + ": " + ex);
            return fallback;
        }
    }

    public static String text(Context context, String key, String fallback) {
        SharedPreferences settings = store(context);
        try {
            String held = settings == null ? null : settings.getString(key, null);
            return held == null || held.isEmpty() ? fallback : held;
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not read " + key + ": " + ex);
            return fallback;
        }
    }

    /**
     * Sync keeps a set of settings for each account signed in, in a file named after that
     * account, and points its settings screens at it.
     */
    public static SharedPreferences store(Context context) {
        try {
            String named = null;
            try {
                if (t7.z.i()) {
                    named = t7.z.a();
                }
            } catch (Throwable ignored) {
                // An app keeping one set of settings for everyone.
            }
            return named == null || named.isEmpty()
                    ? PreferenceManager.getDefaultSharedPreferences(context)
                    : context.getSharedPreferences(named, Context.MODE_PRIVATE);
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not reach the settings: " + ex);
            return null;
        }
    }
}
