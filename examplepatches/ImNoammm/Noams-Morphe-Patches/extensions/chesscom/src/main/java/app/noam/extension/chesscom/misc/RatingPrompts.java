package app.noam.extension.chesscom.misc;

import app.noam.extension.chesscom.Features;

public final class RatingPrompts {
    private RatingPrompts() {}

    /** False while No rating prompts is on: the app then never decides to ask. */
    public static boolean allowed() {
        return !(Features.noRatingPromptsPatched() && Features.isEnabled(Features.NO_RATING_PROMPTS));
    }
}
