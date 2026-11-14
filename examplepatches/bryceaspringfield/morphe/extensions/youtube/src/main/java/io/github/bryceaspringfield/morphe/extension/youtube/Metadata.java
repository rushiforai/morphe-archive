package io.github.bryceaspringfield.morphe.extension.youtube;

import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Reads a feed item's metadata line from its readable text (lowercase): the view count ("1.2m views", "1,2 mil
 * visualizaciones"), the age ("3 years ago", "hace 2 semanas"), and the badges for members-only and upcoming videos.
 * English and Spanish, the languages of the bundle's strings.
 */
final class Metadata {

    private static final Pattern VIEWS = Pattern.compile(
            "(?<![\\w.,])(\\d{1,3}(?:[.,]\\d{3})+|\\d+(?:[.,]\\d+)?)\\s*"
                    + "(k|m|b|thousand|million|billion|mil millones|millones|millón|mil)?\\s*(?:de\\s+)?"
                    + "(?:views?|visualizaciones|reproducciones|vistas)");
    private static final Pattern NO_VIEWS = Pattern.compile("(?:^|[\\s•·])(?:no views|sin visualizaciones|sin reproducciones)");
    private static final Pattern AGE_EN = Pattern.compile(
            "(\\d+)\\s*(second|minute|hour|day|week|month|year)s?\\s+ago");
    private static final Pattern AGE_ES = Pattern.compile(
            "hace\\s+(\\d+)\\s*(segundo|minuto|hora|d[ií]a|semana|mes|a[ñn]o)(?:s|es)?");
    /** A badge is a whole line (or a whole piece of a line joined by bullets), never words inside a title. */
    private static final Pattern MEMBERS = Pattern.compile(
            "(?:^|[\\n•·])\\s*(?:members only|members-only|solo para miembros|exclusivo para miembros)\\s*(?:$|[\\n•·])");
    private static final Pattern UPCOMING = Pattern.compile(
            "(?:^|[\\s•·])(?:scheduled for\\s+\\S|premieres\\s+(?:in|on|at|today|tomorrow|\\d)|upcoming(?:$|\\s*[•·])"
                    + "|programado para\\s+\\S|se estrena(?:rá)?\\s+(?:en|el|hoy|mañana|\\d))");

    /**
     * A course (a playlist YouTube labels "Course" in place of a view count, e.g., YaleCourses' "Financial Theory") states
     * the label as a string of its own on the card layout, inside its byline ("Jazz For Soul · Course · Updated today")
     * on the classic layout, and its count as "79 lessons" (seen on Home, 2026-11-13).
     */
    private static final Pattern COURSE = Pattern.compile(
            "(?:(?<=[\\x00-\\x1f])|[·•] )(?:Course|Curso|Cours|Kurs|Corso)(?:(?![\\p{L} ])| [·•])"
                    + "|(?<=[\\x00-\\x1f])(?:Course|Curso|Cours|Kurs|Corso) [·•] "
                    + "|(?<![\\w])\\d+ (?:lessons|lecciones|leçons|Lektionen|lezioni|lições)(?![\\p{L}])");
    private static final Pattern TYPED_VIEWS = Pattern.compile("^\\s*(\\d+(?:[.,]\\d+)?)\\s*(k|m|b|thousand|million|billion)?\\s*$");
    private static final Pattern TYPED_AGE = Pattern.compile("^\\s*(\\d+(?:[.,]\\d+)?)\\s*(d|w|m|y)?[a-z]*\\s*$");

    private Metadata() {
    }

    /** The view count the text states, or -1 where it states none (live streams state watchers, not views). */
    static long views(String text) {
        if (text == null) return -1;
        if (NO_VIEWS.matcher(text).find()) return 0;
        Matcher m = VIEWS.matcher(text);
        if (!m.find()) return -1;
        return scale(m.group(1), m.group(2));
    }

    static long scale(String number, String unit) {
        try {
            String n = number;
            double v;
            // "1.234" and "1,234" with three digits after a separator are thousands; "1.2" and "1,2" are decimals.
            if (n.matches("\\d{1,3}(?:[.,]\\d{3})+")) v = Double.parseDouble(n.replaceAll("[.,]", ""));
            else v = Double.parseDouble(n.replace(',', '.'));
            String u = unit == null ? "" : unit;
            switch (u) {
                case "k": case "thousand": case "mil": v *= 1e3; break;
                case "m": case "million": case "millón": case "millones": v *= 1e6; break;
                case "b": case "billion": case "mil millones": v *= 1e9; break;
                default: break;
            }
            return Math.round(v);
        } catch (NumberFormatException e) {
            return -1;
        }
    }

    /** The age in days the text states ("3 years ago", "hace 2 semanas"), or -1 where it states none. */
    static double ageDays(String text) {
        if (text == null) return -1;
        Matcher m = AGE_EN.matcher(text);
        if (m.find()) return days(Integer.parseInt(m.group(1)), m.group(2));
        m = AGE_ES.matcher(text);
        if (m.find()) return days(Integer.parseInt(m.group(1)), m.group(2));
        return -1;
    }

    private static double days(int n, String unit) {
        String u = unit.toLowerCase(Locale.ROOT);
        if (u.startsWith("second") || u.startsWith("segundo")) return n / 86400.0;
        if (u.startsWith("minute") || u.startsWith("minuto")) return n / 1440.0;
        if (u.startsWith("hour") || u.startsWith("hora")) return n / 24.0;
        if (u.startsWith("d")) return n;
        if (u.startsWith("week") || u.startsWith("semana")) return n * 7.0;
        if (u.startsWith("month") || u.equals("mes")) return n * 30.44;
        return n * 365.25;
    }

    /** Whether an item's raw buffer text (its protobuf strings, cased as stated) labels it a course. */
    static boolean isCourse(String raw) {
        return raw != null && COURSE.matcher(raw).find();
    }

    static boolean membersOnly(String text) {
        return text != null && MEMBERS.matcher(text).find();
    }

    static boolean upcoming(String text) {
        return text != null && UPCOMING.matcher(text).find();
    }

    /** A number of views typed by the user: 5000, 5k, 1.5m, 2 million; blank or unreadable is -1. */
    static long parseViews(String raw) {
        if (raw == null) return -1;
        Matcher m = TYPED_VIEWS.matcher(raw.toLowerCase(Locale.ROOT));
        if (!m.matches()) return -1;
        return scale(m.group(1).replace(',', '.'), m.group(2));
    }

    /** An age typed by the user: 30 (days), 30d, 8w, 6m (months), 2y; blank or unreadable is -1. */
    static double parseAge(String raw) {
        if (raw == null) return -1;
        Matcher m = TYPED_AGE.matcher(raw.toLowerCase(Locale.ROOT));
        if (!m.matches()) return -1;
        double n = Double.parseDouble(m.group(1).replace(',', '.'));
        String u = m.group(2) == null ? "d" : m.group(2);
        switch (u) {
            case "w": return n * 7;
            case "m": return n * 30.44;
            case "y": return n * 365.25;
            default: return n;
        }
    }
}
