package app.morphe.extension.mapsautomotive.patches;

import android.content.Context;
import android.content.SharedPreferences;
import org.json.JSONArray;
import org.json.JSONObject;

import java.util.Locale;

/**
 * Consumption per speed band, measured against BYD's table (data only). Maps uses one
 * model for every route; this shows whether the table is off in town or on the highway before
 * anything sent to Maps changes. Nothing here reaches Maps.
 * <p>
 * Each 10 s interval goes to the band of its mean display speed: city below 60 km/h, mixed 60–80,
 * highway 80 and above. A third band keeps the 60–80 transitions out of the other two instead of
 * splitting them by an assumed share. Per band it adds the BMS energy (net: regeneration while
 * driving counts, as in BydVehicleModel), the odometer distance and the energy the table predicts for
 * the same interval ({@link BydVehicleEnergyFile.Predictor}). Short trips are below the 10 km / 1 kWh
 * that the 100 Wh BMS steps need, so intervals pool per band across trips until a pool reaches both;
 * a finished pool adds measured and predicted energy to the band's totals. The interval checks are
 * BydVehicleModel's: gaps, odometer jumps, a rise while stationary (charging), BMS jumps. Standing
 * still for more than 5 minutes is parking and is not counted. A BMS step lands in the interval where
 * it shows, so a band change can move up to 100 Wh between bands; this evens out over pools.
 * <p>
 * Above 90% SOC the BMS reports more energy per percent (on the Dolphin about 0.78 kWh per 1% at
 * 99–96% against 0.50 in the middle) and the user gets more distance per percent, so those intervals
 * pool in a band of their own at any speed instead of skewing the speed bands. Each whole percent
 * driven through in one chain also adds its energy and distance to "above 90%" or "90% and below",
 * the user's own measure (km per 1%).
 */
final class BydSpeedBands {
    private static final String TAG = "MorpheBydBands";
    private static final int SCHEMA = 1;
    static final int CITY = 0, MIXED = 1, HIGHWAY = 2, ABOVE_90 = 3;
    static final double CITY_BELOW_KMH = 60, HIGHWAY_FROM_KMH = 80;
    /** SOC above this goes to {@link #ABOVE_90} and to the upper per-percent group. */
    static final int HIGH_SOC = 90;
    private static final String[] NAMES = {"city", "mixed", "highway", "above_90"};
    private static final long MAX_GAP_MS = 30000, MAX_PARKED_MS = 300000;
    private static final long POOL_METRES = 10000, POOL_WH = 1000, MAX_POOL_METRES = 100000;
    private static final double MIN_CONSUMPTION = 3, MAX_CONSUMPTION = 60, MOVING_KMH = 1.0;
    private static final int MAX_REGEN_STEP_WH = 300, PERSIST_EVERY = 30;
    // A whole percent outside these is a misreading: 100 Wh BMS steps, about 0.5 kWh and 4 km per 1%.
    private static final int MIN_LEVEL_WH = 100, MAX_LEVEL_WH = 2000, MAX_LEVEL_METRES = 30000;

    private static final class Band {
        long poolMetres, poolMs;
        double poolMeasuredWh, poolPredictedWh, poolSpeedMetres;
        long pools, rejected, totalMetres;
        double totalMeasuredWh, totalPredictedWh;
        double lastMeasured = Double.NaN, lastPredicted = Double.NaN;

        void clearPool() {
            poolMetres = poolMs = 0;
            poolMeasuredWh = poolPredictedWh = poolSpeedMetres = 0;
        }
    }

    /** Whole percents of SOC: how many, their energy and distance. */
    private static final class Levels {
        long count, wh, metres;
    }

    private static SharedPreferences preferences;
    private static final Band[] bands = {new Band(), new Band(), new Band(), new Band()};
    // Per percent: above 90% SOC, then 90% and below.
    private static final Levels[] levels = {new Levels(), new Levels()};
    private static String table;
    private static BydVehicleEnergyFile predictorFile;
    private static BydVehicleEnergyFile.Predictor predictor;
    // The current chain of valid intervals.
    private static long previousAt, chainStart, stationaryMs;
    private static int previousWh, previousMileage;
    private static double previousSoc, previousSpeed;
    private static boolean chained;
    private static int unsaved;
    // The last one-percent drop in this chain: the level it entered (-1: none), its energy and odometer.
    private static int stepLevel = -1, stepWh, stepMileage;

    private BydSpeedBands() { }

    static synchronized void initialize(Context context) {
        if (preferences != null) return;
        try {
            preferences = context.getSharedPreferences("morphe_byd_speed_bands", Context.MODE_PRIVATE);
            String saved = preferences.getString("state", null);
            if (saved == null) return;
            JSONObject state = new JSONObject(saved);
            if (state.getInt("schema") != SCHEMA) return;
            table = state.optString("table", null);
            JSONArray stored = state.getJSONArray("bands");
            for (int i = 0; i < bands.length && i < stored.length(); i++) {
                JSONObject b = stored.getJSONObject(i);
                Band band = bands[i];
                band.poolMetres = b.getLong("pool_m"); band.poolMs = b.getLong("pool_ms");
                band.poolMeasuredWh = b.getDouble("pool_measured_wh"); band.poolPredictedWh = b.getDouble("pool_predicted_wh");
                band.poolSpeedMetres = b.getDouble("pool_speed_m");
                band.pools = b.getLong("pools"); band.rejected = b.getLong("rejected"); band.totalMetres = b.getLong("total_m");
                band.totalMeasuredWh = b.getDouble("total_measured_wh"); band.totalPredictedWh = b.getDouble("total_predicted_wh");
                band.lastMeasured = b.optDouble("last_measured", Double.NaN); band.lastPredicted = b.optDouble("last_predicted", Double.NaN);
            }
            // Older states have three bands and no levels.
            JSONArray storedLevels = state.optJSONArray("levels");
            for (int i = 0; storedLevels != null && i < levels.length && i < storedLevels.length(); i++) {
                JSONObject l = storedLevels.getJSONObject(i);
                levels[i].count = l.getLong("count"); levels[i].wh = l.getLong("wh"); levels[i].metres = l.getLong("m");
            }
        } catch (Throwable error) {
            clear();
            ReportLog.w(TAG, "band state unavailable, starting empty", error);
        }
    }

    /** One sample while BYD's table is used; the mass and outside temperature are the model's. */
    static synchronized void observe(BydEnergyReader.Sample sample, int energyWh, int capacityWh,
                                     BydVehicleEnergyFile file, int massKg, int outsideC) {
        if (!file.name.equals(table)) {
            if (table != null) ReportLog.i(TAG, "bands_reset;reason=table_changed;from=" + table + ";to=" + file.name);
            clear();
            table = file.name;
            persist();
        }
        if (file != predictorFile) {
            predictorFile = file;
            try {
                predictor = file.predictor();
            } catch (RuntimeException error) {
                predictor = null;
                ReportLog.w(TAG, "no prediction from " + file.name + ": " + error);
            }
        }
        if (predictor == null || sample.mileageUnit != 1 || !finite(sample.speedKmh)) { chained = false; return; }
        if (!chained) { start(sample, energyWh); return; }
        long dt = sample.elapsed - previousAt, stepM = (long) (sample.mileage - previousMileage) * 100;
        int rise = energyWh - previousWh;
        boolean moving = stepM > 0 || sample.speedKmh > MOVING_KMH || previousSpeed > MOVING_KMH;
        String invalid = null;
        if (dt <= 0 || dt > MAX_GAP_MS) invalid = "sdk_gap_or_order";
        else if (stepM < 0 || stepM > 282.0 / 3.6 * dt / 1000.0 + 200) invalid = "odometer_discontinuity";
        else if (rise > 0 || sample.soc > previousSoc) {
            if (!moving) invalid = "energy_soc_increase_while_stationary";
            else if (rise > MAX_REGEN_STEP_WH || sample.soc - previousSoc > 1) invalid = "energy_soc_jump_while_moving";
        }
        if (invalid != null) {
            if (!invalid.equals("sdk_gap_or_order")) ReportLog.i(TAG, "band_chain_reset;reason=" + invalid);
            start(sample, energyWh);
            return;
        }
        stationaryMs = moving ? 0 : stationaryMs + dt;
        if (stationaryMs > MAX_PARKED_MS || sample.soc > previousSoc || sample.soc < previousSoc - 1) {
            // Parked, a rise (regeneration at a boundary) or a skipped percent: no whole percent here.
            stepLevel = -1;
        } else if (sample.soc == previousSoc - 1) {
            int entered = (int) sample.soc;
            if (stepLevel == entered + 1) level(entered + 1, stepWh - energyWh, (sample.mileage - stepMileage) * 100L);
            stepLevel = entered; stepWh = energyWh; stepMileage = sample.mileage;
        }
        if (stationaryMs <= MAX_PARKED_MS) {
            double meanKmh = (previousSpeed + sample.speedKmh) / 2;
            int index = previousSoc > HIGH_SOC ? ABOVE_90 : band(meanKmh);
            Band band = bands[index];
            double sinceStart = (previousAt - chainStart) / 1000.0;
            band.poolMetres += stepM;
            band.poolMs += dt;
            band.poolMeasuredWh += previousWh - energyWh;
            band.poolPredictedWh += predictor.intervalWh(previousSpeed, sample.speedKmh, dt / 1000.0, massKg, sinceStart,
                    outsideC, energyWh, capacityWh);
            band.poolSpeedMetres += meanKmh / 3.6 * dt / 1000.0;
            if (band.poolMetres >= POOL_METRES && band.poolMeasuredWh >= POOL_WH) finish(index, massKg, outsideC);
            else if (band.poolMetres > MAX_POOL_METRES) reject(index, "no_energy_in_100_km");
            else if (++unsaved >= PERSIST_EVERY) persist();
        }
        previousAt = sample.elapsed; previousWh = energyWh; previousMileage = sample.mileage;
        previousSoc = sample.soc; previousSpeed = sample.speedKmh;
    }

    /** No sample from BYD's table: the chain ends; pooled data stays. */
    static synchronized void unavailable() {
        chained = false;
    }

    /** With the learning reset in the dialog. */
    static synchronized void reset() {
        clear();
        persist();
        ReportLog.i(TAG, "bands_reset;reason=user");
    }

    static int band(double kmh) {
        return kmh < CITY_BELOW_KMH ? CITY : kmh < HIGHWAY_FROM_KMH ? MIXED : HIGHWAY;
    }

    /** One band for the dialog: finished pools and their totals, and the pool being filled. */
    static final class Status {
        final long pools, rejected;
        final double totalKm, measured, predicted, poolKm;
        Status(Band band) {
            pools = band.pools; rejected = band.rejected; totalKm = band.totalMetres / 1000.0;
            measured = band.totalMetres > 0 ? band.totalMeasuredWh * 100.0 / band.totalMetres : Double.NaN;
            predicted = band.totalMetres > 0 ? band.totalPredictedWh * 100.0 / band.totalMetres : Double.NaN;
            poolKm = band.poolMetres / 1000.0;
        }
        /** Measured over predicted, NaN without a finished pool. */
        double ratio() { return pools > 0 && predicted > 0 ? measured / predicted : Double.NaN; }
    }

    static synchronized Status[] status() {
        return new Status[]{new Status(bands[CITY]), new Status(bands[MIXED]), new Status(bands[HIGHWAY]), new Status(bands[ABOVE_90])};
    }

    /** Whole percents for the dialog: [0] above 90% SOC, [1] 90% and below. */
    static final class LevelStatus {
        final long count;
        /** NaN before the first percent. */
        final double kmPerPercent, kwhPerPercent;
        LevelStatus(Levels l) {
            count = l.count;
            kmPerPercent = l.count > 0 ? l.metres / 1000.0 / l.count : Double.NaN;
            kwhPerPercent = l.count > 0 ? l.wh / 1000.0 / l.count : Double.NaN;
        }
    }

    static synchronized LevelStatus[] levelStatus() {
        return new LevelStatus[]{new LevelStatus(levels[0]), new LevelStatus(levels[1])};
    }

    // One whole percent driven through: from the drop into it to the drop out of it.
    private static void level(int soc, int wh, long metres) {
        boolean usable = wh >= MIN_LEVEL_WH && wh <= MAX_LEVEL_WH && metres > 0 && metres <= MAX_LEVEL_METRES;
        ReportLog.i(TAG, "soc_level;level=" + soc + ";wh=" + wh + ";metres=" + metres + ";group=" + (soc > HIGH_SOC ? "above_90" : "90_and_below")
                + (usable ? "" : ";rejected"));
        if (!usable) return;
        Levels group = levels[soc > HIGH_SOC ? 0 : 1];
        group.count++;
        group.wh += wh;
        group.metres += metres;
        if (++unsaved >= PERSIST_EVERY) persist();
    }

    private static void finish(int index, int massKg, int outsideC) {
        Band band = bands[index];
        double measured = band.poolMeasuredWh * 100.0 / band.poolMetres, predicted = band.poolPredictedWh * 100.0 / band.poolMetres;
        boolean speedConsistent = Math.abs(band.poolSpeedMetres - band.poolMetres) <= Math.max(300, band.poolMetres * 0.20);
        if (!(measured >= MIN_CONSUMPTION && measured <= MAX_CONSUMPTION) || !(predicted > 0)) { reject(index, "consumption_out_of_range"); return; }
        if (!speedConsistent) { reject(index, "speed_distance_mismatch"); return; }
        band.pools++;
        band.totalMetres += band.poolMetres;
        band.totalMeasuredWh += band.poolMeasuredWh;
        band.totalPredictedWh += band.poolPredictedWh;
        band.lastMeasured = measured;
        band.lastPredicted = predicted;
        ReportLog.i(TAG, String.format(Locale.ROOT, "band_pool_finished;band=%s;metres=%d;minutes=%.1f;measured_wh=%.0f;predicted_wh=%.0f"
                        + ";measured_kwh_100km=%.2f;predicted_kwh_100km=%.2f;ratio=%.3f;pools=%d;total_km=%.1f;total_ratio=%.3f"
                        + ";table=%s;mass_kg=%d;outside_c=%d", NAMES[index], band.poolMetres, band.poolMs / 60000.0,
                band.poolMeasuredWh, band.poolPredictedWh, measured, predicted, measured / predicted, band.pools,
                band.totalMetres / 1000.0, band.totalMeasuredWh / band.totalPredictedWh, table, massKg, outsideC));
        band.clearPool();
        persist();
    }

    private static void reject(int index, String reason) {
        Band band = bands[index];
        band.rejected++;
        ReportLog.i(TAG, String.format(Locale.ROOT, "band_pool_rejected;band=%s;reason=%s;metres=%d;measured_wh=%.0f;predicted_wh=%.0f"
                        + ";speed_metres=%.0f", NAMES[index], reason, band.poolMetres, band.poolMeasuredWh,
                band.poolPredictedWh, band.poolSpeedMetres));
        band.clearPool();
        persist();
    }

    private static void start(BydEnergyReader.Sample sample, int energyWh) {
        chained = true;
        chainStart = previousAt = sample.elapsed;
        previousWh = energyWh; previousMileage = sample.mileage;
        previousSoc = sample.soc; previousSpeed = sample.speedKmh;
        stationaryMs = 0;
        stepLevel = -1;
    }

    private static void clear() {
        for (int i = 0; i < bands.length; i++) bands[i] = new Band();
        for (int i = 0; i < levels.length; i++) levels[i] = new Levels();
        chained = false;
        stepLevel = -1;
    }

    private static void persist() {
        unsaved = 0;
        if (preferences == null) return;
        try {
            JSONArray stored = new JSONArray();
            for (Band band : bands) {
                JSONObject b = new JSONObject();
                b.put("pool_m", band.poolMetres); b.put("pool_ms", band.poolMs);
                b.put("pool_measured_wh", band.poolMeasuredWh); b.put("pool_predicted_wh", band.poolPredictedWh);
                b.put("pool_speed_m", band.poolSpeedMetres);
                b.put("pools", band.pools); b.put("rejected", band.rejected); b.put("total_m", band.totalMetres);
                b.put("total_measured_wh", band.totalMeasuredWh); b.put("total_predicted_wh", band.totalPredictedWh);
                // JSON forbids NaN.
                if (finite(band.lastMeasured)) { b.put("last_measured", band.lastMeasured); b.put("last_predicted", band.lastPredicted); }
                stored.put(b);
            }
            JSONObject state = new JSONObject();
            state.put("schema", SCHEMA);
            if (table != null) state.put("table", table);
            state.put("bands", stored);
            JSONArray storedLevels = new JSONArray();
            for (Levels l : levels) {
                JSONObject entry = new JSONObject();
                entry.put("count", l.count); entry.put("wh", l.wh); entry.put("m", l.metres);
                storedLevels.put(entry);
            }
            state.put("levels", storedLevels);
            preferences.edit().putString("state", state.toString()).apply();
        } catch (Throwable error) {
            ReportLog.w(TAG, "band state was not saved", error);
        }
    }

    private static boolean finite(double number) { return !Double.isNaN(number) && !Double.isInfinite(number); }
}
