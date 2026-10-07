/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.extension.hushthreads.download;

import android.app.Activity;
import android.content.Context;

import app.morphe.extension.hushthreads.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

/**
 * Save in a post's menu, just below Copy link. The save patch draws it with the row and the calls
 * Threads draws Copy link with, so it scales with the font size and reads to TalkBack like the rows
 * around it. A tap hands the menu's post to {@link PostSave} and closes the menu the way Copy link
 * does.
 */
@SuppressWarnings("unused")
public final class SaveMediaRow {
    /**
     * Threads' own icons for the row, first choice first. Drawable names survive Threads' build,
     * and a later build that drops one falls back to the next.
     */
    static final String[] ICONS = {
            "threads_icons_cotton_arrow_download_outline_24",
            "threads_icons_cotton_arrow_download_filled_24",
            "fb_ic_download_24",
    };

    /** -1 until it's looked up, then 0 when Threads has none of {@link #ICONS}. Package-visible for tests. */
    static int icon = -1;

    private SaveMediaRow() {
    }

    /**
     * Injected into the post menu just after its Copy link row, on the main thread, while it
     * composes. The row is left out when the switch is off, the post has nothing to save, or Threads
     * has no icon for it, since Threads' row would throw without one. Anything that fails before the
     * row is drawn leaves it out too, so the menu still opens.
     */
    public static void add(Object menu, Object composer) {
        String label;
        try {
            if (!Utils.settingsReady() || !Settings.SAVE_MEDIA.get()) return;
            Object media = media(menu);
            if (media == null || !PostSave.canSave(media)) return;
            if (icon < 0) icon = lookUpIcon();
            if (icon <= 0) return;
            label = PostSave.label(media);
        } catch (Throwable failure) {
            Logger.printException(() -> "Save row: left out of the post menu", failure);
            return;
        }
        showRow(composer, new Click(menu), label, icon);
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
            Logger.printException(() -> "Save row: could not look up its icon", ex);
        }
        Logger.printInfo(() -> "Save row left out: Threads has none of its icons");
        return 0;
    }

    /** Written by the save patch: Threads' Copy link row, with this click, label and icon. */
    static void showRow(Object composer, Object onClick, String label, int icon) {
    }

    /** Written by the save patch: the post the menu is open on. */
    static Object media(Object menu) {
        return null;
    }

    /** Written by the save patch: the activity the menu is open in. */
    static Activity activity(Object menu) {
        return null;
    }

    /** Written by the save patch: closes the menu, as Copy link does once it has copied the link. */
    static void dismiss(Object menu) {
    }

    /**
     * The row's click. The save patch makes it a {@code kotlin.jvm.functions.Function0}, which this
     * build can't name, and Threads calls {@link #invoke()} when the row is tapped.
     */
    public static final class Click {
        private final Object menu;

        Click(Object menu) {
            this.menu = menu;
        }

        public Object invoke() {
            try {
                Activity activity = activity(menu);
                Context context = activity != null ? activity : Utils.getContext();
                PostSave.save(context, media(menu));
            } catch (Throwable failure) {
                Logger.printException(() -> "Save row: could not start the save", failure);
            }
            try {
                dismiss(menu);
            } catch (Throwable failure) {
                Logger.printException(() -> "Save row: could not close the menu", failure);
            }
            return null;
        }
    }
}
