package dev.srwi.gintype.extension.settings;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.util.Log;

public final class GboardPatchesFeatureAvailability {
    public static final String FEATURE_THICC_TOP_BAR =
            "dev.srwi.gintype.feature.thicc_top_bar";
    public static final String FEATURE_MULTIGLIDE =
            "dev.srwi.gintype.feature.multiglide";
    public static final String FEATURE_TYPING_EFFECTS =
            "dev.srwi.gintype.feature.typing_effects";
    public static final String FEATURE_CUSTOM_HOLD_POPUPS =
            "dev.srwi.gintype.feature.custom_hold_popups";

    private static final String TAG = "GboardPatches";

    private GboardPatchesFeatureAvailability() {
    }

    public static boolean isMultiGlidePatchPresent(Context context) {
        return hasFeature(context, FEATURE_MULTIGLIDE);
    }

    public static boolean hasFeature(Context context, String featureKey) {
        if (context == null || featureKey == null || featureKey.isEmpty()) {
            return false;
        }
        return hasAnyFeature(context, featureKey);
    }

    public static boolean hasAnyFeature(Context context, String... featureKeys) {
        if (context == null || featureKeys == null || featureKeys.length == 0) {
            return false;
        }
        for (String featureKey : featureKeys) {
            if (featureKey == null || featureKey.isEmpty()) {
                return false;
            }
        }

        try {
            Context applicationContext = context.getApplicationContext();
            Context lookupContext = applicationContext != null ? applicationContext : context;
            PackageManager packageManager = lookupContext.getPackageManager();
            if (packageManager == null) {
                return false;
            }
            ApplicationInfo applicationInfo = packageManager.getApplicationInfo(
                    lookupContext.getPackageName(),
                    PackageManager.GET_META_DATA);
            Bundle metaData = applicationInfo.metaData;
            if (metaData == null) {
                return false;
            }
            for (String featureKey : featureKeys) {
                if (metaData.getBoolean(featureKey, false)) {
                    return true;
                }
            }
            return false;
        } catch (Throwable throwable) {
            try {
                Log.w(TAG, "Failed to resolve feature marker: " + describeFeatures(featureKeys),
                        throwable);
            } catch (Throwable ignored) {
                // Feature detection still fails closed when logging is unavailable.
            }
            return false;
        }
    }

    private static String describeFeatures(String[] featureKeys) {
        if (featureKeys.length == 1) {
            return featureKeys[0];
        }

        StringBuilder builder = new StringBuilder();
        for (int index = 0; index < featureKeys.length; index++) {
            if (index > 0) {
                builder.append(", ");
            }
            builder.append(featureKeys[index]);
        }
        return builder.toString();
    }
}
