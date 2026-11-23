package nl.johninnl.eclipse.auto.ui;

import androidx.car.app.CarContext;
import androidx.car.app.versioning.CarAppApiLevels;

/** The only place that reads the negotiated Car App API level. */
public final class Level {
    /** True when the host negotiated API 9; API 9 components are never built below that. */
    public static boolean api9(CarContext context) {
        return context.getCarAppApiLevel() >= CarAppApiLevels.LEVEL_9;
    }

    private Level() { }
}
