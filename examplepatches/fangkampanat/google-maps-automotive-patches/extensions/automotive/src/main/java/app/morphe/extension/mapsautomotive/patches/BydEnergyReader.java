package app.morphe.extension.mapsautomotive.patches;

import android.content.Context;
import android.content.ContextWrapper;
import android.os.SystemClock;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/**
 * Reads the traction battery, odometer and optional telemetry from the BYD vehicle SDK.
 * Uses named read-only getters only. Process-local wrappers answer only the inspected
 * SDK checks for their device; they do not grant Android platform permissions.
 * <p>
 * Copied from fank-morphe-maps-patches 1.4.0; only the package differs.
 */
final class BydEnergyReader {
    static final class Sample {
        long elapsed;
        long wall;
        /** Dashboard state of charge, percent. Integer steps on the inspected car. */
        double soc;
        /** Remaining energy reported by the BMS, kWh (0.1 kWh steps). */
        double energy;
        /** Finer battery-level counter; scale learned against energy. -1 when unavailable. */
        int raw;
        /** Total odometer in 0.1 km. */
        int mileage;
        /** Lifetime average, not consumption measured over this sample's interval. */
        double totalConsumptionKwhPer100Km = Double.NaN;
        /** Recent average; its exact window/reset behavior is not established. */
        double recentConsumptionKwhPer100Km = Double.NaN;
        /** Display-speed signal, accepted only with metric speed and mileage units. */
        double speedKmh = Double.NaN;
        int consumptionUnit = -1;
        int speedUnit = -1;
        int mileageUnit = -1;
        /** Optional getter/unit availability, separate from required battery validity. */
        String telemetryStatus;
    }

    private static final String[] ALLOWED = {
            "android.permission.BYDAUTO_STATISTIC_GET",
            "android.permission.BYDAUTO_POWER_GET",
    };
    private static final String[] INSTRUMENT_ALLOWED = {
            "android.permission.BYDAUTO_INSTRUMENT_GET",
            "android.permission.BYDAUTO_INSTRUMENT_COMMON",
    };
    private static final int TOTAL_MILEAGE = 2;
    private static final int METRIC_UNIT = 1;

    private Object statistic;
    private Object power;
    private Method socGetter;
    private Method rawGetter;
    private Method mileageGetter;
    private Method energyGetter;
    private Object instrument;
    private Method totalConsumptionGetter;
    private Method recentConsumptionGetter;
    private Method consumptionUnitGetter;
    private Method speedGetter;
    private Method speedUnitGetter;
    private Method mileageUnitGetter;
    private boolean optionalInitAttempted;
    private String optionalInitStatus = "optional_init=not_attempted";

    /** Returns a short status for the log. Never throws. */
    String init(Context context) {
        try {
            ReadContext scoped = new ReadContext(context.getApplicationContext());
            Class<?> statisticClass = Class.forName("android.hardware.bydauto.statistic.BYDAutoStatisticDevice");
            Class<?> powerClass = Class.forName("android.hardware.bydauto.power.BYDAutoPowerDevice");
            statistic = statisticClass.getMethod("getInstance", Context.class).invoke(null, scoped);
            power = powerClass.getMethod("getInstance", Context.class).invoke(null, scoped);
            if (statistic == null || power == null) return "sdk_null";
            socGetter = statisticClass.getMethod("getElecPercentageValue");
            rawGetter = statisticClass.getMethod("getRemainingBatteryPower");
            mileageGetter = statisticClass.getMethod("getMileageNumber", int.class);
            energyGetter = powerClass.getMethod("getBatteryRemainPowerEV");
            try {
                initOptional(scoped.getBaseContext(), statisticClass);
            } catch (Throwable ignored) {
                optionalInitStatus = "optional_init=unavailable";
            }
            return "ok";
        } catch (Throwable e) {
            statistic = null;
            power = null;
            return "error " + describe(e);
        }
    }

    boolean ready() {
        return statistic != null && power != null;
    }

    /** One validated reading, or null if SOC, energy or odometer is unavailable. */
    Sample read() throws Exception {
        if (!ready()) return null;
        Sample sample = new Sample();
        sample.elapsed = SystemClock.elapsedRealtime();
        sample.wall = System.currentTimeMillis();
        sample.soc = ((Number) invoke(socGetter, statistic)).doubleValue();
        sample.energy = ((Number) invoke(energyGetter, power)).doubleValue();
        sample.mileage = ((Number) invoke(mileageGetter, statistic, TOTAL_MILEAGE)).intValue();
        int raw;
        try {
            raw = ((Number) invoke(rawGetter, statistic)).intValue();
        } catch (Exception e) {
            raw = -1;
        }
        // Reject SDK error sentinels and implausible values instead of showing them.
        sample.raw = raw >= 1 && raw <= 5000 ? raw : -1;
        if (!(sample.soc >= 0 && sample.soc <= 100)) return null;
        if (!(sample.energy > 0 && sample.energy < 150)) return null;
        if (sample.mileage <= 0) return null;
        try {
            readOptional(sample);
        } catch (Throwable ignored) {
            sample.telemetryStatus = "optional_read=unavailable";
        }
        return sample;
    }

    /** Resolve optional methods once, without making them a battery-read dependency. */
    private void initOptional(Context context, Class<?> statisticClass) {
        if (optionalInitAttempted) return;
        optionalInitAttempted = true;
        totalConsumptionGetter = optionalMethod(statisticClass, "getTotalElecConPHMValue");
        recentConsumptionGetter = optionalMethod(statisticClass, "getLastElecConPHMValue");
        consumptionUnitGetter = optionalMethod(statisticClass, "getTotalElecConPhmUnit");
        speedGetter = optionalMethod(statisticClass, "getSpeedSignalVDisValue");
        try {
            Class<?> type = Class.forName("android.hardware.bydauto.instrument.BYDAutoInstrumentDevice");
            instrument = type.getMethod("getInstance", Context.class).invoke(null,
                    new ReadContext(context, INSTRUMENT_ALLOWED));
            if (instrument == null) {
                optionalInitStatus = "instrument_init=null";
                return;
            }
            speedUnitGetter = optionalMethod(type, "getSpeedUnit");
            mileageUnitGetter = optionalMethod(type, "getMileageUnit");
            optionalInitStatus = "instrument_init=ok";
        } catch (Throwable e) {
            instrument = null;
            // Unsupported firmware must not initialize this optional device every poll.
            optionalInitStatus = "instrument_init=unavailable";
        }
    }

    /** Optional failures leave NaN values, never invalidate a fresh SOC/Wh reading. */
    private void readOptional(Sample sample) {
        sample.consumptionUnit = optionalUnit(consumptionUnitGetter, statistic);
        sample.speedUnit = optionalUnit(speedUnitGetter, instrument);
        sample.mileageUnit = optionalUnit(mileageUnitGetter, instrument);
        if (sample.consumptionUnit == METRIC_UNIT) {
            sample.totalConsumptionKwhPer100Km = validConsumption(
                    optionalNumber(totalConsumptionGetter, statistic));
            sample.recentConsumptionKwhPer100Km = validConsumption(
                    optionalNumber(recentConsumptionGetter, statistic));
        }
        if (sample.speedUnit == METRIC_UNIT && sample.mileageUnit == METRIC_UNIT) {
            double speed = optionalNumber(speedGetter, statistic);
            if (Double.isFinite(speed) && speed >= 0 && speed <= 282) sample.speedKmh = speed;
        }
        sample.telemetryStatus = optionalInitStatus
                + ";consumption_unit=" + sample.consumptionUnit
                + ";speed_unit=" + sample.speedUnit
                + ";mileage_unit=" + sample.mileageUnit
                + ";total=" + optionalStatus(totalConsumptionGetter, sample.totalConsumptionKwhPer100Km)
                + ";recent=" + optionalStatus(recentConsumptionGetter, sample.recentConsumptionKwhPer100Km)
                + ";speed=" + optionalStatus(speedGetter, sample.speedKmh);
    }

    private static Method optionalMethod(Class<?> type, String name) {
        try {
            return type.getMethod(name);
        } catch (Throwable e) {
            return null;
        }
    }

    private static double optionalNumber(Method method, Object target) {
        if (method == null || target == null) return Double.NaN;
        try {
            Object value = invoke(method, target);
            return value instanceof Number ? ((Number) value).doubleValue() : Double.NaN;
        } catch (Throwable e) {
            return Double.NaN;
        }
    }

    private static int optionalUnit(Method method, Object target) {
        double value = optionalNumber(method, target);
        return Double.isFinite(value) && value >= 0 && value <= Integer.MAX_VALUE
                && value == Math.rint(value) ? (int) value : -1;
    }

    private static double validConsumption(double value) {
        return Double.isFinite(value) && value > 0 && value <= 99.9 ? value : Double.NaN;
    }

    private static String optionalStatus(Method getter, double value) {
        return getter == null ? "missing" : Double.isFinite(value) ? "ok" : "unavailable";
    }

    private static Object invoke(Method method, Object target, Object... args) throws Exception {
        try {
            return method.invoke(target, args);
        } catch (InvocationTargetException e) {
            Throwable cause = e.getCause();
            if (cause instanceof Exception) throw (Exception) cause;
            throw e;
        }
    }

    static String describe(Throwable e) {
        while (e instanceof InvocationTargetException && e.getCause() != null) e = e.getCause();
        return e.getClass().getSimpleName() + ": " + e.getMessage();
    }

    private static final class ReadContext extends ContextWrapper {
        private final String[] allowed;

        ReadContext(Context base) {
            this(base, ALLOWED);
        }

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
