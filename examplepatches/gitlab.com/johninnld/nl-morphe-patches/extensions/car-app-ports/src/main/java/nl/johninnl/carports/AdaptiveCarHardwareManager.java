package nl.johninnl.carports;

import android.content.pm.PackageManager;
import androidx.car.app.CarContext;
import androidx.car.app.HostDispatcher;
import androidx.car.app.hardware.CarHardwareManager;
import androidx.car.app.hardware.ProjectedCarHardwareManager;
import androidx.car.app.hardware.climate.CarClimate;
import androidx.car.app.hardware.info.CarInfo;
import androidx.car.app.hardware.info.CarSensors;
import java.lang.reflect.InvocationTargetException;

/** Selects the library's real implementation for the device hosting the app process. */
public final class AdaptiveCarHardwareManager implements CarHardwareManager {
    private final CarHardwareManager delegate;

    public AdaptiveCarHardwareManager(CarContext context, HostDispatcher dispatcher) {
        if (!context.getPackageManager().hasSystemFeature(PackageManager.FEATURE_AUTOMOTIVE)) {
            delegate = new ProjectedCarHardwareManager(context, dispatcher);
            return;
        }
        // Do not load android.car-dependent classes while constructing a phone client.
        try {
            delegate = (CarHardwareManager) Class.forName(
                    "androidx.car.app.hardware.AutomotiveCarHardwareManager")
                    .getConstructor(CarContext.class, HostDispatcher.class)
                    .newInstance(context, dispatcher);
        } catch (InvocationTargetException failure) {
            Throwable cause = failure.getCause();
            if (cause instanceof RuntimeException) throw (RuntimeException) cause;
            if (cause instanceof Error) throw (Error) cause;
            throw new IllegalStateException("Automotive car hardware could not start", cause);
        } catch (ReflectiveOperationException failure) {
            throw new IllegalStateException("Automotive car hardware implementation is missing", failure);
        }
    }

    @Override public CarInfo getCarInfo() { return delegate.getCarInfo(); }
    @Override public CarSensors getCarSensors() { return delegate.getCarSensors(); }
    @Override public CarClimate getCarClimate() { return delegate.getCarClimate(); }
}
