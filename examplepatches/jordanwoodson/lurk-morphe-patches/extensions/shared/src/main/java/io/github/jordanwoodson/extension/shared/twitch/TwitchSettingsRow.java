package io.github.jordanwoodson.extension.shared.twitch;

import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.WeakHashMap;

import io.github.jordanwoodson.extension.shared.Logger;
import io.github.jordanwoodson.extension.shared.settings.Settings;

/**
 * The "Lurk" row in the list version of Twitch's main Settings screen (MainSettingsFragment, which Twitch shows
 * signed out). Its rows are Twitch menu models that name a settings destination; the Lurk row names none, so
 * Twitch ignores a tap on it, and the settings patch hooks the tap handler to open Lurk settings instead. The
 * Compose version of the screen draws its Lurk row with {@link Settings#openAction(Class)}.
 */
@SuppressWarnings("unused")
public final class TwitchSettingsRow {
    private static final String TITLE = "Lurk";
    /** The rows made here, by identity while their screen exists. */
    private static final Set<Object> ROWS = Collections.synchronizedSet(
            Collections.newSetFromMap(new WeakHashMap<>()));

    private TwitchSettingsRow() {
    }

    /** Injection point: in the screen's list builder, after the Privacy Notice row. Adds the Lurk row. */
    @SuppressWarnings({"rawtypes", "unchecked"})
    public static void addMenuRow(List rows) {
        if (rows == null) return;
        try {
            Object row = menuRow(TITLE);
            if (row == null) return;
            ROWS.add(row);
            rows.add(row);
        } catch (RuntimeException e) {
            Logger.w("settings: no Lurk row in Twitch's settings: " + e);
        }
    }

    /** Injection point: before Twitch handles a tap on a settings row. True when it was the Lurk row. */
    public static boolean menuRowClicked(Object row) {
        if (row == null || !ROWS.contains(row)) return false;
        Settings.openScreen();
        return true;
    }

    /**
     * Replaced at patch time with Twitch's menu row model: [title], no description and no destination, tappable.
     * Returns null here (on the JVM, or if the patch left it alone).
     */
    private static Object menuRow(String title) {
        return null;
    }
}
