package io.github.liongalahad.nuviotv.extension.ratings.ratingsvisibility;

import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsRuntime;

/** Stable rating-policy facade for injected hooks and focused unit tests. */
public final class Extension {
    private Extension() {}

    public static Float filterOverallRating(Float rating) {
        return MorpheSettingsRuntime.filterOverallRating(rating);
    }

    public static Double filterEpisodeRating(Double rating, boolean watched) {
        return MorpheSettingsRuntime.filterEpisodeRating(rating, watched);
    }
}
