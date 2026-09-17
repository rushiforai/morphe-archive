/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.privacy;

import android.hardware.Sensor;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;

import app.morphe.extension.shared.Logger;

@SuppressWarnings("unused")
public final class ResourceBatteryGovernor {

    public static boolean interceptSensorRegistration(
            SensorManager manager, SensorEventListener listener, Sensor sensor, int delay) {
        if (sensor == null) return false;
        int type = sensor.getType();
        if (type == Sensor.TYPE_ACCELEROMETER || type == Sensor.TYPE_GYROSCOPE
                || type == Sensor.TYPE_MAGNETIC_FIELD || type == Sensor.TYPE_ROTATION_VECTOR
                || type == Sensor.TYPE_LINEAR_ACCELERATION || type == Sensor.TYPE_GRAVITY) {
            Logger.printInfo(() -> "Resource governor: blocked sensor registration for type " + type);
            return false;
        }
        return manager.registerListener(listener, sensor, delay);
    }

    private ResourceBatteryGovernor() {}
}
