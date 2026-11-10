package app.morphe.extension.mapsautomotive.patches;

import android.content.Context;
import android.content.ContextWrapper;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/**
 * The battery health (SOH) and the battery temperatures from the BYD SDK's statistic device, for the BYD
 * battery dialog and the report only. DiLink 3's SDK has no named getter for them; they are statistic
 * features, read with the device's public get(int[], Class) for an int, with the feature ids from the
 * SDK's public BYDAutoFeatureIds at run time. That call checks the feature against the device's own
 * feature list and the statistic read permission, which the wrapper answers (no Android platform
 * permission). An unsupported feature returns a sentinel; out-of-range values count as no reading.
 */
final class BydBatteryHealth {
    static final int UNAVAILABLE = Integer.MIN_VALUE;
    /** The temperatures are raw − 40 °C; shown only from −30 to 70 °C (raw 0, −40 °C, is how a missing value reads). */
    static final int TEMPERATURE_OFFSET = 40, MIN_C = -30, MAX_C = 70;
    static final int MIN_SOH = 1, MAX_SOH = 100;
    private static final String DEVICE_CLASS = "android.hardware.bydauto.statistic.BYDAutoStatisticDevice";
    private static final String FEATURE_IDS_CLASS = "android.hardware.bydauto.BYDAutoFeatureIds";
    private static final String EVENT_VALUE_CLASS = "android.hardware.bydauto.BYDAutoEventValue";
    private static final String HEALTH = "STATISTIC_BATTERY_HEALTHY_INDEX", AVERAGE = "STATISTIC_AVERAGE_BATTERY_TEMP",
            HIGHEST = "STATISTIC_HIGHEST_BATTERY_TEMP", LOWEST = "STATISTIC_LOWEST_BATTERY_TEMP";
    private static final String[] ALLOWED = {"android.permission.BYDAUTO_STATISTIC_GET"};

    /** Raw values of one read; {@link #UNAVAILABLE} where the call failed. */
    static final class Raw {
        int health = UNAVAILABLE, average = UNAVAILABLE, highest = UNAVAILABLE, lowest = UNAVAILABLE;
    }

    private Object statistic;
    private Method get;
    private Field intValue;
    private int healthId, averageId, highestId, lowestId;

    /** Returns a short status for the log and the report. Never throws. */
    String init(Context context) {
        try {
            Class<?> ids = Class.forName(FEATURE_IDS_CLASS);
            healthId = ids.getField(HEALTH).getInt(null);
            averageId = ids.getField(AVERAGE).getInt(null);
            highestId = ids.getField(HIGHEST).getInt(null);
            lowestId = ids.getField(LOWEST).getInt(null);
            intValue = Class.forName(EVENT_VALUE_CLASS).getField("intValue");
            Class<?> type = Class.forName(DEVICE_CLASS);
            get = type.getMethod("get", int[].class, Class.class);
            statistic = type.getMethod("getInstance", Context.class)
                    .invoke(null, new ReadContext(context.getApplicationContext()));
            return statistic == null ? "statistic_null" : "ok";
        } catch (Throwable error) {
            statistic = null;
            return "unavailable " + BydEnergyReader.describe(error);
        }
    }

    boolean ready() {
        return statistic != null && get != null && intValue != null;
    }

    int readHealth() {
        return read(healthId);
    }

    /** The three temperatures, raw. */
    Raw readTemperatures(Raw into) {
        into.average = read(averageId);
        into.highest = read(highestId);
        into.lowest = read(lowestId);
        return into;
    }

    private int read(int feature) {
        if (!ready()) return UNAVAILABLE;
        try {
            Object value = get.invoke(statistic, new int[]{feature}, int.class);
            return value == null ? UNAVAILABLE : intValue.getInt(value);
        } catch (InvocationTargetException | IllegalAccessException | RuntimeException error) {
            return UNAVAILABLE;
        }
    }

    /** The health in percent, or {@link #UNAVAILABLE}: 1 to 100 only (0 means no reading). */
    static int healthPercent(int raw) {
        return raw >= MIN_SOH && raw <= MAX_SOH ? raw : UNAVAILABLE;
    }

    /** °C, or {@link #UNAVAILABLE} outside −30 to 70 °C. */
    static int celsius(int raw) {
        if (raw == UNAVAILABLE) return UNAVAILABLE;
        long value = (long) raw - TEMPERATURE_OFFSET;
        return value >= MIN_C && value <= MAX_C ? (int) value : UNAVAILABLE;
    }

    private static final class ReadContext extends ContextWrapper {
        ReadContext(Context base) {
            super(base);
        }

        @Override
        public Context getApplicationContext() {
            return this;
        }

        @Override
        public void enforceCallingOrSelfPermission(String permission, String message) {
            for (String accepted : ALLOWED) {
                if (accepted.equals(permission)) return;
            }
            super.enforceCallingOrSelfPermission(permission, message);
        }
    }
}
