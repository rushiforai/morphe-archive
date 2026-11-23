package app.linenotifications.extension;

import android.content.Context;

/** Resolves localized strings bundled into the host app's resources, with safe fallback. */
final class Strings {
    private Strings() {}

    static String get(Context context, String name, String fallback) {
        if (context == null) return fallback;
        try {
            int id = context.getResources().getIdentifier(name, "string", context.getPackageName());
            return id != 0 ? context.getString(id) : fallback;
        } catch (RuntimeException ignored) {
            return fallback;
        }
    }

    static String get(String name, String fallback) {
        try {
            return get(Settings.context(), name, fallback);
        } catch (RuntimeException ignored) {
            return fallback;
        }
    }
}
