package app.voidhack.extension.applemusic.lyrics;

import android.content.Context;

final class LrclibStrings {
    private LrclibStrings() {}

    static int id(Context context, String type, String name) {
        return context.getResources().getIdentifier(name, type, context.getPackageName());
    }

    static String text(Context context, String key, Object... args) {
        if (context == null) return key;
        int resId = id(context, "string", "voidhack_lrclib_" + key);
        if (resId == 0) {
            return fallback(key, args);
        }
        try {
            return args.length == 0 ? context.getString(resId) : context.getString(resId, args);
        } catch (RuntimeException ignored) {
            return fallback(key, args);
        }
    }

    private static String fallback(String key, Object... args) {
        switch (key) {
            case "settings_category": return "LRCLIB lyrics";
            case "settings_entry": return "LRCLIB lyrics settings";
            case "settings_title": return "LRCLIB lyrics";
            case "badge_short": return "LRC";
            case "pill_official": return "Official";
            case "pill_lrclib": return "LRCLIB";
            case "pill_loading": return "LRCLIB…";
            case "pill_search": return "Search LRCLIB";
            case "instrumental_message": return "Instrumental track (LRCLIB)";
            case "not_found_message": return "No lyrics found on LRCLIB\nTap to search manually";
            case "sheet_title": return "Lyrics source";
            case "back": return "Back";
            case "close": return "Close";
            default: return key;
        }
    }
}
