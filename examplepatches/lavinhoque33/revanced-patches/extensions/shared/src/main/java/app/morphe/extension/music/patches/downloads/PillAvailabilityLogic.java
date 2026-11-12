/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-09.
 */
package app.morphe.extension.music.patches.downloads;

import androidx.annotation.Nullable;

import java.util.function.Predicate;

/** What {@link PillAvailability} decides. Pure rules, so they can be tested without Android. */
final class PillAvailabilityLogic {
    private PillAvailabilityLogic() {}

    /**
     * The video that has a video copy: the one being played, else the one the last player response was for.
     *
     * @param playing  The id of the video being played, empty when none.
     * @param response The id of the last player response, empty when none.
     * @param hasCopy  Whether a video id has a committed video copy.
     * @return The id, or null when neither has a copy.
     */
    @Nullable
    static String videoWithCopy(@Nullable String playing, @Nullable String response, Predicate<String> hasCopy) {
        if (namesCopy(playing, hasCopy)) return playing;

        return namesCopy(response, hasCopy) ? response : null;
    }

    /**
     * An answer of the app's own checks, true for available, stays true; a false one is overruled for a video with a
     * copy and only for it.
     */
    static boolean opens(boolean appsAnswer, boolean videoHasCopy) {
        return appsAnswer || videoHasCopy;
    }

    private static boolean namesCopy(@Nullable String videoId, Predicate<String> hasCopy) {
        return videoId != null && !videoId.isEmpty() && hasCopy.test(videoId);
    }
}
