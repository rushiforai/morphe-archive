/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.ads;

import androidx.annotation.Nullable;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * The product cards of the shop links a creator attaches to a post to earn a commission. Facebook
 * shows the card in three places, and each place asks its own question first: the reel overlay
 * asks whether a reel gets its product card, the feed asks for the id of the server-built footer
 * under a post's attachment, and the comment sheet asks for the model of the card that floats over
 * the comment box. With the switch on, the first answers no and the other two answer null, which is
 * what Facebook gets for a post with no shop link.
 *
 * <p>The "Commission eligible" label is a disclosure and is left alone.
 *
 * <p>Off, paused, before the settings are ready, or when anything here fails, the answer is
 * Facebook's own.
 */
public final class AffiliateLinks {
    /** Counted under the patch's name for each card answered away, one name per place. */
    static final String REEL_CARD = "Reel product card kept out";
    static final String FEED_CARD = "Feed product card kept out";
    static final String COMMENT_CARD = "Comment sheet product card kept out";

    private static final String FAMILY = FamilyNames.AFFILIATE_LINKS;

    private static volatile boolean logged;

    private AffiliateLinks() {
    }

    /**
     * The entry the patch calls, handed the predicate's answer as an int: a boolean method may
     * return a register the verifier types as int, and a boolean parameter wouldn't take it.
     */
    public static boolean keepReelCard(int showsCard) {
        return keepReelCard(showsCard != 0);
    }

    /**
     * The hook at each return of the reel overlay's product card predicate, handed what it was about
     * to answer. False for a reel that would get the card while the switch is on, and Facebook's
     * answer otherwise.
     */
    public static boolean keepReelCard(boolean showsCard) {
        try {
            HookStatus.invoked(FAMILY);
            if (!showsCard || !hiding()) return showsCard;
            kept("reel card check", REEL_CARD);
            return false;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "reel card check", failure);
            return showsCard;
        }
    }

    /**
     * The hook at each return of the feed's footer id lookup, handed the id it was about to answer.
     * Null, the answer for an attachment with no server-built footer, while the switch is on.
     */
    @Nullable
    public static String keepFooter(@Nullable String footerId) {
        try {
            HookStatus.invoked(FAMILY);
            if (footerId == null || !hiding()) return footerId;
            kept("feed footer id", FEED_CARD);
            return null;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "feed footer id", failure);
            return footerId;
        }
    }

    /**
     * The hook at each return of the comment sheet's floating card model reader, handed the model it
     * was about to answer. Null, the answer for a post with no shop link, while the switch is on.
     */
    @Nullable
    public static Object keepCommentCard(@Nullable Object card) {
        try {
            HookStatus.invoked(FAMILY);
            if (card == null || !hiding()) return card;
            kept("comment card model", COMMENT_CARD);
            return null;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "comment card model", failure);
            return card;
        }
    }

    private static boolean hiding() {
        return Utils.settingsReady() && Settings.HIDE_AFFILIATE_LINKS.get();
    }

    private static void kept(String anchor, String count) {
        HookStatus.bound(FAMILY, anchor);
        HookStatus.counted(FAMILY, count);
        if (!logged) {
            logged = true;
            Logger.printDebug(() -> "Affiliate links: a product card was kept out");
        }
    }
}
