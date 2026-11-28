/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.profile;

import java.util.function.BooleanSupplier;

import app.hushgram.extension.instagram.settings.FamilyNames;
import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.Logger;
import app.hushgram.extension.shared.Utils;
import app.hushgram.extension.shared.diagnostics.FeedFilterCounters;
import app.hushgram.extension.shared.diagnostics.HookStatus;

/**
 * Helper for the "Hide highlights" patch.
 *
 * <p>A profile's header is a list of rows (bio, action buttons, highlights, suggestions), and
 * Instagram builds that list each time the header is laid out. The patch asks {@link #keepTray}
 * just before the row of story highlights is added, and a 0 leaves the row out, so nothing is
 * bound for it. Every other row stays, and so do the highlights themselves: the Add to highlight
 * list on a story and a highlight opened from a message or a link don't go through the header.
 *
 * <p>The hook fails open: with the switch off, HushGram paused, the settings not read yet or
 * anything thrown, the row is added as Instagram meant to.
 */
public final class ProfileHighlights {
    /** The diagnostic counter route: how often the header asked, and how often the row was left out. */
    static final String ROUTE = "Profile highlights";

    static final String TRAY = "highlights row";

    private ProfileHighlights() {
    }

    /**
     * Injected where the profile header is about to add its row of highlights. Answers 0, leave it
     * out, while the switch is on, and 1 otherwise, or when anything goes wrong. Never throws.
     */
    public static int keepTray() {
        return keepTray(ProfileHighlights::switchedOn);
    }

    static int keepTray(BooleanSupplier on) {
        try {
            HookStatus.invoked(FamilyNames.PROFILE_HIGHLIGHTS);
            FeedFilterCounters.sawKind(ROUTE, TRAY);
            if (!on.getAsBoolean()) return 1;
            FeedFilterCounters.removed(ROUTE, 1, TRAY);
            Logger.printDebug(() -> "Profile highlights: left the highlights row out");
            return 0;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.PROFILE_HIGHLIGHTS, TRAY, failure);
            return 1;
        }
    }

    private static boolean switchedOn() {
        return Utils.settingsReady() && Settings.HIDE_HIGHLIGHTS.get();
    }
}
