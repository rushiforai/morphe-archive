package app.morphe.extension.maps.patches;

import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.util.Log;

import app.morphe.extension.shared.Utils;

/** Selects the location action supported by the installed GmsCore provider. */
public final class LocationServicePatch {
    private static final String PROVIDER_PACKAGE = "app.revanced.android.gms";
    private static final String GOOGLE_ACTION =
            "com.google.android.location.internal.GoogleLocationManagerService.START";
    private static final String RENAMED_ACTION =
            "app.revanced.android.location.internal.GoogleLocationManagerService.START";

    private LocationServicePatch() {
    }

    public static String getServiceAction() {
        Context context = Utils.getContext();
        if (context == null) return GOOGLE_ACTION;

        try {
            PackageManager packages = context.getPackageManager();
            // Prefer the existing protocol when both aliases are supported. Do not cache:
            // the user can replace or update the provider while Maps remains installed.
            if (supports(packages, GOOGLE_ACTION)) return GOOGLE_ACTION;
            if (supports(packages, RENAMED_ACTION)) return RENAMED_ACTION;
        } catch (RuntimeException exception) {
            Log.w("MapsLocationService", "Could not resolve provider location action", exception);
        }
        return GOOGLE_ACTION;
    }

    private static boolean supports(PackageManager packages, String action) {
        ResolveInfo resolved = packages.resolveService(
                new Intent(action).setPackage(PROVIDER_PACKAGE), 0);
        return resolved != null && resolved.serviceInfo != null
                && resolved.serviceInfo.exported && resolved.serviceInfo.enabled
                && PROVIDER_PACKAGE.equals(resolved.serviceInfo.packageName);
    }
}
