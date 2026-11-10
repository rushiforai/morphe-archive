/*
 * Forked from Hushfacebook (https://github.com/SysAdminDoc/Hushfacebook, GPL-3.0),
 * extensions/facebook/.../ads/AudienceNetwork.java. Modified for facebook-morphe-patches, 2026:
 * no settings or diagnostics.
 */
package app.fbpatches.extension.facebook.ads;

import android.content.ComponentName;
import android.content.pm.PackageManager;
import android.util.Log;

/**
 * Keeps the Audience Network components (the bridge Facebook uses to serve its ads inside other
 * apps) off. A startup task turns the ipc components on in a state the server picks, so its calls
 * come through {@link #componentState}.
 */
@SuppressWarnings("unused")
public final class AudienceNetwork {
    private static final String TAG = "FbPatches";

    static final String[] COMPONENTS = {
            "com.facebook.ads.internal.ipc.AudienceNetworkRemoteService",
            "com.facebook.ads.internal.ipc.AudienceNetworkRemoteActivity",
            "com.facebook.ads.internal.ipc.AudienceNetworkExportedActivity",
            "com.facebook.ads.AudienceNetworkActivity",
            "com.facebook.audiencenetwork.AudienceNetworkService",
    };

    private AudienceNetwork() {
    }

    /**
     * Injection point, in place of the startup task's PackageManager.setComponentEnabledSetting
     * call. Makes the call, with the manifest's state in place of "enabled" for an Audience Network
     * component, so the call's own errors still reach Facebook.
     */
    public static void componentState(PackageManager manager, ComponentName component, int state, int flags) {
        manager.setComponentEnabledSetting(component, kept(component, state), flags);
    }

    static int kept(ComponentName component, int state) {
        try {
            if (state != PackageManager.COMPONENT_ENABLED_STATE_ENABLED || !isAudienceNetwork(component)) return state;
            return PackageManager.COMPONENT_ENABLED_STATE_DEFAULT;
        } catch (Throwable failure) {
            Log.w(TAG, "AudienceNetwork.kept failed", failure);
            return state;
        }
    }

    private static boolean isAudienceNetwork(ComponentName component) {
        String name = component == null ? null : component.getClassName();
        if (name == null) return false;
        for (String known : COMPONENTS) {
            if (known.equals(name)) return true;
        }
        return false;
    }
}
