package nl.johninnl.carports;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import androidx.car.app.managers.ResultManager;

/** Android Auto does not implement Automotive's cross-app activity-result workflow. */
public final class ProjectedResults implements ResultManager {
    private static final ProjectedResults INSTANCE = new ProjectedResults();
    private ProjectedResults() { }

    public static boolean isAutomotive(Context context) {
        return context.getPackageManager().hasSystemFeature(PackageManager.FEATURE_AUTOMOTIVE);
    }

    public static ResultManager get() { return INSTANCE; }

    @Override public ComponentName getCallingComponent() { return null; }

    @Override public void setCarAppResult(int resultCode, Intent data) {
        throw new IllegalStateException("Car app results are unavailable on Android Auto");
    }
}
