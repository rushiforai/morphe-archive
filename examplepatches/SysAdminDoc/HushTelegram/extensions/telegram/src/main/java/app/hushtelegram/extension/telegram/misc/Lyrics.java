/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;

import java.lang.ref.WeakReference;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Lyrics in the music player's menu. They come from lrclib.net and open in a panel over the
 * player's list, above its controls, so the song can still be paused or skipped. Timed lyrics
 * highlight the line being sung and scroll along with it; {@link LyricsPanel} draws them and
 * {@link LyricsSource} finds them.
 */
public final class Lyrics {
    private Lyrics() {}

    private static WeakReference<ViewGroup> sheet = new WeakReference<>(null);
    private static WeakReference<View> button = new WeakReference<>(null);

    /**
     * Called as the player's menu button builds its menu, with what Telegram builds it on.
     *
     * @param container the player sheet's outer layout, where Telegram's own menus open
     * @param clicked   the menu button
     */
    public static void anchor(ViewGroup container, View clicked) {
        sheet = new WeakReference<>(container);
        button = new WeakReference<>(clicked);
    }

    /** Called with the player's menu right after Telegram makes it, before its own items go in. */
    public static void menu(Object options) {
        if (options == null || !on()) return;
        ViewGroup container = sheet.get();
        View clicked = button.get();
        if (container == null || clicked == null) return;
        try {
            addItem(options, icon(container.getContext()), L10n.t("Lyrics"), () -> {
                try {
                    LyricsPanel.open(container, clicked);
                } catch (Throwable failure) {
                    HookStatus.threw(FamilyNames.LYRICS, "lyrics panel", failure);
                }
            });
            HookStatus.counted(FamilyNames.LYRICS, "lyrics menu item");
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.LYRICS, "lyrics menu item", failure);
        }
    }

    private static int icon(Context context) {
        return context.getResources().getIdentifier("msg_stories_caption", "drawable", context.getPackageName());
    }

    /** Whether the switch is on and HushTelegram isn't paused. */
    static boolean on() {
        HookStatus.invoked(FamilyNames.LYRICS);
        try {
            return Utils.settingsReady() && Settings.LYRICS.get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.LYRICS, "switch", failure);
            return false;
        }
    }

    /** Adds an item to Telegram's menu. Replaced when patching. */
    public static void addItem(Object options, int icon, CharSequence text, Runnable action) {}

    /** The message playing now, or null. Replaced when patching. */
    public static Object playing() { return null; }

    /** The song's title, or a file name when it has none. Replaced when patching. */
    public static String title(Object message) { return null; }

    /** The song's artist, or empty. Replaced when patching. */
    public static String author(Object message) { return null; }

    /** How far the player is into the song, from 0 to 1. Replaced when patching. */
    public static float progress(Object message) { return 0; }

    /** The song's length from its file, in seconds. Replaced when patching. */
    public static double duration(Object message) { return 0; }

    /** The song's length as the player measured it, in seconds. Replaced when patching. */
    public static int playerDuration(Object message) { return 0; }

    /** The id of the song's file, or 0. Replaced when patching. */
    public static long documentId(Object message) { return 0; }
}
