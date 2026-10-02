/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.feed;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * The line under the poster's name keeps the post's date (issue #40). Facebook's newer post header
 * draws that line one of two ways: one line with the date and who can see the post, or, with its
 * rotating subtitle experiment on, a component that rotates the texts the header's subtitle plugins
 * gave the post, fitted into what's left of a width measured beforehand. On the reporter's phone the
 * date showed and the line went blank half a second later, with Hushfacebook paused too. With the
 * switch on, the header's answer to whether it rotates is a no, so every post gets the one line.
 *
 * <p>Off, paused, before the settings are ready, or when anything here fails, the answer is
 * Facebook's own.
 */
public final class PostDates {
    /** Counted under the patch's name each time a header that would rotate its line keeps the one line. */
    static final String ONE_LINE = "rotating subtitle kept to one line";

    /** The member the report names once a post header has made its choice. */
    static final String CHOICE = "subtitle choice";

    private static final String FAMILY = FamilyNames.POST_DATES;

    private static volatile boolean logged;

    private PostDates() {
    }

    /**
     * The hook, right after the post header works out whether it rotates its subtitle, handed that
     * answer. Answers false while the switch is on, and Facebook's answer otherwise.
     */
    public static boolean cycling(boolean rotates) {
        try {
            HookStatus.invoked(FAMILY);
            HookStatus.bound(FAMILY, CHOICE);
            if (!rotates || !Utils.settingsReady() || !Settings.KEEP_POST_DATES.get()) return rotates;
            HookStatus.counted(FAMILY, ONE_LINE);
            if (!logged) {
                logged = true;
                Logger.printDebug(() -> "Post dates: a post header that would rotate its subtitle kept the one line with the date");
            }
            return false;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, CHOICE, failure);
            return rotates;
        }
    }
}
