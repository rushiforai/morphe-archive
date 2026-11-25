package patches.maps.gearslip;

import java.util.Locale;

/**
 * Decides whether the navigation card's status line may carry the vehicle's state of charge and
 * remaining range, and how that suffix reads. Deliberately free of Android types so the rules are
 * unit-testable on the JVM.
 */
public final class BydEtaText {
    private static final String SEPARATOR = " · ";
    private static final String[] ETA_TOKENS = {"min", "km", "mi", "hr"};

    private BydEtaText() {
    }

    /** True when {@code text} reads like a navigation status ("12 min · 5.2 km") rather than a message. */
    public static boolean looksLikeEta(String text) {
        if (text == null || text.isEmpty()) {
            return false;
        }
        boolean digit = false;
        for (int i = 0; i < text.length() && !digit; i++) {
            digit = Character.isDigit(text.charAt(i));
        }
        if (!digit) {
            return false;
        }
        String lower = text.toLowerCase(Locale.ROOT);
        for (String token : ETA_TOKENS) {
            if (lower.contains(token)) {
                return true;
            }
        }
        return false;
    }

    /** "62% · 310 km", "310 km", "62%", or "" when neither value is known. */
    public static String suffix(int soc, int rangeKm, String unit) {
        StringBuilder out = new StringBuilder();
        if (soc >= 0) {
            out.append(soc).append('%');
        }
        if (rangeKm >= 0) {
            if (out.length() > 0) {
                out.append(SEPARATOR);
            }
            out.append(rangeKm).append(' ').append(unit == null || unit.isEmpty() ? "km" : unit);
        }
        return out.toString();
    }

    /** The original status text with the vehicle suffix appended, or the original untouched. */
    public static String decorate(String original, int soc, int rangeKm, String unit) {
        if (original == null || original.isEmpty() || !looksLikeEta(original)) {
            return original;
        }
        String suffix = suffix(soc, rangeKm, unit);
        return suffix.isEmpty() ? original : original + SEPARATOR + suffix;
    }

    /** Fixed values used by the anchor-verification build only. */
    public static String decorateMarker(String original) {
        return decorate(original, 62, 310, "km");
    }

    /**
     * The battery percentage expected on arrival: the current charge minus what the remaining
     * distance costs, using the car's own km-per-percent as the rate. Returns -1 when the inputs
     * cannot answer the question, so callers can fall back to the current charge.
     */
    public static int arrivalPercent(int soc, int rangeKm, double remainingKm) {
        if (soc <= 0 || soc > 100) return -1;
        if (rangeKm <= 0) return -1;
        if (!Double.isFinite(remainingKm) || remainingKm < 0) return -1;
        double kmPerPercent = (double) rangeKm / soc;
        double cost = remainingKm / kmPerPercent;
        long arrival = Math.round(soc - cost);
        if (arrival < 0) arrival = 0;
        return (int) Math.min(arrival, soc);
    }

    /** "62%" or "arrive 41%": one percentage, never a distance. */
    public static String percentage(int value) {
        return value + "%";
    }

    /** The arrival suffix appended to the ETA line, or "" when nothing can be estimated. */
    public static String arrivalSuffix(int arrivalPercent) {
        return arrivalPercent < 0 ? "" : " · arrive " + arrivalPercent + "%";
    }

    /**
     * True when the route is longer than the car's remaining range, so any arrival figure would be
     * a guess at how far short you stop rather than a charge on arrival.
     */
    public static boolean beyondRange(int rangeKm, double remainingKm) {
        if (rangeKm <= 0) return false;
        if (!Double.isFinite(remainingKm) || remainingKm < 0) return false;
        return remainingKm >= rangeKm;
    }

    /**
     * The ETA line carrying the battery expected on arrival, or the current charge when the
     * distance is unknown. Non-navigation messages and unknown values are left untouched.
     */
    public static String withArrival(String original, int soc, int arrivalPercent) {
        if (original == null || original.isEmpty() || !looksLikeEta(original)) return original;
        if (arrivalPercent >= 0) return original + arrivalSuffix(arrivalPercent);
        if (soc >= 0) return original + SEPARATOR + percentage(soc);
        return original;
    }

    /** Kilometres from a distance in {@code unit}; -1 when the unit is not a distance. */
    public static double kilometres(double value, String unit) {
        if (!Double.isFinite(value) || value < 0) return -1;
        String normalised = unit == null ? "km" : unit.trim().toLowerCase(Locale.ROOT);
        switch (normalised) {
            case "km": case "kilometre": case "kilometres": case "kilometer": case "kilometers":
                return value;
            case "mi": case "mile": case "miles":
                return value * 1.609344;
            case "m": case "metre": case "metres": case "meter": case "meters":
                return value / 1000.0;
            case "ft": case "foot": case "feet":
                return value * 0.0003048;
            default:
                return -1;
        }
    }
}
