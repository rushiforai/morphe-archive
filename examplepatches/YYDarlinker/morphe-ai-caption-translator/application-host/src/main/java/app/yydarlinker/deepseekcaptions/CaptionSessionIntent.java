package app.yydarlinker.deepseekcaptions;

import android.content.Context;
import android.content.SharedPreferences;

/** Persistent AI rendering choice. Caption languages belong only to the current native player. */
final class CaptionSessionIntent {
    static final String PROVENANCE_NONE = "NONE";
    static final String PROVENANCE_USER = "USER";
    private static final String STORE = "deepseek_caption_session";

    final boolean aiEnabled;
    final long revision;
    final String provenance;

    private CaptionSessionIntent(boolean enabled, long revision, String provenance) {
        this.aiEnabled = enabled;
        this.revision = revision;
        this.provenance = provenance;
    }

    static CaptionSessionIntent load(Context context) {
        SharedPreferences store = store(context);
        if (store == null) return none();
        try {
            // Legacy target_language/translate_target values are deliberately never read.
            return new CaptionSessionIntent(
                    store.getBoolean("ai_enabled", false),
                    Math.max(0L, store.getLong("revision", 0L)),
                    store.getString("provenance", PROVENANCE_NONE));
        } catch (RuntimeException unavailable) {
            return none();
        }
    }

    static CaptionSessionIntent none() {
        return new CaptionSessionIntent(false, 0L, PROVENANCE_NONE);
    }

    static CaptionSessionIntent userToggled(Context context, boolean enabled) {
        CaptionSessionIntent next =
                new CaptionSessionIntent(enabled, load(context).revision + 1, PROVENANCE_USER);
        SharedPreferences store = store(context);
        if (store != null) {
            try {
                store.edit()
                        .putBoolean("ai_enabled", enabled)
                        .putLong("revision", next.revision)
                        .putString("provenance", next.provenance)
                        .remove("target_language")
                        .remove("translate_target")
                        .apply();
            } catch (RuntimeException unavailable) {
                // A later switch action can retry; native observations never write this store.
            }
        }
        return next;
    }

    String summary() {
        return "enabled=" + aiEnabled + ";revision=" + revision + ";provenance=" + provenance;
    }

    static void resetForTests(Context context) {
        SharedPreferences store = store(context);
        if (store != null) store.edit().clear().apply();
    }

    private static SharedPreferences store(Context context) {
        if (context == null) return null;
        try {
            return context.getApplicationContext().getSharedPreferences(STORE, Context.MODE_PRIVATE);
        } catch (RuntimeException unavailable) {
            return null;
        }
    }
}
