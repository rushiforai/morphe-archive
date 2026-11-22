package io.github.daydreamfix.ext;

import android.util.Log;

import java.lang.reflect.Array;
import java.lang.reflect.Constructor;
import java.util.List;

/**
 * Adds Swiss French and Swiss German to the VR keyboard: the German QWERTZ layouts
 * (they already long-press to é è à ä ö ü), so a Swiss phone gets QWERTZ instead of AZERTY.
 *
 * Each language entry (aex) names its settings key and title by string id, so the new ones use
 * ids no resource has, answered by {@link #text} through the redirected getString calls.
 * They go after their language's own entries: an fr-FR phone still takes the first French entry
 * (no country matches), fr-CH the exact one.
 */
public final class SwissKeyboard {
    private static final int KEY_FR = 0x7f0fff01, TITLE_FR = 0x7f0fff02;
    private static final int KEY_DE = 0x7f0fff03, TITLE_DE = 0x7f0fff04;

    private SwissKeyboard() {}

    public static String text(int id) {
        switch (id) {
            case KEY_FR: return "pref_key_locale_fr_ch";
            case TITLE_FR: return title("fr");
            case KEY_DE: return "pref_key_locale_de_ch";
            case TITLE_DE: return title("de");
            default: return null;
        }
    }

    /** "Allemand (Suisse)" on a French phone, like the app's own titles in the phone's language. */
    private static String title(String language) {
        String name = new java.util.Locale(language, "CH").getDisplayName();
        return name.isEmpty() ? name : name.substring(0, 1).toUpperCase() + name.substring(1);
    }

    /** Just past the last entry of that language, so the settings list keeps them together. */
    private static int afterLast(List<Object> all, String language) {
        int at = all.size();
        for (int i = 0; i < all.size(); i++) {
            String tag = (String) Reflect.get(all.get(i), "a");
            if (tag.equals(language) || tag.startsWith(language + "-")) at = i + 1;
        }
        return at;
    }

    /** After acj's constructor: acj.a is the list of every language entry. */
    @SuppressWarnings("unchecked")
    public static void add(Object acj) {
        try {
            List<Object> all = (List<Object>) Reflect.get(acj, "a");
            Object german = null;
            for (Object entry : all) {
                if ("de".equals(Reflect.get(entry, "a"))) german = entry;
                if ("fr-ch".equals(Reflect.get(entry, "a"))) return;
            }
            if (german == null) return;
            Object layouts = Reflect.get(german, "d");
            Constructor<?> make = german.getClass().getConstructor(String.class, int.class, int.class, layouts.getClass());
            all.add(afterLast(all, "fr"), make.newInstance("fr-ch", KEY_FR, TITLE_FR, layouts));
            all.add(afterLast(all, "de"), make.newInstance("de-ch", KEY_DE, TITLE_DE, layouts));
            Log.i(Daydream.TAG, "Swiss keyboard added (" + Array.getLength(layouts) + " layouts)");
        } catch (ReflectiveOperationException | RuntimeException e) {
            Log.w(Daydream.TAG, "Swiss keyboard not added", e);
        }
    }
}
