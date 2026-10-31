package app.morphe.extension.mapsautomotive.patches;

import android.content.Context;
import android.content.ContextWrapper;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/**
 * The outside temperature from the BYD SDK's instrument device, for the BYD energy-model file.
 * A named read-only getter, as BydEnergyReader (kept verbatim from the phone) uses the
 * same device for its units; the device is a process singleton, usually created by that reader. The
 * wrapper answers only the SDK's own instrument checks and grants no Android platform permission.
 */
final class BydOutsideTemperature {
    static final int UNAVAILABLE = Integer.MIN_VALUE;
    private static final String[] ALLOWED = {
            "android.permission.BYDAUTO_INSTRUMENT_GET",
            "android.permission.BYDAUTO_INSTRUMENT_COMMON",
    };
    // DiCarServer's files cover -25 to 38 °C; outside this the reading is an SDK sentinel or a fault.
    private static final int MIN_C = -40, MAX_C = 70;

    private Object instrument;
    private Method getter;

    /** Returns a short status for the log. Never throws. */
    String init(Context context) {
        try {
            Class<?> type = Class.forName("android.hardware.bydauto.instrument.BYDAutoInstrumentDevice");
            instrument = type.getMethod("getInstance", Context.class)
                    .invoke(null, new ReadContext(context.getApplicationContext()));
            if (instrument == null) return "instrument_null";
            getter = type.getMethod("getOutCarTemperature");
            return "ok";
        } catch (Throwable error) {
            instrument = null;
            return "unavailable " + BydEnergyReader.describe(error);
        }
    }

    boolean ready() {
        return instrument != null && getter != null;
    }

    /** °C, or {@link #UNAVAILABLE}. */
    int read() {
        if (!ready()) return UNAVAILABLE;
        try {
            Object value = getter.invoke(instrument);
            if (!(value instanceof Integer)) return UNAVAILABLE;
            int celsius = (Integer) value;
            return celsius >= MIN_C && celsius <= MAX_C ? celsius : UNAVAILABLE;
        } catch (InvocationTargetException | IllegalAccessException | RuntimeException error) {
            return UNAVAILABLE;
        }
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
