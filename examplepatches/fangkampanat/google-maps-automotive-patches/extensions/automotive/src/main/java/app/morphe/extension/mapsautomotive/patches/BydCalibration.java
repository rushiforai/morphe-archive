package app.morphe.extension.mapsautomotive.patches;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;

/**
 * The "adjusted" model for Maps (from 0.1.6, the only model): BYD's table with two
 * values measured on this car.
 * <ul>
 * <li>Auxiliary power (A/C and electronics), sent as Maps' drain at time and at temperature: the battery power while
 * standing, per temperature knot ({@link BydModelParts#AUX_KNOTS_C}). Power = BYD's statistic current (raw − 5000 =
 * 0.1 A, discharge positive) × the cells' mean voltage × a pack factor fitted against the BMS energy. BYD's own drain at
 * time starts at 0 W; the Dolphin draws about 850 W with the A/C on from the first minute (a drive on 2026-11-07). A knot
 * not measured yet takes the measured ones (between two, linear in temperature; beyond them, the nearest); BYD's drain at
 * temperature only while none is measured: the car's A/C drew 911–1,008 W from 26 to 35 °C on 2026-11-07, where BYD's
 * table falls from 1,170 W at 36 °C to 267 W at 24 °C.</li>
 * <li>A traction factor on the road load and the drivetrain losses, measured against Maps itself on routes that had the
 * adjusted model: between two forecasts of the same route, the battery used less the measured auxiliary energy over the
 * time between them, over the change of Maps' remaining traction energy, (battery − arrival) less the auxiliary power Maps
 * was sent times its remaining time. Maps' computation is not our replica of it (one drive: Maps 4 % low on the highway leg
 * where the replica was 4–6 % high), so the replica is not used. Routes with BYD's table are not used either: when Maps'
 * drain at time (from 0 W) starts is not known, and the adjusted model's is flat.</li>
 * </ul>
 * The battery energy over a stretch is the BMS energy Maps had at each forecast (100 Wh steps, which telescope over a
 * route to its ends). The current, read every 10 s, is too coarse for that while driving (a drive on 2026-11-07: ±11 % per
 * 1.5 kWh against the BMS), though fine for the standing power and the pack factor. While Maps forecasts a route (guidance
 * or a route preview) the values sent are frozen, so every forecast of a route comes from one model; new values apply from
 * the next route. Routes with more than one stop are not used, nor a stretch shortly after a model change or one whose
 * distance does not match the odometer, one with a speed reading missing, or one with the car charging (standing with
 * current into the battery, or the battery rising while standing). A stretch where the car stood or crept (under 200 m
 * by its speed readings, or the odometer did not move) counts its battery but none of Maps' change: Maps re-prices its
 * route while the car stands (one drive: −222 Wh while the car crept at the route start, +89 Wh at a light; ±90–175 Wh at
 * stops on every trip), and leaving such a stretch out would move its BMS step into the next one.
 * <p>
 * Plain Java without Android APIs, so the JVM probe and the PC replay run it. Thread-safe: the worker feeds readings,
 * Maps' sender thread the forecasts, the dialog and the report read the status. Never throws for odd input.
 */
final class BydCalibration {
    static final String HEADER = "# morphe byd calibration v1";
    /**
     * The rules the saved traction evidence was measured with, the s line's third field: 1 (a test build that writes none
     * and ignores it, so it still loads the file) BMS steps with Maps' re-pricing at standstill, 2 the 10 s current with
     * standing stretches left out, 3 BMS steps with Maps' change at standstill not counted. Evidence from other rules
     * is cleared on load.
     */
    static final int RULES = 3;
    /** BYD's statistic current: raw − this is 0.1 A, discharge positive (measured on the Dolphin). */
    static final int CURRENT_ZERO_RAW = 5000;
    static final double AMPS_PER_RAW = 0.1;
    /** The pack factor (pack voltage over the cells' mean voltage) counts within these bounds once this much BMS energy was compared. */
    static final double MIN_PACK_FACTOR = 60, MAX_PACK_FACTOR = 250, PACK_MIN_WH = 5000, PACK_HALVE_WH = 60000;
    static final long MAX_GAP_MS = 30000;
    static final double MOVING_KMH = 1.0;
    /** A rise of this much while standing is charging; a BMS change larger than the step limit in one interval is a misreading. */
    static final int CHARGE_RISE_WH = 300, MAX_STEP_WH = 300;
    /** Standing power above this (W) is not auxiliary power (V2L loads); below the cell minimum (W per cell, about 100 W) the car is off or charging. */
    static final double MAX_AUX_W = 6000, MIN_AUX_CELL_W = 1.0;
    /**
     * A standing mean above this (W) is not taken as the car's A/C and electronics: the prior (the other measured
     * temperatures, else BYD's value) stays. The current scale above was measured on the Dolphin, whose highest mean is
     * about 1,030 W; another model's scale may differ.
     */
    static final double PLAUSIBLE_AUX_W = 2500;
    /** Raw current outside this range (±500 A) is not a reading (BYD error codes such as -10011). */
    static final int MIN_CURRENT_RAW = 0, MAX_CURRENT_RAW = 10000;
    /** Standing seconds at a knot: the prior counts as this much, a knot is learned from this much, its sums halve above this. */
    static final double AUX_PRIOR_S = 300, AUX_LEARNED_S = 600, AUX_HALVE_S = 4 * 3600;
    /** The traction factor: shrunk toward 1 by this much traction energy (Wh), bounded, its sums halved above this. */
    static final double FACTOR_PRIOR_WH = 8000, MIN_FACTOR = 0.85, MAX_FACTOR = 1.25, FACTOR_HALVE_WH = 40000;
    /** A forecast stretch: at most this long, its distance within max(500 m, 10 %) of the odometer's. */
    static final long MAX_SEGMENT_MS = 300000;
    static final int SEGMENT_SLACK_M = 500;
    static final double SEGMENT_SLACK_SHARE = 0.10;
    /**
     * A stretch where the car moved less than this by its speed readings, or the odometer (0.1 km steps) less than this, is
     * standing: its battery counts, Maps' change does not.
     */
    static final double MIN_MOVED_M = 200;
    static final int MIN_PROGRESS_M = 100;
    /** The distance at a forecast comes from a reading at most this old (readings every 10 s). */
    static final long EXTRAPOLATE_MS = 15000;
    /** A route's evidence counts when the battery used over its moving stretches is at least this (BMS steps are 100 Wh). */
    static final double ROUTE_MIN_WH = 1000;
    /** No forecast for this long ends a route. */
    static final long ROUTE_TIMEOUT_MS = 10 * 60000L;
    /** A model sent this shortly before a forecast may not have reached it. */
    static final long MODEL_SETTLE_MS = 30000;
    /** Readings this close to a forecast give its odometer. */
    static final long NEAR_MS = 30000;
    static final int UNKNOWN = Integer.MIN_VALUE;
    private static final int KNOTS = BydModelParts.AUX_KNOTS_C.length;

    /** One reading; unknown values keep their defaults. */
    static final class Reading {
        long wall, elapsed;
        int energyWh = -1;
        double soc = Double.NaN;
        int mileage01km = -1;
        double speedKmh = Double.NaN;
        int outsideC = UNKNOWN;
        int currentRaw = UNKNOWN, vmaxMv = UNKNOWN, vminMv = UNKNOWN;
        Boolean acOn;
        int massKg;
    }

    /** A snapshot for the dialog and the report. */
    static final class Status {
        double packFactor = Double.NaN, packWh;
        final double[] auxW = new double[KNOTS], auxMinutes = new double[KNOTS];
        final boolean[] auxLearned = new boolean[KNOTS];
        double auxOffW = Double.NaN, auxOffMinutes;
        /** The standing means as measured, also the ones above the plausible limit, which are not used; NaN without one. */
        final double[] auxMeasuredW = new double[KNOTS];
        double auxOffMeasuredW = Double.NaN;
        double factor = 1, factorRaw = Double.NaN, tractionWh, km, lastRouteRatio = Double.NaN;
        int routes;
        boolean route, seeded;
        /** The factor sent now (frozen during a route). */
        double sentFactor = 1;
        String describe;
    }

    // The values sent during a route.
    private static final class Frozen {
        final double factor, auxOffW, tempC;
        final double[] auxW;
        final boolean[] learned;
        final Boolean acOn;

        Frozen(double factor, double[] auxW, boolean[] learned, double auxOffW, double tempC, Boolean acOn) {
            this.factor = factor;
            this.auxW = auxW;
            this.learned = learned;
            this.auxOffW = auxOffW;
            this.tempC = tempC;
            this.acOn = acOn;
        }

        BydModelParts.Params params() {
            return new BydModelParts.Params(1, 1, 1, 1, auxW, learned, auxOffW, 0);
        }
    }

    // One forecast with what Maps had then.
    private static final class Forecast {
        long wall;
        int arrivalWh, distanceM, timeS, batteryWh, mileage01km;
        String signature;
        long signatureSince;
        boolean table;
        double auxAssumedW, auxTrueW, factor;
        // The distance by speed at the forecast (NaN without a recent reading); the intervals without a speed and the
        // charging readings so far.
        double movedM;
        long speedBreaks, charging;
    }

    private final BydModelParts.Params prior;
    private final String identity;
    // The pack factor: BMS energy and current × cell voltage, Wh.
    private double packBmsWh, packCellWh;
    // Standing time (s) and current × cell voltage × time (W·s) per knot, the A/C on or unknown; and with the A/C off.
    private final double[] knotS = new double[KNOTS], knotCellWs = new double[KNOTS];
    private double offS, offCellWs;
    // The traction factor's evidence: actual traction energy, Maps' traction at factor 1, distance; routes used.
    private double actualTractionWh, mapsTractionWh, evidenceKm, lastRouteRatio = Double.NaN;
    private int routes;
    private boolean seeded;
    // Transient: the chain of readings.
    private Reading last;
    // Transient: the distance by speed (m), the last reading's speed, the intervals it could not integrate (no speed, a
    // gap, the first reading of a chain), and the readings standing with current into the battery (charging).
    private double movedM, lastSpeedKmh = Double.NaN;
    private long speedBreaks, chargingReadings;
    private int standingMinWh = -1;
    private boolean charging;
    // Transient: the model sent.
    private String signature = "";
    private long signatureSince;
    private boolean table = true;
    private double sentFactor = 1;
    // Transient: the route.
    private boolean route;
    private long lastForecastWall;
    private Frozen frozen;
    private Forecast previous;
    private double routeActualWh, routeMovingWh, routePredictedWh, routeKm, routeActualTractionWh, routeMapsTractionWh;
    private int routeStretches, routeStanding;
    private boolean changed;
    private int seedReadings, seedForecasts;
    private final List<String> notes = new ArrayList<>();

    /** A fresh calibration; {@code prior} gives the table's auxiliary power at each knot, {@code identity} the table. */
    BydCalibration(BydModelParts.Params prior, String identity) {
        this.prior = prior;
        this.identity = identity == null ? "" : identity;
    }

    /** From {@link #save()}'s text; a fresh one with a note when the text is not this version or is damaged. Never throws. */
    static BydCalibration load(String saved, BydModelParts.Params prior, String identity) {
        BydCalibration fresh = new BydCalibration(prior, identity);
        if (saved == null) return fresh;
        BydCalibration loaded = new BydCalibration(prior, identity);
        try {
            String[] lines = saved.split("\n");
            if (!HEADER.equals(lines[0].trim())) throw new IllegalArgumentException("header");
            String storedIdentity = null;
            boolean factorLine = false, seededLine = false;
            int rules = 1;
            for (int i = 1; i < lines.length; i++) {
                String line = lines[i].trim();
                if (line.isEmpty()) continue;
                String[] v = line.split(",", -1);
                switch (v[0]) {
                    case "t":
                        storedIdentity = v.length > 1 ? v[1] : "";
                        break;
                    case "p":
                        loaded.packBmsWh = number(v, 1);
                        loaded.packCellWh = number(v, 2);
                        break;
                    case "k":
                        int knot = Integer.parseInt(v[1]);
                        loaded.knotS[knot] = nonNegative(v, 2);
                        loaded.knotCellWs[knot] = nonNegative(v, 3);
                        break;
                    case "o":
                        loaded.offS = nonNegative(v, 1);
                        loaded.offCellWs = nonNegative(v, 2);
                        break;
                    case "f":
                        loaded.actualTractionWh = number(v, 1);
                        loaded.mapsTractionWh = nonNegative(v, 2);
                        loaded.evidenceKm = nonNegative(v, 3);
                        loaded.routes = Integer.parseInt(v[4]);
                        loaded.lastRouteRatio = "nan".equals(v[5]) ? Double.NaN : number(v, 5);
                        factorLine = true;
                        break;
                    case "s":
                        loaded.seeded = "1".equals(v[1]);
                        rules = v.length > 2 ? Integer.parseInt(v[2].trim()) : 1;
                        seededLine = true;
                        break;
                    default:
                        throw new IllegalArgumentException("line " + v[0]);
                }
            }
            if (storedIdentity == null || !factorLine || !seededLine) throw new IllegalArgumentException("incomplete");
            if (!storedIdentity.equals(loaded.identity)) {
                // The factor is relative to the table's traction: another table starts it again.
                loaded.clearFactor();
                loaded.notes.add("calib_table_changed;factor_cleared");
            } else if (rules != RULES) {
                // Evidence measured with other rules (1: Maps' re-pricing at standstill counted; 2: the 10 s current)
                // is not mixed in. The auxiliary power and the pack factor are measured the same way and stay.
                boolean had = loaded.mapsTractionWh > 0 || loaded.routes > 0;
                loaded.clearFactor();
                loaded.changed = true;
                if (had) loaded.notes.add("calib_rules_changed;rules=" + rules + "->" + RULES + ";factor_cleared");
            }
            return loaded;
        } catch (RuntimeException error) {
            fresh.notes.add("calib_load_failed;" + error.getClass().getSimpleName() + ":" + error.getMessage());
            fresh.changed = true;
            return fresh;
        }
    }

    synchronized String save() {
        StringBuilder out = new StringBuilder(HEADER).append('\n');
        out.append("t,").append(identity.replace(',', ';').replace('\n', ' ')).append('\n');
        out.append("p,").append(packBmsWh).append(',').append(packCellWh).append('\n');
        for (int i = 0; i < KNOTS; i++) out.append("k,").append(i).append(',').append(knotS[i]).append(',').append(knotCellWs[i]).append('\n');
        out.append("o,").append(offS).append(',').append(offCellWs).append('\n');
        out.append("f,").append(actualTractionWh).append(',').append(mapsTractionWh).append(',').append(evidenceKm).append(',')
                .append(routes).append(',').append(Double.isNaN(lastRouteRatio) ? "nan" : String.valueOf(lastRouteRatio)).append('\n');
        out.append("s,").append(seeded ? 1 : 0).append(',').append(RULES).append('\n');
        return out.toString();
    }

    /** True once after a change worth saving. */
    synchronized boolean takeChanged() {
        boolean was = changed;
        changed = false;
        return was;
    }

    synchronized List<String> drainNotes() {
        List<String> out = new ArrayList<>(notes);
        notes.clear();
        return out;
    }

    /** Every 10 s reading, in order. */
    synchronized void observe(Reading r) {
        if (r == null) return;
        if (route && r.wall - lastForecastWall > ROUTE_TIMEOUT_MS) endRoute("timeout");
        Reading p = last;
        last = r;
        lastSpeedKmh = r.speedKmh;
        if (known(r.speedKmh) && r.speedKmh < MOVING_KMH && cellPower(r) < -MIN_AUX_CELL_W) chargingReadings++;
        if (p == null) {
            speedBreaks++;
            return;
        }
        long dt = r.elapsed - p.elapsed;
        // The distance by speed, to tell standing stretches.
        if (dt > 0 && dt <= MAX_GAP_MS && known(p.speedKmh) && known(r.speedKmh)) {
            movedM += Math.max(0, p.speedKmh + r.speedKmh) / 2 / 3.6 * dt / 1000.0;
        } else {
            speedBreaks++;
        }
        if (dt <= 0 || dt > MAX_GAP_MS || p.energyWh < 0 || r.energyWh < 0) {
            standingMinWh = -1;
            charging = false;
            return;
        }
        boolean standing = known(p.speedKmh) && known(r.speedKmh) && p.speedKmh < MOVING_KMH && r.speedKmh < MOVING_KMH;
        if (standing) {
            standingMinWh = standingMinWh < 0 ? Math.min(p.energyWh, r.energyWh) : Math.min(standingMinWh, Math.min(p.energyWh, r.energyWh));
            if (r.energyWh - standingMinWh >= CHARGE_RISE_WH) charging = true;
        } else {
            standingMinWh = -1;
            charging = false;
        }
        int dE = r.energyWh - p.energyWh;
        if (charging || Math.abs(dE) > MAX_STEP_WH) return;
        double pc = cellPower(p), rc = cellPower(r);
        if (Double.isNaN(pc) || Double.isNaN(rc)) return;
        double cellW = (pc + rc) / 2;
        changed = true;
        packBmsWh += -dE;
        packCellWh += cellW * dt / 3600000.0;
        if (packBmsWh > PACK_HALVE_WH) {
            packBmsWh /= 2;
            packCellWh /= 2;
        }
        double pack = packFactor();
        double ceiling = MAX_AUX_W / (Double.isNaN(pack) ? MIN_PACK_FACTOR : pack);
        if (standing && pc >= MIN_AUX_CELL_W && rc >= MIN_AUX_CELL_W && p.outsideC != UNKNOWN && cellW <= ceiling) {
            double seconds = dt / 1000.0;
            if (Boolean.FALSE.equals(p.acOn)) {
                offS += seconds;
                offCellWs += cellW * seconds;
                if (offS > AUX_HALVE_S) {
                    offS /= 2;
                    offCellWs /= 2;
                }
            } else {
                double[] weights = BydModelParts.knotWeights(p.outsideC);
                for (int i = 0; i < KNOTS; i++) {
                    if (weights[i] == 0) continue;
                    knotS[i] += weights[i] * seconds;
                    knotCellWs[i] += weights[i] * cellW * seconds;
                    if (knotS[i] > AUX_HALVE_S) {
                        knotS[i] /= 2;
                        knotCellWs[i] /= 2;
                    }
                }
            }
        }
    }

    /**
     * Each of Maps' energy forecasts: empty when guidance ends; the arrival energy at the last stop
     * ({@link #UNKNOWN} when it has none), the distance and time to it; the battery when it came, −1 when unknown.
     */
    synchronized void onForecast(long wall, boolean empty, int stops, int arrivalWh, int distanceM, int timeS, int batteryWh) {
        if (route && wall - lastForecastWall > ROUTE_TIMEOUT_MS) endRoute("timeout");
        if (empty) {
            endRoute("ended");
            return;
        }
        if (!route) startRoute(wall);
        lastForecastWall = wall;
        if (stops != 1 || arrivalWh == UNKNOWN) {
            previous = null;
            return;
        }
        Forecast c = new Forecast();
        c.wall = wall;
        c.arrivalWh = arrivalWh;
        c.distanceM = distanceM;
        c.timeS = timeS;
        c.batteryWh = batteryWh;
        c.mileage01km = last != null && Math.abs(wall - last.wall) <= NEAR_MS ? last.mileage01km : -1;
        c.movedM = movedAt(wall);
        c.speedBreaks = speedBreaks;
        c.charging = chargingReadings;
        c.signature = signature;
        c.signatureSince = signatureSince;
        c.table = table;
        double temp = last != null && last.outsideC != UNKNOWN ? last.outsideC : Double.NaN;
        Boolean acOn = last != null ? last.acOn : null;
        c.auxTrueW = Double.isNaN(temp) ? Double.NaN : auxWattsLocked(temp, acOn);
        // What Maps was sent (the table's is not used: its drain at time).
        c.auxAssumedW = Double.isNaN(temp) || table ? Double.NaN
                : frozen != null ? frozen.params().auxWatts(temp, frozen.acOn) : c.auxTrueW;
        c.factor = table ? 1 : sentFactor;
        if (previous != null) stretch(previous, c);
        previous = c;
    }

    /**
     * What Maps receives now: BYD's table ({@link BydModelParts.Sent#table}) when {@code adjusted} is false, else the
     * measured auxiliary power and the traction factor (frozen during a route). Also notes the model for the forecasts.
     */
    synchronized BydModelParts.Sent model(boolean adjusted, int massKg, double tempC, Boolean acOn, long wall) {
        if (!adjusted) {
            sent(true, 1, "T:" + massKg, wall);
            return BydModelParts.Sent.table(1);
        }
        Frozen values = route && frozen != null ? frozen : current(tempC, acOn);
        double temp = Double.isNaN(values.tempC) ? tempC : values.tempC;
        BydModelParts.Sent sent = BydModelParts.Sent.learned(values.params(), values.factor, temp, values.acOn, 0, Double.NaN);
        sent(false, values.factor, "A:" + massKg + ":" + values.factor + ":" + Arrays.toString(sent.drainTotals) + ":"
                + Arrays.toString(sent.drainAtTime[1]), wall);
        return sent;
    }

    /** The table went to Maps after all (the adjusted model failed to encode). */
    synchronized void modelFailed(int massKg, long wall) {
        sent(true, 1, "T:" + massKg, wall);
    }

    /** The measured auxiliary power (W) at a temperature now, the prior where not learned. */
    synchronized double auxWatts(double tempC, Boolean acOn) {
        return auxWattsLocked(tempC, acOn);
    }

    /** The traction factor from the evidence so far (1 without any). */
    synchronized double factor() {
        return factorLocked();
    }

    synchronized Status status() {
        Status s = new Status();
        double pack = packFactor();
        s.packFactor = pack;
        s.packWh = packBmsWh;
        for (int i = 0; i < KNOTS; i++) {
            s.auxW[i] = knotWatts(i, pack);
            s.auxMinutes[i] = knotS[i] / 60;
            s.auxLearned[i] = learned(i, pack);
            s.auxMeasuredW[i] = Double.isNaN(pack) || !(knotS[i] > 0) ? Double.NaN : measuredWatts(i, pack);
        }
        s.auxOffW = offWatts(pack);
        s.auxOffMinutes = offS / 60;
        s.auxOffMeasuredW = Double.isNaN(pack) || !(offS > 0) ? Double.NaN : pack * offCellWs / offS;
        s.factor = factorLocked();
        s.factorRaw = mapsTractionWh > 0 ? actualTractionWh / mapsTractionWh : Double.NaN;
        s.tractionWh = mapsTractionWh;
        s.km = evidenceKm;
        s.routes = routes;
        s.lastRouteRatio = lastRouteRatio;
        s.route = route;
        s.seeded = seeded;
        s.sentFactor = sentFactor;
        s.describe = describeLocked();
        return s;
    }

    /** Clears the auxiliary power and the factor (the pack factor, a property of the sensors, is kept). */
    synchronized void reset() {
        Arrays.fill(knotS, 0);
        Arrays.fill(knotCellWs, 0);
        offS = offCellWs = 0;
        clearFactor();
        // The open route's stretches are dropped, not counted.
        routeStretches = 0;
        endRoute("reset");
        notes.add("calib_reset");
        changed = true;
    }

    synchronized boolean seeded() {
        return seeded;
    }

    /**
     * Replays drive records (BydDriveLog's S and F lines, oldest first) into a calibration that has not been seeded:
     * readings and forecasts as they came, with the model tag of each S line (no adjusted values in it: BYD's table). Lines
     * that do not parse are skipped. Afterwards the chain and route start again from the next live reading.
     */
    synchronized void seed(List<String> lines) {
        for (String line : lines) seedLine(line);
        finishSeed();
    }

    /** One line of {@link #seed}; call {@link #finishSeed} after the last. Ignored once seeded. */
    synchronized void seedLine(String line) {
        if (seeded || line == null) return;
        try {
            if (line.startsWith("S,")) {
                String[] v = line.split(",", -1);
                if (v.length < 12) return;
                Reading r = parseReading(v);
                // BYD's table: one model per mass (its drain at time no longer matters 30 min into a route). The
                // adjusted model's values are not in the tag in full, so its forecasts are not replayed.
                boolean adjustedTag = v[11].contains(":A");
                sent(!adjustedTag, 1, adjustedTag ? "" : "T:" + r.massKg, r.wall);
                observe(r);
                seedReadings++;
            } else if (line.startsWith("F,")) {
                String[] v = line.split(",", -1);
                if (v.length < 9) return;
                long wall = Long.parseLong(v[1]);
                int battery = v[2].isEmpty() ? -1 : Integer.parseInt(v[2]);
                int stops = v[4].isEmpty() ? 0 : Integer.parseInt(v[4]);
                int arrival = v[5].isEmpty() ? UNKNOWN : Integer.parseInt(v[5]);
                int distance = v[6].isEmpty() ? 0 : Integer.parseInt(v[6]);
                int time = v[7].isEmpty() ? 0 : Integer.parseInt(v[7]);
                // As BydForecast.Forecast.isEmpty for 0 or 1 stop (the line has only the last stop's arrival).
                onForecast(wall, stops == 0 || stops == 1 && arrival == UNKNOWN, stops, arrival, distance, time, battery);
                seedForecasts++;
            }
        } catch (RuntimeException ignored) {
            // A damaged line.
        }
    }

    /** Ends a replay: the route and chain start again from the next live reading. */
    synchronized void finishSeed() {
        if (seeded) return;
        endRoute("seed");
        last = null;
        standingMinWh = -1;
        charging = false;
        signature = "";
        seeded = true;
        changed = true;
        notes.add(String.format(Locale.ROOT, "calib_seed;readings=%d;forecasts=%d;routes=%d;%s", seedReadings, seedForecasts,
                routes, describeLocked()));
    }

    /** Marks the calibration seeded without records (none on the car). */
    synchronized void markSeeded() {
        if (seeded) return;
        seeded = true;
        changed = true;
    }

    /** One S line's reading: "S,wall,elapsed,energy,soc,mileage,speed,outside,battery_temp,altitude,signals,model". */
    static Reading parseReading(String[] v) {
        Reading r = new Reading();
        r.wall = Long.parseLong(v[1]);
        r.elapsed = Long.parseLong(v[2]);
        r.energyWh = v[3].isEmpty() ? -1 : Integer.parseInt(v[3]);
        r.soc = v[4].isEmpty() ? Double.NaN : Double.parseDouble(v[4]);
        r.mileage01km = v[5].isEmpty() ? -1 : Integer.parseInt(v[5]);
        r.speedKmh = v[6].isEmpty() ? Double.NaN : Double.parseDouble(v[6]);
        r.outsideC = v[7].isEmpty() ? UNKNOWN : Integer.parseInt(v[7]);
        for (String pair : v[10].split("\\|")) {
            int at = pair.indexOf('=');
            if (at <= 0) continue;
            String key = pair.substring(0, at), value = pair.substring(at + 1);
            if ("current".equals(key)) r.currentRaw = integer(value);
            else if ("vmax".equals(key)) r.vmaxMv = integer(value);
            else if ("vmin".equals(key)) r.vminMv = integer(value);
            else if ("acstate".equals(key)) r.acOn = acState(value);
        }
        int mass = v[11].lastIndexOf(":m");
        if (mass >= 0) {
            int end = mass + 2;
            while (end < v[11].length() && Character.isDigit(v[11].charAt(end))) end++;
            if (end > mass + 2) r.massKg = Integer.parseInt(v[11].substring(mass + 2, end));
        }
        return r;
    }

    /** BYD's A/C state (BydSignalProbe's "acstate"): 1 on, 0 off, anything else unknown. */
    static Boolean acState(String value) {
        if ("1".equals(value)) return Boolean.TRUE;
        if ("0".equals(value)) return Boolean.FALSE;
        return null;
    }

    /** A signal value as an int, {@link #UNKNOWN} when it is not one ("unavailable"). */
    static int integer(String value) {
        try {
            return Integer.parseInt(value.trim());
        } catch (RuntimeException error) {
            return UNKNOWN;
        }
    }

    // --- internals, called with the lock held ---

    private void sent(boolean tableSent, double factor, String newSignature, long wall) {
        table = tableSent;
        sentFactor = factor;
        if (!newSignature.equals(signature)) {
            signature = newSignature;
            signatureSince = wall;
        }
    }

    private Frozen current(double tempC, Boolean acOn) {
        double pack = packFactor();
        double[] aux = new double[KNOTS];
        boolean[] learnedKnots = new boolean[KNOTS];
        for (int i = 0; i < KNOTS; i++) {
            aux[i] = knotWatts(i, pack);
            learnedKnots[i] = learned(i, pack);
        }
        return new Frozen(factorLocked(), aux, learnedKnots, offWatts(pack), tempC, acOn);
    }

    private void startRoute(long wall) {
        route = true;
        lastForecastWall = wall;
        previous = null;
        routeActualWh = routeMovingWh = routePredictedWh = routeKm = routeActualTractionWh = routeMapsTractionWh = 0;
        routeStretches = routeStanding = 0;
        double temp = last != null && last.outsideC != UNKNOWN ? last.outsideC : Double.NaN;
        frozen = current(temp, last != null ? last.acOn : null);
    }

    private void endRoute(String why) {
        if (!route) return;
        route = false;
        frozen = null;
        previous = null;
        if (routeStretches == 0) return;
        boolean used = routeMovingWh >= ROUTE_MIN_WH && routeMapsTractionWh > 0;
        if (used) {
            actualTractionWh += routeActualTractionWh;
            mapsTractionWh += routeMapsTractionWh;
            evidenceKm += routeKm;
            while (mapsTractionWh > FACTOR_HALVE_WH) {
                actualTractionWh /= 2;
                mapsTractionWh /= 2;
                evidenceKm /= 2;
            }
            routes++;
            lastRouteRatio = routePredictedWh > 0 ? routeActualWh / routePredictedWh : Double.NaN;
        }
        notes.add(String.format(Locale.ROOT,
                "calib_route;end=%s;used=%b;stretches=%d;standing=%d;km=%.1f;actual_wh=%.0f;maps_wh=%.0f;traction_wh=%.0f/%.0f;ratio=%.3f;%s",
                why, used, routeStretches, routeStanding, routeKm, routeActualWh, routePredictedWh, routeActualTractionWh,
                routeMapsTractionWh, routePredictedWh > 0 ? routeActualWh / routePredictedWh : Double.NaN, describeLocked()));
        changed = true;
    }

    private void stretch(Forecast p, Forecast c) {
        long dt = c.wall - p.wall;
        if (dt <= 0 || dt > MAX_SEGMENT_MS || p.batteryWh < 0 || c.batteryWh < 0) return;
        // The adjusted model for both forecasts, one model, sent well before the first.
        if (p.table || c.table || !p.signature.equals(c.signature) || p.signatureSince != c.signatureSince || p.signature.isEmpty()
                || p.signatureSince > p.wall - MODEL_SETTLE_MS) return;
        if (p.mileage01km < 0 || c.mileage01km < p.mileage01km) return;
        if (Double.isNaN(p.auxAssumedW) || Double.isNaN(c.auxAssumedW) || Double.isNaN(p.auxTrueW) || Double.isNaN(c.auxTrueW)) return;
        // The distance by speed must be whole (a missing speed would read as standing), and no charging in between.
        double moved = c.movedM - p.movedM;
        if (Double.isNaN(moved) || c.speedBreaks != p.speedBreaks || c.charging != p.charging) return;
        double progress = (c.mileage01km - p.mileage01km) * 100.0, drop = p.distanceM - (double) c.distanceM;
        if (Math.abs(drop - progress) > Math.max(SEGMENT_SLACK_M, SEGMENT_SLACK_SHARE * progress)) return;
        double predicted = (p.batteryWh - (double) p.arrivalWh) - (c.batteryWh - (double) c.arrivalWh);
        double actual = p.batteryWh - (double) c.batteryWh;
        if (predicted < -1000 || predicted > 5000 || actual < -1000 || actual > 5000) return;
        // Maps' remaining traction at each forecast: its remaining use less the auxiliary power it was sent over its remaining
        // time (a temperature change re-prices the whole rest of the route, not only this stretch).
        double mapsTraction = (predicted - p.auxAssumedW * p.timeS / 3600.0 + c.auxAssumedW * c.timeS / 3600.0) / p.factor;
        double actualTraction = actual - (p.auxTrueW + c.auxTrueW) / 2 * dt / 3600000.0;
        // Standing or creeping, by the speed readings (the odometer comes from a reading up to 10 s before each forecast and
        // ticks every 100 m, so a stretch right after the car stopped can show the last 250 m before the stop, and a 78 m creep
        // a tick): Maps' change is its re-pricing, not traction; the battery still counts, so its BMS step stays here. A
        // battery that rose while standing is charging without a current reading: left out.
        if (moved < MIN_MOVED_M || progress < MIN_PROGRESS_M) {
            if (actual < 0) return;
            mapsTraction = 0;
            predicted = (p.auxAssumedW + c.auxAssumedW) / 2 * dt / 3600000.0;
            routeStanding++;
        } else {
            routeMovingWh += actual;
        }
        routeActualTractionWh += actualTraction;
        routeMapsTractionWh += mapsTraction;
        routeActualWh += actual;
        routePredictedWh += predicted;
        routeKm += progress / 1000;
        routeStretches++;
    }

    // The distance by speed at a forecast: to the last reading, then at that reading's speed (none when unknown).
    private double movedAt(long wall) {
        if (last == null || Math.abs(wall - last.wall) > EXTRAPOLATE_MS) return Double.NaN;
        return movedM + (known(lastSpeedKmh) ? Math.max(0, lastSpeedKmh) / 3.6 * (wall - last.wall) / 1000.0 : 0);
    }

    private void clearFactor() {
        actualTractionWh = mapsTractionWh = evidenceKm = 0;
        routes = 0;
        lastRouteRatio = Double.NaN;
    }

    private double cellPower(Reading r) {
        if (r.currentRaw == UNKNOWN || r.vmaxMv == UNKNOWN || r.vminMv == UNKNOWN) return Double.NaN;
        if (r.currentRaw < MIN_CURRENT_RAW || r.currentRaw > MAX_CURRENT_RAW) return Double.NaN;
        if (r.vmaxMv < 2000 || r.vmaxMv > 5000 || r.vminMv < 2000 || r.vminMv > 5000) return Double.NaN;
        return (r.currentRaw - CURRENT_ZERO_RAW) * AMPS_PER_RAW * (r.vmaxMv + r.vminMv) / 2000.0;
    }

    private double packFactor() {
        if (packBmsWh < PACK_MIN_WH || !(packCellWh > 0)) return Double.NaN;
        double factor = packBmsWh / packCellWh;
        return factor >= MIN_PACK_FACTOR && factor <= MAX_PACK_FACTOR ? factor : Double.NaN;
    }

    private double knotWatts(int i, double pack) {
        double priorW = knotPrior(i, pack);
        // A mean above the plausible limit is not this car's auxiliary power: the prior alone.
        if (Double.isNaN(pack) || implausible(i, pack)) return priorW;
        return (pack * knotCellWs[i] + priorW * AUX_PRIOR_S) / (knotS[i] + AUX_PRIOR_S);
    }

    // A knot's prior: the other measured knots (between two, linear in temperature; beyond them, the nearest); with none, a
    // measured knot's own mean, else BYD's drain at temperature (and without a pack factor).
    private double knotPrior(int i, double pack) {
        if (Double.isNaN(pack)) return prior.auxKnot(i);
        int below = -1, above = -1;
        for (int j = i - 1; j >= 0 && below < 0; j--) if (measured(j, pack)) below = j;
        for (int j = i + 1; j < KNOTS && above < 0; j++) if (measured(j, pack)) above = j;
        // No other knot measured: a measured knot stands on its own (so it is not below the neighbours that take it), an
        // unmeasured one keeps BYD's value.
        if (below < 0 && above < 0) return measured(i, pack) ? measuredWatts(i, pack) : prior.auxKnot(i);
        if (below < 0) return measuredWatts(above, pack);
        if (above < 0) return measuredWatts(below, pack);
        double tb = BydModelParts.AUX_KNOTS_C[below], ta = BydModelParts.AUX_KNOTS_C[above], ti = BydModelParts.AUX_KNOTS_C[i];
        double wb = measuredWatts(below, pack);
        return wb + (measuredWatts(above, pack) - wb) * (ti - tb) / (ta - tb);
    }

    // A measured knot's own mean power (W), without its prior.
    private double measuredWatts(int j, double pack) {
        return pack * knotCellWs[j] / knotS[j];
    }

    // Enough standing time at the knot, and a mean that can be auxiliary power.
    private boolean measured(int j, double pack) {
        return knotS[j] >= AUX_LEARNED_S && measuredWatts(j, pack) <= PLAUSIBLE_AUX_W;
    }

    private boolean implausible(int j, double pack) {
        return knotS[j] > 0 && measuredWatts(j, pack) > PLAUSIBLE_AUX_W;
    }

    private boolean learned(int i, double pack) {
        return !Double.isNaN(pack) && measured(i, pack);
    }

    private double offWatts(double pack) {
        if (Double.isNaN(pack) || offS < AUX_LEARNED_S) return Double.NaN;
        double watts = pack * offCellWs / offS;
        return watts <= PLAUSIBLE_AUX_W ? watts : Double.NaN;
    }

    private double auxWattsLocked(double tempC, Boolean acOn) {
        double pack = packFactor();
        double off = offWatts(pack);
        if (Boolean.FALSE.equals(acOn) && !Double.isNaN(off)) return off;
        double[] weights = BydModelParts.knotWeights(tempC);
        double sum = 0;
        for (int i = 0; i < KNOTS; i++) sum += weights[i] * knotWatts(i, pack);
        return sum;
    }

    private double factorLocked() {
        if (!(mapsTractionWh > 0)) return 1;
        double raw = actualTractionWh / mapsTractionWh;
        double shrunk = 1 + (raw - 1) * mapsTractionWh / (mapsTractionWh + FACTOR_PRIOR_WH);
        return Math.max(MIN_FACTOR, Math.min(MAX_FACTOR, shrunk));
    }

    private String describeLocked() {
        double pack = packFactor();
        StringBuilder aux = new StringBuilder();
        for (int i = 0; i < KNOTS; i++) {
            if (i > 0) aux.append(',');
            aux.append(Math.round(knotWatts(i, pack))).append(learned(i, pack) ? "*" : "");
        }
        double off = offWatts(pack);
        return String.format(Locale.ROOT, "pack=%s/%.0fWh;aux=%s;off=%s;factor=%.3f(raw=%s,maps_traction=%.0fWh,km=%.1f,routes=%d)",
                Double.isNaN(pack) ? "none" : String.format(Locale.ROOT, "%.1f", pack), packBmsWh, aux,
                Double.isNaN(off) ? "none" : String.valueOf(Math.round(off)), factorLocked(),
                mapsTractionWh > 0 ? String.format(Locale.ROOT, "%.3f", actualTractionWh / mapsTractionWh) : "none",
                mapsTractionWh, evidenceKm, routes);
    }

    private static boolean known(double value) {
        return !Double.isNaN(value) && !Double.isInfinite(value);
    }

    private static double number(String[] v, int index) {
        double value = Double.parseDouble(v[index]);
        if (Double.isNaN(value) || Double.isInfinite(value)) throw new IllegalArgumentException("number");
        return value;
    }

    private static double nonNegative(String[] v, int index) {
        double value = number(v, index);
        if (value < 0) throw new IllegalArgumentException("negative");
        return value;
    }
}
