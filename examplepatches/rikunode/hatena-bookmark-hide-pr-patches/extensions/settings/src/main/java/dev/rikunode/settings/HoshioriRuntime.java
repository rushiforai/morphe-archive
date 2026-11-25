package dev.rikunode.settings;

import android.content.Context;
import android.content.SharedPreferences;

/** Unified, process-local accessor for Hoshiori's run-time controls. */
public final class HoshioriRuntime {
    private static volatile Context app;
    private HoshioriRuntime() {}

    public static void init(Context context) {
        if (context != null) app = context.getApplicationContext();
    }

    public static boolean enabled(String key) {
        Context context = app;
        return context == null || enabled(context, key);
    }

    public static boolean preserveWebStorage(Context context) {
        return enabled(context, "preserveArticleWebStorage");
    }

    public static boolean enabled(Context context, String key) {
        if (context == null) return true;
        try {
            return context.getSharedPreferences("hoshiori_settings", Context.MODE_PRIVATE)
                    .getBoolean(key, true);
        } catch (RuntimeException ignored) {
            return true;
        }
    }
}
