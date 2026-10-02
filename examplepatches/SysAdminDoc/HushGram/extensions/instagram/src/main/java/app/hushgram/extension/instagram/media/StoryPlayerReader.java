/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.media;

import androidx.annotation.Nullable;

/**
 * Reads the IgGrootPlayer the story viewer's video player plays, for Tap to play's story release.
 *
 * <p>Apart from {@link TapToPlay} for the reason {@link ReelStateReader} is: a stub the phone's
 * verifier refused would take the class Instagram's player calls on every start down with it. Only
 * {@link TapToPlay#resumeHeldStory} reaches this class, inside its try.
 */
final class StoryPlayerReader {
    private StoryPlayerReader() { }

    /**
     * Filled in by the patch: the story player's IgGrootPlayer, null before it has one, or
     * {@link TapToPlay#NOT_PATCHED} while the stub is unfilled.
     */
    @Nullable
    static Object grootOf(Object storyPlayer) {
        return TapToPlay.NOT_PATCHED;
    }
}
