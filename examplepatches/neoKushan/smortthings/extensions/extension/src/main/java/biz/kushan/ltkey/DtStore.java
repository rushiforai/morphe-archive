package biz.kushan.ltkey;

import android.content.Context;
import android.content.SharedPreferences;

/**
 * Our own private storage (never touches the app's data): recovered OwnerPSK credentials keyed by
 * OCF di — which, for OCF devices, equals the SmartThings cloud deviceId the Edit screen holds.
 * Keys are small strings; no secrets are logged.
 */
final class DtStore {
    private static final String PREFS = "dt_ltkey";
    private static final String CRED = "cred_";   // cred_<di> = "<identity>|<pskHex>"

    private static SharedPreferences prefs(Context c) {
        return c.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    static void putCred(Context c, String di, String identity, String pskHex) {
        try { prefs(c).edit().putString(CRED + di, identity + "|" + pskHex).apply(); }
        catch (Throwable t) { DtLog.w("putCred", t); }
    }

    /** @return {identity, pskHex} or null. */
    static String[] getCred(Context c, String di) {
        try {
            String v = prefs(c).getString(CRED + di, null);
            if (v == null) return null;
            int i = v.indexOf('|');
            if (i <= 0) return null;
            return new String[]{ v.substring(0, i), v.substring(i + 1) };
        } catch (Throwable t) { DtLog.w("getCred", t); return null; }
    }

}
