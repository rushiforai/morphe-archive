package santodan.patches;

import java.time.*;
import java.util.Locale;
import software.santodan.extension.nuviomovierelease.MovieReleaseDate;

public final class VerifyNuvioMovieReleaseDates {
    public static void main(String[] args) {
        Locale.setDefault(Locale.ENGLISH);
        Clock clock = Clock.fixed(Instant.parse("2026-10-08T12:00:00Z"), ZoneId.of("Europe/Lisbon"));
        check("09-Oct-26", MovieReleaseDate.upcomingBadge("2026-10-09", clock));
        for (String value : new String[]{null, "", "2027", "2026-10-08", "2026-10-07", "2026-02-30", "unknown"})
            check(null, MovieReleaseDate.upcomingBadge(value, clock));
        check("08-Oct-26", MovieReleaseDate.upcomingBadge("2026-10-08T15:00:00Z", clock));
        check(null, MovieReleaseDate.upcomingBadge("2026-10-08T12:00:00Z", clock));
        check("09-Oct-26", MovieReleaseDate.upcomingBadge("2026-10-08T23:30:00Z", clock));
        check("09-Oct-26", MovieReleaseDate.upcomingBadge("2026-10-09T01:00:00+02:00", clock));
        check("09-Oct-26", MovieReleaseDate.upcomingBadge("2026-10-09T01:00:00", clock));
        check("09-Oct-26", MovieReleaseDate.upcomingBadge("Release: 2026-10-09", clock));
        check("2026-10-09", MovieReleaseDate.firstKnown("2026", "2026-10-09", clock.getZone()));
        check("2026-10-07", MovieReleaseDate.firstKnown("2026-10-07", "2026-10-09", clock.getZone()));
        check(null, MovieReleaseDate.firstKnown("2026", "2027", clock.getZone()));
        if (!MovieReleaseDate.isPastYearOnly(null, "2025", clock)
            || !MovieReleaseDate.isPastYearOnly(" 2024 ", null, clock)
            || MovieReleaseDate.isPastYearOnly(null, "2026", clock)
            || MovieReleaseDate.isPastYearOnly(null, "2027", clock)
            || MovieReleaseDate.isPastYearOnly(null, "2025-2027", clock)
            || MovieReleaseDate.isPastYearOnly(null, "unknown", clock))
            throw new AssertionError("Past-year lookup suppression is unsafe");
        Clock west = Clock.fixed(clock.instant(), ZoneId.of("America/Los_Angeles"));
        check("09-Oct-26", MovieReleaseDate.upcomingBadge("2026-10-09", west));
        check("08-Oct-26", MovieReleaseDate.upcomingBadge("2026-10-09T00:00:00Z", west));
        System.out.println("PASS: movie release dates, unknown dates, metadata precedence, exact release boundary, and timezone rules");
    }
    private static void check(String expected, String actual) {
        if (!java.util.Objects.equals(expected, actual)) throw new AssertionError("Expected " + expected + ", got " + actual);
    }
}
