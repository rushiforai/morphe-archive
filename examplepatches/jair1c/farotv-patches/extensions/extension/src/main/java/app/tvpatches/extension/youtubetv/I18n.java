package app.tvpatches.extension.youtubetv;

import android.app.Application;
import java.util.Locale;
import org.json.JSONObject;

/** Offline native dialogs use the same generated catalogs as the web settings. */
final class I18n {
    private static final String PREFS = "farotv-language";
    private static JSONObject catalogs;

    private I18n() {}

    private static Application application() {
        try {
            return (Application) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication").invoke(null);
        } catch (Exception ignored) { return null; }
    }

    static void setLanguage(String language) {
        if (language == null || !language.matches("[a-z]{2,3}(-[a-z0-9]{2,8})*")) return;
        Application app = application();
        if (app != null) app.getSharedPreferences(PREFS, 0).edit().putString("language", language).apply();
    }

    private static String language() {
        Application app = application();
        String language = null;
        if (app != null) {
            language = app.getSharedPreferences(PREFS, 0).getString("language", null);
            if (language == null) language = app.getResources().getConfiguration().getLocales().get(0).toLanguageTag();
        }
        return language == null ? Locale.getDefault().toLanguageTag() : language;
    }

    static boolean isRtl() {
        String tag = language().toLowerCase(Locale.ROOT).replace('_', '-');
        return tag.equals("ar") || tag.startsWith("ar-");
    }

    static String text(String key, String... values) {
        try {
            if (catalogs == null) catalogs = new JSONObject(TvTranslationsPayload.JSON);
            String requested = language().toLowerCase(Locale.ROOT).replace('_', '-');
            JSONObject selected = catalogs.optJSONObject(requested);
            if (selected == null) selected = catalogs.optJSONObject(requested.split("-")[0]);
            JSONObject fallback = catalogs.getJSONObject("en");
            String text = selected != null && selected.has(key) ? selected.getString(key) : fallback.optString(key, key);
            for (int i = 0; i + 1 < values.length; i += 2) text = text.replace("{" + values[i] + "}", values[i + 1]);
            return text;
        } catch (Exception ignored) { return key; }
    }
}
