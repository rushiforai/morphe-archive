package app.morphe.extension.mapsautomotive.patches;

import android.content.Context;
import android.content.ContextWrapper;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

/**
 * Optional raw battery/energy/A-C signals from the BYD SDK, for the drive records and the report only.
 * Probed once per process: each device is resolved by reflection with a process-local ContextWrapper that
 * answers only that device's inspected in-process SDK read check (a *_GET permission, plus the *_COMMON the
 * instrument and A-C getInstance enforce); it grants no Android platform permission. Statistic/energy/instrument/
 * power feature ids come from BYDAutoFeatureIds by name at run time and are read as ints with the device's public
 * get(int[], Class): a group of two or more ids on one device is read with one get(ids, int[].class)
 * (BYDAutoEventValue.intArrayValue, mapped by position as the SDK's own getters map it), a single id with
 * get(new int[]{id}, Integer.TYPE) (intValue). The batch is used only after one read agreed with the per-feature
 * reads of the same ids; if it never agrees, gives no array of the right length, or later stops giving values the
 * per-feature reads still give, that group reads one get per feature for the rest of the process. The three A-C
 * values come from the device's plain named int getters. Every signal is listed in {@link #firstReport()}, those
 * missing on the firmware or on a skipped device as "unavailable". Reads fail closed: SDK error sentinels and read
 * failures become "unavailable" and never propagate. Never calls a setter and never reads latitude, longitude or
 * any identity; records raw values with no unit interpretation. Never throws into callers.
 */
final class BydSignalProbe {
    static final int UNAVAILABLE = Integer.MIN_VALUE;
    /** BYDAutoEventValue.INVAILD_INT, the default before the HAL fills a value. */
    static final int INVALID_INT = -999999999;
    /**
     * At or below this the value is a BYDAutoManager command-result code, not a reading:
     * FAILED -2147482648, TIMEOUT -2147482646, BUSY -2147482647, INVALID_VALUE -2147482645, and
     * UNKNOWN_ERROR Integer.MIN_VALUE all fall at or below it. get(int[],Class) returns FAILED when
     * the feature is not in the device's set or the permission check fails.
     */
    static final int SDK_ERROR_FLOOR = -2147482645;
    /** Batch states, as listed in {@link #firstReport()} ("off(...)" carries the reason). */
    static final String BATCH_UNVERIFIED = "unverified", BATCH_ON = "on", BATCH_OFF_FAILED = "off(failed)";
    /** Reads (10 s each) a batch may stay unverified before it is turned off; a key that differs twice turns it off. */
    static final int MAX_VERIFY_READS = 30, MAX_DIFF_READS = 2;

    private static final String TAG = "MorpheBydBattery";
    private static final String FEATURE_IDS_CLASS = "android.hardware.bydauto.BYDAutoFeatureIds";
    private static final String FEATURE_IDS_ENERGY_CLASS = "android.hardware.bydauto.BYDAutoFeatureIds$Energy";
    private static final String EVENT_VALUE_CLASS = "android.hardware.bydauto.BYDAutoEventValue";
    private static final String STATISTIC_CLASS = "android.hardware.bydauto.statistic.BYDAutoStatisticDevice";
    private static final String ENERGY_CLASS = "android.hardware.bydauto.energy.BYDAutoEnergyDevice";
    private static final String INSTRUMENT_CLASS = "android.hardware.bydauto.instrument.BYDAutoInstrumentDevice";
    private static final String POWER_CLASS = "android.hardware.bydauto.power.BYDAutoPowerDevice";
    private static final String AC_CLASS = "android.hardware.bydauto.ac.BYDAutoAcDevice";

    private static final String[] STATISTIC_PERMS = {"android.permission.BYDAUTO_STATISTIC_GET"};
    private static final String[] ENERGY_PERMS = {"android.permission.BYDAUTO_ENERGY_GET"};
    // The instrument/A-C getInstance each enforce a *_COMMON permission before construction; the getters then
    // enforce the *_GET permission. The wrapper must answer both for the device to initialise and read.
    private static final String[] INSTRUMENT_PERMS = {
            "android.permission.BYDAUTO_INSTRUMENT_GET",
            "android.permission.BYDAUTO_INSTRUMENT_COMMON",
    };
    private static final String[] POWER_PERMS = {"android.permission.BYDAUTO_POWER_GET"};
    private static final String[] AC_PERMS = {
            "android.permission.BYDAUTO_AC_GET",
            "android.permission.BYDAUTO_AC_COMMON",
    };

    private final List<Source> sources = new ArrayList<Source>();
    private boolean initialized;

    /**
     * Resolves the optional devices and their signals once. Returns a short status for the log and the report,
     * e.g. "statistic=ok energy=ok instrument=ok power=ok ac=partial(2/3,missing:accomp)" or
     * "ac=skipped(reason)". Never throws.
     */
    String init(Context context) {
        if (initialized) return "already";
        initialized = true;
        StringBuilder status = new StringBuilder();
        Field intValue = eventField("intValue");
        Field intArrayValue = eventField("intArrayValue");
        Context app;
        try {
            app = context.getApplicationContext();
        } catch (Throwable error) {
            app = context;
        }
        // Statistic: raw pack current and the highest/lowest cell voltages (int, confirmed as int events on the car).
        initFeatureGroup(status, "statistic", app, STATISTIC_CLASS, STATISTIC_PERMS, intValue, intArrayValue,
                FEATURE_IDS_CLASS, new String[][]{
                        {"current", "STATISTIC_INSTANTANEOUS_CURRENT"},
                        {"vmax", "STATISTIC_HIGHEST_BATTERY_VOLTAGE"},
                        {"vmin", "STATISTIC_LOWEST_BATTERY_VOLTAGE"},
                });
        // Energy: DC-bus voltage (top-level id) and the car's split of the current itinerary's energy (nested ids).
        // Two reads on one device: the DC-bus id is a fixed non-CAN-FD constant that may be outside the device's
        // feature set, and one id outside the set makes the SDK refuse a whole batch.
        initFeatureGroup(status, "energy", app, ENERGY_CLASS, ENERGY_PERMS, intValue, intArrayValue,
                FEATURE_IDS_CLASS, new String[][]{
                        {"dcbus", "ENERGY_DC_BUS_VOLTAGE"},
                });
        initFeatureGroup(status, "energy_it", app, ENERGY_CLASS, ENERGY_PERMS, intValue, intArrayValue,
                FEATURE_IDS_ENERGY_CLASS, new String[][]{
                        {"itac", "ENERGY_CURRENT_ITINERARY_AC_CONSUMPTION_PERCENT"},
                        {"itdrive", "ENERGY_CURRENT_ITINERARY_DRIVE_CONSUMPTION_PERCENT"},
                        {"itequip", "ENERGY_CURRENT_ITINERARY_ELECTRIC_EQUIPMENT_CONSUMPTION_PERCENT"},
                        {"itother", "ENERGY_CURRENT_ITINERARY_OTHER_CONSUMPTION_PERCENT"},
                });
        // Instrument: discharge power. getInstance enforces BYDAUTO_INSTRUMENT_COMMON, the read BYDAUTO_INSTRUMENT_GET.
        initFeatureGroup(status, "instrument", app, INSTRUMENT_CLASS, INSTRUMENT_PERMS, intValue, intArrayValue,
                FEATURE_IDS_CLASS, new String[][]{
                        {"dispow", "INSTRUMENT_DISCHARGE_POWER"},
                });
        // Power: motor power.
        initFeatureGroup(status, "power", app, POWER_CLASS, POWER_PERMS, intValue, intArrayValue,
                FEATURE_IDS_CLASS, new String[][]{
                        {"motorpow", "POWER_MOTOR_POWER"},
                });
        // A-C: plain named int getters (no feature id). getInstance enforces BYDAUTO_AC_COMMON, each getter BYDAUTO_AC_GET.
        initNamedGroup(status, "ac", app, AC_CLASS, AC_PERMS, new String[][]{
                {"acstate", "getAcStartState"},
                {"accomp", "getAcCompressorMode"},
                {"acwind", "getAcWindLevel"},
        });
        return status.toString().trim();
    }

    private static Field eventField(String name) {
        try {
            return Class.forName(EVENT_VALUE_CLASS).getField(name);
        } catch (Throwable error) {
            return null;
        }
    }

    /**
     * Adds one device read through the generic get(int[], Class), its feature ids resolved by name. A skipped
     * device or a missing id still adds its keys, as always-unavailable placeholders.
     */
    private void initFeatureGroup(StringBuilder status, String name, Context app, String deviceClass, String[] perms,
                                  Field intValue, Field intArrayValue, String featureIdsClass, String[][] signals) {
        String[] keys = column(signals, 0);
        if (intValue == null) {
            addMissing(keys);
            append(status, name, "skipped(no_event_value)");
            return;
        }
        try {
            Class<?> ids = Class.forName(featureIdsClass);
            Class<?> type = Class.forName(deviceClass);
            Method get = type.getMethod("get", int[].class, Class.class);
            Object device = type.getMethod("getInstance", Context.class)
                    .invoke(null, new ReadContext(app, perms));
            if (device == null) {
                addMissing(keys);
                append(status, name, "skipped(device_null)");
                return;
            }
            Integer[] features = new Integer[signals.length];
            for (int i = 0; i < signals.length; i++) {
                try {
                    features[i] = ids.getField(signals[i][1]).getInt(null);
                } catch (Throwable missing) {
                    // A feature id absent on this firmware stays null: a placeholder, not fatal to the rest.
                }
            }
            sources.addAll(featureSources(name, device, get, keys, features, intValue, intArrayValue));
            append(status, name, groupStatus(keys, features));
        } catch (Throwable error) {
            addMissing(keys);
            append(status, name, "skipped(" + BydEnergyReader.describe(error) + ")");
        }
    }

    /** Adds one device read through plain no-argument named int getters; missing ones become placeholders. */
    private void initNamedGroup(StringBuilder status, String name, Context app, String deviceClass,
                                String[] perms, String[][] signals) {
        String[] keys = column(signals, 0);
        try {
            Class<?> type = Class.forName(deviceClass);
            Object device = type.getMethod("getInstance", Context.class)
                    .invoke(null, new ReadContext(app, perms));
            if (device == null) {
                addMissing(keys);
                append(status, name, "skipped(device_null)");
                return;
            }
            Method[] getters = namedGetters(type, column(signals, 1));
            sources.addAll(namedSources(device, keys, getters));
            append(status, name, groupStatus(keys, getters));
        } catch (Throwable error) {
            addMissing(keys);
            append(status, name, "skipped(" + BydEnergyReader.describe(error) + ")");
        }
    }

    private void addMissing(String[] keys) {
        for (String key : keys) sources.add(Channel.missing(key));
    }

    private static void append(StringBuilder status, String name, String value) {
        if (status.length() > 0) status.append(' ');
        status.append(name).append('=').append(value);
    }

    /** Raw values of the available signals only, "key=value|key=value" ({@code ;}-free). Never throws. */
    String read() {
        try {
            String line = formatRead(readSources(sources));
            logBatchChanges();
            return line;
        } catch (Throwable error) {
            return "";
        }
    }

    /**
     * Every signal with its value or "unavailable", "key=value|key=unavailable|...", then
     * "|batch=statistic:on,energy_it:off(failed)" when a device is read as a batch; for one log line. Never throws.
     */
    String firstReport() {
        try {
            String line = formatFirst(readSources(sources));
            logBatchChanges();
            String batches = batchStates(sources);
            if (batches.isEmpty()) return line;
            return line.isEmpty() ? "batch=" + batches : line + "|batch=" + batches;
        } catch (Throwable error) {
            return "error(" + error.getClass().getSimpleName() + ")";
        }
    }

    private void logBatchChanges() {
        for (Source source : sources) {
            if (!(source instanceof FeatureBatch)) continue;
            String change = ((FeatureBatch) source).takeChange();
            if (change == null) continue;
            try {
                ReportLog.i(TAG, "signals batch " + change);
            } catch (Throwable ignored) {
                // Logging never decides a read.
            }
        }
    }

    // --- Pure logic below: no Android calls, so the probe exercises it on the JVM with fake objects. ---

    private static String[] column(String[][] rows, int index) {
        String[] out = new String[rows.length];
        for (int i = 0; i < rows.length; i++) out[i] = rows[i][index];
        return out;
    }

    /**
     * One feature device's sources: one batch over the resolved ids (a single read when only one resolved), then an
     * always-unavailable placeholder for each key whose id is null (missing on this firmware).
     */
    static List<Source> featureSources(String group, Object device, Method get, String[] keys, Integer[] ids,
                                       Field intValue, Field intArrayValue) {
        List<String> foundKeys = new ArrayList<String>();
        List<Channel> singles = new ArrayList<Channel>();
        for (int i = 0; i < keys.length; i++) {
            if (ids[i] == null) continue;
            foundKeys.add(keys[i]);
            singles.add(featureChannel(keys[i], device, get, ids[i], intValue));
        }
        List<Source> out = new ArrayList<Source>();
        if (singles.size() == 1) {
            out.add(singles.get(0));
        } else if (singles.size() > 1) {
            int[] batchIds = new int[foundKeys.size()];
            int n = 0;
            for (Integer id : ids) {
                if (id != null) batchIds[n++] = id;
            }
            out.add(new FeatureBatch(group, device, get, foundKeys.toArray(new String[0]), batchIds,
                    singles.toArray(new Channel[0]), intArrayValue));
        }
        for (int i = 0; i < keys.length; i++) {
            if (ids[i] == null) out.add(Channel.missing(keys[i]));
        }
        return out;
    }

    /** A per-feature read: the device's get(new int[]{featureId}, Integer.TYPE), its int in intValue. */
    static Channel featureChannel(String key, Object device, Method get, int featureId, Field intValue) {
        return new Channel(key, device, get, new Object[]{new int[]{featureId}, Integer.TYPE}, intValue);
    }

    /** The public no-argument getters by name; null where the firmware lacks one. */
    static Method[] namedGetters(Class<?> type, String[] names) {
        Method[] out = new Method[names.length];
        for (int i = 0; i < names.length; i++) {
            try {
                out[i] = type.getMethod(names[i]);
            } catch (Throwable missing) {
                // A named getter absent on this firmware stays null.
            }
        }
        return out;
    }

    /** One read per named getter in key order, then a placeholder for each missing getter. */
    static List<Source> namedSources(Object device, String[] keys, Method[] getters) {
        List<Source> out = new ArrayList<Source>();
        for (int i = 0; i < keys.length; i++) {
            if (getters[i] != null) out.add(new Channel(keys[i], device, getters[i], new Object[]{}, null));
        }
        for (int i = 0; i < keys.length; i++) {
            if (getters[i] == null) out.add(Channel.missing(keys[i]));
        }
        return out;
    }

    /** "ok", or "partial(k/n,missing:a+b)" naming the keys whose id or getter is null. */
    static String groupStatus(String[] keys, Object[] resolved) {
        StringBuilder missing = new StringBuilder();
        int found = 0;
        for (int i = 0; i < keys.length; i++) {
            if (resolved[i] != null) {
                found++;
            } else {
                if (missing.length() > 0) missing.append('+');
                missing.append(keys[i]);
            }
        }
        if (found == keys.length) return "ok";
        return "partial(" + found + "/" + keys.length + ",missing:" + missing + ")";
    }

    /** Reads every source once, in order. */
    static List<Value> readSources(List<Source> sources) {
        List<Value> values = new ArrayList<Value>();
        for (Source source : sources) source.readInto(values);
        return values;
    }

    /** "group:state" of each batch source, joined with ','; empty when there is none. */
    static String batchStates(List<Source> sources) {
        StringBuilder out = new StringBuilder();
        for (Source source : sources) {
            if (!(source instanceof FeatureBatch)) continue;
            FeatureBatch batch = (FeatureBatch) source;
            if (out.length() > 0) out.append(',');
            out.append(batch.group).append(':').append(batch.state());
        }
        return out.toString();
    }

    /** Reads one channel, failing closed: any null, sentinel or thrown error becomes an unavailable value. */
    static Value readChannel(Channel channel) {
        try {
            Object result = channel.get();
            if (result == null) return Value.unavailable(channel.key);
            int raw = extractInt(result, channel.intValue);
            String text = describeInt(raw);
            return text == null ? Value.unavailable(channel.key) : new Value(channel.key, text);
        } catch (Throwable error) {
            return Value.unavailable(channel.key);
        }
    }

    /**
     * The int a read carried: a boxed number directly, otherwise the public {@code intValue} field of a
     * BYDAutoEventValue (read via the supplied field handle, or by name as a fallback).
     */
    static int extractInt(Object value, Field intValue) throws Exception {
        if (value instanceof Number) return ((Number) value).intValue();
        if (intValue != null) {
            try {
                return intValue.getInt(value);
            } catch (IllegalArgumentException wrongType) {
                // The field handle belongs to another class; fall through to a by-name lookup.
            }
        }
        return value.getClass().getField("intValue").getInt(value);
    }

    /** A raw int as text, or null when it is an SDK error sentinel rather than a reading. */
    static String describeInt(int raw) {
        if (raw <= SDK_ERROR_FLOOR || raw == INVALID_INT) return null;
        return Integer.toString(raw);
    }

    /**
     * The int array a batch read carried: the public {@code intArrayValue} field of a BYDAutoEventValue (via the
     * supplied handle, or by name), or null when there is none (the SDK leaves it null when it refuses the batch).
     */
    static int[] extractIntArray(Object value, Field intArrayValue) throws Exception {
        if (value == null) return null;
        if (value instanceof int[]) return (int[]) value;
        Object array = null;
        boolean read = false;
        if (intArrayValue != null) {
            try {
                array = intArrayValue.get(value);
                read = true;
            } catch (IllegalArgumentException wrongType) {
                // The field handle belongs to another class; fall through to a by-name lookup.
            }
        }
        if (!read) array = value.getClass().getField("intArrayValue").get(value);
        return array instanceof int[] ? (int[]) array : null;
    }

    /**
     * One value per key from a batch's int array, sentinels as unavailable; null when the array is missing or its
     * length differs from the keys (the SDK answers a refused batch with one error code).
     */
    static Value[] batchValues(String[] keys, int[] array) {
        if (array == null || array.length != keys.length) return null;
        Value[] values = new Value[keys.length];
        for (int i = 0; i < keys.length; i++) {
            String text = describeInt(array[i]);
            values[i] = text == null ? Value.unavailable(keys[i]) : new Value(keys[i], text);
        }
        return values;
    }

    /**
     * One batch read against the per-feature reads of the same ids: {@link #BATCH_ON} when they agree and at least
     * one value is available, {@link #BATCH_OFF_FAILED} when the batch gave no usable array, "diff:a+b" naming the
     * keys that differ, null when both are all unavailable (nothing to compare yet).
     */
    static String verdict(Value[] batch, Value[] singles) {
        if (batch == null || singles == null || batch.length != singles.length) return BATCH_OFF_FAILED;
        StringBuilder diff = new StringBuilder();
        boolean any = false;
        for (int i = 0; i < singles.length; i++) {
            if (!same(batch[i], singles[i])) {
                if (diff.length() > 0) diff.append('+');
                diff.append(singles[i].key);
            }
            if (singles[i].available()) any = true;
        }
        if (diff.length() > 0) return "diff:" + diff;
        return any ? BATCH_ON : null;
    }

    private static boolean same(Value a, Value b) {
        if (!a.key.equals(b.key)) return false;
        return a.text == null ? b.text == null : a.text.equals(b.text);
    }

    private static boolean anyAvailable(Value[] values) {
        for (Value value : values) {
            if (value.available()) return true;
        }
        return false;
    }

    /** "key=value" for every available signal, joined with '|'; empty when none are available. */
    static String formatRead(List<Value> values) {
        StringBuilder out = new StringBuilder();
        for (Value value : values) {
            if (!value.available()) continue;
            if (out.length() > 0) out.append('|');
            out.append(value.key).append('=').append(value.text);
        }
        return out.toString();
    }

    /** "key=value" or "key=unavailable" for every signal, joined with '|'. */
    static String formatFirst(List<Value> values) {
        StringBuilder out = new StringBuilder();
        for (Value value : values) {
            if (out.length() > 0) out.append('|');
            out.append(value.key).append('=').append(value.available() ? value.text : "unavailable");
        }
        return out.toString();
    }

    /** One probed signal: its key and either a formatted raw value, or null when unavailable. */
    static final class Value {
        final String key;
        final String text;

        Value(String key, String text) {
            this.key = key;
            this.text = text;
        }

        static Value unavailable(String key) {
            return new Value(key, null);
        }

        boolean available() {
            return text != null;
        }
    }

    /** Something read with each sample, adding one value per key it owns, in order. Never throws. */
    interface Source {
        void readInto(List<Value> out);
    }

    /**
     * One read target: a resolved device, the method to call, its arguments, and the event-value field to extract;
     * or, with no method, a placeholder for a signal this firmware or device does not offer (always unavailable,
     * makes no call).
     */
    static final class Channel implements Source {
        final String key;
        private final Object device;
        private final Method method;
        private final Object[] args;
        final Field intValue;

        Channel(String key, Object device, Method method, Object[] args, Field intValue) {
            this.key = key;
            this.device = device;
            this.method = method;
            this.args = args;
            this.intValue = intValue;
        }

        static Channel missing(String key) {
            return new Channel(key, null, null, null, null);
        }

        Object get() throws Exception {
            if (method == null) return null;
            return method.invoke(device, args);
        }

        @Override
        public void readInto(List<Value> out) {
            out.add(readChannel(this));
        }
    }

    /**
     * Two or more feature ids of one device: one get(ids, int[].class) per read once verified, else the per-feature
     * reads. Starts unverified: each read then makes the per-feature reads (their values are used) and one batch
     * read to compare. Agreement with at least one available value turns the batch on; no array of the right length
     * turns it off at once, a key that differs on {@link #MAX_DIFF_READS} reads or {@link #MAX_VERIFY_READS} reads
     * without a decision turn it off. Once on, a batch with no array of the right length, or with no available value
     * while the per-feature reads have one, turns it off; that read uses the per-feature values.
     */
    static final class FeatureBatch implements Source {
        final String group;
        private final Object device;
        private final Method get;
        private final String[] keys;
        private final int[] ids;
        private final Channel[] singles;
        private final Field intArrayValue;
        private volatile String state = BATCH_UNVERIFIED;
        private boolean changed;
        private int verifyReads, diffReads;

        FeatureBatch(String group, Object device, Method get, String[] keys, int[] ids, Channel[] singles,
                     Field intArrayValue) {
            this.group = group;
            this.device = device;
            this.get = get;
            this.keys = keys;
            this.ids = ids;
            this.singles = singles;
            this.intArrayValue = intArrayValue;
        }

        String state() {
            return state;
        }

        @Override
        public synchronized void readInto(List<Value> out) {
            if (BATCH_ON.equals(state)) {
                Value[] batch = readBatch();
                if (batch != null && anyAvailable(batch)) {
                    add(out, batch);
                    return;
                }
                Value[] values = readSingles();
                if (batch == null) setState(BATCH_OFF_FAILED);
                else if (anyAvailable(values)) setState("off(batch_unavailable)");
                add(out, values);
                return;
            }
            Value[] values = readSingles();
            if (BATCH_UNVERIFIED.equals(state)) verify(readBatch(), values);
            add(out, values);
        }

        private void verify(Value[] batch, Value[] values) {
            String verdict = verdict(batch, values);
            if (verdict != null && verdict.startsWith("diff:")) {
                if (++diffReads >= MAX_DIFF_READS) {
                    setState("off(" + verdict + ")");
                    return;
                }
                verdict = null;
            }
            if (verdict == null && ++verifyReads >= MAX_VERIFY_READS) verdict = "off(unverified)";
            if (verdict != null) setState(verdict);
        }

        /** "group=state" once after each change of state, for one log line; null otherwise. */
        synchronized String takeChange() {
            if (!changed) return null;
            changed = false;
            return group + "=" + state;
        }

        private void setState(String next) {
            state = next;
            changed = true;
        }

        private Value[] readBatch() {
            try {
                Object result = get.invoke(device, new Object[]{ids, int[].class});
                return batchValues(keys, extractIntArray(result, intArrayValue));
            } catch (Throwable error) {
                return null;
            }
        }

        private Value[] readSingles() {
            Value[] values = new Value[singles.length];
            for (int i = 0; i < singles.length; i++) values[i] = readChannel(singles[i]);
            return values;
        }

        private static void add(List<Value> out, Value[] values) {
            for (Value value : values) out.add(value);
        }
    }

    private static final class ReadContext extends ContextWrapper {
        private final String[] allowed;

        ReadContext(Context base, String[] allowed) {
            super(base);
            this.allowed = allowed;
        }

        @Override
        public Context getApplicationContext() {
            return this;
        }

        @Override
        public void enforceCallingOrSelfPermission(String permission, String message) {
            for (String accepted : allowed) {
                if (accepted.equals(permission)) return;
            }
            super.enforceCallingOrSelfPermission(permission, message);
        }
    }
}
