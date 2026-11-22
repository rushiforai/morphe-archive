package app.template.extension.alerts;

import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;

final class ReleaseAlert {
    final LocalDate date;
    final String type;
    final String label;
    final String countryCode;
    final String country;
    final String note;

    ReleaseAlert(LocalDate date, String type, String label, String countryCode, String country, String note) {
        this.date = date;
        this.type = type;
        this.label = label;
        this.countryCode = countryCode;
        this.country = country;
        this.note = note;
    }

    String key() {
        return date + "\n" + type + "\n" + countryCode + "\n" + note;
    }

    String description() {
        return withLocation(label);
    }

    String message() {
        switch (type) {
            case "Digital": return withLocation("Released online");
            case "Premiere": return description();
            default: return withLocation(label + " release");
        }
    }

    private String withLocation(String text) {
        if (!country.isEmpty()) text += " in " + country;
        if (!note.isEmpty()) text += " · " + note;
        return text;
    }

    static Instant trigger(LocalDate date, Instant now, ZoneId zone) {
        if (date.isBefore(now.atZone(zone).toLocalDate())) return null;
        Instant morning = date.atTime(9, 0).atZone(zone).toInstant();
        return morning.isBefore(now) ? now : morning;
    }
}
