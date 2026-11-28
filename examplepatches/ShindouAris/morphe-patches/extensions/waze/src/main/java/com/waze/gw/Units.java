package com.waze.gw;

import java.util.Locale;

/**
 * Distance units follow Waze: when it shows speed in mph the Mod writes distances in feet and miles. Metric text is
 * still produced by each caller as before, so a caller only asks {@link #imperialDistance} first.
 */
final class Units {
    private static final double METERS_PER_FOOT = 0.3048;
    private static final double METERS_PER_MILE = 1609.344;

    private static volatile boolean imperial;

    private Units() { }

    /** Called with the speed unit Waze reports ("km/h" or "mph"); an empty value keeps the last known system. */
    static void setSpeedUnits(String units) {
        if (units == null || units.length() == 0) return;
        String lower = units.toLowerCase(Locale.US);
        imperial = lower.contains("mph") || lower.contains("mi/h");
    }

    static boolean imperial() {
        return imperial;
    }

    /** The speed unit to print under a speed: "mph" for imperial Waze, otherwise the caller's usual metric label. */
    static String speedUnit(String metricLabel) {
        return imperial ? "mph" : metricLabel;
    }

    /** Whole feet in a distance in meters (for gauges that show a bare number). */
    static int feet(int meters) {
        return (int) Math.round(meters / METERS_PER_FOOT);
    }

    /**
     * "500 ft" / "0.3 mi" ("500FT" / "0.3MI" when {@code compact}) for imperial Waze, or null when Waze is metric
     * (or the distance is unknown) and the caller should write its usual metric text.
     */
    static String imperialDistance(int meters, boolean compact) {
        return imperial ? imperialDistance(meters, compact, true) : null;
    }

    static String imperialDistance(int meters, boolean compact, boolean imperialSystem) {
        if (!imperialSystem || meters < 0) return null;
        String gap = compact ? "" : " ";
        long feet = Math.round(meters / METERS_PER_FOOT);
        if (feet < 1000L) {
            long step = feet >= 100L ? 10L : 5L;
            feet = Math.max(step, Math.round(feet / (double) step) * step);
            return feet + gap + (compact ? "FT" : "ft");
        }
        double miles = meters / METERS_PER_MILE;
        String number = miles < 9.95 ? String.format(Locale.US, "%.1f", miles) : String.valueOf(Math.round(miles));
        return number + gap + (compact ? "MI" : "mi");
    }

    /** Meters in a distance written as "250 m", "1.2 km", "500 ft", "0.3 mi" or "100 yd"; -1 when there is none. */
    static int parseMeters(String text) {
        if (text == null) return -1;
        java.util.regex.Matcher match = java.util.regex.Pattern
                .compile("([0-9]+(?:[.,][0-9]+)?)\\s*(km|mi|ft|yd|m)(?![A-Za-z])", java.util.regex.Pattern.CASE_INSENSITIVE)
                .matcher(text);
        int meters = -1;
        while (match.find()) {
            double value = Double.parseDouble(match.group(1).replace(',', '.'));
            String unit = match.group(2).toLowerCase(Locale.US);
            double factor = "km".equals(unit) ? 1000.0
                    : "mi".equals(unit) ? METERS_PER_MILE
                    : "ft".equals(unit) ? METERS_PER_FOOT
                    : "yd".equals(unit) ? 0.9144 : 1.0;
            meters = (int) (value * factor);
        }
        return meters;
    }
}
