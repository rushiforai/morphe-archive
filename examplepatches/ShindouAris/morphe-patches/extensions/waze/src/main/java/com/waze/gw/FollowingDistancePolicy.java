package com.waze.gw;

/** Advisory distance only; never an estimate of the actual gap to another vehicle. */
final class FollowingDistancePolicy {
    static int resolve(boolean enabled, boolean freeway, int speed, String units, long ageMs) {
        if (!enabled || !freeway || speed <= 0 || ageMs < 0 || ageMs >= 5000 || units == null) return 0;
        double kmh;
        if ("km/h".equalsIgnoreCase(units) || "kph".equalsIgnoreCase(units)) kmh = speed;
        else if ("mph".equalsIgnoreCase(units)) kmh = speed * 1.609344;
        else return 0;
        if (kmh < 60 || kmh > 120) return 0;
        if (kmh <= 60) return 35;
        if (kmh <= 80) return 55;
        if (kmh <= 100) return 70;
        return 100;
    }
}
