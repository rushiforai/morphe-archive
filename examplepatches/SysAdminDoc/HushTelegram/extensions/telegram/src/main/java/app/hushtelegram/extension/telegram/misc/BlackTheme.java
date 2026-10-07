/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.util.SparseIntArray;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Telegram reads a theme's colors from a key=value file, the built-in ones from its assets, and
 * hands each set here before using it. With the switch on, a dark built-in theme (Night, or Dark,
 * which was Tinted Night) gets pure black for its screens and bars, and for a plain chat background. Bubbles, menus,
 * dialogs and text keep the theme's colors. A patterned chat background takes its colors from the theme's accent
 * rather than from this file, so it's drawn over black instead, with the accent's colors showing through the pattern.
 *
 * <p>A theme installed from a file keeps its own colors: the theme editor and a new chat background
 * can save the colors in use back to that file, and black written there would outlast the switch.
 *
 * <p>Telegram keeps the colors it loaded until it applies a theme again, so a change shows after a
 * restart. Its accent colors are worked out from these, and they leave black as it is.
 */
public final class BlackTheme {
    private BlackTheme() {}

    static final int BLACK = 0xFF000000;

    /** The surfaces that turn black, as theme files name them. The first decides whether a theme is dark. */
    static final String[] SURFACES = {
            "windowBackgroundWhite", "windowBackgroundGray", "graySection", "windowBackgroundUnchecked",
            "actionBarDefault", "actionBarDefaultArchived", "avatar_backgroundActionBarBlue",
            "chats_menuBackground", "chats_menuTopBackgroundCats", "chat_wallpaper",
            "chat_messagePanelBackground", "chat_emojiPanelBackground", "chat_topPanelBackground",
            "inappPlayerBackground", "glass_targetMainTabs", "glass_targetMainTopPanel",
    };

    /** Telegram's ids for {@link #SURFACES}, looked up once. Package-visible so a test can set them. */
    static volatile int[] ids;

    /**
     * Called with each color set Telegram reads from a theme file, before Telegram uses it.
     *
     * @param asset the built-in theme's asset, such as night.attheme, or null for a theme file
     * @param colors Telegram's color ids mapped to colors, changed in place
     */
    public static void loaded(String asset, SparseIntArray colors) {
        if (asset == null || colors == null) return;
        HookStatus.invoked(FamilyNames.AMOLED_BLACK);
        try {
            if (!Utils.settingsReady() || !Settings.AMOLED_BLACK.get()) return;
            if (blacken(colors, ids()) > 0) HookStatus.counted(FamilyNames.AMOLED_BLACK, "dark theme turned black");
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.AMOLED_BLACK, "black theme", failure);
        }
    }

    /**
     * Called before Telegram draws the chat background, with the pattern's strength. Telegram draws a
     * built-in theme's pattern on the accent's colors, and a dark cloud wallpaper's pattern over black
     * with the colors showing through it, which it asks for with a negative strength. With the switch
     * on, the theme's own pattern on a theme this switch turned black is drawn the second way.
     *
     * @param colors the colors in use, with the accent applied
     * @param picked a wallpaper picked for the theme, which keeps Telegram's drawing, or null
     * @param intensity the pattern's strength, negative when Telegram already draws it over black
     * @return the strength to draw with
     */
    public static int patternIntensity(SparseIntArray colors, Object picked, int intensity) {
        HookStatus.invoked(FamilyNames.AMOLED_BLACK);
        if (picked != null || colors == null || intensity <= 0) return intensity;
        try {
            if (!Utils.settingsReady() || !Settings.AMOLED_BLACK.get() || !black(colors, ids())) return intensity;
            HookStatus.counted(FamilyNames.AMOLED_BLACK, "pattern drawn over black");
            return -intensity;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.AMOLED_BLACK, "black pattern", failure);
            return intensity;
        }
    }

    /** Whether the set's screens are the black this switch puts there. */
    static boolean black(SparseIntArray colors, int[] surfaces) {
        int window = surfaces[0] < 0 ? -1 : colors.indexOfKey(surfaces[0]);
        return window >= 0 && colors.valueAt(window) == BLACK;
    }

    /** Turns the surfaces the set has black when it's dark, and answers how many it changed. */
    static int blacken(SparseIntArray colors, int[] surfaces) {
        int window = surfaces[0] < 0 ? -1 : colors.indexOfKey(surfaces[0]);
        if (window < 0 || !dark(colors.valueAt(window))) return 0;
        int changed = 0;
        for (int id : surfaces) {
            // A key the theme leaves out falls back to another one, which stays Telegram's call.
            if (id < 0 || colors.indexOfKey(id) < 0) continue;
            colors.put(id, BLACK);
            changed++;
        }
        return changed;
    }

    /** An opaque color under a quarter of full brightness. */
    static boolean dark(int color) {
        if ((color >>> 24) != 0xFF) return false;
        int red = (color >> 16) & 0xFF, green = (color >> 8) & 0xFF, blue = color & 0xFF;
        return 0.2126 * red + 0.7152 * green + 0.0722 * blue < 64;
    }

    private static int[] ids() {
        int[] known = ids;
        if (known != null) return known;
        int[] found = new int[SURFACES.length];
        for (int i = 0; i < SURFACES.length; i++) {
            found[i] = keyId(SURFACES[i]);
            if (found[i] < 0) HookStatus.missingMember(FamilyNames.AMOLED_BLACK, "theme key", "Theme", SURFACES[i]);
        }
        ids = found;
        return found;
    }

    /** Telegram's id for a theme key, or -1. Replaced with Telegram's own lookup when patching. */
    public static int keyId(String key) { return -1; }
}
