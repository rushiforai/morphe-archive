import app.afterglow.extension.playback.EndTimeFormat;
import java.time.Instant;
import java.util.Locale;
import java.util.TimeZone;

/** Clock boundaries, native timing units, speed changes and locale independence. */
public final class EndTimeFormatTest {
    private static int checks;
    private static void expect(String expected, String actual) {
        checks++;
        if (!expected.equals(actual)) throw new AssertionError(expected + " != " + actual);
    }
    private static String format(String now, long duration, long position, float speed, boolean full, String zone) {
        return EndTimeFormat.format(Instant.parse(now).toEpochMilli(), duration, position, speed,
                full, TimeZone.getTimeZone(zone));
    }
    public static void main(String[] args) {
        expect("3:30 PM", format("2026-11-14T14:50:00Z", 3_600_000, 1_200_000, 1, false, "UTC"));
        expect("15:10", format("2026-11-14T14:50:00Z", 3_600_000, 1_200_000, 2, true, "UTC"));
        expect("15:10", format("2026-11-14T14:50:00Z", 600_000, 0, .5f, true, "UTC"));
        expect("15:30", format("2026-11-14T14:50:00Z", 3_600_000, 1_200_000, 0, true, "UTC"));
        expect("15:30", format("2026-11-14T14:50:00Z", 3_600_000, 1_200_000, Float.NaN, true, "UTC"));
        expect("15:30", format("2026-11-14T14:50:00Z", 3_600_000, 1_200_000, Float.POSITIVE_INFINITY, true, "UTC"));
        expect("12:01 AM", format("2026-11-14T23:59:00Z", 120_000, 0, 1, false, "UTC"));
        expect("00:01", format("2026-11-14T23:59:00Z", 120_000, 0, 1, true, "UTC"));
        expect("12:00 PM", format("2026-11-14T11:59:00Z", 60_000, 0, 1, false, "UTC"));
        expect("1:05 AM", format("2026-11-14T01:00:00Z", 300_000, 0, 1, false, "UTC"));
        expect("01:05", format("2026-11-14T01:00:00Z", 300_000, 0, 1, true, "UTC"));
        // Rounding the two media times separately must not advance this clock into noon.
        expect("11:59 AM", format("2026-11-14T11:59:59.250Z", 1499, 500, 1, false, "UTC"));
        expect("12:00 PM", format("2026-11-14T11:59:59.250Z", 1500, 499, 1, false, "UTC"));
        expect("23:59", format("2026-11-14T00:00:30Z", 60_000, 120_000, 1, true, "UTC"));
        expect("3:01 AM", format("2026-03-08T06:59:00Z", 120_000, 0, 1, false, "America/New_York"));
        expect("01:01", format("2026-11-01T05:59:00Z", 120_000, 0, 1, true, "America/New_York"));
        expect("5:05 AM", format("2026-11-14T11:00:00Z", 300_000, 0, 1, false, "America/Chicago"));
        Locale.setDefault(Locale.FRANCE);
        expect("3:30 PM", format("2026-11-14T14:50:00Z", 3_600_000, 1_200_000, 1, false, "UTC"));
        expect("", format("2026-11-14T14:50:00Z", 0, 0, 1, false, "UTC"));
        expect("", format("2026-11-14T14:50:00Z", -1, 0, 1, false, "UTC"));
        expect("", format("2026-11-14T14:50:00Z", 60_000, -1, 1, false, "UTC"));
        System.out.println("PASS playback end time: " + checks + " checks");
    }
}
