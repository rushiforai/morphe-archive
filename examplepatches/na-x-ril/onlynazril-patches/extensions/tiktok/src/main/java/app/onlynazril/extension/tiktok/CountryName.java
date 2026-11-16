package app.onlynazril.extension.tiktok;

import android.content.Context;

import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/** Turns a country code into its name in the app's language, with the code as fallback. */
public final class CountryName {
    private static final Map<String, String> CACHE = new ConcurrentHashMap<>();

    private CountryName() {}

    public static String of(Context context, String code) {
        if (code == null || code.isEmpty()) return code;
        String region = code.trim().toUpperCase(Locale.ROOT);
        Locale locale = AppLocale.of(context);
        String key = locale.toLanguageTag() + "|" + region;
        String cached = CACHE.get(key);
        if (cached != null) return cached;

        String name;
        try {
            name = new Locale.Builder().setRegion(region).build().getDisplayCountry(locale);
        } catch (RuntimeException ignored) {
            name = region;
        }
        if (name == null || name.isEmpty()) name = region;
        CACHE.put(key, name);
        return name;
    }
}
