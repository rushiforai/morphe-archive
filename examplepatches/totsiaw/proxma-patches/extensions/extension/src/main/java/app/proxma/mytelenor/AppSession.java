package app.proxma.mytelenor;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import java.lang.reflect.InvocationTargetException;

/**
 * Gives a background run in a cold process what opening the app gives it: the customer info the
 * app loads on its home screen fills NetworkHeader, and the app's own client reads its headers and
 * signature from there. With it empty the quiz API answers 412. The V2 session token is long-lived
 * and stored by the app, so it needs no refresh.
 */
final class AppSession {

    private static final String TAG = "PROXMA_MT";
    private static final String PREFS = "proxma_mytelenor";
    private static final String HEADER = "com.telenor.pakistan.mytelenor.BaseApp.NetworkHeader";

    // Setter on NetworkHeader, getter, and our cache key from StreakClaim.addHeaders.
    private static final String[][] HEADER_FIELDS = {
        {"n", "g", "nh_pp"},
        {"o", "h", "nh_seg"},
        {"p", "i", "nh_segt"},
        {"l", "e", "nh_pkgp"},
        {"m", "f", "nh_plt"},
        {"j", "b", "nh_cc"},
    };

    private AppSession() {}

    /** Fills only empty values, so a warm process keeps what the app loaded itself. */
    static void seedNetworkHeader(Context context) {
        try {
            SharedPreferences sp = context.getSharedPreferences(PREFS, 0);
            Class<?> headerClass = Class.forName(HEADER);
            Object header = headerClass.getMethod("c").invoke(null);
            int seeded = 0;
            for (String[] field : HEADER_FIELDS) {
                String current = (String) headerClass.getMethod(field[1]).invoke(header);
                String cached = sp.getString(field[2], "");
                if ((current == null || current.isEmpty()) && !cached.isEmpty()) {
                    headerClass.getMethod(field[0], String.class).invoke(header, cached);
                    seeded++;
                }
            }
            Log.i(TAG, "SESSION_HEADERS seeded=" + seeded);
        } catch (Throwable t) {
            Log.i(TAG, "SESSION_HEADERS_ERR " + t);
        }
    }

    /** The quiz API rejects requests without these, so a run must not mark the day without them. */
    static boolean headersReady() {
        try {
            Class<?> headerClass = Class.forName(HEADER);
            Object header = headerClass.getMethod("c").invoke(null);
            String segmentType = (String) headerClass.getMethod("i").invoke(header);
            return segmentType != null && !segmentType.isEmpty();
        } catch (Throwable t) {
            return false;
        }
    }

    /** The app's Retrofit service; its OkHttp client and interceptors add headers and signature. */
    static Object api() throws Exception {
        Class<?> appClass = Class.forName("com.telenor.pakistan.mytelenor.BaseApp.DaggerApplication");
        Object api = appClass.getMethod("h").invoke(appClass.getMethod("d").invoke(null));
        if (api == null) throw new IllegalStateException("no api");
        return api;
    }

    /** Runs a retrofit2.Call and returns its reply as JSON text; network errors stay IOExceptions. */
    static StreakClaim.HttpResult execute(Object call) throws Exception {
        try {
            Object resp = Class.forName("retrofit2.Call").getMethod("execute").invoke(call);
            Class<?> respClass = Class.forName("retrofit2.Response");
            int code = (Integer) respClass.getMethod("code").invoke(resp);
            Object parsed = respClass.getMethod("body").invoke(resp);
            String text;
            if (parsed != null) {
                Class<?> gson = Class.forName("com.google.gson.Gson");
                text = (String) gson.getMethod("toJson", Object.class).invoke(gson.newInstance(), parsed);
            } else {
                Object err = respClass.getMethod("errorBody").invoke(resp);
                text = err != null ? (String) err.getClass().getMethod("string").invoke(err) : "";
            }
            return new StreakClaim.HttpResult(code, text);
        } catch (InvocationTargetException e) {
            if (e.getCause() instanceof java.io.IOException) throw (java.io.IOException) e.getCause();
            throw e;
        }
    }
}
