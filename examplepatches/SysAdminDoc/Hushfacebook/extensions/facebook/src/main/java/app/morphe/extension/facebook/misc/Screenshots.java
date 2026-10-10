/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.misc;

import android.view.Window;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.FeedFilterCounters;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * What the Allow screenshots patch asks each time Facebook sets a window's flags.
 *
 * <p>Android blacks out a window marked secure in screenshots, screen recordings and the recent apps
 * view. Facebook marks a few of its screens that way, the payment card form and a photo opened full
 * screen in a chat among them, either through {@code Window.addFlags} or {@code setFlags} or by
 * writing the flags of the layout parameters it builds a dialog or popup window with. The patch
 * sends every one of those calls here, and puts {@link #layoutFlags} in front of every one of those
 * writes. While the switch is on, the secure flag comes out and the rest of the flags go through as
 * Facebook asked.
 *
 * <p>A window can already hold the flag: it was set while the switch was off, or by a path the patch
 * doesn't reach. While the switch is on, the next flags call on that window clears it too, by
 * putting the secure flag in the call's mask (the way icysymmetra/tiktok-patches-for-morphe clears
 * a flag one screen hands the next). A secure screen that never sets its window's flags again keeps
 * the flag until it's opened again.
 *
 * <p>Off, paused, settings that aren't ready yet, or a failure in here, and the flags go through
 * unchanged.
 */
public final class Screenshots {
    /** The diagnostic counter route: each secure flag Facebook set, and the ones taken out. */
    static final String ROUTE = "Secure windows";

    /** {@code WindowManager.LayoutParams.FLAG_SECURE}. */
    static final int FLAG_SECURE = 0x2000;

    private Screenshots() {
    }

    /** Injection point, in place of each of Facebook's {@code Window.addFlags(int)} calls. */
    public static void addFlags(Window window, int flags) {
        if (clears(flags, window)) window.setFlags(flags & ~FLAG_SECURE, flags | FLAG_SECURE);
        else window.addFlags(flags);
    }

    /** Injection point, in place of each of Facebook's {@code Window.setFlags(int, int)} calls. */
    public static void setFlags(Window window, int flags, int mask) {
        if (clears(flags, window)) window.setFlags(flags & ~FLAG_SECURE, mask | FLAG_SECURE);
        else window.setFlags(flags, mask);
    }

    /**
     * Injection point, on the value of each of Facebook's writes of a layout parameters' flags.
     * Answers the flags to write. Never throws.
     */
    public static int layoutFlags(int flags) {
        return (flags & FLAG_SECURE) != 0 && clears(flags, null) ? flags & ~FLAG_SECURE : flags;
    }

    /**
     * Whether the secure flag comes out of this call: [flags] asks for it, or [window] (null for a
     * layout parameters write) already holds it, and the switch is on. Never throws.
     */
    private static boolean clears(int flags, Window window) {
        boolean asked = (flags & FLAG_SECURE) != 0;
        if (!asked && (window == null || (window.getAttributes().flags & FLAG_SECURE) == 0)) return false;
        try {
            HookStatus.invoked(FamilyNames.SCREENSHOTS);
            // An earlier flag is only counted when it comes out, so a secure screen that keeps
            // setting its other flags with the switch off doesn't fill the report.
            if (asked) FeedFilterCounters.sawList(ROUTE, 1);
            if (!Utils.settingsReady() || !Settings.ALLOW_SCREENSHOTS.get()) return false;
            if (!asked) FeedFilterCounters.sawList(ROUTE, 1);
            FeedFilterCounters.removed(ROUTE, 1, asked ? "secure flag" : "earlier secure flag");
            Logger.printDebug(() -> "Allow screenshots: took " + (asked ? "the" : "an earlier")
                    + " secure flag out of a window");
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SCREENSHOTS, "window flags", failure);
            return false;
        }
    }
}
