/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.media;

import androidx.annotation.Nullable;

/**
 * Reads the state of the reel a tap landed on, for Tap to play's Reels tap.
 *
 * <p>It asks the tap's navigator for its ClipsVideoPlayerController, the controller for the view
 * holder of the reel on screen and the player it has for that holder, and the player for its state,
 * the way the controller's own accessors reach it. Each step is a stub the patch fills in. A stub
 * works in its own parameters, since the build compiles its {@code return} into its parameter's
 * register and leaves it no local to lend.
 *
 * <p>The stubs live here and not in {@link TapToPlay}, which Instagram's player calls on every
 * start: a stub the phone's verifier refused would take the whole class down with it. Only
 * {@link TapToPlay#resumeOnTap} reaches this class, inside its try.
 */
final class ReelStateReader {
    private ReelStateReader() { }

    /**
     * IgVideoPlayerImpl's state enum for the reel on screen, null when there's no reel or no player
     * for it, or {@link TapToPlay#NOT_PATCHED} while the stubs are unfilled.
     */
    @Nullable
    static Object reelState(Object navigator) {
        Object controller = controllerOf(navigator);
        if (controller == TapToPlay.NOT_PATCHED) return TapToPlay.NOT_PATCHED;
        if (controller == null) return null;
        Object holder;
        try {
            holder = holderOf(controller);
        } catch (IllegalStateException gone) {
            // The controller's accessor throws "Required value was null." once the Reels view it
            // reads through a weak reference is gone. That's no reel, not a broken hook.
            return null;
        }
        if (holder == null) return null;
        Object players = playersOf(controller);
        if (players == null) return null;
        Object player = playerFor(players, holder);
        return player == null ? null : stateOf(player);
    }

    /** Filled in by the patch: the ClipsVideoPlayerController the navigator's Function0 field hands over. */
    @Nullable
    static Object controllerOf(Object navigator) {
        return TapToPlay.NOT_PATCHED;
    }

    /** Filled in by the patch: the controller's view holder of the reel on screen, or null. */
    @Nullable
    static Object holderOf(Object controller) {
        return TapToPlay.NOT_PATCHED;
    }

    /** Filled in by the patch: the controller's players, by holder, or null. */
    @Nullable
    static Object playersOf(Object controller) {
        return TapToPlay.NOT_PATCHED;
    }

    /** Filled in by the patch: the player [players] has for [holder], or null. */
    @Nullable
    static Object playerFor(Object players, Object holder) {
        return TapToPlay.NOT_PATCHED;
    }

    /** Filled in by the patch: the player's state enum. */
    static Object stateOf(Object player) {
        return TapToPlay.NOT_PATCHED;
    }
}
