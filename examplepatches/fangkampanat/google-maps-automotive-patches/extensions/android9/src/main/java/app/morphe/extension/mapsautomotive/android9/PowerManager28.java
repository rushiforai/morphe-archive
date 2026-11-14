package app.morphe.extension.mapsautomotive.android9;

import android.os.Build;
import android.os.PowerManager;

import java.util.concurrent.Executor;

/** Thermal status (patch "Android 9 (API 28)"): Android 9 reports none, so no status and no listener. */
public final class PowerManager28 {
    public static final String OWNER = "Landroid/os/PowerManager;";

    private PowerManager28() {
    }

    public static int getCurrentThermalStatus(PowerManager manager) {
        if (Build.VERSION.SDK_INT >= 29) return manager.getCurrentThermalStatus();
        return 0; // THERMAL_STATUS_NONE
    }

    public static void addThermalStatusListener(PowerManager manager, Executor executor,
                                                PowerManager.OnThermalStatusChangedListener listener) {
        if (Build.VERSION.SDK_INT >= 29) manager.addThermalStatusListener(executor, listener);
    }

    public static void removeThermalStatusListener(PowerManager manager,
                                                   PowerManager.OnThermalStatusChangedListener listener) {
        if (Build.VERSION.SDK_INT >= 29) manager.removeThermalStatusListener(listener);
    }
}
