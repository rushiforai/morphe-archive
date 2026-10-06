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
 * Facebook asked. A screen that was already open keeps its flag until it's opened again.
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
        window.addFlags(allowed(flags));
    }

    /** Injection point, in place of each of Facebook's {@code Window.setFlags(int, int)} calls. */
    public static void setFlags(Window window, int flags, int mask) {
        window.setFlags(allowed(flags), mask);
    }

    /**
     * Injection point, on the value of each of Facebook's writes of a layout parameters' flags.
     * Answers the flags to write. Never throws.
     */
    public static int layoutFlags(int flags) {
        return allowed(flags);
    }

    /** [flags] without the secure flag while the switch is on, otherwise as they came. Never throws. */
    private static int allowed(int flags) {
        if ((flags & FLAG_SECURE) == 0) return flags;
        try {
            HookStatus.invoked(FamilyNames.SCREENSHOTS);
            FeedFilterCounters.sawList(ROUTE, 1);
            if (!Utils.settingsReady() || !Settings.ALLOW_SCREENSHOTS.get()) return flags;
            FeedFilterCounters.removed(ROUTE, 1, "secure flag");
            Logger.printDebug(() -> "Allow screenshots: took the secure flag out of a window");
            return flags & ~FLAG_SECURE;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SCREENSHOTS, "window flags", failure);
            return flags;
        }
    }
}
