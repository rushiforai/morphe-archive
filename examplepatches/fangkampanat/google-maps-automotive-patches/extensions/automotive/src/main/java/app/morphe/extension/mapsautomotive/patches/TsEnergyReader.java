package app.morphe.extension.mapsautomotive.patches;

import android.content.Context;
import android.os.SystemClock;

import org.json.JSONException;
import org.json.JSONObject;

import java.lang.reflect.Method;
import java.util.Locale;

/**
 * Reads the traction battery and odometer on DiLink 5 (the Sealion 7, Android 11), which has no BYD
 * SDK for {@link BydEnergyReader}. The head unit's framework provides the TS car adapter
 * (com.ts.lib.caradapter); its CarAdapterService serves any app without a permission. Its general
 * manager has the DiLink 3 SDK's getter names: SOC, remaining EV energy (kWh), odometer, consumption.
 * <p>
 * The adapter binds its service asynchronously, so a read returns null until it is connected, and the
 * service restarts at times (with the 360° camera in reverse gear), so an unbound adapter is connected
 * again. Units come from the service and are not documented: the raw values go to the log and the
 * problem report (of the odometer only whether it is valid). TS codes 0 for km and kWh/100 km
 * (TS's own distance codes are 0 km, 1 miles; the Sealion 7 in km reports 0 for both) become the
 * DiLink 3 SDK's codes in the sample; other codes are not learned from. Named read-only getters by
 * reflection; no TS class is bundled.
 */
final class TsEnergyReader implements BydBatterySource {
    static final String ADAPTER_CLASS = "com.ts.lib.caradapter.CarAdapterManager";
    private static final String TAG = "MorpheBydBattery";
    private static final String GENERAL_MANAGER = "general";
    /** The DiLink 3 SDK's code for km and kWh/100 km, which the samples carry. */
    private static final int METRIC_UNIT = 1;
    /** TS's code for km (com.ts.lib.cluster's NaviDistanceUnit: 0 km, 1 miles) and, on the Sealion 7, kWh/100 km. */
    private static final int TS_METRIC_UNIT = 0;
    /** Unbound polls (10 s each) between connect attempts. */
    private static final int RECONNECT_POLLS = 3;

    private Object adapter;
    private Method boundGetter, connect;
    private Object general;
    private Method socGetter, energyGetter, mileageGetter;
    private Method mileageUnitGetter, consumptionGetter, consumptionUnitGetter, elecUnitGetter, remainingGetter, packEnergyGetter;
    private int unboundPolls;
    private boolean wasBound;
    private String lastValidity;
    /** The last raw values and their time, for the problem report; null before the first bound read. */
    private volatile JSONObject raw;

    @Override
    public String init(Context context) {
        try {
            Class<?> type = Class.forName(ADAPTER_CLASS);
            adapter = type.getMethod("getInstance", Context.class).invoke(null, context.getApplicationContext());
            if (adapter == null) return "ts_adapter_null";
            boundGetter = type.getMethod("isCarServiceBound");
            connect = type.getMethod("connect");
            connect.invoke(adapter);
            return "ts_adapter connecting";
        } catch (Throwable e) {
            adapter = null;
            return "ts_adapter error " + BydEnergyReader.describe(e);
        }
    }

    @Override
    public boolean ready() {
        return adapter != null;
    }

    @Override
    public BydEnergyReader.Sample read() throws Exception {
        if (adapter == null) return null;
        boolean bound = Boolean.TRUE.equals(BydEnergyReader.invoke(boundGetter, adapter));
        if (bound != wasBound) {
            wasBound = bound;
            ReportLog.i(TAG, "TS car adapter " + (bound ? "bound" : "not bound"));
        }
        if (!bound) {
            // A new connection serves a new manager.
            general = null;
            if (++unboundPolls % RECONNECT_POLLS == 0) BydEnergyReader.invoke(connect, adapter);
            return null;
        }
        unboundPolls = 0;
        // Taken on a poll: in the connection callback getCarAdapterManager waits for a lock the callback holds.
        if (general == null && !resolveGeneral()) return null;

        BydEnergyReader.Sample sample = new BydEnergyReader.Sample();
        sample.elapsed = SystemClock.elapsedRealtime();
        sample.wall = System.currentTimeMillis();
        double soc = number(socGetter), energy = number(energyGetter), odometerKm = number(mileageGetter);
        int mileageUnit = unit(mileageUnitGetter), consumptionUnit = unit(consumptionUnitGetter);
        double consumption = number(consumptionGetter);
        saveRaw(soc, energy, odometerKm, mileageUnit, consumption, consumptionUnit);

        // 0 is the adapter's value before the car reports SOC (and on an error); -10 is its error value.
        String validity = !(soc > 0 && soc <= 100) ? "soc" : !(energy > 0 && energy < 150) ? "energy"
                : !(odometerKm > 0 && odometerKm < 2_000_000) ? "odometer" : "ok";
        if (!validity.equals(lastValidity)) {
            lastValidity = validity;
            ReportLog.i(TAG, "TS car adapter reading " + (validity.equals("ok") ? "valid" : "rejected (" + validity + ")")
                    + ": " + reportRaw());
        }
        if (!validity.equals("ok")) return null;
        sample.soc = soc;
        sample.energy = energy;
        sample.mileage = (int) Math.round(odometerKm * 10);
        // Its finer counter's meaning is not known on DiLink 5.
        sample.raw = -1;
        // In the DiLink 3 SDK's codes; with any other TS code nothing is learned and the car's average is unused.
        sample.mileageUnit = mileageUnit == TS_METRIC_UNIT ? METRIC_UNIT : -1;
        sample.consumptionUnit = consumptionUnit == TS_METRIC_UNIT ? METRIC_UNIT : -1;
        if (sample.consumptionUnit == METRIC_UNIT) sample.totalConsumptionKwhPer100Km = BydEnergyReader.validConsumption(consumption);
        sample.telemetryStatus = "source=ts_car_adapter;ts_consumption_unit=" + consumptionUnit + ";ts_mileage_unit=" + mileageUnit
                + ";total=" + (consumptionGetter == null ? "missing" : Double.isFinite(sample.totalConsumptionKwhPer100Km) ? "ok" : "unavailable");
        return sample;
    }

    /** The last raw values, or null before the first bound read. */
    JSONObject reportRaw() {
        return raw;
    }

    private boolean resolveGeneral() throws Exception {
        Object manager = adapter.getClass().getMethod("getCarAdapterManager", String.class).invoke(adapter, GENERAL_MANAGER);
        if (manager == null) return false;
        Class<?> type = manager.getClass();
        socGetter = type.getMethod("getElecPercentageValue");
        energyGetter = type.getMethod("getEvRemainingBatteryPower");
        mileageGetter = type.getMethod("getTotalMileageValue");
        mileageUnitGetter = optionalMethod(type, "getMileageUnit");
        consumptionGetter = optionalMethod(type, "getTotalElecConPhmValue");
        consumptionUnitGetter = optionalMethod(type, "getElecConsUnit");
        elecUnitGetter = optionalMethod(type, "getElecUnit");
        remainingGetter = optionalMethod(type, "getRemainingBatteryPower");
        packEnergyGetter = optionalMethod(type, "getBatteryPackEnergy");
        general = manager;
        ReportLog.i(TAG, "TS car adapter: general manager " + type.getName());
        return true;
    }

    private void saveRaw(double soc, double energy, double odometerKm, int mileageUnit, double consumption, int consumptionUnit) {
        try {
            raw = new JSONObject()
                    .put("at", System.currentTimeMillis())
                    .put("soc", json(soc))
                    .put("ev_remaining_battery_power", json(energy))
                    .put("remaining_battery_power", json(number(remainingGetter)))
                    .put("battery_pack_energy", json(number(packEnergyGetter)))
                    .put("elec_unit", unitJson(unit(elecUnitGetter)))
                    // Not the odometer itself, which the consent text does not name.
                    .put("total_mileage_valid", odometerKm > 0 && odometerKm < 2_000_000)
                    .put("mileage_unit", unitJson(mileageUnit))
                    .put("total_consumption_phm", json(consumption))
                    .put("consumption_unit", unitJson(consumptionUnit));
        } catch (JSONException ignored) {
            // Only finite numbers are put.
        }
    }

    private double number(Method method) {
        if (method == null || general == null) return Double.NaN;
        try {
            Object value = BydEnergyReader.invoke(method, general);
            return value instanceof Number ? ((Number) value).doubleValue() : Double.NaN;
        } catch (Throwable e) {
            return Double.NaN;
        }
    }

    private int unit(Method method) {
        double value = number(method);
        return Double.isFinite(value) && value >= 0 && value <= Integer.MAX_VALUE && value == Math.rint(value) ? (int) value : -1;
    }

    private static Object json(double value) {
        // Floats from the adapter: rounded so 49.400001 reads as 49.4.
        return Double.isFinite(value) ? Double.parseDouble(String.format(Locale.ROOT, "%.3f", value)) : JSONObject.NULL;
    }

    private static Object unitJson(int unit) {
        return unit >= 0 ? unit : JSONObject.NULL;
    }

    private static Method optionalMethod(Class<?> type, String name) {
        try {
            return type.getMethod(name);
        } catch (Throwable e) {
            return null;
        }
    }
}
