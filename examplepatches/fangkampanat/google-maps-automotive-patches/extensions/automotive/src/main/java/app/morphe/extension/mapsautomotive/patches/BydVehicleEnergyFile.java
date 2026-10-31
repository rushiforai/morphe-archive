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
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
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
 * own and other cars' ids are not known.
 * <p>
 * Read only, nothing of BYD's is bundled. The file is deserialized with a class allowlist; every part
 * must be well-formed protobuf. Plain Java without Android APIs, so the JVM probe runs this code.
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
    // The tables used and their capacities, each with a fallback name (81_1 and 81_1750_1 are the
    // same file). Not used: 215_1, 251_1 and 425_1, whose drag coefficient is 12x below the others' (km/h
    // units); 81_1620_1 (51,136 Wh), which would split from 420_1 at 48.1 kWh, the Dolphin's own capacity;
    // default.bin with its placeholder capacity; the other variants of 81 and 128.
    private static final String[][] TABLES = {{"420_1"}, {"81_1", "81_1750_1"}, {"128_2", "128_3"}};
    private static final int[] TABLE_CAPACITY_WH = {45120, 64870, 74880};

    final String name, sha256;
    final int size;
    /** From the file's vehicle info: its mass and capacity (energy levels scale from it), air density, temperature. */
    final int fileMassKg, fileCapacityWh;
    final float airDensity, fileExternalTemp;
    /** Road load A, B, C (N, N/(m/s), N/(m/s)²). */
    final float roadA, roadB, roadC;
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
        drivetrainLosses = required(data.mDrivetrainLosses, "drivetrain losses");
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

        // The parts that are rewritten must parse as their messages.
        for (byte[] regen : maxRegen.values()) scaleRegen(regen, capacity);
        if (chargingCurves != null) scaleChargingCurves(chargingCurves, capacity);
    }

    /**
     * The model for Maps, as DiCarServer assembles it: this car's vehicle info (the file's other
     * fields are kept), the file's road load, drivetrain losses and drain at temperature, the max
     * regeneration and drain at time nearest the outside temperature, the battery losses at
     * {@link #BATTERY_TEMP_C}, and regeneration and charging-curve energies scaled to the capacity.
     * A motor power or charging rate of 0 is left out, as in DiCarServer's model.
     */
    byte[] encode(int massKg, int batteryLevelWh, int capacityWh, int externalTempC, int peakMotorPowerW,
                  int maxChargingRateW) throws IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream(4096);
        writeMessage(out, VEHICLE_INFO, vehicleInfo(massKg, batteryLevelWh, capacityWh, externalTempC,
                peakMotorPowerW, maxChargingRateW));
        writeMessage(out, ROAD_LOAD, roadLoad);
        writeMessage(out, DRIVETRAIN_LOSSES, drivetrainLosses);
        if (!maxRegen.isEmpty()) {
            writeMessage(out, MAX_REGEN_POWER, scaleRegen(maxRegen.get(nearestKey(maxRegen, externalTempC)), capacityWh));
        }
        if (!batteryLosses.isEmpty()) {
            writeMessage(out, BATTERY_LOSSES, batteryLosses.get(nearestKey(batteryLosses, BATTERY_TEMP_C)));
        }
        if (!drainAtTime.isEmpty()) {
            for (byte[] entry : drainAtTime.get(nearestKey(drainAtTime, externalTempC))) writeMessage(out, DRAIN_AT_TIME, entry);
        }
        for (byte[] entry : drainAtTemp) writeMessage(out, DRAIN_AT_TEMP, entry);
        if (chargingCurves != null) writeMessage(out, CHARGING_CURVES, scaleChargingCurves(chargingCurves, capacityWh));
        return out.toByteArray();
    }

    /** This table's own energy prediction for BydSpeedBands; throws if a part it needs is malformed. */
    Predictor predictor() {
        return new Predictor(this);
    }

    /**
     * Battery energy this table predicts for one interval (for the speed-band comparison in
     * BydSpeedBands only: not sent to Maps, and not Maps' own computation). Road load A + B·v + C·v² at
     * the mean speed plus the change of kinetic energy with the given mass give the wheel power; then
     * drivetrain losses at (speed, wheel power), regeneration capped by the max regen power at the
     * energy level, the auxiliary drain at time for the outside temperature, and the battery losses at
     * {@link #BATTERY_TEMP_C}. Flat road: the grade is not known. Drain at temperature is not added,
     * as the drain at time already depends on the temperature.
     */
    static final class Predictor {
        private final float a, b, c;
        private final int fileCapacityWh;
        private final float[] lossSpeeds;
        private final int[][] lossPowers, lossValues;
        private final int[][] battery;
        private final TreeMap<Integer, int[][]> regen = new TreeMap<>(), drain = new TreeMap<>();

        private Predictor(BydVehicleEnergyFile file) {
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
            for (Map.Entry<Integer, List<byte[]>> entry : file.drainAtTime.entrySet()) {
                List<int[]> points = new ArrayList<>();
                for (byte[] part : entry.getValue()) {
                    int seconds = 0, watts = 0;
                    for (Reader field = new Reader(part); field.next(); ) {
                        if (field.is(1, VARINT)) seconds = (int) field.varint;
                        else if (field.is(3, LENGTH_DELIMITED)) watts = mean(field.message());
                    }
                    points.add(new int[]{seconds, watts});
                }
                if (!points.isEmpty()) drain.put(entry.getKey(), sorted(points));
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
            double aux = drain.isEmpty() ? 0 : interpolate(drain.get(nearestKey(drain, outsideC)), sinceStartS + seconds / 2);
            double pack = motor + aux;
            double total = pack + (battery == null ? 0 : interpolate(battery, pack));
            return total * seconds / 3600.0;
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
    }

    /** The drain-at-time key for an outside temperature, or null if the file has none. */
    Integer drainAtTimeKey(int externalTempC) {
        return drainAtTime.isEmpty() ? null : nearestKey(drainAtTime, externalTempC);
    }

    /** The file name without ".bin", for the dialog. */
    String table() {
        return name.endsWith(".bin") ? name.substring(0, name.length() - 4) : name;
    }

    /** For the log. */
    String describe() {
        return String.format(Locale.ROOT, "file=%s;bytes=%d;sha256=%s;file_mass_kg=%d;file_capacity_wh=%d"
                        + ";road_load=%s/%s/%s;air_density=%s;regen_keys=%s;losses_keys=%s;drain_time_keys=%s"
                        + ";drain_temp=%d;charging_curves=%s", name, size, sha256, fileMassKg, fileCapacityWh,
                roadA, roadB, roadC, airDensity, maxRegen.keySet(), batteryLosses.keySet(), drainAtTime.keySet(),
                drainAtTemp.size(), chargingCurves != null);
    }

    /** The temperature keys used for an outside temperature, for the log. */
    String describeSelection(int externalTempC) {
        return "regen_key=" + (maxRegen.isEmpty() ? "none" : nearestKey(maxRegen, externalTempC))
                + ";drain_time_key=" + (drainAtTime.isEmpty() ? "none" : nearestKey(drainAtTime, externalTempC))
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
