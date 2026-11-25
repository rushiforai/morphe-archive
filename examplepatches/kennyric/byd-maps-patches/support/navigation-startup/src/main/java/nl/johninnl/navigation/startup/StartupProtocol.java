package nl.johninnl.navigation.startup;

import android.Manifest;
import android.content.Context;
import android.content.pm.PackageManager;

/** Separate control plane; navigation schema-1 observations remain unchanged. */
public final class StartupProtocol {
    private StartupProtocol() {}
    public static final String DESCRIPTOR = "nl.johninnl.navigation.STARTUP_V1";
    public static final int STATUS = 1;
    public static final long HEARTBEAT_MS = 10000;
    public static final long LEASE_MS = 15000;
    public static String controlClass(String provider) {
        return "com.waze".equals(provider) ? "org.ungoogled.waze.NavigationControlService"
            : "nl.flitsmeister".equals(provider) ? "nl.johninnl.flitsmeister.NavigationControlService" : "";
    }
    public static boolean allowed(String[] owned, String configured) {
        if (owned == null) return false;
        for (String name : owned) {
            if (configured != null && !configured.isEmpty()) {
                if (configured.equals(name)) return true;
            } else if ("app.vela".equals(name) || "com.google.android.apps.maps".equals(name)
                    || "org.ungoogled.android.apps.maps".equals(name)
                    || "org.ungoogled.android.apps.maps.microg".equals(name)) return true;
        }
        return false;
    }
    public static String state(Context context, boolean enabled, boolean running) {
        if (!enabled) return "disabled";
        if (context.checkSelfPermission(Manifest.permission.ACCESS_FINE_LOCATION) != PackageManager.PERMISSION_GRANTED
                && context.checkSelfPermission(Manifest.permission.ACCESS_COARSE_LOCATION) != PackageManager.PERMISSION_GRANTED)
            return "permission_required";
        return running ? "running" : "stopped";
    }
}
