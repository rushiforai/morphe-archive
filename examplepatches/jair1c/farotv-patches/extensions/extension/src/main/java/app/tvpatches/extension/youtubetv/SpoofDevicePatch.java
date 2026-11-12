package app.tvpatches.extension.youtubetv;

import android.system.Os;
import android.util.Log;

/**
 * Sets the environment variables read by libytvshim.so (see native/ytvshim) so the native engine
 * reports another device brand, model, manufacturer and chipset to YouTube.
 *
 * Called at the start of CobaltActivity.onCreate, before the engine library is loaded.
 */
@SuppressWarnings("unused")
public final class SpoofDevicePatch {
    private static final String[] VARIABLES = {"YTV_BRAND", "YTV_MODEL", "YTV_MANUFACTURER", "YTV_CHIPSET"};

    private SpoofDevicePatch() {
    }

    /** Replaced by the patch: "brand|model|manufacturer|chipset" from the patch options. */
    private static String getPatchedValues() {
        return "";
    }

    public static void setEnvironment() {
        try {
            String[] values = getPatchedValues().split("\\|", -1);
            for (int i = 0; i < VARIABLES.length && i < values.length; i++) {
                if (!values[i].isEmpty()) Os.setenv(VARIABLES[i], values[i], true);
            }
            Log.i(TvScripts.TAG, "spoof device: " + getPatchedValues());
        } catch (Throwable t) {
            Log.w(TvScripts.TAG, "spoof device failed", t);
        }
    }
}
