package app.linenotifications.extension;

import android.content.Context;
import java.util.Locale;

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

    static String format(Context context, String name, String fallback, Object... args) {
        String pattern = get(context, name, fallback);
        try {
            return String.format(Locale.getDefault(), pattern, args);
        } catch (RuntimeException ignored) {
            return String.format(Locale.US, fallback, args);
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
