/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.pinedrama.search;

import android.content.Context;

import java.util.Locale;

import app.morphe.extension.shared.Utils;

/**
 * Search result tab titles that arrive as a template nobody filled in. PineDrama's server can send
 * a tab named {@code ${drama_tab_name}}, and the app has nothing that resolves it.
 */
@SuppressWarnings("unused")
public final class SearchTabTitles {
    private static final String[] NAME_ENDINGS = {"_tab_name", "_name", "_tab"};

    private SearchTabTitles() {
    }

    /**
     * The Context to read the app's own Drama label with, or null when this title isn't a drama
     * placeholder or there's no Context to read it through.
     */
    public static Context dramaLabelContext(CharSequence title, Context context) {
        String name = placeholderName(title);
        if (name == null || !name.toLowerCase(Locale.ROOT).contains("drama")) return null;
        return context != null ? context : Utils.getContext();
    }

    /** A placeholder's name as words. Any other title comes back as it was. */
    public static CharSequence readable(CharSequence title) {
        String name = placeholderName(title);
        if (name == null) return title;
        String words = name;
        for (String ending : NAME_ENDINGS) {
            if (words.toLowerCase(Locale.ROOT).endsWith(ending)) {
                words = words.substring(0, words.length() - ending.length());
                break;
            }
        }
        words = words.replace('_', ' ').replace('-', ' ').replace('.', ' ').trim();
        if (words.isEmpty()) return title;
        return Character.toUpperCase(words.charAt(0)) + words.substring(1);
    }

    /** What's inside a title that is nothing but {@code ${name}}, or null for any other title. */
    private static String placeholderName(CharSequence title) {
        if (title == null) return null;
        String text = title.toString().trim();
        if (text.length() < 4 || !text.startsWith("${") || !text.endsWith("}")) return null;
        String name = text.substring(2, text.length() - 1).trim();
        return name.isEmpty() || name.indexOf('{') >= 0 || name.indexOf('}') >= 0 ? null : name;
    }
}
