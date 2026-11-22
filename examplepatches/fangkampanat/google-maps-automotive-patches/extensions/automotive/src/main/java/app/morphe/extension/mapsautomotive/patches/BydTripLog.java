package app.morphe.extension.mapsautomotive.patches;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/**
 * BYD's own trip log for BYD battery: {@value #PATH}, table EnergyConsumption, one row per trip from power-on to power-off
 * (start time, duration in s, distance in km, energy in kWh in 0.1 steps, a deleted flag). On the Dolphin: 392 trips from
 * 2026-08-16 to 11-19, 13.6 kWh/100 km. It gives a car's real consumption from the first day, before any drive with
 * Maps Car: the trips at a mean speed of 20 km/h or more against BYD's table at the same mean speed over the same time
 * ({@link #summarize}). Below 20 km/h the trips are mostly standing with the A/C on.
 * <p>
 * Constant speed leaves out stop-and-go: the Dolphin's ratio is 1.29 while its routes with Maps measured 1.12
 * (BydCalibration), so the calibration takes the log's ratio only part of the way ({@link BydCalibration#LOG_WEIGHT}).
 * <p>
 * Read on DiLink 3 with the storage permission Maps already declares (one "Allow", legacy storage on Android 10), or
 * through the car's ADB ({@link CarAdb#readFile}) on the owner's request; the Android side is in BydTripLogReader. This
 * class is plain Java for the JVM probe.
 */
final class BydTripLog {
    static final String PATH = "/sdcard/energydata/EC_database.db";
    static final String TABLE = "EnergyConsumption";
    /** Trips this recent; at least this long and this fast on average count against the table. */
    static final long WINDOW_MS = 120L * 24 * 3600 * 1000;
    static final double MIN_TRIP_KM = 3, MIN_MEAN_KMH = 20, MAX_MEAN_KMH = 150;
    /** A ratio needs this many such trips and this many km. */
    static final int MIN_TRIPS = 10;
    static final double MIN_KM = 100;
    /** Each trip is priced in steps of this many seconds at its mean speed. */
    static final double STEP_S = 10;

    /** One trip of the log. */
    static final class Trip {
        final long startMs;
        final double seconds, km, kwh;

        Trip(long startMs, double seconds, double km, double kwh) {
            this.startMs = startMs;
            this.seconds = seconds;
            this.km = km;
            this.kwh = kwh;
        }
    }

    /** What the log says: all its recent trips, the ones priced against the table and their ratio (NaN: too few). */
    static final class Summary {
        int trips, used;
        /** Trips that start more than a day after {@code now}: the head unit's clock is behind (not counted). */
        int future;
        double km, kwh, usedKm, usedKwh, tableKwh, ratio = Double.NaN;
        long newestMs;

        double consumption() {
            return km > 0 ? kwh * 100 / km : Double.NaN;
        }

        String describe() {
            return String.format(Locale.ROOT, "trips=%d;km=%.0f;kwh=%.1f;kwh_100km=%.2f;used=%d;used_km=%.0f;used_kwh=%.1f;table_kwh=%.1f;ratio=%s",
                    trips, km, kwh, consumption(), used, usedKm, usedKwh, tableKwh,
                    Double.isNaN(ratio) ? "none" : String.format(Locale.ROOT, "%.3f", ratio)) + (future > 0 ? ";future=" + future : "");
        }

        /** No trip counted, but some lie in the future: the head unit's clock is behind, not the log empty. */
        boolean clockBehind() {
            return trips == 0 && future > 0;
        }
    }

    private BydTripLog() {
    }

    /**
     * The trips of the last {@link #WINDOW_MS} before {@code now}; those of {@link #MIN_TRIP_KM} or more at a mean speed
     * of {@link #MIN_MEAN_KMH}–{@link #MAX_MEAN_KMH} km/h are priced with {@code predictor} (null: no ratio) at their mean
     * speed, with the model's mass and outside temperature, and the ratio is their energy over the table's.
     */
    static Summary summarize(List<Trip> all, BydVehicleEnergyFile.Predictor predictor, double massKg, int outsideC,
                             int energyWh, int capacityWh, long now) {
        Summary s = new Summary();
        for (Trip t : all) {
            if (t.startMs > now + 24 * 3600 * 1000L) {
                s.future++;
                continue;
            }
            if (t.startMs < now - WINDOW_MS) continue;
            if (!(t.km >= 0 && t.km < 2000 && t.kwh >= 0 && t.kwh < 200 && t.seconds >= 0)) continue;
            s.trips++;
            s.km += t.km;
            s.kwh += t.kwh;
            s.newestMs = Math.max(s.newestMs, t.startMs);
            if (predictor == null || t.km < MIN_TRIP_KM || !(t.seconds > 0)) continue;
            double kmh = t.km / (t.seconds / 3600);
            if (kmh < MIN_MEAN_KMH || kmh > MAX_MEAN_KMH) continue;
            double wh = 0;
            for (double at = 0; at < t.seconds; at += STEP_S) {
                wh += predictor.intervalWh(kmh, kmh, Math.min(STEP_S, t.seconds - at), massKg, at, outsideC, energyWh, capacityWh);
            }
            if (!(wh > 0)) continue;
            s.used++;
            s.usedKm += t.km;
            s.usedKwh += t.kwh;
            s.tableKwh += wh / 1000;
        }
        if (s.used >= MIN_TRIPS && s.usedKm >= MIN_KM && s.tableKwh > 0) s.ratio = s.usedKwh / s.tableKwh;
        return s;
    }

    /** Rows as the database gives them: start (s since 1970), duration (s), km, kWh, deleted (0 or 1). */
    static List<Trip> trips(List<double[]> rows) {
        List<Trip> trips = new ArrayList<>();
        for (double[] r : rows) {
            if (r.length < 5 || r[4] != 0) continue;
            trips.add(new Trip((long) (r[0] * 1000), r[1], r[2], r[3]));
        }
        return trips;
    }
}
