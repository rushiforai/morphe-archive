package xyz.urro.gboard;

import android.icu.util.ULocale;
import java.util.Collection;
import java.util.LinkedHashSet;
import java.util.Locale;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Resolves notation against the actual source and target languages advertised by Gboard. */
public final class LanguageShortcut {
    private static final java.util.Map<String, String> LANGUAGES = languageAliases();
    private static final Pattern COMPACT = Pattern.compile("^([a-z]{2,3})([a-z]{4})?([a-z]{2}|[0-9]{3})$", Pattern.CASE_INSENSITIVE);

    public static final class Selection {
        public final String source;
        public final String target;
        public final int end;

        private Selection(String source, String target, int end) {
            this.source = source;
            this.target = target;
            this.end = end;
        }
    }

    private LanguageShortcut() {}

    public static boolean whitespace(int codePoint) {
        return Character.isWhitespace(codePoint) || Character.isSpaceChar(codePoint);
    }

    public static Selection parse(String text, Collection<String> sources, Collection<String> targets) {
        int start = 0;
        while (start < text.length() && whitespace(text.codePointAt(start))) {
            start += Character.charCount(text.codePointAt(start));
        }
        int end = start;
        while (end < text.length() && !whitespace(text.codePointAt(end))) {
            int cp = text.codePointAt(end);
            if (!(cp >= 'a' && cp <= 'z' || cp >= 'A' && cp <= 'Z' || cp >= '0' && cp <= '9' || cp == '-')) {
                return null;
            }
            end += Character.charCount(cp);
        }
        if (end == start || end == text.length()) return null;
        String code = text.substring(start, end);
        int consumed = end;
        while (consumed < text.length() && whitespace(text.codePointAt(consumed))) {
            consumed += Character.charCount(text.codePointAt(consumed));
        }
        // A complete supported locale wins over interpreting its region as a second language.
        String single = resolve(code, targets, false);
        if (single != null) return new Selection(null, single, consumed);
        Set<String> pairs = new LinkedHashSet<>();
        Selection pair = null;
        int bestScore = -1;
        for (int split = code.indexOf('-'); split >= 0; split = code.indexOf('-', split + 1)) {
            String sourceCode = code.substring(0, split), targetCode = code.substring(split + 1);
            String source = resolve(sourceCode, sources, true), target = resolve(targetCode, targets, true);
            if (source == null || target == null) continue;
            int score = (resolve(sourceCode, sources, false) == null ? 0 : 1)
                    + (resolve(targetCode, targets, false) == null ? 0 : 1);
            if (score > bestScore) { pairs.clear(); bestScore = score; }
            if (score == bestScore && pairs.add(source + "\n" + target)) pair = new Selection(source, target, consumed);
        }
        if (pairs.size() == 1) return pair;
        if (pairs.size() > 1) return null;
        single = resolve(code, targets, true);
        return single == null ? null : new Selection(null, single, consumed);
    }

    public static String resolve(String code, Collection<String> supported, boolean allowRegionFallback) {
        if ("auto".equalsIgnoreCase(code)) {
            for (String key : supported) if ("auto".equalsIgnoreCase(key)) return key;
            return null;
        }
        ULocale requested = locale(code);
        if (requested == null) return null;
        // Common shorthand for European Portuguese when Gboard exposes Portugal separately.
        if (requested.getLanguage().equals("pt") && requested.getCountry().equals("EU")) {
            for (String key : supported) if ("pt-PT".equalsIgnoreCase(key)) return key;
        }
        for (String key : supported) {
            ULocale candidate = locale(key);
            if (candidate != null && candidate.equals(requested)) return key;
        }
        if (!allowRegionFallback || requested.getCountry().isEmpty() && requested.getScript().isEmpty()) return null;
        // Collapse a region only when the service actually advertises the base language.
        for (String key : supported) {
            ULocale candidate = locale(key);
            if (candidate != null && candidate.getLanguage().equals(requested.getLanguage())
                    && candidate.getCountry().isEmpty() && candidate.getScript().isEmpty()) return key;
        }
        return null;
    }

    private static java.util.Map<String, String> languageAliases() {
        java.util.Map<String, String> aliases = new java.util.HashMap<>();
        for (String code : ULocale.getISOLanguages()) {
            ULocale locale = new ULocale(code);
            aliases.put(code, code);
            String iso3 = locale.getISO3Language();
            if (!iso3.isEmpty()) aliases.put(iso3, code);
        }
        return java.util.Collections.unmodifiableMap(aliases);
    }

    private static ULocale locale(String code) {
        if (code.isEmpty() || code.length() > 35) return null;
        Matcher compact = COMPACT.matcher(code);
        if (compact.matches()) {
            code = compact.group(1) + (compact.group(2) == null ? "" : "-" + compact.group(2)) + "-" + compact.group(3);
        }
        if (!code.matches("[A-Za-z]{2,3}(?:-[A-Za-z]{4})?(?:-(?:[A-Za-z]{2}|[0-9]{3}))?")) return null;
        try {
            ULocale raw = new ULocale.Builder().setLanguageTag(code).build();
            ULocale canonical = ULocale.createCanonical(raw.toString());
            String language = canonical.getLanguage();
            if (language.isEmpty() || !canonical.getVariant().isEmpty() || !canonical.getExtensionKeys().isEmpty()) return null;
            String twoLetter = LANGUAGES.get(language);
            if (twoLetter != null && !twoLetter.equals(language)) canonical = new ULocale.Builder().setLocale(canonical).setLanguage(twoLetter).build();
            return canonical;
        } catch (RuntimeException ignored) {
            return null;
        }
    }
}
