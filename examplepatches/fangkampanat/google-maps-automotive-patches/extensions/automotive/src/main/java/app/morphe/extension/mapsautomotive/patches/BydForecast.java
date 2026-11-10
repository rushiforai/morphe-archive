package app.morphe.extension.mapsautomotive.patches;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/**
 * Maps' battery-on-arrival forecast and the guided drives measured against it (data only), for the BYD battery
 * dialog, the report and the drive records.
 * <p>
 * {@link #parse} reads the VehicleEnergyForecast bytes Maps' forecast sender serializes (proto3, energy_forecast.proto
 * of BYD's DiCarServer): per stop the arrival energy, the distance and time from the previous stop (from the car for
 * the first) and the charging info, the distance to empty and the forecast quality. The deprecated next-stop fields
 * and the data authorizations are skipped like unknown fields, by wire type; malformed bytes throw
 * IllegalArgumentException. {@link Tracker} pairs the forecasts with the battery readings into guided drives: Maps'
 * arrival energy at the first forecast against the battery on arrival.
 * <p>
 * Plain Java without Android APIs, so the JVM probe runs this code. Never sends a forecast anywhere (not to the car,
 * not to Maps' energy provider), does no I/O and logs nothing: the caller logs {@link Tracker#drainNotes} and stores
 * {@link Tracker#save}.
 */
final class BydForecast {
    /** No arrival energy (a valid one may be negative: the stop is out of reach). */
    static final int NO_ENERGY = Integer.MIN_VALUE;
    static final int QUALITY_UNKNOWN = 0, QUALITY_LIVE = 1, QUALITY_NO_TRAFFIC = 2;
    static final String OPEN = "open", ARRIVED = "arrived", ENDED = "ended", CHANGED = "changed", NO_FORECAST = "no_forecast",
            RESTARTED = "restarted";
    /** Guided drives kept besides the open one. */
    static final int KEEP = 20;
    // Protobuf wire types.
    private static final int VARINT = 0, FIXED64 = 1, LENGTH_DELIMITED = 2, START_GROUP = 3, END_GROUP = 4, FIXED32 = 5;
    // VehicleEnergyForecast; skipped: 1 energy_at_next_stop and 4 next_charging_stop (deprecated), 6 data_authorizations.
    private static final int TO_EMPTY = 2, QUALITY = 3, STOP_DETAILS = 5;
    // StopDetails.
    private static final int ARRIVAL_ENERGY = 1, CHARGING_INFO = 2;
    // EnergyAtDistance (3 is reserved); int32, a negative value is a ten-byte varint.
    private static final int DISTANCE = 1, ENERGY = 2, TIME = 4;
    // ChargingStationInfo.
    private static final int MIN_DEPARTURE = 1, MAX_POWER = 2, CHARGE_TIME = 3;
    private static final int MAX_GROUP_DEPTH = 32;

    private BydForecast() { }

    /** One stop; distance and time from the previous stop (from the car for the first). */
    static final class Stop {
        int distanceM, arrivalWh, timeS;
        /** expected_arrival_energy was present; arrivalWh may be negative (out of reach). */
        boolean hasArrival;
        int minDepartureWh, chargePowerW, chargeTimeS;
        /** charging_info was present: Maps expects a charge at this stop. */
        boolean charging;
    }

    static final class Forecast {
        /** {@link #QUALITY_UNKNOWN}, {@link #QUALITY_LIVE} (with live traffic) or {@link #QUALITY_NO_TRAFFIC}. */
        int quality;
        List<Stop> stops = new ArrayList<>();
        /** distance_to_empty's distance, -1: not given (Maps gives it only when the trip would empty the battery). */
        int toEmptyDistanceM = -1;

        /** No stop with an arrival energy: Maps sends this when guidance ends. */
        boolean isEmpty() {
            for (Stop stop : stops) {
                if (stop.hasArrival) return false;
            }
            return true;
        }

        /** To the last stop, summed over the stops. */
        int totalDistanceM() {
            long sum = 0;
            for (Stop stop : stops) sum += stop.distanceM;
            return clamp(sum);
        }

        int totalTimeS() {
            long sum = 0;
            for (Stop stop : stops) sum += stop.timeS;
            return clamp(sum);
        }

        /** The arrival energy at the last stop, {@link #NO_ENERGY} if it has none or there is no stop. */
        int finalArrivalWh() {
            if (stops.isEmpty()) return NO_ENERGY;
            Stop last = stops.get(stops.size() - 1);
            return last.hasArrival ? last.arrivalWh : NO_ENERGY;
        }

        int chargeStops() {
            int count = 0;
            for (Stop stop : stops) {
                if (stop.charging) count++;
            }
            return count;
        }

        /** For a log line: "stops=2 arrive_wh=20100 km=102.3 min=85 quality=live charge_stops=0". */
        String describe() {
            return String.format(Locale.ROOT, "stops=%d arrive_wh=%s km=%.1f min=%d quality=%s charge_stops=%d",
                    stops.size(), energyText(finalArrivalWh()), totalDistanceM() / 1000.0, Math.round(totalTimeS() / 60.0),
                    qualityName(quality), chargeStops());
        }
    }

    /** Parses VehicleEnergyForecast bytes; throws IllegalArgumentException on malformed input. */
    static Forecast parse(byte[] proto) {
        if (proto == null) throw new IllegalArgumentException("no forecast bytes");
        Forecast forecast = new Forecast();
        Stop toEmpty = null;
        Reader reader = new Reader(proto, 0, proto.length);
        while (reader.next()) {
            if (reader.is(QUALITY, VARINT)) {
                forecast.quality = (int) reader.varint;
            } else if (reader.is(STOP_DETAILS, LENGTH_DELIMITED)) {
                forecast.stops.add(stop(reader.message()));
            } else if (reader.is(TO_EMPTY, LENGTH_DELIMITED)) {
                // A singular message given twice merges, as protobuf does.
                if (toEmpty == null) toEmpty = new Stop();
                energy(reader.message(), toEmpty);
                forecast.toEmptyDistanceM = Math.max(0, toEmpty.distanceM);
            }
        }
        return forecast;
    }

    private static Stop stop(Reader message) {
        Stop stop = new Stop();
        while (message.next()) {
            if (message.is(ARRIVAL_ENERGY, LENGTH_DELIMITED)) {
                energy(message.message(), stop);
                stop.hasArrival = true;
            } else if (message.is(CHARGING_INFO, LENGTH_DELIMITED)) {
                Reader info = message.message();
                while (info.next()) {
                    if (info.is(MIN_DEPARTURE, VARINT)) stop.minDepartureWh = (int) info.varint;
                    else if (info.is(MAX_POWER, VARINT)) stop.chargePowerW = (int) info.varint;
                    else if (info.is(CHARGE_TIME, VARINT)) stop.chargeTimeS = (int) info.varint;
                }
                stop.charging = true;
            }
        }
        return stop;
    }

    private static void energy(Reader message, Stop into) {
        while (message.next()) {
            // int32: the low 32 bits, also of a sign-extended ten-byte varint.
            if (message.is(DISTANCE, VARINT)) into.distanceM = (int) message.varint;
            else if (message.is(ENERGY, VARINT)) into.arrivalWh = (int) message.varint;
            else if (message.is(TIME, VARINT)) into.timeS = (int) message.varint;
        }
    }

    /**
     * The forecast line of the drive records:
     * "F,&lt;wall&gt;,&lt;batteryWh&gt;,&lt;quality&gt;,&lt;stops&gt;,&lt;finalArrivalWh&gt;,&lt;totalDistanceM&gt;,&lt;totalTimeS&gt;,&lt;toEmptyM&gt;",
     * an empty field where a value is unknown (battery below 0, no arrival energy, no distance to empty).
     */
    static String eventLine(long wall, Forecast f, int batteryWh) {
        StringBuilder line = new StringBuilder("F,").append(wall).append(',');
        if (batteryWh >= 0) line.append(batteryWh);
        if (f == null) return line.append(",,,,,,").toString();
        int arrival = f.finalArrivalWh();
        line.append(',').append(f.quality).append(',').append(f.stops.size()).append(',');
        if (arrival != NO_ENERGY) line.append(arrival);
        line.append(',').append(f.totalDistanceM()).append(',').append(f.totalTimeS()).append(',');
        if (f.toEmptyDistanceM >= 0) line.append(f.toEmptyDistanceM);
        return line.toString();
    }

    static String qualityName(int quality) {
        switch (quality) {
            case QUALITY_UNKNOWN: return "unknown";
            case QUALITY_LIVE: return "live";
            case QUALITY_NO_TRAFFIC: return "no_traffic";
            default: return Integer.toString(quality);
        }
    }

    // Guided drives.

    // The three points of a drive that can wait for the next sample.
    private static final int START = 0, LAST = 1, END = 2;
    private static final long NO_TIME = Long.MIN_VALUE;

    /**
     * One guided drive: Maps' forecast at its start against the battery on arrival. Unknown: -1 (Wh, capacity,
     * odometer), NaN (SOC), {@link #NO_ENERGY} (arrival energies). The odometer is in 0.1 km.
     */
    static final class Guided {
        long startWall;
        int startBatteryWh = -1;
        double startSoc = Double.NaN;
        int capacityWh = -1, startMileage01km = -1;
        // The first forecast: to the last stop.
        int firstArrivalWh = NO_ENERGY, firstDistanceM, firstTimeS, firstStops, firstQuality;
        // The last non-empty forecast: what was left then, and the battery and odometer then.
        int lastArrivalWh = NO_ENERGY, lastDistanceM, lastTimeS, lastStops;
        long lastForecastWall;
        int lastForecastBatteryWh = -1;
        double lastForecastSoc = Double.NaN;
        int lastForecastMileage01km = -1;
        /** Non-empty forecasts in this drive, the first included. */
        int updates;
        int minArrivalWh = NO_ENERGY, maxArrivalWh = NO_ENERGY;
        long endWall;
        int endBatteryWh = -1;
        double endSoc = Double.NaN;
        int endMileage01km = -1;
        /** {@link #OPEN}, {@link #ARRIVED}, {@link #ENDED}, {@link #CHANGED} or {@link #NO_FORECAST}. */
        String endReason = OPEN;
        // Not saved: per point (START, LAST, END) the elapsed time it waits for the next sample from (NO_TIME: it does
        // not wait), and whether it still needs the battery or the odometer.
        private final long[] fillFrom = {NO_TIME, NO_TIME, NO_TIME};
        private final boolean[] fillWh = new boolean[3], fillKm = new boolean[3];
        private boolean announced;

        /** endBatteryWh − firstArrivalWh: positive, arrived with more than Maps said. {@link #NO_ENERGY} if unknown. */
        int errorWh() {
            return endBatteryWh < 0 || firstArrivalWh == NO_ENERGY ? NO_ENERGY : endBatteryWh - firstArrivalWh;
        }

        /** Driven, from the odometer; NaN if unknown. */
        double km() {
            return startMileage01km < 0 || endMileage01km < startMileage01km ? Double.NaN : (endMileage01km - startMileage01km) / 10.0;
        }

        /** A value still waits for the next sample. */
        boolean waiting() {
            for (long from : fillFrom) {
                if (from != NO_TIME) return true;
            }
            return false;
        }

        /** For a log line or the report, semicolon-separated key=value. */
        String describe() {
            StringBuilder text = new StringBuilder("reason=").append(endReason)
                    .append(";start_wall=").append(startWall)
                    .append(";start_wh=").append(whText(startBatteryWh))
                    .append(";start_soc=").append(socText(startSoc))
                    .append(";capacity_wh=").append(whText(capacityWh))
                    .append(";first_arrival_wh=").append(energyText(firstArrivalWh))
                    .append(";first_km=").append(kmText(firstDistanceM))
                    .append(";first_min=").append(Math.round(firstTimeS / 60.0))
                    .append(";stops=").append(firstStops)
                    .append(";quality=").append(qualityName(firstQuality))
                    .append(";updates=").append(updates)
                    .append(";min_arrival_wh=").append(energyText(minArrivalWh))
                    .append(";max_arrival_wh=").append(energyText(maxArrivalWh))
                    .append(";last_arrival_wh=").append(energyText(lastArrivalWh))
                    .append(";last_km=").append(kmText(lastDistanceM))
                    .append(";last_min=").append(Math.round(lastTimeS / 60.0))
                    .append(";last_wh=").append(whText(lastForecastBatteryWh));
            if (!OPEN.equals(endReason)) {
                double km = km();
                int error = errorWh();
                text.append(";end_wall=").append(endWall)
                        .append(";end_wh=").append(whText(endBatteryWh))
                        .append(";end_soc=").append(socText(endSoc))
                        .append(";km=").append(Double.isNaN(km) ? "none" : String.format(Locale.ROOT, "%.1f", km))
                        .append(";error_wh=").append(ARRIVED.equals(endReason) ? energyText(error) : "none");
            }
            return text.toString();
        }

        Guided copy() {
            Guided c = new Guided();
            c.startWall = startWall; c.startBatteryWh = startBatteryWh; c.startSoc = startSoc; c.capacityWh = capacityWh;
            c.startMileage01km = startMileage01km;
            c.firstArrivalWh = firstArrivalWh; c.firstDistanceM = firstDistanceM; c.firstTimeS = firstTimeS;
            c.firstStops = firstStops; c.firstQuality = firstQuality;
            c.lastArrivalWh = lastArrivalWh; c.lastDistanceM = lastDistanceM; c.lastTimeS = lastTimeS; c.lastStops = lastStops;
            c.lastForecastWall = lastForecastWall; c.lastForecastBatteryWh = lastForecastBatteryWh;
            c.lastForecastSoc = lastForecastSoc; c.lastForecastMileage01km = lastForecastMileage01km;
            c.updates = updates; c.minArrivalWh = minArrivalWh; c.maxArrivalWh = maxArrivalWh;
            c.endWall = endWall; c.endBatteryWh = endBatteryWh; c.endSoc = endSoc; c.endMileage01km = endMileage01km;
            c.endReason = endReason;
            System.arraycopy(fillFrom, 0, c.fillFrom, 0, fillFrom.length);
            System.arraycopy(fillWh, 0, c.fillWh, 0, fillWh.length);
            System.arraycopy(fillKm, 0, c.fillKm, 0, fillKm.length);
            c.announced = announced;
            return c;
        }

        private void setBattery(int point, int wh, double soc) {
            if (point == START) { startBatteryWh = wh; startSoc = soc; }
            else if (point == LAST) { lastForecastBatteryWh = wh; lastForecastSoc = soc; }
            else { endBatteryWh = wh; endSoc = soc; }
        }

        private void setMileage(int point, int mileage01km) {
            if (point == START) startMileage01km = mileage01km;
            else if (point == LAST) lastForecastMileage01km = mileage01km;
            else endMileage01km = mileage01km;
        }

        // The point waits from [elapsed] for the battery (unless given) and the odometer of the next sample.
        private void await(int point, long elapsed, boolean needsWh) {
            fillFrom[point] = elapsed;
            fillWh[point] = needsWh;
            fillKm[point] = true;
        }

        private void stopWaiting() {
            for (int point = START; point <= END; point++) fillFrom[point] = NO_TIME;
        }
    }

    /**
     * Guided drives from the forecasts and the battery readings; thread-safe (synchronized). Times are passed in: wall
     * ms for the records, elapsedRealtime ms for the waits. A battery below 0 means no fresh reading.
     * <p>
     * A drive opens at the first non-empty forecast while none is open and ends at an empty forecast (arrived when the
     * last forecast had at most 1,000 m or 120 s left, else ended), at a new destination (changed: the stop count
     * changes, the distance grows by more than 5 km and 20 %, or it drops to a given distance by more than the
     * progress since the last forecast plus 5 km or 20 %, whichever is more; a new drive opens) or after 30 min
     * without a forecast (no_forecast, with the battery at the last forecast). The progress is the odometer's, else
     * 40 m/s for the time since the last forecast. A battery missing at a forecast and the odometer come from the next
     * sample within 60 s, otherwise stay unknown (the odometer: the sample before, if within 60 s). A forecast whose
     * last stop has no arrival energy, other stops having one, is ignored.
     */
    static final class Tracker {
        private static final String HEADER = "morphe guided drives v1";
        private static final int FIELDS = 26, MAX_NOTES = 20;
        private static final long FILL_MS = 60000, NO_FORECAST_MS = 30 * 60000;
        private static final int CHANGE_M = 5000, ARRIVED_M = 1000, ARRIVED_S = 120;
        private static final double CHANGE_RATIO = 0.20;
        /** The progress since the last forecast when the odometer is unknown: this speed, m/s. */
        private static final int MAX_PROGRESS_MPS = 40;

        private Guided open;
        private final List<Guided> closed = new ArrayList<>();
        private final List<String> notes = new ArrayList<>();
        private long lastForecastElapsed;
        // After load: the open drive's last forecast is placed on this boot's elapsed time by the wall clock.
        private boolean resync, changed;
        private boolean haveSample;
        private long sampleElapsed;
        private int sampleMileage = -1;

        synchronized void onForecast(long wall, long elapsed, Forecast f, int batteryWh, double soc, int capacityWh) {
            if (f == null) return;
            resync(wall, elapsed);
            timeout(elapsed);
            // Expiry only: a forecast carries no sample.
            fillAll(elapsed, -1, Double.NaN, -1, -1);
            if (f.isEmpty()) {
                if (open != null) close(near(open) ? ARRIVED : ENDED, wall, elapsed, batteryWh, soc, capacityWh);
                return;
            }
            if (f.finalArrivalWh() == NO_ENERGY) return;
            if (open != null && destinationChanged(open, f, elapsed)) close(CHANGED, wall, elapsed, batteryWh, soc, capacityWh);
            if (open == null) start(wall, elapsed, f, batteryWh, soc, capacityWh);
            else update(open, wall, elapsed, f, batteryWh, soc, capacityWh);
        }

        /** Each 10 s reading; the odometer in 0.1 km, -1 if unknown. */
        synchronized void onSample(long wall, long elapsed, int batteryWh, double soc, int capacityWh, int mileage01km) {
            resync(wall, elapsed);
            timeout(elapsed);
            fillAll(elapsed, batteryWh, soc, capacityWh, mileage01km);
            haveSample = true;
            sampleElapsed = elapsed;
            sampleMileage = mileage01km;
        }

        /** Copies, newest first: the open drive, then the closed ones (at most {@link #KEEP}). */
        synchronized List<Guided> recent(int max) {
            List<Guided> list = new ArrayList<>();
            if (open != null && list.size() < max) list.add(open.copy());
            for (Guided g : closed) {
                if (list.size() >= max) break;
                list.add(g.copy());
            }
            return list;
        }

        /** Log lines since the last call ("guided_opened;…", "guided_closed;…" once its end values are in), oldest first. */
        synchronized List<String> drainNotes() {
            List<String> drained = new ArrayList<>(notes);
            notes.clear();
            return drained;
        }

        /** Whether the saved state changed since the last call. */
        synchronized boolean takeChanged() {
            boolean was = changed;
            changed = false;
            return was;
        }

        /** One header line, then one "G," line per drive, the open one first. Values waiting for a sample are not kept. */
        synchronized String save() {
            StringBuilder out = new StringBuilder(HEADER).append('\n');
            if (open != null) line(out, open);
            for (Guided g : closed) line(out, g);
            return out.toString();
        }

        /** The tracker saved by {@link #save}; an empty one for missing or bad text. Never throws. */
        static Tracker load(String text) {
            Tracker tracker = new Tracker();
            if (text == null) return tracker;
            try {
                String[] lines = text.split("\n");
                if (lines.length == 0 || !HEADER.equals(lines[0].trim())) return new Tracker();
                synchronized (tracker) {
                    for (int i = 1; i < lines.length; i++) {
                        String line = lines[i].trim();
                        if (line.isEmpty()) continue;
                        Guided g = parseLine(line);
                        if (OPEN.equals(g.endReason)) {
                            // Only the first drive can be open.
                            if (tracker.open != null || !tracker.closed.isEmpty()) return new Tracker();
                            // Maps' process ended during guidance: the drive ends with what its last forecast had (arrived
                            // when that was at the destination). Its guidance cannot be told from the next one after a
                            // restart, and Maps sends an empty forecast at every start.
                            g.endReason = near(g) ? ARRIVED : RESTARTED;
                            g.endWall = g.lastForecastWall;
                            g.endBatteryWh = g.lastForecastBatteryWh;
                            g.endSoc = g.lastForecastSoc;
                            g.endMileage01km = g.lastForecastMileage01km;
                            g.stopWaiting();
                            g.announced = false;
                            tracker.closed.add(g);
                            tracker.changed = true;
                        } else if (tracker.closed.size() < KEEP) {
                            tracker.closed.add(g);
                        }
                    }
                }
                synchronized (tracker) {
                    tracker.announce();
                }
                return tracker;
            } catch (RuntimeException error) {
                return new Tracker();
            }
        }

        private void start(long wall, long elapsed, Forecast f, int batteryWh, double soc, int capacityWh) {
            Guided g = new Guided();
            g.startWall = wall;
            if (capacityWh > 0) g.capacityWh = capacityWh;
            if (batteryWh >= 0) { g.startBatteryWh = batteryWh; g.startSoc = soc; }
            g.startMileage01km = mileageNear(elapsed);
            g.await(START, elapsed, batteryWh < 0);
            g.firstArrivalWh = f.finalArrivalWh();
            g.firstDistanceM = f.totalDistanceM();
            g.firstTimeS = f.totalTimeS();
            g.firstStops = f.stops.size();
            g.firstQuality = f.quality;
            open = g;
            update(g, wall, elapsed, f, batteryWh, soc, capacityWh);
            note("guided_opened;" + g.describe());
        }

        private void update(Guided g, long wall, long elapsed, Forecast f, int batteryWh, double soc, int capacityWh) {
            int arrival = f.finalArrivalWh();
            g.lastArrivalWh = arrival;
            g.lastDistanceM = f.totalDistanceM();
            g.lastTimeS = f.totalTimeS();
            g.lastStops = f.stops.size();
            g.lastForecastWall = wall;
            g.lastForecastBatteryWh = batteryWh >= 0 ? batteryWh : -1;
            g.lastForecastSoc = batteryWh >= 0 ? soc : Double.NaN;
            g.lastForecastMileage01km = mileageNear(elapsed);
            g.await(LAST, elapsed, batteryWh < 0);
            if (g.capacityWh <= 0 && capacityWh > 0) g.capacityWh = capacityWh;
            g.updates++;
            g.minArrivalWh = g.minArrivalWh == NO_ENERGY ? arrival : Math.min(g.minArrivalWh, arrival);
            g.maxArrivalWh = g.maxArrivalWh == NO_ENERGY ? arrival : Math.max(g.maxArrivalWh, arrival);
            lastForecastElapsed = elapsed;
            changed = true;
        }

        private void close(String reason, long wall, long elapsed, int batteryWh, double soc, int capacityWh) {
            Guided g = open;
            open = null;
            g.endReason = reason;
            g.endWall = wall;
            if (batteryWh >= 0) { g.endBatteryWh = batteryWh; g.endSoc = soc; }
            if (g.capacityWh <= 0 && capacityWh > 0) g.capacityWh = capacityWh;
            g.endMileage01km = mileageNear(elapsed);
            g.await(END, elapsed, batteryWh < 0);
            keep(g);
        }

        // 30 min without a forecast: the drive ends with what the last forecast had.
        private void closeStale() {
            Guided g = open;
            open = null;
            g.endReason = NO_FORECAST;
            g.endWall = g.lastForecastWall;
            g.endBatteryWh = g.lastForecastBatteryWh;
            g.endSoc = g.lastForecastSoc;
            g.endMileage01km = g.lastForecastMileage01km;
            g.stopWaiting();
            keep(g);
        }

        private void keep(Guided g) {
            closed.add(0, g);
            while (closed.size() > KEEP) closed.remove(closed.size() - 1);
            changed = true;
            announce();
        }

        private void resync(long wall, long elapsed) {
            if (!resync) return;
            resync = false;
            if (open == null) return;
            long age = wall - open.lastForecastWall;
            // The clock went back: the drive's age is unknown.
            if (age < -FILL_MS) closeStale();
            else lastForecastElapsed = elapsed - Math.max(0, age);
        }

        private void timeout(long elapsed) {
            if (open != null && elapsed - lastForecastElapsed > NO_FORECAST_MS) closeStale();
        }

        private void fillAll(long elapsed, int batteryWh, double soc, int capacityWh, int mileage01km) {
            if (open != null) fill(open, elapsed, batteryWh, soc, capacityWh, mileage01km);
            for (Guided g : closed) {
                if (g.waiting()) fill(g, elapsed, batteryWh, soc, capacityWh, mileage01km);
            }
            announce();
        }

        private void fill(Guided g, long elapsed, int batteryWh, double soc, int capacityWh, int mileage01km) {
            for (int point = START; point <= END; point++) {
                long from = g.fillFrom[point];
                // A sample from before the forecast is not the next one.
                if (from == NO_TIME || elapsed < from) continue;
                if (elapsed - from > FILL_MS) {
                    g.fillFrom[point] = NO_TIME;
                    continue;
                }
                if (g.fillWh[point] && batteryWh >= 0) {
                    g.setBattery(point, batteryWh, soc);
                    if (point == START && g.capacityWh <= 0 && capacityWh > 0) g.capacityWh = capacityWh;
                    g.fillWh[point] = false;
                    changed = true;
                }
                if (g.fillKm[point] && mileage01km >= 0) {
                    g.setMileage(point, mileage01km);
                    g.fillKm[point] = false;
                    changed = true;
                }
                if (!g.fillWh[point] && !g.fillKm[point]) g.fillFrom[point] = NO_TIME;
            }
        }

        // A closed drive is logged once its end values are in (or no longer awaited).
        private void announce() {
            for (int i = closed.size() - 1; i >= 0; i--) {
                Guided g = closed.get(i);
                if (g.announced || g.waiting()) continue;
                g.announced = true;
                note("guided_closed;" + g.describe());
            }
        }

        private void note(String text) {
            if (notes.size() >= MAX_NOTES) notes.remove(0);
            notes.add(text);
        }

        // The odometer of the sample before, if within 60 s; the next sample replaces it.
        private int mileageNear(long elapsed) {
            return haveSample && Math.abs(elapsed - sampleElapsed) <= FILL_MS ? sampleMileage : -1;
        }

        // A criterion counts only when the first forecast gave that value (proto3 sends no zero).
        private static boolean near(Guided g) {
            return g.firstDistanceM > 0 && g.lastDistanceM <= ARRIVED_M || g.firstTimeS > 0 && g.lastTimeS <= ARRIVED_S;
        }

        private boolean destinationChanged(Guided g, Forecast f, long elapsed) {
            if (f.stops.size() != g.lastStops) return true;
            long distance = f.totalDistanceM();
            long growth = distance - g.lastDistanceM;
            if (growth > CHANGE_M && growth > g.lastDistanceM * CHANGE_RATIO) return true;
            // A nearer destination: the distance drops by more than the progress since the last forecast, by a margin.
            // A zero distance is not given (proto3 sends no zero), so it is no drop.
            if (distance <= 0) return false;
            long drop = g.lastDistanceM - distance;
            return drop > progressM(g, elapsed) + Math.max(CHANGE_M, g.lastDistanceM * CHANGE_RATIO);
        }

        // Metres driven since the open drive's last forecast: the odometer's, else 40 m/s for the time since (also
        // when the odometer went back).
        private double progressM(Guided g, long elapsed) {
            int now = mileageNear(elapsed);
            if (g.lastForecastMileage01km >= 0 && now >= g.lastForecastMileage01km) {
                return (now - g.lastForecastMileage01km) * 100.0;
            }
            return MAX_PROGRESS_MPS * Math.max(0, elapsed - lastForecastElapsed) / 1000.0;
        }

        private static void line(StringBuilder out, Guided g) {
            out.append("G,").append(g.startWall).append(',').append(g.startBatteryWh).append(',').append(g.startSoc)
                    .append(',').append(g.capacityWh).append(',').append(g.startMileage01km)
                    .append(',').append(g.firstArrivalWh).append(',').append(g.firstDistanceM).append(',').append(g.firstTimeS)
                    .append(',').append(g.firstStops).append(',').append(g.firstQuality)
                    .append(',').append(g.lastArrivalWh).append(',').append(g.lastDistanceM).append(',').append(g.lastTimeS)
                    .append(',').append(g.lastStops).append(',').append(g.lastForecastWall)
                    .append(',').append(g.lastForecastBatteryWh).append(',').append(g.lastForecastSoc)
                    .append(',').append(g.lastForecastMileage01km)
                    .append(',').append(g.updates).append(',').append(g.minArrivalWh).append(',').append(g.maxArrivalWh)
                    .append(',').append(g.endWall).append(',').append(g.endBatteryWh).append(',').append(g.endSoc)
                    .append(',').append(g.endMileage01km).append(',').append(g.endReason).append('\n');
        }

        private static Guided parseLine(String line) {
            String[] v = line.split(",", -1);
            if (v.length != FIELDS + 1 || !"G".equals(v[0])) throw new IllegalArgumentException("guided drive line");
            Guided g = new Guided();
            int i = 1;
            g.startWall = Long.parseLong(v[i++]); g.startBatteryWh = Integer.parseInt(v[i++]);
            g.startSoc = Double.parseDouble(v[i++]); g.capacityWh = Integer.parseInt(v[i++]);
            g.startMileage01km = Integer.parseInt(v[i++]);
            g.firstArrivalWh = Integer.parseInt(v[i++]); g.firstDistanceM = Integer.parseInt(v[i++]);
            g.firstTimeS = Integer.parseInt(v[i++]); g.firstStops = Integer.parseInt(v[i++]);
            g.firstQuality = Integer.parseInt(v[i++]);
            g.lastArrivalWh = Integer.parseInt(v[i++]); g.lastDistanceM = Integer.parseInt(v[i++]);
            g.lastTimeS = Integer.parseInt(v[i++]); g.lastStops = Integer.parseInt(v[i++]);
            g.lastForecastWall = Long.parseLong(v[i++]); g.lastForecastBatteryWh = Integer.parseInt(v[i++]);
            g.lastForecastSoc = Double.parseDouble(v[i++]); g.lastForecastMileage01km = Integer.parseInt(v[i++]);
            g.updates = Integer.parseInt(v[i++]); g.minArrivalWh = Integer.parseInt(v[i++]);
            g.maxArrivalWh = Integer.parseInt(v[i++]);
            g.endWall = Long.parseLong(v[i++]); g.endBatteryWh = Integer.parseInt(v[i++]);
            g.endSoc = Double.parseDouble(v[i++]); g.endMileage01km = Integer.parseInt(v[i++]);
            String reason = v[i];
            if (!OPEN.equals(reason) && !ARRIVED.equals(reason) && !ENDED.equals(reason) && !CHANGED.equals(reason)
                    && !NO_FORECAST.equals(reason) && !RESTARTED.equals(reason)) throw new IllegalArgumentException("guided drive reason");
            g.endReason = reason;
            if (g.updates < 1) throw new IllegalArgumentException("guided drive updates");
            g.announced = true;
            return g;
        }
    }

    // Formatting.

    static String energyText(int wh) {
        return wh == NO_ENERGY ? "none" : Integer.toString(wh);
    }

    private static String whText(int wh) {
        return wh < 0 ? "none" : Integer.toString(wh);
    }

    private static String socText(double soc) {
        return Double.isNaN(soc) || Double.isInfinite(soc) ? "none" : String.format(Locale.ROOT, "%.2f", soc);
    }

    private static String kmText(int metres) {
        return String.format(Locale.ROOT, "%.1f", metres / 1000.0);
    }

    private static int clamp(long value) {
        return value > Integer.MAX_VALUE ? Integer.MAX_VALUE : value < Integer.MIN_VALUE ? Integer.MIN_VALUE : (int) value;
    }

    // Protobuf wire format.

    /** Iterates the fields of one message within [start, end); throws IllegalArgumentException on malformed input. */
    private static final class Reader {
        private final byte[] buffer;
        private final int end;
        private int position, valueStart;
        int field, wireType;
        long varint;

        Reader(byte[] buffer, int start, int end) {
            this.buffer = buffer;
            this.position = start;
            this.end = end;
        }

        boolean next() {
            if (position == end) return false;
            long tag = readVarint();
            field = fieldNumber(tag);
            wireType = (int) (tag & 7);
            if (wireType == END_GROUP) throw new IllegalArgumentException("end group without start");
            skipValue(wireType, field, 0);
            return true;
        }

        boolean is(int number, int type) {
            return field == number && wireType == type;
        }

        /** The length-delimited value just read, as a message. */
        Reader message() {
            return new Reader(buffer, valueStart, position);
        }

        private void skipValue(int type, int number, int depth) {
            switch (type) {
                case VARINT:
                    varint = readVarint();
                    break;
                case FIXED64:
                    skip(8);
                    break;
                case LENGTH_DELIMITED:
                    long length = readVarint();
                    if (length < 0 || length > end - position) throw new IllegalArgumentException("length");
                    valueStart = position;
                    position += (int) length;
                    break;
                case START_GROUP:
                    if (depth >= MAX_GROUP_DEPTH) throw new IllegalArgumentException("group depth");
                    while (true) {
                        if (position == end) throw new IllegalArgumentException("unterminated group");
                        long tag = readVarint();
                        int inner = fieldNumber(tag), innerType = (int) (tag & 7);
                        if (innerType == END_GROUP) {
                            if (inner != number) throw new IllegalArgumentException("group end " + inner);
                            break;
                        }
                        skipValue(innerType, inner, depth + 1);
                    }
                    break;
                case FIXED32:
                    skip(4);
                    break;
                default:
                    throw new IllegalArgumentException("wire type " + type);
            }
        }

        private static int fieldNumber(long tag) {
            long number = tag >>> 3;
            if (number == 0 || number > 536870911) throw new IllegalArgumentException("field number");
            return (int) number;
        }

        private long readVarint() {
            long value = 0;
            for (int shift = 0; shift < 64; shift += 7) {
                if (position >= end) throw new IllegalArgumentException("truncated varint");
                byte b = buffer[position++];
                value |= (long) (b & 0x7F) << shift;
                if ((b & 0x80) == 0) return value;
            }
            throw new IllegalArgumentException("varint too long");
        }

        private void skip(int bytes) {
            if (bytes > end - position) throw new IllegalArgumentException("truncated field");
            position += bytes;
        }
    }
}
