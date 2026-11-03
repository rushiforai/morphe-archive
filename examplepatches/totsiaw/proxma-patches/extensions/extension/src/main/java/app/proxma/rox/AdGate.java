package app.proxma.rox;

import android.util.Log;

import java.util.Locale;
import java.util.Map;

/**
 * Decides which calls from the Dart ad code reach the Prebid plugin. Banners and interstitials stop
 * here. Rewarded video is let through so the app's "watch an ad for points" option keeps working.
 */
public final class AdGate {

    private static final String TAG = "PROXMA_ROX";

    private AdGate() {}

    public static boolean shouldBlock(String method, Object arguments) {
        try {
            if (method == null) return false;
            switch (method) {
                case "loadBanner":
                case "showBanner":
                case "loadInterstitial":
                case "showInterstitial":
                    Log.i(TAG, "ADS blocked " + method);
                    return true;
                case "setParams":
                    String adType = adType(arguments);
                    if (adType.equals("banner") || adType.equals("interstitial")) {
                        Log.i(TAG, "ADS blocked setParams " + adType);
                        return true;
                    }
                    Log.i(TAG, "ADS allowed setParams " + adType);
                    return false;
                default:
                    return false;
            }
        } catch (Throwable t) {
            Log.w(TAG, "ADS_ERR " + t);
            return false;
        }
    }

    private static String adType(Object arguments) {
        if (!(arguments instanceof Map)) return "";
        Object adType = ((Map<?, ?>) arguments).get("adType");
        return adType instanceof String ? ((String) adType).toLowerCase(Locale.ROOT) : "";
    }
}
