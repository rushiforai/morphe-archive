package app.morphe.extension.mapsautomotive.patches;

import android.content.Context;
import android.content.ContextWrapper;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/**
 * The car's low beam and side lights from the BYD SDK's light device, for {@link ColorScheme}. Named
 * read-only getter (getLightStatus) by reflection; the light types and on/off values come from the
 * device's own constants. The wrapper answers only the SDK's light read check and grants no Android
 * platform permission. No setter and no listener.
 */
final class BydLightReader {
    static final int OFF = 0, ON = 1, UNKNOWN = -1;
    /** A raw read that gave no integer (an exception or another type). */
    static final int NO_VALUE = Integer.MIN_VALUE;
    private static final String DEVICE_CLASS = "android.hardware.bydauto.light.BYDAutoLightDevice";
    private static final String[] ALLOWED = {"android.permission.BYDAUTO_LIGHT_GET"};

    private Object light;
    private Method getter;
    private int lowBeamType, sideType, onValue, offValue;

    /** Returns a short status for the log and the report. Never throws. */
    String init(Context context) {
        try {
            Class<?> type = Class.forName(DEVICE_CLASS);
            lowBeamType = type.getField("LIGHT_LOW_BEAM").getInt(null);
            sideType = type.getField("LIGHT_SIDE").getInt(null);
            onValue = type.getField("LIGHT_ON").getInt(null);
            offValue = type.getField("LIGHT_OFF").getInt(null);
            if (onValue == offValue) return "light_values_equal";
            getter = type.getMethod("getLightStatus", int.class);
            light = type.getMethod("getInstance", Context.class)
                    .invoke(null, new ReadContext(context.getApplicationContext()));
            return light == null ? "light_null" : "ok";
        } catch (Throwable error) {
            light = null;
            return "unavailable " + BydEnergyReader.describe(error);
        }
    }

    boolean ready() {
        return light != null && getter != null;
    }

    /** The low beam as the SDK returns it, or {@link #NO_VALUE}. */
    int lowBeamRaw() {
        return readRaw(lowBeamType);
    }

    /** The side lights as the SDK returns them, or {@link #NO_VALUE}. */
    int sideLightsRaw() {
        return readRaw(sideType);
    }

    /** {@link #ON}, {@link #OFF}, or {@link #UNKNOWN} for no value, a sentinel or any other value. */
    int state(int raw) {
        if (raw == NO_VALUE) return UNKNOWN;
        return raw == onValue ? ON : raw == offValue ? OFF : UNKNOWN;
    }

    private int readRaw(int lightType) {
        if (!ready()) return NO_VALUE;
        try {
            Object value = getter.invoke(light, lightType);
            return value instanceof Integer ? (Integer) value : NO_VALUE;
        } catch (InvocationTargetException | IllegalAccessException | RuntimeException error) {
            return NO_VALUE;
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
