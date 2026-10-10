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
 * The strip Facebook draws on some posts: "Are you interested in this post?", "Show less", who
 * recently commented, and follow, chat or post suggestions. Facebook calls it a story bumper, and
 * one predicate on its component answers whether a story has one. The bumper plugin and every row
 * that keeps room for a bumper ask it, so with the switch on, a no means no strip and no gap.
 *
 * <p>The same family holds a second switch, off by default: the header of a post from a Page or a
 * person you don't follow shows a dot and "Follow" after the name, a text a title plugin adds when its own check says
 * yes. {@link #showFollowLink} answers that check no, so the header is drawn as for a post that has
 * no such text.
 *
 * <p>Off, paused, before the settings are ready, or when anything here fails, the answer is
 * Facebook's own.
 */
public final class PostPrompts {
    /** Counted under the patch's name each time a story's bumper is answered away. */
    static final String HIDDEN = "Post prompt kept out";

    /** Counted under the patch's name each time a header's Follow link is answered away. */
    static final String FOLLOW_HIDDEN = "Follow link kept out";

    private static final String FAMILY = FamilyNames.POST_PROMPTS;

    private static volatile boolean logged;

    private static volatile boolean followLogged;

    private PostPrompts() {
    }

    /**
     * The entry the patch calls, handed the predicate's answer as an int: a boolean method may
     * return a register the verifier types as int, and a boolean parameter wouldn't take it.
     */
    public static boolean keep(int hasBumper) {
        return keep(hasBumper != 0);
    }

    /**
     * The hook, at each of the has-bumper predicate's returns, handed what it was about to answer.
     * Answers what the predicate returns instead: false for a story with a bumper while the switch
     * is on, and Facebook's answer otherwise.
     */
    public static boolean keep(boolean hasBumper) {
        try {
            HookStatus.invoked(FAMILY);
            if (!hasBumper || !Utils.settingsReady() || !Settings.HIDE_POST_PROMPTS.get()) return hasBumper;
            HookStatus.bound(FAMILY, "bumper check");
            HookStatus.counted(FAMILY, HIDDEN);
            if (!logged) {
                logged = true;
                Logger.printDebug(() -> "Post prompts: a post's bumper strip was kept out");
            }
            return false;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "bumper check", failure);
            return hasBumper;
        }
    }

    /**
     * The entry the follow-link hook calls, handed the check's answer as an int for the same reason
     * as {@link #keep(int)}.
     */
    public static boolean showFollowLink(int shown) {
        return showFollowLink(shown != 0);
    }

    /**
     * The hook, at each return of the check that decides whether a post's header carries the
     * "Follow" (or "Subscribe") text after the name. The header builds without that text when the
     * check says no, so the name, the date and the layout stay as Facebook draws a header without
     * it. A yes becomes a no while the switch is on; everything else is Facebook's answer.
     */
    public static boolean showFollowLink(boolean shown) {
        try {
            HookStatus.invoked(FAMILY);
            if (!shown || !Utils.settingsReady() || !Settings.HIDE_POST_FOLLOW_LINK.get()) return shown;
            HookStatus.bound(FAMILY, "follow link");
            HookStatus.counted(FAMILY, FOLLOW_HIDDEN);
            if (!followLogged) {
                followLogged = true;
                Logger.printDebug(() -> "Post prompts: a post header's Follow link was kept out");
            }
            return false;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "follow link", failure);
            return shown;
        }
    }
}
