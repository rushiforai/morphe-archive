package local.maps.cluster;

/**
 * BYD switches Android's system night mode with the centre-screen theme. Maps applies its own night
 * override to every Configuration in its process, so the decision uses UiModeManager's mode instead.
 * Automatic mode is resolved like Android's twilight logic: night outside civil twilight at the car's location.
 */
final class ScreenTheme {
    static final int MODE_AUTO = 0, MODE_NO = 1, MODE_YES = 2, MODE_CUSTOM = 3;
    private static final double DAY_MS = 86400000d, J2000_UTC_MS = 946728000000d;
    private static final double CIVIL_TWILIGHT = Math.toRadians(-6), OBLIQUITY = Math.toRadians(23.44);

    /** @param minuteOfDay local time; customStart/customEnd in minutes (custom mode only); lat/lon null when unknown. */
    static boolean night(int mode, long nowUtcMs, int minuteOfDay, int customStart, int customEnd, Double lat, Double lon) {
        if (mode == MODE_NO) return false;
        if (mode == MODE_YES) return true;
        if (mode == MODE_CUSTOM) return inWindow(minuteOfDay, customStart, customEnd);
        if (lat != null && lon != null) return twilightNight(nowUtcMs, lat, lon);
        return inWindow(minuteOfDay, 18 * 60, 6 * 60); // No location yet: night 18:00-06:00.
    }

    static boolean inWindow(int minute, int start, int end) {
        return start <= end ? minute >= start && minute < end : minute >= start || minute < end;
    }

    /** Sunrise equation with civil-twilight altitude; polar day/night handled by the hour-angle bounds. */
    static boolean twilightNight(long nowUtcMs, double latitude, double longitude) {
        double days = (nowUtcMs - J2000_UTC_MS) / DAY_MS;
        double cycle = Math.round(days - 0.0009 + longitude / 360);
        double approxNoon = cycle + 0.0009 - longitude / 360;
        double anomaly = Math.toRadians((357.5291 + 0.98560028 * approxNoon) % 360);
        double center = Math.toRadians(1.9148 * Math.sin(anomaly) + 0.02 * Math.sin(2 * anomaly) + 0.0003 * Math.sin(3 * anomaly));
        double eclipticLongitude = anomaly + center + Math.toRadians(180 + 102.9372);
        double noon = approxNoon + 0.0053 * Math.sin(anomaly) - 0.0069 * Math.sin(2 * eclipticLongitude);
        double declination = Math.asin(Math.sin(eclipticLongitude) * Math.sin(OBLIQUITY));
        double lat = Math.toRadians(latitude);
        double cosHour = (Math.sin(CIVIL_TWILIGHT) - Math.sin(lat) * Math.sin(declination)) / (Math.cos(lat) * Math.cos(declination));
        if (cosHour >= 1) return true;   // Sun stays below the twilight altitude all day.
        if (cosHour <= -1) return false; // Sun stays above it all day.
        double halfDay = Math.acos(cosHour) / (2 * Math.PI);
        double sunrise = J2000_UTC_MS + (noon - halfDay) * DAY_MS, sunset = J2000_UTC_MS + (noon + halfDay) * DAY_MS;
        return nowUtcMs < sunrise || nowUtcMs >= sunset;
    }
}
