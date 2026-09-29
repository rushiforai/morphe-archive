/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.reels;

import androidx.annotation.Nullable;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * What the Turn off double tap to like patch asks before a double tap on a reel or a video likes
 * it.
 *
 * <p>Nearly every reel and video player in Facebook sits under one gesture view, which a double tap
 * reaches twice: first to play the heart where the finger landed, then to hand the tap to the
 * player's double-tap handler, which likes the reel. Both read the handler first and do nothing
 * without one, which is how Facebook builds a player that has no double-tap like. The patch puts
 * {@link #heart} and {@link #handler} after those reads, and while the switch is on they answer
 * that there's no handler. The double-tap seek and the other gestures the view checks before the
 * handler work as before, and so does a single tap.
 *
 * <p>Every double-tap like of a reel or a video ends in Facebook's reel like helper, which the
 * patch reaches twice as well. Its double-tap like looks up a key for the reel and does nothing
 * without one; {@link #likeKey} answers that there's none. Its like itself takes a source, and
 * {@link #holdBackLike} holds back the ones whose source is a double tap, the way three players
 * with a double-tap listener of their own send it. A feed attachment that chains into Reels plays
 * its own heart after its double tap asks the helper, so {@link #holdBackTap} leaves that double
 * tap unhandled, the answer the attachment gives when its double-tap like is off.
 *
 * <p>The Like button's like has another source, so it goes through, and so does everything while
 * the switch is off, Hushfacebook is paused or settings aren't ready, or when anything in here
 * fails.
 */
public final class DoubleTapLike {
    /** Counted under the patch's name for each double tap kept from liking. */
    static final String HELD_BACK = "double tap like held back";

    /** The source Facebook's double-tap handlers hand the reel like helper, a literal in its code. */
    static final String DOUBLE_TAP = "DOUBLE_TAP";

    private DoubleTapLike() {
    }

    /**
     * Injection point, after the gesture view reads its double-tap handler, where a double tap is
     * about to be handed to it. Null while the switch is on, so the view skips the hand-over as it
     * does for a player with no double-tap like; otherwise the handler as it was read.
     */
    @Nullable
    public static Object handler(@Nullable Object handler) {
        HookStatus.invoked(FamilyNames.DOUBLE_TAP_LIKE);
        return handler != null && holdingBack("double tap handler", true) ? null : handler;
    }

    /**
     * Injection point, after the gesture view's heart reads the same handler. Null while the switch
     * is on, so no heart plays. Not counted: the same double tap goes on to {@link #handler}.
     */
    @Nullable
    public static Object heart(@Nullable Object handler) {
        HookStatus.invoked(FamilyNames.DOUBLE_TAP_LIKE);
        return handler != null && holdingBack("double tap heart", false) ? null : handler;
    }

    /**
     * Injection point, after the reel like helper's double-tap like looks up its key for the reel.
     * Null while the switch is on, so it returns before telling the reel's sidebar or liking the
     * reel itself.
     */
    @Nullable
    public static Object likeKey(@Nullable Object key) {
        HookStatus.invoked(FamilyNames.DOUBLE_TAP_LIKE);
        return key != null && holdingBack("double tap like", true) ? null : key;
    }

    /**
     * Injection point, first thing in the reel like helper's like. True when [source] says a
     * double tap sent it and the switch is on, so the helper returns without liking. The Like
     * button's source, and any other, is never held back.
     */
    public static boolean holdBackLike(@Nullable String source) {
        HookStatus.invoked(FamilyNames.DOUBLE_TAP_LIKE);
        return DOUBLE_TAP.equals(source) && holdingBack("double tap like source", true);
    }

    /**
     * Injection point, first thing in the double tap of a feed attachment that plays its own
     * heart. True while the switch is on, so the attachment answers the tap unhandled, as it does
     * when its double-tap like is off.
     */
    public static boolean holdBackTap() {
        HookStatus.invoked(FamilyNames.DOUBLE_TAP_LIKE);
        return holdingBack("attachment double tap", true);
    }

    /**
     * Whether the switch holds this double tap back, counted when [count] says this is the point
     * where the double tap stops. Never throws: a failure is reported and Facebook's path taken.
     */
    private static boolean holdingBack(String where, boolean count) {
        try {
            if (!Utils.settingsReady() || !Settings.TURN_OFF_DOUBLE_TAP_LIKE.get()) return false;
            if (count) {
                HookStatus.counted(FamilyNames.DOUBLE_TAP_LIKE, HELD_BACK);
                Logger.printDebug(() -> "Double tap like: held back at the " + where);
            }
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DOUBLE_TAP_LIKE, where, failure);
            return false;
        }
    }
}
