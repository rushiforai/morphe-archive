package app.morphe.extension.mapsautomotive.patches;

import android.content.Context;
import android.os.Environment;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.RandomAccessFile;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

/**
 * Drive records kept on the car, for the learner and for replays on the PC: every 10 s battery
 * reading (an S line, with the GPS height, the optional BYD signals and the model tag), Maps' energy
 * forecasts (F lines from {@link BydForecast}) and a summary of each drive (a D line). Files
 * records-NNNN.csv in files/morphe_drive_log, each up to 1 MiB, at most 40 (the oldest is deleted): an S
 * line with every signal and the model tag is about 220 bytes, 360 an hour, so about 500 h. drives.csv
 * keeps the summaries longer. {@link #export} copies them to the app's external files, readable over ADB
 * and, on Android 10, by any app that holds the storage permission (no position in them).
 * <p>
 * A drive starts at the first moving sample (above 1 km/h; without a speed, an odometer step) after
 * more than 5 min parked, or the first moving sample ever, and ends at its last moving sample once more
 * than 5 min pass without moving or between two samples. A drive that moved less than 0.1 km and less
 * than 1 min (a car park) is not kept. At initialize the samples after the newest whole D line are
 * replayed, so a restart of the app continues the drive in progress; a drive the replay ends there lost
 * its D line to a failed write (storage full) and goes to drives.csv then, unless drives.csv has it.
 * <p>
 * Writes only this app's own files and never sends them anywhere; reads nothing from the car itself
 * (the caller passes the readings). No latitude or longitude: the only position datum is the height
 * ({@link BydAltitude}). Storage failures are logged once and never reach the caller.
 */
final class BydDriveLog {
    private static final String TAG = "MorpheBydDrive";
    static final String DIR = "morphe_drive_log", SUMMARY_FILE = "drives.csv", EXPORT_DIR = "morphe-drive-records";
    static final long MAX_FILE_BYTES = 1024 * 1024, SUMMARY_MAX_BYTES = 256 * 1024;
    static final int MAX_FILES = 40, SUMMARY_KEEP = 1000;
    /** More than this without moving, or between two samples, ends a drive. */
    static final long STILL_MS = 5 * 60 * 1000;
    static final double MOVING_KMH = 1.0, CITY_BELOW_KMH = 60, HIGHWAY_FROM_KMH = 80;
    /** A rise of this much while standing is charging (BMS steps are 100 Wh). */
    static final int CHARGE_RISE_WH = 300;
    /** Height changes count once they reach 5 m (in 0.1 m). */
    static final int CLIMB_STEP_DM = 50;
    static final int MIN_DRIVE_01KM = 1;
    static final long MIN_DRIVE_MOVING_MS = 60 * 1000;
    static final int KEEP_DRIVES = 50, MAX_EARLY_LINES = 100;
    static final int UNKNOWN = Integer.MIN_VALUE;
    static final String END_STANDING = "standing", END_GAP = "gap", END_OPEN = "open";
    // An odometer step faster than this is a misreading (as BydSpeedBands).
    private static final double MAX_STEP_KMH = 282;
    static final String DRIVE_COLUMNS = "start_wall_ms,end_wall_ms,start_wh,end_wh,start_soc,end_soc,start_mileage_0.1km,"
            + "end_mileage_0.1km,km,moving_min,standing_min,outside_min_c,outside_mean_c,outside_max_c,climb_m,descent_m,"
            + "altitude_fixes,mean_moving_kmh,max_kmh,km_below_60,km_60_80,km_from_80,charged,samples,end_reason";
    private static final int DRIVE_FIELDS = 26, SAMPLE_FIELDS = 12;
    static final String RECORDS_HEADER = "# morphe drive records v1\n"
            + "# S,wall_ms,elapsed_ms,energy_wh,soc,mileage_0.1km,speed_kmh,outside_c,battery_temp_raw,altitude_0.1m,signals,model\n"
            + "# F,wall_ms,battery_wh,quality,stops,final_arrival_wh,total_distance_m,total_time_s,to_empty_m\n"
            + "# D," + DRIVE_COLUMNS + "\n"
            + "# E,wall_ms,text\n";
    static final String SUMMARY_HEADER = "# morphe drive summaries v1\n# D," + DRIVE_COLUMNS + "\n";
    private static final byte[] HEADER_BYTES = RECORDS_HEADER.getBytes(StandardCharsets.UTF_8);

    private static Recorder recorder;
    private static boolean starting, sampleFailureLogged;
    // Event lines before initialize.
    private static final List<String> early = new ArrayList<>();

    private BydDriveLog() {
    }

    /** One reading as recorded; unknown values keep their defaults. */
    static final class Sample {
        long wall, elapsed;
        /** BMS energy; -1 when unknown. */
        int energyWh = -1;
        double soc = Double.NaN;
        /** Odometer in 0.1 km; -1 when unknown. */
        int mileage01km = -1;
        double speedKmh = Double.NaN;
        int outsideC = UNKNOWN;
        int batteryTempRaw = UNKNOWN;
        double altitudeM = Double.NaN;
        /** BydSignalProbe's key=value list joined with '|'. */
        String signals = "";
        /** A short tag of the model Maps had. */
        String model = "";
    }

    /** Once, on the worker thread: reads the summaries and the drive in progress. Never throws. */
    static void initialize(Context context) {
        synchronized (BydDriveLog.class) {
            if (recorder != null || starting) return;
            starting = true;
        }
        Recorder created;
        try {
            created = new Recorder(new File(context.getFilesDir(), DIR), MAX_FILE_BYTES, MAX_FILES, SUMMARY_MAX_BYTES, SUMMARY_KEEP);
            created.open(System.currentTimeMillis());
        } catch (Throwable error) {
            warn("drive records kept in memory only", error);
            created = new Recorder(null, MAX_FILE_BYTES, MAX_FILES, SUMMARY_MAX_BYTES, SUMMARY_KEEP);
        }
        synchronized (BydDriveLog.class) {
            recorder = created;
            starting = false;
            if (!early.isEmpty()) {
                recorder.write(early);
                early.clear();
            }
            info("drive_log_started;" + recorder.status());
        }
    }

    /** Every 10 s reading, on the worker thread. Never throws. */
    static synchronized void sample(Sample s) {
        if (recorder == null || s == null) return;
        try {
            recorder.sample(s);
        } catch (Throwable error) {
            if (!sampleFailureLogged) {
                sampleFailureLogged = true;
                warn("drive sample not recorded", error);
            }
        }
    }

    /** An event line such as BydForecast's "F,…", from any thread. Never throws. */
    static synchronized void event(long wall, String line) {
        try {
            String text = eventLine(wall, line);
            if (text == null) return;
            if (recorder != null) recorder.write(Collections.singletonList(text));
            else if (early.size() < MAX_EARLY_LINES) early.add(text);
        } catch (Throwable ignored) {
            // The line is lost; nothing else is.
        }
    }

    /**
     * Replaces the previous export with a copy of every records file and drives.csv in the app's external
     * files (Documents/morphe-drive-records) and returns that folder. Off the main thread. ADB reads the copy, and on
     * Android 10 so does any app with the storage permission.
     */
    static String export(Context context) throws IOException {
        File base = context.getExternalFilesDir(Environment.DIRECTORY_DOCUMENTS);
        if (base == null) throw new IOException("external storage is not available");
        File target = new File(base, EXPORT_DIR);
        List<Part> parts;
        synchronized (BydDriveLog.class) {
            if (recorder == null) throw new IOException("drive records are not started");
            parts = recorder.parts();
        }
        int copied = exportTo(parts, target);
        info("drive_records_exported;files=" + copied);
        return target.getAbsolutePath();
    }

    /** Finished drives, newest first. */
    static synchronized List<Drive> recent(int max) {
        return recorder == null ? new ArrayList<Drive>() : recorder.recent(max);
    }

    /** The drive in progress up to its last moving sample, or null while parked. */
    static synchronized Drive current() {
        return recorder == null ? null : recorder.segmenter.snapshot();
    }

    /** "files=3 bytes=812345 drives=12", then " open=1" during a drive and any storage error. */
    static synchronized String status() {
        return recorder == null ? "not_initialized" : recorder.status();
    }

    // ---- Lines

    static String sampleLine(Sample s) {
        StringBuilder line = new StringBuilder(160).append("S,").append(s.wall).append(',').append(s.elapsed).append(',')
                .append(known(s.energyWh, s.energyWh >= 0)).append(',').append(decimal(s.soc, 2)).append(',')
                .append(known(s.mileage01km, s.mileage01km >= 0)).append(',')
                .append(decimal(s.speedKmh, 1)).append(',')
                .append(known(s.outsideC, s.outsideC != UNKNOWN)).append(',')
                .append(known(s.batteryTempRaw, s.batteryTempRaw != UNKNOWN)).append(',');
        if (finite(s.altitudeM)) line.append(Math.round(s.altitudeM * 10));
        return line.append(',').append(clean(s.signals)).append(',').append(clean(s.model)).toString();
    }

    /** The sample of an S line, or null for another or a damaged line. */
    static Sample parseSample(String line) {
        if (line == null || !line.startsWith("S,")) return null;
        String[] f = line.split(",", -1);
        if (f.length != SAMPLE_FIELDS) return null;
        try {
            Sample s = new Sample();
            s.wall = Long.parseLong(f[1]);
            s.elapsed = Long.parseLong(f[2]);
            s.energyWh = integer(f[3], -1);
            s.soc = number(f[4]);
            s.mileage01km = integer(f[5], -1);
            s.speedKmh = number(f[6]);
            s.outsideC = integer(f[7], UNKNOWN);
            s.batteryTempRaw = integer(f[8], UNKNOWN);
            s.altitudeM = f[9].isEmpty() ? Double.NaN : Long.parseLong(f[9]) / 10.0;
            s.signals = f[10];
            s.model = f[11];
            return s;
        } catch (NumberFormatException error) {
            return null;
        }
    }

    /** The line as written: as given when it starts with its own type letter, else "E,<wall>,<text>"; null for none. */
    static String eventLine(long wall, String line) {
        if (line == null || line.isEmpty()) return null;
        String text = line.replace('\r', ' ').replace('\n', ' ');
        char type = text.charAt(0);
        boolean typed = text.length() > 1 && text.charAt(1) == ',' && type >= 'A' && type <= 'Z' && type != 'S' && type != 'D';
        return typed ? text : "E," + wall + "," + text;
    }

    /** A number with at most [places] decimals, trailing zeros dropped; empty for NaN or infinity. */
    static String decimal(double value, int places) {
        if (!finite(value)) return "";
        long scale = places >= 2 ? 100 : places == 1 ? 10 : 1;
        long scaled = Math.round(value * scale), whole = Math.abs(scaled) / scale, part = Math.abs(scaled) % scale;
        StringBuilder text = new StringBuilder();
        if (scaled < 0) text.append('-');
        text.append(whole);
        if (part != 0) {
            String digits = Long.toString(part + scale).substring(1);
            int end = digits.length();
            while (digits.charAt(end - 1) == '0') end--;
            text.append('.').append(digits, 0, end);
        }
        return text.toString();
    }

    // ---- Drives

    /** One drive's summary, as its D line holds it. */
    static final class Drive {
        long startWall, endWall;
        /** The first and last energy among the drive's samples that have one; -1 when none has. SOC likewise (NaN). */
        int startWh = -1, endWh = -1;
        double startSoc = Double.NaN, endSoc = Double.NaN;
        int startMileage01km = -1, endMileage01km = -1;
        /** The odometer's valid steps, 0.1 km; and per band of the mean speed: below 60, 60–80, from 80 km/h. */
        int distance01km, city01km, mixed01km, highway01km;
        long movingMs, standingMs;
        int outsideMinC = UNKNOWN, outsideMaxC = UNKNOWN;
        double outsideMeanC = Double.NaN;
        /** NaN without a fix with a height. */
        double climbM = Double.NaN, descentM = Double.NaN;
        int altitudeFixes;
        double meanMovingKmh = Double.NaN, maxKmh = Double.NaN;
        /** The energy rose by 300 Wh or more during a stop within the drive. */
        boolean charged;
        int samples;
        /** {@link #END_STANDING}, {@link #END_GAP}, or {@link #END_OPEN} for the drive in progress. */
        String endReason = "";

        double km() { return distance01km / 10.0; }
        double kmBelow60() { return city01km / 10.0; }
        double km60To80() { return mixed01km / 10.0; }
        double kmFrom80() { return highway01km / 10.0; }
        double movingMinutes() { return movingMs / 60000.0; }
        double standingMinutes() { return standingMs / 60000.0; }
        /** Start minus end energy; {@link #UNKNOWN} when either is unknown. */
        int usedWh() { return startWh >= 0 && endWh >= 0 ? startWh - endWh : UNKNOWN; }

        String line() {
            return "D," + startWall + ',' + endWall + ',' + known(startWh, startWh >= 0) + ',' + known(endWh, endWh >= 0) + ','
                    + decimal(startSoc, 2) + ',' + decimal(endSoc, 2) + ',' + known(startMileage01km, startMileage01km >= 0) + ','
                    + known(endMileage01km, endMileage01km >= 0) + ',' + decimal(km(), 1) + ',' + decimal(movingMinutes(), 1) + ','
                    + decimal(standingMinutes(), 1) + ',' + known(outsideMinC, outsideMinC != UNKNOWN) + ','
                    + decimal(outsideMeanC, 1) + ',' + known(outsideMaxC, outsideMaxC != UNKNOWN) + ',' + decimal(climbM, 1) + ','
                    + decimal(descentM, 1) + ',' + altitudeFixes + ',' + decimal(meanMovingKmh, 1) + ',' + decimal(maxKmh, 1) + ','
                    + decimal(kmBelow60(), 1) + ',' + decimal(km60To80(), 1) + ',' + decimal(kmFrom80(), 1) + ','
                    + (charged ? 1 : 0) + ',' + samples + ',' + clean(endReason);
        }

        /** The drive of a D line, or null for another or a damaged line. */
        static Drive parse(String line) {
            if (line == null || !line.startsWith("D,")) return null;
            String[] f = line.split(",", -1);
            if (f.length != DRIVE_FIELDS) return null;
            try {
                Drive d = new Drive();
                d.startWall = Long.parseLong(f[1]);
                d.endWall = Long.parseLong(f[2]);
                d.startWh = integer(f[3], -1);
                d.endWh = integer(f[4], -1);
                d.startSoc = number(f[5]);
                d.endSoc = number(f[6]);
                d.startMileage01km = integer(f[7], -1);
                d.endMileage01km = integer(f[8], -1);
                d.distance01km = tenths(f[9]);
                d.movingMs = Math.round(Double.parseDouble(f[10]) * 60000);
                d.standingMs = Math.round(Double.parseDouble(f[11]) * 60000);
                d.outsideMinC = integer(f[12], UNKNOWN);
                d.outsideMeanC = number(f[13]);
                d.outsideMaxC = integer(f[14], UNKNOWN);
                d.climbM = number(f[15]);
                d.descentM = number(f[16]);
                d.altitudeFixes = Integer.parseInt(f[17]);
                d.meanMovingKmh = number(f[18]);
                d.maxKmh = number(f[19]);
                d.city01km = tenths(f[20]);
                d.mixed01km = tenths(f[21]);
                d.highway01km = tenths(f[22]);
                d.charged = "1".equals(f[23]);
                d.samples = Integer.parseInt(f[24]);
                d.endReason = f[25];
                return d;
            } catch (NumberFormatException error) {
                return null;
            }
        }

        /** For one log line: no times beyond the start, no position. */
        String describe() {
            int used = usedWh();
            return "start_wall=" + startWall + ";km=" + decimal(km(), 1) + ";used_wh=" + known(used, used != UNKNOWN)
                    + ";soc=" + decimal(startSoc, 2) + ">" + decimal(endSoc, 2) + ";moving_min=" + decimal(movingMinutes(), 1)
                    + ";standing_min=" + decimal(standingMinutes(), 1) + ";outside_c="
                    + known(outsideMinC, outsideMinC != UNKNOWN) + "/" + decimal(outsideMeanC, 1) + "/"
                    + known(outsideMaxC, outsideMaxC != UNKNOWN) + ";climb_m=" + decimal(climbM, 1)
                    + ";descent_m=" + decimal(descentM, 1) + ";altitude_fixes=" + altitudeFixes + ";mean_kmh="
                    + decimal(meanMovingKmh, 1) + ";max_kmh=" + decimal(maxKmh, 1) + ";km_bands=" + decimal(kmBelow60(), 1) + "/"
                    + decimal(km60To80(), 1) + "/" + decimal(kmFrom80(), 1) + ";charged=" + (charged ? 1 : 0) + ";samples=" + samples
                    + ";end=" + endReason;
        }

        /** For the report: the summary only (no altitude profile, no position). */
        JSONObject json() throws JSONException {
            return new JSONObject()
                    .put("start_wall", startWall)
                    .put("end_wall", endWall)
                    .put("start_wh", startWh >= 0 ? (Object) startWh : JSONObject.NULL)
                    .put("end_wh", endWh >= 0 ? (Object) endWh : JSONObject.NULL)
                    .put("start_soc", orNull(startSoc))
                    .put("end_soc", orNull(endSoc))
                    .put("km", km())
                    .put("moving_min", orNull(movingMinutes()))
                    .put("standing_min", orNull(standingMinutes()))
                    .put("outside_min_c", outsideMinC != UNKNOWN ? (Object) outsideMinC : JSONObject.NULL)
                    .put("outside_mean_c", orNull(outsideMeanC))
                    .put("outside_max_c", outsideMaxC != UNKNOWN ? (Object) outsideMaxC : JSONObject.NULL)
                    .put("climb_m", orNull(climbM))
                    .put("descent_m", orNull(descentM))
                    .put("altitude_fixes", altitudeFixes)
                    .put("mean_moving_kmh", orNull(meanMovingKmh))
                    .put("max_kmh", orNull(maxKmh))
                    .put("km_below_60", kmBelow60())
                    .put("km_60_80", km60To80())
                    .put("km_from_80", kmFrom80())
                    .put("charged", charged)
                    .put("samples", samples)
                    .put("end_reason", endReason);
        }
    }

    /**
     * Cuts the samples into drives (no Android calls). Feed every sample in order; {@link #add} returns the
     * drive the sample ended, if any.
     */
    static final class Segmenter {
        private Sample last;
        private boolean lastMoving;
        private Open open;
        // The samples since the open drive's last moving sample: part of the drive only if it moves again.
        private Acc stop;
        private int stopLowWh;
        private long stillMs;

        boolean driving() {
            return open != null;
        }

        Drive add(Sample s) {
            if (s == null) return null;
            if (last != null && s.wall == last.wall && s.elapsed == last.elapsed) return null;
            long interval = last == null ? -1 : interval(last, s);
            boolean continuous = interval > 0 && interval <= STILL_MS;
            Drive closed = null;
            if (open != null && !continuous) closed = close(END_GAP);
            boolean moving = s.speedKmh > MOVING_KMH
                    || (Double.isNaN(s.speedKmh) && continuous && last.mileage01km >= 0 && s.mileage01km > last.mileage01km);
            if (open == null) {
                if (moving) start(s);
            } else {
                stop.interval(last, s, interval, moving || lastMoving);
                stop.sample(s);
                if (moving) {
                    open.acc.add(stop);
                    open.end = s;
                    open.altitude(s.altitudeM);
                    stop = new Acc();
                    stopLowWh = s.energyWh;
                    stillMs = 0;
                } else {
                    stillMs += interval;
                    if (s.energyWh >= 0) {
                        if (stopLowWh < 0 || s.energyWh < stopLowWh) stopLowWh = s.energyWh;
                        else if (s.energyWh - stopLowWh >= CHARGE_RISE_WH) stop.charged = true;
                    }
                    if (stillMs > STILL_MS) closed = close(END_STANDING);
                }
            }
            last = s;
            lastMoving = moving;
            return closed;
        }

        /** Ends the open drive when the last sample is more than 5 min before [nowWall] (the app was not running). */
        Drive closeIfIdle(long nowWall) {
            return open != null && nowWall - last.wall > STILL_MS ? close(END_GAP) : null;
        }

        Drive snapshot() {
            return open == null ? null : open.drive(END_OPEN);
        }

        private void start(Sample s) {
            open = new Open(s);
            open.acc.sample(s);
            open.altitude(s.altitudeM);
            stop = new Acc();
            stopLowWh = s.energyWh;
            stillMs = 0;
        }

        private Drive close(String reason) {
            Drive drive = open.drive(reason);
            open = null;
            stop = null;
            stillMs = 0;
            return drive.distance01km >= MIN_DRIVE_01KM || drive.movingMs >= MIN_DRIVE_MOVING_MS ? drive : null;
        }
    }

    /** Between two samples: the elapsed time, or the wall time across a reboot or when it is longer. */
    static long interval(Sample from, Sample to) {
        long elapsed = to.elapsed - from.elapsed, wall = to.wall - from.wall;
        return elapsed > 0 ? Math.max(elapsed, wall) : wall;
    }

    /** 0 below 60 km/h, 1 for 60–80, 2 from 80, by the mean of the two speeds (or the known one); -1 without one. */
    static int band(double fromKmh, double toKmh) {
        double kmh = Double.isNaN(fromKmh) ? toKmh : Double.isNaN(toKmh) ? fromKmh : (fromKmh + toKmh) / 2;
        if (Double.isNaN(kmh)) return -1;
        return kmh < CITY_BELOW_KMH ? 0 : kmh < HIGHWAY_FROM_KMH ? 1 : 2;
    }

    private static final class Open {
        final Sample start;
        Sample end;
        final Acc acc = new Acc();
        long referenceDm, climbDm, descentDm;
        int fixes;

        Open(Sample start) {
            this.start = start;
            end = start;
        }

        // Moving samples only (the height does not change at a stop). A change counts once it reaches 5 m
        // from the last counted height, so GPS noise below that adds nothing; NaN (no fresh fix) is skipped.
        void altitude(double metres) {
            if (!finite(metres)) return;
            long dm = Math.round(metres * 10);
            if (fixes++ == 0) {
                referenceDm = dm;
            } else if (dm - referenceDm >= CLIMB_STEP_DM) {
                climbDm += dm - referenceDm;
                referenceDm = dm;
            } else if (referenceDm - dm >= CLIMB_STEP_DM) {
                descentDm += referenceDm - dm;
                referenceDm = dm;
            }
        }

        Drive drive(String reason) {
            Drive d = new Drive();
            d.startWall = start.wall;
            d.endWall = end.wall;
            d.startWh = acc.firstWh;
            d.endWh = acc.lastWh;
            d.startSoc = acc.firstSoc;
            d.endSoc = acc.lastSoc;
            d.startMileage01km = start.mileage01km;
            d.endMileage01km = end.mileage01km;
            d.distance01km = acc.distance01km;
            d.city01km = acc.bands[0];
            d.mixed01km = acc.bands[1];
            d.highway01km = acc.bands[2];
            d.movingMs = acc.movingMs;
            d.standingMs = acc.standingMs;
            if (acc.outsideCount > 0) {
                d.outsideMinC = acc.outsideMin;
                d.outsideMaxC = acc.outsideMax;
                d.outsideMeanC = acc.outsideSum / (double) acc.outsideCount;
            }
            if (fixes > 0) {
                d.climbM = climbDm / 10.0;
                d.descentM = descentDm / 10.0;
            }
            d.altitudeFixes = fixes;
            d.meanMovingKmh = acc.movingMs > 0 ? acc.distance01km / 10.0 / (acc.movingMs / 3600000.0) : Double.NaN;
            d.maxKmh = acc.maxKmh;
            d.charged = acc.charged;
            d.samples = acc.samples;
            d.endReason = reason;
            // In memory with the precision of its line, as after a restart.
            Drive stored = Drive.parse(d.line());
            return stored != null ? stored : d;
        }
    }

    /** Sums over intervals and samples. */
    private static final class Acc {
        long movingMs, standingMs, outsideSum;
        int distance01km, outsideCount, samples;
        int outsideMin = Integer.MAX_VALUE, outsideMax = Integer.MIN_VALUE;
        final int[] bands = new int[3];
        double maxKmh = Double.NaN;
        boolean charged;
        // The first and last known energy and SOC of the samples, in order.
        int firstWh = -1, lastWh = -1;
        double firstSoc = Double.NaN, lastSoc = Double.NaN;

        // Moving when either end moves. The odometer step goes to the band of the mean speed.
        void interval(Sample from, Sample to, long ms, boolean moving) {
            if (moving) movingMs += ms;
            else standingMs += ms;
            if (from.mileage01km < 0 || to.mileage01km < 0) return;
            int step = to.mileage01km - from.mileage01km;
            if (step <= 0 || step * 100.0 > MAX_STEP_KMH / 3.6 * ms / 1000.0 + 200) return;
            distance01km += step;
            int band = band(from.speedKmh, to.speedKmh);
            if (band >= 0) bands[band] += step;
        }

        void sample(Sample s) {
            samples++;
            if (s.outsideC != UNKNOWN) {
                outsideMin = Math.min(outsideMin, s.outsideC);
                outsideMax = Math.max(outsideMax, s.outsideC);
                outsideSum += s.outsideC;
                outsideCount++;
            }
            if (s.speedKmh >= 0 && (Double.isNaN(maxKmh) || s.speedKmh > maxKmh)) maxKmh = s.speedKmh;
            if (s.energyWh >= 0) {
                if (firstWh < 0) firstWh = s.energyWh;
                lastWh = s.energyWh;
            }
            if (finite(s.soc)) {
                if (Double.isNaN(firstSoc)) firstSoc = s.soc;
                lastSoc = s.soc;
            }
        }

        void add(Acc other) {
            movingMs += other.movingMs;
            standingMs += other.standingMs;
            distance01km += other.distance01km;
            for (int i = 0; i < bands.length; i++) bands[i] += other.bands[i];
            if (other.outsideCount > 0) {
                outsideMin = Math.min(outsideMin, other.outsideMin);
                outsideMax = Math.max(outsideMax, other.outsideMax);
                outsideSum += other.outsideSum;
                outsideCount += other.outsideCount;
            }
            if (other.maxKmh >= 0 && (Double.isNaN(maxKmh) || other.maxKmh > maxKmh)) maxKmh = other.maxKmh;
            samples += other.samples;
            charged |= other.charged;
            if (firstWh < 0) firstWh = other.firstWh;
            if (other.lastWh >= 0) lastWh = other.lastWh;
            if (Double.isNaN(firstSoc)) firstSoc = other.firstSoc;
            if (!Double.isNaN(other.lastSoc)) lastSoc = other.lastSoc;
        }
    }

    // ---- Files

    /** A file to export and its size when the export started (whole lines: writes hold the same lock). */
    static final class Part {
        final File file;
        final long bytes;

        Part(File file, long bytes) {
            this.file = file;
            this.bytes = bytes;
        }
    }

    /**
     * The records in one folder, with the segmenter and the recent drives (no Android calls). A null folder
     * keeps the drives in memory only.
     */
    static final class Recorder {
        private final File dir;
        private final long maxBytes, summaryMaxBytes;
        private final int maxFiles, summaryKeep;
        private final ArrayDeque<Drive> drives = new ArrayDeque<>();
        Segmenter segmenter = new Segmenter();
        private int driveCount;
        private File current;
        private String failure;
        private boolean failureLogged;

        Recorder(File dir, long maxBytes, int maxFiles, long summaryMaxBytes, int summaryKeep) {
            this.dir = dir;
            this.maxBytes = maxBytes;
            this.maxFiles = maxFiles;
            this.summaryMaxBytes = summaryMaxBytes;
            this.summaryKeep = summaryKeep;
        }

        /**
         * Reads the summaries and replays the samples after the newest whole D line, keeping any drive whose D line
         * was lost; ends a drive left open too long.
         */
        void open(long nowWall) {
            if (dir != null) {
                try {
                    if (!dir.isDirectory() && !dir.mkdirs()) throw new IOException("folder not created: " + dir.getName());
                    List<File> files = recordFiles(dir);
                    List<Drive> lost = new ArrayList<>();
                    segmenter = replay(files, lost);
                    List<String> known = loadSummaries(files);
                    if (known != null) recover(lost, known);
                } catch (IOException | RuntimeException error) {
                    fail("read", error);
                }
            }
            Drive closed = segmenter.closeIfIdle(nowWall);
            if (closed != null) {
                write(Collections.singletonList(closed.line()));
                record(closed, "drive_end;");
            }
        }

        void sample(Sample s) {
            String line = sampleLine(s);
            // The segmenter sees what a replay of the line will see.
            Sample stored = parseSample(line);
            Drive closed = segmenter.add(stored != null ? stored : s);
            if (closed == null) {
                write(Collections.singletonList(line));
                return;
            }
            // Before the sample that ended it: a replay starts after the D line with this sample.
            write(Arrays.asList(closed.line(), line));
            record(closed, "drive_end;");
        }

        List<Drive> recent(int max) {
            List<Drive> list = new ArrayList<>();
            Iterator<Drive> newest = drives.descendingIterator();
            while (newest.hasNext() && list.size() < max) list.add(newest.next());
            return list;
        }

        String status() {
            int files = 0;
            long bytes = 0;
            if (dir != null) {
                for (File file : recordFiles(dir)) {
                    files++;
                    bytes += file.length();
                }
            }
            StringBuilder text = new StringBuilder().append("files=").append(files).append(" bytes=").append(bytes)
                    .append(" drives=").append(driveCount);
            if (segmenter.driving()) text.append(" open=1");
            if (dir == null) text.append(" storage=memory");
            if (failure != null) text.append(" error=").append(failure);
            return text.toString();
        }

        List<Part> parts() {
            List<Part> parts = new ArrayList<>();
            if (dir == null) return parts;
            for (File file : recordFiles(dir)) parts.add(new Part(file, file.length()));
            File summary = new File(dir, SUMMARY_FILE);
            if (summary.isFile()) parts.add(new Part(summary, summary.length()));
            return parts;
        }

        /** Appends whole lines to the newest file, rolling to a new one at the size limit. */
        void write(List<String> lines) {
            if (dir == null || lines.isEmpty()) return;
            OutputStream out = null;
            try {
                File file = currentFile();
                long size = file.length();
                out = new FileOutputStream(file, true);
                for (String line : lines) {
                    byte[] bytes = (line + "\n").getBytes(StandardCharsets.UTF_8);
                    if (rolls(size, bytes.length, HEADER_BYTES.length, maxBytes)) {
                        out.close();
                        out = null;
                        file = roll(file);
                        out = new FileOutputStream(file, true);
                        size = file.length();
                    }
                    if (size == 0) {
                        out.write(HEADER_BYTES);
                        size = HEADER_BYTES.length;
                    }
                    out.write(bytes);
                    size += bytes.length;
                }
            } catch (IOException | RuntimeException error) {
                // Part of a line may be in the file (storage full): the next write looks for the newest file again
                // and ends that line first, so the two do not join.
                current = null;
                fail("write", error);
            } finally {
                closeQuietly(out);
            }
        }

        private void record(Drive drive, String event) {
            drives.addLast(drive);
            while (drives.size() > KEEP_DRIVES) drives.removeFirst();
            appendSummary(drive.line());
            // drives.csv's count (set again when it is trimmed), also when it could not be written.
            driveCount++;
            info(event + drive.describe());
        }

        // Drives the replay ended: each lost its D line (a write failed, or was cut off). Those drives.csv does not
        // hold either go to drives.csv and the memory, not to the records: a D line at their end would hide the drive
        // in progress from the next replay, which finds these again and skips them then.
        private void recover(List<Drive> lost, List<String> known) {
            if (lost.isEmpty()) return;
            List<Drive> summaries = new ArrayList<>();
            for (String line : known) {
                Drive drive = Drive.parse(line);
                if (drive != null) summaries.add(drive);
            }
            boolean added = false;
            for (Drive drive : lost) {
                if (overlaps(summaries, drive)) continue;
                record(drive, "drive_recovered;");
                summaries.add(drive);
                added = true;
            }
            if (!added) return;
            List<Drive> ordered = new ArrayList<>(drives);
            Collections.sort(ordered, new Comparator<Drive>() {
                @Override
                public int compare(Drive a, Drive b) {
                    return Long.compare(a.startWall, b.startWall);
                }
            });
            drives.clear();
            drives.addAll(ordered);
        }

        private File currentFile() throws IOException {
            if (!dir.isDirectory() && !dir.mkdirs()) throw new IOException("folder not created: " + dir.getName());
            if (current == null) {
                List<File> files = recordFiles(dir);
                File newest = files.isEmpty() ? new File(dir, fileName(1)) : files.get(files.size() - 1);
                endLine(newest);
                current = newest;
            }
            return current;
        }

        // The next file; the oldest go so that at most maxFiles remain with it.
        private File roll(File full) {
            List<File> files = recordFiles(dir);
            int remove = Math.min(deleteCount(files.size(), maxFiles), files.size());
            for (int i = 0; i < remove; i++) {
                if (!files.get(i).delete()) fail("delete", new IOException("not deleted: " + files.get(i).getName()));
            }
            current = new File(dir, fileName(fileNumber(full.getName()) + 1));
            return current;
        }

        // The segmenter after the samples that follow the newest whole D line; [lost] gets the drives they end.
        private Segmenter replay(List<File> files, List<Drive> lost) {
            int fromFile = 0;
            long fromLine = 0;
            for (int i = files.size() - 1; i >= 0; i--) {
                long index = lastDriveLine(files.get(i));
                if (index >= 0) {
                    fromFile = i;
                    fromLine = index + 1;
                    break;
                }
            }
            Segmenter replayed = new Segmenter();
            for (int i = fromFile; i < files.size(); i++) {
                try (BufferedReader in = reader(files.get(i))) {
                    long number = 0;
                    String line;
                    while ((line = in.readLine()) != null) {
                        if (i == fromFile && number++ < fromLine) continue;
                        // A drive kept when it ended has its whole D line before its last sample, so the replay
                        // starts after it; a drive that ends here lost its D line. Short ones are not kept (null).
                        if (!line.startsWith("S,")) continue;
                        Drive closed = replayed.add(parseSample(line));
                        if (closed != null) lost.add(closed);
                    }
                } catch (IOException | RuntimeException error) {
                    fail("read", error);
                }
            }
            return replayed;
        }

        // The index of the last whole D line (a cut one, or one joined with the next line, does not parse), or -1.
        private long lastDriveLine(File file) {
            long index = -1, number = 0;
            try (BufferedReader in = reader(file)) {
                String line;
                for (; (line = in.readLine()) != null; number++) if (Drive.parse(line) != null) index = number;
            } catch (IOException | RuntimeException error) {
                fail("read", error);
            }
            return index;
        }

        /**
         * drives.csv, or the D lines of the records when it is missing or holds none (it is then written again).
         * When drives.csv cannot be read to its end, the memory gets the records' D lines and drives.csv stays as
         * it is. Returns the summaries drives.csv holds now, or null when that is not known.
         */
        private List<String> loadSummaries(List<File> files) {
            List<String> lines = driveLines(new File(dir, SUMMARY_FILE)), known = lines;
            if (lines != null && !lines.isEmpty()) {
                driveCount = lines.size();
            } else {
                List<String> records = new ArrayList<>();
                for (File file : files) {
                    List<String> part = driveLines(file);
                    if (part != null) records.addAll(part);
                }
                driveCount = records.size();
                if (lines != null && !records.isEmpty()) {
                    try {
                        rewriteSummary(records);
                        known = records;
                    } catch (IOException | RuntimeException error) {
                        fail("summary", error);
                        known = null;
                    }
                }
                lines = records;
            }
            for (int i = Math.max(0, lines.size() - KEEP_DRIVES); i < lines.size(); i++) drives.addLast(Drive.parse(lines.get(i)));
            return known;
        }

        // The whole D lines of a file (none when it does not exist), or null when it could not be read to its end.
        private List<String> driveLines(File file) {
            List<String> lines = new ArrayList<>();
            if (!file.exists()) return lines;
            try (BufferedReader in = reader(file)) {
                String line;
                while ((line = in.readLine()) != null) if (Drive.parse(line) != null) lines.add(line);
            } catch (IOException | RuntimeException error) {
                fail("read", error);
                return null;
            }
            return lines;
        }

        private void appendSummary(String line) {
            if (dir == null) return;
            File summary = new File(dir, SUMMARY_FILE);
            try {
                if (summary.length() > summaryMaxBytes) {
                    // Not trimmed from a read cut short: the lines after the error would be lost.
                    List<String> lines = driveLines(summary);
                    if (lines != null) rewriteSummary(lines);
                }
                boolean fresh = summary.length() == 0;
                try (OutputStream out = new FileOutputStream(summary, true)) {
                    if (fresh) out.write(SUMMARY_HEADER.getBytes(StandardCharsets.UTF_8));
                    out.write((line + "\n").getBytes(StandardCharsets.UTF_8));
                }
            } catch (IOException | RuntimeException error) {
                fail("summary", error);
            }
        }

        // drives.csv with only its newest summaryKeep lines. One rename replaces it (rename(2) on Android), so a
        // failure leaves the old drives.csv in place; it is never deleted first.
        private void rewriteSummary(List<String> lines) throws IOException {
            File summary = new File(dir, SUMMARY_FILE), temporary = new File(dir, SUMMARY_FILE + ".tmp");
            int from = Math.max(0, lines.size() - summaryKeep);
            try (OutputStream out = new FileOutputStream(temporary, false)) {
                out.write(SUMMARY_HEADER.getBytes(StandardCharsets.UTF_8));
                for (int i = from; i < lines.size(); i++) out.write((lines.get(i) + "\n").getBytes(StandardCharsets.UTF_8));
            }
            Files.move(temporary.toPath(), summary.toPath(), StandardCopyOption.REPLACE_EXISTING, StandardCopyOption.ATOMIC_MOVE);
            driveCount = lines.size() - from;
        }

        private void fail(String what, Throwable error) {
            failure = what + ":" + error.getClass().getSimpleName();
            if (failureLogged) return;
            failureLogged = true;
            warn("drive records: " + what + " failed; later failures are not logged", error);
        }
    }

    /** Whether a line of [lineBytes] goes to a new file: never into an empty one, so a long line cannot loop. */
    static boolean rolls(long size, long lineBytes, long headerBytes, long maxBytes) {
        return size > headerBytes && size + lineBytes > maxBytes;
    }

    /** How many of the oldest files go before a new one, so that at most [maxFiles] remain with it. */
    static int deleteCount(int existing, int maxFiles) {
        return Math.max(0, existing - maxFiles + 1);
    }

    /** Whether one of [drives] shares time with [drive] (the same drive, also when a replay cut it differently). */
    static boolean overlaps(List<Drive> drives, Drive drive) {
        for (Drive other : drives) {
            if (other.startWall <= drive.endWall && drive.startWall <= other.endWall) return true;
        }
        return false;
    }

    /** Copies the parts into [target] after deleting what it held; a part rolled away since is skipped. */
    static int exportTo(List<Part> parts, File target) throws IOException {
        if (!target.isDirectory() && !target.mkdirs()) throw new IOException("folder not created: " + target);
        File[] previous = target.listFiles();
        if (previous != null) {
            for (File old : previous) {
                if (old.isFile() && !old.delete()) throw new IOException("not deleted: " + old);
            }
        }
        int copied = 0;
        for (Part part : parts) {
            if (!part.file.isFile()) continue;
            try {
                copy(part.file, new File(target, part.file.getName()), part.bytes);
                copied++;
            } catch (FileNotFoundException error) {
                if (part.file.isFile()) throw error;
            }
        }
        return copied;
    }

    private static void copy(File from, File to, long bytes) throws IOException {
        try (InputStream in = new FileInputStream(from); OutputStream out = new FileOutputStream(to, false)) {
            byte[] buffer = new byte[64 * 1024];
            long left = bytes;
            while (left > 0) {
                int read = in.read(buffer, 0, (int) Math.min(buffer.length, left));
                if (read < 0) break;
                out.write(buffer, 0, read);
                left -= read;
            }
        }
    }

    /** The records files, oldest first. */
    static List<File> recordFiles(File dir) {
        List<File> files = new ArrayList<>();
        File[] all = dir.listFiles();
        if (all != null) {
            for (File file : all) if (file.isFile() && fileNumber(file.getName()) >= 0) files.add(file);
        }
        Collections.sort(files, new Comparator<File>() {
            @Override
            public int compare(File a, File b) {
                return Integer.compare(fileNumber(a.getName()), fileNumber(b.getName()));
            }
        });
        return files;
    }

    /** NNNN of records-NNNN.csv, or -1 for another name. */
    static int fileNumber(String name) {
        if (!name.startsWith("records-") || !name.endsWith(".csv")) return -1;
        String digits = name.substring(8, name.length() - 4);
        if (digits.isEmpty() || digits.length() > 9) return -1;
        for (int i = 0; i < digits.length(); i++) if (digits.charAt(i) < '0' || digits.charAt(i) > '9') return -1;
        return Integer.parseInt(digits);
    }

    static String fileName(int number) {
        return String.format(Locale.ROOT, "records-%04d.csv", number);
    }

    // A line cut off when the process died or a write failed would join the next one. A file shorter than the
    // header holds only part of it (the header is written first) and starts again empty.
    private static void endLine(File file) throws IOException {
        long length = file.length();
        if (length == 0) return;
        try (RandomAccessFile access = new RandomAccessFile(file, "rw")) {
            if (length < HEADER_BYTES.length) {
                access.setLength(0);
                return;
            }
            access.seek(length - 1);
            if (access.read() != '\n') {
                access.seek(length);
                access.write('\n');
            }
        }
    }

    private static BufferedReader reader(File file) throws IOException {
        return new BufferedReader(new InputStreamReader(new FileInputStream(file), StandardCharsets.UTF_8));
    }

    private static void closeQuietly(OutputStream out) {
        try {
            if (out != null) out.close();
        } catch (IOException ignored) {
            // The lines written so far stay.
        }
    }

    private static String clean(String text) {
        return text == null ? "" : text.replace(',', '_').replace('\r', '_').replace('\n', '_');
    }

    private static String known(int value, boolean known) {
        return known ? Integer.toString(value) : "";
    }

    private static double number(String text) {
        return text.isEmpty() ? Double.NaN : Double.parseDouble(text);
    }

    private static int integer(String text, int unknown) {
        return text.isEmpty() ? unknown : Integer.parseInt(text);
    }

    private static int tenths(String text) {
        return text.isEmpty() ? 0 : (int) Math.round(Double.parseDouble(text) * 10);
    }

    private static Object orNull(double value) {
        return finite(value) ? (Object) value : JSONObject.NULL;
    }

    private static boolean finite(double value) {
        return !Double.isNaN(value) && !Double.isInfinite(value);
    }

    // ReportLog never throws on the car; the guard keeps the JVM probe (android.jar stubs) running.
    private static void info(String message) {
        try {
            ReportLog.i(TAG, message);
        } catch (Throwable ignored) {
            // Not logged.
        }
    }

    private static void warn(String message, Throwable error) {
        try {
            ReportLog.w(TAG, message, error);
        } catch (Throwable ignored) {
            // Not logged.
        }
    }
}
