package app.jagat.extension;

import android.content.Context;
import android.content.SharedPreferences;
import android.view.View;

public class AdBlocker {
    private static final String TAG = "JagatMorphe_AdBlocker";
    private static SharedPreferences prefs;

    public static void init(Context context) {
        if (prefs == null && context != null) {
            prefs = context.getApplicationContext().getSharedPreferences("jagat_morphe_prefs", Context.MODE_PRIVATE);
        }
    }

    public static boolean isAdsBlocked() {
        return prefs == null || prefs.getBoolean("block_ads", true);
    }

    public static boolean shouldShowAds() {
        return !isAdsBlocked();
    }

    public static int getAdViewVisibility() {
        return isAdsBlocked() ? View.GONE : View.VISIBLE;
    }

    public static void hideView(View view) {
        if (view != null && isAdsBlocked()) {
            view.setVisibility(View.GONE);
        }
    }
}
