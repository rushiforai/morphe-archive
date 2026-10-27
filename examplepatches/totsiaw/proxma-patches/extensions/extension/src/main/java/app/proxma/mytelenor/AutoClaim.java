package app.proxma.mytelenor;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;

final class AutoClaim {

    private static final String TAG = "PROXMA_MT";
    private static final String PREFS = "proxma_mytelenor";

    private static final int BIT_STREAK = 1;
    private static final int BIT_QUIZ   = 2;

    private AutoClaim() {}

    static String check(Context context, String feature) {
        String account = AccountScope.id(context);
        if (account == null) return "no-account";
        String day = today();
        String key = "proxma_claim_" + account + "_" + day;
        int bit = bitFor(feature);
        try {
            SharedPreferences prefs = context.getSharedPreferences(PREFS, 0);
            int current = prefs.getInt(key, 0);
            if ((current & bit) != 0) {
                return "latched " + feature + " " + day;
            }
        } catch (Throwable t) {
            // prefs unavailable, proceed
        }
        return null;
    }

    static void latch(Context context, String feature) {
        String account = AccountScope.id(context);
        if (account == null) return;
        String day = today();
        String key = "proxma_claim_" + account + "_" + day;
        int bit = bitFor(feature);
        try {
            SharedPreferences prefs = context.getSharedPreferences(PREFS, 0);
            int current = prefs.getInt(key, 0);
            prefs.edit().putInt(key, current | bit).apply();
            Log.i(TAG, "LATCH " + feature + " day=" + day + " bits=" + (current | bit));
        } catch (Throwable t) {
            Log.i(TAG, "LATCH_ERR " + t);
        }
    }

    private static int bitFor(String feature) {
        if ("streak".equals(feature)) return BIT_STREAK;
        if ("quiz".equals(feature)) return BIT_QUIZ;
        return 0;
    }

    static String today() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd", Locale.US);
        sdf.setTimeZone(TimeZone.getTimeZone("Asia/Karachi"));
        return sdf.format(new Date());
    }
}
