package app.bitchord.telegram;

import java.util.*;

/**
 * The patch's own pages in the phone's language. Each phrase is looked up by its English text, so a
 * phrase that hasn't been translated yet shows in English. Phrases with numbers or names in them
 * have {0}, {1} and so on where those go.
 */
final class Strings {
    private Strings() {}

    private static volatile String language = "";
    private static volatile Map<String, String> table = Collections.emptyMap();

    static String t(String english) {
        if (english == null || english.isEmpty()) return english;
        String found = table().get(english);
        return found != null ? found : english;
    }

    static String f(String english, Object... values) {
        String text = t(english);
        for (int i = 0; i < values.length; i++)
            text = text.replace("{" + i + "}", String.valueOf(values[i]));
        return text;
    }

    /** 1,234 written the phone's way. */
    static String number(long n) {
        return java.text.NumberFormat.getIntegerInstance(Locale.getDefault()).format(n);
    }

    /** True for languages written right to left. */
    static boolean rightToLeft() {
        String lang = language(Locale.getDefault());
        return lang.equals("ar") || lang.equals("ur") || lang.equals("fa") || lang.equals("he");
    }

    static String language(Locale locale) {
        String lang = locale.getLanguage();
        // Older Android names Indonesian "in".
        return lang.equals("in") ? "id" : lang;
    }

    private static Map<String, String> table() {
        String lang = language(Locale.getDefault());
        if (!lang.equals(language)) {
            String[] pairs = Translations.table(lang);
            Map<String, String> loaded = new HashMap<>();
            for (int i = 0; i + 1 < pairs.length; i += 2) loaded.put(pairs[i], pairs[i + 1]);
            table = loaded;
            language = lang;
        }
        return table;
    }
}
