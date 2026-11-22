package app.template.extension.alerts;

import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;

public final class ReleaseAlertTest {
    public static void main(String[] args) {
        ZoneId pacific = ZoneId.of("America/Los_Angeles");
        LocalDate release = LocalDate.of(2026, 11, 15);
        Instant morning = Instant.parse("2026-11-15T17:00:00Z");
        Instant afternoon = Instant.parse("2026-11-15T22:00:00Z");

        equal(morning, ReleaseAlert.trigger(release, morning.minusSeconds(1), pacific));
        equal(afternoon, ReleaseAlert.trigger(release, afternoon, pacific));
        equal(null, ReleaseAlert.trigger(release, Instant.parse("2026-11-16T08:00:00Z"), pacific));
        equal(Instant.parse("2026-11-15T14:00:00Z"),
                ReleaseAlert.trigger(release, morning.minusSeconds(86400), ZoneId.of("America/New_York")));

        ReleaseAlert online = new ReleaseAlert(release, "Digital", "Digital", "US", "United States", "");
        ReleaseAlert theater = new ReleaseAlert(release, "Theatrical", "Theatrical", "US", "United States", "");
        ReleaseAlert festival = new ReleaseAlert(release, "Premiere", "Premiere", "CA", "Canada", "Festival");
        if (online.key().equals(theater.key()) || theater.key().equals(festival.key())) {
            throw new AssertionError("Same-day releases must be independently selectable");
        }
        equal("Released online in United States", online.message());
        equal("Theatrical release in United States", theater.message());
        equal("Premiere in Canada · Festival", festival.message());
    }

    private static void equal(Object expected, Object actual) {
        if (!java.util.Objects.equals(expected, actual)) {
            throw new AssertionError("Expected " + expected + ", got " + actual);
        }
    }
}
