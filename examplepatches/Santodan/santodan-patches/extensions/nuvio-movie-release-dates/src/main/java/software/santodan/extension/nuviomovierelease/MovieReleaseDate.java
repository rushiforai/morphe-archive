package software.santodan.extension.nuviomovierelease;

import java.time.*;
import java.time.format.DateTimeFormatter;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Matches Nuvio's release rules: zoned instants, local timestamps, and UTC date-only releases. */
public final class MovieReleaseDate {
    private static final Pattern DATE = Pattern.compile("(?<!\\d)\\d{4}-\\d{2}-\\d{2}(?!\\d)");
    private MovieReleaseDate() {}

    public static String firstKnown(String released, String info, ZoneId zone) {
        if (instant(released, zone) != null) return released.trim();
        return instant(info, zone) == null ? null : info.trim();
    }

    /** A past year is enough to suppress a badge, but never invents an exact release date.
     * Current/future years and ambiguous text still need the catalog's exact date. */
    public static boolean isPastYearOnly(String released, String info, Clock clock) {
        String value = released == null ? "" : released.trim();
        if (!value.matches("(?:19|20)[0-9]{2}")) value = info == null ? "" : info.trim();
        return value.matches("(?:19|20)[0-9]{2}") && Integer.parseInt(value) < LocalDate.now(clock).getYear();
    }

    public static String upcomingBadge(String raw, Clock clock) {
        Instant release = instant(raw, clock.getZone());
        if (release == null || !release.isAfter(clock.instant())) return null;
        LocalDate date;
        String value = raw.trim();
        try { date = LocalDate.parse(value); }
        catch (RuntimeException ignored) {
            Instant explicit = explicit(value);
            if (explicit != null) date = explicit.atZone(clock.getZone()).toLocalDate();
            else {
                try { date = LocalDateTime.parse(value).toLocalDate(); }
                catch (RuntimeException invalid) { date = embedded(value); }
            }
        }
        return date == null ? null : date.format(DateTimeFormatter.ofPattern("dd-MMM-yy", Locale.getDefault()));
    }

    private static Instant instant(String raw, ZoneId zone) {
        if (raw == null || raw.trim().isEmpty()) return null;
        String value = raw.trim();
        Instant explicit = explicit(value);
        if (explicit != null) return explicit;
        try { return LocalDateTime.parse(value).atZone(zone).toInstant(); }
        catch (RuntimeException ignored) { }
        try { return LocalDate.parse(value).atStartOfDay(ZoneOffset.UTC).toInstant(); }
        catch (RuntimeException ignored) { }
        LocalDate date = embedded(value);
        return date == null ? null : date.atStartOfDay(ZoneOffset.UTC).toInstant();
    }

    private static Instant explicit(String value) {
        try { return Instant.parse(value); } catch (RuntimeException ignored) { }
        try { return OffsetDateTime.parse(value).toInstant(); } catch (RuntimeException ignored) { }
        try { return ZonedDateTime.parse(value).toInstant(); } catch (RuntimeException ignored) { return null; }
    }

    private static LocalDate embedded(String value) {
        Matcher matcher = DATE.matcher(value);
        if (!matcher.find()) return null;
        try { return LocalDate.parse(matcher.group()); } catch (RuntimeException ignored) { return null; }
    }
}
