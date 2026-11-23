package dev.ytmruskippper.skipper;

import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.regex.Pattern;

final class SkipRules {
    private static final Pattern RUSSIAN = Pattern.compile("[ыэъ]", Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE);
    private static final Pattern UKRAINIAN = Pattern.compile("[іїєґ]", Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE);

    enum Decision {
        KEEP, RUSSIAN_TITLE, BLOCKED_ARTIST, LOOK_UP_ARTISTS
    }

    private SkipRules() {}

    /** The artist lists come first, then the title markers, then the country lookup. */
    static Decision evaluate(String title, List<String> artists) {
        Set<String> keep = SkipperSettings.alwaysKeep();
        Set<String> skip = SkipperSettings.alwaysSkip();
        for (String artist : artists) {
            if (keep.contains(SkipperSettings.normalize(artist))) return Decision.KEEP;
        }
        for (String artist : artists) {
            if (skip.contains(SkipperSettings.normalize(artist))) return Decision.BLOCKED_ARTIST;
        }
        if (SkipperSettings.titleMarkersEnabled() && RUSSIAN.matcher(title).find()) return Decision.RUSSIAN_TITLE;
        if (SkipperSettings.keepUkrainianEnabled() && UKRAINIAN.matcher(title).find()) return Decision.KEEP;
        return SkipperSettings.countryLookupEnabled() && !artists.isEmpty() ? Decision.LOOK_UP_ARTISTS : Decision.KEEP;
    }

    /**
     * MusicBrainz returns an ISO code, or the area name when the artist has no country.
     * A blocked two-letter code also matches its English country name ("RU" matches "Russia").
     *
     * @param blockedCountries Normalized entries, from {@link SkipperSettings#blockedCountries()}.
     */
    static boolean isBlockedCountry(String country, Set<String> blockedCountries) {
        if (country == null || country.isEmpty()) return false;
        String found = SkipperSettings.normalize(country);
        for (String blocked : blockedCountries) {
            if (blocked.equals(found)) return true;
            if (blocked.length() == 2) {
                String name = new Locale("", blocked).getDisplayCountry(Locale.ENGLISH);
                if (SkipperSettings.normalize(name).equals(found)) return true;
            }
        }
        return false;
    }
}
