package app.afterglow.extension.i18n;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

/**
 * Localized strings copied from the iOS tweak's Localizable.strings files.
 * Lookup order matches iOS: the device language's table, then English, then
 * the caller's fallback text.
 */
public final class L10n {
    private static volatile Map<String, String> current;
    private static volatile Map<String, String> english;
    private static volatile String currentLproj;

    private L10n() {}

    public static String get(String key, String fallback) {
        if ("LiteModeDesc".equals(key)) return "Uses Home, Subscriptions, You and Afterglow with fewer distractions. Your saved preferences return when Lite Mode is off.";
        if ("OldYTUI".equals(key)) return "Older Android interface";
        if ("OldYTUIDesc".equals(key)) return "Uses Morphe's supported older Android interface version.";
        if (key == null || key.isEmpty()) return displayText(fallback == null ? "" : fallback);
        ensureLoaded();
        String value = current.get(key);
        if (value == null || value.isEmpty()) value = english.get(key);
        if (value == null || value.isEmpty()) value = fallback == null ? key : fallback;
        return displayText(value);
    }

    /** Keep the imported iOS tables intact while using the Android display name. */
    private static String displayText(String value) {
        return value.replace("YTAfterglow", "Afterglow").replace("YT Afterglow", "Afterglow")
                .replace("YouTube Afterglow", "Afterglow");
    }

    /** Like {@link #get} but converts iOS format specifiers (%@, %ld, %lu, %1$@) for String.format. */
    public static String format(String key, String fallback, Object... args) {
        String pattern = get(key, fallback)
                .replace("%@", "%s")
                .replaceAll("%(\\d+\\$)@", "%$1s")
                .replaceAll("%(\\d+\\$)?l[dui]", "%$1d")
                .replaceAll("%(\\d+\\$)?l?lu", "%$1d");
        try {
            return String.format(Locale.getDefault(), pattern, args);
        } catch (RuntimeException ignored) {
            return pattern;
        }
    }

    /** The iOS lproj in use, e.g. "en" or "zh-Hant". */
    public static String language() {
        ensureLoaded();
        return currentLproj;
    }

    private static void ensureLoaded() {
        if (current != null) return;
        synchronized (L10n.class) {
            if (current != null) return;
            Map<String, String> en = new HashMap<>(1024);
            StringTables.fill("en", en);
            String lproj = lprojFor(Locale.getDefault());
            Map<String, String> table = en;
            if (!"en".equals(lproj)) {
                table = new HashMap<>(1024);
                if (!StringTables.fill(lproj, table)) {
                    table = en;
                    lproj = "en";
                }
            }
            english = en;
            currentLproj = lproj;
            current = table;
        }
    }

    static String lprojFor(Locale locale) {
        String tag = locale.toLanguageTag();
        String language = locale.getLanguage();
        String script = locale.getScript();
        String country = locale.getCountry();
        if ("zh".equals(language)) {
            if ("Hant".equals(script) || "TW".equals(country) || "HK".equals(country) || "MO".equals(country)) {
                return "zh-Hant";
            }
            return "zh-Hans";
        }
        for (String[] row : StringTables.TAGS) {
            for (int i = 1; i < row.length; i++) {
                if (row[i].equalsIgnoreCase(tag) || row[i].equalsIgnoreCase(language)) return row[0];
            }
        }
        return "en";
    }
}
