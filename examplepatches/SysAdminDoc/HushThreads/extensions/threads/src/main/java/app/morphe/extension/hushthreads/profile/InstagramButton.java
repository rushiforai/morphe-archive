/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.extension.hushthreads.profile;

import app.morphe.extension.hushthreads.settings.FamilyNames;
import app.morphe.extension.hushthreads.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.Setting;

/**
 * The Instagram button at the top of a profile.
 *
 * <p>A profile's header draws its row of buttons (on your own profile Insights, Search, Instagram
 * and Settings) in one Compose function, and Threads hands it a flag saying whether the Instagram
 * button goes in. The patch asks {@link #show} for that flag first thing in the function.
 * With the switch on the answer is no, and Threads takes the path it already has for a header
 * without the button, so the other buttons and the profile's tabs stay as they are. Your own
 * profile and other people's are drawn by the same function, so the button goes from both.
 *
 * <p>Off, paused, before the settings are ready, or a failure in here, and Threads' own flag goes
 * back unchanged. Threads keeps a header it has drawn until something changes in it, so a change
 * of the switch shows after a restart.
 */
public final class InstagramButton {
    static final String HIDDEN = "hid the profile Instagram button";
    /** Counted when Threads itself drew no button, so there was nothing to hide. */
    static final String NONE = "Threads drew no Instagram button";
    /** Prefix for a refusal's count label; one label per fixed reason from offBecause(). */
    static final String LEFT_TO_THREADS = "left the Instagram button to Threads: ";
    /** The outcome last logged. Threads asks each time it draws a profile's header, so a log line marks a change. */
    private static volatile String lastLogged;

    private InstagramButton() { }

    /**
     * First thing in the profile header's button row, with Threads' answer to whether the
     * Instagram button goes in. Answers false while the switch is on, and Threads' answer
     * otherwise. Never throws.
     */
    public static boolean show(boolean threads) {
        try {
            HookStatus.invoked(FamilyNames.HIDE_INSTAGRAM_BUTTON);
            if (!threads) {
                HookStatus.counted(FamilyNames.HIDE_INSTAGRAM_BUTTON, NONE);
                return false;
            }
            String off = offBecause();
            HookStatus.counted(FamilyNames.HIDE_INSTAGRAM_BUTTON, off == null ? HIDDEN : LEFT_TO_THREADS + off);
            String outcome = off == null ? "profiles show no Instagram button" : "Threads shows its Instagram button, " + off;
            if (!outcome.equals(lastLogged)) {
                lastLogged = outcome;
                Logger.printDebug(() -> "Instagram button: " + outcome);
            }
            return off != null;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_INSTAGRAM_BUTTON, "profile header", failure);
            return threads;
        }
    }

    /** Why the switch doesn't apply now, or null when it's on. Reads no setting before they're ready. */
    private static String offBecause() {
        if (!Utils.settingsReady()) return "settings not ready";
        if (!Settings.HIDE_INSTAGRAM_BUTTON.get()) return Setting.isPaused() ? "HushThreads paused" : "switch off";
        return null;
    }
}
