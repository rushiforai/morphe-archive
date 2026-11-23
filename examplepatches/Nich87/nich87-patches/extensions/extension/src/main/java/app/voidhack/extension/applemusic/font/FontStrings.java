package app.voidhack.extension.applemusic.font;

import android.content.Context;

final class FontStrings {
    private FontStrings() {}

    static int id(Context context, String type, String name) {
        return context.getResources().getIdentifier(name, type, context.getPackageName());
    }

    static String text(Context context, String key, Object... args) {
        if (context == null) return key;
        int resId = id(context, "string", "voidhack_font_" + key);
        if (resId == 0) return fallback(key);
        try {
            return args.length == 0 ? context.getString(resId) : context.getString(resId, args);
        } catch (RuntimeException ignored) {
            return fallback(key);
        }
    }

    private static String fallback(String key) {
        switch (key) {
            case "settings_category": return "Custom font";
            case "settings_entry": return "Custom font settings";
            case "settings_title": return "Custom font";
            case "back": return "Back";
            default: return key;
        }
    }
}
