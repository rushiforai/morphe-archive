package patches.ytmusic;

import android.content.Context;

/** Caller authentication and browser eligibility are separate decisions. */
public final class GearslipSupport {
    private GearslipSupport() {}

    /** Replaced by the patch option; no validation-only package is trusted by default. */
    public static String getConfiguredPackageNames() {
        return "app.seb3thehacker.gearslip";
    }

    /** Capability lookup only. Authentication always happens in decision(), using callback UID. */
    public static boolean isConfiguredPackage(String packageName) {
        if (packageName == null) return false;
        for (String configured : getConfiguredPackageNames().split(",")) {
            if (packageName.equals(configured.trim())) return true;
        }
        return false;
    }

    /** -1 retains YT Music's original policy; 0 rejects a spoof; 1 admits an installed host. */
    public static int decision(Context context, String packageName, int callbackUid) {
        if (!isConfiguredPackage(packageName)) return -1;
        if (context == null || callbackUid < 0) return 0;
        try {
            String[] owned = context.getPackageManager().getPackagesForUid(callbackUid);
            if (owned != null) {
                for (String candidate : owned) {
                    if (packageName.equals(candidate)) return 1;
                }
            }
        } catch (RuntimeException unavailable) {
            // A configured host must never fall through to a flag-dependent weaker check.
        }
        return 0;
    }
}
