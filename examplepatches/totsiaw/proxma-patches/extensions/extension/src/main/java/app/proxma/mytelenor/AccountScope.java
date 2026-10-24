package app.proxma.mytelenor;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import java.security.MessageDigest;
import java.util.Map;

final class AccountScope {

    private static final String TAG = "PROXMA_MT";
    private static final String PREFS = "proxma_mytelenor";
    private static final String MSISDN_PREFIX = "proxma_msisdn_";

    private AccountScope() {}

    static String id(Context context) {
        if (context == null) return null;
        String msisdn = msisdn(context);
        if (msisdn == null || msisdn.isEmpty()) return null;
        return hash(msisdn);
    }

    static String msisdn(Context context) {
        if (context == null) return null;
        // Try the app's own SharedPreferences (package-name file)
        try {
            SharedPreferences prefs = context.getSharedPreferences(
                context.getPackageName(), 0);
            String msisdn = prefs.getString("msisdn", null);
            if (msisdn != null && !msisdn.isEmpty()) return msisdn;
            msisdn = prefs.getString("login_msisdn", null);
            if (msisdn != null && !msisdn.isEmpty()) return msisdn;
        } catch (Throwable t) {
            Log.i(TAG, "MSISDN_PREFS_ERR " + t.getClass().getSimpleName());
        }
        // Fallback: stored in our own prefs from a previous warm run
        return storedMsisdn(context);
    }

    static void saveMsisdn(Context context, String msisdn) {
        try {
            String account = hash(msisdn);
            SharedPreferences prefs = context.getSharedPreferences(PREFS, 0);
            SharedPreferences.Editor editor = prefs.edit();
            for (String key : prefs.getAll().keySet()) {
                if (key.startsWith(MSISDN_PREFIX) && !key.equals(MSISDN_PREFIX + account)) {
                    editor.remove(key);
                }
            }
            editor.putString(MSISDN_PREFIX + account, msisdn);
            editor.apply();
        } catch (Throwable t) {
            // best effort
        }
    }

    private static String storedMsisdn(Context context) {
        try {
            SharedPreferences prefs = context.getSharedPreferences(PREFS, 0);
            for (Map.Entry<String, ?> entry : prefs.getAll().entrySet()) {
                if (entry.getKey().startsWith(MSISDN_PREFIX) && entry.getValue() instanceof String) {
                    String val = (String) entry.getValue();
                    if (!val.isEmpty()) {
                        Log.i(TAG, "MSISDN_COLD_START using stored");
                        return val;
                    }
                }
            }
        } catch (Throwable t) {
            // prefs unavailable
        }
        return null;
    }

    private static String hash(String input) {
        try {
            byte[] digest = MessageDigest.getInstance("SHA-256")
                .digest(input.getBytes("UTF-8"));
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < 6; i++) {
                int b = digest[i] & 0xff;
                sb.append("0123456789abcdef".charAt((b >> 4) & 0xf));
                sb.append("0123456789abcdef".charAt(b & 0xf));
            }
            return sb.toString();
        } catch (Throwable t) {
            return null;
        }
    }
}
