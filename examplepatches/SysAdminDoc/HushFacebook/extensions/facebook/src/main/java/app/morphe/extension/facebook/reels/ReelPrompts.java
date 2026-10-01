/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.reels;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * The "Are you interested in this reel?" prompt. One predicate decides whether a reel gets it, from
 * the reel's own flag and two server settings, and the reel overlay asks it before building the
 * prompt and before keeping a place for it. With the switch on, its yes becomes a no, and the reel
 * shows as one without a prompt.
 *
 * <p>Off, paused, before the settings are ready, or when anything here fails, the answer is
 * Facebook's own.
 */
public final class ReelPrompts {
    /** Counted under the patch's name each time a reel's prompt is answered away. */
    static final String HIDDEN = "Reel interest prompt kept out";

    private static final String FAMILY = FamilyNames.REEL_PROMPTS;

    private static volatile boolean logged;

    private ReelPrompts() {
    }

    /**
     * The entry the patch calls, handed the predicate's answer as an int: a boolean method may
     * return a register the verifier types as int, and a boolean parameter wouldn't take it.
     */
    public static boolean keep(int showsPrompt) {
        return keep(showsPrompt != 0);
    }

    /**
     * The hook, at each of the prompt predicate's returns, handed what it was about to answer.
     * Answers what the predicate returns instead: false for a reel that would get the prompt while
     * the switch is on, and Facebook's answer otherwise.
     */
    public static boolean keep(boolean showsPrompt) {
        try {
            HookStatus.invoked(FAMILY);
            if (!showsPrompt || !Utils.settingsReady() || !Settings.HIDE_REEL_PROMPTS.get()) return showsPrompt;
            HookStatus.bound(FAMILY, "prompt check");
            HookStatus.counted(FAMILY, HIDDEN);
            if (!logged) {
                logged = true;
                Logger.printDebug(() -> "Reel prompts: a reel's interest prompt was kept out");
            }
            return false;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "prompt check", failure);
            return showsPrompt;
        }
    }
}
