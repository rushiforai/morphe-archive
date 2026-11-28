package com.waze.gw;

import java.util.HashSet;
import java.util.Locale;
import java.util.Set;

/** Pure-Java helpers behind {@link I18n}: placeholders, language tags and the Waze voice catalog rows. */
final class I18nText {
    private I18nText() { }

    /** Replaces {0}, {1}... with the arguments; a placeholder without an argument is left as is. */
    static String format(String template, Object... args) {
        if (template == null) return "";
        if (args == null || args.length == 0 || template.indexOf('{') < 0) return template;
        StringBuilder out = new StringBuilder(template.length() + 16);
        int i = 0;
        while (i < template.length()) {
            char c = template.charAt(i);
            if (c == '{') {
                int end = template.indexOf('}', i + 1);
                if (end > i + 1) {
                    String index = template.substring(i + 1, end);
                    if (isDigits(index)) {
                        int n = Integer.parseInt(index);
                        if (n < args.length) {
                            out.append(String.valueOf(args[n]));
                            i = end + 1;
                            continue;
                        }
                    }
                }
            }
            out.append(c);
            i++;
        }
        return out.toString();
    }

    /** The set of "{n}" tokens in the text. */
    static Set<String> placeholders(String text) {
        Set<String> found = new HashSet<String>();
        if (text == null) return found;
        int i = 0;
        while (i < text.length()) {
            if (text.charAt(i) == '{') {
                int end = text.indexOf('}', i + 1);
                if (end > i + 1 && isDigits(text.substring(i + 1, end))) {
                    found.add(text.substring(i, end + 1));
                    i = end + 1;
                    continue;
                }
            }
            i++;
        }
        return found;
    }

    /**
     * A translation is usable only when it carries exactly the {n} placeholders of its source text and the same
     * printf specifiers (%d, %s, %.1f...), in the same order: some texts are passed to String.format.
     */
    static boolean samePlaceholders(String source, String translation) {
        return placeholders(source).equals(placeholders(translation))
                && formatSpecifiers(source).equals(formatSpecifiers(translation));
    }

    /** The printf specifiers of the text in order, "%%" excluded. */
    static java.util.List<String> formatSpecifiers(String text) {
        java.util.List<String> found = new java.util.ArrayList<String>();
        if (text == null) return found;
        java.util.regex.Matcher m = FORMAT_SPEC.matcher(text);
        while (m.find()) {
            if (!"%%".equals(m.group()) && !"%n".equals(m.group())) found.add(m.group());
        }
        return found;
    }

    // Only the specifiers the Mod uses; "% n" (a percent sign followed by text) must not count.
    private static final java.util.regex.Pattern FORMAT_SPEC =
            java.util.regex.Pattern.compile("%(?:\\d+\\$)?,?\\d*(?:\\.\\d+)?[dsf]|%%");

    /**
     * Normalised tag for a language/region: en, vi and ja ignore the region, Portuguese with no or BR region is
     * pt-BR, anything else keeps its region (pt-PT, de-DE...). Null when there is no language.
     */
    static String tagFor(String language, String country) {
        if (language == null) return null;
        String lang = language.trim().toLowerCase(Locale.ROOT);
        if (lang.length() == 0) return null;
        if ("iw".equals(lang)) lang = "he";
        if ("in".equals(lang)) lang = "id";
        if ("en".equals(lang) || "vi".equals(lang) || "ja".equals(lang)) return lang;
        String region = country == null ? "" : country.trim().toUpperCase(Locale.ROOT);
        if ("pt".equals(lang) && (region.length() == 0 || "BR".equals(region))) return "pt-BR";
        return region.length() == 0 ? lang : lang + "-" + region;
    }

    /** Tag for a Waze voice locale such as en-GB, ja-JA (sic), pt-BR, vi-VN. */
    static String tagForVoiceLocale(String voiceLocale) {
        if (voiceLocale == null) return null;
        String v = voiceLocale.trim().replace('_', '-');
        int dash = v.indexOf('-');
        return dash < 0 ? tagFor(v, "") : tagFor(v.substring(0, dash), v.substring(dash + 1));
    }

    /** Tag for Waze's language prompt-set name (the lang.&lt;name&gt; file), e.g. vietnamese, eng_uk, japanese. */
    static String tagForPromptName(String name) {
        if (name == null) return null;
        String n = name.trim().toLowerCase(Locale.ROOT);
        if (n.equals("vietnamese")) return "vi";
        if (n.equals("eng") || n.startsWith("eng_")) return "en";
        if (n.equals("japanese")) return "ja";
        if (n.equals("portuguese_br")) return "pt-BR";
        return null;
    }

    /** Language-only tag: de-DE -> de. */
    static String languageOf(String tag) {
        if (tag == null) return null;
        int dash = tag.indexOf('-');
        return dash < 0 ? tag : tag.substring(0, dash);
    }

    /**
     * One row of waze/tts/voices_was_tts.csv: id,num,gender,T,locale,gender,displayName,promptName,T,version.
     * Returns {id, locale, promptName} or null for a malformed row.
     */
    static String[] parseVoiceRow(String line) {
        if (line == null) return null;
        String[] cols = line.split(",", -1);
        if (cols.length < 8 || cols[0].trim().length() == 0 || cols[4].trim().length() == 0) return null;
        return new String[]{cols[0].trim(), cols[4].trim(), cols[7].trim()};
    }

    private static boolean isDigits(String s) {
        if (s.length() == 0 || s.length() > 3) return false;
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            if (c < '0' || c > '9') return false;
        }
        return true;
    }
}
