package app.morphe.extension.mapsautomotive.patches;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InvalidClassException;
import java.io.InvalidObjectException;
import java.io.ObjectInputStream;
import java.io.ObjectStreamClass;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.TreeSet;
import java.util.function.UnaryOperator;

/**
 * One energy-model file of BYD's DiCarServer and the VehicleEnergyModel built from it.
 * <p>
 * DiCarServer (com.byd.car.server) carries Google's energy_model.proto, whose field numbers are
 * those of Maps' OEM energy model, and per-model data files: Java-serialized VEMBinaryData objects
 * holding protobuf parts. For a car it picks one file, sets the car's mass and capacity, scales the
 * charging-curve and regeneration energy levels to that capacity and picks the temperature-dependent
 * parts (VehicleEnergyModelManager, VEMData). This class does the same with this car's readings, but
 * picks the file by capacity ({@link #tableOrder}): the Dolphin's model id has no file of its
 * own and other cars' ids are not known. Between two drain-at-time sets it sends both interpolated by
 * the outside temperature ({@link #drainSelection}) where DiCarServer sends the nearest.
 * <p>
 * Read only, nothing of BYD's is bundled. The file is deserialized with a class allowlist; every part
 * must be well-formed protobuf (the drain-at-time entries down to their drain_watts), and the drivetrain losses must
 * show zero loss at zero power, as stored or put back from BYD's transposed order ({@link #checkedLosses}). Plain
 * Java without Android APIs, so the JVM probe runs this code.
 */
final class BydVehicleEnergyFile {
    private static final String BYD_CLASS = "com.byd.car.VEMBinaryData";
    private static final Set<String> ALLOWED_CLASSES = new HashSet<>(Arrays.asList(
            "java.util.HashMap", "java.util.ArrayList", "java.lang.Integer", "java.lang.Number", "[B"));
    private static final int MAX_FILE_BYTES = 1 << 20;
    private static final int MIN_KEY_C = -60, MAX_KEY_C = 80;
    /** The BYD SDK has no battery-temperature getter; DiCarServer's files key battery losses at 25 °C. */
    static final int BATTERY_TEMP_C = 25;
    private static final float STANDARD_AIR_DENSITY = 1.225f;
    // Protobuf wire types.
    private static final int VARINT = 0, FIXED64 = 1, LENGTH_DELIMITED = 2, FIXED32 = 5;
    // VehicleEnergyModel fields.
    private static final int VEHICLE_INFO = 1, ROAD_LOAD = 2, DRIVETRAIN_LOSSES = 3, MAX_REGEN_POWER = 4,
            BATTERY_LOSSES = 5, DRAIN_AT_TIME = 6, DRAIN_AT_TEMP = 7, CHARGING_CURVES = 8;
    // VehicleInfo fields; the int ones are IntWithUncertainty {1 mean}, the float ones plain floats.
    private static final int MASS = 2, BATTERY_LEVEL = 3, BATTERY_CAPACITY = 4, AIR_DENSITY = 6,
            EXTERNAL_TEMP = 7, PEAK_MOTOR_POWER = 9, MAX_CHARGING_RATE = 10;
    private static final Set<Integer> SET_VEHICLE_FIELDS = new HashSet<>(Arrays.asList(
            MASS, BATTERY_LEVEL, BATTERY_CAPACITY, AIR_DENSITY, EXTERNAL_TEMP, PEAK_MOTOR_POWER, MAX_CHARGING_RATE));
    // MaxRegenPower {1 RegenerationRateAtEnergyLevel {1 energy_level_wh}}; ChargingCurves {1 ChargingCurveAtPower,
    // 2 ChargingCurvesAtTemperature {2 ChargingCurveAtPower}}; ChargingCurveAtPower {2 TimeToFullBattery
    // {1 energy_to_full_wh}}.
    private static final int REGEN_AT_ENERGY = 1, ENERGY_LEVEL = 1, CURVE_AT_POWER = 1, CURVES_AT_TEMP = 2,
            TEMP_CURVE_AT_POWER = 2, TIME_TO_FULL = 2, ENERGY_TO_FULL = 1;
    // DrivetrainLosses {7 LossesAtSpeed {1 speed (float), 2 LossAtPower {1 power_watts (sint32), 2 losses_watts
    // (IntWithUncertainty)}}}.
    private static final int LOSSES_AT_SPEED = 7, LOSS_SPEED = 1, LOSS_AT_POWER = 2, LOSS_POWER = 1, LOSS_VALUE = 2;
    // DrainAtTime {1 relative_time_sec, 3 drain_watts}; DrainAtTemperature {1 temp_celsius (float), 2 hvac, 3 battery
    // conditioning, 4 total_drain_watts}; the watts are IntWithUncertainty {1 mean (int32), 2 standard_deviation (float)}.
    private static final int DRAIN_SECONDS = 1, DRAIN_WATTS = 3, DRAIN_TEMP = 1, HVAC_DRAIN = 2, TOTAL_DRAIN = 4, MEAN = 1,
            DEVIATION = 2;
    /** Google's rule (reference v1.2): the drain at time holds 15 min after its last point, then the drain at temperature. */
    private static final int DRAIN_AT_TIME_HOLD_S = 900;
    // The tables used and their capacities, each with a fallback name (81_1 and 81_1750_1 are the
    // same file). Not used: 215_1, 251_1 and 425_1, whose drag coefficient is 12x below the others' (km/h
    // units); 81_1620_1 (51,136 Wh), which would split from 420_1 at 48.1 kWh, the Dolphin's own capacity;
    // default.bin with its placeholder capacity; the other variants of 81 and 128. Read from DiCarServer
    // 3.4.0 (BYD firmware 20260610); in 2.1.0 (20260801) 81_1 is a new table (60,900 Wh, 1,694 kg) and
    // 81_1750_1, 425_1 and the other 81 variants are gone.
    private static final String[][] TABLES = {{"420_1"}, {"81_1", "81_1750_1"}, {"128_2", "128_3"}};
    private static final int[] TABLE_CAPACITY_WH = {45120, 64870, 74880};

    final String name, sha256;
    /**
     * Hash of the parts {@link Predictor} reads, after the drivetrain losses are checked: the same for a
     * file whose bytes changed but whose prediction did not (BydSpeedBands keys its pools on it).
     */
    final String predictionSha256;
    final int size;
    /** From the file's vehicle info: its mass and capacity (energy levels scale from it), air density, temperature. */
    final int fileMassKg, fileCapacityWh;
    final float airDensity, fileExternalTemp;
    /** Road load A, B, C (N, N/(m/s), N/(m/s)²). */
    final float roadA, roadB, roadC;
    /**
     * Raise when {@link Predictor} computes differently, so BydSpeedBands starts its pools again. 2 (0.1.6): the drain at
     * time interpolated by temperature, the drain at temperature after it.
     */
    private static final int PREDICTION_VERSION = 2;
    /** Whether the drivetrain losses were stored in transposed order and are used put back ({@link #checkedLosses}). */
    final boolean lossesReordered;
    private final byte[] vehicleInfo, roadLoad, drivetrainLosses, chargingCurves;
    private final TreeMap<Integer, byte[]> maxRegen, batteryLosses;
    private final TreeMap<Integer, List<byte[]>> drainAtTime;
    private final List<byte[]> drainAtTemp;

    /**
     * The asset names to try for a car of this capacity: the table nearest it first (on a tie the
     * smaller), then the next nearest.
     */
    static List<String> tableOrder(int capacityWh) {
        List<String> names = new ArrayList<>();
        boolean[] used = new boolean[TABLES.length];
        for (int round = 0; round < TABLES.length; round++) {
            int nearest = -1;
            for (int i = 0; i < TABLES.length; i++) {
                if (!used[i] && (nearest < 0 || Math.abs(TABLE_CAPACITY_WH[i] - capacityWh)
                        < Math.abs(TABLE_CAPACITY_WH[nearest] - capacityWh))) nearest = i;
            }
            used[nearest] = true;
            for (String name : TABLES[nearest]) names.add(name + ".bin");
        }
        return names;
    }

    /** Reads and checks one file. Throws if it is not a complete, well-formed energy-model file. */
    static BydVehicleEnergyFile read(InputStream in, String name) throws IOException {
        byte[] bytes = readAll(in);
        Object object;
        try (ObjectInputStream objects = new AllowlistInputStream(new ByteArrayInputStream(bytes))) {
            object = objects.readObject();
        } catch (ClassNotFoundException error) {
            throw new InvalidObjectException(error.toString());
        }
        if (!(object instanceof VEMBinaryData)) throw new InvalidObjectException("not an energy-model file");
        try {
            return new BydVehicleEnergyFile(name, bytes, (VEMBinaryData) object);
        } catch (IllegalArgumentException error) {
            // A malformed part inside a message.
            throw invalid(error.getMessage());
        }
    }

    private BydVehicleEnergyFile(String name, byte[] bytes, VEMBinaryData data) throws IOException {
        this.name = name;
        size = bytes.length;
        sha256 = sha256(bytes);
        vehicleInfo = required(data.mVehicleInfo, "vehicle info");
        roadLoad = required(data.mRoadLoad, "road load");
        byte[] storedLosses = required(data.mDrivetrainLosses, "drivetrain losses");
        drivetrainLosses = checkedLosses(storedLosses);
        lossesReordered = drivetrainLosses != storedLosses;
        chargingCurves = data.mChargingCurves;
        maxRegen = parts(data.mMaxRegenPowerMap, "max regen");
        batteryLosses = parts(data.mBatteryLossesMap, "battery losses");
        drainAtTime = partLists(data.mDrainAtTimeMap, "drain at time");
        drainAtTemp = data.mDrainAtTemperatureList == null ? Collections.emptyList()
                : partList(data.mDrainAtTemperatureList, "drain at temperature");

        int mass = 0, capacity = 0;
        float density = STANDARD_AIR_DENSITY, temp = 23f;
        for (Reader field = new Reader(vehicleInfo); field.next(); ) {
            if (field.is(MASS, LENGTH_DELIMITED)) mass = mean(field.message());
            else if (field.is(BATTERY_CAPACITY, LENGTH_DELIMITED)) capacity = mean(field.message());
            else if (field.is(AIR_DENSITY, FIXED32)) density = field.fixed32Float();
            else if (field.is(EXTERNAL_TEMP, FIXED32)) temp = field.fixed32Float();
        }
        // default.bin carries DiCarServer's 190,000 Wh placeholder.
        if (capacity < 5000 || capacity > 200000) throw invalid("capacity " + capacity);
        if (!(density >= 0.5f && density <= 2f)) throw invalid("air density " + density);
        if (!(temp >= MIN_KEY_C && temp <= MAX_KEY_C)) throw invalid("temperature " + temp);
        fileMassKg = mass;
        fileCapacityWh = capacity;
        airDensity = density;
        fileExternalTemp = temp;

        float[] road = new float[4];
        for (Reader field = new Reader(roadLoad); field.next(); ) {
            if (field.field >= 1 && field.field <= 3 && field.wireType == LENGTH_DELIMITED) {
                for (Reader value = new Reader(field.message()); value.next(); ) {
                    if (value.is(1, FIXED32)) road[field.field] = value.fixed32Float();
                }
            }
        }
        roadA = road[1];
        roadB = road[2];
        roadC = road[3];
        // The bounds of BydVehicleModel's road load.
        if (!(roadA >= 0 && roadA <= 1000 && roadB >= 0 && roadB <= 20 && roadC > 0 && roadC <= 2))
            throw invalid("road load " + roadA + "/" + roadB + "/" + roadC);

        // The parts that are rewritten must parse as their messages: regen and charging curves (scaled), and every
        // drain-at-time set down to its drain_watts (rebuilt between two keys by encode, read by the Predictor), so that
        // encode never fails on a file read accepted.
        for (byte[] regen : maxRegen.values()) scaleRegen(regen, capacity);
        if (chargingCurves != null) scaleChargingCurves(chargingCurves, capacity);
        for (List<byte[]> set : drainAtTime.values()) {
            setPoints(set);
            deviations(set);
        }
        predictionSha256 = predictionHash();
    }

    /**
     * {@link #predictionSha256}: the Predictor's version, the file's mass, capacity and temperature (used without the
     * car's), road load, drivetrain losses, regen, battery losses, drain at time, drain at temperature.
     */
    private String predictionHash() {
        ByteArrayOutputStream parts = new ByteArrayOutputStream();
        writeVarint(parts, PREDICTION_VERSION);
        writeVarint(parts, Float.floatToIntBits(fileExternalTemp) & 0xFFFFFFFFL);
        writeVarint(parts, fileMassKg);
        writeVarint(parts, fileCapacityWh);
        writeMessage(parts, 1, roadLoad);
        writeMessage(parts, 2, drivetrainLosses);
        for (Map.Entry<Integer, byte[]> entry : maxRegen.entrySet()) {
            writeVarintField(parts, 3, entry.getKey());
            writeMessage(parts, 3, entry.getValue());
        }
        for (Map.Entry<Integer, byte[]> entry : batteryLosses.entrySet()) {
            writeVarintField(parts, 4, entry.getKey());
            writeMessage(parts, 4, entry.getValue());
        }
        for (Map.Entry<Integer, List<byte[]>> entry : drainAtTime.entrySet()) {
            writeVarintField(parts, 5, entry.getKey());
            for (byte[] part : entry.getValue()) writeMessage(parts, 5, part);
        }
        for (byte[] part : drainAtTemp) writeMessage(parts, 6, part);
        return sha256(parts.toByteArray());
    }

    /**
     * The model for Maps, as DiCarServer assembles it: this car's vehicle info (the file's other
     * fields are kept), the file's road load, drivetrain losses and drain at temperature, the max
     * regeneration nearest the outside temperature, the battery losses at {@link #BATTERY_TEMP_C}, and
     * regeneration and charging-curve energies scaled to the capacity. A motor power or charging rate of 0
     * is left out, as in DiCarServer's model. Unlike DiCarServer, the drain at time between two keys is
     * both sets interpolated by the outside temperature ({@link #drainAtTimeEntries}); at a key or at and
     * outside the end keys it is the nearest set as stored.
     */
    byte[] encode(int massKg, int batteryLevelWh, int capacityWh, int externalTempC, int peakMotorPowerW,
                  int maxChargingRateW) throws IOException {
        return assemble(massKg, batteryLevelWh, capacityWh, externalTempC, peakMotorPowerW, maxChargingRateW, roadLoad,
                drivetrainLosses, drainAtTimeEntries(externalTempC), drainAtTemp);
    }

    /**
     * The model for Maps with learned values ({@link BydModelParts.Sent}): {@link #encode}'s bytes when {@code sent} is
     * the table unchanged. Otherwise as encode, but road load A, B and C times the rolling, linear and drag multipliers
     * (other road-load fields kept); every drivetrain losses_watts mean times the drive-loss multiplier at power_watts
     * 0 or more and the regen-loss one below 0 ({@link Math#round(double)}, a zero mean left out, every other field
     * kept); the drain at time from {@code sent} when it has one; the drain at temperature from {@code sent} at its
     * temperatures (HVAC = total) with the table's entries below its first and above its last temperature, when it has
     * one. Throws IOException for no {@code sent}, a multiplier that is not finite and above 0, drain values that are
     * missing, not ascending or negative, or losses that no longer have zero loss at zero power; the caller then sends
     * encode's model.
     */
    byte[] encodeLearned(int massKg, int batteryLevelWh, int capacityWh, int externalTempC, int peakMotorPowerW,
                         int maxChargingRateW, BydModelParts.Sent sent) throws IOException {
        if (sent == null) throw new IOException("learned model: none");
        if (sent.isTable()) {
            return encode(massKg, batteryLevelWh, capacityWh, externalTempC, peakMotorPowerW, maxChargingRateW);
        }
        checkMultiplier(sent.rolling, "rolling");
        checkMultiplier(sent.linear, "linear");
        checkMultiplier(sent.drag, "drag");
        checkMultiplier(sent.driveLoss, "drive loss");
        checkMultiplier(sent.regenLoss, "regen loss");
        try {
            return assemble(massKg, batteryLevelWh, capacityWh, externalTempC, peakMotorPowerW, maxChargingRateW,
                    scaledRoadLoad(sent.rolling, sent.linear, sent.drag), scaledLosses(sent.driveLoss, sent.regenLoss),
                    sent.drainAtTime == null ? drainAtTimeEntries(externalTempC) : sentDrainAtTime(sent.drainAtTime),
                    sent.drainTemps == null ? drainAtTemp : sentDrainAtTemp(sent.drainTemps, sent.drainTotals));
        } catch (IllegalArgumentException error) {
            throw new IOException("learned model: " + error.getMessage());
        }
    }

    /**
     * The model's fields in number order: this car's vehicle info, the given road load and drivetrain losses, the max
     * regen and battery losses as {@link #encode} picks them, the given drain entries, the scaled charging curves.
     */
    private byte[] assemble(int massKg, int batteryLevelWh, int capacityWh, int externalTempC, int peakMotorPowerW,
                            int maxChargingRateW, byte[] road, byte[] losses, List<byte[]> drainTime,
                            List<byte[]> drainTemp) throws IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream(4096);
        writeMessage(out, VEHICLE_INFO, vehicleInfo(massKg, batteryLevelWh, capacityWh, externalTempC,
                peakMotorPowerW, maxChargingRateW));
        writeMessage(out, ROAD_LOAD, road);
        writeMessage(out, DRIVETRAIN_LOSSES, losses);
        if (!maxRegen.isEmpty()) {
            writeMessage(out, MAX_REGEN_POWER, scaleRegen(maxRegen.get(nearestKey(maxRegen, externalTempC)), capacityWh));
        }
        if (!batteryLosses.isEmpty()) {
            writeMessage(out, BATTERY_LOSSES, batteryLosses.get(nearestKey(batteryLosses, BATTERY_TEMP_C)));
        }
        for (byte[] entry : drainTime) writeMessage(out, DRAIN_AT_TIME, entry);
        for (byte[] entry : drainTemp) writeMessage(out, DRAIN_AT_TEMP, entry);
        if (chargingCurves != null) writeMessage(out, CHARGING_CURVES, scaleChargingCurves(chargingCurves, capacityWh));
        return out.toByteArray();
    }

    // The learned model's parts.

    private static void checkMultiplier(double multiplier, String what) throws IOException {
        if (!(multiplier > 0) || Double.isInfinite(multiplier)) throw new IOException("learned model: " + what + " " + multiplier);
    }

    /** The road load with A, B and C (field 1 of their messages) times the multipliers; everything else as stored. */
    private byte[] scaledRoadLoad(double rolling, double linear, double drag) {
        double[] multipliers = {0, rolling, linear, drag};
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        for (Reader field = new Reader(roadLoad); field.next(); ) {
            if (field.field < 1 || field.field > 3 || field.wireType != LENGTH_DELIMITED) {
                field.copyTo(out);
                continue;
            }
            ByteArrayOutputStream value = new ByteArrayOutputStream();
            for (Reader inner = new Reader(field.message()); inner.next(); ) {
                if (!inner.is(1, FIXED32)) {
                    inner.copyTo(value);
                    continue;
                }
                float scaled = (float) (inner.fixed32Float() * multipliers[field.field]);
                if (Float.isNaN(scaled) || Float.isInfinite(scaled)) throw new IllegalArgumentException("road load " + scaled);
                writeFloat(value, 1, scaled);
            }
            writeMessage(out, field.field, value.toByteArray());
        }
        return out.toByteArray();
    }

    /**
     * The drivetrain losses Maps gets ({@link #checkedLosses}) with each losses_watts mean times {@code driveLoss} at a
     * power of 0 or more and {@code regenLoss} below; the result must still pass checkedLosses as stored.
     */
    private byte[] scaledLosses(double driveLoss, double regenLoss) throws IOException {
        byte[] scaled = rewrite(drivetrainLosses, LOSSES_AT_SPEED, atSpeed -> rewrite(atSpeed, LOSS_AT_POWER, atPower -> {
            double multiplier = lossPoint(atPower).power >= 0 ? driveLoss : regenLoss;
            return rewrite(atPower, LOSS_VALUE, value -> scaledMeans(value, multiplier));
        }));
        if (checkedLosses(scaled) != scaled) throw new IOException("learned model: drivetrain losses not zero at zero power");
        return scaled;
    }

    /** An IntWithUncertainty with each mean times {@code multiplier}, rounded; a zero mean is left out (proto3). */
    private static byte[] scaledMeans(byte[] value, double multiplier) {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        for (Reader field = new Reader(value); field.next(); ) {
            if (!field.is(MEAN, VARINT)) {
                field.copyTo(out);
                continue;
            }
            long scaled = Math.round((int) field.varint * multiplier);
            if (scaled < Integer.MIN_VALUE || scaled > Integer.MAX_VALUE) throw new IllegalArgumentException("loss " + scaled);
            if (scaled != 0) writeVarintField(out, MEAN, (int) scaled);
        }
        return out.toByteArray();
    }

    /** Drain-at-time entries {1 relative_time_sec (0 left out), 3 drain_watts {1 mean}} from {seconds, watts}. */
    private static List<byte[]> sentDrainAtTime(int[][] points) {
        if (points.length != 2 || points[0] == null || points[1] == null || points[0].length == 0
                || points[0].length != points[1].length) {
            throw new IllegalArgumentException("drain at time points");
        }
        List<byte[]> entries = new ArrayList<>(points[0].length);
        for (int i = 0; i < points[0].length; i++) {
            if (points[0][i] < 0 || i > 0 && points[0][i] <= points[0][i - 1] || points[1][i] < 0) {
                throw new IllegalArgumentException("drain at time " + points[0][i] + " s " + points[1][i] + " W");
            }
            ByteArrayOutputStream entry = new ByteArrayOutputStream();
            if (points[0][i] != 0) writeVarintField(entry, DRAIN_SECONDS, points[0][i]);
            writeMessage(entry, DRAIN_WATTS, intWithUncertainty(points[1][i]));
            entries.add(entry.toByteArray());
        }
        return entries;
    }

    /**
     * Drain-at-temperature entries {1 temp_celsius, 2 hvac {1 mean}, 4 total {1 mean}} (hvac = total) at the given
     * temperatures, after the table's entries below the first and before those above the last, in temperature order
     * (entries at one temperature in stored order); the table's entries are kept as stored.
     */
    private List<byte[]> sentDrainAtTemp(float[] temps, int[] totals) {
        if (temps.length == 0) throw new IllegalArgumentException("drain at temperature empty");
        for (int i = 0; i < temps.length; i++) {
            if (Float.isNaN(temps[i]) || Float.isInfinite(temps[i]) || i > 0 && !(temps[i] > temps[i - 1]) || totals[i] < 0) {
                throw new IllegalArgumentException("drain at temperature " + temps[i] + " °C " + totals[i] + " W");
            }
        }
        float first = temps[0], last = temps[temps.length - 1];
        List<Map.Entry<Float, byte[]>> below = new ArrayList<>(), above = new ArrayList<>();
        for (byte[] entry : drainAtTemp) {
            float temp = 0;
            for (Reader field = new Reader(entry); field.next(); ) {
                // -0.0 is the absent 0.0; the last temperature field counts, as in the Predictor.
                if (field.is(DRAIN_TEMP, FIXED32)) temp = field.fixed32Float() + 0.0f;
            }
            if (temp < first) below.add(new AbstractMap.SimpleImmutableEntry<>(temp, entry));
            else if (temp > last) above.add(new AbstractMap.SimpleImmutableEntry<>(temp, entry));
        }
        // List.sort is stable.
        below.sort(Map.Entry.comparingByKey());
        above.sort(Map.Entry.comparingByKey());
        List<byte[]> entries = new ArrayList<>(below.size() + temps.length + above.size());
        for (Map.Entry<Float, byte[]> entry : below) entries.add(entry.getValue());
        for (int i = 0; i < temps.length; i++) {
            ByteArrayOutputStream entry = new ByteArrayOutputStream();
            writeFloat(entry, DRAIN_TEMP, temps[i]);
            byte[] watts = intWithUncertainty(totals[i]);
            writeMessage(entry, HVAC_DRAIN, watts);
            writeMessage(entry, TOTAL_DRAIN, watts);
            entries.add(entry.toByteArray());
        }
        for (Map.Entry<Float, byte[]> entry : above) entries.add(entry.getValue());
        return entries;
    }

    /** This table's own energy prediction for BydSpeedBands and the calibration's prior; throws if a part it needs is malformed. */
    Predictor predictor() {
        return new Predictor(this);
    }

    /**
     * Battery energy this table predicts for one interval (for the speed-band comparison in
     * BydSpeedBands and, split into parts ({@link #parts}), the PC replay's learner: not sent to Maps, and not Maps' own
     * computation). Road load A + B·v + C·v² at the mean speed plus the change of kinetic energy with the given mass
     * give the wheel power; then drivetrain losses at (speed, wheel power), regeneration capped by the max regen power
     * at the energy level, the auxiliary power ({@link #auxiliaryWatts}: the drain at time Maps gets, then the drain at
     * temperature, as Google's rule switches), and the battery losses at {@link #BATTERY_TEMP_C}. Flat road: the grade
     * is not known.
     */
    static final class Predictor implements BydModelParts.Base {
        /** The file's {@link #predictionSha256}. */
        private final String identity;
        private final float a, b, c;
        private final int fileCapacityWh;
        private final float[] lossSpeeds;
        private final int[][] lossPowers, lossValues;
        private final int[][] battery;
        private final TreeMap<Integer, int[][]> regen = new TreeMap<>();
        /**
         * The drain at time {@link #encode} sends at each whole temperature from the first key to the last, from index 0
         * at {@link #drainFirstKey}: {seconds, watts}, null without points; null if the file has no drain at time.
         */
        private final int[][][] drainByTemp;
        private final int drainFirstKey;
        /** Drain at temperature: total watts at ascending temperatures; null if the file has none. */
        private final float[] drainTemps;
        private final int[] drainTotals;

        private Predictor(BydVehicleEnergyFile file) {
            identity = file.predictionSha256;
            a = file.roadA; b = file.roadB; c = file.roadC;
            fileCapacityWh = file.fileCapacityWh;
            TreeMap<Float, int[][]> speeds = new TreeMap<>();
            for (Reader entry = new Reader(file.drivetrainLosses); entry.next(); ) {
                if (!entry.is(7, LENGTH_DELIMITED)) continue;
                float speed = 0;
                List<int[]> points = new ArrayList<>();
                for (Reader field = new Reader(entry.message()); field.next(); ) {
                    if (field.is(1, FIXED32)) speed = field.fixed32Float();
                    else if (field.is(2, LENGTH_DELIMITED)) points.add(powerAndValue(field.message()));
                }
                if (!points.isEmpty()) speeds.put(speed, sorted(points));
            }
            if (speeds.isEmpty()) throw new IllegalArgumentException("drivetrain losses");
            lossSpeeds = new float[speeds.size()];
            lossPowers = new int[speeds.size()][];
            lossValues = new int[speeds.size()][];
            int i = 0;
            for (Map.Entry<Float, int[][]> entry : speeds.entrySet()) {
                lossSpeeds[i] = entry.getKey(); lossPowers[i] = entry.getValue()[0]; lossValues[i] = entry.getValue()[1]; i++;
            }
            List<int[]> losses = new ArrayList<>();
            if (!file.batteryLosses.isEmpty()) {
                for (Reader field = new Reader(file.batteryLosses.get(nearestKey(file.batteryLosses, BATTERY_TEMP_C))); field.next(); ) {
                    if (field.is(4, LENGTH_DELIMITED)) losses.add(powerAndValue(field.message()));
                }
            }
            battery = losses.isEmpty() ? null : sorted(losses);
            for (Map.Entry<Integer, byte[]> entry : file.maxRegen.entrySet()) {
                List<int[]> rates = new ArrayList<>();
                for (Reader field = new Reader(entry.getValue()); field.next(); ) {
                    if (!field.is(REGEN_AT_ENERGY, LENGTH_DELIMITED)) continue;
                    int energy = 0, power = 0;
                    for (Reader value = new Reader(field.message()); value.next(); ) {
                        if (value.is(ENERGY_LEVEL, VARINT)) energy = (int) value.varint;
                        else if (value.is(2, VARINT)) power = (int) value.varint;
                    }
                    rates.add(new int[]{energy, power});
                }
                if (!rates.isEmpty()) regen.put(entry.getKey(), sorted(rates));
            }
            if (file.drainAtTime.isEmpty()) {
                drainFirstKey = 0;
                drainByTemp = null;
            } else {
                drainFirstKey = file.drainAtTime.firstKey();
                drainByTemp = new int[file.drainAtTime.lastKey() - drainFirstKey + 1][][];
                for (int k = 0; k < drainByTemp.length; k++) {
                    int[][] points = file.drainPoints(file.drainSelection(drainFirstKey + k));
                    drainByTemp[k] = points[0].length == 0 ? null : points;
                }
            }
            TreeMap<Float, Integer> totals = new TreeMap<>();
            for (byte[] entry : file.drainAtTemp) {
                float temp = 0;
                Integer total = null;
                for (Reader field = new Reader(entry); field.next(); ) {
                    // -0.0 is the absent 0.0.
                    if (field.is(DRAIN_TEMP, FIXED32)) temp = field.fixed32Float() + 0.0f;
                    else if (field.is(TOTAL_DRAIN, LENGTH_DELIMITED)) total = mean(field.message());
                }
                // An entry without a total or at a temperature that is not finite is left out; the last at a temperature counts.
                if (total != null && !Float.isNaN(temp) && !Float.isInfinite(temp)) totals.put(temp, total);
            }
            drainTemps = totals.isEmpty() ? null : new float[totals.size()];
            drainTotals = totals.isEmpty() ? null : new int[totals.size()];
            i = 0;
            for (Map.Entry<Float, Integer> entry : totals.entrySet()) {
                drainTemps[i] = entry.getKey(); drainTotals[i] = entry.getValue(); i++;
            }
        }

        /**
         * Wh from the battery (negative: regenerated) for an interval of {@code seconds} from
         * {@code fromKmh} to {@code toKmh}, {@code sinceStartS} after the drive started, with the
         * car's energy level and capacity for the regen limit.
         */
        double intervalWh(double fromKmh, double toKmh, double seconds, double massKg, double sinceStartS,
                          int outsideC, int energyWh, int capacityWh) {
            if (!(seconds > 0)) return 0;
            double from = fromKmh / 3.6, to = toKmh / 3.6, speed = (from + to) / 2;
            double wheel = (a + b * speed + c * speed * speed) * speed + 0.5 * massKg * (to * to - from * from) / seconds;
            double motor = wheel + drivetrainLoss(speed, wheel);
            if (motor < 0 && !regen.isEmpty() && capacityWh > 0) {
                double level = (double) energyWh / capacityWh * fileCapacityWh;
                motor = Math.max(motor, -interpolate(regen.get(nearestKey(regen, outsideC)), level));
            }
            double pack = motor + auxiliaryWatts(sinceStartS + seconds / 2, outsideC);
            double total = pack + (battery == null ? 0 : interpolate(battery, pack));
            return total * seconds / 3600.0;
        }

        /**
         * Auxiliary power (W) {@code atS} after the drive started at {@code outsideC}: the drain at time {@link #encode}
         * sends, its last value held, up to {@link #DRAIN_AT_TIME_HOLD_S} after its last point; after that the drain at
         * temperature's total, linear by temperature with the end values held. Without drain at temperature the drain
         * at time holds on; without drain at time (or with no points at this temperature) the drain at temperature
         * from the start; without either, 0.
         */
        double auxiliaryWatts(double atS, int outsideC) {
            int[][] time = drainByTemp == null ? null : drainByTemp[Math.min(Math.max(outsideC, drainFirstKey),
                    drainFirstKey + drainByTemp.length - 1) - drainFirstKey];
            if (time != null && (drainTemps == null || atS <= time[0][time[0].length - 1] + DRAIN_AT_TIME_HOLD_S)) {
                return interpolate(time, atS);
            }
            return drainTemps == null ? 0 : interpolate(drainTemps, drainTotals, outsideC);
        }

        /**
         * {@link #intervalWh}'s steps for one interval, each kept ({@link BydModelParts.Parts}): the wheel power's
         * terms A·v, C·v³ and B·v² plus the change of kinetic energy, the drivetrain loss at (speed, wheel power) as a
         * drive loss at a wheel power of 0 or more and a regen loss below, the regeneration cap (capped less uncapped
         * motor power), the battery losses at the pack power and the auxiliary power, each times the interval;
         * {@code totalWh} is intervalWh's. All 0 for an interval that is not longer than 0 s.
         */
        @Override
        public BydModelParts.Parts parts(double fromKmh, double toKmh, double seconds, double massKg, double sinceStartS,
                                         int outsideC, int energyWh, int capacityWh) {
            BydModelParts.Parts parts = new BydModelParts.Parts();
            if (!(seconds > 0)) return parts;
            double from = fromKmh / 3.6, to = toKmh / 3.6, speed = (from + to) / 2;
            double wheel = (a + b * speed + c * speed * speed) * speed + 0.5 * massKg * (to * to - from * from) / seconds;
            double loss = drivetrainLoss(speed, wheel);
            double uncapped = wheel + loss, motor = uncapped;
            if (motor < 0 && !regen.isEmpty() && capacityWh > 0) {
                double level = (double) energyWh / capacityWh * fileCapacityWh;
                motor = Math.max(motor, -interpolate(regen.get(nearestKey(regen, outsideC)), level));
            }
            double aux = auxiliaryWatts(sinceStartS + seconds / 2, outsideC);
            double pack = motor + aux;
            double total = pack + (battery == null ? 0 : interpolate(battery, pack));
            parts.rollingWh = a * speed * seconds / 3600.0;
            parts.dragWh = c * speed * speed * speed * seconds / 3600.0;
            parts.otherWheelWh = (b * speed * speed + 0.5 * massKg * (to * to - from * from) / seconds) * seconds / 3600.0;
            if (wheel >= 0) parts.driveLossWh = loss * seconds / 3600.0;
            else parts.regenLossWh = loss * seconds / 3600.0;
            parts.capWh = (motor - uncapped) * seconds / 3600.0;
            parts.batteryLossWh = (total - pack) * seconds / 3600.0;
            parts.tableAuxWh = aux * seconds / 3600.0;
            parts.totalWh = intervalWh(fromKmh, toKmh, seconds, massKg, sinceStartS, outsideC, energyWh, capacityWh);
            parts.seconds = seconds;
            return parts;
        }

        /** The drain at temperature's total (W): linear between its entries, the end values outside; NaN without any. */
        @Override
        public double tableDrainAtTemperature(double tempC) {
            return drainTemps == null ? Double.NaN : interpolate(drainTemps, drainTotals, tempC);
        }

        /** {@link #auxiliaryWatts}. */
        @Override
        public double tableAuxWatts(double atS, int outsideC) {
            return auxiliaryWatts(atS, outsideC);
        }

        /** The file's {@link #predictionSha256}. */
        @Override
        public String identity() {
            return identity;
        }

        private double drivetrainLoss(double speed, double power) {
            int upper = 0;
            while (upper < lossSpeeds.length && lossSpeeds[upper] < speed) upper++;
            if (upper == 0) return interpolate(lossPowers[0], lossValues[0], power);
            if (upper == lossSpeeds.length) return interpolate(lossPowers[upper - 1], lossValues[upper - 1], power);
            int lower = upper - 1;
            double low = interpolate(lossPowers[lower], lossValues[lower], power);
            double high = interpolate(lossPowers[upper], lossValues[upper], power);
            return low + (high - low) * (speed - lossSpeeds[lower]) / (lossSpeeds[upper] - lossSpeeds[lower]);
        }

        /** {power (sint32), value (IntWithUncertainty)}, as drivetrain and battery losses store them. */
        private static int[] powerAndValue(byte[] message) {
            int power = 0, value = 0;
            for (Reader field = new Reader(message); field.next(); ) {
                if (field.is(1, VARINT)) power = (int) (field.varint >>> 1) ^ -(int) (field.varint & 1);
                else if (field.is(2, LENGTH_DELIMITED)) value = mean(field.message());
            }
            return new int[]{power, value};
        }

        private static int[][] sorted(List<int[]> points) {
            points.sort((x, y) -> Integer.compare(x[0], y[0]));
            int[][] out = {new int[points.size()], new int[points.size()]};
            for (int i = 0; i < points.size(); i++) { out[0][i] = points.get(i)[0]; out[1][i] = points.get(i)[1]; }
            return out;
        }

        private static double interpolate(int[][] table, double x) {
            return interpolate(table[0], table[1], x);
        }

        /** Linear between points, the end values outside them. */
        private static double interpolate(int[] xs, int[] ys, double x) {
            if (x <= xs[0]) return ys[0];
            for (int i = 1; i < xs.length; i++) {
                if (x <= xs[i]) return xs[i] == xs[i - 1] ? ys[i] : ys[i - 1] + (ys[i] - ys[i - 1]) * (x - xs[i - 1]) / (xs[i] - xs[i - 1]);
            }
            return ys[ys.length - 1];
        }

        /** The same at distinct, ascending temperatures (drain at temperature). */
        private static double interpolate(float[] xs, int[] ys, double x) {
            if (x <= xs[0]) return ys[0];
            for (int i = 1; i < xs.length; i++) {
                if (x <= xs[i]) return ys[i - 1] + (ys[i] - ys[i - 1]) * (x - xs[i - 1]) / ((double) xs[i] - xs[i - 1]);
            }
            return ys[ys.length - 1];
        }
    }

    // Drain at time.

    /** The drain at time for one outside temperature: the sets of two keys around it, or one set. */
    private static final class DrainSelection {
        final int lowerKey, upperKey, tempC;

        DrainSelection(int lowerKey, int upperKey, int tempC) {
            this.lowerKey = lowerKey;
            this.upperKey = upperKey;
            this.tempC = tempC;
        }

        /** One set, sent as stored. */
        boolean single() {
            return lowerKey == upperKey;
        }

        /** The upper key's weight, 0 to 1 (0 for one set). */
        double weight() {
            return single() ? 0 : (double) (tempC - lowerKey) / (upperKey - lowerKey);
        }

        /** {@code low} to {@code high} at the temperature; multiplied before dividing, exact where the result is a half. */
        double between(double low, double high) {
            return single() ? low : low + (high - low) * (tempC - lowerKey) / (upperKey - lowerKey);
        }
    }

    /**
     * The drain at time for an outside temperature, null if the file has none. Strictly between two keys: both sets,
     * weighted linearly by the temperature. At a key, at or outside the end keys, or next to an empty set: the set
     * {@link #nearestKey} picks, as DiCarServer does.
     */
    private DrainSelection drainSelection(int externalTempC) {
        if (drainAtTime.isEmpty()) return null;
        if (externalTempC > drainAtTime.firstKey() && externalTempC < drainAtTime.lastKey()) {
            int lower = drainAtTime.floorKey(externalTempC), upper = drainAtTime.ceilingKey(externalTempC);
            if (lower != upper && !drainAtTime.get(lower).isEmpty() && !drainAtTime.get(upper).isEmpty()) {
                return new DrainSelection(lower, upper, externalTempC);
            }
        }
        int key = nearestKey(drainAtTime, externalTempC);
        return new DrainSelection(key, key, externalTempC);
    }

    /**
     * The drain-at-time entries {@link #encode} sends: one set as stored, or one entry per time point of either set
     * ({@link #drainPoints}): relative_time_sec and drain_watts {mean, and the standard deviation of the lower key's
     * entry at that time if it has one}. Zero values are left out (proto3); drain_watts is written even when empty, as
     * BYD's entry at 0 s is.
     */
    private List<byte[]> drainAtTimeEntries(int externalTempC) {
        DrainSelection drain = drainSelection(externalTempC);
        if (drain == null) return Collections.emptyList();
        if (drain.single()) return drainAtTime.get(drain.lowerKey);
        int[][] points = drainPoints(drain);
        Map<Integer, byte[]> deviations = deviations(drainAtTime.get(drain.lowerKey));
        List<byte[]> entries = new ArrayList<>(points[0].length);
        for (int i = 0; i < points[0].length; i++) {
            ByteArrayOutputStream watts = new ByteArrayOutputStream();
            if (points[1][i] != 0) writeVarintField(watts, MEAN, points[1][i]);
            byte[] deviation = deviations.get(points[0][i]);
            if (deviation != null) watts.write(deviation, 0, deviation.length);
            ByteArrayOutputStream entry = new ByteArrayOutputStream();
            if (points[0][i] != 0) writeVarintField(entry, DRAIN_SECONDS, points[0][i]);
            writeMessage(entry, DRAIN_WATTS, watts.toByteArray());
            entries.add(entry.toByteArray());
        }
        return entries;
    }

    /**
     * {seconds, watts}, ascending in time. One set: its points. Two sets: the union of their times, each set
     * interpolated in time (end values held), then lower + (upper − lower) · weight, rounded half up
     * ({@link Math#round(double)}).
     */
    private int[][] drainPoints(DrainSelection drain) {
        int[][] lower = setPoints(drainAtTime.get(drain.lowerKey));
        if (drain.single()) return lower;
        int[][] upper = setPoints(drainAtTime.get(drain.upperKey));
        TreeSet<Integer> times = new TreeSet<>();
        for (int time : lower[0]) times.add(time);
        for (int time : upper[0]) times.add(time);
        int[][] points = {new int[times.size()], new int[times.size()]};
        int i = 0;
        for (int time : times) {
            points[0][i] = time;
            points[1][i++] = (int) Math.round(drain.between(Predictor.interpolate(lower, time), Predictor.interpolate(upper, time)));
        }
        return points;
    }

    /** One set's {seconds, watts (mean)}, ascending in time (entries at the same time in stored order). */
    private static int[][] setPoints(List<byte[]> set) {
        List<int[]> points = new ArrayList<>(set.size());
        for (byte[] part : set) {
            int seconds = 0, watts = 0;
            for (Reader field = new Reader(part); field.next(); ) {
                if (field.is(DRAIN_SECONDS, VARINT)) seconds = (int) field.varint;
                else if (field.is(DRAIN_WATTS, LENGTH_DELIMITED)) watts = mean(field.message());
            }
            points.add(new int[]{seconds, watts});
        }
        return Predictor.sorted(points);
    }

    /** Each time's standard-deviation field as stored (tag included), from the first entry at that time that has one. */
    private static Map<Integer, byte[]> deviations(List<byte[]> set) {
        Map<Integer, byte[]> deviations = new TreeMap<>();
        for (byte[] part : set) {
            int seconds = 0;
            byte[] deviation = null;
            for (Reader field = new Reader(part); field.next(); ) {
                if (field.is(DRAIN_SECONDS, VARINT)) {
                    seconds = (int) field.varint;
                } else if (field.is(DRAIN_WATTS, LENGTH_DELIMITED)) {
                    for (Reader value = new Reader(field.message()); value.next(); ) {
                        if (!value.is(DEVIATION, FIXED32)) continue;
                        ByteArrayOutputStream out = new ByteArrayOutputStream();
                        value.copyTo(out);
                        deviation = out.toByteArray();
                    }
                }
            }
            if (deviation != null && !deviations.containsKey(seconds)) deviations.put(seconds, deviation);
        }
        return deviations;
    }

    /**
     * The drain-at-time key nearest an outside temperature (DiCarServer's choice), or null if the file has none;
     * {@link #drainAtTimeText} names the sets {@link #encode} sends.
     */
    Integer drainAtTimeKey(int externalTempC) {
        return drainAtTime.isEmpty() ? null : nearestKey(drainAtTime, externalTempC);
    }

    /**
     * The drain-at-time sets {@link #encode} sends for an outside temperature: between two keys "23/35@0.25" (the keys
     * and the upper key's weight), else the one key ("35"); null if the file has none.
     */
    String drainAtTimeText(int externalTempC) {
        DrainSelection drain = drainSelection(externalTempC);
        if (drain == null) return null;
        return drain.single() ? String.valueOf(drain.lowerKey)
                : String.format(Locale.ROOT, "%d/%d@%.2f", drain.lowerKey, drain.upperKey, drain.weight());
    }

    /** The file name without ".bin", for the dialog. */
    String table() {
        return name.endsWith(".bin") ? name.substring(0, name.length() - 4) : name;
    }

    /** For the log. */
    String describe() {
        return String.format(Locale.ROOT, "file=%s;bytes=%d;sha256=%s;file_mass_kg=%d;file_capacity_wh=%d"
                        + ";road_load=%s/%s/%s;air_density=%s;regen_keys=%s;losses_keys=%s;drain_time_keys=%s"
                        + ";drain_temp=%d;charging_curves=%s;drivetrain_losses=%s", name, size, sha256, fileMassKg, fileCapacityWh,
                roadA, roadB, roadC, airDensity, maxRegen.keySet(), batteryLosses.keySet(), drainAtTime.keySet(),
                drainAtTemp.size(), chargingCurves != null, lossesReordered ? "reordered" : "as_stored");
    }

    /** The temperature keys used for an outside temperature, for the log; the drain at time as {@link #drainAtTimeText}. */
    String describeSelection(int externalTempC) {
        String drain = drainAtTimeText(externalTempC);
        return "regen_key=" + (maxRegen.isEmpty() ? "none" : nearestKey(maxRegen, externalTempC))
                + ";drain_time_key=" + (drain == null ? "none" : drain)
                + ";losses_key=" + (batteryLosses.isEmpty() ? "none" : nearestKey(batteryLosses, BATTERY_TEMP_C));
    }

    /**
     * DiCarServer's choice (VEMData.getDataByTemp): the lowest or highest key outside the range, else
     * the key below, or the one above from their midpoint (integer division) up.
     */
    static int nearestKey(TreeMap<Integer, ?> map, int temp) {
        int first = map.firstKey(), last = map.lastKey();
        if (temp <= first) return first;
        if (temp >= last) return last;
        int lower = map.floorKey(temp), upper = map.ceilingKey(temp);
        return lower == upper || temp < (lower + upper) / 2 ? lower : upper;
    }

    private byte[] vehicleInfo(int massKg, int batteryLevelWh, int capacityWh, int externalTempC,
                               int peakMotorPowerW, int maxChargingRateW) throws IOException {
        // Fields in number order; the file's fields this class does not set keep their place.
        TreeMap<Integer, ByteArrayOutputStream> fields = new TreeMap<>();
        for (Reader field = new Reader(vehicleInfo); field.next(); ) {
            if (!SET_VEHICLE_FIELDS.contains(field.field)) field.copyTo(fieldOut(fields, field.field));
        }
        writeMessage(fieldOut(fields, MASS), MASS, intWithUncertainty(massKg));
        writeMessage(fieldOut(fields, BATTERY_LEVEL), BATTERY_LEVEL, intWithUncertainty(batteryLevelWh));
        writeMessage(fieldOut(fields, BATTERY_CAPACITY), BATTERY_CAPACITY, intWithUncertainty(capacityWh));
        writeFloat(fieldOut(fields, AIR_DENSITY), AIR_DENSITY, airDensity);
        writeFloat(fieldOut(fields, EXTERNAL_TEMP), EXTERNAL_TEMP, externalTempC);
        if (peakMotorPowerW != 0) writeVarintField(fieldOut(fields, PEAK_MOTOR_POWER), PEAK_MOTOR_POWER, peakMotorPowerW);
        if (maxChargingRateW != 0) writeVarintField(fieldOut(fields, MAX_CHARGING_RATE), MAX_CHARGING_RATE, maxChargingRateW);
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        for (ByteArrayOutputStream field : fields.values()) field.writeTo(out);
        return out.toByteArray();
    }

    private static ByteArrayOutputStream fieldOut(TreeMap<Integer, ByteArrayOutputStream> fields, int number) {
        ByteArrayOutputStream out = fields.get(number);
        if (out == null) fields.put(number, out = new ByteArrayOutputStream());
        return out;
    }

    private byte[] scaleRegen(byte[] regen, int capacityWh) {
        return rewrite(regen, REGEN_AT_ENERGY, rate -> scaleVarint(rate, ENERGY_LEVEL, capacityWh));
    }

    private byte[] scaleChargingCurves(byte[] curves, int capacityWh) {
        UnaryOperator<byte[]> curve = atPower -> rewrite(atPower, TIME_TO_FULL,
                point -> scaleVarint(point, ENERGY_TO_FULL, capacityWh));
        byte[] scaled = rewrite(curves, CURVE_AT_POWER, curve);
        return rewrite(scaled, CURVES_AT_TEMP, atTemp -> rewrite(atTemp, TEMP_CURVE_AT_POWER, curve));
    }

    /** DiCarServer's scaling: (int) (energy / file capacity * capacity). */
    private byte[] scaleVarint(byte[] message, int number, int capacityWh) {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        Reader field = new Reader(message);
        while (field.next()) {
            if (field.is(number, VARINT)) {
                if (field.varint < 0 || field.varint > Integer.MAX_VALUE) throw new IllegalArgumentException("energy " + field.varint);
                int scaled = (int) ((((double) field.varint) / ((double) fileCapacityWh)) * ((double) capacityWh));
                // Proto3 leaves zero out, as DiCarServer's builders do.
                if (scaled != 0) writeVarintField(out, number, scaled);
            } else {
                field.copyTo(out);
            }
        }
        return out.toByteArray();
    }

    /** The message with each length-delimited field {@code number} replaced by {@code change}; the rest is copied. */
    private static byte[] rewrite(byte[] message, int number, UnaryOperator<byte[]> change) {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        Reader field = new Reader(message);
        while (field.next()) {
            if (field.is(number, LENGTH_DELIMITED)) writeMessage(out, number, change.apply(field.message()));
            else field.copyTo(out);
        }
        return out.toByteArray();
    }

    private static byte[] intWithUncertainty(int mean) {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        if (mean != 0) writeVarintField(out, 1, mean);
        return out.toByteArray();
    }

    private static int mean(byte[] message) {
        for (Reader field = new Reader(message); field.next(); ) {
            if (field.is(1, VARINT)) return (int) field.varint;
        }
        return 0;
    }

    // Drivetrain losses.

    /**
     * The drivetrain losses Maps gets. All eleven tables of DiCarServer 3.4.0 (BYD firmware 20260610) have zero loss
     * at zero power at every speed. DiCarServer 2.1.0 (firmware 20260801) ships the same grids with their values in
     * transposed order: read by speed, then power, they are the original grid read by power, then speed (for the
     * Dolphin's 420_1 the table's own prediction at 20 km/h went from 9.6 to 82 kWh/100 km). Such a grid is put back,
     * each value field moved whole: for every table both versions have, Maps then gets the 20260610 bytes (2.1.0's 81_1
     * is a new table, checked only by this rule). A grid is taken as transposed only if at least two of its speeds
     * fail as stored (one is a damaged value) and every speed passes once put back; anything else rejects the file, as
     * does a grid that is not full (the same powers at every speed, each once, at distinct finite speeds).
     */
    private static byte[] checkedLosses(byte[] losses) throws IOException {
        List<Float> speeds = new ArrayList<>();
        List<List<LossPoint>> grid = new ArrayList<>();
        boolean plain = true;
        for (Reader entry = new Reader(losses); entry.next(); ) {
            // Other fields of the message stay as stored.
            if (!entry.is(LOSSES_AT_SPEED, LENGTH_DELIMITED)) continue;
            float speed = 0;
            int speedFields = 0;
            List<LossPoint> points = new ArrayList<>();
            for (Reader field = new Reader(entry.message()); field.next(); ) {
                if (field.is(LOSS_SPEED, FIXED32)) {
                    // -0.0 is the absent 0.0.
                    speed = field.fixed32Float() + 0.0f;
                    speedFields++;
                } else if (field.is(LOSS_AT_POWER, LENGTH_DELIMITED)) {
                    LossPoint point = lossPoint(field.message());
                    plain &= point.plain;
                    points.add(point);
                } else {
                    plain = false;
                }
            }
            plain &= speedFields <= 1;
            speeds.add(speed);
            grid.add(points);
        }
        if (grid.isEmpty()) throw invalid("drivetrain losses empty");
        int failing = 0;
        for (List<LossPoint> points : grid) if (!zeroAtZeroPower(points)) failing++;
        if (failing == 0) return losses;

        // A full grid: the same powers at every speed, each once, at distinct finite speeds.
        int rows = grid.size(), columns = grid.get(0).size();
        int[] powers = new int[columns];
        for (int j = 0; j < columns; j++) powers[j] = grid.get(0).get(j).power;
        Arrays.sort(powers);
        boolean full = plain && columns > 0;
        for (int j = 1; j < columns; j++) full &= powers[j] != powers[j - 1];
        for (List<LossPoint> points : grid) {
            int[] own = new int[points.size()];
            for (int j = 0; j < own.length; j++) own[j] = points.get(j).power;
            Arrays.sort(own);
            full &= Arrays.equals(own, powers);
        }
        Float[] sortedSpeeds = speeds.toArray(new Float[0]);
        Arrays.sort(sortedSpeeds);
        for (int i = 0; i < rows; i++) full &= !sortedSpeeds[i].isNaN() && !sortedSpeeds[i].isInfinite()
                && (i == 0 || !sortedSpeeds[i].equals(sortedSpeeds[i - 1]));
        int zero = Arrays.binarySearch(powers, 0);
        if (!full) throw invalid("drivetrain losses: zero-power loss not zero at " + failing + " of " + rows
                + " speeds, and not a full grid");
        if (zero < 0) throw invalid("drivetrain losses: no zero-power point");
        if (failing < 2) throw invalid("drivetrain losses: zero-power loss not zero at 1 of " + rows + " speeds");

        // stored[i][j]: the value field at the i-th speed and the j-th power, both ascending.
        int[] rank = new int[rows];
        for (int e = 0; e < rows; e++) rank[e] = Arrays.binarySearch(sortedSpeeds, speeds.get(e));
        LossPoint[][] stored = new LossPoint[rows][columns];
        for (int e = 0; e < rows; e++) {
            for (LossPoint point : grid.get(e)) stored[rank[e]][Arrays.binarySearch(powers, point.power)] = point;
        }
        // Put back: the value at (i, j) is the stored grid's (j * rows + i)-th value, read row by row.
        LossPoint[][] back = new LossPoint[rows][columns];
        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < columns; j++) {
                int k = j * rows + i;
                back[i][j] = stored[k / columns][k % columns];
            }
            if (back[i][zero].mean != 0) throw invalid("drivetrain losses: zero-power loss not zero at " + failing + " of "
                    + rows + " speeds as stored, nor once put back");
        }
        int[] entry = {0};
        return rewrite(losses, LOSSES_AT_SPEED, message -> {
            LossPoint[] row = back[rank[entry[0]++]];
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            for (Reader field = new Reader(message); field.next(); ) {
                if (!field.is(LOSS_AT_POWER, LENGTH_DELIMITED)) {
                    field.copyTo(out);
                    continue;
                }
                // The power field as stored, then the value field put back.
                LossPoint point = lossPoint(field.message());
                ByteArrayOutputStream rebuilt = new ByteArrayOutputStream();
                rebuilt.write(point.powerField, 0, point.powerField.length);
                byte[] value = row[Arrays.binarySearch(powers, point.power)].value;
                rebuilt.write(value, 0, value.length);
                writeMessage(out, LOSS_AT_POWER, rebuilt.toByteArray());
            }
            return out.toByteArray();
        });
    }

    /** Exactly one zero-power point, with zero loss. */
    private static boolean zeroAtZeroPower(List<LossPoint> points) {
        int found = 0;
        for (LossPoint point : points) {
            if (point.power != 0) continue;
            if (point.mean != 0) return false;
            found++;
        }
        return found == 1;
    }

    /** One LossAtPower: its power, and its power and value fields as stored (tag included; empty when absent). */
    private static final class LossPoint {
        final int power, mean;
        final byte[] powerField, value;
        /** Nothing but at most one power and one value field. */
        final boolean plain;

        LossPoint(int power, int mean, byte[] powerField, byte[] value, boolean plain) {
            this.power = power;
            this.mean = mean;
            this.powerField = powerField;
            this.value = value;
            this.plain = plain;
        }
    }

    private static LossPoint lossPoint(byte[] message) {
        int power = 0, mean = 0, powerFields = 0, valueFields = 0;
        ByteArrayOutputStream powerField = new ByteArrayOutputStream(), value = new ByteArrayOutputStream();
        boolean plain = true;
        for (Reader field = new Reader(message); field.next(); ) {
            if (field.is(LOSS_POWER, VARINT)) {
                power = (int) (field.varint >>> 1) ^ -(int) (field.varint & 1);
                field.copyTo(powerField);
                powerFields++;
            } else if (field.is(LOSS_VALUE, LENGTH_DELIMITED)) {
                mean = mean(field.message());
                field.copyTo(value);
                valueFields++;
            } else {
                plain = false;
            }
        }
        return new LossPoint(power, mean, powerField.toByteArray(), value.toByteArray(),
                plain && powerFields <= 1 && valueFields <= 1);
    }

    // Deserialization and checks.

    private static final class AllowlistInputStream extends ObjectInputStream {
        AllowlistInputStream(InputStream in) throws IOException {
            super(in);
        }

        @Override
        protected Class<?> resolveClass(ObjectStreamClass description) throws IOException, ClassNotFoundException {
            String name = description.getName();
            // Serialization matches the simple name, the serialVersionUID and the fields.
            if (BYD_CLASS.equals(name)) return VEMBinaryData.class;
            if (!ALLOWED_CLASSES.contains(name)) throw new InvalidClassException(name, "not allowed in an energy-model file");
            return super.resolveClass(description);
        }

        @Override
        protected Class<?> resolveProxyClass(String[] interfaces) throws IOException {
            throw new InvalidClassException("proxy", "not allowed in an energy-model file");
        }
    }

    private static byte[] readAll(InputStream in) throws IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream(8192);
        byte[] buffer = new byte[8192];
        for (int read; (read = in.read(buffer)) != -1; ) {
            out.write(buffer, 0, read);
            if (out.size() > MAX_FILE_BYTES) throw new IOException("energy-model file larger than " + MAX_FILE_BYTES);
        }
        return out.toByteArray();
    }

    private static byte[] required(byte[] part, String what) throws IOException {
        if (part == null || part.length == 0) throw invalid(what + " missing");
        checkWire(part);
        return part;
    }

    // The deserialized generics are unchecked: every key and value is checked here.
    private static TreeMap<Integer, byte[]> parts(Map<?, ?> map, String what) throws IOException {
        TreeMap<Integer, byte[]> parts = new TreeMap<>();
        if (map == null) return parts;
        for (Map.Entry<?, ?> entry : map.entrySet()) {
            if (!(entry.getValue() instanceof byte[])) throw invalid(what + " value");
            byte[] part = (byte[]) entry.getValue();
            checkWire(part);
            parts.put(key(entry.getKey(), what), part);
        }
        return parts;
    }

    private static TreeMap<Integer, List<byte[]>> partLists(Map<?, ?> map, String what) throws IOException {
        TreeMap<Integer, List<byte[]>> parts = new TreeMap<>();
        if (map == null) return parts;
        for (Map.Entry<?, ?> entry : map.entrySet()) {
            if (!(entry.getValue() instanceof List)) throw invalid(what + " value");
            parts.put(key(entry.getKey(), what), partList((List<?>) entry.getValue(), what));
        }
        return parts;
    }

    private static List<byte[]> partList(List<?> list, String what) throws IOException {
        List<byte[]> parts = new ArrayList<>(list.size());
        for (Object part : list) {
            if (!(part instanceof byte[])) throw invalid(what + " entry");
            checkWire((byte[]) part);
            parts.add((byte[]) part);
        }
        return Collections.unmodifiableList(parts);
    }

    private static int key(Object key, String what) throws IOException {
        if (!(key instanceof Integer) || (Integer) key < MIN_KEY_C || (Integer) key > MAX_KEY_C) throw invalid(what + " key " + key);
        return (Integer) key;
    }

    private static void checkWire(byte[] message) throws IOException {
        try {
            for (Reader field = new Reader(message); field.next(); ) {
                // Reader checks tags, lengths and bounds.
            }
        } catch (IllegalArgumentException error) {
            throw invalid(error.getMessage());
        }
    }

    private static IOException invalid(String what) {
        return new InvalidObjectException("energy-model file: " + what);
    }

    private static String sha256(byte[] bytes) {
        try {
            StringBuilder hex = new StringBuilder(64);
            for (byte b : MessageDigest.getInstance("SHA-256").digest(bytes)) hex.append(String.format(Locale.ROOT, "%02x", b));
            return hex.toString();
        } catch (NoSuchAlgorithmException error) {
            return "unavailable";
        }
    }

    // Protobuf wire format.

    /** Iterates the fields of one message; throws IllegalArgumentException on malformed input. */
    private static final class Reader {
        private final byte[] buffer;
        private int position, start, valueStart;
        int field, wireType;
        long varint;

        Reader(byte[] buffer) {
            this.buffer = buffer;
        }

        boolean next() {
            if (position == buffer.length) return false;
            start = position;
            long tag = readVarint();
            if (tag >>> 3 == 0 || tag >>> 3 > 536870911) throw new IllegalArgumentException("field number");
            field = (int) (tag >>> 3);
            wireType = (int) (tag & 7);
            switch (wireType) {
                case VARINT:
                    varint = readVarint();
                    break;
                case FIXED64:
                    skip(8);
                    break;
                case LENGTH_DELIMITED:
                    long length = readVarint();
                    if (length < 0 || length > buffer.length - position) throw new IllegalArgumentException("length");
                    valueStart = position;
                    skip((int) length);
                    break;
                case FIXED32:
                    valueStart = position;
                    skip(4);
                    break;
                default:
                    throw new IllegalArgumentException("wire type " + wireType);
            }
            return true;
        }

        boolean is(int number, int type) {
            return field == number && wireType == type;
        }

        byte[] message() {
            return Arrays.copyOfRange(buffer, valueStart, position);
        }

        float fixed32Float() {
            int bits = buffer[valueStart] & 0xFF | (buffer[valueStart + 1] & 0xFF) << 8
                    | (buffer[valueStart + 2] & 0xFF) << 16 | (buffer[valueStart + 3] & 0xFF) << 24;
            return Float.intBitsToFloat(bits);
        }

        /** The whole field, tag included. */
        void copyTo(ByteArrayOutputStream out) {
            out.write(buffer, start, position - start);
        }

        private long readVarint() {
            long value = 0;
            for (int shift = 0; shift < 64; shift += 7) {
                if (position >= buffer.length) throw new IllegalArgumentException("truncated varint");
                byte b = buffer[position++];
                value |= (long) (b & 0x7F) << shift;
                if ((b & 0x80) == 0) return value;
            }
            throw new IllegalArgumentException("varint too long");
        }

        private void skip(int bytes) {
            if (bytes > buffer.length - position) throw new IllegalArgumentException("truncated field");
            position += bytes;
        }
    }

    private static void writeMessage(ByteArrayOutputStream out, int number, byte[] message) {
        writeVarint(out, (long) number << 3 | LENGTH_DELIMITED);
        writeVarint(out, message.length);
        out.write(message, 0, message.length);
    }

    private static void writeVarintField(ByteArrayOutputStream out, int number, int value) {
        writeVarint(out, (long) number << 3 | VARINT);
        // int32: a negative value is sign-extended to ten bytes.
        writeVarint(out, value);
    }

    private static void writeFloat(ByteArrayOutputStream out, int number, float value) {
        writeVarint(out, (long) number << 3 | FIXED32);
        int bits = Float.floatToIntBits(value);
        for (int shift = 0; shift < 32; shift += 8) out.write(bits >>> shift);
    }

    private static void writeVarint(ByteArrayOutputStream out, long value) {
        while ((value & ~0x7FL) != 0) {
            out.write((int) (value & 0x7F) | 0x80);
            value >>>= 7;
        }
        out.write((int) value);
    }
}
