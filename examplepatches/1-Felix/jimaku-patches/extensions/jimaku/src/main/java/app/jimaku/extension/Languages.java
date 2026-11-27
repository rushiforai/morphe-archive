package app.jimaku.extension;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

/**
 * The languages subtitles can be in, and the subtitle language for the app's language. A port of
 * the extension's {@code lib/languages.ts}: the list must match its {@code languages.json} export,
 * and {@link #languageFor(String)} runs the shared cases in {@code language-for.json}.
 */
public final class Languages {
    /** Codes are BCP 47 base languages, except zh-Hans and zh-Hant; each named in its own language. */
    private static final String[][] LANGUAGES = {
            {"af", "Afrikaans"},
            {"ar", "العربية"},
            {"as", "অসমীয়া"},
            {"az", "Azərbaycan"},
            {"bg", "Български"},
            {"bn", "বাংলা"},
            {"bs", "Bosanski"},
            {"ca", "Català"},
            {"cs", "Čeština"},
            {"da", "Dansk"},
            {"de", "Deutsch"},
            {"el", "Ελληνικά"},
            {"en", "English"},
            {"es", "Español"},
            {"et", "Eesti"},
            {"fa", "فارسی"},
            {"fi", "Suomi"},
            {"fil", "Filipino"},
            {"fr", "Français"},
            {"gl", "Galego"},
            {"gu", "ગુજરાતી"},
            {"he", "עברית"},
            {"hi", "हिन्दी"},
            {"hu", "Magyar"},
            {"hy", "Հայերեն"},
            {"id", "Bahasa Indonesia"},
            {"is", "Íslenska"},
            {"it", "Italiano"},
            {"ja", "日本語"},
            {"kk", "Қазақ тілі"},
            {"kn", "ಕನ್ನಡ"},
            {"ko", "한국어"},
            {"lt", "Lietuvių"},
            {"lv", "Latviešu"},
            {"mk", "Македонски"},
            {"ml", "മലയാളം"},
            {"mr", "मराठी"},
            {"ms", "Bahasa Melayu"},
            {"nb", "Norsk bokmål"},
            {"ne", "नेपाली"},
            {"nl", "Nederlands"},
            {"or", "ଓଡ଼ିଆ"},
            {"pa", "ਪੰਜਾਬੀ"},
            {"pl", "Polski"},
            {"pt", "Português"},
            {"ro", "Română"},
            {"ru", "Русский"},
            {"sk", "Slovenčina"},
            {"sl", "Slovenščina"},
            {"sv", "Svenska"},
            {"sw", "Kiswahili"},
            {"ta", "தமிழ்"},
            {"te", "తెలుగు"},
            {"th", "ไทย"},
            {"tr", "Türkçe"},
            {"uk", "Українська"},
            {"ur", "اردو"},
            {"vi", "Tiếng Việt"},
            {"yue", "粵語"},
            {"zh-Hans", "中文（简体）"},
            {"zh-Hant", "中文（繁體）"},
    };

    private static final Map<String, String> NAMES;
    private static final List<String> CODES;

    static {
        Map<String, String> names = new LinkedHashMap<>();
        for (String[] language : LANGUAGES) names.put(language[0], language[1]);
        NAMES = Collections.unmodifiableMap(names);
        CODES = Collections.unmodifiableList(new ArrayList<>(names.keySet()));
    }

    /** Older and broader codes a phone may report, for the language subtitles are made in. */
    private static final Map<String, String> ALIASES = new HashMap<>();

    static {
        ALIASES.put("no", "nb");
        ALIASES.put("nn", "nb");
        ALIASES.put("tl", "fil");
        ALIASES.put("iw", "he");
    }

    /** Where Chinese is written in traditional characters; everywhere else, simplified. */
    private static final Set<String> TRADITIONAL_REGIONS = new HashSet<>();

    static {
        TRADITIONAL_REGIONS.add("tw");
        TRADITIONAL_REGIONS.add("hk");
        TRADITIONAL_REGIONS.add("mo");
    }

    private Languages() {
    }

    /** Every code, in code order. */
    public static List<String> codes() {
        return CODES;
    }

    public static boolean isLanguageCode(String value) {
        return NAMES.containsKey(value);
    }

    /** The language's name in that language: Deutsch for de, or the code itself if unknown. */
    public static String name(String code) {
        String name = NAMES.get(code);
        return name != null ? name : code;
    }

    /**
     * The language's name in English, as the extension's {@code englishName} reads it from
     * {@code Intl.DisplayNames}: Japanese for ja, Simplified Chinese for zh-Hans.
     */
    public static String englishName(String code) {
        if (code.equals("zh-Hans")) return "Simplified Chinese";
        if (code.equals("zh-Hant")) return "Traditional Chinese";
        String name = Locale.forLanguageTag(code).getDisplayName(Locale.ENGLISH);
        return name.isEmpty() || name.equals(code) ? name(code) : name;
    }

    /**
     * The subtitle language for a language tag such as de-AT or zh-TW: its base language when
     * subtitles can be made in it, Chinese by its script or else its region, and English for
     * anything else.
     */
    public static String languageFor(String locale) {
        String[] parts = locale.trim().toLowerCase(Locale.ROOT).split("[-_]");
        String base = parts.length > 0 ? parts[0] : "";
        if (base.equals("zh")) {
            boolean traditional = false;
            for (int i = 1; i < parts.length; i++) {
                if (parts[i].equals("hans")) return "zh-Hans";
                if (parts[i].equals("hant") || TRADITIONAL_REGIONS.contains(parts[i])) traditional = true;
            }
            return traditional ? "zh-Hant" : "zh-Hans";
        }
        String code = spokenLanguage(locale);
        return code != null ? code : "en";
    }

    /**
     * The subtitle language a caption track's code such as en-GB, iw or zh-TW is in, or null where
     * subtitles can't be made in it, as the extension's {@code spokenLanguage}.
     */
    public static String spokenLanguage(String code) {
        String[] parts = code.trim().toLowerCase(Locale.ROOT).split("[-_]");
        String base = parts.length > 0 ? parts[0] : "";
        if (base.equals("zh")) {
            for (int i = 1; i < parts.length; i++) {
                if (parts[i].equals("hant") || TRADITIONAL_REGIONS.contains(parts[i])) return "zh-Hant";
            }
            return "zh-Hans";
        }
        String alias = ALIASES.get(base);
        String mapped = alias != null ? alias : base;
        return isLanguageCode(mapped) ? mapped : null;
    }

    /** The subtitle language for the app's language, such as its configuration's first locale. */
    public static String languageFor(Locale locale) {
        return languageFor(locale.toLanguageTag());
    }
}
