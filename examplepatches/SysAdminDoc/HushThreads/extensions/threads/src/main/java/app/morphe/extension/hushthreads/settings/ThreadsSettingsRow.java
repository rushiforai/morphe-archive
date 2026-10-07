/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.extension.hushthreads.settings;

import android.content.Context;

import app.morphe.extension.shared.L10n;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

/**
 * The HushThreads row the settings patch adds to Threads' own settings, just above More settings.
 * Threads draws it with the row it draws Accounts Center with, so it scales with the font size and
 * reads to TalkBack like the rows around it.
 */
@SuppressWarnings("unused")
public final class ThreadsSettingsRow {
    static final String TITLE = "HushThreads";

    /**
     * Threads' own icons for the row, first choice first. Drawable names survive Threads' build,
     * and a later build that drops one falls back to the next.
     */
    static final String[] ICONS = {
            "threads_icons_cotton_shield_check_outline_24",
            "threads_icons_cotton_settings_outline_24",
            "threads_icons_cotton_gear_outline_24",
    };

    private static final Click CLICK = new Click();

    /** -1 until it's looked up, then 0 when Threads has none of {@link #ICONS}. Package-visible for tests. */
    static int icon = -1;

    private ThreadsSettingsRow() {
    }

    /**
     * Injected into Threads' settings list where it draws More settings, on the main thread,
     * while it composes. Without an icon the row is left out, since Threads' row would throw on it.
     */
    public static void add(Object composer) {
        if (icon < 0) icon = lookUpIcon();
        if (icon <= 0) return;
        showRow(composer, CLICK, TITLE, L10n.t(Utils.getContext(), "Turn features on or off"), icon);
    }

    /** The icon's id, 0 when Threads has none of {@link #ICONS}, or -1 to look again on the next draw because there's no context yet. */
    private static int lookUpIcon() {
        Context context = Utils.getContext();
        if (context == null) return -1;
        try {
            for (String name : ICONS) {
                int id = context.getResources().getIdentifier(name, "drawable", context.getPackageName());
                if (id != 0) return id;
            }
        } catch (Exception ex) {
            Logger.printException(() -> "Settings row: could not look up its icon", ex);
        }
        Logger.printInfo(() -> "Settings row left out: Threads has none of its icons");
        return 0;
    }

    /**
     * Written by the settings patch: Threads' Accounts Center row, with Threads' own modifier, this
     * text, icon and click, and no badge.
     */
    static void showRow(Object composer, Object onClick, String title, String subtitle, int icon) {
    }

    /**
     * The row's click. The settings patch makes it a {@code kotlin.jvm.functions.Function0},
     * which this build can't name, and Threads calls {@link #invoke()} when the row is tapped.
     */
    public static final class Click {
        public Object invoke() {
            SettingsEntry.openFromThreadsSettings();
            return null;
        }
    }
}
